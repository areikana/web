# app/controllers/cooks_controller.rb
class CooksController < ApplicationController
  # 気分ごとのレシピリスト

MOOD_RECIPES = {
 "疲れた" => [
    { name: "簡単薬膳スープ（疲労回復）", url: "https://www.kurashiru.com/recipe_cards/bff815b1-1bfe-44e8-b3d3-c57da4effec4" },
    { name: "豚ひき肉とニラのスタミナ丼", url: "https://www.kurashiru.com/recipes/4abb11d9-df23-443c-942a-abe9dbc3244c" },
    { name: "トマキムとろろ牛しゃぶ丼", url: "https://www.kurashiru.com/recipes/f65ffd41-bfd1-43c3-be75-d2863bec7cc2" }
  ],
  "頭痛い" => [
    { name: "あったか湯豆腐", url: "https://www.kurashiru.com/recipe_cards/f6ee0890-3d15-4d8d-8615-cc25203de3ee" },
    { name: "レモンジンジャーティー", url: "https://www.kurashiru.com/recipe_cards/157be5e4-9f17-46b1-905a-16afdb2a347d" },
    { name: "梅しらすの豆腐卵がゆ", url: "https://www.kurashiru.com/recipe_cards/a970b27b-6918-4735-b74b-764fa73bf94d" }
  ],
  "眠い" => [
    { name: "鶏肉と長芋の薬膳スープ", url: "https://www.kurashiru.com/recipe_cards/2e35df15-a56a-47a7-b53f-ae6d9bbfc4f5" },
    { name: "鶏むね肉の塩麹グリル", url: "https://www.kurashiru.com/recipe_cards/ae862b00-7308-47f4-aef7-b09b6373a101"},
    { name: "レンズ豆の具だくさんコンソメスープ", url: "https://www.kurashiru.com/recipes/aa9e4761-934e-458a-b270-51cfa96ebd2e" }
  ],
  "ストレスあり" => [
    { name: "セロリと豚の炒め物", url: "https://delishkitchen.tv/recipes/247775920578888018" },
    { name: "きのこたっぷりスープ", url: "https://www.kurashiru.com/recipes/80dc0417-8748-448d-ab59-e7d8e8383194" },
    { name: "豆もやしの中華風サラダ", url: "https://www.kurashiru.com/recipes/886c8ab6-1a70-43c0-b3a8-390b74f8a92b" }
  ],
  "やる気なし" => [
    { name: "さつまいもと鶏肉の甘辛コチュジャン炒め", url: "https://www.kurashiru.com/recipes/4299407a-2b06-4cd2-83cb-93622d6c3946" },
    { name: "野菜たっぷりそぼろ丼", url: "https://delishkitchen.tv/recipes/381143820512789519" },
    { name: "ほうれん草と卵の炒め物", url: "https://www.kurashiru.com/shorts/57864f5b-e6d4-4f9e-a216-d129cbf718b5" }
  ],
  "食欲低下" => [
    { name: "ふんわり卵のあったか味噌雑炊", url: "https://www.kurashiru.com/recipes/721159f7-b13f-41db-93f4-f9c3bbb01295" },
    { name: "具沢山ミネストローネ", url: "https://www.kurashiru.com/recipes/215dc346-ec32-41ce-80dc-1fff99930c73" },
    { name: "野菜のスムージー", url: "https://www.kurashiru.com/recipes/f46eb99f-c7ee-4146-aa15-3ad001101b6a" }
  ],
  "だるい" => [
    { name: "もやしと豆苗たっぷり 豚しゃぶサラダ", url: "https://www.kurashiru.com/recipes/6a9b09a5-4492-47d7-941d-00e5f91afb2a" },
    { name: "鶏むね肉の甘辛みぞれ煮", url: "https://www.kurashiru.com/recipes/cc497c48-2264-4f0c-9860-27c6a3df6e08" },
    { name: "鶏団子の生姜スープ", url: "https://www.kurashiru.com/recipes/4e941db1-9c61-4461-aada-19b95bbcc27a" }
  ],
  "集中できない" => [
    { name: "ナッツとドライフルーツ", url: "https://www.kurashiru.com/recipe_cards/45d3e71b-2f3d-4614-9e7f-bd9c42605c27" },
    { name: "チキンと北海道ブロッコリーのフライパングリル", url: "https://www.kurashiru.com/recipes/5aa18fae-9bf7-4146-85c5-62038c7546d3" },
    { name: "トマトと豆のサラダマリネ", url: "https://www.kurashiru.com/recipe_cards/6dad4cec-9fd8-4847-9dcf-388e47da21b7" }
  ],
  "元気" => [
    { name: "豚ひき肉とニラの簡単スタミナ丼", url: "https://www.kurashiru.com/recipes/4abb11d9-df23-443c-942a-abe9dbc3244c" },
    { name: "照り焼きチキン", url: "https://www.kurashiru.com/recipes/459512b1-1c95-4a59-917d-4363f440d0a7" },
    { name: "豚肉と野菜の炒め物", url: "https://www.kurashiru.com/recipes/19e60ad4-b40d-40f8-8b07-9fdaae3a5184" }
  ],
  "眠れない" => [
    { name: "きな粉と黒蜜のホットミルク", url: "https://www.kurashiru.com/recipes/fc53c165-353e-4c26-b844-95b6ef97cbc2" },
    { name: "アップルジュースカモミールティー", url: "https://cookpad.com/jp/recipes/21190082?ref=search&search_term=%E3%82%AB%E3%83%A2%E3%83%9F%E3%83%BC%E3%83%AB%E3%83%86%E3%82%A3%E3%83%BC" },
    { name: "ナッツとフルーツのサラダ", url: "https://cookpad.com/jp/recipes/17553638" }
  ],
  "集中できない" => [
    { name: "チキンとブロッコリーの炒め物", url: "https://www.kurashiru.com/recipes/5aa18fae-9bf7-4146-85c5-62038c7546d3" },
    { name: "手作りグラノーラ", url: "https://www.kurashiru.com/recipes/027a5648-9acf-49fd-a5f4-545e71403901" },
    { name: "トマトと豆のサラダ", url: "https://delishkitchen.tv/recipes/161811694429929964" }
  ],
  "元気" => [
    { name: "ビビンバ丼", url: "https://delishkitchen.tv/recipes/296894853659231357" },
    { name: "鶏の照り焼き", url: "https://delishkitchen.tv/recipes/156574166026289644" },
    { name: "豚肉となすの照り炒め", url: "https://delishkitchen.tv/recipes/314018940663628189" }
  ],
  "肩こり" => [
    { name: "餃子入りサンラータン", url: "https://delishkitchen.tv/recipes/216164885162099871" },
    { name: "豚バラと根菜の甘辛煮", url: "https://delishkitchen.tv/recipes/384187542854960179" },
    { name: "小松菜と根菜のホットサラダ", url: "https://delishkitchen.tv/recipes/166420960201671148" }
  ],
  "胃もたれ" => [
    { name: "たっぷり薬味おぼろ豆腐丼", url: "https://delishkitchen.tv/recipes/203006548962705830" },
    { name: "鮭とたまごの雑炊", url: "https://delishkitchen.tv/recipes/408107699302039880" },
    { name: "ささみとレタスの春雨スープ", url: "https://delishkitchen.tv/recipes/137619821675151779" }
  ],
  "風邪気味" => [
    { name: "生姜スープ", url: "h" },
    { name: "ネギと鶏のスープ", url: "" },
    { name: "にんじんと根菜の煮物", url: "" }
  ],
  "疲れ目" => [
    { name: "ほうれん草とにんじんのスープ", url: "" },
    { name: "ブルーベリースムージー", url: "" },
    { name: "温野菜サラダ", url: "" }
  ],
  "寒気" => [
    { name: "生姜紅茶", url: "" },
    { name: "鶏団子スープ", url: "" },
    { name: "かぼちゃのポタージュ", url: "" }
  ],
  "不安" => [
    { name: "レモンとミントのハーブティー", url: "" },
    { name: "豆腐と野菜のスープ", url: "" },
    { name: "にんじんと根菜の煮物", url: "" }
  ],
  "甘いもの食べたい" => [
    { name: "バナナパンケーキ", url: "" },
    { name: "チョコバナナスムージー", url: "" },
    { name: "スイートポテト", url: "" }
  ],
  "やる気満々" => [
    { name: "スタミナカレー", url: "" },
    { name: "鶏の照り焼き丼", url: "" },
    { name: "豚肉と野菜の炒め物", url: "" }
  ]
}

    
  def new
    @cook = Cook.new
  end

  def create
    selected_health = params[:cook][:health]
    @recipes = MOOD_RECIPES[selected_health] || []

    # show に渡す
    render :show
  end

  def show
    # @recipes は create から渡される
  end
end
