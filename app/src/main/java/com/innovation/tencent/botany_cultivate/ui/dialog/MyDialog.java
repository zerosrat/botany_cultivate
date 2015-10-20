package com.innovation.tencent.botany_cultivate.ui.dialog;

import android.app.AlertDialog;
import android.app.Dialog;
import android.content.Context;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.widget.Button;
import android.widget.EditText;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;

import com.innovation.tencent.botany_cultivate.R;

/**
 * Created by Drummond on 2015/10/19.
 */
public class MyDialog extends Dialog{

    //定义回调事件，用于dialog的点击事件
    public interface OnMyDialogListener{
        public void back(EditText editText);
    }

    private int dialogType;
    private String m_title = null;
    private String m_inform = null;
    private String m_edit = null;
    private int m_image = 0;
    private OnMyDialogListener m_myDialogListener;
    public EditText m_editText;

    public MyDialog(Context context,String title,String inform,int image,OnMyDialogListener myDialogListener){
        super(context);
        this.dialogType = 1;
        this.m_title = title;
        this.m_inform = inform;
        this.m_image = image;
        this.m_myDialogListener = myDialogListener;
    }

    public MyDialog(Context context,String title,String inform,OnMyDialogListener myDialogListener){
        super(context);
        this.dialogType = 2;
        this.m_title = title;
        this.m_inform = inform;
        this.m_myDialogListener = myDialogListener;
    }

    public MyDialog(Context context,String title,String inform,String edit,OnMyDialogListener myDialogListener){
        super(context);
        this.dialogType = 3;
        this.m_title = title;
        this.m_inform = inform;
        this.m_myDialogListener = myDialogListener;
    }

    public MyDialog(Context context,String title,OnMyDialogListener myDialogListener){
        super(context);
        this.dialogType = 4;
        this.m_title = title;
        this.m_myDialogListener = myDialogListener;
    }

    @Override
    protected void onCreate(Bundle savedInstanceState){
        super.onCreate(savedInstanceState);
        switch (dialogType){
            case 1:
                setContentView(R.layout.mydialog_1);
                setTitle(m_title);
                ImageView image = (ImageView) findViewById(R.id.image);
                image.setImageResource(m_image);
                TextView text_1 = (TextView) findViewById(R.id.textword1);
                text_1.setText(m_inform);
                Button btn_1 = (Button) findViewById(R.id.btnok1);
                btn_1.setOnClickListener(clickListener);
                break;
            case 2:
                setContentView(R.layout.mydialog_2);
                setTitle(m_title);
                TextView text_2 = (TextView) findViewById(R.id.textword2);
                text_2.setText(m_inform);
                Button btn_2 = (Button) findViewById(R.id.btnok2);
                btn_2.setOnClickListener(clickListener);
                break;
            case 3:
                setContentView(R.layout.mydialog_3);
                setTitle(m_title);
                TextView text_3 = (TextView) findViewById(R.id.textword3);
                text_3.setText(m_inform);
                Button btn_3 = (Button) findViewById(R.id.btnok3);
                btn_3.setOnClickListener(clickListener);
                m_editText = (EditText) findViewById(R.id.edit_text);
                break;
            case 4:
                setContentView(R.layout.mydialog_4);
                setTitle(m_title);
                Button btn_4 = (Button) findViewById(R.id.btnok4);
                btn_4.setOnClickListener(clickListener);
                break;
        }
    }

    private View.OnClickListener clickListener = new View.OnClickListener(){
        @Override
        public void onClick(View v){
            m_myDialogListener.back(m_editText);
            MyDialog.this.dismiss();
        }
    };

}
