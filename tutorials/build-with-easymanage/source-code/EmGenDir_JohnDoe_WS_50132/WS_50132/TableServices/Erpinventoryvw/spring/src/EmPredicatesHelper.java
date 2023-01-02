package emrest.spring;

import com.querydsl.core.types.dsl.*;
import emrest.spring.EmCalendarUtil;

import java.util.Calendar;

public class EmPredicatesHelper {
    public BooleanExpression emGetStringPathExpr(StringPath path, String colOp, Object colVal) {
        String value = colVal.toString().replace("'","").replace("\"","");

        //System.out.println("emGetStringPathExpr ["+colOp+"] ["+value+"] ["+path.toString()+"]");
        if (colOp.endsWith("IgnoreCase")) {
            //System.out.println("emGetStringPathExpr IgnoreCase ["+colOp+"] ["+value+"] ["+path.toString()+"]");

            switch (colOp.replace("IgnoreCase","")) {
                case "equals":
                    return path.equalsIgnoreCase(value);
                case "notEquals":
                    return path.notEqualsIgnoreCase(value);
                case "like":
                    return path.likeIgnoreCase('%' + value + '%');
                case "contains":
                    return path.containsIgnoreCase(value);
            }

        } else {
            //System.out.println("emGetStringPathExpr elseOf IgnoreCase ["+colOp+"] ["+value+"] ["+path.toString()+"]");
            switch (colOp) {
                case "=":
                case "eq":
                case "equals":
                    return path.eq(value);
                case "!=":
                case "ne":
                case "notEquals":
                    return path.ne(value);
                case ">":
                case "gt":
                    return path.gt(value);
                case "<":
                case "lt":
                    return path.lt(value);
                case "like":
                    return path.like('%' + value + '%');
                case "notLike":
                    return path.notLike('%' + value + '%');
                case "contains":
                    return path.contains(value);
                case "isNull":
                    return path.isNull();
                case "isNotNull":
                    return path.isNotNull();
            }
        }
        return null;
    }
    public BooleanExpression emGetLongPathExpr(NumberPath<Long> path, String colOp, Object colVal) {
        final long value = Long.parseLong(colVal.toString());
        //System.out.println("emGetLongPathExpr ["+colOp+"] ["+value+"] ["+path.toString()+"]");
        switch (colOp) {
            case "=":
            case "eq":
                return path.eq(value);
            case "!=":
            case "ne":
                return path.ne(value);
            case ">":
            case "gt":
                return path.gt(value);
            case ">=":
            case "goe":
                return path.goe(value);
            case "<":
            case "lt":
                return path.lt(value);
            case "<=":
            case "loe":
                return path.loe(value);
            case "isNull":
                return path.isNull();
            case "isNotNull":
                return path.isNotNull();
        }
        return null;
    }
    public BooleanExpression emGetFloatPathExpr(NumberPath<Float> path, String colOp, Object colVal) {
        final float value = Float.parseFloat(colVal.toString());
        //System.out.println("emGetFloatPathExpr ["+colOp+"] ["+value+"] ["+path.toString()+"]");
        switch (colOp) {
            case "=":
            case "eq":
                return path.eq(value);
            case "!=":
            case "ne":
                return path.ne(value);
            case ">":
            case "gt":
                return path.gt(value);
            case ">=":
            case "goe":
                return path.goe(value);
            case "<":
            case "lt":
                return path.lt(value);
            case "<=":
            case "loe":
                return path.loe(value);
            case "isNull":
                return path.isNull();
            case "isNotNull":
                return path.isNotNull();
        }
        return null;
    }
    public BooleanExpression emGetDateTimePathExpr(DateTimePath<Calendar> path, String colOp, Object colVal) {
        //if not null, Create a date and check
        String value1 = colVal.toString().replace("'","").replace("\"","");

        System.out.println("P Date Rcv = "+value1);

        Calendar value = null;
        if(value1 != null) {
            if(value1.trim().length() > 0) {
                value = (Calendar) EmCalendarUtil.parseDateTimeFromInput(value1);
                System.out.println("P DateTime Parsed = "+value.getTime().toString());
            }
        }

        //System.out.println("emGetDateTimePathExpr ["+colOp+"] ["+value+"] ["+path.toString()+"]");
        switch (colOp) {
            case "=":
            case "eq":
                return path.eq(value);
            case "!=":
            case "ne":
                return path.ne(value);
            case ">":
            case "gt":
                return path.gt(value);
            case "<":
            case "lt":
                return path.lt(value);
            case ">=":
            case "goe":
                return path.goe(value);
            case "<=":
            case "loe":
                return path.loe(value);
            case "isNull":
                return path.isNull();
            case "isNotNull":
                return path.isNotNull();
        }
        return null;
    }
    public BooleanExpression emGetDatePathExpr(DateTimePath<Calendar> path, String colOp, Object colVal) {
        //if not null, Create a date and check
        String value1 = colVal.toString().replace("'","").replace("\"","");

        System.out.println("P Date Rcv = "+value1);

        Calendar value = null;
        if(value1 != null) {
            if(value1.trim().length() > 0) {
                value = (Calendar) EmCalendarUtil.parseDateFromInput(value1);
                System.out.println("P Date Parsed = "+value.getTime().toString());
            }
        }

        //System.out.println("emGetDatePathExpr ["+colOp+"] ["+value+"] ["+path.toString()+"]");
        switch (colOp) {
            case "=":
            case "eq":
                return path.eq(value);
            case "!=":
            case "ne":
                return path.ne(value);
            case ">":
            case "gt":
                return path.gt(value);
            case "<":
            case "lt":
                return path.lt(value);
            case ">=":
            case "goe":
                return path.goe(value);
            case "<=":
            case "loe":
                return path.loe(value);
            case "isNull":
                return path.isNull();
            case "isNotNull":
                return path.isNotNull();
        }
        return null;
    }
    public BooleanExpression emGetTimePathExpr(DateTimePath<Calendar> path, String colOp, Object colVal) {
        //if not null, Create a date and check
        String value1 = colVal.toString().replace("'","").replace("\"","");

        System.out.println("P Date Rcv = "+value1);

        Calendar value = null;
        if(value1 != null) {
            if(value1.trim().length() > 0) {
                value = (Calendar) EmCalendarUtil.parseTimeFromInput(value1);
                System.out.println("P Time Parsed = "+value.getTime().toString());
            }
        }

        //System.out.println("emGetTimePathExpr ["+colOp+"] ["+value+"] ["+path.toString()+"]");
        switch (colOp) {
            case "=":
            case "eq":
                return path.eq(value);
            case "!=":
            case "ne":
                return path.ne(value);
            case ">":
            case "gt":
                return path.gt(value);
            case "<":
            case "lt":
                return path.lt(value);
            case ">=":
            case "goe":
                return path.goe(value);
            case "<=":
            case "loe":
                return path.loe(value);
            case "isNull":
                return path.isNull();
            case "isNotNull":
                return path.isNotNull();
        }
        return null;
    }
    public BooleanExpression emGetBooleanPathExpr(BooleanPath path, String colOp, Object colVal) {
        String value = colVal.toString().replace("'","").replace("\"","");
        //System.out.println("emGetBooleanPathExpr ["+colOp+"] ["+value+"] ["+path.toString()+"]");
        if (colOp.equalsIgnoreCase("=")) {
            if (value.equalsIgnoreCase("true")) {
                return path.isTrue();
            } else if (value.equalsIgnoreCase("false")) {
                return path.isFalse();
            }
        } else if (colOp.equals("isNull")) {
            return path.isNull();
        } else if (colOp.equals("isNotNull")) {
            return path.isNotNull();
        }
            return null;
    }
}
