#define BRUTE       "brute"
#define BURN        "fire"
#define TOX         "tox"
#define OXY         "oxy"
#define CLONE       "clone"
#define PAIN        "pain"
#define ELECTROCUTE "electrocute"

#define CUT       "cut"
#define BRUISE    "bruise"
#define PIERCE    "pierce"
#define LASER     "laser"
#define SHATTER   "shatter"

#define STUN      "stun"
#define WEAKEN    "weaken"
#define PARALYZE  "paralize"
#define IRRADIATE "irradiate"
#define SLUR      "slur"
#define STUTTER   "stutter"
#define EYE_BLUR  "eye_blur"
#define DROWSY    "drowsy"

// Damage flags
#define DAM_SHARP     1
#define DAM_EDGE      2
#define DAM_LASER     4
#define DAM_BULLET    8
#define DAM_EXPLODE   16
#define DAM_DISPERSED 32 // Makes apply_damage calls without specified zone distribute damage rather than randomly choose organ (for humans)
#define DAM_BIO       64 // Toxin damage that should be mitigated by biological (i.e. sterile) armor

#define FIRE_DAMAGE_MODIFIER 0.0215 // Higher values result in more external fire damage to the skin. (default 0.0215)
#define  AIR_DAMAGE_MODIFIER 2.025  // More means less damage from hot air scalding lungs, less = more damage. (default 2.025)

// Organ defines.
#define ORGAN_CUT_AWAY   BITFLAG(0)  // The organ is in the process of being surgically removed.
#define ORGAN_BLEEDING   BITFLAG(1)  // The organ is currently bleeding.
#define ORGAN_BROKEN     BITFLAG(2)  // The organ is broken.
#define ORGAN_DEAD       BITFLAG(3)  // The organ is necrotic.
#define ORGAN_MUTATED    BITFLAG(4)  // The organ is unusable due to genetic damage.
#define ORGAN_ARTERY_CUT BITFLAG(6)  // The organ has had its artery cut.
#define ORGAN_TENDON_CUT BITFLAG(7)  // The organ has had its tendon cut.
#define ORGAN_DISFIGURED BITFLAG(8)  // The organ is scarred/disfigured. Alters whether or not the face can be recognised.
#define ORGAN_SABOTAGED  BITFLAG(9)  // The organ will explode if exposed to EMP, if prosthetic.
#define ORGAN_ASSISTED   BITFLAG(10) // The organ is partially prosthetic. No mechanical effect.
#define ORGAN_PROSTHETIC BITFLAG(11) // The organ is prosthetic. Changes numerous behaviors, search BP_IS_PROSTHETIC for checks.
#define ORGAN_BRITTLE    BITFLAG(12) // The organ takes additional blunt damage. If robotic, cannot be repaired through normal means.
#define ORGAN_CRYSTAL    BITFLAG(13) // The organ does not suffer laser damage, but shatters on droplimb.
#define ORGAN_DISLOCATED BITFLAG(14)

// Organ flag defines.
#define ORGAN_FLAG_CAN_AMPUTATE   BITFLAG(0) // The organ can be amputated.
#define ORGAN_FLAG_CAN_BREAK      BITFLAG(1) // The organ can be broken.
#define ORGAN_FLAG_CAN_STAND      BITFLAG(2) // The organ contributes to standing.
#define ORGAN_FLAG_HAS_TENDON     BITFLAG(3) // The organ can have its tendon cut.
#define ORGAN_FLAG_FINGERPRINT    BITFLAG(4) // The organ has a fingerprint.
#define ORGAN_FLAG_HEALS_OVERKILL BITFLAG(5) // The organ heals from overkill damage.
#define ORGAN_FLAG_DEFORMED       BITFLAG(6) // The organ is permanently disfigured.
#define ORGAN_FLAG_CAN_DISLOCATE  BITFLAG(7) // The organ can be dislocated.
#define ORGAN_FLAG_SKELETAL       BITFLAG(8) // The organ has been skeletonized.

// Droplimb types.
#define DISMEMBER_METHOD_EDGE  0
#define DISMEMBER_METHOD_BLUNT 1
#define DISMEMBER_METHOD_BURN  2
#define DISMEMBER_METHOD_ACID  3

// Robotics hatch_state defines.
#define HATCH_CLOSED 0
#define HATCH_UNSCREWED 1
#define HATCH_OPENED 2

// These control the amount of blood lost from burns. The loss is calculated so
// that dealing just enough burn damage to kill the player will cause the given
// proportion of their max blood volume to be lost
// (e.g. 0.6 == 60% lost if 200 burn damage is taken).
#define FLUIDLOSS_WIDE_BURN 0.6 //for burns from heat applied over a wider area, like from fire
#define FLUIDLOSS_CONC_BURN 0.4 //for concentrated burns, like from lasers

// Damage above this value must be repaired with surgery.
#define ROBOLIMB_SELF_REPAIR_CAP 30

//Germs and infections.
#define GERM_LEVEL_AMBIENT  275 // Maximum germ level you can reach by standing still.
#define GERM_LEVEL_MOVE_CAP 300 // Maximum germ level you can reach by running around.

#define INFECTION_LEVEL_ONE   250
#define INFECTION_LEVEL_TWO   500  // infections grow from ambient to two in ~5 minutes
#define INFECTION_LEVEL_THREE 1000 // infections grow from two to three in ~10 minutes

//Blood levels. These are percentages based on the species blood_volume far.
#define BLOOD_VOLUME_SAFE    85
#define BLOOD_VOLUME_OKAY    70
#define BLOOD_VOLUME_BAD     60
#define BLOOD_VOLUME_SURVIVE 30

// enum-ish values for surgery conditions
#define OPERATE_DENY     0
#define OPERATE_PASSABLE 1
#define OPERATE_OKAY     2
#define OPERATE_IDEAL    3

#define MODULAR_BODYPART_INVALID    0 // Cannot be detached or reattached.
#define MODULAR_BODYPART_PROSTHETIC 1 // Can be detached or reattached freely.
#define MODULAR_BODYPART_CYBERNETIC 2 // Can be detached or reattached to compatible parent organs.

