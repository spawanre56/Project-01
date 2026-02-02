/*
    Project 01
    
    Requirements (for 15 base points)
    - Create an interactive fiction story with at least 8 knots 
    - Create at least one major choice that the player can make
    - Reflect that choice back to the player
    - Include at least one loop
    
    To get a full 20 points, expand upon the game in the following ways
    [+2] Include more than eight passages
    [+1] Allow the player to pick up items and change the state of the game if certain items are in the inventory. Acknowledge if a player does or does not have a certain item
    [+1] Give the player statistics, and allow them to upgrade once or twice. Gate certain options based on statistics (high or low. Maybe a weak person can only do things a strong person can't, and vice versa)
    [+1] Keep track of visited passages and only display the description when visiting for the first time (or requested)
    
    Make sure to list the items you changed for points in the Readme.md. I cannot guess your intentions!

*/
VAR smart = 0
VAR luck = 0
VAR strength = 0
VAR pet_name = ""
VAR coin = 0
VAR money = 0
VAR time = -1 // 0 Morning, 1 Noon, 2 Night

 -> Beginning
 
 
 == Beginning == 
Before we begin, tell me something. What would you consider yourself?

*[Strong] -> Strength
*[Lucky] -> Luck
*[Smart] -> Intelligence

== Strength ==
~ strength = strength + 1
You consider yourself to be strong.
-> memory

== Luck ==
~ luck = luck + 1
You consider yourself lucky
 -> memory
 
 == Intelligence ==
 ~ smart = smart + 1
 You consider yourself smart.
 -> memory
 
== memory == 
You are about to get on a boat that will take you to god knows where. Its daunting, and honestly? You wish you had brought you friend with you. His name is...

* [Chris] 
    ~ pet_name = "Chris"
    -> Chris
* [Evan]
    ~ pet_name = "Evan"
     -> Evan
* [AJ]
    ~ pet_name = "AJ"
     -> AJ

== Chris ==
While on the boat, you think about your friend Chris. He was a silly guy, but he was always there when you needed him. Through the dark time all the way to the light ones, he's like a brother to you and as good as a friend can get. Why didn't you tell him about this?
*[You arrive at the island] -> Bar_Entrance

== Evan == 
While on the boat, you think about your friend Evan. You had known him practically your whole life, he's like a brother to you. Hell, you'd known him just about as long as your own brother. He probably would have enjoyed this too. You should have told him about this.
 *[You arrive at the island] -> Bar_Entrance
 
 == AJ ==
 While on the Boat, you think of your friend AJ. AJ was a strange fellow, not talking very much, but you knew you could rely on him for anything. Ask and he'd be there. Plus, you've known him forever, and you knew that he could have used an adventure. You probably should have told him about this.
 *[You arrive at the island] -> Bar_Entrance

== Bar_Entrance ==
You find yourself at the entrance to a bar, near the port of a town on a man made island made of wood, bamboo, and other materials making up the stilts and buildings here.

It is { advance_time() }

If only {pet_name} were there with you. He would have made you feel less nervous.

{not Coin_Pickup: You see a coin on the ground.}

+ [Open the door and walk into the bar] -> inside_The_Bar
+ [You turn around and walk away] -> Leave_Island
* [You pick up the coin] -> Coin_Pickup
+ [Wait] -> Bar_Entrance

== Leave_Island ==
You find yourself at the port of the rickety island, looking at an outgoing boat
* [Take the boat] -> Take_The_Boat
+ [Go back] -> Bar_Entrance

== inside_The_Bar ==
You see several men sitting at a table, playing what seems to be a gambling game. You Can sit down and join them. {not At_The_Table: Or you can leave.} If you leave they will not let you back at the table.

It is { advance_time() }

{ pet_name == "AJ": Strangely, you feel like you saw AJ somewhere in here. You pay no mind to thought. Although it would make some sense if he was, as AJ always had a way of showing up in strange places| }

+ [Leave] -> Bar_Entrance
* [Sit down at the Table] -> At_The_Table
 * { time == 1 } [Grab a beer at the bar] -> grab_a_beer
+ [Go over to a man at a barrel] ->
-> END

== Barrel_Man ==
~ strength = strength + 1
You walk over to the man at the barrel in the corner, and swing you arm down on the barrel, engaging in arm wrestling. Its a hard fought battle, but you win! the man sulks off in shame, and you feel so proud because your gym gains were finally showing.
-> Bar_Entrance

=== At_The_Table ===
You sit down at the table
* {inside_The_Bar} [Stand Up] -> inside_The_Bar
+ [Look to your left] -> Look_To_Left
+ [Look to your Right] -> Look_To_Right
* [sit and look hard at your cards] -> Card_look
* {coin > 0} [Pull out your coin] -> Table_Stares
* {smart > 1} [you look around] -> Smart_look_around

== Card_look ==
~ smart = smart + 1
You look really hard at your cards, trying to hold a good poker face. This'll make you look smarter, right?
-> At_The_Table

=== Look_To_Right ===
~ money = money + 3
You see a kind man with an eyepatch that has the four suits of a card deck embroidered onto it. He smiles at you and asks if you could take over for him as he was just about to leave. You do, and he leaves you with several chips worth thousands of dollars, and a winning hand. That night you go on to win every round and bankrupt several unruly figures. You walk away from that night richer than any man has ever been.

you now have ${money},141,592,653,589,793,238,462,643,383,279,502,884,197.69
-> END

=== Look_To_Left
You look to your left and see a man constantly flipping a coin. He doesn't like the way you look at him so he kills you with is coin.
-> END

=== Take_The_Boat ===
You took the boat and left the island behind
-> Took_The_Boat

