package generateClass

class GenerateClass {
  def static void main(String[] args){
  	println("First Java Code:")
  	println(generateClass("Client","firstName","String"))
  	println()
  	println("Attributes: ")
  	println(Auxiliary::attributes)
  	println("Types: ")
  	println(Auxiliary::types)
  	println()
  	println("Second Generated Java Code:")
	generateClass2("Client",Auxiliary::attributes, Auxiliary::types)
	println()
	println("Third Generated Java Code:")
	println(generateClass3("Client",Auxiliary::attributes, Auxiliary::types))
}

  def static generateClass(String className, String propertyName, String typeName) ''' 
	public class «className» extends Object{
		protected «typeName» «propertyName»;

		public «className»(«typeName» «propertyName»){
			this.«propertyName» = «propertyName»;}
			
		public «typeName» get«propertyName.toFirstUpper»() {
			return «propertyName»;}
			
		public void set«propertyName.toFirstUpper»(«typeName» «propertyName»){
			this.«propertyName» = «propertyName»;}
	}
'''

def static generateClass2(String className, String[] propertyNames, String[] typeNames){
  println('''public class «className» extends Object{''')
  generateProperties(propertyNames,typeNames)
  generateGettersAndSetters(propertyNames,typeNames)
  println('''}''')
  }

def static generateProperties(String[] propertyNames, String []typeNames) {
	for (int i: 0..propertyNames.size-1)
	  println(generateProperty(propertyNames.get(i),typeNames.get(i)))
}
	
def static generateProperty(String propertyName, String typeName) ''' 
		protected «typeName» «propertyName»;
'''

def static generateGettersAndSetters(String[] propertyNames, String[] typeNames) {
		for (int i: 0.. propertyNames.size-1)
	      println(generateGetterAndSetter(propertyNames.get(i),typeNames.get(i)))
}

def static generateGetterAndSetter(String propertyName, String typeName) '''
		public «typeName» get«propertyName.toFirstUpper»() {
			return «propertyName»;}
			
		public void set«propertyName.toFirstUpper»(«typeName» «propertyName»){
			this.«propertyName» = «propertyName»;}
'''

  def static generateClass3(String className, String[] propertyNames, String[] typeNames) ''' 
	public class «className» extends Object{
	  «FOR int i: 0..propertyNames.size-1»
	  protected «typeNames.get(i)» «propertyNames.get(i)»;
	  «ENDFOR»  

	  public «className»(
	    «FOR int i: 0..propertyNames.size-1 SEPARATOR ','»
		«typeNames.get(i)» «propertyNames.get(i)»
	    «ENDFOR»){
	  «FOR int i: 0..propertyNames.size-1»
	  this.«propertyNames.get(i)» = «propertyNames.get(i)»;
	  «ENDFOR»}
	    
	  «FOR int i: 0..propertyNames.size-1»
	  public «typeNames.get(i)» get«propertyNames.get(i).toFirstUpper»() {
	    return «propertyNames.get(i)»;}
	  
	  public void set«propertyNames.get(i).toFirstUpper»(«typeNames.get(i)» «propertyNames.get(i)»){
	    this.«propertyNames.get(i)» = «propertyNames.get(i)»;}
	  
	  «ENDFOR» 
	}
'''

   def static String toFirstUpper(String str) {
     str.substring(0,1).toUpperCase() + str.substring(1)
   }

}