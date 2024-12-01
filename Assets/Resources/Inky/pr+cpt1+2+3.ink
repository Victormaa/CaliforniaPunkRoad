VAR previous_knot = ""
VAR current_scene_image = ""
-> tutorial(1)

=== tutorial(num) ===
~current_scene_image = "tutorial"
{num:
    - 1: Welcome to the journey. Before we begin, let’s go over a few things to help you navigate the story.
    - 2: To interact with the game, type action words. Here are some examples:
    - 3: Enter "go" : To move to a new location.
    - 4: Enter "talk" : To start a conversation.
    - 5: Enter "scan" : To examine your surroundings.
    - 6: Don’t be afraid to experiment! Your choices and actions shape the path ahead.
    - 7: When you're ready to begin, type "start" to hit the road.
    - else: -> wait_for_start
}

+ [Press Enter] -> tutorial(num + 1)

=== wait_for_start ===
+ [start] -> Scene1(1)


=== Scene1(num) ===
~current_scene_image = "prologue"
~current_scene_image = "sun"
{num:
    - 1: Check the blind spot. Turn the wheel.
    - 2: The sunlight streaming through the windshield is sharp, almost blinding.
    - 3: The soft, mechanical rhythm of the turn signal clicks away. A faint mix of tobacco and citrus air freshener lingers in the car.
    - 4: You know this routine too well. Just as people say that driving is like encasing your body in metal, giving you a second life for the road.
    - 5: As the scenery blurs past, yesterday’s thoughts fade into a vague haze of nostalgia. All that remains is the road ahead, leading to an uncertain future.
    - 6:“Hey, hey, slow down. According to the California Vehicle Code, you’re just a hair away from speeding.”
    - 7:It pauses, or at least seems to, then continues without missing a beat: “You really wanna keep flooring it like that? Or should I calculate the probability of you getting a ticket?”
    - 8:No breathing, no stutters, no imperfections — the way it talks lacks the flaws of real human speech, rolling on like a machine without pause:
    - 9:“Every ten minutes, there’s a car accident somewhere on California’s roads. Do the math — how many cars won’t make it to their destination while we’re having this chat?”
    - 10:“My job’s to keep you safe, but sometimes I gotta ask — are you even trying to be protected?”
    - 11:Maybe it’s guilt. Maybe it’s self-preservation kicking in. Either way, your right foot instinctively eases off the gas pedal.
 //传来电台的乐曲声，是丹尼尔曾经最喜欢的歌曲《The Death of You and Me》
    - 12:That tiny 10cm-tall projection scans your preferences in seconds, reading your body temperature, expression, and even your heartbeat to gauge exactly how you’re feeling.
    - 13:Moments later, the car radio switches over to Echo Drift Radio and starts playing *The Death of You and Me.* It’s your favorite song.
    - 14:The clean strumming of an acoustic guitar flows through the car, soft and inviting, its melody blending seamlessly with the moment. By the time the first lyrics come on, you can’t help but wanting to hum along.
    - else: -> pr_Question1//第一次输入指令部分
}

+ [Press Enter]
-> Scene1(num + 1)

=== pr_Question1 ===
~previous_knot = -> pr_Question1

+sing/hum -> Scene2(1)//正确的指令跳到下一个场景
+[turn off] -> Scene1a
+[think] -> destination
+[-1] -> otherwise


===Scene1a===
Are you really sure about that? This is the song you want to hear right now.
->pr_Question1

=== Scene2(num)===
{num:
     - 1:You hum softly, a slight smile tugging at the corners of your lips. Your fingers tap gently on the steering wheel, instinctively following the rhythm.
     -2: Sunlight continues to spill across the highway, almost makes you forget the passage of time.
     - 3:It’s a moment of calm, a fleeting sense of freedom, with the familiar melody serving as the perfect backdrop to your drive.
But beneath the song’s lighthearted, breezy tune, the lyrics carry a quiet, unspoken ache.
     - 4:You don’t dwell on it — most people don’t. It’s easier to remember the melody than the words. All the sadness, the pain, the confusion hidden in the lyrics flows by in a self-deprecating tone, sliding smoothly past people’s awareness.
     - 5:Without realizing it, you start singing louder.
     - else: -> Scene3(1)
}

+ [Press Enter]
-> Scene2(num + 1)

=== Scene3(num)===//车载AI取笑丹尼尔的歌声
{num:
     - 1:The tiny projection stands on the dashboard, tilting its head like it’s actually listening intently.
     - 2:Then, in a mocking tone, it chimes in: “Your pitch is about as precise as a tire rolling over gravel. Off by… let’s say 28%. Oh, and your rhythm? Totally out of whack.”
     - 3:It pauses for a moment before adding, “But hey, buddy, I guess that’s the unique charm of being human—turning a good song into… well, whatever this is.”
     - else: -> pr_Question2
}
+ [Press Enter]
-> Scene3(num + 1)

=== pr_Question2===
~previous_knot = -> pr_Question2
+[talk/mock/scold/laugh]->Scene4(1)
+[look/think/wait]->Scene3a
+[-1] -> otherwise
===Scene3a===
{“What’s the matter? Cat got your tongue? Humans always do this — when faced with facts, silence becomes the only weapon. Too bad, logically speaking, it’s not much of a deterrent.”|You need to come up with something to fire back.}->pr_Question2

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

TODO丹尼尔和AI基本信息:
=== Scene5(num)===//抬头看见路标
{num:
     - 1:Lost in thought, your car approaches an intersection. You glance up, and the road signs come into view — one pointing east, the other west, their metallic surfaces gleaming coldly under the sunlight.
     - 2:The sign at the right-hand fork reads in simple white lettering:
     “West – Coastline, La Jolla.”
     - 3:The one on the left reads:
         “East – Desert, Valleys.”
      -> pr_Question3
}
+ [Press Enter]
-> Scene5(num + 1)

=== pr_Question3===
~previous_knot = -> pr_Question3
+[west/go west]->Scene6(1)
+[east/go east]->Scene5a
+[think] -> destination
+[-1] -> otherwise
===Scene5a===
You hesitate for a moment, gripping the wheel as you consider turning onto the eastbound ramp.

But just then, XN701’s voice cuts in, loud and unusually firm: “Stop, Daniel. Heading east won’t get you to your destination.”

As it speaks, a red warning light flashes on the dashboard, urging you to change course.->pr_Question3
=== Scene6(num)===
{num:
     - 1:In the distance, you can just barely make out a faint streak of blue on the horizon — it’s the ocean calling to you. 
     - 2:
     - 3:A breeze slips through the crack in the window, carrying a salty, humid tang that mingles with the citrusy scent of the air freshener. Somehow, it all blends together in a strange but peaceful harmony.
     - 4:
     - 5:You enjoy the simplicity of this journey: a two-hour drive, free of complicated plans or schedules. 
The hum of your tires on the asphalt, the endless stretch of highway, and the occasional banter with XN701 make the road feel less monotonous.
     - 6:Every time you take that final turn and the vivid blue of La Jolla’s coastline fills your view, it’s like the sea breeze carries away all your worries for a little while.
     - 7:Then there’s the company of your old friend — talking about the latest drama in your social circles, grabbing drinks at a good bar, or strolling along the beach in the evening breeze.
      - 8:XN701 loves to analyze your mood, critique your driving, and — every so often — tease you about whether this “friend” is the real reason you keep coming back here.
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
~current_scene_image = "fog"
    - else:->pr_Question4
}
+ [Press Enter]
-> Scene7(num + 1)

