global function OnWeaponPrimaryAttack_weapon_shotgun

#if SERVER
global function OnWeaponNpcPrimaryAttack_weapon_shotgun
#endif // #if SERVER

var function OnWeaponPrimaryAttack_weapon_shotgun( entity weapon, WeaponPrimaryAttackParams attackParams )
{
	bool hasTwinSlugMod = weapon.HasMod( "twin_slug" )
	weapon.EmitWeaponNpcSound( LOUD_WEAPON_AI_SOUND_RADIUS_MP, 0.2 )

	ShotgunBlastLocal( weapon, attackParams.pos, attackParams.dir, 8, weapon.GetWeaponDamageFlags() )

	if ( hasTwinSlugMod )
		return 2
}

#if SERVER
var function OnWeaponNpcPrimaryAttack_weapon_shotgun( entity weapon, WeaponPrimaryAttackParams attackParams )
{
	bool hasTwinSlugMod = weapon.HasMod( "twin_slug" )
	weapon.EmitWeaponNpcSound( LOUD_WEAPON_AI_SOUND_RADIUS_MP, 0.2 )

	ShotgunBlast( weapon, attackParams.pos, attackParams.dir, 8, weapon.GetWeaponDamageFlags() )

	if ( hasTwinSlugMod )
		return 2
}
#endif // #if SERVER

void function ShotgunBlastLocal( entity weapon, vector pos, vector dir, int numBlasts, int damageType, float damageScaler = 1.0, float ornull maxAngle = null, float ornull maxDistance = null )
{
	Assert( numBlasts > 0 )
	int numBlastsOriginal = numBlasts
	entity owner = weapon.GetWeaponOwner()

	/*
	Debug ConVars:
		visible_ent_cone_debug_duration_client - Set to non-zero to see debug output
		visible_ent_cone_debug_duration_server - Set to non-zero to see debug output
		visible_ent_cone_debug_draw_radius - Size of trace endpoint debug draw
	*/

	if ( maxDistance == null )
		maxDistance	= weapon.GetMaxDamageFarDist()
	expect float( maxDistance )

	if ( maxAngle == null )
		maxAngle = owner.GetAttackSpreadAngle() * 0.5
	expect float( maxAngle )

	array<entity> ignoredEntities 	= [ owner ]
	int traceMask 					= TRACE_MASK_SHOT
	int visConeFlags				= VIS_CONE_ENTS_TEST_HITBOXES | VIS_CONE_ENTS_CHECK_SOLID_BODY_HIT | VIS_CONE_ENTS_APPOX_CLOSEST_HITBOX | VIS_CONE_RETURN_HIT_VORTEX

	entity antilagPlayer
	if ( owner.IsPlayer() )
	{
		if ( owner.IsPhaseShifted() )
			return;

		antilagPlayer = owner
	}

	//JFS - Bug 198500
	Assert( maxAngle > 0.0, "JFS returning out at this instance. We need to investigate when a valid mp_titanweapon_laser_lite weapon returns 0 spread")
	if ( maxAngle == 0.0 )
		return

	array<VisibleEntityInCone> results = FindVisibleEntitiesInCone( pos, dir, maxDistance, (maxAngle * 1.1), ignoredEntities, traceMask, visConeFlags, antilagPlayer, weapon )
	foreach ( result in results )
	{
		float angleToHitbox = 0.0
		if ( !result.solidBodyHit )
			angleToHitbox = DegreesToTarget( pos, dir, result.approxClosestHitboxPos )

		numBlasts -= ShotgunBlastDamageEntity( weapon, pos, dir, result, angleToHitbox, maxAngle, numBlasts, damageType, damageScaler )
		if ( numBlasts <= 0 )
			break
	}

	//Something in the TakeDamage above is triggering the weapon owner to become invalid.
	owner = weapon.GetWeaponOwner()
	if ( !IsValid( owner ) )
		return

	// maxTracer limit set in /r1dev/src/game/client/c_player.h
	const int MAX_TRACERS = 16
	bool didHitAnything = ((numBlastsOriginal - numBlasts) != 0)
	bool doTraceBrushOnly = (!didHitAnything)
	if ( numBlasts > 0 )
		weapon.FireWeaponBullet_Special( pos, dir, minint( numBlasts, MAX_TRACERS ), damageType, false, false, true, false, false, false, doTraceBrushOnly )
}

const SHOTGUN_ANGLE_MIN_FRACTION = 0.1;
const SHOTGUN_ANGLE_MAX_FRACTION = 1.0;
const SHOTGUN_DAMAGE_SCALE_AT_MIN_ANGLE = 0.8;
const SHOTGUN_DAMAGE_SCALE_AT_MAX_ANGLE = 0.1;

