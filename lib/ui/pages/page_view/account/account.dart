import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        decoration: const BoxDecoration(color: Colors.white),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {

                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                        size: 20,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.settings_outlined,
                        size: 20,
                        color: Colors.black,
                      ))
                ],
              ),
              Container(
                height: 80,
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 4,
                      blurRadius: 4,
                      offset: Offset(0, 4), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset('assets/image/travis_scott.jpg',
                          fit: BoxFit.cover, height: 50),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Travis Scott',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'travisscott@gmail.com',
                          style: TextStyle(color: Colors.black45, fontSize: 12),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 370,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.person_pin,
                            color: Colors.grey,
                            size: 50,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Personal Details',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.black,
                            size: 16,
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(4),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.shopping_bag,
                            color: Colors.grey,
                            size: 50,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'My Order',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.black,
                            size: 16,
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(4),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.favorite,
                            color: Colors.grey,
                            size: 50,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'My Favourites',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.black,
                            size: 16,
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(4),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.local_shipping,
                            color: Colors.grey,
                            size: 50,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Shipping Address',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.black,
                            size: 16,
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(4),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.credit_card,
                            color: Colors.grey,
                            size: 50,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'My Cart',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.black,
                            size: 16,
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(4),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.settings,
                            color: Colors.grey,
                            size: 50,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Settings',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.black,
                            size: 16,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 240,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.grey,
                    width: 2,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.error,
                            color: Colors.grey,
                            size: 50,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'FAQs',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.black,
                            size: 16,
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(4),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.check_circle,
                            color: Colors.grey,
                            size: 50,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Privacy Policy',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.black,
                            size: 16,
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(4),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.favorite,
                            color: Colors.grey,
                            size: 50,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'My Favourites',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.black,
                            size: 16,
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(4),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.local_shipping,
                            color: Colors.grey,
                            size: 50,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Shipping Address',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.black,
                            size: 16,
                          )
                        ],
                      ),
                    ),
                    // Container(
                    //   padding: const EdgeInsets.all(4),
                    //   child: const Row(
                    //     children: [
                    //       Icon(
                    //         Icons.credit_card,
                    //         color: Colors.grey,
                    //         size: 50,
                    //       ),
                    //       SizedBox(
                    //         width: 10,
                    //       ),
                    //       Text(
                    //         'My Cart',
                    //         style: TextStyle(
                    //             color: Colors.black,
                    //             fontSize: 15,
                    //             fontWeight: FontWeight.bold),
                    //       ),
                    //       Spacer(),
                    //       Icon(Icons.arrow_forward_ios_rounded, color: Colors.black,size: 16,)
                    //     ],
                    //   ),
                    // ),
                    // Container(
                    //   padding: const EdgeInsets.all(4),
                    //   child: const Row(
                    //     children: [
                    //       Icon(
                    //         Icons.settings,
                    //         color: Colors.grey,
                    //         size: 50,
                    //       ),
                    //       SizedBox(
                    //         width: 10,
                    //       ),
                    //       Text(
                    //         'Settings',
                    //         style: TextStyle(
                    //             color: Colors.black,
                    //             fontSize: 15,
                    //             fontWeight: FontWeight.bold),
                    //       ),
                    //       Spacer(),
                    //       Icon(Icons.arrow_forward_ios_rounded, color: Colors.black,size: 16,)
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
