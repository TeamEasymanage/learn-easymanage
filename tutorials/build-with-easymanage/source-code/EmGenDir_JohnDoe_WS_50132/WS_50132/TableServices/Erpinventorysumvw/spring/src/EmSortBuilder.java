package emrest.spring;

import java.util.*;
import org.springframework.data.domain.Sort; 

public final class EmSortBuilder {
    public String sortBy = "";
	boolean gotSort = false;
	public Sort mySort;
	private int initSort = 0;

    public EmSortBuilder(String pSortBy) {
		if (pSortBy != null) {
		sortBy = pSortBy;
		
			if(sortBy.trim().length() > 0) {

			sortBy = sortBy.replace(","," ");
			//System.out.println("proc sort by = "+sortBy);

			String[] words = sortBy.split("\\s+"); // splits by whitespace

			int totWords = words.length;
			int curWord = 0;
			/*
			for (int i=0;i<words.length;i++) {
				System.out.println("to processing word ("+i+") [" + words[i]+"]");
			}
			*/

				for (int i=0;i<words.length;i++) {
					//System.out.println("processing word ("+i+") [" + words[i]+"]");
				if (words[i].trim().length() > 0 ) {
				if (words[i].equalsIgnoreCase("asc") ) {
					continue;
				}
					//System.out.println("got word [" + words[i]+"]");
					//check curWord + next ? if asc/desc
					if (((i + 1) < totWords) && (words[i + 1].equalsIgnoreCase("desc"))) {
						//System.out.println("next word [" + words[i+1]+"]");

						if (initSort == 0) {
							mySort = Sort.by(words[i]).descending();
							initSort++;
						} else {
							mySort = mySort.and(Sort.by(words[i]).descending());
						}
						//System.out.println("Sort: Processed 2 words [" + words[i] + " " + words[i + 1] + "]");
						i++; //used-up 2 words
						gotSort = true;
					} else {
						if (initSort == 0) {
							mySort = Sort.by(words[i]);
							initSort++;
						} else {
							mySort = mySort.and(Sort.by(words[i]));
						}
						//System.out.println("Sort: Processed 1 word [" + words[i] + "]");
						//used-up 1 word
						gotSort = true;
					}
				}//if not blank space word
			}//for
			
			}//if len > 0
			
		}//not null
		
    }//func

}
