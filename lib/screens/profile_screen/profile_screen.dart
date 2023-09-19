import 'package:e_commerce/consts/consts.dart';
import 'package:e_commerce/screens/profile_screen/details_button.dart';
import 'package:e_commerce/widgets/bg_widget.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const profileButtonsList = ["Orders", "Wishlist", "Message"];
    const profileButtonsIcons = [icOrder, icOrder, icMessages];
    return bgWidget(
        child: SafeArea(
            child: Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Align(
              alignment: Alignment.topRight,
              child: Icon(
                Icons.edit,
                color: whiteColor,
              )).onTap(() {}),
          Row(
            children: [
              Image.asset(imgProfile, width: 100, fit: BoxFit.cover)
                  .box
                  .roundedFull
                  .clip(Clip.antiAlias)
                  .make(),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    "User".text.fontFamily(semibold).white.make(),
                    5.heightBox,
                    "email@example.com".text.white.make()
                  ],
                ),
              ),
              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: whiteColor)),
                  onPressed: () {},
                  child: "Log Out".text.fontFamily(semibold).white.make())
            ],
          ),
          20.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              detailsButton(
                  count: "00",
                  width: context.screenWidth / 3.4,
                  title: "in your cart"),
              detailsButton(
                  count: "00",
                  width: context.screenWidth / 3.4,
                  title: "in your wishlist"),
              detailsButton(
                  count: "00",
                  width: context.screenWidth / 3.4,
                  title: "you ordered")
            ],
          ),
          40.heightBox,
          ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Image.asset(
                        profileButtonsIcons[index],
                        width: 20,
                      ),
                      title: profileButtonsList[index]
                          .text
                          .fontFamily(semibold)
                          .color(darkFontGrey)
                          .make(),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      color: lightGrey,
                    );
                  },
                  itemCount: profileButtonsList.length)
              .box
              .padding(EdgeInsets.symmetric(horizontal: 16))
              .shadowSm
              .white
              .rounded
              .make()
        ],
      ),
    )));
  }
}
