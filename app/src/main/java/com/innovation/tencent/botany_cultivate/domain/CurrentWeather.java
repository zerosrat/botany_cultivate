package com.innovation.tencent.botany_cultivate.domain;

/**
 * Created by Mr.Jadyn on 15/10/21.
 */
public class CurrentWeather {
    private String currentTemp;
    private String currentWindStrength;
    private String currentHumidity;
    public String getCurrentTemp() {
        return currentTemp;
    }

    public void setCurrentTemp(String currentTemp) {
        this.currentTemp = currentTemp;
    }

    public String getCurrentWindStrength() {
        return currentWindStrength;
    }

    public void setCurrentWindStrength(String currentWindStrength) {
        this.currentWindStrength = currentWindStrength;
    }

    public String getCurrentHumidity() {
        return currentHumidity;
    }

    public void setCurrentHumidity(String currentHumidity) {
        this.currentHumidity = currentHumidity;
    }
}
