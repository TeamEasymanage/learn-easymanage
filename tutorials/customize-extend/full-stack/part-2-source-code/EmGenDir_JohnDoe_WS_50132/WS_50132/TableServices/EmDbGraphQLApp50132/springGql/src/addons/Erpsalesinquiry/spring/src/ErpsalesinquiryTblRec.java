package emrest.spring; 
 
import javax.persistence.*; 
import java.util.*; 
import com.fasterxml.jackson.annotation.JsonFormat; 
 
@Entity 
@Table(name = "erp_sales_inquiry") 
public class ErpsalesinquiryTblRec { 
 
	@Id 
	//@GeneratedValue(strategy = GenerationType.AUTO) // or GenerationType.IDENTITY | GenerationType.SEQUENCE | GenerationType.UUID (With UUID java type, char (36) ) 
	@Column(name = "dateofinquiry") 
	@JsonFormat(pattern="yyyy-MM-dd")
	private Calendar dateofinquiry; 
 
	@Column(name = "requestedqty") 
	private long requestedqty; 
 
	@Column(name = "reqquoteamt") 
	private float reqquoteamt; 
 
	@Column(name = "meetingpreftime") 
	@JsonFormat(pattern="HH:mm")
	private Calendar meetingpreftime; 
 
	@Column(name = "created") 
	@JsonFormat(pattern="yyyy-MM-dd HH:mm")
	private Calendar created; 
 
	@Column(name = "updated") 
	@JsonFormat(pattern="yyyy-MM-dd HH:mm")
	private Calendar updated; 
 
 
public ErpsalesinquiryTblRec() { 
 
} 
 
public ErpsalesinquiryTblRec(  
  Calendar dateofinquiry 
 , long requestedqty 
 , float reqquoteamt 
 , Calendar meetingpreftime 
 , Calendar created 
 , Calendar updated 
 ) { 
	this.dateofinquiry = dateofinquiry; 
	this.requestedqty = requestedqty; 
	this.reqquoteamt = reqquoteamt; 
	this.meetingpreftime = meetingpreftime; 
	this.created = created; 
	this.updated = updated; 
} 
 
public Calendar getDateofinquiry() { return this.dateofinquiry; } 
public long getRequestedqty() { return this.requestedqty; } 
public float getReqquoteamt() { return this.reqquoteamt; } 
public Calendar getMeetingpreftime() { return this.meetingpreftime; } 
public Calendar getCreated() { return this.created; } 
public Calendar getUpdated() { return this.updated; } 
 
public void setDateofinquiry(Calendar dateofinquiry ) { this.dateofinquiry = dateofinquiry; } 
public void setRequestedqty(long requestedqty ) { this.requestedqty = requestedqty; } 
public void setReqquoteamt(float reqquoteamt ) { this.reqquoteamt = reqquoteamt; } 
public void setMeetingpreftime(Calendar meetingpreftime ) { this.meetingpreftime = meetingpreftime; } 
public void setCreated(Calendar created ) { this.created = created; } 
public void setUpdated(Calendar updated ) { this.updated = updated; } 
 
 
@Override 
public String toString() { 
	return "ErpsalesinquiryTblRec [ dateofinquiry = "+this.dateofinquiry+" ]"; 
} 
 
} 
 
