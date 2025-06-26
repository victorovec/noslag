import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:noslag/core/widgets/custom_app_bar.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:noslag/core/widgets/custom_input_field.dart';

class AddNewProduct extends ConsumerStatefulWidget {
  const AddNewProduct({super.key});

  @override
  ConsumerState<AddNewProduct> createState() => _AddNewProductState();
}

class _AddNewProductState extends ConsumerState<AddNewProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F1F3),
      appBar: CustomAppBar(
        title: 'Product',
        color: Color(0xffF2F1F3),
        showShadow: true,
      ),
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            height: 48,
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFF878594), width: 1),
              boxShadow: [
                BoxShadow(
                  // ignore: deprecated_member_use
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 5,
                ),
              ],
              color: Colors.white,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: 18,
                      color: const Color(0xFF242429), // ← #242429
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  'Add Product',
                  style: TextStyle(
                    color: const Color(0xFF1D2A5D), // ← text colour
                    fontSize: 16, // ← 16 px
                    fontWeight: FontWeight.w600, // ← 600
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                GestureDetector(
                  onTap: (){},
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: DottedBorder(
                    options: RoundedRectDottedBorderOptions(
                      dashPattern: [6, 2],
                      strokeWidth: 1,
                      radius: Radius.circular(5),
                      color: Color(0xff878594),
                      //padding: EdgeInsets.all(0),
                    ),
                      child: SizedBox(
                         height: 152,
                         width: double.infinity,
                         child: Image.asset('assets/icons/image_outline.png'),
                      )
                      ),
                  ),
                ),
                Text('Add Image',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                  color: Color(0xff13A9F4),
                ),
                ),
                SizedBox(height: 20,),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xffFFFFFF),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    boxShadow: [
                    BoxShadow(
                      color: Color(0x1A000000),
                      blurRadius: 12,
                      offset: Offset(0, 4),
                      spreadRadius: 2
                    ),
                  ],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomInputField(
                              labelColor: Color(0xffF61732),
                              height: 38,
                              label: 'Product name*'
                            ),
                            CustomInputField(
                              height: 38,
                              label: 'Pack/Unit*',
                              labelColor: Color(0xffF61732),
                              hintText: 'Select',
                              suffixIcon: Icon(Icons.keyboard_arrow_down,color: Color(0xff878594),),
                              ),
                              CustomInputField(
                              height: 38,
                              labelWidget: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Dimensions',
                                      style: TextStyle(
                                        color: Color(0xff242429),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13,
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' (in)(Length X Width X Height)',
                                      style: TextStyle(
                                        color: Color(0xff878594),
                                        fontWeight:FontWeight.w400,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            CustomInputField(
                              height: 38,
                              label: 'Volume',
                              labelColor: Color(0xff242429),
                              hintText: 'Select',
                              suffixIcon: Icon(Icons.keyboard_arrow_down,color: Color(0xff878594),),
                              ),
                              CustomInputField(
                              height: 38,
                              label: 'Manufacturer',
                              labelColor: Color(0xff242429),
                              hintText: 'Select or add manufacturer',
                              ),
                              CustomInputField(
                              height: 38,
                              label: 'Brand',
                              labelColor: Color(0xff242429),
                              hintText: 'Add brand',
                              ),
                              CustomInputField(
                              height: 38,
                              label: 'Category',
                              labelColor: Color(0xff242429),
                              hintText: 'Select ',
                              suffixIcon: Icon(Icons.keyboard_arrow_down,color: Color(0xff878594),),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0,20,20,20),
                                child: Text('Create Category',
                                style: TextStyle(
                                  color: Color(0xff13A9F4),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13,
                                ),
                                ),
                              ),
                              CustomInputField(
                              labelColor: Color(0xff242429),
                              height: 38,
                              label: 'Weight'
                            ),
                            CustomInputField(
                              labelColor: Color(0xff242429),
                              height: 38,
                              label: 'Preferred vendor'
                            ),
                            SizedBox(height: 40,),
                            
                            Divider(
                            thickness: 1, 
                            color: Color(0x82828280), 
                            height: 1, 
                                                  ),
                          SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0,20,20,20),
                            child: Text('Purchase Information',
                             style: TextStyle(
                              color: Color(0xff242429),
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                            ),
                            ),
                          ),
                          CustomInputField(
                            height: 38,
                            labelWidget: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Cost Price*',
                                      style: TextStyle(
                                        color: Color(0xffF61732),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13,
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' Per Piece',
                                      style: TextStyle(
                                        color: Color(0xff878594),
                                        fontWeight:FontWeight.w400,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              prefixIcon: Padding(
                                padding:  EdgeInsets.zero,
                                child: Container(
                                  width: 59,
                                 height: 38,
                                  decoration: BoxDecoration(
                                    color: Color(0xff878594), 
                                   borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(3),
                                      bottomLeft: Radius.circular(3),
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'USD',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                          ),
                              CustomInputField(
                              labelColor: Color(0xffF61732),
                              height: 38,
                              label: 'Account*'
                            ),
                            SizedBox(height: 10,),
                            Text('Description',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff242429),
                            ),
                            ),
                            SizedBox(height: 65,),
                            Divider(
                            thickness: 1, 
                            color: Color(0x82828280), 
                            height: 1, 
                          ),
                          SizedBox(height: 60,),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0,20,20,20),
                            child: Text('Sales Information',
                             style: TextStyle(
                              color: Color(0xff242429),
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                            ),
                            ),
                          ),
                          CustomInputField(
                            height: 38,
                            labelWidget: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Selling Price*',
                                      style: TextStyle(
                                        color: Color(0xffF61732),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13,
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' Per Piece',
                                      style: TextStyle(
                                        color: Color(0xff878594),
                                        fontWeight:FontWeight.w400,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              prefixIcon: Padding(
                                padding:  EdgeInsets.zero,
                                child: Container(
                                  width: 59,
                                 height: 38,
                                  decoration: BoxDecoration(
                                    color: Color(0xff878594), 
                                   borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(3),
                                      bottomLeft: Radius.circular(3),
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'USD',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                          ),
                          CustomInputField(
                            height: 38,
                            labelWidget: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Selling Price* Wholesale',
                                      style: TextStyle(
                                        color: Color(0xffF61732),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13,
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' Per Piece',
                                      style: TextStyle(
                                        color: Color(0xff878594),
                                        fontWeight:FontWeight.w400,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              prefixIcon: Padding(
                                padding:  EdgeInsets.zero,
                                child: Container(
                                  width: 59,
                                 height: 38,
                                  decoration: BoxDecoration(
                                    color: Color(0xff878594), 
                                   borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(3),
                                      bottomLeft: Radius.circular(3),
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'USD',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                          ),
                              CustomInputField(
                              labelColor: Color(0xffF61732),
                              height: 38,
                              label: 'Account*'
                            ),
                            SizedBox(height: 74,),
                            Text('Description',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff242429),
                            ),
                            ),
                            SizedBox(height: 65,),
                            Divider(
                            thickness: 1, 
                            color: Color(0x82828280), 
                            height: 1, 
                          ),
                          SizedBox(height: 60,),
                          Row(
                            children: [
                              Icon(Icons.check_box_outline_blank, color: Color(0xff878594),size: 14,),
                              SizedBox(width: 10,),
                              Text('Set Baseline',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                              ),),
                              SizedBox(width: 10,),
                              Icon(Icons.help_outline,color: Color(0xff878594),size: 14,)
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 24),
                            child: Text('Baseline allow for easy monitoring of stocks if it is above or below desired baseline of item  in order to avoid empty stock',
                            style: TextStyle(
                              color: Color(0xff878594),
                              fontWeight: FontWeight.w400,
                              fontSize: 13
                            ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          Row(
                            children: [
                              Expanded(
                                child: CustomInputField(
                                height: 38,
                                hintText: 'Above',
                                suffixIcon: Icon(Icons.keyboard_arrow_down,color: Color(0xff878594),),
                                ),
                              ),
                              SizedBox(width: 15,),
                              Expanded(
                                child: CustomInputField(
                                height: 38,
                                hintText: '0',
                                suffixIcon: Icon(Icons.keyboard_arrow_down,color: Color(0xff878594),),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 112,),
                          Divider(
                            thickness: 1, 
                            color: Color(0x82828280), 
                            height: 1, 
                          ),
                          SizedBox(height: 35,),
                          Row(
                            children: [
                              Icon(Icons.check_box_outline_blank, color: Color(0xff878594),size: 14,),
                              SizedBox(width: 10,),
                              Text('Track Inventory for this item',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                              ),),
                              SizedBox(width: 10,),
                              Icon(Icons.help_outline,color: Color(0xff878594),size: 14,)
                            ],
                          ),
                          SizedBox(height: 35,),
                          CustomInputField(
                              height: 38,
                              label: 'Advance inventory tracking',
                              labelColor: Color(0xff242429),
                              hintText: 'None',
                              suffixIcon: Icon(Icons.keyboard_arrow_down,color: Color(0xff878594),),
                              ),
                              CustomInputField(
                              height: 38,
                              label: 'Inventory account*',
                              labelColor: Color(0xffF61732),
                              hintText: 'Select account',
                              suffixIcon: Icon(Icons.keyboard_arrow_down,color: Color(0xff878594),),
                              ),
                              SizedBox(height: 75,),
                              
                      
                          ],
                        ),
                      ),




                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Divider(
                              thickness: 1, 
                              color: Color(0xffF2F1F3), 
                              height: 1, 
                           ),
                           Padding(
                             padding: const EdgeInsets.fromLTRB(25,25,15,15),
                             child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Warehouse name',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff242429)
                                ),
                                ),
                                Container(
                                  width: 137,
                                  height: 34,
                                  decoration: BoxDecoration(
                                    color: const Color(0xffF2F1F3),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: const [
                                      Text(
                                        'Pluto-x',
                                        style: TextStyle(
                                          color: Color(0xff242429),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SizedBox(width: 4), 
                                      Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Icon(
                                          Icons.keyboard_arrow_down_outlined,
                                          size: 20,
                                          color: Color(0xff878594),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                             
                              ],
                             ),
                             
                           ),
                           Divider(
                              thickness: 1, 
                              color: Color(0xffF2F1F3), 
                              height: 1, 
                           ),

                          Padding(
                             padding: const EdgeInsets.fromLTRB(25,25,15,15),
                             child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Opening stock (per unit)',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff242429)
                                ),
                                ),
                                Container(
                                  width: 137,
                                  height: 34,
                                  decoration: BoxDecoration(
                                    color: const Color(0xffffffff),
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow:[ BoxShadow(
                                      offset: Offset(0, 4),
                                      spreadRadius: 2,
                                      blurRadius: 12,
                                      color: Color(0x1A000000),
                                    ),],
                                    border: Border.all(
                                      width: 1,
                                      color: Color(0xffF2F1F3)
                                    )
                                  ),
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Text('12'),
                                    ))
                                )
                             
                              ],
                             ),
                             
                           ),

                           Divider(
                              thickness: 1, 
                              color: Color(0xffF2F1F3), 
                              height: 1, 
                           ),
                            Padding(
                             padding: const EdgeInsets.fromLTRB(25,25,15,15),
                             child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Opening stock value (per unit)',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff242429)
                                ),
                                ),
                                Container(
                                  width: 137,
                                  height: 34,
                                  decoration: BoxDecoration(
                                    color: const Color(0xffffffff),
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow:[ BoxShadow(
                                      offset: Offset(0, 4),
                                      spreadRadius: 2,
                                      blurRadius: 12,
                                      color: Color(0x1A000000),
                                    ),],
                                    border: Border.all(
                                      width: 1,
                                      color: Color(0xffF2F1F3)
                                    )
                                  ),
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Text('12'),
                                    ))
                                )
                             
                              ],
                             ),
                             
                           ),

                          
                           Divider(
                              thickness: 1, 
                              color: Color(0xffF2F1F3), 
                              height: 1, 
                           ),
                          SizedBox(height: 25,),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            width: 154,
                            height: 35,
                            decoration: BoxDecoration(
                              color: const Color(0xffffffff),
                              borderRadius: BorderRadius.circular(5),
                              boxShadow:[ BoxShadow(
                                offset: Offset(0, 4),
                                spreadRadius: 2,
                                blurRadius: 12,
                                color: Color(0x1A000000),
                              ),],
                              border: Border.all(
                                width: 1,
                                color: Color(0xff13A9F4)
                              )
                            ),
                            child: Center(child: Text('Add Warehouse',
                            style: TextStyle(
                              color: Color(0xff13A9F4),
                              fontWeight: FontWeight.w400,
                              fontSize: 13
                            ),
                            ))
                          ),
                        ),
                        SizedBox(height: 20,)

                        ],
                      )



                    ],
                  ),
                  
                ),
                SizedBox(height: 40,),
                Row(
                  children: [
                    Container(
                          width: 80,
                          height: 44,
                          decoration: BoxDecoration(
                            color: const Color(0xff13A9F4),
                            borderRadius: BorderRadius.circular(5),
                            boxShadow:[ BoxShadow(
                              offset: Offset(0, 4),
                              spreadRadius: 2,
                              blurRadius: 12,
                              color: Color(0x1A000000),
                            ),],
                            border: Border.all(
                              width: 1,
                              color: Color(0xff13A9F4)
                            )
                          ),
                          child: Center(child: Text('Save',
                          style: TextStyle(
                            color: Color(0xffFFFFFF),
                            fontWeight: FontWeight.w600,
                            fontSize: 13
                          ),
                          ))
                        ),
                        SizedBox(width: 10,),
                        Container(
                          width: 80,
                          height: 44,
                          decoration: BoxDecoration(
                           
                            borderRadius: BorderRadius.circular(5),
                            boxShadow:[ BoxShadow(
                              offset: Offset(0, 4),
                              spreadRadius: 2,
                              blurRadius: 12,
                              color: Color(0x1A000000),
                            ),],
                            border: Border.all(
                              width: 2,
                              color: Color(0xff3D3C44)
                            )
                          ),
                          child: Center(child: Text('Cancel',
                          style: TextStyle(
                            color: Color(0xff3D3C44),
                            fontWeight: FontWeight.w600,
                            fontSize: 13
                          ),
                          ))
                        )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
