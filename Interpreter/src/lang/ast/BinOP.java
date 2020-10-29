package lang.ast;

public class BinOP extends Exp {

    private Exp l;
    private Exp r;

    public BinOP(int lin, int col, Exp l, Exp r){
        super(lin,col);
        this.l = l;
        this.r = r;
    }

    public void setLeft(Exp n){  l = n; }
    public void setRight(Exp n){ r = n; }

    public Exp getLeft(){ return l;}
    public Exp getRight(){ return r;}

}

