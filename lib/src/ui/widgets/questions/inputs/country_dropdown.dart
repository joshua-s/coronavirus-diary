import 'package:covidnearme/src/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';

typedef CountryDropdownSearchFunction = List<int> Function(
    String keyword, List<DropdownMenuItem<String>> items);

class CountryDropdown extends StatefulWidget {
  const CountryDropdown({
    Key key,
    this.searchHint,
    this.onChanged,
    this.searchFunction,
    this.value,
    this.iconSize,
  }) : super(key: key);

  final Widget searchHint;
  final ValueChanged<String> onChanged;
  final CountryDropdownSearchFunction searchFunction;
  final String value;
  final double iconSize;

  @override
  _CountryDropdownState createState() => _CountryDropdownState();
}

class _CountryDropdownState extends State<CountryDropdown> {
  Map<String, String> countryCodeToName;
  Map<String, String> nameToCountryCode;
  List<DropdownMenuItem<String>> _dropdownItems;

  void didChangeDependencies() {
    super.didChangeDependencies();
    AppLocalizations localizations = AppLocalizations.of(context);
    _updateCountryCodes(localizations);
    _dropdownItems = _getDropdownItems(context, localizations);
  }

  List<int> _findItemsForSearch(
      String keyword, List<DropdownMenuItem<String>> items) {
    List<int> results = <int>[];
    for (int i = 0; i < items.length; ++i) {
      if (items[i].value == 'None') {
        continue;
      }
      final name = countryCodeToName[items[i].value];
      if (keyword == null || keyword.isEmpty) {
        results.add(i);
      } else {
        if (name.toLowerCase().contains(keyword.toLowerCase())) {
          results.add(i);
        }
      }
    }
    return results;
  }

