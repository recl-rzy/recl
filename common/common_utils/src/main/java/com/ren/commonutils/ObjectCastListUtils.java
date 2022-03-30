package com.ren.commonutils;

import java.util.ArrayList;
import java.util.List;

/**
 * @Description: TODO
 * @ClassName: ObjectCastListUtils
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2022/3/2 18:24
 * @Vertion: 2019.1
 */

public class ObjectCastListUtils {

    public static <T> List<T> castList(Object obj, Class<T> clazz)
    {
        List<T> result = new ArrayList<T>();
        if(obj instanceof List<?>)
        {
            for (Object o : (List<?>) obj)
            {
                result.add(clazz.cast(o));
            }
            return result;
        }
        return null;
    }

}

