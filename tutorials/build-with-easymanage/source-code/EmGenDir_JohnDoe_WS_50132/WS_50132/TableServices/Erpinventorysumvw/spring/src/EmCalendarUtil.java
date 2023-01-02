package emrest.spring;


//graphql

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import emrest.spring.EmParam;


public class EmCalendarUtil {

    public static String calendarDateFormat = EmParam.emParamDateFmt;
    public static String calendarTimeFormat = EmParam.emParamTimeFmt;
    public static String calendarDateTimeFormat = calendarDateFormat+" "+calendarTimeFormat;

    public static Object parseCalendarFromInput(Object input) {
        return parseCalendarTypeFromInput(input, calendarDateTimeFormat);
    }
    public static Object parseDateTimeFromInput(Object input) {
        return parseCalendarTypeFromInput(input, calendarDateTimeFormat);
    }
    public static Object parseDateFromInput(Object input) {
        return parseCalendarTypeFromInput(input, calendarDateFormat);
    }
    public static Object parseTimeFromInput(Object input) {
        return parseCalendarTypeFromInput(input, calendarTimeFormat);
    }
    public static Object parseCalendarTypeFromInput(Object input, String calendarFormat) {
        DateFormat formatter = new SimpleDateFormat(calendarFormat);
        Calendar calendar = Calendar.getInstance();
        try {
            String dateTimeStr = "";
            if (input instanceof String) {
                dateTimeStr = input.toString();
            }
            System.out.println("dateTimeStr = "+dateTimeStr);
            if(dateTimeStr != null) {
                if(dateTimeStr.trim().length() > 0) {
                    Date date = formatter.parse(dateTimeStr);
                    calendar.setTime(date);
                    System.out.println("CU - Calendar ["+calendarFormat+"] Parsed = "+calendar.getTime().toString());
                    return calendar;
                }
            }
        } catch (ParseException e) {
            e.printStackTrace();
            //return null;
        }
        return null;
        //throw new CoercingParseValueException("Unable to parse variable value " + input + " as an email address");
    }

}
