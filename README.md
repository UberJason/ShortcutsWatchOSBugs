#  Siri Voice Shortcut Bug in watchOS 5 beta 4

## This project used to show three now-closed bugs in watchOS 5 beta 2/3. It's been repurposed for a new bug in watchOS 5 beta 4.

## Prerequisites (do these first):
0. In iOS Settings.app, ensure developer settings for shortcuts testing are set ("Display Recent Shortcuts" and "Display Donations on Lock Screen").
1. Run the iOS app once, which triggers a donation and shows the shortcut on Spotlight.
2. Run the watchOS app once, which sets a relevant shortcut and shows the shortcut on Siri Watch Face.
3. In iOS Settings.app > Siri, create a voice shortcut for the "Do A foo" shortcut. The voice shortcut may be something like "Do It".

## Watch bug: invoking a shortcut via Siri voice runs the watchOS Intent Extension but does not trigger the WKIntentDidRunRefreshBackgroundTask in the WatchKit Extension. (Radar: [](https://bugreport.apple.com/web/?problemID=))
1. Debug the watchOS app, which attaches the debugger to the WatchKit Extension.
2. Go back to the Siri Watch Face, and invoke the shortcut, bringing up the confirmation dialog, and tap "Do".
3. Notice that the debugger prints "Intent did run" from the WatchKit Extension.
4. Invoke Siri by holding the digital crown, and then speak the voice shortcut (e.g. "Do It").
5. Notice that the debugger does NOT print "Intent did run" from the WatchKit Extension.

Note that the intent extension *does* run successfully from a Siri voice shortcut. To verify this:
1. Debug the watchOS shortcut in Xcode.
2. Invoke Siri by holding the digital crown, and then speak the voice shortcut (e.g. "Do It").
3. Notice that the debugger prints "Handled!", which is a print statement from the WatchIntentHandler.

## Note
(Note: debugging the iOS or watchOS shortcut means selecting the iOS or watchOS intent scheme in Xcode, running with Siri, and then launching the shortcut as mentioned above.)
(Note: debugging the watchOS extension means selecting the WatchKit App scheme in Xcode and running it.)
