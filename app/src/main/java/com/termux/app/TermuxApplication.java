package com.termux.app;

import android.app.Application;

import com.termux.shared.crash.TermuxCrashUtils;
import com.termux.shared.settings.preferences.TermuxAppSharedPreferences;
import com.termux.shared.logger.Logger;


public class TermuxApplication extends Application {
    public void onCreate() {
        super.onCreate();

        // Ensure binaries are set up on first run
        new Thread(() -> {
            String homeDirPath = new java.io.File(getFilesDir(), "home").getAbsolutePath();
            java.io.File llamaBin = new java.io.File(homeDirPath + "/llama.cpp/build/bin/llama-cli");
            java.io.File sdBin = new java.io.File(homeDirPath + "/stable-diffusion.cpp/build/bin/sd-cli");
            if (!llamaBin.exists() || !sdBin.exists()) {
                try {
                    java.io.File repoDir = new java.io.File(homeDirPath, "termux-app-npu");
                    if (!repoDir.exists()) {
                        repoDir = new java.io.File(homeDirPath, "Termux-app-npu");
                    }
                    String scriptsPath = repoDir.getAbsolutePath() + "/scripts/";
                    Runtime.getRuntime().exec(scriptsPath + "setup_llama.sh").waitFor();
                    Runtime.getRuntime().exec(scriptsPath + "setup_sd.sh").waitFor();
                    Runtime.getRuntime().exec(scriptsPath + "setup_gemini.sh").waitFor();
                    Runtime.getRuntime().exec(scriptsPath + "setup_interpreter.sh").waitFor();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }).start();

        // Set crash handler for the app
        TermuxCrashUtils.setCrashHandler(this);

        // Set log level for the app
        setLogLevel();
    }

    private void setLogLevel() {
        // Load the log level from shared preferences and set it to the {@link Logger.CURRENT_LOG_LEVEL}
        TermuxAppSharedPreferences preferences = TermuxAppSharedPreferences.build(getApplicationContext());
        if (preferences == null) return;
        preferences.setLogLevel(null, preferences.getLogLevel());
        Logger.logDebug("Starting Application");
    }
}