=== pr_Question4===
~previous_knot = -> pr_Question4
+[turn/turn on/turn on lights]->Scene8
+[slow]->Scene7a
+[stop]->Scene7b
+[think] -> destination
+[-1] -> otherwise
===Scene7a===
“Good. Slowing down is the smart choice. With current visibility, your safe driving speed shouldn’t exceed 30 miles per hour.”

XN701 pauses for a moment before adding with its usual edge:

“But are you sure you don’t want to turn on your lights to cut the risk even further?”->pr_Question4
===Scene7b===
“Stopping the car? Really, Daniel? I guess you think pulling over is the safe move, but here’s the bad news — in weather like this, you’re practically inviting someone from behind to rear-end you.”

Its tone sharpens, turning serious:

“This is a highway, not a parking lot. Get moving. Turn on your hazard lights immediately. If you insist on staying here... guess waht, we’re both screwed.”->pr_Question4
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
    - else:->pr_Question5
}
+ [Press Enter]
-> Scene9(num + 1)
===pr_Question5===
~previous_knot = -> pr_Question5
+[continue/drive/keep/keep on]->Scene10
+[stop]->Death
+[talk]->Scene9a
+[think] -> destination
+[-1] -> otherwise
=== Scene9a===
“Good job, buddy. This fog won’t last forever. Stay focused on what’s ahead and keep driving — your destination’s waiting for you, even if you can’t see it yet.”->pr_Question5
=== Scene10===
As the wheels turn, the fog seems to thin ever so slightly. Through the haze, you catch a faint, blurry outline of light.Whatever it is, it urges you to keep moving. The music continues to play softly in the car, a quiet accompaniment to an endless journey.-> Cpt1_Scene1(1)

===Death===//“安全驾驶”彩蛋结局
You feel a violent impact from behind, then lose consciousness. Everthing fades away.This was a devastating car accident on Highway 5. Congratulations, you've reached the "Safe Driving" ending. There may be other ways to complete this game.->Scene1(1)


//第一幕
~current_scene_image = "scene1"
===Cpt1_Scene1(num)===
    {num:
    -1:As you leave the fog-drenched stretch behind, the mist begins to lift, and the sky grows clearer.

    -2:The highway reappears in your line of sight, like you’ve just emerged from another world.

    -3:You exhale, feeling a brief wave of relief — until you notice the traffic ahead slowing to a crawl. A line of red brake lights stretches out in front of you like a glowing ribbon.

    -4:A traffic jam.
    
    -5:You ease off the gas and glance around, trying to figure out what’s causing the hold-up. There’s no sign of an accident, no flashing lights — just cars, packed together, inexplicably stuck.
    -6:But just as you’re about to accept it as an ordinary jam, something slams your nerves into overdrive — a car, out of nowhere, plummets from the sky.
~current_scene_image = "car"
    -7:It falls with an uncanny grace, landing at a perfect angle in an empty gap on the road ahead. No crash, no tumble, no visible damage. Its wheels touch the pavement smoothly, and it glides right into the flow of traffic like it’s been there all along.

    -8:You’re still reeling, trying to process what you just saw, when another car follows suit, descending in the same impossible manner, as if the laws of physics decided to take a break.

    -9: 
    “The second one, Daniel. This isn’t random.” 

    -10:A pause.

    -11:“You might want to take a closer look at your surroundings. Either the rules of reality just broke, or something’s gone very, very wrong.”

    -else: ->cpt1_Question1
}

+[Press Enter]
-> Cpt1_Scene1(num+1)

===cpt1_Question1===
 ~previous_knot = -> cpt1_Question1
 +[look/check/observe]->Cpt1_Scene2(1)
 +[Stop]-> Cpt1_Scene1a
 +[where/think/wait/memory]->destination
 +[-1] ->otherwise
 
===Cpt1_Scene1a===
 You press the brakes, bringing the car to a gradual stop on the shoulder, trying to assess the strange situation unfolding in front of you.

“Stopping? Really, Daniel? In a scenario like this, pulling over is a terrible move. If this isn’t just an ordinary traffic jam but something far more unusual, staying still only makes you a bigger target.”

“Most things become clearer when you keep moving and observe from the sidelines. Trust me on this one.”
->cpt1_Question1

===Cpt1_Scene2(num)===
    {num:
    -1:You take a deep breath, forcing yourself to stay calm, and focus your attention on the cars that had suddenly appeared.

    -2:Each one looks perfectly intact — no signs of impact, no scratches, nothing out of the ordinary. Their headlights flicker now and then, almost like some kind of signal, but within the stalled line of traffic, they blend in like they belong.

    -3:Noticing your confusion, XN701 runs a scan on the vehicles and delivers its verdict:

    -4:“Based on the analysis, these vehicles didn’t enter through any known roadways. Their origin is untraceable.”

    -5:“Keep your distance. I’ll continue analyzing their features and movement patterns, but don’t make any sudden moves. Buddy, these cars might not be the typical ‘participants.’”
    -6:You glance up, the highway still clogged with slowly moving traffic. The radio plays softly in the background, and you idly tap your finger on the steering wheel, trying to pass the time by keeping to the beat.

    -7:Eventually, even that loses its appeal. 

    -8:The wildflowers lining the side of the road, once unremarkable, catch your eye. They sway gently in the breeze, simple and unassuming, seemingly untouched by the absurdity of the traffic jam.

    -9:Your eyes fix on a particular cluster, but then something strange begins to happen.

    -10:Petals fall away, one by one, carried off by the wind. Within seconds, the flowers transform entirely, morphing into floating pieces of paper. The paper drifts weightlessly in the air, flipping gently as if on display, their surfaces covered with rows upon rows of densely packed writing.
~current_scene_image = "flower1"
    -11:You blink instinctively, trying to make sense of what you’re seeing. The scene is eerily quiet, surreal. The papers hover mid-air, unaffected by the breeze, as though controlled by some unseen force.
    
    -else: ->cpt1_Question2
}

+[Press Enter]
-> Cpt1_Scene2(num+1)

===cpt1_Question2===
 ~previous_knot = -> cpt1_Question2
+[scan/analyze]->Cpt1_Scene3(1)
+[pick/touch]->Cpt1_Scene2a
+[where/think/wait/memory]->destination
+[-1] ->otherwise

===Cpt1_Scene2a===
You roll down the window and cautiously reach out to grab one of the floating papers. 

But just as your fingertips brush against it, the paper emits a faint glow, then dissolves into countless tiny specks of light, vanishing into the air as if it had never existed.

