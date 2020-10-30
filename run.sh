#!/bin/bash
java -jar ./antlr-4.8-complete.jar -o ./parser/ Lang.g4
javac -cp .:antlr-4.8-complete.jar ast/*.java parser/*.java LangCompiler.java -d .
java -classpath .:antlr-4.8-complete.jar lang.LangCompiler -bs

