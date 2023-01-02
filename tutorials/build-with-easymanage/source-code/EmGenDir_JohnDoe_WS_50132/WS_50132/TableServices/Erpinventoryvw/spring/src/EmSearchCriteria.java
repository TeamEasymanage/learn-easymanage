package emrest.spring;

public class EmSearchCriteria {

    private String andOr;
    private String key;
    private String operation;
    private Object value;

    public EmSearchCriteria() {

    }

    public EmSearchCriteria(final String andOr, final String key, final String operation, final Object value) {
        super();
        this.andOr = andOr;
        this.key = key;
        this.operation = operation;
        this.value = value;
    }

    public String getAndOr() {
        return andOr;
    }

    public void setAndOr(final String andOr) {
        this.andOr = andOr;
    }

    public String getKey() {
        return key;
    }

    public void setKey(final String key) {
        this.key = key;
    }

    public String getOperation() {
        return operation;
    }

    public void setOperation(final String operation) {
        this.operation = operation;
    }

    public Object getValue() {
        return value;
    }

    public void setValue(final Object value) {
        this.value = value;
    }

}