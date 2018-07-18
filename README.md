#  Siri Shortcut Bugs in watchOS 5 beta 2

## UPDATE July 18
An Apple engineer helped to determine my project was incorrectly configured. There were two missing steps:
1) The NSUserActivityTypes need to be added to the WatchKit App target 
2) The intents definition file should also be added to the WatchKit App target 

This project is now updated with those changes and verified that all three issues are now solved!

This sample project shows _three_ bugs in watchOS 5 beta 2 related to custom Intents and Siri Shortcuts. I have filed three radars, one for each one, but all three reference this sample project. To see the bugs, please perform the Preqrequisites, then go to the corresponding section and perform those steps.

## Prerequisites (do these first):
0. In iOS Settings.app, ensure developer settings for shortcuts testing are set ("Display Recent Shortcuts" and "Display Donations on Lock Screen").
1. Run the iOS app once, which triggers a donation and shows the shortcut on Spotlight.
2. Run the watchOS app once, which sets a relevant shortcut and shows the shortcut on Siri Watch Face.

## First watch bug: a shortcut on watchOS handles successfully but shows error UI. (Radar: [41296288](https://bugreport.apple.com/web/?problemID=41296288))
1. Debug the iOS shortcut from Spotlight: notice that it handles correctly and then shows the success UI correctly.
2. Debug the watchOS shortcut from the Siri Watch Face: notice that it handles successfully (prints "Handled!") but shows the UI "There was a problem. Try again...".

## Second watch bug: if the `confirm(intent:completion:)` method is implemented, the `handle(intent:completion:)` method is not called when running a shortcut. (Radar: [41296444](https://bugreport.apple.com/web/?problemID=41296444))
1. Debug the iOS shortcut from Spotlight: notice that it confirms and handles successfully (prints "Confirmed!" and "Handled!")
2. Debug the watchOS shortcut from the Siri Watch Face: notice that it handles successfully (prints "Handled!"), and shows the UI "There was a problem. Try again..."
3. In WatchIntentHandler.swift, uncomment lines 20-23, implementing `confirm(intent:completion:)`
4. Rebuild and debug the watchOS shortcut from the Siri Watch Face again: this time, it confirms (prints "Confirmed!") but never calls `handle(intent:completion:)`.

## Third watch bug: No methods on ExtensionDelegate for resuming from an Intent are called when the user taps on an Intent confirmation to adjust details. (Radar: [41334278](https://bugreport.apple.com/web/?problemID=41334278))
1. Debug the watchOS app, setting breakpoints in ExtensionDelegate's `handle(intent:completionHandler:)`, `handle(userActivity:)`, and `handleUserActivity(userInfo:)` methods.
2. Go back to the Siri Watch Face, and invoke the shortcut, bringing up the confirmation dialog.
3. Instead of tapping "Do", tap on the intent platter itself to launch the watch app. Observe that none of the breakpoints in the three ExtensionDelegate methods are triggered, and none of the print statements print. The app simply resumes.

## Note
(Note: debugging the iOS or watchOS shortcut means selecting the iOS or watchOS intent scheme in Xcode, running with Siri, and then launching the shortcut as mentioned above.)