  void _updateCountryCodes(AppLocalizations localizations) {
    countryCodeToName = <String, String>{
      'AD': localizations.countryCodeAD,
      'AE': localizations.countryCodeAE,
      'AF': localizations.countryCodeAF,
      'AG': localizations.countryCodeAG,
      'AI': localizations.countryCodeAI,
      'AL': localizations.countryCodeAL,
      'AM': localizations.countryCodeAM,
      'AO': localizations.countryCodeAO,
      'AQ': localizations.countryCodeAQ,
      'AR': localizations.countryCodeAR,
      'AS': localizations.countryCodeAS,
      'AT': localizations.countryCodeAT,
      'AU': localizations.countryCodeAU,
      'AW': localizations.countryCodeAW,
      'AX': localizations.countryCodeAX,
      'AZ': localizations.countryCodeAZ,
      'BA': localizations.countryCodeBA,
      'BB': localizations.countryCodeBB,
      'BD': localizations.countryCodeBD,
      'BE': localizations.countryCodeBE,
      'BF': localizations.countryCodeBF,
      'BG': localizations.countryCodeBG,
      'BH': localizations.countryCodeBH,
      'BI': localizations.countryCodeBI,
      'BJ': localizations.countryCodeBJ,
      'BL': localizations.countryCodeBL,
      'BM': localizations.countryCodeBM,
      'BN': localizations.countryCodeBN,
      'BO': localizations.countryCodeBO,
      'BQ': localizations.countryCodeBQ,
      'BR': localizations.countryCodeBR,
      'BS': localizations.countryCodeBS,
      'BT': localizations.countryCodeBT,
      'BV': localizations.countryCodeBV,
      'BW': localizations.countryCodeBW,
      'BY': localizations.countryCodeBY,
      'BZ': localizations.countryCodeBZ,
      'CA': localizations.countryCodeCA,
      'CC': localizations.countryCodeCC,
      'CD': localizations.countryCodeCD,
      'CF': localizations.countryCodeCF,
      'CG': localizations.countryCodeCG,
      'CH': localizations.countryCodeCH,
      'CI': localizations.countryCodeCI,
      'CK': localizations.countryCodeCK,
      'CL': localizations.countryCodeCL,
      'CM': localizations.countryCodeCM,
      'CN': localizations.countryCodeCN,
      'CO': localizations.countryCodeCO,
      'CR': localizations.countryCodeCR,
      'CU': localizations.countryCodeCU,
      'CV': localizations.countryCodeCV,
      'CW': localizations.countryCodeCW,
      'CX': localizations.countryCodeCX,
      'CY': localizations.countryCodeCY,
      'CZ': localizations.countryCodeCZ,
      'DE': localizations.countryCodeDE,
      'DJ': localizations.countryCodeDJ,
      'DK': localizations.countryCodeDK,
      'DM': localizations.countryCodeDM,
      'DO': localizations.countryCodeDO,
      'DZ': localizations.countryCodeDZ,
      'EC': localizations.countryCodeEC,
      'EE': localizations.countryCodeEE,
      'EG': localizations.countryCodeEG,
      'EH': localizations.countryCodeEH,
      'ER': localizations.countryCodeER,
      'ES': localizations.countryCodeES,
      'ET': localizations.countryCodeET,
      'FI': localizations.countryCodeFI,
      'FJ': localizations.countryCodeFJ,
      'FK': localizations.countryCodeFK,
      'FM': localizations.countryCodeFM,
      'FO': localizations.countryCodeFO,
      'FR': localizations.countryCodeFR,
      'GA': localizations.countryCodeGA,
      'GB': localizations.countryCodeGB,
      'GD': localizations.countryCodeGD,
      'GE': localizations.countryCodeGE,
      'GF': localizations.countryCodeGF,
      'GG': localizations.countryCodeGG,
      'GH': localizations.countryCodeGH,
      'GI': localizations.countryCodeGI,
      'GL': localizations.countryCodeGL,
      'GM': localizations.countryCodeGM,
      'GN': localizations.countryCodeGN,
      'GP': localizations.countryCodeGP,
      'GQ': localizations.countryCodeGQ,
      'GR': localizations.countryCodeGR,
      'GS': localizations.countryCodeGS,
      'GT': localizations.countryCodeGT,
      'GU': localizations.countryCodeGU,
      'GW': localizations.countryCodeGW,
      'GY': localizations.countryCodeGY,
      'HK': localizations.countryCodeHK,
      'HM': localizations.countryCodeHM,
      'HN': localizations.countryCodeHN,
      'HR': localizations.countryCodeHR,
      'HT': localizations.countryCodeHT,
      'HU': localizations.countryCodeHU,
      'ID': localizations.countryCodeID,
      'IE': localizations.countryCodeIE,
      'IL': localizations.countryCodeIL,
      'IM': localizations.countryCodeIM,
      'IN': localizations.countryCodeIN,
      'IO': localizations.countryCodeIO,
      'IQ': localizations.countryCodeIQ,
      'IR': localizations.countryCodeIR,
      'IS': localizations.countryCodeIS,
      'IT': localizations.countryCodeIT,
      'JE': localizations.countryCodeJE,
      'JM': localizations.countryCodeJM,
      'JO': localizations.countryCodeJO,
      'JP': localizations.countryCodeJP,
      'KE': localizations.countryCodeKE,
      'KG': localizations.countryCodeKG,
      'KH': localizations.countryCodeKH,
      'KI': localizations.countryCodeKI,
      'KM': localizations.countryCodeKM,
      'KN': localizations.countryCodeKN,
      'KP': localizations.countryCodeKP,
      'KR': localizations.countryCodeKR,
      'KW': localizations.countryCodeKW,
      'KY': localizations.countryCodeKY,
      'KZ': localizations.countryCodeKZ,
      'LA': localizations.countryCodeLA,
      'LB': localizations.countryCodeLB,
      'LC': localizations.countryCodeLC,
      'LI': localizations.countryCodeLI,
      'LK': localizations.countryCodeLK,
      'LR': localizations.countryCodeLR,
      'LS': localizations.countryCodeLS,
      'LT': localizations.countryCodeLT,
      'LU': localizations.countryCodeLU,
      'LV': localizations.countryCodeLV,
      'LY': localizations.countryCodeLY,
      'MA': localizations.countryCodeMA,
      'MC': localizations.countryCodeMC,
      'MD': localizations.countryCodeMD,
      'ME': localizations.countryCodeME,
      'MF': localizations.countryCodeMF,
      'MG': localizations.countryCodeMG,
      'MH': localizations.countryCodeMH,
      'MK': localizations.countryCodeMK,
      'ML': localizations.countryCodeML,
      'MM': localizations.countryCodeMM,
      'MN': localizations.countryCodeMN,
      'MO': localizations.countryCodeMO,
      'MP': localizations.countryCodeMP,
      'MQ': localizations.countryCodeMQ,
      'MR': localizations.countryCodeMR,
      'MS': localizations.countryCodeMS,
      'MT': localizations.countryCodeMT,
      'MU': localizations.countryCodeMU,
      'MV': localizations.countryCodeMV,
      'MW': localizations.countryCodeMW,
      'MX': localizations.countryCodeMX,
      'MY': localizations.countryCodeMY,
      'MZ': localizations.countryCodeMZ,
      'NA': localizations.countryCodeNA,
      'NC': localizations.countryCodeNC,
      'NE': localizations.countryCodeNE,
      'NF': localizations.countryCodeNF,
      'NG': localizations.countryCodeNG,
      'NI': localizations.countryCodeNI,
      'NL': localizations.countryCodeNL,
      'NO': localizations.countryCodeNO,
      'NP': localizations.countryCodeNP,
      'NR': localizations.countryCodeNR,
      'NU': localizations.countryCodeNU,
      'NZ': localizations.countryCodeNZ,
      'OM': localizations.countryCodeOM,
      'PA': localizations.countryCodePA,
      'PE': localizations.countryCodePE,
      'PF': localizations.countryCodePF,
      'PG': localizations.countryCodePG,
      'PH': localizations.countryCodePH,
      'PK': localizations.countryCodePK,
      'PL': localizations.countryCodePL,
      'PM': localizations.countryCodePM,
      'PN': localizations.countryCodePN,
      'PR': localizations.countryCodePR,
      'PS': localizations.countryCodePS,
      'PT': localizations.countryCodePT,
      'PW': localizations.countryCodePW,
      'PY': localizations.countryCodePY,
      'QA': localizations.countryCodeQA,
      'RE': localizations.countryCodeRE,
      'RO': localizations.countryCodeRO,
      'RS': localizations.countryCodeRS,
      'RU': localizations.countryCodeRU,
      'RW': localizations.countryCodeRW,
      'SA': localizations.countryCodeSA,
      'SB': localizations.countryCodeSB,
      'SC': localizations.countryCodeSC,
      'SD': localizations.countryCodeSD,
      'SE': localizations.countryCodeSE,
      'SG': localizations.countryCodeSG,
      'SH': localizations.countryCodeSH,
      'SI': localizations.countryCodeSI,
      'SJ': localizations.countryCodeSJ,
      'SK': localizations.countryCodeSK,
      'SL': localizations.countryCodeSL,
      'SM': localizations.countryCodeSM,
      'SN': localizations.countryCodeSN,
      'SO': localizations.countryCodeSO,
      'SR': localizations.countryCodeSR,
      'SS': localizations.countryCodeSS,
      'ST': localizations.countryCodeST,
      'SV': localizations.countryCodeSV,
      'SX': localizations.countryCodeSX,
      'SY': localizations.countryCodeSY,
      'SZ': localizations.countryCodeSZ,
      'TC': localizations.countryCodeTC,
      'TD': localizations.countryCodeTD,
      'TF': localizations.countryCodeTF,
      'TG': localizations.countryCodeTG,
      'TH': localizations.countryCodeTH,
      'TJ': localizations.countryCodeTJ,
      'TK': localizations.countryCodeTK,
      'TL': localizations.countryCodeTL,
      'TM': localizations.countryCodeTM,
      'TN': localizations.countryCodeTN,
      'TO': localizations.countryCodeTO,
      'TR': localizations.countryCodeTR,
      'TT': localizations.countryCodeTT,
      'TV': localizations.countryCodeTV,
      'TW': localizations.countryCodeTW,
      'TZ': localizations.countryCodeTZ,
      'UA': localizations.countryCodeUA,
      'UG': localizations.countryCodeUG,
      'UM': localizations.countryCodeUM,
      'UY': localizations.countryCodeUY,
      'UZ': localizations.countryCodeUZ,
      'VA': localizations.countryCodeVA,
      'VC': localizations.countryCodeVC,
      'VE': localizations.countryCodeVE,
      'VG': localizations.countryCodeVG,
      'VI': localizations.countryCodeVI,
      'VN': localizations.countryCodeVN,
      'VU': localizations.countryCodeVU,
      'WF': localizations.countryCodeWF,
      'WS': localizations.countryCodeWS,
      'YE': localizations.countryCodeYE,
      'YT': localizations.countryCodeYT,
      'ZA': localizations.countryCodeZA,
      'ZM': localizations.countryCodeZM,
      'ZW': localizations.countryCodeZW,
    };
    nameToCountryCode = <String, String>{};
    for (final String code in countryCodeToName.keys) {
      nameToCountryCode[countryCodeToName[code]] = code;
    }
  }

