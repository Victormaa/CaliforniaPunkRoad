VAR previous_knot = ""
VAR current_scene_image = ""
-> Cpt1_Scene1(1)

===Cpt1_Scene1(num)===
    {num:
    -1:As you leave the fog-drenched stretch behind, the mist begins to lift, and the sky grows clearer.

    -2:The highway reappears in your line of sight, like you’ve just emerged from another world.

    -3:You exhale, feeling a brief wave of relief — until you notice the traffic ahead slowing to a crawl. A line of red brake lights stretches out in front of you like a glowing ribbon.

    -4:A traffic jam.
    
    -5:You ease off the gas and glance around, trying to figure out what’s causing the hold-up. There’s no sign of an accident, no flashing lights — just cars, packed together, inexplicably stuck.
    -6:But just as you’re about to accept it as an ordinary jam, something slams your nerves into overdrive — a car, out of nowhere, plummets from the sky.

    -7:It falls with an uncanny grace, landing at a perfect angle in an empty gap on the road ahead. No crash, no tumble, no visible damage. Its wheels touch the pavement smoothly, and it glides right into the flow of traffic like it’s been there all along.

    -8:You’re still reeling, trying to process what you just saw, when another car follows suit, descending in the same impossible manner, as if the laws of physics decided to take a break.

    -9: 
    “The second one, Daniel. This isn’t random.” 

    -10:A pause.

    -11:“You might want to take a closer look at your surroundings. Either the rules of reality just broke, or something’s gone very, very wrong.”

    -else: ->Question1
}

+[press enter]
-> Cpt1_Scene1(num+1)

===Question1===
 ~previous_knot = -> Question1
 +[Look/Check/Observe]->Cpt1_Scene2(1)
 +[Stop]-> Cpt1_Scene1a
 +[else]->otherwise
 +[where/think/wait/memory]->destination
 
 
===Cpt1_Scene1a===
 You press the brakes, bringing the car to a gradual stop on the shoulder, trying to assess the strange situation unfolding in front of you.

“Stopping? Really, Daniel? In a scenario like this, pulling over is a terrible move. If this isn’t just an ordinary traffic jam but something far more unusual, staying still only makes you a bigger target.”

“Most things become clearer when you keep moving and observe from the sidelines. Trust me on this one.”
->Question1

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

    -11:You blink instinctively, trying to make sense of what you’re seeing. The scene is eerily quiet, surreal. The papers hover mid-air, unaffected by the breeze, as though controlled by some unseen force.
    
    -else: ->Question2
}

+[press enter]
-> Cpt1_Scene2(num+1)

===Question2===
 ~previous_knot = -> Question2
+[Scan/Analyze]->Cpt1_Scene3(1)
+[Pick/Touch]->Cpt1_Scene2a
+[else]->otherwise
+[where/think/wait/memory]->destination
 

===Cpt1_Scene2a===
You roll down the window and cautiously reach out to grab one of the floating papers. 

But just as your fingertips brush against it, the paper emits a faint glow, then dissolves into countless tiny specks of light, vanishing into the air as if it had never existed.

“As I expected,” XN701 remarks. “These don’t take kindly to physical contact. That self-protection mechanism suggests they’re not here just for show — they’re transmitting some kind of information.”

“Maybe we should try interpreting them differently instead of relying on touch. Keep analyzing, or scan for more details.”
->Question2

===Cpt1_Scene3(num)===
    {num:
    -1:You activate the car’s AI scanning module. A soft glow flickers across the dashboard as a wave of blue light spreads out, enveloping the floating pieces of paper on the roadside.

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

    -17:The signs, which should have displayed names of towns and distances, are completely scrambled.

    -18:Instead of place names, they now show strings of URL links and unfamiliar text.
    
     -else: ->Question3
}

+[press enter]
-> Cpt1_Scene3(num+1)

===Question3===
 ~previous_knot = -> Question3
+[Analyze]->Cpt1_Scene4(1)
+[else]->otherwise
+[where/think/wait/memory]->destination

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

    -14:The cars that were crawling forward moments ago are now eerily frozen, suspended mid-air.

    -15:Some hover about half a meter off the ground, their wheels completely still, gently swaying like weightless objects in zero gravity.

    -16:There’s no movement inside these vehicles either — drivers and passengers are frozen in mid-action, locked in place like statues, their hands gripping wheels or staring blankly ahead.
    
    -else: ->Question4
}
+[press enter]
-> Cpt1_Scene4(num+1)

===Question4===
 ~previous_knot = -> Question4
+[Ask/Talk/Check]->Cpt1_Scene5(1)
+[Touch]->Cpt1_Scene4a
+[else]->otherwise
+[where/think/wait/memory]->destination

===Cpt1_Scene4a===
You edge your car closer to one of the suspended vehicles, rolling down your window as you pull up to its level. 

