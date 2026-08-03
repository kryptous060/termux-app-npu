package com.termux.app;

import android.app.Service;
import android.content.Intent;
import android.os.IBinder;
import com.chaquo.python.Python;
import com.chaquo.python.android.AndroidPlatform;

public class FastApiControllerService extends Service {
    @Override
    public void onCreate() {
        super.onCreate();
        // Run setup scripts
        try {
            String homeDirPath = new java.io.File(getFilesDir(), "home").getAbsolutePath();
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

        if (!Python.isStarted()) {
            Python.start(new AndroidPlatform(this));
        }
        // Assuming start_api in controller_api.py handles FastAPI startup
        Python.getInstance().getModule("controller_api").callAttr("start_api");
    }

    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        return START_STICKY;
    }
}
