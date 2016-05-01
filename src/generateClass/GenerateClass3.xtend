package generateClass

class GenerateClass3 {
  def static void main(String[] args){
  	val attributes = newArrayList("clientNo","firstName","lastName")
  	val types = newArrayList("int","String","String")
  	println("Generated Java Code:\n====================\n")
	generateClass3("Client",attributes,types)
	println()
}

def static generateClass3(String className, String[] propertyNames, String[] typeNames){
  var seq = '''public class «className» extends Object{'''
  seq = seq + generateProperties(propertyNames,typeNames)
  seq = seq + generateGettersAndSetters(propertyNames,typeNames)+'''}'''
  println(seq)
  }

def static generateProperties(String[] propertyNames, String []typeNames) {
  var seq = ""
  for (int i: 0..propertyNames.size-1)
    seq = seq + generateProperty(propertyNames.get(i),typeNames.get(i))
  return seq
}
	
def static generateProperty(String propertyName, String typeName) ''' 
  protected «typeName» «propertyName»;
'''

def static generateGettersAndSetters(String[] propertyNames, String[] typeNames) {
  var seq = ""
  for (int i: 0.. propertyNames.size-1)
    seq = seq + generateGetterAndSetter(propertyNames.get(i),typeNames.get(i))
  return seq
}

def static generateGetterAndSetter(String propertyName, String typeName) '''

  public «typeName» get«propertyName.toFirstUpper»() {
    return «propertyName»;}
    	
  public void set«propertyName.toFirstUpper»(«typeName» «propertyName»){
    this.«propertyName» = «propertyName»;}
'''


   def static String toFirstUpper(String str) {
     str.substring(0,1).toUpperCase() + str.substring(1)
   }

}