int function ShotgunBlastDamageEntity( entity weapon, vector barrelPos, vector barrelVec, VisibleEntityInCone result, float angle, float maxAngle, int numPellets, int damageType, float damageScaler )
{
	entity target = result.ent

	//The damage scaler is currently only > 1 for the Titan Shotgun alt fire.
	if ( !target.IsTitan() && damageScaler > 1 )
		damageScaler = max( damageScaler * 0.4, 1.5 )

	entity owner = weapon.GetWeaponOwner()
	// Ent in cone not valid
	if ( !IsValid( target ) || !IsValid( owner ) )
		return 0

	// Fire fake bullet towards entity for visual purposes only
	vector hitLocation = result.visiblePosition
	vector vecToEnt = ( hitLocation - barrelPos )
	vecToEnt.Norm()
	if ( Length( vecToEnt ) == 0 )
		vecToEnt = barrelVec

	// This fires a fake bullet that doesn't do any damage. Currently it triggeres a damage callback with 0 damage which is bad.
	weapon.FireWeaponBullet_Special( barrelPos, vecToEnt, 1, damageType, true, true, true, false, false, false, false ) // fires perfect bullet with no antilag and no spread

#if SERVER
	// Determine how much damage to do based on distance
	float distanceToTarget = Distance( barrelPos, hitLocation )

	int extraMods = result.extraMods
	float damageAmount = CalcWeaponDamage( owner, target, weapon, distanceToTarget, extraMods )
	//print("[SHOTGUN] damagebeforeprocess: " + damageAmount)


	if ( result.solidBodyHit )
	{
		damageAmount = damageAmount * 1.2
	}
	else if (angle < 1)
	{
		damageAmount = damageAmount + (damageAmount * 0.2 * (1 - angle))
	}
	else
	{
		damageAmount = max(damageAmount - (angle * angle * angle), 2)
	}

	//print("[SHOTGUN] solidhit: " + result.solidBodyHit + "  angle: " + angle)
	//print("[SHOTGUN] damageafterprocess: " + damageAmount)


	// vortex needs to scale damage based on number of rounds absorbed
	string className = weapon.GetWeaponClassName()
	if ( (className == "mp_titanweapon_vortex_shield") || (className == "mp_titanweapon_vortex_shield_ion") || (className == "mp_titanweapon_heat_shield") )
	{
		damageAmount *= numPellets
		//printt( "scaling vortex hitscan output damage by", numPellets, "pellets for", weaponNearDamageTitan, "damage vs titans" )
	}

	float coneScaler = 1.0
	//if ( angle > 0 )
	//	coneScaler = GraphCapped( angle, (maxAngle * SHOTGUN_ANGLE_MIN_FRACTION), (maxAngle * SHOTGUN_ANGLE_MAX_FRACTION), SHOTGUN_DAMAGE_SCALE_AT_MIN_ANGLE, SHOTGUN_DAMAGE_SCALE_AT_MAX_ANGLE )

	// Calculate the final damage abount to inflict on the target. Also scale it by damageScaler which may have been passed in by script ( used by alt fire mode on titan shotgun to fire multiple shells )
	float finalDamageAmount = damageAmount * coneScaler * damageScaler
	//printt( "angle:", angle, "- coneScaler:", coneScaler, "- damageAmount:", damageAmount, "- damageScaler:", damageScaler, "  = finalDamageAmount:", finalDamageAmount )

	//print("[SHOTGUN] finaldamage: " + finalDamageAmount)

	// Calculate impulse force to apply based on damage
	int maxImpulseForce = expect int( weapon.GetWeaponInfoFileKeyField( "impulse_force" ) )
	float impulseForce = float( maxImpulseForce ) * coneScaler * damageScaler
	vector impulseVec = barrelVec * impulseForce

	int damageSourceID = weapon.GetDamageSourceID()

	//
	float critScale = weapon.GetWeaponSettingFloat( eWeaponVar.critical_hit_damage_scale )
	target.TakeDamage( finalDamageAmount, owner, weapon, { origin = hitLocation, force = impulseVec, scriptType = damageType, damageSourceId = damageSourceID, weapon = weapon, hitbox = result.visibleHitbox, criticalHitScale = critScale } )

	//printt( "-----------" )
	//printt( "    distanceToTarget:", distanceToTarget )
	//printt( "    damageAmount:", damageAmount )
	//printt( "    coneScaler:", coneScaler )
	//printt( "    impulseForce:", impulseForce )
	//printt( "    impulseVec:", impulseVec.x + ", " + impulseVec.y + ", " + impulseVec.z )
	//printt( "        finalDamageAmount:", finalDamageAmount )
	//PrintTable( result )
#endif // #if SERVER

	return 1
}
