import 'package:flutter/material.dart';
import 'package:smooth_sort/smooth_sort.dart';
import 'planets.dart';
import 'package:item_selector/item_selector.dart';
import 'package:show_more_text_popup/show_more_text_popup.dart';
import 'package:url_launcher/url_launcher.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Gezegenler",
      home: new Home(),
      theme: new ThemeData(primaryColor: Colors.deepPurple),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    List<planets> gezegenIcerik = [
      planets(
          isim: "Merkür",
          gorsel: "Images/merkür.png",
          bilgi:
              "Güneş Sistemi'ndeki en küçük ve Güneş'e en yakın gezegen. Yaklaşık 88 Dünya gününe eşit yörünge süresi ile Güneş Sistemi'ndeki diğer gezegenlerden daha hızlıdır. Dünya'dan bakıldığında, kendi yörüngesi etrafında 116 günde hareket ettiği görünür. Bilinen hiç doğal uydusu yoktur. Adını tanrıların habercisi Roma tanrısı Merkür'den alır."),
      planets(
          isim: "Venüs",
          gorsel: "Images/venüs.png",
          bilgi:
              "Venüs, Güneş Sisteminde, Güneş'e uzaklık bakımından ikinci sıradaki, sıcaklık bakımından da birinci sıradaki gezegendir. Güneşe uzaklık bakımından ikinci sırada olmasına rağmen en sıcak gezegen olmasının nedeni de atmosferinin gelen güneş ışınlarının dışarı çıkmasına izin vermemesidir. Ayrıca Zühre, Çolpan veya Çoban Yıldızı olarak da bilinir. Bu gezegen adını Eski Roma tanrıçası Venüs (Eski Yunan Mitolojisi'nde Afrodit)'ten almıştır. Venüs'ün astronomik sembolü ise kadınlık sembolü ile aynıdır. Kendi ekseni etrafında, Güneş Sistemi'ndeki diğer tüm gezegenlerin aksi istikametinde döner. Güneş etrafındaki dönüşünü 224.7 Dünya gününde tamamlar."),
      planets(
          isim: "Dünya",
          gorsel: "Images/dünya.png",
          bilgi:
              "Dünya, Güneş Sistemi'nde Güneş'e en yakın üçüncü gezegen olup şu an için üzerinde yaşam ve sıvı su barındırdığı bilinen tek astronomik cisimdir. Radyometrik tarihleme ve diğer kanıtlara göre 4,5 milyar yıldan fazla süre önce oluşmuştur. Dünya'nın yerçekimi, uzaydaki diğer nesnelerle, özellikle Güneş'le ve tek doğal uydusu Ay'la etkileşime girer. Dünya'nın Güneş'in etrafındaki yörüngesi, 365,256 güneş gün, yani bir yıldız yılı sürer. Bu süre içerisinde Dünya, kendi ekseni etrafında 366,265 kez döner."),
      planets(
          isim: "Mars",
          gorsel: "Images/mars.png",
          bilgi:
              "Mars, Güneş Sistemi'nin Güneş'ten itibaren dördüncü gezegeni. Roma mitolojisindeki savaş tanrısı Mars'a ithafen adlandırılmıştır. Yüzeyindeki yaygın demir oksitten dolayı kızılımsı bir görünüme sahip olduğu için 'Kızıl Gezegen' de denir. İnce bir atmosferi olan Mars gerek Ay'daki gibi meteor kraterlerini, gerekse Dünya'daki gibi volkan, vadi, çöl ve kutup bölgelerini içeren çehresiyle bir yerbenzeri gezegendir. Ayrıca dönme periyodu ve mevsim dönemleri Dünya’nınkine çok benzer. 2 adet uydusu bulunmaktadır."),
      planets(
          isim: "Jüpiter",
          gorsel: "Images/jupiter.png",
          bilgi:
              "Jüpiter (Erendiz, Müşteri), Güneş Sistemi'nin en büyük gezegeni. Güneş'ten uzaklığa göre beşinci sırada yer alır. Adını Roma mitolojisindeki tanrıların en büyüğü olan Jüpiter'den alır. Büyük ölçüde hidrojen ve helyumdan oluşmakta ve gaz devi sınıfına girmektedir."),
      planets(
          isim: "Satürn",
          gorsel: "Images/satürn.png",
          bilgi:
              "Satürn (eski adı ile Zühal) Güneş Sisteminin Güneş'e yakınlık sırasına göre 6. gezegenidir. Büyüklük açısından Jüpiter'den sonra ikinci sırada gelir. Adını Yunan mitolojisindeki Kronos'tan alır. Çıplak gözle izlenebilen 5 gezegenden biri (diğerleri, Merkür, Venüs, Mars ve Jüpiter) olarak eski çağlardan beri insanoğlunun dikkatini çekmiştir. Büyük ölçüde hidrojen ve helyumdan oluşmakta ve gaz devleri sınıfına girmektedir."),
      planets(
          isim: "Uranüs",
          gorsel: "Images/uranüs.png",
          bilgi:
              "Uranüs, Güneş Sisteminin Güneş'den uzaklık sıralamasına göre 7. gezegenidir. Çap açısından Jüpiter ve Satürn'den sonra üçüncü, kütle açısından bu iki gezegen ve Neptün'ün ardından dördüncü sırada gelir. Adını Yunan mitolojisi'ndeki gökyüzü tanrısı Uranos'tan (Yunanca'da Οὐρανός, Latinceleştirilmiş şekli ile Uranus) alır. 1781 yılında William Herschel tarafından bulunmuştur. Buz devleri sınıfına girmektedir."),
      planets(
          isim: "Neptün",
          gorsel: "Images/neptün.png",
          bilgi:
              "Neptün, Güneş Sistemi'nin sekizinci, Güneş'e en uzak ve katı yüzeyi bulunmayan gezegendir. Gaz gezegenler sınıfında yer alan Neptün, Jupiter ve Satürn'e kıyasla farklı yapısından ötürü buz devi olarak da sınıflandırılır. Güneş sisteminin Uranüs ile beraber en soğuk iki gezegeninden biridir. Katı yüzeye sahip olmamakla birlikte gezegenin dış katmanı genel olarak hidrojen ve helyumdan oluşur. İç katmanda ise gezegenin kütlesinin çoğu kayalık bir çekirdeğin üzerindeki sıcak ve yoğun maddelerden (su, metan ve amonyak) oluşur. Adını Roma deniz tanrısı Neptunus'ten alan gezegen, çapına göre en büyük dördüncü, kütlesine göre ise en büyük üçüncü gezegendir. Dünya'nın 17 katı kütlesiyle ikizi sayılabilecek Uranüs'ten çok az büyük ve daha yoğundur. Güneş'e olan uzaklığı ortalama 30 Astronomik birimdir")
    ];
    var gridList = new GridView.builder(
      itemCount: gezegenIcerik.length,
      gridDelegate:
          new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return new GestureDetector(
          child: new Card(
              elevation: 5.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(gezegenIcerik[index].gezegenIsim),
                  Image.asset(
                    gezegenIcerik[index].gezegenGrsl,
                    width: 100.0,
                    height: 100.0,
                  ),
                ],
              )),
          onTap: () {
            showDialog(
                builder: (context) => new AlertDialog(
                      title: new Column(
                        children: <Widget>[
                          Text(gezegenIcerik[index].gezegenIsim),
                          Image.asset(
                            gezegenIcerik[index].gezegenGrsl,
                            width: 50.0,
                            height: 50.0,
                          )
                        ],
                      ),
                      content: new Text(gezegenIcerik[index].gezegenHk),
                      actions: <Widget>[
                        new FlatButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: new Text("KAPAT")),
                      ],
                    ),
                barrierDismissible: false,
                context: context);
          },
        );
      },
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("GEZEGENLER"),
      ),
      body: gridList,
    );
  }
}

void main() {
  runApp(new MyApp());
}
