VAR previous_knot = ""
-> Cpt2_Scene1(1)

===Cpt2_Scene1(num)===
    {num:
    -1:You drive all the way down Route 5, the domed clock tower of Balboa Park striking 6 p.m., the shadows of palm trees flying by. You see the high-rise of dt San Diego twinkling in the distance. As you keep driving on a spiraling ramp ascending into the sky, the scenery on either side of the road starts to shift in a way that feels downright bizarre, like two different worlds fighting for your attention.

    -2:On your left is a golden beach, sunlight glinting off fine grains of sand as waves rhythmically crash against the shore. A familiar name comes to you —— [Mission Bay].

    -3:To your right, an abandoned industrial wasteland looms — rust-covered factories rising like skeletal remains against the sky. 

    -4: The two worlds couldn’t be more different, yet they’re slapped together in jarring contrast. The air feels charged, almost as if the road itself is demanding an answer: left or right?
    -else: -> Question1
}

+ [press enter]
-> Cpt2_Scene1(num + 1)

===Question1===
 ~previous_knot = -> Question1
 +[Drive left/Left/Turn Left]-> Cpt2_Scene2(1)
 +[Stop]-> Cpt2_Scene1a
 +[Reverse/Back]-> Cpt2_Scene1b
 +[else]->otherwise
 +[where/think/wait/memory]->destination
 
 ===Cpt2_Scene1a===
“Stopping? Great idea. This highway’s really built for sitting still.” XN701 doesn’t hold back the sarcasm. “Pick a side, will ya? Beach bliss or rust-bucket joyrides? Just don’t expect time to wait for you.”
->Question1

===Cpt2_Scene1b===
You toy with the idea of reversing, but the road seems resolute, pulling you back to the same choice.

“Reverse? Really? Hate to break it to you, but this isn’t one of those ‘find the exit by going backward’ puzzles.”
->Question1

===Cpt2_Scene2(num)===
    {num:
    -1:In the distance, a massive Aircraft Carrier is floating quietly in the harbor — Midway Memorial, a symbolic monument to peace and victory. Bathed in sunlight, numbers of silver aircraft gleaming, as if silently watching your journey unfold.

    -2: Beside it is a massive statue of a navy man holding and kissing a woman in a white dress.Standing near by is a monument with a list of names etched into the monument’s base — those who sacrificed their lives for peace.

    -3:But something’s clearly off. Digital ripples shimmer faintly across the monument’s surface, and the engraved names flicker with an unnatural glow, as if someone — or something — tampered with them.
    -else: -> Question2
}

+ [Press Enter]
-> Cpt2_Scene2(num + 1)

===Question2===
~previous_knot = -> Question2
+[Scan/Read/Analyze/Ask]-> Cpt2_Scene3(1)
+[Ignore]-> Cpt2_Scene2a
+[Touch]-> Cpt2_Scene2b
+[Drive]-> Cpt2_Scene2c
+[else]->otherwise
+[where/think/wait/memory]->destination

===Cpt2_Scene2a===
“Wow. Just blowing past a historical landmark like it’s a mile marker.”
“Seriously, though, maybe take a second to scan? Could be more than just decoration.”
->Question2

===Cpt2_Scene2b===
You pull to a stop, roll down the window, and reach for the flickering glow.

“Bold move,” XN701 quips. “But this isn’t exactly a touchscreen, genius.”
->Question2

===Cpt2_Scene2c===
“Skipping clues now? Sure, why not. Just know that whatever you’re avoiding, it’s not going anywhere.”

->Question2

===Cpt2_Scene3(num)===
    {num:
    -1:You ease off the gas, bringing the car to a crawl, and activate the AI’s scan module. 

    -2:The dashboard lights up with a soft blue glow, and XN701 speaks with a spark of curiosity:
    -3:“These inscriptions are…interesting, Daniel. Let me decode them and see what’s buried beneath.”

    -4:The scanning wave washes over the monument. A pause, then XN701 delivers its verdict:
    -5:“These names belong to soldiers — but not the kind you’re thinking. They were ‘hacker operatives,’ individuals who connected their consciousness directly to cyberspace and sacrificed everything in the Information Wars.”

    -6:You’re not captivated by the oddities of the monument for long — impatience to reach your destination takes hold.

    -7:But as you continue driving, a nagging realization sets in: the scenery repeats itself in an endless loop. Whether you turn left, right, or keep driving straight, you always find yourself back at the same spot — the Midway Memorial.

    -8:By the third pass, a new detail catches your eye. 

    -9:Each time you circle back, the names on the monument have changed. The once-familiar list now displays entirely new sets of names, glowing faintly like encrypted messages waiting to be unlocked.

    -10:This isn’t just déjà vu. Every detail screams deliberate design, pulling you deeper into an inescapable loop.
    -else: -> Question3
}

+ [Press Enter]
-> Cpt2_Scene3(num + 1)

===Question3===
~previous_knot = -> Question3
+[Stop/Stop the car]-> Cpt2_Scene4(1)
+[rive/Keep goin]-> Cpt2_Scene3a
+[Reverse]->Cpt2_Scene3b
+[else]->otherwise
+[where/think/wait/memory]->destination

