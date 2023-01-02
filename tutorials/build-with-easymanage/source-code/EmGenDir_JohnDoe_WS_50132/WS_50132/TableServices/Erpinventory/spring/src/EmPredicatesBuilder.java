package emrest.spring;

import java.util.*;
import java.util.regex.*;

import emrest.spring.EmSearchCriteria;

public final class EmPredicatesBuilder {
    public final List<EmSearchCriteria> params;

    public EmPredicatesBuilder() {
        params = new ArrayList<>();
    }

    public void init(String search) {

        if (search != null) {
        //System.out.println("search != null");
        search = "and "+search +" ";
        //System.out.println("new search = "+search);
        //Pattern pattern = Pattern.compile("([aA][nN][dD]|[oO][rR]) (\\w+?) (:|<|>) (\\w+?) ");
        //ver 1.0 - handles and OR, operators : < > 
        //String regex = "([aA][nN][dD]|[oO][rR])\\s*?(\\w+?)\\s*?(:|<|>)\\s*?(['?][^']*?['?]|[\\\"?][^']*?[\\\"?]|\\w+?|\\w+?[,\\.]*\\w+?)\\s*? ";
        //ver 2.0 - handles and OR, more operators 
        //if op1 is substring(op2), then op2 should be listed before op1. e.g. equalsIgnoreCase should come before eq
        String regex = "([aA][nN][dD]|[oO][rR])\\s*?(\\w+?)\\s*?(=|equalsIgnoreCase|equals|eq|!=|ne|notEqualsIgnoreCase|notEquals|>|gt|<|lt|>=|goe|<=|loe|likeIgnoreCase|like|notLike|containsIgnoreCase|contains|isNull|isNotNull)\\s*?(['?][^']*?['?]|[\\\"?][^']*?[\\\"?]|\\w+?|\\w+?[,\\.]*\\w+?)\\s*? ";
        //numeric : eq gt goe lt loe isNull isNotNull NUll NotNull
            // string : eq gt lt equals Like NotLike Contains [All with IgnoreCase] in notIn isNull isNotNull NUll NotNull
            //datetime : eq equals lt loe gt goe isNull isNotNull NUll NotNull
            //eq|=|ne|!=|<|>
        Pattern pattern = Pattern.compile(regex, Pattern.MULTILINE);
        Matcher matcher = pattern.matcher(search);
        int ctr = 0;
        while (matcher.find()) {
            //System.out.println("matcher line ["+(ctr++)+"] = "+matcher.toString());
            with(matcher.group(1), matcher.group(2), matcher.group(3),matcher.group(4));
        }
        }
    }

    public void with(final String andOr, final String key, final String operation, final Object value) {

        //System.out.println("builder key = "+key);

        params.add(new EmSearchCriteria(andOr, key, operation, value));
        //System.out.println("params Array = "+params.toString());

    }

}
