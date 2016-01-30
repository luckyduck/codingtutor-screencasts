class Bestellung {
    var datum: String
    var artikel: Int
    weak var zahlung: Zahlung?

    init(datum: String, artikel: Int, zahlung: Zahlung?) {
        self.datum = datum
        self.artikel = artikel
        self.zahlung = zahlung
    }
    
    deinit {
        print("Bestell-Objekt zerstört")
    }
}

class Zahlung {
    var status: String
    var preis: Double
    unowned var bestellung: Bestellung
    
    init(status: String, preis: Double, bestellung: Bestellung) {
        self.status = status
        self.preis = preis
        self.bestellung = bestellung
    }
    
    deinit {
        print("Zahlung-Objekt zerstört")
    }
}

//
//
var bestellung: Bestellung? = Bestellung(datum: "31.01.2018", artikel: 3, zahlung: nil)
bestellung?.datum

var bestellung2: Bestellung? = bestellung
bestellung2?.datum

/*
bestellung = nil
bestellung2 = nil
*/

//
//
var zahlung: Zahlung? = Zahlung(status: "bezahlt", preis: 12.95, bestellung: bestellung!)

bestellung!.zahlung = zahlung

//
// Bestellung/Zahlung wird verarbeitet...

zahlung = nil
bestellung = nil
bestellung2 = nil