package com.innovation.tencent.botany_cultivate.ui.activity;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.TextView;

import com.innovation.tencent.botany_cultivate.R;
import com.innovation.tencent.botany_cultivate.net.NetTask;
import com.innovation.tencent.botany_cultivate.utils.ThreadPoolUtil;

import org.json.JSONException;
import org.json.JSONObject;

public class MainActivity extends AppCompatActivity {
    private TextView tv;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        tv = (TextView) findViewById(R.id.name);

    }

}
