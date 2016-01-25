import java.util.*;

public void setup() {
	String lines[] = loadStrings("words.txt");
	System.out.println("there are " + lines.length + " lines");
	for (int i = 0 ; i < lines.length; i++) {
	  System.out.println(pigLatin(lines[i]));
	}

	System.out.println(" ");

	String hymn[] = loadStrings("LowellHymn.txt");
	for(int i=0;i<hymn.length;i++){//goes through lines
		int theLast=-1;
		for(int iA=0;iA<hymn[i].length();iA++){//goes through chars
			if(hymn[i].substring(iA,iA+1).equals(" ")||
			   hymn[i].substring(iA,iA+1).equals(",")||
			   hymn[i].substring(iA,iA+1).equals(".")){
				System.out.print(pigLatin(hymn[i].substring(theLast+1,iA))+" ");
				theLast=iA;
			}
		}
		System.out.println(" ");
	}
}
public void draw()
{
}
public int findFirstVowel(String sWord){
	//precondition: sWord is a valid String of length greater than 0.
	//postcondition: returns the position of the first vowel in sWord.  If there are no vowels, returns -1
	String lowerWord= new String(sWord.toLowerCase());
	for(int i=0;i<sWord.length();i++){
		if(lowerWord.substring(i,i+1).equals("a")||
			lowerWord.substring(i,i+1).equals("e")||
			lowerWord.substring(i,i+1).equals("i")||
			lowerWord.substring(i,i+1).equals("o")||
			lowerWord.substring(i,i+1).equals("u")
			)
		return i;
	}
	return -1;
}

public String pigLatin(String sWord)
//precondition: sWord is a valid String of length greater than 0
//postcondition: returns the pig latin equivalent of sWord
{	
	String lowerWord= new String(sWord.toLowerCase());

	if(sWord.equals(",")||sWord.equals(".")||sWord.equals("")){
		return sWord;
	}else if(findFirstVowel(sWord) == -1){
		return lowerWord + "ay";
	}else if(findFirstVowel(sWord) == 0){
		return lowerWord+"way";
	}else if(sWord.substring(0,2).equals("qu")){
		return lowerWord.substring(2)+"quay";
	}else if(findFirstVowel(sWord)>0){
		return lowerWord.substring(findFirstVowel(sWord))+lowerWord.substring(0,findFirstVowel(sWord))+"ay";
	}else{
		return "error";
	}
}
