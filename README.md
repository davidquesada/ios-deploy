ios-deploy
==========
Install and debug iOS apps without using Xcode. Designed to work on un-jailbroken devices.

This is a modification of phonegap/ios-deploy to use libimobiledevice for iOS device interface,
rather than Apple's library, which is only available on Windows and OS X.

## Requirements

* Currently only tested on Linux Mint 17.1 with new builds of libimobiledevice, libplist,
libusbmuxd, and usbmuxd.

#### Build
* libimobiledevice-dev (version 1.2.0 recommended)
* libplist

#### Extras
* ideviceinstaller (optional, used for deploying apps)
* ios-lldb\* (optional, used for debugging apps)
* DeveloperDiskImage.dmg (optional, needed for debugging)

\*On non-Apple systems, ios-deploy will use 'ios-lldb' as a debugger. This should point to a
build of LLDB that supports the 'remote-ios' platform.

## Usage

    Usage: ios-deploy [OPTION]...
      -d, --debug                  launch the app in GDB after installation
      -i, --id <device_id>         the id of the device to connect to
      -c, --detect                 only detect if the device is connected
      -b, --bundle <bundle.app>    the path to the app bundle to be installed
      -a, --args <args>            command line arguments to pass to the app when launching it
      -t, --timeout <timeout>      number of seconds to wait for a device to be connected
      -u, --unbuffered             don't buffer stdout
      -n, --nostart                do not start the app when debugging
      -I, --noninteractive         start in non interactive mode (quit when app crashes or exits)
      -L, --justlaunch             just launch the app and exit lldb
      -v, --verbose                enable verbose output
      -m, --noinstall              directly start debugging without app install (-d not required)
      -p, --port <number>          port used for device, default: 12345 
      -r, --uninstall              uninstall the app before install (do not use with -m; app cache and data are cleared) 
      -1, --bundle_id <bundle id>  specify bundle id for list and upload
      -l, --list                   list files
      -o, --upload <file>          upload file
      -w, --download               download app tree
      -2, --to <target pathname>   use together with up/download file/tree. specify target
      -V, --version                print the executable version 

## Examples

The commands below assume that you have an app called `my.app` with bundle id `bundle.id`. Substitute where necessary.

    // deploy and debug your app to a connected device
    ios-deploy --debug --bundle my.app

    // deploy and launch your app to a connected device, but quit the debugger after
    ios-deploy --justlaunch --debug --bundle my.app

    // deploy and launch your app to a connected device, quit when app crashes or exits
    ios-deploy --noninteractive --debug --bundle my.app

    // Upload a file to your app's Documents folder
    ios-deploy --bundle_id 'bundle.id' --upload test.txt --to Documents/test.txt
    
    // Download your app's Documents, Library and tmp folders
    ios-deploy --bundle_id 'bundle.id' --download --to MyDestinationFolder

    // List the contents of your app's Documents, Library and tmp folders
    ios-deploy --bundle_id 'bundle.id' --list

    // deploy and debug your app to a connected device, uninstall the app first
    ios-deploy --uninstall --debug --bundle my.app
