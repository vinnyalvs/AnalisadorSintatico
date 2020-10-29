package lang.ast;

public class Node extends SuperNode {

    private int line,col;

    public Node(){};

    public Node(int l, int c){
        line = l;
        col = c;
    }

    @Override
    public int getLine() {
        return 0;
    }

    @Override
    public int getColumn() {
        return 0;
    }
}
