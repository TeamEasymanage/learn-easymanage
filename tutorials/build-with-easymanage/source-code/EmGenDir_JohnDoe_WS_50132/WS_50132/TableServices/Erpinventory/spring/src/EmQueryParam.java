package emrest.spring;  
 
public class EmQueryParam { 
		String[][] queryLine; 
		//= new String[10][6]; 
		String[] queryArray; 
		//= new String[12]; 
 
	EmQueryParam(){ 
		queryLine = new String[10][6]; 
		queryArray = new String[12]; 
	} 
 
    public void setQueryLine(String[][] value) { 
        this.queryLine = value; 
    } 
    public String[][] getQueryLine() { 
        return queryLine; 
    } 
    public void setQueryArray(String[] value) { 
        this.queryArray = value; 
    } 
    public String[] getQueryArray() { 
        return queryArray; 
    } 
} 
 
