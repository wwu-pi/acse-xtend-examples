package generateTables

class GenerateTables {
  def static void main(String[] args){
  	val Model model = Auxiliary.createModel
  	println("Generated DB Tables:")
  	generateTables(model)
}

  def static generateTables(Model model){
  	val classes = model.classes
  	for (cl: classes) 
  	  println(generateTable(cl))	
  }
     
  def static generateTable(Class clazz) ''' 
    CREATE TABLE «clazz.name»(
      «FOR att: clazz.attributes SEPARATOR ','»
        «att.name»  «transform(att.type)»  «IF isRequired(att)»  NOT NULL  «ENDIF»
      «ENDFOR»
    );
	'''
  def static transform(String type){
    switch type {
      case "int": "INT"
      case "String": "VARCHAR(20)"
      case "Date": "DATE"
    }
  }
  
  def static isRequired(Attribute att){
  	false
 }     
}
