package Bean;

public class GoodsBean {
    private int id;
    private int buildNumber;
    private String goodsName;
    private String goodsDate;
    private String goodsDetial;

    public GoodsBean() {
    }

    public GoodsBean(int buildNumber, String goodsName, String goodsDate, String goodsDetial) {
        this.buildNumber = buildNumber;
        this.goodsName = goodsName;
        this.goodsDate = goodsDate;
        this.goodsDetial = goodsDetial;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getBuildNumber() {
        return buildNumber;
    }

    public void setBuildNumber(int buildNumber) {
        this.buildNumber = buildNumber;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public String getGoodsDate() {
        return goodsDate;
    }

    public void setGoodsDate(String goodsDate) {
        this.goodsDate = goodsDate;
    }

    public String getGoodsDetial() {
        return goodsDetial;
    }

    public void setGoodsDetial(String goodsDetial) {
        this.goodsDetial = goodsDetial;
    }
}
