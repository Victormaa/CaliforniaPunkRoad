VAR previous_knot = ""
->Scene1(1)

=== Scene1(num) ===
{num:
    - 1: Check the blind spot. Turn the wheel.
    - 2: The sunlight streaming through the windshield is sharp, almost blinding.
    - 3: The soft, mechanical rhythm of the turn signal clicks away. A faint mix of tobacco and citrus air freshener lingers in the car.
    - 4: You know this routine too well. Just as people say that driving is like encasing your body in metal, giving you a second life for the road.
    - 5: As the scenery blurs past, yesterday’s thoughts fade into a vague haze of nostalgia. All that remains is the road ahead, leading to an uncertain future.
    - 6:“Hey, hey, slow down. According to the California Vehicle Code, you’re just a hair away from speeding.”
    - 7:It pauses, or at least seems to, then continues without missing a beat:
“You really wanna keep flooring it like that? Or should I calculate the probability of you getting a ticket?”
    - 8:No breathing, no stutters, no imperfections — the way it talks lacks the flaws of real human speech, rolling on like a machine without pause:
    - 9:“Every ten minutes, there’s a car accident somewhere on California’s roads. Do the math — how many cars won’t make it to their destination while we’re having this chat?”
    - 10:“My job’s to keep you safe, but sometimes I gotta ask — are you even trying to be protected?”
    - 11:Maybe it’s guilt. Maybe it’s self-preservation kicking in. Either way, your right foot instinctively eases off the gas pedal.
 //传来电台的乐曲声，是丹尼尔曾经最喜欢的歌曲《The Death of You and Me》
    - 12:That tiny 10cm-tall projection scans your preferences in seconds, reading your body temperature, expression, and even your heartbeat to gauge exactly how you’re feeling.
    - 13:Moments later, the car radio switches over to Echo Drift Radio and starts playing *The Death of You and Me.*
        It’s your favorite song.
    - 14:The clean strumming of an acoustic guitar flows through the car, soft and inviting, its melody blending seamlessly with the moment.
        By the time the first lyrics come on, you can’t help but wanting to hum along.
    - else: -> Question1//第一次输入指令部分
}

+ [Press Enter]
-> Scene1(num + 1)

=== Question1 ===
~previous_knot = -> Question1
+sing/hum -> Scene2(1)//正确的指令跳到下一个场景
+turn off -> Scene1a
+else -> otherwise

===Scene1a===
Are you really sure about that? This is the song you want to hear right now.
->Question1

===Scene1b===
->Question1
=== Scene2(num)===
{num:
     - 1:You hum softly, a slight smile tugging at the corners of your lips. 
Your fingers tap gently on the steering wheel, instinctively following the rhythm.
Sunlight continues to spill across the highway, almost makes you forget the passage of time.
     - 2:It’s a moment of calm, a fleeting sense of freedom, with the familiar melody serving as the perfect backdrop to your drive.
But beneath the song’s lighthearted, breezy tune, the lyrics carry a quiet, unspoken ache.
     - 3:You don’t dwell on it — most people don’t. It’s easier to remember the melody than the words. All the sadness, the pain, the confusion hidden in the lyrics flows by in a self-deprecating tone, sliding smoothly past people’s awareness.
     - 4:Without realizing it, you start singing louder.
     - else: -> Scene3(1)
}

+ [Press Enter]
-> Scene2(num + 1)

=== Scene3(num)===//车载AI取笑丹尼尔的歌声
{num:
     - 1:The tiny projection stands on the dashboard, tilting its head like it’s actually listening intently.
     - 2:Then, in a mocking tone, it chimes in: “Your pitch is about as precise as a tire rolling over gravel. Off by… let’s say 28%. Oh, and your rhythm? Totally out of whack.”
     - 3:It pauses for a moment before adding, “But hey, buddy, I guess that’s the unique charm of being human—turning a good song into… well, whatever this is.”
     - else: -> Question2
}
+ [Press Enter]
-> Scene3(num + 1)

