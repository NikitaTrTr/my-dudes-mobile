import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'custom_slider_thumb_circle.dart';

class SliderWidget extends StatelessWidget {
  final double sliderHeight;
  final int min;
  final int max;
  final bool fullWidth;
  final RxInt value;
  final Function(double) onChange;

  SliderWidget({
    Key? key,
    required this.value,
    required this.onChange,
    this.sliderHeight = 48,
    this.max = 10,
    this.min = 0,
    this.fullWidth = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double paddingFactor = fullWidth ? .3 : .2;

    return Obx(() => Container(
        width: fullWidth ? double.infinity : sliderHeight * 5.5,
        height: sliderHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(sliderHeight * .3)),
          gradient: const LinearGradient(
            colors: [Colors.orangeAccent, Colors.orange],
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(1.0, 1.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
        ),
        child: Padding(
            padding: EdgeInsets.fromLTRB(sliderHeight * paddingFactor, 2,
                sliderHeight * paddingFactor, 2),
            child: Row(children: <Widget>[
              Text(
                '$min',
                style: TextStyle(
                  fontSize: sliderHeight * .3,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: sliderHeight * .1),
              Expanded(
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.white.withOpacity(1),
                    inactiveTrackColor: Colors.white.withOpacity(.5),
                    trackHeight: 4.0,
                    thumbShape: CustomSliderThumbCircle(
                      thumbRadius: sliderHeight * .4,
                      min: min,
                      max: max,
                    ),
                    overlayColor: Colors.white.withOpacity(.4),
                    activeTickMarkColor: Colors.white,
                    inactiveTickMarkColor: Colors.red.withOpacity(.7),
                  ),
                  child: Slider(
                    value: value.value.toDouble(),
                    min: min.toDouble(),
                    max: max.toDouble(),
                    onChanged: (val) => onChange(val),
                  ),
                ),
              ),
              SizedBox(width: sliderHeight * .1),
              Text(
                '$max',
                style: TextStyle(
                  fontSize: sliderHeight * .3,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              )
            ]))));
  }
}
