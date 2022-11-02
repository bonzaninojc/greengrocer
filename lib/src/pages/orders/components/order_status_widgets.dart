import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/custom_colors.dart';

class OrderStatusWidget extends StatelessWidget {
  final String status;
  final bool isOverdue;
  final Map<String, int> allStatus = <String, int>{
    'pending_payment': 0,
    'refunded': 1,
    'paid': 2,
    'preparing_purchase': 3,
    'shipping': 4,
    'delivared': 5,
  };

  int get currentStatus => allStatus[status]!;

  OrderStatusWidget({super.key, required this.status, required this.isOverdue});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _StatusDot(isActive: true, text: 'Pedido confirmado'),
        const _CustomDivider(),
        if (currentStatus == 1) ...[
          const _StatusDot(
            isActive: true,
            text: 'Pix estornado',
            backgroundColor: Colors.orange,
          ),
        ] else if (isOverdue) ...[
          const _StatusDot(
            isActive: true,
            text: 'Pagamento pix vencido',
            backgroundColor: Colors.red,
          )
        ] else ...[
          _StatusDot(isActive: currentStatus >= 2, text: 'Pagamento'),
          const _CustomDivider(),
          _StatusDot(isActive: currentStatus >= 3, text: 'Preparando'),
          const _CustomDivider(),
          _StatusDot(isActive: currentStatus >= 4, text: 'Envio'),
          const _CustomDivider(),
          _StatusDot(isActive: currentStatus >= 5, text: 'Entregue'),
        ]
      ],
    );
  }
}

class _CustomDivider extends StatelessWidget {
  const _CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      height: 10,
      width: 2,
      color: Colors.grey.shade300,
    );
  }
}

class _StatusDot extends StatelessWidget {
  final bool isActive;
  final String text;
  final Color? backgroundColor;

  const _StatusDot(
      {super.key,
      required this.isActive,
      required this.text,
      this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //DOT
        Container(
          alignment: Alignment.center,
          height: 20,
          width: 20,
          decoration: BoxDecoration(
              color: isActive
                  ? backgroundColor ?? CustomColors.customSwatchColor
                  : Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(
                color: CustomColors.customSwatchColor,
              )),
          child: isActive
              ? const Icon(
                  Icons.check,
                  size: 13,
                  color: Colors.white,
                )
              : const SizedBox.shrink(),
        ),

        const SizedBox(
          width: 5,
        ),

        Expanded(
            child: Text(
          text,
          style: const TextStyle(
            fontSize: 12,
          ),
        )),
      ],
    );
  }
}
