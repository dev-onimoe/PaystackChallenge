## How to Install

1.  1.  Clone this repo to your local machine.
2.  2.  Navigate to the project directory after cloing and open .xcodeproj with Xcode.
3.  3.  press shift + option + command K to run a clean build on the project.
4.  4.  Let it build completely the first, do not interrupt even if you get errors along the line.
5.  5.  If you get an error regarding the Package.resolve, delete it by navigating to the project's directory and right clicking on the .xcodeproject -> show package contents -> project.xcworkspace -> xcshareddata -> swiftpm. then delete the Package.resolve file. Xcode will generate a new one.
6.  6.  Select a destination to run it to (Device or simulator)
7.  