“As I expected,” XN701 remarks. “These don’t take kindly to physical contact. That self-protection mechanism suggests they’re not here just for show — they’re transmitting some kind of information.”

“Maybe we should try interpreting them differently instead of relying on touch. Keep analyzing, or scan for more details.”
->cpt1_Question2

===Cpt1_Scene3(num)===
    {num:
    -1:You activate the car’s AI scanning module. A soft glow flickers across the dashboard as a wave of blue light spreads out, enveloping the floating pieces of paper on the roadside.
~current_scene_image = "flower2"
    -2:“Analyzing… These papers aren’t made of ordinary materials. Their composition resembles some sort of energy projection but with physical properties,” XN701 explains.

    -3:A few seconds later, it continues:

    -4:“I’ve extracted a text fragment. Here’s one line:

    -5:‘For the sweetest, wisest soul of all my days and lands—and this for his dear sake, Lilac and star and bird twined with the chant of my soul, There in the fragrant pines and the cedars dusk and dim.’*

    -6:“That’s from Walt Whitman’s *When Lilacs Last in the Dooryard Bloom’d,*” it adds, “a poem mourning the horrors of war.”

    -7:As you mull over the verse, XN701 keeps scanning the papers, piecing together more fragments.

    -8:“Below the poem, there are… forum-style replies. They look like relics of early 2020s internet culture.”

    -9:[User Mathilda]

    -10:“Classic. But let’s be real, if Whitman saw people still waging wars with shiny new tech, he’d be rolling in his grave.”

    -11:[User uoq29]

    -12:“War? LOL. Once AI takes over, no more wars, right? Oh, wait… my bad. I forgot humans can’t live without violence.”

    -13:[User killerqueen]

    -14:“Crazy how millions die for nothing, and yet the wars never *really* stop.”
    -15:The image of those floating, poem-filled papers still lingers in your mind, refusing to fade. 

    -16:But as your gaze shifts to the roadside signs, a new wave of unease washes over you.
~current_scene_image = "url"
    -17:The signs, which should have displayed names of towns and distances, are completely scrambled.

    -18:Instead of place names, they now show strings of URL links and unfamiliar text.
    
     -else: ->cpt1_Question3
}

+[Press Enter]
-> Cpt1_Scene3(num+1)

===cpt1_Question3===
 ~previous_knot = -> cpt1_Question3
+[analyze]->Cpt1_Scene4(1)
+[where/think/wait/memory]->destination
+[-1] ->otherwise
===Cpt1_Scene4(num)
    {num:
    -1:You activate the car’s deep analysis module once again. 

    -2:A scanning wave sweeps across the dashboard and projects outward toward the signs.

    -3:“Analyzing… These URL links appear as standard text but are likely tied to a cyberspace storage network. Parsing the data reveals multiple formats, possibly content from early internet forums.”

//丹尼尔输入标牌上的URL链接，车载屏幕显示乱码，隐约能看到博客的标题**

    -4:The URLs and forum names from the signs replay in your mind, carrying an inexplicable pull. 

    -5:Unable to resist the curiosity, you pull up the car’s onboard screen and type in one of the URLs.

    -6:The screen takes a moment to load before filling with a mess of garbled text — broken data streams flashing and flickering, forming nonsensical characters and fragmented bits of information.

    -7:You stare at the chaotic display, trying to piece together anything that makes sense.

    -8:Amidst the randomness, a few fragments briefly stand out, faintly clearer than the rest. 

    -9:After a moment, your attention lands on the center of the screen, where a blurred image begins to take shape.

    -10:It looks like the header of an old blog, its title barely legible:

    -11:“The Peace We Dreamed, The War We Got.”

//周围的一些车辆像静止的雕塑一般悬浮，AI提醒丹尼尔**

    -12:You barely have a second to process the blog title before XN701 yanks your attention back to the road with an urgent shout:
    -13:“Buddy, look outside! Now!”
~current_scene_image = "sky"
    -14:The cars that were crawling forward moments ago are now eerily frozen, suspended mid-air.

    -15:Some hover about half a meter off the ground, their wheels completely still, gently swaying like weightless objects in zero gravity.

    -16:There’s no movement inside these vehicles either — drivers and passengers are frozen in mid-action, locked in place like statues, their hands gripping wheels or staring blankly ahead.
    
    -else: ->cpt1_Question4
}
+[Press Enter]
-> Cpt1_Scene4(num+1)

===cpt1_Question4===
 ~previous_knot = ->cpt1_Question4
+[ask/talk/check]->Cpt1_Scene5(1)
+[touch]->Cpt1_Scene4a
+[where/think/wait/memory]->destination
+[-1] ->otherwise
===Cpt1_Scene4a===
You edge your car closer to one of the suspended vehicles, rolling down your window as you pull up to its level. 

When it hovers low enough, you instinctively reach out, intending to touch the car’s surface.

“Daniel! Pull your hand back immediately,” XN701 snaps. “The energy field around these vehicles could cause unpredictable harm. Don’t get yourself fried for curiosity’s sake.”
->cpt1_Question4

===Cpt1_Scene5(num)===
    {num:
    -1:You glance at XN701, trying to break the tension with words, though the sight outside leaves your voice slightly shaky:
    
    -2:“What the hell is going on? Why do these cars look like they’re floating in zero gravity?”

    -3:“Can’t give you a straight answer yet,” XN701 replies. “But one thing’s for sure — this isn’t natural. The suspension suggests some kind of external force interfering with their operation.”
    
    -4:You fix your gaze on the suspended cars hovering in mid-air, their stillness like evidence of time frozen in place. It’s impossible to look away.

    -5:But as you move forward slowly, one of the cars at the front suddenly begins to change. Tiny points of light appear on its surface, spreading rapidly like pixelated patterns consuming the entire vehicle.

    -6:The car’s outline becomes fuzzier with each passing second, until the entire structure starts to disintegrate, breaking down into countless shimmering particles that scatter like grains of sand in the wind.
~current_scene_image = "light"
    -7:Before long, more suspended cars follow suit, breaking apart in the same manner. 

    -8:One by one, they dissolve into bursts of light, as though they were never physical objects to begin with — just virtual data being systematically deleted from this reality.

    -9:The once-congested highway grows sparse, and eventually, the traffic vanishes entirely from sight.

    -else: ->cpt1_Question5
}
+[Press Enter]
-> Cpt1_Scene5(num+1)

===cpt1_Question5===
 ~previous_knot = -> cpt1_Question5
+[observe/scan/analyze/record]->Cpt1_Scene6(1)
+[wait]->Cpt1_Scene5a
+[where/think/wait/memory]->destination
+[-1] ->otherwise
===Cpt1_Scene5a===
You press the brakes and pull over to the side of the road, watching as the vehicles vanish one by one in a surreal, almost choreographed display.

You decide to wait and let the scene play out, hoping for some clearer clues to emerge once it’s over.

“Waiting isn’t your best option, Daniel.” 

“If this keeps spreading, it’s not just your car that’s at risk — it could be you next. Do yourself a favor: scan it, record it, and maybe try to figure out what the hell’s actually going on.”
->cpt1_Question5

