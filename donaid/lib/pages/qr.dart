import 'package:donaid/utils/action_card.dart';
import 'package:donaid/utils/data.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRView extends StatelessWidget{
  const QRView({super.key});

  @override
  Widget build(BuildContext context) {
    get_data_();
    return Scaffold(
      // appBar: AppBar(title: const Text('Mobile Scanner')),
      body: MobileScanner(
          allowDuplicates: false,
          onDetect: (barcode, args) {
            if (barcode.rawValue == null) {
              debugPrint('Failed to scan Barcode');
            } else {
              final String code = barcode.rawValue!;
              List<String> valid_barcodes = (global_action).keys.toList();
              if (valid_barcodes.contains(code)){
                   global_action[code]!.hasDonated.add(myID);

                  showDialog<String>(
                    
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Donation Successful'),
                            content: const Text('Thank you for DonAiting!'),
                            actions: <Widget>[
                                                            TextButton(
                                onPressed: ()  {Navigator.pop(context);},
                                child: const Text('Scan Again'),
                              ),
                              TextButton(
                                onPressed: ()  {Navigator.pop(context); Navigator.pop(context);},
                                child: const Text('OK'),
                              ),          

                            ],
                          ),
                  );
              }
              else{
              debugPrint('\n\n\n${code} not in ${global_action.keys}\n\n\n');

                    showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Invalid QRCode!'),
                            content:  const Text('Please try again.'),
                            actions: <Widget>[
                              TextButton(
                                 
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Retry'),
                              ),
                            ],
                          ),
                  );
              }
              
              debugPrint('\n\n\n\n\n\n\n\nBarcode found!\n$code\n\n\n\n\n\n\n');

            }
          }),
    );
  }
}