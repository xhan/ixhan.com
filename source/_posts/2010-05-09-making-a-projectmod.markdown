---
author: xhan
comments: true
date: 2010-05-09 23:27:49
layout: post
slug: making-a-projectmod
title: Making a Project(MOD)
wordpress_id: 305
categories:
- Knowledge
tags:
- experience
- management
- Project
- trick
- work
---

偶然发现这篇妙文,原味虽然说的是制作mod,但推广到各种项目上依然是篇不错的指导.

内容包括:招募队员,确立项目到测试发布,各位慢慢品味.

[原文地址 http://developer.valvesoftware.com/wiki/Making_a_Mod](http://developer.valvesoftware.com/wiki/Making_a_Mod)


## Starting out


Lets start by looking at how to assemble a team. The guiding rule  here is to keep it small. Managing a team of people is a full-time job,  even when all the team resides in the same building. If you're dealing  with an on-line team, you can easily spend all your time managing it,  and that means you won't be spending any time on making your mod. Adding  more people to the team doesn't mean more work will get done. The more  people you have, the more time spent managing them. Team Fortress's core  team was 3 people. [Counter-Strike](http://developer.valvesoftware.com/wiki/Counter-Strike)'s core team was one person.

When looking for team members, try to only hire people you  absolutely cannot survive without. Your first instinct might be to hire  anyone who can code, or model, or make maps, and so on. But for your  first version, you probably won't need more than one person for each  area of your mod (code, sound, models, maps). You may not even need any  new models, sounds, or maps. Don't hire anyone until you've seen  examples of their work. Make sure they've actually finished things. If  they're a modeler who's done 20 models, but they're all half-finished,  you don't want them.




## Mod design


As a mod author, the most useful question you can ask yourself is  "Why should someone play my mod?" It's a hard question to answer  truthfully, but if you can answer it well, you're on the right track.  Think about what other mods are out there, and what they offer. Does  your mod offer something new to the players? Is what you offer enough to  entice players who are busy playing other mods? Even if you can't  answer this question, just thinking about it will probably help your  mod.




### Compete with gameplay


You have power commercial developers don't: You don't have to worry  about the commercial viability of new gameplay styles. Commercial  developers have to worry about appealing to retail, breaking even, and  other nasty things, which is why most games are slight modifications on  already proven gameplay. But you don't. You can try out truly new  gameplay ideas that just might become the Next Big Thing. This is your  edge over commercial developers. Make your job easier by concentrating  on this edge, and don't spend your time trying to compete in the areas  that commercial products are strong in. Most mods can't compete on a  content level (maps, models, sounds, etc) with commercial products.  They've got teams of artists with years of experience. Beat them with  your gameplay. Players will play a mod that has very little in the way  of new content, but has really fun gameplay. Something many people don't  realize is that Team Fortress 1 had almost no new art for a year after  it was first released.




### Release soon, release often


You have another power over commercial developers. You can release  much, much faster and more often than they can. We've summarized this  mod development philosophy with the phrase, "Release soon, Release  often." Commercial developers work for 2-3 years, release their game,  and hope to god people like it. You don't have to make that leap of  faith. You can design your whole mod, write 25% of it and polish it to a  playable state, then release it and begin getting feedback immediately.  Then you can start adding the rest of your design piece by piece, at  the same time rolling in the player's feedback to the first version, and  continue releasing every month or two. You're in touch with your  players at all times, so you'll never be in the situation where you've  spent a lot of time on something you're not sure your players will like.  The trick is to cut your mod up into slices. The initial version needs  to be fun and playable, but doesn't need every cool feature you've  thought of.

Be careful. "Release soon" doesn't mean releasing bad quality  stuff, it just means doing your mod in small, polished increments. The  first version of [Counter-Strike](http://developer.valvesoftware.com/wiki/Counter-Strike) didn't have half of the  features they have now. The CS team released a high quality, but not big  mod. Over the past year, they've been regularly adding more and more  features and, in response, their player base has just continued to grow  and grow.




### Different is not always better


When thinking about your game design, don't fall into the trap of  believing that "Different is Better." There's no reason to rewrite the  shotgun code and have a new shotgun model if it doesn't impact your game  in any interesting way. Keep in mind the first question, "Why should  someone play my mod?" The answer, "My mod has a new combat system, and a  new movement system," isn't necessarily a good answer. So your combat  system is different that Half-Life's. OK... but is it better? Does it  make your mod more fun to play? Does a new movement system make the game  more fun? Player's are used to existing systems, and making them learn  another one needs to be worth it for them. So before you think about  changing something, make sure you know you're changing it for the  better, and that it'll make your mod more fun. Don't be afraid to just  leave something the same as it was in Half-Life.




### Realistic goals


Create realistic goals for yourself. Think about how long it takes a  commercial developer to make an FPS shooter with 10 weapons. If your mod  is going to have 40 weapons, you're making life really hard for  yourself. The thing to keep in mind here is "Quality over Quantity."  Players would far prefer to have 10 unique, well balanced, and fun to  use weapons than 40 unbalanced weapons, some of which are slightly  tweaked versions of others.

Don't be afraid to cut content and features. If the mod looks  like it's never going to be finished, or there's some content that you  don't think meets the quality of the rest of the mod, then start  cutting. During the development of HL at least 30% of the original  features in the design were cut because it became obvious they were  unattainable in our timeline, or because we decided they weren't worth  their development time. As we said above, "Quality over Quantity."  Players would prefer having 3 really good, well play-tested maps over 10  untested ones, and it'll give your mod a reputation for quality  content. Don't let the world see your worst stuff.




### Understand the engine


You really should read the [documentation](http://developer.valvesoftware.com/wiki/SDK_Docs) included in the SDK. The thing you'll learn most by doing so isn't  whether you can do X with the engine, but rather how X should be done so  it works well. You can make a gun that fires 50 rockets, but if you  don't understand the way the engine works, you might do it in a way that  significantly increases the network traffic your mod uses. This is  important for everyone in your mod. If your mapmakers don't understand  the engine, they'll make huge maps without any thought for how much  network data will be sent to the players in them, and everyone will  blame your code for being too network intensive. If you're a programmer,  it's a good idea to join to HL Coders mailing list, where you'll be  able to talk to many other mod programmers, and a few Valve employees as  well. The mailing list has archives going back a long way, which  contain a lot of useful solutions to common mod problems.




## Finishing


We see a lot of mods that start out strong, produce a lot of great  looking content, and never quite make the last step of getting it into  the player's hands. This section will help you get into a release mode  where you're driving towards producing a releasable version of your mod.

We chose five weeks as a starting estimate of the time it'll take  to get from normal development mode to a shippable version. It's likely  you'll get better, and hence faster, at this with successive releases.  If your mod is larger in scope, or your team is substantially  international, then it is likely to take more than five weeks, though  the steps will be similar to the following.. If possible, try and get  the team to commit a few hours of every day to the mod for this period  of time. If some team members can't do that, you're probably better off  removing them from the shipping process. Get them to hand their part to  someone else on the team who can put in the required effort. Shipping a  product, even a small product, is hard and requires a substantial  commitment.

There are many things in this section that might sound harsh or  rigid. This is unfortunate, but a reflection on how hard a process this  is. The advice here is a summation of lessons learned in the shipping of  many products, and most of it a result of painful mistakes that set  back our release dates. When you wonder whether a particular piece of  advice here is necessary, it's possible that we once added weeks to our  release date because we didn't take it.

This is also something that prospective employers are extremely  interested in. It's one thing to see that a mod maker has produced a  bunch of cool stuff, it's another thing entirely to see that they  produced some cool stuff and actually shipped it out and people played  it. The coolest map/model/code/sound/etc. in the world is useless if you  couldn't go the last mile and ship it.

Fear not, this gets a lot easier once you've been through it a  couple of times. By the third or fourth release of your mod, you'll be  an expert!




## Five weeks out





### Centralize ownership


You should designate a single member of your mod team as the [Shipping Leader](http://developer.valvesoftware.com/wiki/Shipping_Leader_In_Detail) (SL). This person  will drive progress on the mod for the next five weeks. All changes  made to the mod from now on should occur only at the request of the SL,  and all requests for changes should be funneled through this person. No  team member should make any changes, no matter how minor, to the mod  unless the SL has requested that they make a particular change. This  doesn't mean the rest of the team are losing control of the mod; the SL  is still a part of the team, and will be listening to all feedback. The  point of the SL is to ensure that all changes to the mod are going  through a single person. This avoids problems such as a mapmaker  breaking the game by making a last minute change because he didn't  realize something else had changed in the game code. The SL will know  the state of every component in the game (code, maps, models, textures,  etc) at all times throughout the next 5 weeks to ensure this never  happens.

Choosing the SL isn't easy. Here are a few tips:



	
  * Don't immediately assume the person who's currently running the  mod is the best choice for SL, especially if the mod has been worked on  for months and hasn't got any closer to being released.

	
  * Game Coders are probably the best choice. As the shipping  process comes to an end, most fixes will be made in the game code.

	
  * The SL should be highly motivated, disciplined, organized, and  as ego-less as possible. The SL will need to be able to commit five  weeks of his or her life to this process.

	
  * The SL should be able to make global decisions for the mod.  The SL should understand that this often requires cutting features and  content in order to ship





### Establish a build process


You need to create a process by which you build your mod. Building is  the process of taking all your work and producing an installable,  working version of the mod (generally in the form of an install file).  This should be done exclusively by the SL for the next five weeks, and  the SL should have a strict process that is always followed. Creating a  strict process for this will ensure you don't waste hours tracking down  bugs that are simply a result of someone building in a different way  than the previous person.

The SL should maintain the final/release candidate version of the  mod from now on. All changes should be sent to him, and he should  incorporate them into his copy of the mod one by one and with a full  understanding of the impact of the changes on all parts of the mod.  Don't forget to backup your code and content regularly!

The SL should build the mod every day for playtests. More on that  later.




### Feature locking


Shipping is the process of locking down portions of your mod.  "Locked" means that the portion is not to be touched from then on. Bugs  found in locked portions of your mod should be thought about carefully.  Unless the bug is really important (showstopper), just note it down and  fix it in the next update of your mod. Regardless of the temptation to  make that one "easy fix", unlocking portions of your mod should be  avoided as much as possible.

At this point in the shipping process, five weeks out, you should  also be feature locked. This means you shouldn't be adding any new  features to your mod whatsoever. If part of your team is not involved in  shipping but wants to continue working on developing the mod, they  should be working in a separate content and code database. Most source  code control packages allow for branching of code in this fashion. (Yes,  we strongly recommend that you use some form of source control ). Every  change made to the mod from now on should be a bug fix. The SL should  ensure this. Even if a coder thinks of another cool feature that they  say will only take them 10 minutes to code, do not let them add it in.  Even if the coder sends the code, finished and bug-free, to the SL, do  not add it to the mod. Save it for the next version.

A healthy attitude for the SL to have is that every change to the  mod from now on will add two days to the release date.




### Playtesting


From now on, you should be running playtests every day, or every  second day if that's too much. Playtests should be based on installable  versions of the game, built by the SL. Don't let team members play from  their personal versions of the game. Everyone should be running a  version of the mod installed from a build sent out by the SL (that's  what your viewing public will be installing and using, that's what you  should be testing). You'll waste many hours on finding bugs caused by  incompatible versions if you don't do this.

To make this easier, the mod must be kept in a playable state at  all times. Get very, very worried for every day the mod isn't playable.  If a coder or mapmaker makes a change that breaks the mod, think about  it carefully before incorporating it into the SL's build. How long will  the game remain unplayable? How many playtests will you miss? How many  team members won't be able to work because the mod isn't running? Not  breaking the mod should be religion for the team.

When you do playtest, make sure as many of your team members are  playing as possible. Everyone working on the game should be playing it  regularly. Make sure you have some external players as well. Turn on  server console logging (set "log" to "on" in the server.cfg file). This  will dump all the output of the server into a file in the gamedir/logs  directory ( the name of the file will match the date). Whenever any  player in the game spots a bug, have them use their "say" key to say  "BUG: description of bug". Then, when the game is over, you can open up  the log file and get all the bugs out of it by searching for the word  "BUG."




### Bugs and changes


The SL should maintain a complete list of all bugs and changes, and  their current status. Preferably this should be done using some kind of  true database. E-mail is totally insufficient for tracking bugs; it's  just too easy for items to drop of the first page of a user's mailbox,  etc. After each playtest, the bugs and necessary changes from the log  file should be added to the list by the SL, and assigned to team  members. When a team member has fixed a bug or change, they should  submit the new content to the SL, who should verify that it is fixed and  then update the status on the bug list.

The bug list is a fantastic tool to evaluate how well you are  progressing. It can be used to find out who is overloaded with work, who  is underloaded, who is not fixing his bugs, which area of your mod is  farthest from completion, and so on. Don't remove anything from the bug  list, even when it has been fixed (though you should mark it as fixed in  some way, of course). It's very useful to see what bugs have been fixed  throughout the history of the project. Something might regress,  re-creating a bug, and knowing who fixed it last time makes it easy to  ask them what caused it. At the end of the project, you should be able  to see every bug fixed and every change made in your mod for the entire  shipping process. The SL shouldn't allow any bug fix or change into the  SL's master copy of the game unless the bug/change has been detailed in  the bug list.

There is software that will help you create and maintain a bug  list. Alternatively, a spreadsheet will work just fine. Again, e-mail is  a bad choice.




### Cut or defer broken features


The hardest, nastiest, and unfortunately most necessary part of  shipping is the act of being realistic and cutting features. We have a  saying at Valve that everyone will have their favorite feature cut from  the game. While it's not true, it does help everyone prepare themselves  for the fact that they will have features they like -- or that they  spent some to a lot of time on-- cut. Your game simply cannot have every  cool feature and still ship in a reasonable time frame. The SL should  make decisions about what to finish and what to cut, based on how far  along in the release process you are.

The closer you get to releasing, the more you should think about  each bug as you find it. Is the bug in a feature that absolutely must be  in this version? How many days will it take to fix this feature? Can  this feature be cut, or deferred to a later version?




### Work smart, not hard


As we've said over and over again, the shipping process is hard, and  it's even harder if you don't think carefully about what to work on.  Working a lot is no substitute for carefully choosing what to fix, what  to defer, and what to cut out altogether. The SL should be extremely  careful about which bugs/changes should be worked on, and by whom. Don't  spend a week fixing a minor problem in a feature just because the  feature is cool. Fix crash bugs (showstoppers). Fix bugs that utterly  prevent you from shipping the game. Fix bugs that are preventing other  team members from fixing their bugs. The SL should develop categories  for bugs to aid in making the right decisions. A good level of  granularity is Must Fix, Severe, Medium, Minor, Zero, Deferred.

As the project gets closer to shipping, the SL should be  carefully evaluating every bug that shows up. Remember, every bug that's  fixed creates more playtesting, and usually more bugs. If you are two  weeks from your release date, and you've got a bug that will take  someone three days and 500 lines of code to fix, you're not going to  make that release date unless you cut or defer that portion of the game.




## Three weeks out





### Content Locked


By now you should aim to be content complete. This means that all  content in the game is in a locked state, except for the game code  itself. All the maps, models, textures, sounds, HUD art, launcher art,  and so on should be finished and in the SL's master copy.




### Shutting down


This was mentioned at the five week mark, but it's even more  important now. The SL is the only person who should be touching the  master copy of the game, and he should simply be rolling in the bug  fixes from the coders, who should be fixing only the bugs the SL hands  them.




### Playtesting


The mod should be being playtested every day, for at least two hours.  Between now and when you ship, you want as many people as possible  hammering away at your mod. It's too late now to make any major game  design changes – don't even be tempted.




## One week out





### No last minute changes


The SL should be evaluating every change that has to be made, and  deciding whether they should be deferred to the next version. Again, a  healthy way to think about it is that every single change, even if it's a  single line of code, will add two days to the release date.




## Two day safe period


Once every bug that is going to be fixed has been fixed, and  everything else has been deferred, you're not done. Now you wait at  least 48 hours, during which time you should playtest like crazy. Try to  get everyone hammering away at the game for as much time as possible.  If you find any more bugs that have to be fixed, fix them, and start the  48 hours again.

If your mod passes 48 hours of heavy playtesting without finding  any new issues, you're ready to release!




## Post-release


So you've released, the players love it, and web pages everywhere are  talking about how much fun your mod is. Whether you're done now is up  to you. From our experiences in the on-line multiplayer field, a mod  only stays popular as long as it's supported. No matter how great your  mod is, it's not going to garner really significant player numbers with  its first version. Player numbers are grown over time through repeated  releases of new content, bug fixes, and of course, community support.  Both Counter-Strike and Team Fortress started out small and grew over  time. Each time they released a new version, more players tried them out  and started playing them.

Knowing what to fix, what to change, and how to listen to your  community is a continual learning process.

Good luck!
