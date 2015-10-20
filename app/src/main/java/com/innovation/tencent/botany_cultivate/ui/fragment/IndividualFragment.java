package com.innovation.tencent.botany_cultivate.ui.fragment;

import android.app.Activity;
import android.net.Uri;
import android.os.Bundle;
import android.app.Fragment;
import android.support.v4.view.ViewPager;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;

import com.innovation.tencent.botany_cultivate.R;
import com.innovation.tencent.botany_cultivate.base.BaseFragment;

import java.util.ArrayList;
import java.util.List;

public class IndividualFragment extends BaseFragment {
    private ViewPager vp_slide_main;
    private LayoutInflater inflater;
    private String[] urls;
    private ImageView iv_slide_item;
    private View item;
    private List<View> items;
    private static final int IMAGE_NUM = 7;

    @Override
    protected int getRooyView() {
        return R.layout.fragment_individual;
    }

    @Override
    protected void setListener() {

    }

    @Override
    protected void init() {
//        urls = new String[]{
//                "http://a.hiphotos.baidu.com/image/pic/item/3bf33a87e950352ad6465dad5143fbf2b2118b6b.jpg",
//                "http://a.hiphotos.baidu.com/image/pic/item/c8177f3e6709c93d002077529d3df8dcd0005440.jpg",
//                "http://f.hiphotos.baidu.com/image/pic/item/7aec54e736d12f2ecc3d90f84dc2d56285356869.jpg",
//                "http://e.hiphotos.baidu.com/image/pic/item/9c16fdfaaf51f3de308a87fc96eef01f3a297969.jpg",
//                "http://d.hiphotos.baidu.com/image/pic/item/f31fbe096b63f624b88f7e8e8544ebf81b4ca369.jpg",
//                "http://h.hiphotos.baidu.com/image/pic/item/11385343fbf2b2117c2dc3c3c88065380cd78e38.jpg",
//                "http://c.hiphotos.baidu.com/image/pic/item/3801213fb80e7bec5ed8456c2d2eb9389b506b38.jpg"
//        };
//        items = new ArrayList<View>();
    }

    @Override
    protected void initData() {
//        for (int i = 0; i < IMAGE_NUM; i++) {
//            item = inflater.inflate(R.layout.slide_item, null);
//            items.add(item);
//        }
    }

    @Override
    protected void setComponsition(View view) {
//        vp_slide_main = (ViewPager) view.findViewById(R.id.vp_slide_main);
//        inflater = LayoutInflater.from(view.getContext());
    }
}
