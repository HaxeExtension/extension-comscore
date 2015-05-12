# comScore

Provides access to [comScore](http://www.comscore.com/) Analytics library on iOS. Currently, Android is not supported.

# Installation

This library is not currently available on Haxelib, so for now install with:

    haxelib git comscore https://github.com/steverichey/comscore

You also need to include the following files from the comScore SDK manually, as they are copyrighted.

    iOS/comScore-iOS-ARMV7_ARMV7S_ARM64-2-5/comScore/headers/*.h   -> comscore/native/iphone/include
    iOS/comScore-iOS-ARMV7_ARMV7S_ARM64-2-5/comScore/libcomScore.a -> comscore/native/libs

You can then build the `.ndll` files with `sh rebuild` (Mac/Linux) or `lime rebuild ./native ios -clean`.

Don't forget to add the following line to your `Project.xml`:

	<haxelib name="comscore" if="ios" />

Then you can call comScore methods pretty easily:

	import extension.comscore;

	...

	ComScore.setCustomerC2("MY_CLIENT_ID");

# License

All code in this repository &copy; 2015 [Steve Richey](https://github.com/steverichey) is shared under an [MIT license](https://tldrlegal.com/license/mit-license). See [license.md](./license.md) for details. All code in the comScore SDK is &copy; 2014 comScore, Inc.
