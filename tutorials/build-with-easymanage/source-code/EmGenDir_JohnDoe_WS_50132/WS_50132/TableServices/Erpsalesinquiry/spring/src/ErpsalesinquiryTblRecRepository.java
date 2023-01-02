package emrest.spring; 
 
import java.util.*; 
import org.springframework.data.jpa.repository.JpaRepository; 
import org.springframework.data.domain.Pageable; 
/*QD import org.springframework.data.querydsl.QuerydslPredicateExecutor; QD*/ 
import emrest.spring.ErpsalesinquiryTblRec; 
 
public interface ErpsalesinquiryTblRecRepository extends JpaRepository<ErpsalesinquiryTblRec, String> /*QD , QuerydslPredicateExecutor<ErpsalesinquiryTblRec> QD*/ { 
	//Below 2 are inbuilt available from Repository, not needed to declare  
	//List<ErpsalesinquiryTblRec> findAll(); 
	//List<ErpsalesinquiryTblRec> findAll(Pageable pageable); 
 
	List<ErpsalesinquiryTblRec> findByDateofinquiry(Calendar dateofinquiry); 
	//List<ErpsalesinquiryTblRec> findByDateofinquiry(Calendar dateofinquiry, Pageable pageable); 
	//List<ErpsalesinquiryTblRec> findByDateofinquiryLike(Calendar dateofinquiry); 
	//List<ErpsalesinquiryTblRec> findByDateofinquiryContaining(Calendar dateofinquiry); 
	//List<ErpsalesinquiryTblRec> findByDateofinquiryAndDateofinquiry(Calendar dateofinquiry, Calendar dateofinquiry); 
	Long deleteByDateofinquiry(Calendar dateofinquiry); 
	//List<ErpsalesinquiryTblRec> findByColumnName(String columnName); 
	//List<ErpsalesinquiryTblRec> findByColumnName(String columnName, Pageable pageable); 
 
 
	/* Examples on using @Query 
	1] 
	@Query("select s from Student s where s.age = ?") 
	List<Student> findStudentByAgeAndSorted(int age, Sort sort); 
	2] 
	@Query(value = "SELECT * FROM Student WHERE age = :age and name= :name", nativeQuery = true) 
	Book findStudentByAgeAndStudentNameNative1(@Param("age") int age, @Param("name") String name); 
	3] 
	@Query(value = "SELECT * FROM Student WHERE age = ? and name = ? ", nativeQuery = true) 
	Book findStudentByAgeAndNameNative2(String age, String studentName); 
	*/ 
 
 
} 
 