=== Question2===
~previous_knot = -> Question2
+[talk/mock/scold/laugh]->Scene4(1)
+[look/think/wait]->Scene3a
+[else] -> otherwise
===Scene3a===
{“What’s the matter? Cat got your tongue? Humans always do this — when faced with facts, silence becomes the only weapon. Too bad, logically speaking, it’s not much of a deterrent.”|You need to come up with something to fire back.}->Question2

=== Scene4(num)===
{num:
     - 1:You burst out laughing, unable to resist snapping back, “Hey, hey, no need to get so salty. XN701, I’ve heard you ‘sing,’ and trust me, it’s worse. You sound like a busted radio.”
     - 2:The projection throws up its tiny hands in mock innocence.
“Oh, really? I don’t see any data backing that claim. And for the record, that’s algorithm-generated audio, not singing.”
    - 3:Not letting it off the hook, you fire back, “Well, I guess humans still have a few things going for them. No offense, but singing’s all about conveying emotion. You know, something AI’s a little… lacking in.”
    - 4:The figure shrugs, a sly grin flickering across its face.
“Emotion, huh? Sure, maybe. But hey, at least I don’t have to worry about being 28% off pitch.”
    -else: ->Scene5(1)//关于AI的基本信息
}
+ [Press Enter]
-> Scene4(num + 1)
TODO:丹尼尔和AI基本信息
=== Scene5(num)===//抬头看见路标
{num:
     - 1:Lost in thought, your car approaches an intersection. You glance up, and the road signs come into view — one pointing east, the other west, their metallic surfaces gleaming coldly under the sunlight.
     - 2:The sign at the right-hand fork reads in simple white lettering:
     “West – Coastline, Laguna beach.”
     - 3:The one on the left reads:
         “East – Desert, Mead Valley.”
      -> Question3
}
+ [Press Enter]
-> Scene5(num + 1)

=== Question3===
~previous_knot = -> Question3
+[west/go west]->Scene6(1)
+[east/go east]->Scene5a
+[else] -> otherwise
===Scene5a===
You hesitate for a moment, gripping the wheel as you consider turning onto the eastbound ramp.

But just then, XN701’s voice cuts in, loud and unusually firm: “Stop, Daniel. Heading east won’t get you to your destination.”

As it speaks, a red warning light flashes on the dashboard, urging you to change course.->Question3
=== Scene6(num)===
{num:
     - 1:In the distance, you can just barely make out a faint streak of blue on the horizon — it’s the ocean calling to you. 
     - 2:A breeze slips through the crack in the window, carrying a salty, humid tang that mingles with the citrusy scent of the air freshener. Somehow, it all blends together in a strange but peaceful harmony.
     - 3:You enjoy the simplicity of this journey: a two-hour drive, free of complicated plans or schedules. 
The hum of your tires on the asphalt, the endless stretch of highway, and the occasional banter with XN701 make the road feel less monotonous.
     - 4:Every time you take that final turn and the vivid blue of Laguna beach’s coastline fills your view, it’s like the sea breeze carries away all your worries for a little while.
     - 5:Then there’s the company of your old friend — talking about the latest drama in your social circles, grabbing drinks at a good bar, or strolling along the beach in the evening breeze.
      - 6:XN701 loves to analyze your mood, critique your driving, and — every so often — tease you about whether this “friend” is the real reason you keep coming back here.
     - else: -> Scene7(1)
}
+ [Press Enter]
-> Scene6(num + 1)

===Scene7(num)===
{num:
    - 1:You keep driving, cruising down the westbound highway. 

The road signs are long gone, left behind in the rearview mirror. The scenery shifts as you go, sparse low shrubs giving way to a broader, emptier view of the horizon.

But as you press on, a faint blur of white begins to appear along the edges of the skyline.
    - 2:At first, you think it’s just distant low clouds or a hint of moisture carried by the sea breeze. Yet, the farther you drive, the thicker and denser this whiteness becomes, slowly enveloping the hills on either side of the road.

XN701’s projection flickers lightly on the dashboard. Its voice, calmer than usual, breaks the silence:
    - 3:“Fog alert. Visibility ahead is less than 50 meters. Based on current road conditions, I strongly recommend you take immediate action.”
    - else:->Question4
}
+ [Press Enter]
-> Scene7(num + 1)

