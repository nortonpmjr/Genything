import Foundation
import Genything

enum ScriptGen {
    /// A template which supports the following substitutions:
    /// `verb`: A past tense verb
    /// `verb-past`: A past tense verb
    /// `noun`: Noun
    /// `nouns`: Plural Noun
    /// `adjective`: Adjective
    static let scripts = [
        "“${verb} your ${noun}!” ${verb-past} a ${adjective} voice, as a ${noun} started up from among the ${nouns} at the side of the ${noun} porch.",
        "A fearful ${noun}, all in ${adjective} gray, with a ${adjective} ${noun} on his leg. A man with no ${noun}, and with ${adjective} ${nouns}, and with a ${adjective} ${noun} tied round his ${noun}.",
        "I had often ${verb-past} a ${adjective} ${noun} of ours eating his ${noun}; and I now noticed a decided similarity between the ${noun}'s way of eating, and the ${noun}'s.",
        "I fully expected to find a ${noun} in the ${noun}, waiting to ${verb} me up. But not only was there no ${noun} there, but no discovery had yet been made of the ${adjective} robbery."
    ]

    static let nouns = [
        "apple","badge","basketball","battle","beast","beetle","brain","bubble","bucket","cactus","cannon","cow","celery stick","chicken","donkey","goose","nose","turkey","food"
    ]

    static let verbs = [
        "question", "add", "itch","reach", "allow", "jog","rinse", "bake", "jump","run", "bang", "jump","scatter", "call", "kick","stay", "chase", "knit","swim", "damage", "land","talk", "drop", "lock","turn", "end", "march","untie", "escape", "mix","use", "fasten", "name","vanish", "fix", "notice","visit", "gather", "obey","walk", "grab", "open","work", "hang", "pass","yawn", "hug", "pitch","yell", "imagine", "promise"
    ]

    static let verbsPast = [
        "came","wrote","ran","drove","began","swung","darted","spoke"
    ]

    static let adjectives = [
        "abundant","delightful","high","nutritious","square","adorable","dirty","hollow","obedient","steep","agreeable","drab","hot","obnoxious","sticky","alive","dry","hot","odd","straight","angry","dusty","huge","old","strong","beautiful","eager","icy","orange","substantial","better","early","immense","panicky","sweet","bewildered","easy","important","petite","swift","big","elegant","inexpensive","plain","tall","bitter","embarrassed","itchy","powerful","tart","black","empty","jealous","prickly","tasteless","blue","faint","jolly","proud","teeny","boiling","faithful","juicy","puny","teeny-tiny","brave","famous","kind","purple","tender","breeze","fancy","large","purring","thankful","broad","fast","late","quaint","thoughtless","broken","fat","lazy","quick","tiny","bumpy","few","light","quiet","ugliest","calm","fierce","little","rainy","ugly","careful","filthy","lively","rapid","uneven","chilly","flaky","long","red","uninterested","chubby","flat","loose","relieved","unsightly","clean","fluffy","loud","repulsive","uptight","clever","freezing","low","rich","vast","clumsy","fresh","lumpy","rotten","victorious","cold","full","magnificent","round","warm","colossal","gentle","mammoth","salty","weak","cool","gifted","many","scary","wet","creepy","gigantic","massive","scrawny","west","crooked","glamorous","melted","screeching","whispering","cuddly","gray","messy","shallow","white","curly","greasy","miniature","short","wide","curved","great","modern","shy","wide-eyed","damaged","green","mushy","silly","witty","damp","grumpy","mysterious","skinny","wooden","dead","handsome","narrow","slow","worried","deafening","happy","nervous","small","wrong","deep","heavy","nice","soft","yellow","defeated","helpful","noisy","sparkling","young","delicious","helpless","numerous","sparse","yummy"
    ]

    static let generator = Gen.of(scripts).flatMap {
        .replacing($0, with: [
            (replace: "${verb}", by: Gen.of(verbs)),
            (replace: "${verb-past}", by: Gen.of(verbsPast)),
            (replace: "${noun}", by: Gen.of(nouns)),
            (replace: "${nouns}", by: Gen.of(nouns).map { $0 + "s" }),
            (replace: "${adjective}", by: Gen.of(adjectives)),
        ])
    }
}