=== Table_Stares ===
You pull out the coin you picked up earlier, and everyone turns and looks at you, or rather the coin. Light is bouncing off of it from all directions, and it almost looks like its glowing. This is definately your "Lucky Coin".
-> At_The_Table

=== Coin_Pickup ===
~ coin = coin + 1
~ luck = luck + 1
You crouch down and pick up the coin. Maybe it'll be lucky.
+ [Stand Up] -> Bar_Entrance

== Smart_look_around ==
You look around at the interiror of this strange place. To your left you see an unruly menacing looking man. He glances at you and you quickly look away. To your right, you see an old man with an eyepatch. He looks like he could rob you blind if you play your cards wrong.
Looking around at the actual rest of the building, you spot a sort of trap door near the back end of the Tavern, kinda obscured by some crates.
-> check_out_the_trapdoor

== check_out_the_trapdoor ==
You decide to go look at the trapdoor. You walk over behind the crates, and crouch down to examine the door.
+ [Open the door] -> go_trapdoor
+ [Go Back] -> At_The_Table

== go_trapdoor ==
You go to open the trap door and it opens with ease. Suprising, considering that it feels like a secret someone would have to find.
    Theres a ladder that goes down a long long pipe, probably beneath the surface of the water. You already opened this door, so might as well go down. 
You slowly make your way down the ladder for what seems like hours. You pass steam vents, and what looks like high tech machinery leading down. Finally you make it to the bottom of the ladder, which opens up to a small room witha a blast door.
You walk up to the door, which opens with a hissing noise to a corridor that looks like it was straight out of the Star Wars Death Star. You walk forward a little, and pass by a several crates, some ajar panels in the wall, and some random equipment lying about. When you near the end of the hall, you hear a whirring. A ceiling mounted turret has lowered and locked on to you.
* {coin > 0} [Wuh oh!] -> Got_Lucky
* [Oh Fu-] -> Loser
* {smart > 2} [YIKES!!!] -> reflexes
* {strength > 0} [AAAAAHHHHH!!!] -> strength_why

== strength_why ==
You notice the aming reticle on your chest, and reflexively raise your arms to defend yourself. It was a stupid move, but strangley, as the bullets begin to fly, several hit your arms but seemingly bounce off. Huh, guess they were rubber bullets.

Strange.

You survived though and thats what matters.

* [Continue on] -> Discovery

== reflexes ==
Before the turret begins to shoot, you launch yourself to the keft wall of the hallway, and then begin running. The turret begins shooting, but you are running in a zig zag path so it  has a hard time catching up to you. You make it past the turret, and then round a corner. 
Whew!! Guess not drinking saved your life for ONCE!
* [Continue on] -> Discovery

== Loser ==
You aren't quick enough, and before you can even look around for options the turret begins to fire, and your short journey has come to its untimely end.
-> END

== Got_Lucky ==
You notice the red dot trained square on your chest, but before you can do anything the gun begins to shot rapid fire bullet spray. you scramble away, and manage to get behind a crate, which thankfully is made of metal. 
You take the coin out of your pocket, and in a desperate attempt to do something, you throw it towards the turret. You hear the gunfire stop, and look around the corner of the crate. There glinting in the light, is... wait theres no way... is that? HOLY SHIT YOU HIT THAT SHOT!!! DID ANYONE SEE THAT???!!!
* [Continue on] -> Discovery

=== Discovery ===
You continue on through the maze of corridors, getting lost occasionally, but always finding your way back on track. you reach several rooms that feel super high tech but you are not sure what they do or why they are here.
Finally, you reach the last room, and once again, there is a blast door. This one requires facial scanm. You try the scan, and crazy enough, it actually works.
The door opens with a series of heavy clunks, and as it does you look through and see a giant hanger. Insdie the hanger, there lies a massive, White and gold mech, aproximately ths size of a high-rise apartment in new york. On the arm is emblazend the name: SunShine.

You don't realize it, but this is a massive secret, and by you discovering it, you have began an even that you could never have dreamed of happening.

But thats for next time. As of right now, I think you've had enough adventure for one day.
-> END

== lay_down_on_bed ==
You lay down on the bed, and fall asleep.
+ [You begin  to dream that...] -> Bar_Entrance

== Call_Friend == 
You call your friend {pet_name} and tell them about where you had gone.
* [You tell them that...] -> Bar_Entrance

== grab_a_beer ==
You order an ice cold beer from the bartender, and he obliges. He polishes off a fresh glass, fills it to the brim with a beverage you've never heard of, and hands it to you.
*[Drink the beer] -> Drank_the_beer
*[Dont drink the beer] -> Didnt_drink_the_beer

== Drank_the_beer ==
~ smart = smart - 1
You chugged the beer, and boy oh boy did it taste like shit. Hey, at least it got a good buzz going, right?
-> inside_The_Bar

== Didnt_drink_the_beer ==
~ smart = smart + 1
You look at the beer, and decide that at least for tonight, you'd like to keep your wits about you.
-> inside_The_Bar

=== Took_The_Boat ===
You took the boat away from the island, and its along journey but you finally make it back. As you arrive back at your apartment, you look around at the familar sight of your TV, your small kitchen, and your bed in the corner, and begin to feel a sense that you had missed out on something incredible.
+ [Lay down on the bed] -> lay_down_on_bed
+ [Call your friend] -> Call_Friend
-> END

== function advance_time ==

    ~ time = time + 1

    {
        - time > 2:
            ~ time = 0
    }
    
    {
        - time == 0:
            ~ return "Morning"
        
        - time == 1:
            ~ return "Noon"
        
        - time == 2:
            ~ return "Evening"
    
    }
    
    
        
    ~ return time
    
    