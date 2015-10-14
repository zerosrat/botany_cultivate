package com.innovation.tencent.botany_cultivate.ui.activity;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;

import com.innovation.tencent.botany_cultivate.R;
import com.innovation.tencent.botany_cultivate.utils.ThreadPoolUtil;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Task task2 = new Task("task2", 100);
        Task task1 = new Task("task1", 100);
        ThreadPoolUtil.getLongPool().execute(task1);
        ThreadPoolUtil.getLongPool().execute(task2);



    }

    public class Task implements Runnable {
        private String name;
        private int time;

        public Task(String name, int time) {
            this.name = name;
            this.time = time;
        }
        @Override
        public void run() {
            Log.d("MainActivity","test....................");
            for (int i = 0; i < time; i++) {
                int t = time - i;
                try {
                    Thread.sleep(100);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                System.out.println(name + ":" + "剩下" + t + "s");
            }
        }
    }
}