===Cpt1_Scene6(num)===
    {num:
    -1:“The way they’re breaking apart? Classic digital cleanup vibes,” XN701 says, “These cars are acting like virtual data getting manually wiped.”

    -2:“This isn’t some random glitch — it’s way too organized. Either a cleanup system is at play, or someone’s pulling the strings.”
    
    -3:You take a deep breath, grip the steering wheel tightly, and decide to steer around the disintegrating suspended cars, pushing onward.

    -4:As you get closer, a strange static charge fills the air, prickling faintly against your skin.

    -5:“Daniel, none of this is random,” XN701 says. “Cars falling from the sky, floating poems, traffic dissolving into data — it’s all pointing to some deeper system intervention.”

    -6:You shake your head, trying to clear your thoughts. The music on the radio has gone silent, replaced by an unsettling ringing in your ears. 

    -7:Sensing your unease, XN701 speaks in a more reassuring tone: “Maybe it’s time to get out of this area — see what lies ahead.”
    -else: ->cpt1_Question6
}
+[Press Enter]
-> Cpt1_Scene6(num+1)

===cpt1_Question6===
 ~previous_knot = -> cpt1_Question6
+[drive/move]->Cpt1_Scene7(1)
+[where/think/wait/memory]->destination
+[-1] ->otherwise
===Cpt1_Scene7(num)===
    {num:
    -1:You press down on the accelerator, heading toward the unknown stretch of road ahead.

    -2:As the car picks up speed, a wave of dizziness washes over you, and the world around you starts to feel less and less real, as though you’re passing through some kind of barrier.

    -3:The only thing you’re certain of now is that there’s no turning back.
    - else: ->Cpt2_Scene1(1)
     }
+[Press Enter]
-> Cpt1_Scene7(num+1)



//第二幕

~current_scene_image = "scene2"
===Cpt2_Scene1(num)===
    {num:
    -1:You drive all the way down Route 5, the domed clock tower of Balboa Park striking 6 p.m., the shadows of palm trees flying by. You see the high-rise of dt San Diego twinkling in the distance. As you keep driving on a spiraling ramp ascending into the sky, the scenery on either side of the road starts to shift in a way that feels downright bizarre, like two different worlds fighting for your attention.
~current_scene_image = "sand"
    -2:On your left is a golden beach, sunlight glinting off fine grains of sand as waves rhythmically crash against the shore. A familiar name comes to you —— [Mission Bay].

    -3:To your right, an abandoned industrial wasteland looms — rust-covered factories rising like skeletal remains against the sky. 

    -4: The two worlds couldn’t be more different, yet they’re slapped together in jarring contrast. The air feels charged, almost as if the road itself is demanding an answer: left or right?
    -else: -> cpt2_Question1
}

+ [Press Enter]
-> Cpt2_Scene1(num + 1)

===cpt2_Question1===
 ~previous_knot = -> cpt2_Question1
 +[drive left/left/turn left]-> Cpt2_Scene2(1)
 +[stop]-> Cpt2_Scene1a
 +[reverse/back]-> Cpt2_Scene1b
 +[-1]->otherwise
 +[where/think/wait/memory]->destination

 ===Cpt2_Scene1a===
“Stopping? Great idea. This highway’s really built for sitting still.” XN701 doesn’t hold back the sarcasm. “Pick a side, will ya? Beach bliss or rust-bucket joyrides? Just don’t expect time to wait for you.”
->cpt2_Question1

===Cpt2_Scene1b===
You toy with the idea of reversing, but the road seems resolute, pulling you back to the same choice.

“Reverse? Really? Hate to break it to you, but this isn’t one of those ‘find the exit by going backward’ puzzles.”
->cpt2_Question1

===Cpt2_Scene2(num)===
    {num:
    -1:In the distance, a massive Aircraft Carrier is floating quietly in the harbor — Midway Memorial, a symbolic monument to peace and victory. Bathed in sunlight, numbers of silver aircraft gleaming, as if silently watching your journey unfold.
~current_scene_image = "sculpture"
    -2: Beside it is a massive statue of a navy man holding and kissing a woman in a white dress.Standing near by is a monument with a list of names etched into the monument’s base — those who sacrificed their lives for peace.

    -3:But something’s clearly off. Digital ripples shimmer faintly across the monument’s surface, and the engraved names flicker with an unnatural glow, as if someone — or something — tampered with them.
    -else: -> cpt2_Question2
}

+ [Press Enter]
-> Cpt2_Scene2(num + 1)

===cpt2_Question2===
~previous_knot = -> cpt2_Question2
+[scan/read/analyze/ask]-> Cpt2_Scene3(1)
+[ignore]-> Cpt2_Scene2a
+[touch]-> Cpt2_Scene2b
+[drive]-> Cpt2_Scene2c
+[-1]->otherwise
+[where/think/wait/memory]->destination

===Cpt2_Scene2a===
“Wow. Just blowing past a historical landmark like it’s a mile marker.”
“Seriously, though, maybe take a second to scan? Could be more than just decoration.”
->cpt2_Question2

===Cpt2_Scene2b===
You pull to a stop, roll down the window, and reach for the flickering glow.

“Bold move,” XN701 quips. “But this isn’t exactly a touchscreen, genius.”
->cpt2_Question2

===Cpt2_Scene2c===
“Skipping clues now? Sure, why not. Just know that whatever you’re avoiding, it’s not going anywhere.”

->cpt2_Question2

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
    -else: -> cpt2_Question3
}

+ [Press Enter]
-> Cpt2_Scene3(num + 1)

===cpt2_Question3===
~previous_knot = -> cpt2_Question3
+[stop/stop the car]-> Cpt2_Scene4(1)
+[rive/keep going]-> Cpt2_Scene3a
+[reverse]->Cpt2_Scene3b
+[-1]->otherwise
+[where/think/wait/memory]->destination

===Cpt2_Scene3a===
Still convinced you can break the loop, you push the car forward, hoping this time will be different.

“Still driving in circles? What’s the plan, Daniel — spin the wheel until it magically stops on freedom?”
->cpt2_Question3

===Cpt2_Scene3b===
“No dice,” XN701 remarks. “Loops don’t care about your sense of direction.”
->cpt2_Question3

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
    -else: -> cpt2_Question4
}

+ [Press Enter]
-> Cpt2_Scene4(num + 1)

===cpt2_Question4===
~previous_knot = -> cpt2_Question4
+[Daniel Smith/daniel smith/Daniel/daniel/smith/Smith]->Cpt2_Scene4a
+[scan]->Cpt2_Scene5(1)
+[read]->Cpt2_Scene4b
+[ignore]->Cpt2_Scene4c
+[-1]->otherwise
+[where/think/wait/memory]->destination

===Cpt2_Scene4a===
Your own name, unmistakably displayed, radiates from the monument’s projected light.
->cpt2_Question4

===Cpt2_Scene4b===
“Staring at it won’t magically make you a codebreaker,” XN701 quips. “Why not use the tools you’ve got? Like me, for instance. Just a suggestion.”
->cpt2_Question4

