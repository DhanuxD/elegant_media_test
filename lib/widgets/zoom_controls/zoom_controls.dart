import 'package:flutter/material.dart';

class ZoomControls extends StatelessWidget {
  final VoidCallback onZoomIn;

  final VoidCallback onZoomOut;

  const ZoomControls({
    super.key,

    required this.onZoomIn,

    required this.onZoomOut,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(15),

        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.15), blurRadius: 10),
        ],
      ),

      child: Column(
        children: [
          IconButton(onPressed: onZoomIn, icon: const Icon(Icons.add)),

          const Divider(height: 1),

          IconButton(onPressed: onZoomOut, icon: const Icon(Icons.remove)),
        ],
      ),
    );
  }
}