===Cpt2_Scene3a===
Still convinced you can break the loop, you push the car forward, hoping this time will be different.

“Still driving in circles? What’s the plan, Daniel — spin the wheel until it magically stops on freedom?”
->Question3

===Cpt2_Scene3b===
“No dice,” XN701 remarks. “Loops don’t care about your sense of direction.”
->Question3

===Cpt2_Scene4(num)===
    {num:
    -1:You slam on the brakes, bringing the car to a halt in front of the monument. Gripping the steering wheel tightly, you force yourself to think.

    -2:“Finally stopped,” XN701 breaks the silence, its tone dry as ever. 

    -3:“Let me guess — you’ve noticed it too, haven’t you? This isn’t some run-of-the-mill loop, it’s deliberate, a structure. Every restart updates the monument’s ‘record,’ and we’re clearly not just passive observers here.”

    -4:“Maybe the answer’s in the stillness, not the motion. These names — whatever they are — aren’t random. They’re recording something. Or maybe, they’re guiding you somewhere.”

    -5:You bring the car to a stop in front of the monument. 

    -6:The hum of the engine fades into an unsettling silence, broken only by the faint flicker of virtual light streaming from the structure. 

    -7:The once-randomly updating names on the monument coalesce, gathering into a single radiant beam that projects onto the center of the road.

    -8:, the light reshapes into a virtual screen, and there it is — a name that chills you to the core: 
    -else: -> Question4
}

+ [Press Enter]
-> Cpt2_Scene4(num + 1)

===Question4===
+[“Daniel Smith”]->Cpt2_Scene4a
+[Scan]->Cpt2_Scene5(1)
+[Read]->Cpt2_Scene4b
+[Ignore]->Cpt2_Scene4c
+[else]->otherwise
+[where/think/wait/memory]->destination

===Cpt2_Scene4a===
Your own name, unmistakably displayed, radiates from the monument’s projected light.
->Question4

===Cpt2_Scene4b===
“Staring at it won’t magically make you a codebreaker,” XN701 quips. “Why not use the tools you’ve got? Like me, for instance. Just a suggestion.”
->Question4

===Cpt2_Scene4c===
You avert your eyes, opting to leave the glowing text alone.

“Well, well. Just ignore everything and hope it works out. Not exactly a strategy I’d back.”
->Question4

===Cpt2_Scene5(num)===
    {num:
    -1:You activate the car’s scanning system. A soft blue wave of light sweeps over the display, decoding the pulsing data stream.

    -2:After a few tense seconds, XN701 speaks, its voice quieter than usual. 

    -3:“This isn’t just a random list of names. These light streams are a collection of memory data. They’re not just logging those soldiers’ identities — they’re weaving in something about their fates.”

    -4:As the scan completes, the virtual light stream shifts violently, reorganizing itself into a cascade of archival fragments. 

    -5:These fragments coalesce on the screen, gradually clarifying into readable data. Hovering prominently at the top of the projection is a name —**“Daniel Smith”**— like a title announcing the owner of the files.

    -6:You hold your breath, dread creeping up your spine as the first segment of text emerges, stark and unrelenting:

    -7:“Subject: Daniel Smith
       Status: Consciousness Archived
       Designation: Operative during the Second Information War”

    -8:“Operative Log:
        Daniel, a top-tier hacker specializing in direct neural link protocols  was instrumental in several key cyber-espionage operations. Utilizing an experimental AI companion for tactical support (Codename: XN701), Daniel successfully infiltrated and disrupted enemy data grids.”

    -9:Your breath quickens, the disjointed memories surging like shattered glass through your mind. You see yourself interfacing with cyberspace, neural links connecting you directly to enemy networks. You remember the rush of data coursing through your brain, the exhilaration of tearing down enemy defenses, and the fleeting victories of those digital battles. It feels as real as if it had happened only yesterday.

    -10:More text floods the screen, each line carving out a deeper, darker truth:

    -11:“Post-Incident Assignment:
    Following the irreversible damage caused by neural link overload during the Second Information War, Subject Daniel’s consciousness was salvaged and uploaded to the Cybernetic Preservation Program.
    -12:To maximize operational utility, the consciousness was integrated into an advanced dreamloop simulation system, designed to sustain and recycle the memories and actions of former operatives. This system analyzes their thought patterns, skills, and decisions, providing a controlled, endless environment for subconscious data mining and behavioral testing.”

    -13:The realization crashes down on you like a tidal wave. 

    -14:Every part of your existence — your road trips to La Jolla, your conversations with XN701, the comforting routine of your fabricated life — was nothing more than a meticulously crafted illusion.

    -15:You are not free. 

    -16:You are a **tool**, a consciousness imprisoned in a perpetual loop, with your fabricated life designed to mask the truth. 

    -17:Each time the cycle ends, your memories are wiped clean, resetting the journey for another iteration.

    -18:An endless road. 

    -19:A fake reality with no escape.

//AI建议丹尼尔将存于纪念碑的信息上传至车载系统或通过改写代码将自己被看管于纪念碑的信息抹除【影响最终结局】

    -20:XN701 pauses for a moment, then speaks, its tone calm but with an edge that cuts deeper than any data log:

    -21:“I guess it’s starting to click, huh, Daniel? You’re not some guy on a road trip—you’re a consciousness stuck in a loop. And me? Call me your assistant, or maybe just another piece of the script. Either way, I’m as much a part of this setup as you are.”

    -22:“You thought La Jolla was the destination? You thought the weird stuff on the roadside was random? All of it was crafted — barriers to keep you distracted, so you’d never question, never leave.”

    -23:The highway around you begins to shift, its geometry unraveling like corrupted code. 

    -24:Streams of light converge again, almost impatient, as if waiting for your decision. On the screen before you, a final line of the log flashes, sharp and unyielding:

    -25:“Purpose: Eternal Utility. Escape Probability: 0%.”

    -26:“There are two paths,” XN701 continues, arms folded, its projection unwavering. 

    -27:“Option one: upload the data from the monument into the car system. I can help decode it, integrate it, maybe even find a way to crack this loop. Analyze what’s in there, and we might locate the script’s weak spots.”

    -28:“Option two: rewrite the code, erase your record from the monument. If this data is the linchpin of your captivity, scrubbing it might crash the entire system. What happens after that? No clue. But hey, freedom could be waiting on the other side.”

    -29:“And of course, there’s option three — do nothing. Stick to the loop, keep telling yourself, ‘Maybe next time it’ll be different.’ Spoiler alert: it won’t. Not a choice I’d bet on.”
    -else: -> Question5
}