When it hovers low enough, you instinctively reach out, intending to touch the car’s surface.

“Daniel! Pull your hand back immediately,” XN701 snaps. “The energy field around these vehicles could cause unpredictable harm. Don’t get yourself fried for curiosity’s sake.”
->Question4

===Cpt1_Scene5(num)===
    {num:
    -1:You glance at XN701, trying to break the tension with words, though the sight outside leaves your voice slightly shaky:
    
    -2:“What the hell is going on? Why do these cars look like they’re floating in zero gravity?”

    -3:“Can’t give you a straight answer yet,” XN701 replies. “But one thing’s for sure — this isn’t natural. The suspension suggests some kind of external force interfering with their operation.”
    
    -4:You fix your gaze on the suspended cars hovering in mid-air, their stillness like evidence of time frozen in place. It’s impossible to look away.

    -5:But as you move forward slowly, one of the cars at the front suddenly begins to change. Tiny points of light appear on its surface, spreading rapidly like pixelated patterns consuming the entire vehicle.

    -6:The car’s outline becomes fuzzier with each passing second, until the entire structure starts to disintegrate, breaking down into countless shimmering particles that scatter like grains of sand in the wind.

    -7:Before long, more suspended cars follow suit, breaking apart in the same manner. 

    -8:One by one, they dissolve into bursts of light, as though they were never physical objects to begin with — just virtual data being systematically deleted from this reality.

    -9:The once-congested highway grows sparse, and eventually, the traffic vanishes entirely from sight.

    -else: ->Question5
}
+[press enter]
-> Cpt1_Scene5(num+1)

===Question5===
 ~previous_knot = -> Question5
+[Observe/Scan/Analyze/Record]->Cpt1_Scene6(1)
+[Wait]->Cpt1_Scene5a
+[else]->otherwise
+[where/think/wait/memory]->destination

===Cpt1_Scene5a===
You press the brakes and pull over to the side of the road, watching as the vehicles vanish one by one in a surreal, almost choreographed display.

You decide to wait and let the scene play out, hoping for some clearer clues to emerge once it’s over.

“Waiting isn’t your best option, Daniel.” 

“If this keeps spreading, it’s not just your car that’s at risk — it could be you next. Do yourself a favor: scan it, record it, and maybe try to figure out what the hell’s actually going on.”
->Question5

===Cpt1_Scene6(num)===
    {num:
    -1:“The way they’re breaking apart? Classic digital cleanup vibes,” XN701 says, “These cars are acting like virtual data getting manually wiped.”

    -2:“This isn’t some random glitch — it’s way too organized. Either a cleanup system is at play, or someone’s pulling the strings.”
    
    -3:You take a deep breath, grip the steering wheel tightly, and decide to steer around the disintegrating suspended cars, pushing onward.

    -4:As you get closer, a strange static charge fills the air, prickling faintly against your skin.

    -5:“Daniel, none of this is random,” XN701 says. “Cars falling from the sky, floating poems, traffic dissolving into data — it’s all pointing to some deeper system intervention.”

    -6:You shake your head, trying to clear your thoughts. The music on the radio has gone silent, replaced by an unsettling ringing in your ears. 

    -7:Sensing your unease, XN701 speaks in a more reassuring tone: “Maybe it’s time to get out of this area — see what lies ahead.”
    -else: ->Question6
}
+[press enter]
-> Cpt1_Scene6(num+1)

===Question6===
 ~previous_knot = -> Question6
+[Drive/Move]->Cpt1_Scene7(1)
+[else]->otherwise
+[where/think/wait/memory]->destination

===Cpt1_Scene7(num)===
    {num:
    -1:You press down on the accelerator, heading toward the unknown stretch of road ahead.

    -2:As the car picks up speed, a wave of dizziness washes over you, and the world around you starts to feel less and less real, as though you’re passing through some kind of barrier.

    -3:The only thing you’re certain of now is that there’s no turning back.
    -> END
     }
+[press enter]
-> Cpt1_Scene7(num+1)
->END

    
 
===destination===//本次出行目的地的说明,在a节点输入where/think/wait/memory的时候跳到此节点，并在结束时回到a节点
{Your destination for this road trip is La Jolla, in San Diego.|Like it’s mentioned, you’re just an ordinary office worker. After five days of grind, weekends are your only chance to catch a breath. And your favorite escape? Driving out to La Jolla’s coastline to meet up with a long-time friend.|XN701 loves to analyze your mood, critique your driving, and — every so often — tease you about whether this “friend” is the real reason you keep coming back here.|But no matter what, La Jolla has become your weekend ritual, a brief escape from the grind of daily life.} 
+ [press enter] -> previous_knot
===otherwise===//同上。输入任何错误拼写和非选项内的词
You can't do this right now.
+ [press enter] -> previous_knot
===go===//在任意节点输入go后跳到此再返回上一节点
where to go?
+ [press enter] -> previous_knot
