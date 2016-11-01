package org.openfl.extension.comscore;

import android.os.Bundle;
import android.util.Log;

import org.haxe.extension.Extension;
import com.comscore.analytics.comScore;

public class ExtensionComScore extends Extension {

    public static void setCustomerC2(final String clientID) {
        mainActivity.runOnUiThread(new Runnable() {
            @Override
            public void run() {
                comScore.setCustomerC2(clientID);
			}
		});
    }

    public static void setPublisherSecret(final String publisherSecret) {
        mainActivity.runOnUiThread(new Runnable() {
            @Override
            public void run() {
                comScore.setPublisherSecret(publisherSecret);
			}
		});
    }

    public static void enableAutoUpdate(final int interval, final boolean foregroundOnly) {
        mainActivity.runOnUiThread(new Runnable() {
            @Override
            public void run() {
                comScore.enableAutoUpdate(interval, foregroundOnly);
			}
		});
    }

    public static void setAppContext () {
        mainActivity.runOnUiThread(new Runnable() {
            @Override
            public void run() {
                comScore.setAppContext(mainContext);
			}
		});
    }

    public static void onEnterForeground () {
        mainActivity.runOnUiThread(new Runnable() {
            @Override
            public void run() {
                comScore.onEnterForeground();
			}
		});
    }

    public static void onExitForeground () {
        mainActivity.runOnUiThread(new Runnable() {
            @Override
            public void run() {
                comScore.onExitForeground();
			}
		});
    }
}