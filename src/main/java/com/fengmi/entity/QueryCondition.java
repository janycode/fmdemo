package com.fengmi.entity;

public class QueryCondition {
    private String inputGoodsName;
    private String typeId;

    public QueryCondition() {
    }

    public QueryCondition(String inputGoodsName, String typeId) {
        this.inputGoodsName = inputGoodsName;
        this.typeId = typeId;
    }

    public String getInputGoodsName() {
        return inputGoodsName;
    }

    public void setInputGoodsName(String inputGoodsName) {
        this.inputGoodsName = inputGoodsName;
    }

    public String getTypeId() {
        return typeId;
    }

    public void setTypeId(String typeId) {
        this.typeId = typeId;
    }

    @Override
    public String toString() {
        return "QueryCondition{" +
                "inputGoodsName='" + inputGoodsName + '\'' +
                ", typeId='" + typeId + '\'' +
                '}';
    }
}
