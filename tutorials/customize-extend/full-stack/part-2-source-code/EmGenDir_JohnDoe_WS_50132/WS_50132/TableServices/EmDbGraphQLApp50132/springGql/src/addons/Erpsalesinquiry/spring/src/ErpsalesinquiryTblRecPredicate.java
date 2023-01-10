package emrest.spring; 
 
import com.querydsl.core.types.dsl.*; 
 
import emrest.spring.EmSearchCriteria;  
import emrest.spring.ErpsalesinquiryTblRec;  
 
 
public final class ErpsalesinquiryTblRecPredicate { 
 
    private EmSearchCriteria criteria; 
 
    public EmSearchCriteria getCriteria() { 
        return criteria; 
    } 
    public void setCriteria(final EmSearchCriteria criteria) { 
        this.criteria = criteria; 
    } 
 
    public ErpsalesinquiryTblRecPredicate(final EmSearchCriteria criteria) { 
        this.criteria = criteria; 
    } 
 
    public BooleanExpression getPredicate() { 
 
        //Using Q classes is easier than PathBuilder 
        //final PathBuilder<ErpsalesinquiryTblRec> entityPath = new PathBuilder<>(ErpsalesinquiryTblRec.class, "erpsalesinquiryTblRec"); 
 
        //key, value, operation 
        String colKey = criteria.getKey(); 
        String colOp = criteria.getOperation(); 
        Object colVal = criteria.getValue(); 
 
        //Q classes are generated at compile time by apt pom -> <classifier>jpa</classifier> 
        QErpsalesinquiryTblRec erpsalesinquiryTblRec = QErpsalesinquiryTblRec.erpsalesinquiryTblRec; 
        EmPredicatesHelper pHelper = new EmPredicatesHelper(); 
 
        switch (colKey) { 
            case "dateofinquiry" : 
            //process Calendar 
            DateTimePath<java.util.Calendar> dateofinquiryPath = erpsalesinquiryTblRec.dateofinquiry; 
            return pHelper.emGetDatePathExpr(dateofinquiryPath, colOp, colVal); 
            case "requestedqty" : 
            //process long 
            NumberPath<Long> requestedqtyPath = erpsalesinquiryTblRec.requestedqty; 
            return pHelper.emGetLongPathExpr(requestedqtyPath, colOp, colVal); 
            case "reqquoteamt" : 
            //process float 
            NumberPath<Float> reqquoteamtPath = erpsalesinquiryTblRec.reqquoteamt; 
            return pHelper.emGetFloatPathExpr(reqquoteamtPath, colOp, colVal); 
            case "meetingpreftime" : 
            //process Calendar 
            DateTimePath<java.util.Calendar> meetingpreftimePath = erpsalesinquiryTblRec.meetingpreftime; 
            return pHelper.emGetTimePathExpr(meetingpreftimePath, colOp, colVal); 
            case "created" : 
            //process Calendar 
            DateTimePath<java.util.Calendar> createdPath = erpsalesinquiryTblRec.created; 
            return pHelper.emGetDateTimePathExpr(createdPath, colOp, colVal); 
            case "updated" : 
            //process Calendar 
            DateTimePath<java.util.Calendar> updatedPath = erpsalesinquiryTblRec.updated; 
            return pHelper.emGetDateTimePathExpr(updatedPath, colOp, colVal); 
        } 
 
        return null; 
    } 
 
} 
 