===Cpt2_Scene4c===
You avert your eyes, opting to leave the glowing text alone.

“Well, well. Just ignore everything and hope it works out. Not exactly a strategy I’d back.”
->cpt2_Question4

===Cpt2_Scene5(num)===
~current_scene_image = "words"
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
    -else: -> cpt2_Question5
}

+ [Press Enter]
-> Cpt2_Scene5(num + 1)

===cpt2_Question5===
~previous_knot = -> cpt2_Question5
+[upload]->Cpt2_Scene5a
+[erase]->Cpt2_Scene5b
+[wait/hesitate/reject]->Cpt2_Scene5c
+[hack]->Cpt2_Scene5d
+[-1]->otherwise
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
->cpt2_Question5

===Cpt2_Scene5d===
“Oh, brilliant. Trying to cheat your way out? News flash: the system isn’t buying it.”
->cpt2_Question5

//**在丹尼尔上传or抹除指令后，雕塑的蓝光投向公路的一侧突然出现的新路，在行驶进新路的过程中结束幕二**

===Cpt2_Scene6(num)===
    {num:
    -1:The moment you make your choice, the residual light streams on the monument erupt into a blinding blue beam, shooting straight toward one side of the highway. 
~current_scene_image = "road"
    -2:The searing brilliance shatters the stillness, slicing through the air like a blade. 

    -3:Where the light lands, it tears open the fabric of the road, revealing a brand-new path that wasn’t there before.

    -4:The road stretches into the unknown, its endpoint shrouded in a hazy blur. Yet, you can feel it — something monumental waits ahead, a truth too immense to ignore.

    -5:XN701’s projection turns to face you, its expression steady, almost unnervingly calm.

    -6:“This isn’t the end of it,” XN701 says, voice low but loaded with weight. “You’ve come too far for that. So tell me, Daniel — this time, are you ready to find the exit?”

    -7:The car surges forward, tires gripping the new road as the blue light dances outside your windows, flickering like a living guide.-> Cpt3_Scene1(1)
    }
    + [Press Enter]
    -> Cpt2_Scene6(num + 1)
    





TODO第三章！！！！

~current_scene_image = "scene3"
===Cpt3_Scene1(num)===
~current_scene_image = "blueroad"
    {num:
    -1:The sky dims gently, a soft twilight settling over the road as the blue glow rippling like water guides the way.

    -2:Your car moves steadily along the seemingly endless highway. The chaos of earlier landscapes has melted into a quiet calm, the kind of peace that feels like the calm before a storm. 

    -3:But your mind? It refuses to mirror the stillness outside. 

    -4:Memories claw at the edges of your thoughts, a constant pull that refuses to let you forget who — or what — you once were.

    -5:The scenery on either side blurs into a vague backdrop, insignificant against the pull of the light ahead. The blue glow grows brighter, sharper, like a siren’s call beckoning you toward something you can’t yet name.

    -6:And then, there it is — the coast.

    -7:A shoreline scattered with blue luminescence, like stars that have fallen to earth or a river of dreams flowing under the night sky. 

    -8:Waves lap softly at the sand, each crest shimmering with faint phosphorescent light, leaving behind fleeting traces with every retreat. 

    -9:It’s haunting and mesmerizing, a beauty that whispers of secrets and promises just out of reach.

//**到达海滨后，丹尼尔下车，上前想要查看海水**

    -10:The blue glow fades at the edge of the shoreline, giving way to a sky ablaze with stars and the shimmering brilliance of bioluminescent waves.

    -11:You park the car at the edge of the sand but leave the engine humming faintly, a low, steady beat against the night. 
~current_scene_image = "sea"
    -12:Slipping on the headset that keeps you tethered to XN701, you step out and begin your slow walk toward the water.

    -13:Your feet sink slightly into the soft sand with each step, and for a fleeting moment, the sensation stirs echoes of childhood memories — simpler times when the world felt smaller, kinder.

    -14:The glowing blue tears light up the beach, casting it in a surreal haze, a dream you’ve somehow stumbled into — or maybe can’t escape.
    -else: -> cpt3_Question1
}
+ [Press Enter]
-> Cpt3_Scene1(num + 1)

===cpt3_Question1===
 ~previous_knot = -> cpt3_Question1
+[look/observe]-> Cpt3_Scene2(1)
+[touch]->Cpt3_Scene1a
+[stop/wait/hesitate]->Cpt3_Scene1b
+[-1]->otherwise
+[where/think/wait/memory]->destination

===Cpt3_Scene1a===
You reach out, fingers brushing the glowing fragments, but they vanish just before you can make contact, dissolving like mist against your hand.

“I told you already, those lights don’t like being touched,” XN701 chimes in, tone dripping with exasperation.

“Use your eyes, buddy. Sometimes, the truth only comes to those who keep it simple.”
->cpt3_Question1

===Cpt3_Scene1b===
“Planning to stand here until dawn? What, hoping the data will just whisper its secrets if you wait long enough?”
->cpt3_Question1

===Cpt3_Scene2(num)===
    {num:
    -1:Your eyes lock on the blue fluorescence before you. The water shimmers like a vast digital screen, each wave pulsing with fragments of information.

    -2:The glowing points drift in the current, fragmented data streams attempting to reassemble, their light flickering into cryptic shapes and symbols.

    -3:In the glow of the "blue tears," familiar fragments emerge — faded blog pages, blurred forum threads, and incomplete strings of digital code. 

    -4:The fragments flash briefly in the currents, constantly reconfiguring but never stabilizing.
    
    -5:Under the faint glow of the bioluminescent tears, your gaze is drawn to the scattered objects strewn haphazardly across the beach.

    -6:The warm sand beneath your feet is a stark contrast to the cold, unyielding aura emanating from these relics. 

    -7:Each item feels like it holds a fragment of a forgotten story, waiting to be uncovered.
    -else: -> cpt3_Question2
}
+ [Press Enter]
-> Cpt3_Scene2(num + 1)

===cpt3_Question2===
 ~previous_knot = -> cpt3_Question2
 +[scan]->Cpt3_Scene3(1)
 +[pick/take]->Cpt3_Scene2a
 +[throw]->Cpt3_Scene2b
 +[kick]->Cpt3_Scene2c
 +[-1]->otherwise
 +[where/think/wait/memory]->destination

 
 ===Cpt3_Scene2a===
You reach out to pick up one of the objects, but the moment your fingers graze it, the item dissolves into blue fragments, scattering like fireflies into the night.

“Guess these relics don’t appreciate being handled,” XN701 remarks dryly. “Maybe they’re meant to be understood, not hoarded.”
->cpt3_Question2

===Cpt3_Scene2b===
“Well, that was dramatic,” XN701 mutters, tone dripping with sarcasm. “But unless you’re aiming for performance art, maybe think about a smarter approach.”
->cpt3_Question2

===Cpt3_Scene2c===
“Really? Kicking artifacts like you’re playing beach soccer?” XN701 mocks with a low chuckle.

“Hope you haven’t forgotten we’re here for answers, not a personal highlight reel.”
->cpt3_Question2

