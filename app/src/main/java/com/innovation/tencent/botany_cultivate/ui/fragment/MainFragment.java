package com.innovation.tencent.botany_cultivate.ui.fragment;

import android.graphics.Color;
import android.os.Handler;
import android.os.Message;
import android.support.v4.view.ViewPager;
import android.support.v4.widget.SwipeRefreshLayout;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.ImageView;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.TextView;

import com.alibaba.fastjson.JSON;
import com.innovation.tencent.botany_cultivate.R;
import com.innovation.tencent.botany_cultivate.base.BaseFragment;
import com.innovation.tencent.botany_cultivate.constant.API;
import com.innovation.tencent.botany_cultivate.domain.Weather;
import com.innovation.tencent.botany_cultivate.handler.SlideHandler;
import com.innovation.tencent.botany_cultivate.net.NetTask;
import com.innovation.tencent.botany_cultivate.ui.adapter.SlideAdapter;
import com.innovation.tencent.botany_cultivate.utils.HttpUtil;

import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

public class MainFragment extends BaseFragment {
    private RadioGroup rg_slide_main;
    private RadioButton rb_dot1_main, rb_dot2_main, rb_dot3_main;
    private ViewPager vp_slide_main;
    private View slideItem;
    private View baseView;
    private TextView tv_city_main, tv_temp_main, tv_humidity_main, tv_uvindex_main, tv_wind_main, tv_weather_main;

    private LayoutInflater inflater;
    private String[] urls;

    private List<View> slideItems;
    private static final int IMAGE_NUM = 3;
    private SlideAdapter adapter;
    private SlideHandler slideHandler;
    private Weather weather;

    @Override
    protected int getRooyView() {
        return R.layout.fragment_main;
    }


    @Override
    protected void setListener() {
        vp_slide_main.addOnPageChangeListener(new ViewPager.OnPageChangeListener() {
            @Override
            public void onPageScrolled(int position, float positionOffset, int positionOffsetPixels) {

            }

            @Override
            public void onPageSelected(int position) {
                switch (vp_slide_main.getCurrentItem()) {
                    case 0:
                        rb_dot1_main.setChecked(true);
                        break;
                    case 1:
                        rb_dot2_main.setChecked(true);
                        break;
                    case 2:
                        rb_dot3_main.setChecked(true);
                        break;

                }
                slideHandler.sendMessage(Message.obtain(slideHandler, SlideHandler.PAGE_TAG, vp_slide_main.getCurrentItem(), 0));

            }

            @Override
            public void onPageScrollStateChanged(int state) {
                switch (state) {
                    case ViewPager.SCROLL_STATE_DRAGGING:
                        slideHandler.sendEmptyMessage(SlideHandler.STOP);
                        break;
                    case ViewPager.SCROLL_STATE_IDLE:
                        slideHandler.sendEmptyMessageDelayed(SlideHandler.ALERT_PAGE, SlideHandler.DELAY);
                        break;
                    default:
                        break;
                }
            }
        });


    }

    @Override
    protected void init() {
        weather = new Weather();
        urls = new String[]{
                "http://img0.imgtn.bdimg.com/it/u=510878081,2337058705&fm=21&gp=0.jpg",
                "http://img3.imgtn.bdimg.com/it/u=1659272368,2722888983&fm=21&gp=0.jpg",
                "http://img3.imgtn.bdimg.com/it/u=1347763669,3428842308&fm=21&gp=0.jpg"
        };
        slideItems = new ArrayList<View>();
    }


    @Override
    protected void initData(View view) {
        baseView = view;
        vp_slide_main = (ViewPager) view.findViewById(R.id.vp_slide_main);
        rg_slide_main = (RadioGroup) view.findViewById(R.id.rg_slide_main);
        rb_dot1_main = (RadioButton) view.findViewById(R.id.rb_dot1_main);
        rb_dot2_main = (RadioButton) view.findViewById(R.id.rb_dot2_main);
        rb_dot3_main = (RadioButton) view.findViewById(R.id.rb_dot3_main);

        tv_city_main = (TextView) view.findViewById(R.id.tv_city_main);
        tv_humidity_main = (TextView) view.findViewById(R.id.tv_humidity_main);
        tv_temp_main = (TextView) view.findViewById(R.id.tv_temp_main);
        tv_uvindex_main = (TextView) view.findViewById(R.id.tv_uvindex_main);
        tv_wind_main = (TextView) view.findViewById(R.id.tv_wind_main);
        tv_weather_main = (TextView) view.findViewById(R.id.tv_weather_main);

        inflater = LayoutInflater.from(view.getContext());
        slideHandler = new SlideHandler(view.getContext(), vp_slide_main);
        initSlide(view);
        initWeather("成都");
    }

    private void initSlide(View view) {
        rb_dot1_main.setChecked(true);
        slideItems.clear();
        for (int i = 0; i < IMAGE_NUM; i++) {
            slideItem = inflater.inflate(R.layout.slide_item, null);
            slideItems.add(slideItem);
        }
        adapter = new SlideAdapter(slideItems, view.getContext(), urls);
        vp_slide_main.setAdapter(adapter);
    }

    private void initWeather(final String cityName) {
        tv_city_main.setText(cityName);
        new NetTask(baseView.getContext()) {
            @Override
            protected JSONObject onLoad() {
                return HttpUtil.sendGetRequest(API.URL_WEATHER + cityName);
            }

            @Override
            protected void onSuccess(JSONObject jsonObject) throws Exception {

                weather = JSON.parseObject(jsonObject.toString(), Weather.class);
                String temp = weather.getSk().getTemp() + "C";
                String uv_index = weather.getToday().getUv_index();
                String w = weather.getToday().getWeather();
                String humidity = weather.getSk().getHumidity();
                String wind = weather.getSk().getWind_direction() + weather.getSk().getWind_strength();
                tv_temp_main.setText(temp);
                tv_uvindex_main.setText(uv_index);
                tv_weather_main.setText(w);
                tv_humidity_main.setText(humidity);
                tv_wind_main.setText(wind);
            }

            @Override
            protected void onError(int errorCode, String errorStr) {
                super.onError(errorCode, errorStr);
                System.out.println("----->" + errorStr + errorCode);
            }

            @Override
            protected void onFail() {
                super.onFail();
            }
        }.execute();
    }

    @Override
    public void onStart() {
        super.onStart();
        slideHandler.sendEmptyMessage(SlideHandler.BREAK);
    }

    @Override
    public void onStop() {
        super.onStop();
        slideHandler.sendEmptyMessage(SlideHandler.STOP);
    }
}