  List<DropdownMenuItem<String>> _getDropdownItems(
      BuildContext context, AppLocalizations localizations) {
    final List<String> countries = nameToCountryCode.keys.toList();
    countries.sort();
    final List<DropdownMenuItem<String>> result = countries
        .map<DropdownMenuItem<String>>(
          (String country) => DropdownMenuItem<String>(
            child: Text(
              country,
              style: Theme.of(context).textTheme.subhead,
              overflow: TextOverflow.ellipsis,
            ),
            value: nameToCountryCode[country],
          ),
        )
        .toList();

    // Add the "No selection" selection.
    result.insert(
      0,
      DropdownMenuItem<String>(
        child: Text(localizations.locationStepNoCountrySelected,
            style: Theme.of(context).textTheme.button.copyWith(
                  fontStyle: FontStyle.italic,
                )),
        value: 'None',
      ),
    );
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context);
    if (countryCodeToName == null) {
      _updateCountryCodes(localizations);
    }

    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 100),
      child: Align(
        alignment: AlignmentDirectional.topStart,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(localizations.locationStepCountryButtonLabel,
                  style: Theme.of(context).textTheme.title),
            ),
            Expanded(
              child: SearchableDropdown(
                searchHint: widget.searchHint ??
                    Text(localizations.locationStepCountrySearchPrompt),
                onChanged: widget.onChanged,
                searchFn: widget.searchFunction ?? _findItemsForSearch,
                items: _dropdownItems,
                style: Theme.of(context).textTheme.subhead,
                value: widget.value,
                iconSize: 40,
                isExpanded: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
