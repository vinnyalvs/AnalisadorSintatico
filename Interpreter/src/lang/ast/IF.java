package lang.ast;

import java.util.HashMap;

public class IF extends CMD {

    private Exp teste;
    private Node els;
    private CMD cmd;

    public IF(int lin, int col, Exp teste, CMD cmd, Node els){
        super(lin,col);
        this.teste = teste;
        this.els = els;
        this.cmd = (CMD) cmd;
    }


    public IF(int lin, int col, Exp teste, CMD cmd){
        super(lin,col);
        this.teste = teste;
        this.cmd = cmd;
        this.els = null;
    }

    public String toString(){
        String s = teste.toString();
        String c = cmd.toString();
        String sels =  els != null ? " : " + els.toString(): "" ;
        s += " ? [" + c + sels + "]";
        return  s.replace('\n', '\0');
    }

    public int interpret(HashMap<String,Integer> m){
        int n =  teste.interpret(m);
        if(n != 0){
            return cmd.interpret(m);
        }else if(els !=null){
            return els.interpret(m);
        }
        return n;
    }
}
