package emrest.spring; 
 
import java.util.*; 
import org.springframework.data.jpa.repository.JpaRepository; 
import org.springframework.data.domain.Pageable; 
 import org.springframework.data.querydsl.QuerydslPredicateExecutor;  
import emrest.spring.ErpinventoryTblRec; 
 
public interface ErpinventoryTblRecRepository extends JpaRepository<ErpinventoryTblRec, String>  , QuerydslPredicateExecutor<ErpinventoryTblRec>  { 
	//Below 2 are inbuilt available from Repository, not needed to declare  
	//List<ErpinventoryTblRec> findAll(); 
	//List<ErpinventoryTblRec> findAll(Pageable pageable); 
 
	List<ErpinventoryTblRec> findByInvId(long invId); 
	//List<ErpinventoryTblRec> findByInvId(long invId, Pageable pageable); 
	//List<ErpinventoryTblRec> findByInvIdLike(long invId); 
	//List<ErpinventoryTblRec> findByInvIdContaining(long invId); 
	//List<ErpinventoryTblRec> findByInvIdAndInvId(long invId, long invId); 
	Long deleteByInvId(long invId); 
	//List<ErpinventoryTblRec> findByColumnName(String columnName); 
	//List<ErpinventoryTblRec> findByColumnName(String columnName, Pageable pageable); 
 
 
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
 
