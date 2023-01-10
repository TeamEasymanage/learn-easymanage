package emrest.spring; 
 
import java.util.*; 
 
import com.querydsl.core.types.dsl.BooleanExpression; 
import com.querydsl.core.types.dsl.Expressions; 
 
import emrest.spring.EmSearchCriteria;  
 
public final class ErpproductaddedtableTblRecPredicatesBuilder { 
 
    EmPredicatesBuilder emBuilder = new EmPredicatesBuilder(); 
 
    public ErpproductaddedtableTblRecPredicatesBuilder (String search) { 
        if (search != null) { 
            emBuilder.init(search); 
        } 
    } 
 
    public BooleanExpression build() { 
        if (emBuilder.params.size() == 0) { 
            return null; 
        } 
 
        BooleanExpression result = Expressions.asBoolean(true).isTrue(); 
 
        Iterator<EmSearchCriteria> param = emBuilder.params.listIterator(); 
        while (param.hasNext()) 
        { 
            ErpproductaddedtableTblRecPredicate predicate = new ErpproductaddedtableTblRecPredicate(param.next()); 
            BooleanExpression expr = predicate.getPredicate(); 
            if (expr != null ) { 
                String condType = predicate.getCriteria().getAndOr(); 
                //System.out.println("condType = "+condType); 
                if (condType.equalsIgnoreCase("or")) { 
                    result = result.or(expr); 
                } else { 
                    result = result.and(expr); 
                } 
            } 
            //System.out.println(entry.getKey() + "/" + entry.getValue()); 
        } 
        return result; 
    } 
 
} 
 
