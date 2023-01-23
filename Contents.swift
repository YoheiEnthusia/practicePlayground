// ALSの資格を持っているか（CPRを行うことができる）
protocol AdvancedLifeSupport {
    func performCPR()
}

// ①ナースコールを受けて、当直へ引き継ぐ電話番
class EmergencyCallHandler {
    // 引き継ぎ先の当直は、ALSの資格がある人だけ
    var delegate: AdvancedLifeSupport? // delegate == "~に任せる"
    
    // 容態を聞く
    func assessSituation() {
        print("どうしましたか？")
    }
    
    // 当直にCPRを実行させる
    func medicalEmergency() {
        delegate?.performCPR()
    }
}

// ②当直の救急隊員
struct Paramedic: AdvancedLifeSupport {
    init(handler: EmergencyCallHandler) {
        // 当直を自分に設定する
        handler.delegate = self
    }
    
    func performCPR() {
         print("胸圧実施中")
    }
}


// A:今日の電話番はりかこ。救急隊員は俺。
let rikako = EmergencyCallHandler()
let yohei = Paramedic(handler: rikako)

// りかこは容態を聞く
rikako.assessSituation()
// りかこは、当直にCPRを任せる
rikako.medicalEmergency() // 胸圧実施中
 
// B:当直を大文字に交代
class Doctor: AdvancedLifeSupport {
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    
    func performCPR() {
        print("失敗しないので機械でCPR。")
    }
}

let daimonji = Doctor(handler: rikako)

rikako.assessSituation()
rikako.medicalEmergency() // 失敗しないので機械でCPR。

