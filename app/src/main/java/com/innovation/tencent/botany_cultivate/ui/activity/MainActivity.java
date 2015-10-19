package com.innovation.tencent.botany_cultivate.ui.activity;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;

import android.widget.TextView;

import com.innovation.tencent.botany_cultivate.R;
import com.innovation.tencent.botany_cultivate.net.NetTask;
import com.innovation.tencent.botany_cultivate.utils.HttpUtil;
import com.innovation.tencent.botany_cultivate.utils.NetWorkUtil;

import org.json.JSONException;
import org.json.JSONObject;

public class MainActivity extends AppCompatActivity {
    private TextView tv;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        NetWorkUtil.getInstance(this).checkNetworkState();
        new NetTask() {
            @Override
            protected JSONObject onLoad() {
                JSONObject jsonObject = HttpUtil.sendGetRequest("http://botanycultivate.sinaapp.com/");
                return jsonObject;
            }

            @Override
            protected void onSuccess(JSONObject jsonObject) throws Exception {
                try {
                    System.out.println("-------->" + jsonObject.getString("type"));
                    System.out.println("------------->");
                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }

        }.execute();
    }

}
