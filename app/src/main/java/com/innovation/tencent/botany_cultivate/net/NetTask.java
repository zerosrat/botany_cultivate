package com.innovation.tencent.botany_cultivate.net;

import android.content.Context;
import android.widget.EditText;

import com.innovation.tencent.botany_cultivate.base.BaseActivity;
import com.innovation.tencent.botany_cultivate.ui.dialog.MyDialog;
import com.innovation.tencent.botany_cultivate.utils.NetWorkUtil;
import com.innovation.tencent.botany_cultivate.utils.ThreadPoolUtil;
import com.innovation.tencent.botany_cultivate.utils.UIUtil;

import org.json.JSONObject;

/**
 * Created by Mr.Jadyn on 15/10/15.
 */
public abstract class NetTask {
    private JSONObject jsonObject;
    private Context context;
    private MyDialog myProcessDialog, myErrorDialog;

    public NetTask(Context context) {
        this.context = context;
        myProcessDialog = new MyDialog(context, "请稍等", new MyDialog.OnMyDialogListener() {
            @Override
            public void back(EditText editText) {

            }
        });
        myErrorDialog = new MyDialog(context, "网络问题", "网络不给力啊", new MyDialog.OnMyDialogListener() {
            @Override
            public void back(EditText editText) {

            }
        });
    }


    public void execute() {

        if (NetWorkUtil.getInstance(context).isConnectNet()) {
            myProcessDialog.show();
            //showProgress
            onStart();
            TaskRunnable mTask = new TaskRunnable();
            ThreadPoolUtil.getLongPool().execute(mTask);
        } else {
            myErrorDialog.show();
        }
    }

    /**
     * 异步任务执行前的预处理
     */
    protected void onStart() {

    }

    /**
     * 加载数据
     *
     * @return
     */
    protected abstract JSONObject onLoad();

    /**
     * 请求数据成功后的处理
     *
     * @param jsonObject
     * @throws Exception
     */
    protected abstract void onSuccess(JSONObject jsonObject) throws Exception;

    /**
     * 返回错误时的处理逻辑
     *
     * @param errorCode
     * @param errorStr
     */
    protected void onError(int errorCode, String errorStr) {
        switch (errorCode) {

        }
    }

    /**
     * 请求失败的处理逻辑
     */
    protected void onFail() {

    }

    /**
     * 完成后的处理逻辑
     */
    protected void onFinish() {

    }

    private class TaskRunnable implements Runnable {

        @Override
        public void run() {
            jsonObject = onLoad();
            UITaskRunnable uiTaskRunnable = new UITaskRunnable();
            UIUtil.runInMainThread(uiTaskRunnable);
        }
    }

    private class UITaskRunnable implements Runnable {

        @Override
        public void run() {
            System.out.println("---->"+jsonObject);
            if (jsonObject == null) {
                onFail();
                onFinish();
                myProcessDialog.hide();
                myErrorDialog.show();
            }
            try {
                if (jsonObject.getInt("resultcode") == 200) {
                    onSuccess(jsonObject.getJSONObject("result"));
                } else {
                    int errorCode = jsonObject.getInt("resultcode");
                    String errorStr = jsonObject.getString("reason");
                    onError(errorCode, errorStr);
                }
            } catch (Exception e) {
                e.printStackTrace();
                //出错了，请稍后重试
            } finally {
                onFinish();
                myProcessDialog.hide();
            }
        }
    }
}