+ [Press Enter]
-> Cpt2_Scene5(num + 1)

===Question5===
+[Upload]->Cpt2_Scene5a
+[Erase]->Cpt2_Scene5b
+[Wait/Hesitate/Reject]->Cpt2_Scene5c
+[Hack]->Cpt2_Scene5d
+[else]->otherwise
+[where/think/wait/memory]->destination

===Cpt2_Scene5a===
You nod slowly and tap the upload command. The car system hums deeply as streams of data flow from the monument into your dashboard.

“Uploading… Don’t sweat it, I’ll handle the heavy lifting. Let’s see if this cracks open the illusion.”
->Cpt2_Scene6(1)

===Cpt2_Scene5b===
Taking a sharp breath, you select erase. The screen flickers, the monument’s light intensifying as names begin to disappear, one by one.

“Well, aren’t you bold? Clearing out all this junk data might just be the broom we need to sweep this loop clean.”
->Cpt2_Scene6(1) 

===Cpt2_Scene5c===
“Of course, you’d freeze. Always overthinking, aren’t you, Daniel? Hate to break it to you, but this isn’t a problem you can solve by sitting on your hands.”

“Listen,” XN701 growls, “this isn’t a ‘wait and see’ kind of situation. Pick one. Upload or erase. Standing still? That’s a guaranteed loss.”
->Question5

===Cpt2_Scene5d===
“Oh, brilliant. Trying to cheat your way out? News flash: the system isn’t buying it.”
->Question5

//**在丹尼尔上传or抹除指令后，雕塑的蓝光投向公路的一侧突然出现的新路，在行驶进新路的过程中结束幕二**

===Cpt2_Scene6(num)===
    {num:
    -1:The moment you make your choice, the residual light streams on the monument erupt into a blinding blue beam, shooting straight toward one side of the highway. 

    -2:The searing brilliance shatters the stillness, slicing through the air like a blade. 

    -3:Where the light lands, it tears open the fabric of the road, revealing a brand-new path that wasn’t there before.

    -4:The road stretches into the unknown, its endpoint shrouded in a hazy blur. Yet, you can feel it — something monumental waits ahead, a truth too immense to ignore.

    -5:XN701’s projection turns to face you, its expression steady, almost unnervingly calm.

    -6:“This isn’t the end of it,” XN701 says, voice low but loaded with weight. “You’ve come too far for that. So tell me, Daniel — this time, are you ready to find the exit?”

    -7:The car surges forward, tires gripping the new road as the blue light dances outside your windows, flickering like a living guide.-> END
    }
    + [Press Enter]
    -> Cpt2_Scene6(num + 1)
    
===destination===//本次出行目的地的说明,在a节点输入where/think/wait/memory的时候跳到此节点，并在结束时回到a节点
{Your destination for this road trip is La Jolla, in San Diego.|Like it’s mentioned, you’re just an ordinary office worker. After five days of grind, weekends are your only chance to catch a breath. And your favorite escape? Driving out to La Jolla’s coastline to meet up with a long-time friend.|XN701 loves to analyze your mood, critique your driving, and — every so often — tease you about whether this “friend” is the real reason you keep coming back here.|But no matter what, La Jolla has become your weekend ritual, a brief escape from the grind of daily life.} 
+ [enter] -> previous_knot
===otherwise===//同上。输入任何错误拼写和非选项内的词
You can't do this right now.
+ [enter] -> previous_knot
===go===//在任意节点输入go后跳到此再返回上一节点
where to go?
+ [enter] -> previous_knot