=== Question4===
~previous_knot = -> Question4
+[turn/turn on/turn on lights]->Scene8
+[slow]->Scene7a
+[stop]->Scene7b
+[else] -> otherwise
===Scene7a===
“Good. Slowing down is the smart choice. With current visibility, your safe driving speed shouldn’t exceed 30 miles per hour.”

XN701 pauses for a moment before adding with its usual edge:

“But are you sure you don’t want to turn on your lights to cut the risk even further?”->Question4
===Scene7b===
“Stopping the car? Really, Daniel? I guess you think pulling over is the safe move, but here’s the bad news — in weather like this, you’re practically inviting someone from behind to rear-end you.”

Its tone sharpens, turning serious:

“This is a highway, not a parking lot. Get moving. Turn on your hazard lights immediately. If you insist on staying here... guess waht, we’re both screwed.”->Question4
=== Scene8===
You gently press the headlight switch, toggling the beams to low. The soft glow cuts through the white fog, barely illuminating a few meters of road ahead.

XN701’s projection nods approvingly, its tone carrying a hint of smug praise:

“Good job. Now other vehicles are more likely to see you—though let’s not pretend that makes you safe. Stay calm, and keep your focus sharp.” 
+[enter]->Scene9(1)

===Scene9(num)===//
{num:
    - 1:The dense fog continues to blanket the highway, like an impenetrable white veil, burying the road and everything beyond it.

The car’s headlights scatter in the mist, barely illuminating a few meters ahead.

Outside, everything seems swallowed by the fog — even the roadside signs blur into shapeless shadows.
    - 2:“Keep driving, Daniel,” XN701’s voice breaks through, calm but firm. “The road may not be clear, but it’s still there. Moving forward is always better than standing still.”
    - else:->Question5
}
+ [Press Enter]
-> Scene9(num + 1)
===Question5===
~previous_knot = -> Question5
+[continue/drive/keep/keep on]->Scene10
+[stop]->Death
+[talk]->Scene9a
+[else] -> otherwise
=== Scene9a===
“Good job, buddy. This fog won’t last forever. Stay focused on what’s ahead and keep driving — your destination’s waiting for you, even if you can’t see it yet.”->Question5
=== Scene10===
As the wheels turn, the fog seems to thin ever so slightly. Through the haze, you catch a faint, blurry outline of light.

Whatever it is, it urges you to keep moving. The music continues to play softly in the car, a quiet accompaniment to an endless journey.->END

===Death===//“安全驾驶”彩蛋结局
You feel a violent impact from behind, then lose consciousness. Everthing fades away.This was a devastating car accident on Highway 5. Congratulations, you've reached the "Safe Driving" ending. There may be other ways to complete this game.->END



===destination===//本次出行目的地的说明,在a节点输入where/think/wait/memory的时候跳到此节点，并在结束时回到a节点
{Your destination for this road trip is La Jolla, in San Diego.|Like it’s mentioned, you’re just an ordinary office worker. After five days of grind, weekends are your only chance to catch a breath. And your favorite escape? Driving out to La Jolla’s coastline to meet up with a long-time friend.|XN701 loves to analyze your mood, critique your driving, and — every so often — tease you about whether this “friend” is the real reason you keep coming back here.|But no matter what, La Jolla has become your weekend ritual, a brief escape from the grind of daily life.} 
+ [enter] -> previous_knot
===otherwise===//同上。输入任何错误拼写和非选项内的词
You can't do this right now.
+ [enter] -> previous_knot
===go===//在任意节点输入go后跳到此再返回上一节点
where to go?
+ [enter] -> previous_knot


->END