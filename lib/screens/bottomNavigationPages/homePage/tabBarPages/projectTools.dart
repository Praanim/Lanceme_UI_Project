import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import 'package:lanceme_ui_project/constants/constants.dart';
import 'package:percent_indicator/percent_indicator.dart';

List<String> _imageUrl = [
  'https://imgs.search.brave.com/Ar7V91XTvLn-lJ8TRP1kwQ21Uvm0n2umJwnrY4KyeXc/rs:fit:713:225:1/g:ce/aHR0cHM6Ly90c2U0/Lm1tLmJpbmcubmV0/L3RoP2lkPU9JUC43/b09qdG1mdUNUaEV5/QjN0YVNERFBnSGFF/NyZwaWQ9QXBp',
  'https://imgs.search.brave.com/sFK_89k_d6lB1wGoE_ono2uxN-9FpCg7SSzjzTh5I50/rs:fit:713:225:1/g:ce/aHR0cHM6Ly90c2U0/Lm1tLmJpbmcubmV0/L3RoP2lkPU9JUC5Q/NTN0SWh3V0JGYURC/U09keThMZVNBSGFF/NyZwaWQ9QXBp',
  'https://imgs.search.brave.com/mi0k8PnJ4s2Ap6y4X2Ebb8ai9NSM8C0zPkvS90cVl7k/rs:fit:316:225:1/g:ce/aHR0cHM6Ly90c2U0/Lm1tLmJpbmcubmV0/L3RoP2lkPU9JUC5L/M2Z3a3B6azdtWHhC/djhWdndSQUxBSGFM/SCZwaWQ9QXBp',
  'https://imgs.search.brave.com/Ikcq8wt6C8b56NZgPLKyQnKUAIXNxNVf052v3Xy-X1w/rs:fit:478:225:1/g:ce/aHR0cHM6Ly90c2Ux/Lm1tLmJpbmcubmV0/L3RoP2lkPU9JUC4x/TzhmN2VQMmdTTDJT/NC1jdmtCdThRSGFI/VyZwaWQ9QXBp',
  'https://imgs.search.brave.com/6d0hyLFLH58P8YWqDAQFLeoOCaOQr906GK8uqDKEkMk/rs:fit:404:225:1/g:ce/aHR0cHM6Ly90c2Uz/Lm1tLmJpbmcubmV0/L3RoP2lkPU9JUC5I/TDExWi1UQWF4QW9S/VDFXS1M0WlZBSGFJ/ciZwaWQ9QXBp'
];

class ProjectDetails extends StatelessWidget {
  final String template;
  const ProjectDetails({
    Key? key,
    required this.template,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.28,
      width: size.width,
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
          border: Border.all(
        color: customGreyColor.shade200,
      )),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //headline row(revamp Project wala)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Text(
                      "Revamp Project",
                      style: TextStyle(
                          color: Constants.brandSecondaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      IconlyLight.bookmark,
                      color: Constants.brandMainColor,
                    )
                  ],
                ),
                const Icon(
                  Icons.menu_outlined,
                  color: Constants.brandSecondaryColor,
                )
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            //successive three ota detail rows after first row
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: size.width * 0.33,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Template:",
                            style: TextStyle(
                              color: Constants.brandTeritaryColor,
                            ),
                          ),
                          Text(
                            template,
                            style: const TextStyle(
                              color: Constants.brandSecondaryColor,
                            ),
                          )
                        ]),
                    const SizedBox(
                      height: 6,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Status:",
                            style: TextStyle(
                              color: Constants.brandTeritaryColor,
                            ),
                          ),
                          Text(
                            'On Hold',
                            style: TextStyle(
                              color: Constants.brandSecondaryColor,
                            ),
                          )
                        ]),
                    const SizedBox(
                      height: 6,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Last Updated:",
                            style: TextStyle(
                              color: Constants.brandTeritaryColor,
                            ),
                          ),
                          Text(
                            "2m ago",
                            style: TextStyle(
                              color: Constants.brandSecondaryColor,
                            ),
                          )
                        ]),
                    const SizedBox(
                      height: 6,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //linear progress indicator

            Row(
              children: [
                Expanded(
                  child: LinearPercentIndicator(
                    barRadius: const Radius.circular(32),
                    width: size.width - 100,
                    padding: EdgeInsets.zero,
                    animation: true,
                    animationDuration: 1000,
                    lineHeight: 10,
                    percent: 0.4,
                    progressColor: Constants.brandMainColor,
                  ),
                ),
                const SizedBox(
                  width: 3,
                ),
                const Text(
                  "40%",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Constants.brandMainColor,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            //make row with overlapping circle avatar
            Row(
              children: [
                _makeCircleAvatar(_imageUrl[0]),
                Transform.translate(
                  offset: const Offset(-11, 0),
                  child: _makeCircleAvatar(_imageUrl[1]),
                ),
                Transform.translate(
                  offset: const Offset(-21, 0),
                  child: _makeCircleAvatar(_imageUrl[2]),
                ),
                Transform.translate(
                  offset: const Offset(-31, 0),
                  child: _makeCircleAvatar(_imageUrl[3]),
                ),
                Transform.translate(
                  offset: const Offset(-41, 0),
                  child: _makeCircleAvatar(_imageUrl[4]),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

_makeCircleAvatar(String imageUrl) {
  return Container(
    height: 32,
    width: 32,
    decoration: BoxDecoration(
        color: Constants.brandTeritaryColor,
        border: Border.all(color: Constants.whiteColor, width: 2),
        shape: BoxShape.circle,
        image:
            DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover)),
  );
}