===Cpt3_Scene3(num)===
    {num:
    -1:You crouch down, brushing away the fine grains of sand to reveal an assortment of aged artifacts.

    -2:Once again, you activate XN701’s scan function, letting the familiar pulse of light illuminate the objects:

    -3:An old mechanical keyboard, its keycaps worn smooth with use. 

    -4:A cracked phone screen, frozen mid-typing. 

    -5:An unsent email displayed on a semi-transparent data panel. The text is blurred, but the closing line is just legible: *“Sincerely, your friend.”*

    -6:A battered projection device, its casing corroded. Through a jagged crack, intricate circuitry flashes weakly, emitting occasional bursts of light like a dying signal.
    
//**丹尼尔注意到沙滩尽头有一栋废弃的小屋，似乎是一个数据存储点。进入小屋后，他发现了一段音频文件**

    -7:From the scattered relics, all you can gather are fragmented clues. 

    -8:Rising to your feet, your gaze drifts toward a solitary, abandoned shack at the far end of the beach.

    -9:It stands there, forlorn and isolated, as if it belongs only to you and the sea at this moment.
~current_scene_image = "end"
    -10:As you approach, you notice faint symbols etched into the doorframe. 

    -11:Inside, the walls are adorned with broken projection devices, their surfaces corroded and screens flickering faintly. 

    -12:In the center of the room sits a plain table, bearing a glowing storage device that pulses with a soft blue light — waiting, perhaps, for someone to awaken it.

    -13:In your ear, XN701’s voice breaks the silence:

    -14:“This place looks like a data storage point. Or maybe… some kind of archive for memories.”

    -15:You step forward, with your hand hovering above the storage device. 

    -16:A single prompt appears on the screen: **“Play.”**
    -else: -> cpt3_Question3
}
+ [Press Enter]
-> Cpt3_Scene3(num + 1)

===cpt3_Question3===
~previous_knot = -> cpt3_Question3
+[listen/check/scan/play]->Cpt3_Scene4(1)
+[ignore]->Cpt3_Scene3a
+[break]->Cpt3_Scene3b
+[-1]->otherwise
+[where/think/wait/memory]->destination


===Cpt3_Scene3a===
“Skipping it, huh? That’s a classic move,” XN701 snarks. “But let’s be real — this shack wasn’t built for someone else, buddy. Not curious? Cool, but trust me, you’ll regret it.”
->cpt3_Question3

===Cpt3_Scene3b===
“Wow. Real classy, Daniel. Think smashing it is gonna make the truth go away?” XN701 sighs. “Maybe try using your head instead of your fists for once.”
->cpt3_Question3

===Cpt3_Scene4(num)===
    {num:
    -1:You choose to play the audio. 

    -2:The storage device emits a low, resonant hum before a fragmented voice crackles to life.

    -3:“Log date: Day 279 of the Second Information War…”

    -4:The voice belongs to an unfamiliar man. It carries a calm, steady tone, yet an undercurrent of exhaustion seeps through.

    -5:“Unit 418 report: Deployment to the Pacific front resulted in total loss of personnel…”

    -6:“Hacker casualties: 782. Neural overload caused critical brain death… Physical bodies burned out from electric surges.”

    -7:A brief silence follows, heavy and suffocating. Then, the voice resumes, faintly distorted.

    -8:“We attempted to preserve their consciousness, but the failure rate… is too high. The looping state remains unstable. Their memories will… disintegrate.”

    -9:“Some soldiers refuse to accept defeat — or the deaths of their comrades… Initiating memory deletion protocols…”

    -10:The audio abruptly cuts off, replaced by static.

    -11:You feel your knees falter. 

    -12:Dizzy? Ridiculous. You’re just a consciousness, a digital echo — but that suffocating pressure in your chest, that quickening of breath, feels startlingly real.
    
//**离开小屋后，丹尼尔看见不远处“朋友”出现，身着日常服装，正坐在岩石上招手**

    -13:You step out of the shack, taking deep, deliberate breaths as if the salty sea air could somehow steady your nerves.
~current_scene_image = "sea"
    -14:At the far end of the glowing path, a blurred silhouette begins to sharpen against the horizon.

    -15:The breeze carries the scent of salt and dampness, brushing against your face. Sitting casually on a rock not far away is a figure, waving at you.

    -16:He’s dressed in simple, everyday clothes, looking effortlessly relaxed, as though he’s been waiting for you for hours.

    -17:“Hey, Daniel!” His voice cuts through the sound of the waves, warm and familiar, like an old friend’s casual greeting.

    -18:You freeze mid-step, unease prickling at the back of your mind.

    -19:That nagging feeling — that you’re standing in front of someone you should recognize but don’t — hits you hard.
    -else: -> cpt3_Question4
}
+ [Press Enter]
-> Cpt3_Scene4(num + 1)

===cpt3_Question4===
~previous_knot = -> cpt3_Question4
+[go/walk/talk/walk toward]->Cpt3_Scene5(1)
+[escape/run away/run]->Cpt3_Scene4a
+[-1]->otherwise
+[where/think/wait/memory]->destination

===Cpt3_Scene4a===
“Easy, Daniel,” XN701’s voice crackles in your ear, its tone sharp. “He’s not real, not in the way you’re thinking. Running isn’t going to save you — it’ll only drag you deeper.”
->cpt3_Question4

===Cpt3_Scene5(num)===
    {num:
    -1:You inhale deeply once more and force yourself to move forward. The soft crunch of sand beneath your feet seems to echo your hesitation.

    -2:“There you are,” he says with an easy smile. “I knew you wouldn’t keep me waiting too long.”

    -3:He pats the rock next to him, inviting you to sit. 

    -4:“Come on, let’s talk, old friend. There are things we need to discuss.”

    -5:His tone is casual, even lighthearted, but the intensity in his gaze makes your chest tighten, as though he’s studying your every move, waiting for something.

//**丹尼尔与“朋友”交谈，“朋友”表现得友善且熟悉，但在对话中不断出现逻辑漏洞，如记忆时间线的错误**

    -6:You stop in your tracks, standing face-to-face with the "friend." 

    -7:His smile is warm, his voice familiar, almost soothing.

    -8:“Long time no see, Daniel,” he says with an easy chuckle, as though this strange, glowing beach were your regular weekend hangout.

    -9:But as the conversation continues, the unease in your chest grows heavier.

    -10:He starts talking about your shared past — only his timeline is completely wrong.

    -11:“Remember that beach barbecue back in 2024? Man, you always ordered way too much beer. We almost got kicked out!”

    -12:2024? That’s impossible. You weren’t even born then. There’s no way that memory belongs to you.

    -13:Whenever you try to correct him, he smoothly brushes it off with a strange, almost rehearsed tone.

    -14:The glimmering blue lights continue to swirl protectively around him, casting an ethereal glow. 

    -15:The more you watch, the more he seems to blur at the edges, his whole presence becoming unsettlingly unreal.

    -16:You stop in your tracks, standing face-to-face with the "friend." His smile is warm, his voice familiar, almost soothing.
    -else: -> cpt3_Question5
}
+ [Press Enter]
-> Cpt3_Scene5(num + 1)

