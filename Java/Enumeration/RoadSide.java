public enum RoadSide {
    Left("왼쪽"),
    Right("오른쪽");

    private String krName;

    private RoadSide() {
        //
    }

    private RoadSide(String krName) {
        this.krName = krName;
    }

    public String getKrName() {
        return krName;
    }
    
}