package emrest.spring;  
  

//graphql

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import graphql.language.StringValue;
import graphql.schema.Coercing;
import graphql.schema.GraphQLScalarType;

import emrest.spring.EmParam;

public class EmCalendarScalar {

    public static String calendarDateFormat = EmParam.emParamDateFmt;
    public static String calendarTimeFormat = EmParam.emParamTimeFmt;
    public static String calendarDateTimeFormat = calendarDateFormat+" "+calendarTimeFormat;

    // ------------------------- DateTime ------------------------------------------
    public static final GraphQLScalarType EmCalendar = GraphQLScalarType.newScalar()
            .name("EmCalendar")
            .description("A custom scalar that handles Java Calendar DateTime")
            .coercing(new Coercing() {
                @Override
                public Object serialize(Object dataFetcherResult) {
                    if (dataFetcherResult instanceof Calendar) {
                    //Calendar cal = Calendar.getInstance();
                    //cal.setTime(Calendar(dataFetcherResult);
                    DateFormat sdf = new SimpleDateFormat(calendarDateTimeFormat);
                    //System.out.println(sdf.format(cal.getTime()));
                    return sdf.format(((Calendar)dataFetcherResult).getTime());
                    }
                    return "";
                }

                @Override
                public Object parseValue(Object input) {
                    return parseCalendarFromInput(input, calendarDateTimeFormat);
                }

                @Override
                public Object parseLiteral(Object input) { return parseCalendarFromInput(input, calendarDateTimeFormat); }
            })
            .build();

    // ------------------------- DateTime ------------------------------------------
    public static final GraphQLScalarType EmDateTime = GraphQLScalarType.newScalar()
            .name("EmDateTime")
            .description("A custom scalar that handles Java Calendar Date")
            .coercing(new Coercing() {
                @Override
                public Object serialize(Object dataFetcherResult) {
                    if (dataFetcherResult instanceof Calendar) {
                        DateFormat sdf = new SimpleDateFormat(calendarDateTimeFormat);
                        return sdf.format(((Calendar)dataFetcherResult).getTime());
                    }
                    return "";
                }

                @Override
                public Object parseValue(Object input) { return parseCalendarFromInput(input, calendarDateTimeFormat); }

                @Override
                public Object parseLiteral(Object input) { return parseCalendarFromInput(input, calendarDateTimeFormat); }
            })
            .build();

    // ------------------------- Date ------------------------------------------
    public static final GraphQLScalarType EmDate = GraphQLScalarType.newScalar()
            .name("EmDate")
            .description("A custom scalar that handles Java Calendar Date")
            .coercing(new Coercing() {
                @Override
                public Object serialize(Object dataFetcherResult) {
                    if (dataFetcherResult instanceof Calendar) {
                        DateFormat sdf = new SimpleDateFormat(calendarDateFormat);
                        return sdf.format(((Calendar)dataFetcherResult).getTime());
                    }
                    return "";
                }

                @Override
                public Object parseValue(Object input) { return parseCalendarFromInput(input, calendarDateFormat); }

                @Override
                public Object parseLiteral(Object input) {
                    return parseCalendarFromInput(input, calendarDateFormat);
                }
            })
            .build();

    // ------------------------- Time ------------------------------------------
    public static final GraphQLScalarType EmTime = GraphQLScalarType.newScalar()
            .name("EmTime")
            .description("A custom scalar that handles Java Calendar Time")
            .coercing(new Coercing() {
                @Override
                public Object serialize(Object dataFetcherResult) {
                    if (dataFetcherResult instanceof Calendar) {
                        DateFormat sdf = new SimpleDateFormat(calendarTimeFormat);
                        return sdf.format(((Calendar)dataFetcherResult).getTime());
                    }
                    return "";
                }

                @Override
                public Object parseValue(Object input) {
                    return parseCalendarFromInput(input, calendarTimeFormat);
                }

                @Override
                public Object parseLiteral(Object input) {
                    return parseCalendarFromInput(input, calendarTimeFormat);
                }
            })
            .build();

    public static Object parseCalendarFromInput(Object input, String calendarFormat) {
        DateFormat formatter = new SimpleDateFormat(calendarFormat);
        Calendar calendar = Calendar.getInstance();
        try {
            String dateTimeStr = "";
            if (input instanceof StringValue) {
                dateTimeStr = ((StringValue) input).getValue();
            }
            if (input instanceof String) {
                dateTimeStr = input.toString();
            }
            System.out.println("dateTimeStr = "+dateTimeStr);
            if(dateTimeStr != null) {
                if(dateTimeStr.trim().length() > 0) {
                    Date date = formatter.parse(dateTimeStr);
                    calendar.setTime(date);
                    System.out.println("CS - Calendar ["+calendarFormat+"] Parsed = "+calendar.getTime().toString());
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