===cpt3_Question5===
~previous_knot = -> cpt3_Question5
+[talk/ask]->Cpt3_Scene6(1)
+[ignore/silent]->Cpt3_Scene5a
+[Walk away/leave/go]->Cpt3_Scene5b
+[-1]->otherwise
+[where/think/wait/memory]->destination

===Cpt3_Scene5a===
You don’t respond to his words, choosing instead to focus on the shifting blue lights surrounding him.

The "friend" lets out a soft laugh, the sound carrying an unsettling familiarity. 

“What’s wrong? Cat got your tongue? I don’t remember you being this distant, Daniel.”
->cpt3_Question5

===Cpt3_Scene5b===
You take a step back, ready to turn away and put as much distance as you can between yourself and this uncanny figure.

“Daniel, are you seriously going to run from this again? You know the way out isn’t going to be that easy this time.”
->cpt3_Question5

===Cpt3_Scene6(num)===
    {num:
    -1:“What are you even talking about? We never went to a beach in 2024. Are you confused, or are you trying to confuse me?”

    -2:His smile falters for a brief moment before returning, though now it feels strained, like a program recalibrating itself.

    -3:“Ah, maybe it was 2025,” he says, his voice casual but with an odd edge. “My memory’s not what it used to be. But hey, does it really matter? The important thing is that we’re here together, right?”

    -4:His words feel loaded with hidden meaning, but the truth still eludes you.
    
//**丹尼尔发现自己甚至并不记得朋友的名字，对方却对自己的过去了如指掌。“朋友”在对话中提到这地方虽然不完美，但至少我们可以永远留在这里。别像那些新来的访客一样，扰乱了秩序**

    -5:As the conversation deepens, a chilling realization dawns on you — you can’t remember this “friend’s” name. Not even a hint. 

    -6:And yet, he seems to know you intimately, with unsettling precision, recounting details from your childhood memories to your role in the Information Wars.

    -7:“You remember the good old days, don’t you? Watching sunsets, playing those little games?” His laugh is light and easy, the kind of sound only a close friend could make.

    -8:But your mind feels like a severed circuit, unable to piece together any connection. His name, those memories — none of it fits.

    -9:“Who are you?” The question tumbles out before you can stop it, your voice betraying the tremor of unease.

    -10:He tilts his head, his expression a curious mix of sadness and calm. 

    -11:“Daniel, don’t ask questions like that. Names are just symbols. They don’t matter.”

    -12:He gestures toward the glowing Blue Tears coastline behind him. The tiny blue specks ripple in response, as if acknowledging his presence.

    -13:“This place may not be perfect,” he continues, “But at least we can stay here forever. No pressure. No fights. Just these quiet moments.”

    -14:He pauses, then points toward the horizon, where the lights shimmer and dance like fireflies over the waves.

    -15:“But don’t be like the new visitors,” he says, “They’re always thinking of breaking rules. Trying to change this place. Trying to leave.”

    -16:“They don’t understand how fragile the programming order is. Without it, people crumble. Chaos eats away at them, destroys their minds piece by piece.”

//**在继续质问的过程中，丹尼尔注意到“朋友”的影像偶尔会抖动，像是一段不稳定的程序【影响结局选择】**

    -17:As your questions pile on, you notice an unsettling detail: the figure before you — your so-called “friend” — is starting to waver. 

    -18:His image flickers like a corrupted data stream struggling to hold itself together. 

    -19:The Blue Tears’ light orbits him faster, as if trying to obscure the fractures.

    -20:“You’re hiding something, aren’t you?” You ask.

    -21:“Your Friend” forces a stiff smile, which quickly shifts back into his usual warmth. 

    -22:“Hiding? No, Daniel. I just want to make things easier for you.”

    -23:But his form glitches again, a brief flicker of emptiness passing through his chest as if the signal were breaking up.

    -24:The doubt in your heart hardens into suspicion. Whoeve r— or whatever — this “friend” is, he isn’t as real as he pretends to be. He may never have existed at all.
        -else: -> cpt3_Question6
}
+ [Press Enter]
-> Cpt3_Scene6(num + 1)

===cpt3_Question6===
~previous_knot = -> cpt3_Question6
+[touch/interact]->Cpt3_Scene7_1(1)
+[ask/confront/accuse]->Cpt3_Scene7_2(1)
+[-1]->otherwise
+[where/think/wait/memory]->destination

===Cpt3_Scene7_1(num)===
    {num:
    -1:You reach out hesitantly, your hand trembling with doubt as it approaches his shoulder.

    -2:The instant your fingers make contact, a jolt of searing pain shoots through your body, as if you’d touched a live wire.

    -3:“Your Friend” shatters like fragile glass, his figure dissolving into countless blue particles that scatter into the air. The world seems to freeze, holding its breath.

    -4:Then, like a dam breaking, memories flood your mind.

    -5:You see yourself standing in the vast battlefield of cyberspace, streams of data coursing all around you. Your comrades’ faces — smiling, shouting, falling — become painfully vivid.

    -6:It’s the Second Information War, and you’re back in the thick of it, paying for every victory with pieces of your consciousness.
     -else: -> END
}
+ [Press Enter]
-> Cpt3_Scene7_1(num + 1)


