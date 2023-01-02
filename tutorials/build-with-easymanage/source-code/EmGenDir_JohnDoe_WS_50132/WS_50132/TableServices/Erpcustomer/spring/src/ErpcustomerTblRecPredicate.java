package emrest.spring; 
 
import com.querydsl.core.types.dsl.*; 
 
import emrest.spring.EmSearchCriteria;  
import emrest.spring.ErpcustomerTblRec;  
 
 
public final class ErpcustomerTblRecPredicate { 
 
    private EmSearchCriteria criteria; 
 
    public EmSearchCriteria getCriteria() { 
        return criteria; 
    } 
    public void setCriteria(final EmSearchCriteria criteria) { 
        this.criteria = criteria; 
    } 
 
    public ErpcustomerTblRecPredicate(final EmSearchCriteria criteria) { 
        this.criteria = criteria; 
    } 
 
    public BooleanExpression getPredicate() { 
 
        //Using Q classes is easier than PathBuilder 
        //final PathBuilder<ErpcustomerTblRec> entityPath = new PathBuilder<>(ErpcustomerTblRec.class, "erpcustomerTblRec"); 
 
        //key, value, operation 
        String colKey = criteria.getKey(); 
        String colOp = criteria.getOperation(); 
        Object colVal = criteria.getValue(); 
 
        //Q classes are generated at compile time by apt pom -> <classifier>jpa</classifier> 
        QErpcustomerTblRec erpcustomerTblRec = QErpcustomerTblRec.erpcustomerTblRec; 
        EmPredicatesHelper pHelper = new EmPredicatesHelper(); 
 
        switch (colKey) { 
            case "customerId" : 
            //process String 
            StringPath customerIdPath = erpcustomerTblRec.customerId; 
            return pHelper.emGetStringPathExpr(customerIdPath, colOp, colVal); 
            case "name" : 
            //process String 
            StringPath namePath = erpcustomerTblRec.name; 
            return pHelper.emGetStringPathExpr(namePath, colOp, colVal); 
            case "phone" : 
            //process String 
            StringPath phonePath = erpcustomerTblRec.phone; 
            return pHelper.emGetStringPathExpr(phonePath, colOp, colVal); 
            case "mobilePhone" : 
            //process String 
            StringPath mobilePhonePath = erpcustomerTblRec.mobilePhone; 
            return pHelper.emGetStringPathExpr(mobilePhonePath, colOp, colVal); 
            case "email" : 
            //process String 
            StringPath emailPath = erpcustomerTblRec.email; 
            return pHelper.emGetStringPathExpr(emailPath, colOp, colVal); 
            case "website" : 
            //process String 
            StringPath websitePath = erpcustomerTblRec.website; 
            return pHelper.emGetStringPathExpr(websitePath, colOp, colVal); 
            case "address" : 
            //process String 
            StringPath addressPath = erpcustomerTblRec.address; 
            return pHelper.emGetStringPathExpr(addressPath, colOp, colVal); 
            case "dateofinquiry" : 
            //process Calendar 
            DateTimePath<java.util.Calendar> dateofinquiryPath = erpcustomerTblRec.dateofinquiry; 
            return pHelper.emGetDatePathExpr(dateofinquiryPath, colOp, colVal); 
            case "requestedqty" : 
            //process long 
            NumberPath<Long> requestedqtyPath = erpcustomerTblRec.requestedqty; 
            return pHelper.emGetLongPathExpr(requestedqtyPath, colOp, colVal); 
            case "reqquoteamt" : 
            //process float 
            NumberPath<Float> reqquoteamtPath = erpcustomerTblRec.reqquoteamt; 
            return pHelper.emGetFloatPathExpr(reqquoteamtPath, colOp, colVal); 
            case "meetingpreftime" : 
            //process Calendar 
            DateTimePath<java.util.Calendar> meetingpreftimePath = erpcustomerTblRec.meetingpreftime; 
            return pHelper.emGetTimePathExpr(meetingpreftimePath, colOp, colVal); 
            case "created" : 
            //process Calendar 
            DateTimePath<java.util.Calendar> createdPath = erpcustomerTblRec.created; 
            return pHelper.emGetDateTimePathExpr(createdPath, colOp, colVal); 
            case "updated" : 
            //process Calendar 
            DateTimePath<java.util.Calendar> updatedPath = erpcustomerTblRec.updated; 
            return pHelper.emGetDateTimePathExpr(updatedPath, colOp, colVal); 
        } 
 
        return null; 
    } 
 
} 
 
