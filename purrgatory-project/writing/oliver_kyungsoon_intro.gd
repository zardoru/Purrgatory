extends Node

var raw_blocks = [
["talk_to_kyungsoon","_none","_none","_pass","","","met_kyungsoon",['ks_choice', 'kyungsoon_intro']],
["ks_choice","","","_pass","","","asked_ks_about_door",['ks_c2', 'ks_c3']],
["ks_c2","","","_pass","","","checked_out_book",['ks_c4', 'kyungsoon_thought']],
["ks_c3","","","_pass","","","tried_door",['ks_door', 'ks_c5']],
["ks_c4","","","_pass","","","got_commons_key",['ks_after', 'ks_book_c1']],
["ks_c5","","","_pass","","","checked_out_book",['ks_door', 'kyungsoon_thought']],
["kyungsoon_intro","you","kyungsoon_neutral","hello","",[['met_kyungsoon', true]],"",""],
["","???","","hey","","","",""],
["","","","you're new","","","",""],
["","you","","yep","","","",""],
["","???","","…","","","",""],
["","you","","what's your name?","","","",""],
["","???","","kyungsoon.","","","",""],
["","","","",[['nice to meet you', 'kyungsoon_meet'], ['are you ok?', 'kyungsoon_ok']],"","",""],
["kyungsoon_meet","you","","nice to meet you, kyungsoon.","","","",""],
["","kyungsoon","","…","","","",""],
["","_none","","she seems to be lost in thought.","","","","null"],
["kyungsoon_ok","you","","are you, like, okay?","","","",""],
["","kyungsoon","","yeah","","","",""],
["","you","","okay","","","",""],
["","kyungsoon","","…","","","",""],
["","_none","","she seems to be lost in thought.","","","","null"],
["kyungsoon_thought","kyungsoon","","that's a cat","","","",""],
["","you","","sure is","","","",""],
["","kyungsoon","","…","","","",""],
["","_none","","seems like that's all she has to say on the matter.","","","","null"],
["talk_to_oliver","_none","_none","_pass","","","met_oliver",['oliver_choice', 'oliver_intro']],
["oliver_choice","","","_pass","","","book_state",['oliver_choice_2', 'oliver_go_on']],
["oliver_choice_2","","","_pass","","","oliver_questioned",['oliver_c3', 'oliver_books']],
["oliver_c3","","","_pass","","","got_commons_key",['oliver_after', 'oliver_c4']],
["oliver_c4","","","_pass","","","fed_book",['oliver_drama', 'oliver_chat_choice']],
["oliver_intro","???","oliver_neutral","oh, hello! you must be new!","",[['met_oliver', true]],"",""],
["","","","allow me to introduce myself. my name is oliver.","","","",""],
["","oliver","","i'm the librarian here.","","","",""],
["","you","","i'm $player.","","","",""],
["","","","",[['nice to meet you!', 'oliver_nice'], ['librarian?', 'oliver_librarian']],"","",""],
["oliver_nice","you","","nice to meet you!","","","",""],
["","oliver","","and you as well!","","","","oliver_librarian_end"],
["oliver_librarian","you","","purrgatory has a librarian?","","","",""],
["","oliver","","well, not officially. this library was already here when i showed up. but it was in such a state of disarray i had to do something about it!","","","",""],
["","","","what you see before you is the product of many hours of shelving and dusting.","","","",""],
["","_none","","he looks very proud about this.","","","",""],
["","","","",[['it\'s very clean!', 'oliver_clean'], ['don\'t you have anything better to do?', 'oliver_anything_better']],"","",""],
["oliver_clean","you","","it's very clean!","","","",""],
["","oliver","","well, thank you very much!","","","","oliver_librarian_end"],
["oliver_anything_better","you","","don't you have anything better to do?","","","",""],
["","oliver","","well… keeping the library tidy is important… right?","","","",""],
["","","","at least i'm doing [i]something[/i] instead of just sitting around, like certain people.","","","",""],
["oliver_librarian_end","oliver","","anyway, feel free to browse around! just let me know if you find something you'd like to check out.","","","",""],
["","you","","will do.","","","",""],
["","_none","","oliver steps back and watches you expectantly.","","","","null"],
["read_book","_none","_none","_pass","","","book_state_2",['book3', 'book_choice']],
["book_choice","","","_pass","","","book_state",['book2', 'book1']],
["book1","_none","","you grab a book from the shelves.","","","",""],
["","_none","book","it's just the word \"meow\" over and over.","",[['book_state', true]],"",""],
["","oliver","","oh, i forgot to mention, our collection is a bit… limited.","","","",""],
["","you","","i see.","","","",""],
["","_none","","maybe you should try a different book.","","","","null"],
["book2","_none","book","this book is exactly the same as the other one.","",[['book_state_2', true]],"","null"],
["book3","_none","book","you \"read\" one of the \"books.\"","","","","null"],
["oliver_go_on","oliver","oliver_neutral","don't be afraid to browse the books!","","","",""],
["","you","","okay!","","","","null"],
["oliver_books","you","oliver_neutral","…are all the books like this?","",[['oliver_questioned', true]],"",""],
["","oliver","","well, yes, i'm afraid so.","","","",""],
["","","","at least, as far as we know! i haven't been able to catalog the entire collection yet, so there could be some hidden gems in there!","","","",""],
["","","","",[['seems unlikely', 'oliver_doubt'], ['catalog?', 'oliver_catalog'], ['hehe. cat-alog.', 'oliver_pun']],"","",""],
["oliver_doubt","you","","seems unlikely. it looks like this place is designed to be as boring as possible.","","","",""],
["","oliver","","ah. perhaps…","","","",""],
["","","","that is an opinion shared by many in this place.","","","",""],
["","","","regardless, it doesn't hurt to be thorough.","","","","oliver_pattern"],
["oliver_pun","you","","hehe. cat-alog.","","","",""],
["","oliver","","heh, yes, i am [i]cat[/i]-aloging the library.","","","","oliver_catalog_2"],
["oliver_catalog","you","","you're making a catalog?","","","",""],
["oliver_catalog_2","oliver","","take a look! i hit 15,000 yesterday!","","","",""],
["","_none","catalog","oliver shows you the catalog.","","","",""],
["","oliver","","by my estimate, that's more than 2% of the books in the library. still a lot of work to be done!","","","",""],
["","you","","oh, wow","","","",""],
["oliver_pattern","","oliver_neutral","if you don't mind me asking… what are you looking for, exactly?","","","",""],
["","oliver","","well, you see…","","","",""],
["","","","i like to imagine that there's a pattern.","","","",""],
["","","","some sort of rhyme or reason. a lexicon that explains what all the nonsense means, or at least where it came from","","","",""],
["","","","after all, even a code of one word is a code that can be broken!","","","",""],
["","","","a language just begging to be understood!","","","",""],
["","","","",[['i hope you figure it out', 'oliver_hope'], ['(skeptical silence)', 'oliver_skeptical']],"","",""],
["oliver_hope","you","","i hope you figure it out!","","","",""],
["","oliver","","thank you, thank you.","","","",""],
["","","","i'm glad you understand.","","","",""],
["","","","it might be a lot of work, but when i discover the method behind the madness, it'll all be worth it.","","","","oliver_pattern_end"],
["oliver_skeptical","_none","","you glance skeptically at the bookshelves","","","",""],
["","oliver","","haha. well. that's... what i hope, anyway.","","","",""],
["","","","sounds pretty silly when i say it out loud.","","","",""],
["","","","um. forget i said anything.","","","",""],
["oliver_pattern_end","oliver","","anyway, did you find anything you'd like to check out?","","","",""],
["","","","",[['this book', 'oliver_check_out'], ['you', 'oliver_flirt'], ['no thanks', 'oliver_no_thanks']],"","",""],
["oliver_no_thanks","you","","no thanks.","","","",""],
["","oliver","","ah, that's ok. but let me know if you find something you like, okay?","","","",""],
["","you","","alright","","","",""],
["","oliver","","and before i forget…","","","",""],
["","","","welcome to purrgatory ^^","","","",""],
["","you","","thanks!","","","","null"],
["oliver_flirt","you","","the only thing I'm checking out is you ;3","","","",""],
["","oliver","","uh, sorry?","","","",""],
["","","","",[['you know what i mean', 'oliver_flirt_more'], ['never mind, sorry', 'oliver_never_mind']],"","",""],
["oliver_flirt_more","you","","you know what i mean ;3333","","","",""],
["","oliver","","ahem. i, uh, i'm not sure that i do.","","","",""],
["","","","",[["let's get freaky", 'oliver_oh_god'], ['never mind, sorry', 'oliver_never_mind']],"","",""],
["oliver_oh_god","you","","let's get freaky babyyyy","","","",""],
["","oliver","","i think, uh","","","",""],
["","","","i think i need to… attend to some business… elsewhere in the library.","","","",""],
["","_none","","oliver leaves.","",[['oliver_why', 'true']],"","null"],
["","","","","","","",""],
["oliver_never_mind","you","","never mind, sorry.","","","",""],
["","oliver","","ah, it's ok. but do let me know if you'd like to check something out. ","","","",""],
["","","","that is, if you -- if you'd like to check [i]a book[/i] out.","","","",""],
["","you","","right.","","","","null"],
["oliver_chat_choice","_none","_none","_pass","","","checked_out_book",['oliver_chat_2', 'oliver_chat_1']],
["oliver_chat_1","oliver","oliver_neutral","hello again! looking to check out a book?","","","tried_door",['oliver_chat_1b', 'oliver_chat_1a']],
["oliver_chat_1a","","","",[['nah, just browsing', 'oliver_browsing'], ['yes please', 'oliver_check_out']],"","",""],
["oliver_chat_1b","","","",[['nah, just browsing', 'oliver_browsing'], ['yes please', 'oliver_check_out'], ['how do i unlock the door outside?', 'oliver_commons_door']],"","",""],
["oliver_chat_2","oliver","","hello again! can i do something for you?","","","tried_door",['oliver_chat_2b', 'oliver_hi']],
["oliver_chat_2b","","","",[['just checking in', 'oliver_hi'], ['how do i unlock the door outside?', 'oliver_commons_door']],"","",""],
["oliver_browsing","you","","nah, just browsing.","","","",""],
["","oliver","","ah, alright. well, don't let me distract you.","","","",""],
["","","","i'll just be over here. cataloging.","","","","null"],
["oliver_check_out","you","","yes please, can i check out this one?","",[['checked_out_book', true]],"",""],
["","oliver","","oh, wonderful! let me just make a note in the catalog.","","","",""],
["","","","i didn't actually expect you to -- well -- never mind that.","","","",""],
["","","","let me see… where did i put my stamp?","","","",""],
["","","","uhhhhh, ok, forget the stamp, i'll just write it down for you","","","",""],
["","","","this book is due back on…","","","",""],
["","","","well, we don't really have dates down here, do we","","","",""],
["","","","and there's nothing i can do if you're late","","","",""],
["","","","uhhh sdlfjs","","","",""],
["","","","just try to bring it back eventually, okay?","","","",""],
["","you","","haha, okay","","","",""],
["","_none","","oliver writes \"Due date: Eternity\" on a slip of paper and tucks it into the book.","","","",""],
["","oliver","","sorry about all that! enjoy your book!!","","","",""],
["","you","","no problem.","","","","null"],
["oliver_hi","you","","just stopping by to say hi.","","","",""],
["","oliver","","well hello to you too!","","","",""],
["","","","how are you finding your book?","","","",""],
["","you","","it's, uh…","","","",""],
["","","","",[['scintillating', 'oliver_scintillating'], ['meditative', 'oliver_alright'], ['boring', 'oliver_boring']],"","",""],
["oliver_scintillating","you","","scintillating.","","","",""],
["","oliver","","ooh, nice word!","","","",""],
["","","","i'll admit, i didn’t expect you to find it so interesting, but i'm glad you're enjoying it!","","","","null"],
["oliver_alright","you","","meditative.","","","",""],
["","oliver","","ah, yes.","","","",""],
["","","","it is quite calming reading these books, sometimes.","","","","null"],
["oliver_boring","you","","boring, honestly.","","","",""],
["","oliver","","ah, well.","","","",""],
["","","","i suppose it does get a bit same-y after a while.","","","","null"],
["oliver_commons_door","oliver","","you mean the door in the commons? it's usually unlocked.","","","",""],
["","","","i think kyungsoon is holding onto the key.","","","",""],
["","you","","ok, thanks","","","","null"],
["try_door","_none","_none","_pass","","","got_commons_key",['try_door1', 'try_door2']],
["try_door1","","","you open the door… (placeholder)","","","","null"],
["try_door2","","","the door is locked.","",[['tried_door', true]],"","null"],
["ks_door","you","kyungsoon_neutral","hey, do you know how to unlock the door on the other side of the room?","",[['asked_ks_about_door', true]],"",""],
["","kyungsoon","","the commons door?","","","",""],
["","you","","yeah","","","",""],
["","kyungsoon","","yep","","","",""],
["","you","","how?","","","",""],
["","kyungsoon","","i have the key","","","",""],
["","you","","can i have it?","","","",""],
["","kyungsoon","","no","","","",""],
["","you","","why not?","","","",""],
["","kyungsoon","","i ate it","","","",""],
["","you","","…","","","",""],
["","kyungsoon","","…","","","",""],
["","you","","like you actually ate it?","","","",""],
["","kyungsoon","","yeah","","","",""],
["","you","","why?","","","",""],
["","kyungsoon","","I was hungry","","","",""],
["","you","","i see","","","","null"],
["ks_book_c1","_none","_none","_pass","","","fed_book",['ks_whats_up', 'ks_book_c2']],
["ks_book_c2","","","_pass","","","saw_book",['ks_book2', 'ks_book1']],
["ks_book1","_none","kyungsoon_neutral","kyungsoon eyes your book as you approach","",[['saw_book', true]],"",""],
["","kyungsoon","","is that a book?","","","",""],
["","you","","yep","","","",""],
["","kyungsoon","","can i have some?","","","",""],
["","","","",[["yes", 'ks_yes'], ["what no", 'ks_no']],"","",""],
["ks_no","you","","what? no","","","",""],
["","kyungsoon","","ok, i was just asking.","","","","null"],
["ks_yes","you","","uh, sure?","","","","ks_give_book"],
["ks_book2","_none","","kyungsoon stares at the book.","","","",""],
["","","","",[["okay, you can have it", 'ks_give_book'], ["never mind", 'ks_never_mind']],"","",""],
["ks_never_mind","you","","never mind","","","",""],
["","kyungsoon","","k","","","","null"],
["ks_whats_up","you","","what's up","","","",""],
["","kyungsoon","","it's purrgatory","","","",""],
["","","","nothing's ever up","","","",""],
["","","","*munch munch*","","","",""],
["","","","",[['right', 'ks_right'], ['what about the poetry slam', 'ks_slam']],"","",""],
["ks_right","you","","right","","","","null"],
["ks_slam","you","","there was a poetry slam recently, by the looks of it","","","",""],
["","kyungsoon","","ha","","","",""],
["","","","that was elijah's idea.","","","",""],
["","","","only oliver showed up. elijah cried afterward.","","","",""],
["","you","","oh","","","",""],
["","","","where were you?","","","",""],
["","kyungsoon","","here.","","","",""],
["","you","","like, across the room from the slam? just watching?","","","",""],
["","kyungsoon","","yeah","","","","null"],
["ks_give_book","you","","here you go","",[['fed_book', true]],"",""],
["","kyungsoon","","ah sweet","","","",""],
["","_none","","you hand over the book. kyungsoon opens it, tears off some paper with her teeth, and starts to chew.","","","",""],
["","kyungsoon","","*munch munch* mmm","","","",""],
["","","","oliver never let me have any books, even though he has, like, a million.","","","",""],
["","","","barely even talks to me anymore.","","","",""],
["","","","",[["because you're weird", 'ks_weird'], ["maybe he's… booked", 'ks_booked'], ["that's too bad", 'ks_too_bad']],"","",""],
["ks_weird","you","","probably because you're weird.","","","",""],
["","kyungsoon","","whatever.","","","",""],
["","","","*munch munch*","","","",""],
["","_none","","seems like she's done with the conversation.","","","","null"],
["ks_booked","you","","maybe he's [i]booked[/i]","","","",""],
["","kyungsoon","","…","","","",""],
["","you","","get it?","","","",""],
["","kyungsoon","","yes","","","",""],
["","","","",[["i thought hyenas laughed", 'ks_laugh'], ["forget it", 'ks_forget_it']],"","",""],
["ks_laugh","you","","i thought hyenas were supposed to laugh","","","",""],
["","kyungsoon","","i thought jokes were supposed to be funny","","","",""],
["","you","","ouch","","","","null"],
["ks_forget_it","you","","forget it.","","","",""],
["","kyungsoon","","k","","","",""],
["","","","*munch munch*","","","","null"],
["ks_too_bad","you","","that's too bad. it must be lonely here.","","","",""],
["","kyungsoon","","i guess.","","","",""],
["","","","*munch munch*","","","",""],
["","_none","","seems like she's done with the conversation.","","","","null"],
["oliver_drama","_none","oliver_neutral","oliver looks concerned.","","","",""],
["","oliver","","hello again! sorry to pry, but, where's the book you checked out?","","","",""],
["","","","",[["I let kyungsoon eat it", 'drama_eat'], ["I left it outside", 'drama_left'], ["noneya business", 'drama_noneya']],"","",""],
["drama_eat","you","","kyungsoon wanted to eat it, so I gave it to her.","","","",""],
["","oliver","","WHAT","","","",""],
["","_none","","oliver dashes outside.","",[["drama_ongoing", true]],"","null"],
["drama_left","you","","oh, I just left it outside","","","",""],
["","oliver","","oh no! I should have told you earlier, but there's something you should know about kyungsoon.","","","",""],
["drama_er","","","she, uh, she... eats books if left unattended so uhh","","","",""],
["","","","uhhhhh maybe I should just check on her, one second","","","",""],
["","_none","","oliver dashes outside.","",[["drama_ongoing", true]],"","null"],
["drama_noneya","you","","that's none of your business.","","","",""],
["","oliver","",":c","","","",""],
["","","","well, like I said, I didn't mean to pry, but there's something I didn't tell you about kyungsoon.","","","","drama_er"],
["drama_start","oliver",['oliver_neutral', 'kyungsoon_neutral'],"kyungsoon.","","","",""],
["","kyungsoon","","hi","","","",""],
["","oliver","","what are you chewing on, if i may ask?","","","",""],
["","kyungsoon","","nothing.","","","",""],
["","oliver","","you're [i]clearly[/i] chewing on something.","","","",""],
["","_none","","kyungsoon swallows.","","","",""],
["","kyungsoon","","am not","","","",""],
["","oliver","","):<","","","",""],
["","","","would you mind opening your jacket?","","","",""],
["","kyungsoon","","no","","","",""],
["","oliver","","kyungsoon, i can clearly see the outline of the book under your jacket!","","","",""],
["","kyungsoon","","maybe I'm just happy to see you.","","","",""],
["","oliver","","you can't keep destroying library property like this, kyungsoon. these books are valuable and, what's more, irreplacable!","","","",""],
["","kyungsoon","","more like irritating.","","","",""],
["","you","","nice","","","",""],
["","oliver","","$player, do something! talk to her!","","","",""],
["","","","",[["defend kyungsoon", "drama_defend_ks"], ["defend oliver", "drama_defend_ol"]],"","",""],
["drama_defend_ks","you","","i think you should just let her eat it, oliver. you have a million others, anyway.","",[['defended_ks', true]],"",""],
["","oliver","","what?!","","","",""],
["","","","i can't just stand there and watch someone deface a book! that's like a cardinal sin!","","","",""],
["","kyungsoon","","you would know about cardinal sin.","","","",""],
["","oliver","","hey, what is that supposed to mean?","","","",""],
["","kyungsoon","","just saying","","","",""],
["","","","worst thing [i]i've[/i] ever done is eat a book.","","","",""],
["","oliver","","that is a low blow, kyungsoon!","","","",""],
["","kyungsoon","","yeah, you would know about low blows.","","","",""],
["","oliver","","ARGH","","","",""],
["","","","",[['take it easy, oliver', 'drama_easy'], ["(stay out of this, it's not your business)", 'drama_out']],"","",""],
["drama_easy","you","","hey, oliver, take it easy. it's just a book.","","","",""],
["","oliver","","i can't believe you're siding with her! you're the one who checked out this book!","","","",""],
["","you","","i'm just trying to defuse the situation! maybe you should take some time to cool down.","","","",""],
["","_none","","oliver takes a deep breath.","","","",""],
["","oliver","","you're right. i need to cool down.","","","",""],
["","","","i'm going to go… dust some shelves.","","","",""],
["","_none","kyungsoon_neutral","oliver stomps into the library.","","","","drama_aftermath"],
["drama_out","oliver",['oliver_neutral', 'kyungsoon_neutral'],"listen, kyungsoon, i've had enough of your layabout, property-stealing nonsense!","","","",""],
["","","","this is the last time you're ever going to get your hands on one of my books!","","","",""],
["","kyungsoon","","k","","","",""],
["","oliver","","and, and you'd better not show your face in the library again!","","","",""],
["","kyungsoon","","k","","","",""],
["","_none","kyungsoon_neutral","oliver huffs and stomps into the library.","","","",""],
["drama_aftermath","kyungsoon","","…","","","",""],
["","you","","…","","","",""],
["","_none","","kyungsoon quietly takes out the book and tears off another page with her teeth.","","","",""],
["","you","","sorry about that.","","","",""],
["","kyungsoon","","not your fault.","","","",""],
["","you","","ok","","","",""],
["","_none","","kyungsoon rummages around in her pockets and pulls out a key.","","","",""],
["","kyungsoon","","here.","","","",""],
["","you","","what's this?","","","",""],
["","kyungsoon","","commons key.","","","",""],
["","you","","oh, thanks.","","","",""],
["","kyungsoon","","mhm.","","","",""],
["","","","",[["why did you say you ate it?", 'drama_ate'], ["why are you giving this to me?", 'drama_give']],"","",""],
["drama_ate","you","","why'd you tell me you ate it?","","","",""],
["","kyungsoon","","i don't know","","","",""],
["","","","didn't want you to leave","","","",""],
["","you","","oh","","","",""],
["","kyungsoon","","…","","","",""],
["","you","","i'll come back","","","",""],
["","kyungsoon","","cool","","","",""],
["","","","*munch munch*","",[["drama_ongoing", false], ["got_commons_key", true]],"","null"],
["drama_give","you","","why are you giving it to me now?","","","",""],
["","kyungsoon","","idk","","","",""],
["","","","you gave me the book","","","",""],
["","you","","oh, fair","","","",""],
["","kyungsoon","","yep","","","",""],
["","","","*munch munch*","",[["drama_ongoing", false], ["got_commons_key", true]],"","null"],
["drama_defend_ol","you",['oliver_neutral', 'kyungsoon_neutral'],"just give the book back, kyungsoon.","",[['defended_ol', true]],"",""],
["","kyungsoon","","you're the one who gave it to me.","","","",""],
["","oliver","","did you really?","","","",""],
["","","","",[["yes", 'drama_yes'], ["no", 'drama_no']],"","",""],
["drama_yes","you","","…yes.","","","","drama_either"],
["drama_no","you","","…no.","","","","drama_either"],
["drama_either","oliver","","…","","","",""],
["","oliver","","it's okay. i know you only checked it out for my sake.","","","",""],
["","you","","i'm sorry, oliver. i didn't know it mattered that much to you.","","","",""],
["","oliver","","it's okay. not a lot of people take a genuine interest in my work, so i appreciate you at least playing along.","","","",""],
["","","","",[["i do have a genuine interest!", 'drama_interest'], ["sorry", 'drama_sorry']],"","",""],
["drama_interest","you","","i do have a genuine interest! i really want to know what those books mean.","",[['took_interest_in_books', true]],"",""],
["","oliver","","really?","","","",""],
["","","","well… in that case, maybe we can discuss it later?","","","",""],
["","you","","i'd like that.","","","",""],
["","oliver","","wonderful.","","","","drama_end"],
["drama_sorry","you","","sorry again…","","","","drama_end"],
["drama_end","","","in any case… kyungsoon. book.","","","",""],
["","kyungsoon","","fine.","","","",""],
["","_none","","kyungsoon pulls the soggy, torn book out from within her jacket. something metallic clatters to the ground.","","","",""],
["","_none","","it's a small, silver key.","","","",""],
["","you","","what's this?","","","",""],
["","kyungsoon","","commons key.","","","",""],
["","you",""," you said you ate it!","","","",""],
["","_none","","kyungsoon avoids your gaze.","","","",""],
["","oliver","","i have to run this book by the preservation cabinet asap. ","","","",""],
["","","","you better not do this again, kyungsoon!","","","",""],
["","kyungsoon","","whatever.","","","",""],
["","_none ","kyungsoon_neutral","oliver runs off, and kyungsoon slumps against the wall once more.","","","",""],
["","_none ","","you decide to keep the key.","",[["drama_ongoing", false], ["got_commons_key", true]],"","null"],
["ks_after","kyungsoon","kyungsoon_neutral","(placeholder)","","","","null"],
["oliver_after","oliver","oliver_neutral","(placeholder) you know, i've been thinking about sorting these alphabetically…","","","","null"]
]