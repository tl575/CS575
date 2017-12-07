# CS575
CS575 Final Project

Specs:

Project SDK Java 9
Java EE Version 7
Tomcat 8.5.23
Maven
Intelliji IDEA Ultimate Edition

How to run/build program:

Open with Intelliji IDEA Ultimate Edition
Open Project CS575_FinalProject_TristanLeung

edit configuration -> add tomcat server -> local -> deployment -> add external source -> pick 

CS575_FinalProject_TristanLeung/out/artifact/CS575_FinalProject_TristanLeung_war_exploded/CS575_FinalProject_TristanLeung_war exploded.war

Apply -> Ok

run tomcat 

-------------------------------------------------------------------------------------------------------------------------------
In case Artifact is not present:

 File -> Project Structure -> Artifacts-> Web Application: Archived (name it however you want)
In the Available elements menu -> 

add ‘CS575_FinalProject_TristanLeung’ module: ‘Web’ facet resources
add ‘CS575_FinalProject_TristanLeung’ compiled output
apply -> ok

edit configuration -> add tomcat server -> local -> deployment -> add artifacts -> pick the artifact we just made

run tomcat 