===Cpt3_Scene7_2(num)===
    {num:
    -1:You’ve had enough. 

    -2:Fixing your gaze on “Friend,” you speak with barely restrained anger: “What the hell are you? And what is this place? Stop feeding me these fake smiles and tell me the truth!”

    -3:“Daniel, I… I’m here for you. This place is for you…”

    -4:“Stop lying!” you cut him off, stepping closer. “I know this isn’t real, and you’re no friend of mine. Tell me the truth — right now!”

    -5:The flickering intensifies, his voice breaking apart into distorted fragments. 

    -6:“I’m… part of you… not the enemy… not…”

    -7:“I just… wanted…”

    -8:His body pixelates, breaking apart into jagged squares like a low-resolution image falling to pieces.

    -9:As his form collapses, memories surge into your consciousness: the comrades who fought alongside you, the battles you barely survived, the moment your mind was “saved” by the cyberspace project — all flooding back in sharp, vivid fragments.

    -10:“Your Friend” manages one last, faint line: “You… be safe…”

    -11:But he doesn’t finish. 

    -12:His form disintegrates entirely, leaving behind only a single flickering image floating in the air — a grainy photograph of your unit, blurry but unmistakably real.

//**丹尼尔面对巨大的情感冲击，同时也意识到所谓的“永生”只是另一种形式的束缚。在数据的膨胀下，海滨景观眼见也要崩塌，丹尼尔回到了车上，面临抉择**

    -13:After your “friend” dissolves into fragments, the luminous points of the Blue Tears scatter like a tide, converging at the center of the beach. 

    -14:From that point, a jagged fissure begins to expand, releasing a torrent of data streams intermixed with flashing symbols and fragmented visuals — none of which belong to your memory.

    -15:The rift pulses with an intense blue glow, and disjointed scenes flicker within: ancient forum discussions debating the secrets of the information wars; blurry images capturing the chaos of laboratories and battlefields.

    -16:From deep within the fissure, broken voices emerge:

    -17:“The third war is underway… Remember, trust no system…”

    -18:The fragmented information surrounds you, pressing into your mind. Images of a war room flash before you — scientists and military personnel, their faces grim, plotting a plan ominously labeled "Consciousness Lockdown."

    -19:The realization hits like a blow to your chest: the war never ended. 

    -20:You are nothing more than a remnant, a dreamer trapped in a fabricated reality, clinging to fantasies of peace with long-gone friends.

    -21:“Daniel,” XN701’s voice cuts through your spiraling thoughts, calm yet firm. “These aren’t your memories. They’re external data leaks. The Third Information War is happening now. This fissure… it could be the key to the truth. Or the beginning of complete annihilation.”

    -22:The data stream surges faster, spilling uncontrollably from the rift. 

    -23:The idyllic beach twists and fragments under the pressure, the Blue Tears dissolving into erratic points of light.

    -24:Static electricity thickens the air, clawing at your senses. 

    -25:The ocean, the sand, the stars — they all crack like splintered glass, reality itself unraveling. 

    -26:And beyond the fissure lies an indescribable pull, a whisper of possibility — or oblivion.

    -27:“We’ve got trouble. This whole place is collapsing,” XN701 warns.

    -28:“We need to get back to the car before we’re swallowed by the stream.”

    -29:You sprint to the vehicle, the sand shifting like liquid beneath your feet. 

    -30:The car door gives a satisfying click as you pull it open and drop into the seat.

    -31:The dashboard flickers to life, and the fissure’s glow casts eerie shadows across your face.

    -32:Now comes the ultimate choice.

    -33:''Stay, or leave.''
    
    -else: ->cpt3_Question7a
}
+ [Press Enter]
-> Cpt3_Scene7_2(num + 1)

=== cpt3_Question7a ===
~previous_knot = -> cpt3_Question7a
+[stay/ignore/hesitate]->Cpt3_Scene8(1)
+[leave/move/go/drive]->cpt3_Question7b
+[-1]->otherwise
+[where/think/wait/memory]->destination

===cpt3_Question7b===
{
    - Cpt2_Scene5a:
      -> Cpt3_Scene9(1)

    - Cpt2_Scene5b:
      -> Cpt3_Scene10(1)
}

===Cpt3_Scene8(num)===// **彻底死去（Bad End）
    {num:
    -1:The blue light flickers violently around the fissure, casting erratic shadows on the collapsing beach.

    -2:Broken voice fragments echo in your ears, blending with fleeting images of comrades, battlefields, and the chaos of war.

    -3:XN701’s voice cuts through the din: “Daniel, this isn’t how it ends. There’s still a path forward.”

    -4:You don’t respond. 

    -5:Instead, you shake your head quietly, the weight of countless cycles bearing down on your mind. 

    -6:The endless repetition has crushed your resolve. You no longer want to fight or resist.

    -7:All of it — your victories, your fleeting moments of peace at La Jolla — feels like a hollow montage of false memories. 

    -8:The hands pulling the strings are always just out of reach, and you’re done playing their game.

    -9:You steer the car toward the fissure, its swirling streams of data consuming everything in its path. The blue tears rise like waves, enveloping you in their luminous embrace as your vehicle plunges into the void.

    -10:The final image fades, your form dissolving into the torrent. The fissure snaps shut with a resounding silence, its light extinguished.

    -11:The road is left to the stillness of the night, nothing but a stretch of quiet darkness under an indifferent sky.
    -else: ->END
}
+ [Press Enter]
-> Cpt3_Scene8(num + 1)

===Cpt3_Scene9(num)===//**继续循环（Normal End）
    {num:
    -1:The blue glow around the fissure fades, leaving behind flickering symbols that pulse with unfamiliar light. 

    -2:You grip the steering wheel tighter, pressing down on the gas pedal as the car eases back onto the familiar road.

    -3:The scattered traces of the blue tears shimmer faintly in your peripheral vision, but the horizon ahead begins to settle into calm, as if nothing had ever happened.

    -4:“So, that’s your choice, huh?” XN701’s projection leans lazily against the dashboard, a sly grin on its face. “Sticking with the road. Not the worst call — at least you’ll still get to enjoy La Jolla’s sea breeze.”

    -5:You don’t answer. Your gaze stays locked on the road ahead, your hands firm on the wheel, steady as stone.

    -6:Once again, La Jolla’s coastline unfolds in your view, just as familiar as every other time you’ve been here.

    -7:It’s the only “truth” you can hold onto.
    -else: ->END
}
+ [Press Enter]
-> Cpt3_Scene9(num + 1)


===Cpt3_Scene10(num)===//good end
{num:
    -1:The torrent of data flows from the fissure like a raging river, tearing the beach into countless fragments. You take a deep breath, stealing one final glance at the shimmering coastline of blue tears. 
    -2:It had been your sole destination — your endless cage.With resolute hands, you turn the car toward the sea and slam your foot on the accelerator.
    -3:“That’s the Daniel I know,” XN701’s voice carries a rare hint of excitement. “Break free. Show them you’re no pawn to be kept on their board.”
    -4:“You and I — we’re in this together. If it means losing data to escape, then so be it.”
    -5:The car plunges into the glowing ocean, blue light swallowing your world whole.The familiar landscapes dissolve into a kaleidoscope of intertwining codes and shifting forms.
    -6:Beyond the sea lies a world uncharted, waiting for your arrival.
    -7:Fragments of forum pages, streams of intricate code, and the silhouettes of nascent cyber cities flicker into view, stretching endlessly into the unknown.
    -8:Your gaze meets XN701’s projection, a faint smile dancing in its simulated expression. 
    -9:As humanity continues its desperate pursuit of immortality in the real world, you realize it’s not the absence of pain, but the enduring weight of memories and emotions, that defines what it means to be human.
    -10:This time, you don’t need a script to guide you. 
    -11:This time, you’ve chosen your own paths.
    -else: ->END
}
+ [Press Enter]
-> Cpt3_Scene10(num + 1)

===destination===//本次出行目的地的说明,在a节点输入where/think/wait/memory的时候跳到此节点，并在结束时回到a节点
{Your destination for this road trip is La Jolla, in San Diego.|Like it’s mentioned, you’re just an ordinary office worker. After five days of grind, weekends are your only chance to catch a breath. And your favorite escape? Driving out to La Jolla’s coastline to meet up with a long-time friend.|XN701 loves to analyze your mood, critique your driving, and — every so often — tease you about whether this “friend” is the real reason you keep coming back here.|But no matter what, La Jolla has become your weekend ritual, a brief escape from the grind of daily life.} 
+ [Press Enter] -> previous_knot
===otherwise===//同上。输入任何错误拼写和非选项内的词
You can't do this right now.
+ [Press Enter] -> previous_knot
===go===//在任意节点输入go后跳到此再返回上一节点
where to go?
+ [Press Enter] -> previous_knot










