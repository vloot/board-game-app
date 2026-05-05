import 'package:board_game_app/features/shared/app_data/app_data_cubit.dart';
import 'package:board_game_app/features/shared/extensions.dart';
import 'package:board_game_app/features/stats/domain/player_winrate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BarLabelsOverlay extends StatelessWidget {
  final List<PlayerWinrateEntity> items;

  const BarLabelsOverlay(this.items, {super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final height = constraints.maxHeight;

        final maxY = items
            .map((e) => e.gamesPlayed)
            .fold<int>(0, (a, b) => a > b ? a : b)
            .toDouble();

        final singleBarHeight = height / maxY;

        return Padding(
          padding: const EdgeInsets.only(left: 22, right: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(items.length, (i) {
              final e = items[i];
              final playerColor = context
                  .read<AppDataCubit>()
                  .state
                  .playersById[e.playerId]!
                  .color;

              final wins = e.wins.toDouble();
              final losses = (e.gamesPlayed - e.wins).toDouble();

              final lossHeight = losses * singleBarHeight;
              final winHeight = wins / maxY * height;

              final textStyle = const TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              );

              return SizedBox(
                width: 56,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    // Losses (centered in lower segment)
                    if (losses > 0)
                      Positioned(
                        bottom: e.gamesPlayed - e.wins == 1
                            ? lossHeight
                            : lossHeight / 2,
                        child: Text('${losses.toInt()} ▼', style: textStyle),
                      ),

                    // Wins (centered in upper segment)
                    if (wins > 0)
                      Positioned(
                        bottom: lossHeight + (winHeight / 2),
                        child: Text(
                          '${wins.toInt()} ★',
                          style: textStyle.copyWith(
                            color: Color(playerColor).overlayColor,
                          ),
                        ),
                      ),
                  ],
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
