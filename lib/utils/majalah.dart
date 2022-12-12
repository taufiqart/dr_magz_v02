import 'package:cached_network_image/cached_network_image.dart';
import 'package:dr_magz/models/artikel_model.dart';
import 'package:dr_magz/models/majalah_model.dart';
import 'package:dr_magz/pages/artikel_view.dart';
import 'package:dr_magz/pages/majalah_view.dart';
import 'package:dr_magz/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget Majalah(MajalahData majalah, BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      InkWell(
        borderRadius: BorderRadius.circular(50.0),
        onTap: () {
          Navigator.push(
            context,
            new MaterialPageRoute(
              builder: (context) => MajalahView(majalah: majalah),
            ),
          );
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Column(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     Container(
            //       height: 335.0,
            //       // height: double.infinity,
            //       // width: double.infinity,
            //       decoration: BoxDecoration(
            //         // color: Colors.white.withOpacity(0.5),
            //         color: Colors.white.withOpacity(0.2),
            //         borderRadius: BorderRadius.circular(10),
            //         border: Border.all(color: Colors.white),
            //       ),
            //     ),
            //   ],
            // ),
            // Column(
            //   children: [
            //     Center(
            //       child: Container(
            //         height: 202,
            //         width: double.infinity,
            //         decoration: BoxDecoration(
            //           color: Colors.black,
            //           borderRadius: BorderRadius.circular(10),
            //         ),
            //         clipBehavior: Clip.antiAlias,
            //         child: Image.network(
            //           majalah.image,
            //           fit: BoxFit.cover,
            //         ),
            //       ),
            //     ),
            //     Padding(
            //       padding: const EdgeInsets.symmetric(
            //         horizontal: 15,
            //         vertical: 10,
            //       ),
            //       child: Column(
            //         mainAxisAlignment: MainAxisAlignment.start,
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Text(
            //             // "",
            //             majalah.desc,
            //             style: GoogleFonts.poppins(
            //               color: Colors.white,
            //               fontSize: 14,
            //               height: 1.2,
            //             ),
            //             textAlign: TextAlign.start,
            //             maxLines: 5,
            //             overflow: TextOverflow.ellipsis,
            //           ),
            //           SizedBox(
            //             height: 8,
            //           ),
            //           Text(
            //             // "",
            //             majalah.datetime,
            //             style: GoogleFonts.poppins(
            //               color: Colors.white,
            //               fontSize: 12,
            //             ),
            //             textAlign: TextAlign.start,
            //           ),
            //         ],
            //       ),
            //     ),
            //   ],
            // ),

            Container(
              height: 250,
              // width: MediaQuery.of(context).size.width * 0.7,
              margin: EdgeInsets.symmetric(horizontal: 30),
              alignment: Alignment.bottomCenter,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    offset: Offset(0, 5),
                    blurRadius: 6,
                  )
                ],
                image: DecorationImage(
                  image: (majalah.urlType == UrlType.asset)
                      ? AssetImage(majalah.image)
                      : CachedNetworkImageProvider(majalah.image)
                          as ImageProvider,
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                  color: blueShade150.withOpacity(0.7),
                ),
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 10,
                  ),
                  child: Text(
                    majalah.desc,
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                  ),
                ),
              ),
            ),
            // Container()
          ],
        ),
      ),
    ],
  );
}
