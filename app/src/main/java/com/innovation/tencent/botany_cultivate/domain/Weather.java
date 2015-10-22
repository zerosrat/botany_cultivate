package com.innovation.tencent.botany_cultivate.domain;

/**
 * Created by Mr.Jadyn on 15/10/21.
 */
public class Weather {
    private CurrentWeather currentWeather;
    private TodayWeather todayWeather;
    private String uvIndex;//紫外线强度

    public CurrentWeather getCurrentWeather() {
        return currentWeather;
    }

    public void setCurrentWeather(CurrentWeather currentWeather) {
        this.currentWeather = currentWeather;
    }

    public TodayWeather getTodayWeather() {
        return todayWeather;
    }

    public void setTodayWeather(TodayWeather todayWeather) {
        this.todayWeather = todayWeather;
    }

    public String getUvIndex() {
        return uvIndex;
    }

    public void setUvIndex(String uvIndex) {
        this.uvIndex = uvIndex;
    }
}
