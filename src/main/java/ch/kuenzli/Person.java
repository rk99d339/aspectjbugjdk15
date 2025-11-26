package ch.kuenzli;

@ChangeAnnotation
public class Person {
    private String name;
    private String prename;

    public String getPrename() {
        return prename;
    }

    public void setPrename(String prename) {
        this.prename = prename;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
