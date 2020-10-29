package lang.parser;

import lang.antlr.LangLexer;
import lang.antlr.LangParser;
import lang.ast.Node;
import lang.ast.SuperNode;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.*;

import java.io.IOException;


public class LangAdaptor implements ParseAdaptor {
    @Override
    public SuperNode parseFile(String path) throws IOException {

        LangLexer lexer = new LangLexer(CharStreams.fromFileName(path));
        LangParser parser = new LangParser(new CommonTokenStream(lexer));

        ParseTree tree = parser.prog();
       // System.out.println(tree.toStringTree(parser));
        if( parser.getNumberOfSyntaxErrors() > 0)
            return null;

        SuperNode node = new Node();

        return node;
    }

}
