package emrest.spring; 
 
import javax.persistence.*; 
import java.util.*; 
import com.fasterxml.jackson.annotation.JsonFormat; 
 
@Entity 
@Table(name = "erp_customer") 
public class ErpcustomerTblRec { 
 
	@Id 
	//@GeneratedValue(strategy = GenerationType.AUTO) // or GenerationType.IDENTITY | GenerationType.SEQUENCE | GenerationType.UUID (With UUID java type, char (36) ) 
	@Column(name = "customer_id") 
	private String customerId; 
 
	@Column(name = "name") 
	private String name; 
 
	@Column(name = "phone") 
	private String phone; 
 
	@Column(name = "mobile_phone") 
	private String mobilePhone; 
 
	@Column(name = "pict") 
	private byte[] pict; 
 
	@Column(name = "email") 
	private String email; 
 
	@Column(name = "website") 
	private String website; 
 
	@Column(name = "address") 
	private String address; 
 
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
 
 
public ErpcustomerTblRec() { 
 
} 
 
public ErpcustomerTblRec(  
  String customerId 
 , String name 
 , String phone 
 , String mobilePhone 
 , byte[] pict 
 , String email 
 , String website 
 , String address 
 , Calendar dateofinquiry 
 , long requestedqty 
 , float reqquoteamt 
 , Calendar meetingpreftime 
 , Calendar created 
 , Calendar updated 
 ) { 
	this.customerId = customerId; 
	this.name = name; 
	this.phone = phone; 
	this.mobilePhone = mobilePhone; 
	this.pict = pict; 
	this.email = email; 
	this.website = website; 
	this.address = address; 
	this.dateofinquiry = dateofinquiry; 
	this.requestedqty = requestedqty; 
	this.reqquoteamt = reqquoteamt; 
	this.meetingpreftime = meetingpreftime; 
	this.created = created; 
	this.updated = updated; 
} 
 
public String getCustomerId() { return this.customerId; } 
public String getName() { return this.name; } 
public String getPhone() { return this.phone; } 
public String getMobilePhone() { return this.mobilePhone; } 
public byte[] getPict() { return this.pict; } 
public String getEmail() { return this.email; } 
public String getWebsite() { return this.website; } 
public String getAddress() { return this.address; } 
public Calendar getDateofinquiry() { return this.dateofinquiry; } 
public long getRequestedqty() { return this.requestedqty; } 
public float getReqquoteamt() { return this.reqquoteamt; } 
public Calendar getMeetingpreftime() { return this.meetingpreftime; } 
public Calendar getCreated() { return this.created; } 
public Calendar getUpdated() { return this.updated; } 
 
public void setCustomerId(String customerId ) { this.customerId = customerId; } 
public void setName(String name ) { this.name = name; } 
public void setPhone(String phone ) { this.phone = phone; } 
public void setMobilePhone(String mobilePhone ) { this.mobilePhone = mobilePhone; } 
public void setPict(byte[] pict ) { this.pict = pict; } 
public void setEmail(String email ) { this.email = email; } 
public void setWebsite(String website ) { this.website = website; } 
public void setAddress(String address ) { this.address = address; } 
public void setDateofinquiry(Calendar dateofinquiry ) { this.dateofinquiry = dateofinquiry; } 
public void setRequestedqty(long requestedqty ) { this.requestedqty = requestedqty; } 
public void setReqquoteamt(float reqquoteamt ) { this.reqquoteamt = reqquoteamt; } 
public void setMeetingpreftime(Calendar meetingpreftime ) { this.meetingpreftime = meetingpreftime; } 
public void setCreated(Calendar created ) { this.created = created; } 
public void setUpdated(Calendar updated ) { this.updated = updated; } 
 
 
@Override 
public String toString() { 
	return "ErpcustomerTblRec [ customerId = "+this.customerId+" ]"; 
} 
 
} 
 
