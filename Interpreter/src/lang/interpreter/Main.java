package lang.interpreter;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.*;
import lang.LangParser;
import lang.LangLexer;

public class Main {
   public static void main(String[] args) {
      LangLexer lexer = new LangLexer(CharStreams.fromString("main(){ print fat(10)[0];}"));
     // LangLexer lexer = new LangLexer(CharStreams.fromFile(args[0]));
      LangParser parser = new LangParser(new CommonTokenStream(lexer));

       ParserTree tree = parser.prog();
       System.out.println(tree.toStringTree(parser));
   }
}



