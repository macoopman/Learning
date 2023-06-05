# JAVA
--------------------------------

## Install

* Download JDK bits from OpenJDK (tar.gz file)

* Unzip to /usr/lib/jvm folder
	```
	tar xvf {jdk_download}
	```

* set **JAVA_HOME** env variable
	* set to the path /java/lib/jvm/{newVersion}
	* do not include the bin, just to the root folder

* update the PATH env
	```
	export PATH=$JAVA_HOME/bin:$PATH
	``` 

## Install JAVAFx
* Download the JavaFx bits from OpenJDK
* Unzip - ```tar xvf {javafx}
* Move to jdk lib folder i.e. **/usr/lib/jvm**
* Set: ```export PATH_TO_FX=/usr/lib/jvm/{javafx}/lib
* More Setting: https://openjfx.io/openjfx-docs/#install-javafx


--------------------------------------------------------------------------------------------------------------------------
## I/O

### Read from terminal
To read from the terminal you need to use the **Scanner** class and take **System.in** as an argument
```
Scanner scanner = new Scanner(System.in)'
```

### Read From File
To read from a file use the **Scanner** class with args: **Path** object (path to file), and a **StandardCharset** 
```
Scanner in = new Scanneer(Path.of("myfile.txt", StandardCharset.UTF_8);
```

### Write To File
To write to file use the **PrintWriter** class with the args: String path of file location and **StandardCharset**
```
PrintWriter writer = new PrintWriter("file.txt", StandardCharset.UTF_8);
```



--------------------------------------------------------------------------------------------------------------------------
## JAR File (Java Archive)
JAR files contain both class files and other file types such as images and sound files.

### Using JAR files
1. Place all files into a directory
2. Set the *class path*
	* The class path is athe collection of all locations that can contain class file
	* EX (unix) -> ``` /home/user/classdir:.:/home/user/archives/archives.jar ```
	* Note: wildcards are allowed

### Create JAR File
Use the **jar** tool
```
jar cvf jarFilename file1, file2, ...
```

Options:
	* c		-> Creates a new or empty archive and adds files to it. If any of the specified file names are directories, the *jar* program process them recursively.
	* C		-> Temporarily changes the directory. 
	* e		-> Creates an entry point in the manifest
	* f		-> Specifies the JAR file name as the second command-line arg
	* i		-> Creates an index file
	* m		-> Adds a manifest to the JAR file. A manifes is a description of the archive contents and origin.
	* M		-> Does not create manifest fiel for the entries.
	* t		-> Display the table of contest
	* u		-> Updates an existing JAR file
	* v		-> Generates verbose output
	* x		-> Extracts files
	* O		-> Stores without ZIP compression

### Manifest ( MANIFEST.MF )
Manifest describes special features of the archive.
* Located in the **META-INF** subdir of JAR file

Add manifest to jar
```
jar cfm MyArchive.jar manifest.mf com/mycompany/mypkg/*.class
```


--------------------------------------------------------------------------------------------------------------------------
### Functional Interface

| Functional Interface		| Parameter Types	| Return Types	| Abstract Method Name	| Description					| Other methods		|
| ------------------------	| ---------------	| ------------	| -------------------	| -------------------			| ----------------	|
| Runable					| none				| void			| run					| Runs an action without args	|					|
| Supplier<T>				| none				| T				| get					| Supplies a value of type T	|					|
todo: finish list




--------------------------------------------------------------------------------------------------------------------------
## Java Class File Disassembler (javap)

### Disassemble Class
Given a class disassemble to show the bytecode

```
java -c -v {className}
```

* -c	-> Disassemble Code
* -v	-> verbose



--------------------------------------------------------------------------------------------------------------------------
## Maven

* Maven SCM (Source Control/Code Managment) -> http://maven.apache.org/scm

### Set up
1. Download:	wget https://dlcdn.apache.org/maven/maven-3/3.8.8/binaries/apache-maven-3.8.8-bin.tar.gz
2. Unzip:		$ tar -xvf apache-maven-3.6.3-bin.tar.gz
3. Move			$ mv apache-maven-3.6.3 /opt/
4. Set Env Vars:
	M2_HOME='/opt/apache-maven-3.6.3'
	PATH="$M2_HOME/bin:$PATH"

### Configuration
* User-Specifig Configs --> **setting.xml**
	* Location:
		* conf folder of Maven install
		* .m2 folder in home dir

* setting.xml Template
	```xml
	<settings xmlns="http://maven.apache.org/SETTINGS/1.0.0"
			  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
			  xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0
								  http://maven.apache.org/xsd/settings-1.0.0.xsd">

		<LocalRepository/>
		<interativeMode/>
		<offline/>
		<pluginGroups/>
		<servers/>
		<mirrors/>
		<proxies/>
		<activeProfiles/>

	<settings/>

```
### Maven Coordinate
**GroupId:**
	Unqiue identifier amongs and organization or a project. 

**ArtifactId**
	Name of the project

**Version**
	**See Version below

### Remote Repository
* Default: Maven Central -> repo.maven.apache.org
		
### Create Project
* Prep: Get all the archetypes: 
		```
		mvn archetype:generate
		```
* Get Std Archetypes: 
		```
		mvn archetype:generate -Dfilter=org.apache.maven.archetypes:
		```
	* Default is the **quick start** archetype

### Archetypes
* ``` mvn archetype:generate ``` -> View and select an archetype for useq

### Building Project
* mvn package
	* Compile and create JAR file
	* Create /target directory

### Versioning
* Recommended: <major>.<minor>.<incremental>-qualifier
	* Major, Minor, Incremental -> numeric
	* qualifier -> ex. RC, alpha, beta, and SNAPSHOT
* What does **SNAPSHOT** mean => Indicates that the project is in a development stage

### Goals And Plug-in
* Overview:
	* **Goals** are packaged in **plug-ins** which are collections of one or more gaols
	* Get plugin info: ``` mvn help:describe -Dplugin=compiler

* Plug-in: **complier**:
	* Goad: **Compile**
		* Usage: ``` mvn compiler:compile ```
		* Identifies code in src/main/java and compiles
		* output to -> target/classes
* Plug-in: **clean**:
	* Goal: **clean**
		* Usage: ``` mvn clean:clean ```
		* Deletes the target folder

### Common Errors
* **OutOfMemory**
	* WHY:	Can happen if running a larg number of test or creating large reports.
	* FIX:	Increase heap size of JVM for Maven
		* Create ENV called **MAVEN_OPTS** AND ADD -Xmx512m

* ** Source option 5 is no longer supported. Use 6 or later**
	* Add the version of java that you are compiling against.
	```
	<properties
	   <maven.compiler.source>20</maven.compiler.source>
	   <maven.compiler.target>20</maven.compiler.target>
	 </properties>
	 ```
--------------------------------------------------------------------------------------------------------------------------

## Unit Testing (JUnit)

### Basic Maven Setup
* Basic Archetype: 
``` 
mvn archetype:generate -DarchetypeGroupId=org.apache.maven.archetypes -DarchetypeArtifactId=maven-archetype-quickstart -DarchetypeVersion=1.4
```	

* Require Dependencies:
```
    <dependencies>
      <dependency>
        <groupId>org.junit.jupiter</groupId>
        <artifactId>junit-jupiter-api</artifactId>
        <version>5.6.0</version>
        <scope>test</scope>
      </dependency>
      <dependency>
        <groupId>org.junit.jupiter</groupId>
        <artifactId>junit-jupiter-engine</artifactId>
        <version>5.6.0</version>
        <scope>test</scope>
      </dependency>
    </dependencies>
```























