# SiriKit Template
 Template for SiriKit for iOS

## Purpose
Easy to use template for reference when creating SiriKit apps

## Usage
Create a new target and search for `Intents Extension`. You can name it whatever you want and you can select "Create IntentsUI target" as well.

Then create a new file and select the Intents file. Make sure all **3** targets are selected for this intent file's membership: the main app folder and the two Intent target Extensions

In your Info.plist, add a description to the key: `Privacy - Siri Usage Description`

Go to `Signings & Capabilities` in the main app target. Here, you need to add Siri and App Groups. When adding App Groups, you should create a new group using the following naming convention: `group.appName.teamName`. Make sure to copy this! Add the App Groups capabilities to the Intent and IntentUI target extensions too!

Using `let data = UserDefaults(suiteName: "APPGROUPSNAMETHATYOUCOPIED")`, you can create an umbrella UserDefaults system that will help you communicate between the app and the targets.
