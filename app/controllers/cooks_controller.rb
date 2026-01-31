# app/controllers/cooks_controller.rb
class CooksController < ApplicationController
  # 気分ごとのレシピリスト

MOOD_RECIPES = {
  "頭痛い" => {
    1 => { name: "あったか湯豆腐", url: "https://www.kurashiru.com/recipe_cards/f6ee0890-3d15-4d8d-8615-cc25203de3ee" },
    2 => { name: "レモンジンジャーティー", url: "https://www.kurashiru.com/recipe_cards/157be5e4-9f17-46b1-905a-16afdb2a347d" },
    3 => { name: "梅しらすの豆腐卵がゆ", url: "https://www.kurashiru.com/recipe_cards/a970b27b-6918-4735-b74b-764fa73bf94d" }
  },
  "ストレス" => {
    1 => { name: "セロリと豚の炒め物", url: "https://delishkitchen.tv/recipes/247775920578888018" },
    2 => { name: "きのこたっぷりスープ", url: "https://www.kurashiru.com/recipes/80dc0417-8748-448d-ab59-e7d8e8383194" },
    3 => { name: "豆もやしの中華風サラダ", url: "https://www.kurashiru.com/recipes/886c8ab6-1a70-43c0-b3a8-390b74f8a92b" }
  },
  "やる気なし" =>{
    1 => { name: "さつまいもと鶏肉の甘辛コチュジャン炒め", url: "https://www.kurashiru.com/recipes/4299407a-2b06-4cd2-83cb-93622d6c3946" },
    2 => { name: "野菜たっぷりそぼろ丼", url: "https://delishkitchen.tv/recipes/381143820512789519" },
    3 => { name: "ほうれん草と卵の炒め物", url: "https://www.kurashiru.com/shorts/57864f5b-e6d4-4f9e-a216-d129cbf718b5" }
  },
  "食欲低下" => {
    1 => { name: "ふんわり卵のあったか味噌雑炊", url: "https://www.kurashiru.com/recipes/721159f7-b13f-41db-93f4-f9c3bbb01295" },
    2 => { name: "具沢山ミネストローネ", url: "https://www.kurashiru.com/recipes/215dc346-ec32-41ce-80dc-1fff99930c73" },
    3 => { name: "野菜のスムージー", url: "https://www.kurashiru.com/recipes/f46eb99f-c7ee-4146-aa15-3ad001101b6a" }
  },
  "集中できない" => {
    1 => { name: "ナッツとドライフルーツ", url: "https://www.kurashiru.com/recipe_cards/45d3e71b-2f3d-4614-9e7f-bd9c42605c27" },
    2 => { name: "チキンと北海道ブロッコリーのフライパングリル", url: "https://www.kurashiru.com/recipes/5aa18fae-9bf7-4146-85c5-62038c7546d3" },
    3 => { name: "トマトと豆のサラダマリネ", url: "https://www.kurashiru.com/recipe_cards/6dad4cec-9fd8-4847-9dcf-388e47da21b7" }
  },
  "胃もたれ" => {
    1 => { name: "たっぷり薬味おぼろ豆腐丼", url: "https://delishkitchen.tv/recipes/203006548962705830" },
    2 => { name: "鮭とたまごの雑炊", url: "https://delishkitchen.tv/recipes/408107699302039880" },
    3 => { name: "ささみとレタスの春雨スープ", url: "https://delishkitchen.tv/recipes/137619821675151779" }
  },
  "風邪気味" => {
    1 => { name: "生姜スープ", url: "h" },
    2 => { name: "ネギと鶏のスープ", url: "" },
    3 => { name: "にんじんと根菜の煮物", url: "" }
  },
  "眠れない" => {
    1 => { name: "ほうれん草とにんじんのスープ", url: "" },
    2 => { name: "ブルーベリースムージー", url: "" },
    3 => { name: "温野菜サラダ", url: "" }
  },
  "冷え性" => {
    1 => { name: "生姜紅茶", url: "" },
    2 => { name: "鶏団子スープ", url: "" },
    3 => { name: "かぼちゃのポタージュ", url: "" }
  },
  "肩・首のこり" => {
    1 => { name: "レモンとミントのハーブティー", url: "" },
    2 => { name: "豆腐と野菜のスープ", url: "" },
    3 => { name: "にんじんと根菜の煮物", url: "" }
  }
}

    
  def new
    @cook = Cook.new
  end

  def create
    health = params[:cook][:health]
    level = params[:cook][:level].to_i

    @recipe = MOOD_RECIPES.dig(health, level)

    render :show
  end
end

