package lang.ast;

import java.util.HashMap;

public class CMD extends Node {
    public CMD(int l, int c){
        super(l, c);
    }

    @Override
    public int interpret(HashMap<String, Integer> m) {
        return 0;
    }
}
