import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../../constants/constants.dart';

class EmailMessageCard extends StatefulWidget {
  final String title;
  String? imageUrl;
  final String description;
  //for now i am making it string however dateTime should be given
  final String dateTime;
  bool isStarred;
  bool isImportant;
  bool isUnread;
  //if file is attached then file has to be given
  //for convinence we r using string
  bool isFileAttached;
  String? fileName;
  EmailMessageCard(
      {Key? key,
      required this.title,
      this.imageUrl,
      required this.description,
      required this.dateTime,
      this.isStarred = false,
      this.isImportant = false,
      this.isUnread = false,
      this.isFileAttached = false,
      this.fileName})
      : super(key: key);

  @override
  State<EmailMessageCard> createState() => _EmailMessageCardState();
}

class _EmailMessageCardState extends State<EmailMessageCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 100,
      padding: const EdgeInsets.only(left: 16, bottom: 16, right: 16),
      margin: EdgeInsets.only(bottom: 16),

      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: customGreyColor.shade200))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 16,
            backgroundColor: Constants.softGreen,
            backgroundImage: widget.imageUrl != null
                ? Image.network(widget.imageUrl!)
                    .image //network image halna baaki
                : null,
            child: widget.imageUrl == null
                ? const Center(
                    child: Text(
                      "A",
                      style: TextStyle(color: Constants.brandSecondaryColor),
                    ),
                  )
                : null,
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widget.isImportant
                    ? Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.label_important,
                            color: Constants.info,
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Text(
                            widget.title,
                            maxLines: 1,
                            style: TextStyle(
                                color: Constants.brandSecondaryColor,
                                fontSize: 16,
                                fontWeight:
                                    (widget.isUnread && widget.isStarred) ||
                                            widget.isFileAttached
                                        ? FontWeight.w600
                                        : FontWeight.w400),
                          ),
                        ],
                      )
                    : Text(
                        widget.title,
                        maxLines: 1,
                        style: TextStyle(
                            color: Constants.brandSecondaryColor,
                            fontSize: 16,
                            fontWeight: (widget.isUnread && widget.isStarred) ||
                                    widget.isFileAttached
                                ? FontWeight.w600
                                : FontWeight.w400),
                      ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  widget.description,
                  maxLines: 2,
                  style: TextStyle(
                    color: Constants.brandTeritaryColor,
                    fontSize: 16,
                    fontWeight: (widget.isUnread && widget.isStarred
                        ? FontWeight.w600
                        : FontWeight.w400),
                  ),
                ),
                widget.fileName != null
                    ? Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border:
                                Border.all(color: customGreyColor.shade200)),
                        margin: EdgeInsets.only(top: 8),
                        padding: EdgeInsets.all(5),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              IconlyLight.paper_download,
                              color: Constants.brandSecondaryColor,
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            Text(
                              widget.fileName!,
                              style: TextStyle(
                                  color: Constants.brandSecondaryColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      )
                    : Container()
              ],
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                widget.dateTime,
                maxLines: 1,
                style: TextStyle(
                    color: Constants.brandSecondaryColor,
                    fontSize: 16,
                    fontWeight: (widget.isUnread && widget.isStarred) ||
                            widget.isFileAttached
                        ? FontWeight.w600
                        : FontWeight.w400),
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      widget.isStarred = !widget.isStarred;
                    });
                  },
                  icon: widget.isStarred
                      ? Icon(IconlyBold.star, color: Constants.warning)
                      : Icon(
                          IconlyLight.star,
                          color: Constants.brandSecondaryColor,
                        ))
            ],
          )
        ],
      ),
    );
  }
}
