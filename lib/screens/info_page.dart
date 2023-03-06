import 'package:beers_styles/utils.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Informacje'), backgroundColor: Colors.brown),
      body: ListView(
        children: [
          buildSectionWidget('OG',
              """OG (Original Gravity, ang. gęstość początkowa) – gęstość brzeczki nastawnej (przed rozpoczęciem fermentacji) wyrażona za pomocą gęstości względnej (SG).

OG można przeliczyć na ekstrakt początkowy wyrażony w stopniach Plato / Ballinga za pomocą odpowiednich narzędzi (zob. linki zewnętrzne).

Szacunkowego przeliczenia niskich i średnich OG można dokonać za pomocą wzoru: °P ≈ 1000(OG-1)/4, czyli dzieląc pierwsze trzy miejsca po przecinku (tzw. gravity points) przez 4. Przykładowo OG = 1.048 odpowiada w przybliżeniu 12 °P, ponieważ 48/4 = 12. Metodę tę można stosować z dokładnością 0.1 °P dla OG ≤ 1.050 oraz z dokładnością 0.5 °P dla OG ≤ 1.072. Dla większych OG błąd szybko narasta."""),
          buildSectionWidget('FG',
              'FG (Final Gravity, ang. gęstość końcowa) – gęstość brzeczki po zakończonej fermentacji wyrażona za pomocą gęstości względnej (SG).'),
          buildSectionWidget('IBU', """
IBUs (International Bittering Units, ang. międzynarodowe jednostki goryczy) – jednostki goryczki określające zawartość izo-alfa kwasów w piwie, czyli stopień nachmielenia piwa na goryczkę. 1 IBU odpowiada 1 mg izo-alfa kwasów w 1 litrze piwa.

W praktyce piwowarstwa amatorskiego poziom goryczki jest obliczany według jednej z kilku zamiennie używanych metod, z których najpopularniejsze to metody Ragera i Tinsetha. Metoda Tinsetha jest uważana za dokładniejszą, a Ragera za zanadto optymistyczną, jednak w powszechnym użyciu jest starsza metoda Ragera."""),
          buildSectionWidget('SRM',
              'Standard Reference Method - System zapisu koloru piwa. 0 - 4 bardzo jasny, 4 - 7 złoty, 7 - 11 bursztynowy, 11 - 14 czerwony, 18 - 25 brązowy, 25+ czarny.'),
          buildSectionWidget('ABV', """
ABV (Alcohol By Volume, ang. alkohol objętościowo) – standardowa miara zawartości etanolu w napoju alkoholowym wyrażona jako procent objętościowy.

Relację ABV do zawartości alkoholu wagowo (ABW) przedstawia formuła: ABV ≈ ABW × 1.26"""),
          buildFooter(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Opacity(opacity: 0.8, child: Text('Autor: Mateusz Woźniak')),
            ],
          )
        ],
      ),
    );
  }
}
