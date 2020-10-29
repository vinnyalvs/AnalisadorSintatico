package lang.ast;

import java.util.HashMap;

public class Exp extends Node {
    public Exp(int l, int c){
        super(l, c);
    }

    @Override
    public int interpret(HashMap<String, Integer> m) {
        return 0;
    }

}
