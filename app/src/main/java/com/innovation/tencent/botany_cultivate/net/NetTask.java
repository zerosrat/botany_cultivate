package com.innovation.tencent.botany_cultivate.net;
import com.innovation.tencent.botany_cultivate.base.BaseActivity;
import com.innovation.tencent.botany_cultivate.utils.ThreadPoolUtil;
import org.json.JSONObject;

/**
 * Created by Mr.Jadyn on 15/10/15.
 */
public abstract class NetTask {
    private BaseActivity baseActivity;
    private JSONObject jsonObject;

    public NetTask() {

    }

    public NetTask(BaseActivity baseActivity) {
        this.baseActivity = baseActivity;
    }

    public void execute() {
        //修改 判断是否有网
        //showProgress
        onStart();
        TaskRunnable mTask = new TaskRunnable();
        ThreadPoolUtil.getLongPool().execute(mTask);
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
        //        private NetTask netTask;
//        public TaskRunnable(NetTask netTask){
//            this.netTask=netTask;
//        }
        @Override
        public void run() {
            jsonObject = onLoad();

            if (jsonObject == null) {
                onFail();
                onFinish();
            }
            try {
                if(jsonObject.getInt("code")==0){
                    onSuccess(jsonObject.getJSONObject("data"));
                }else{
                    int errorCode=jsonObject.getInt("code");
                    String errorStr=jsonObject.getString("reason");
                    onError(errorCode,errorStr);
                }
            } catch (Exception e) {
                e.printStackTrace();
                //出错了，请稍后重试
            }finally {
                onFinish();
                //隐藏等待框
            }
        }
    }
}
