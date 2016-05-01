package generateTables;

public class Auxiliary {
	
	public static String[] names =
		{"clientNo","firstName","lastName"};
	public static String[] types = 
		{"int","String","String"};	
	
	public static Model createModel(){
		Attribute[] attributes = new Attribute[names.length];
		
		for(int i = 0; i < attributes.length; ++i){
			attributes[i] = new Attribute(names[i], types[i]);
		}
		
		Class[] classes = new Class[1];
		classes[0] = new Class("Client", attributes);		
		
		return new Model(classes);
	}
}
