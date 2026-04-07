{
  snippets.luasnip = {
    enable = true;
    customSnippets.snipmate = {
      dart = [
        {
          trigger = "_stfw";
          body = ''
            class $1 extends StatefulWidget {
              const $1({super.key});

              @override
              State<$1> createState() => _$1State();
            }

            class _$1State extends State<$1> {
              @override
              Widget build(BuildContext context) {
                return const Placeholder();
              }
            }
          '';
        }
        {
          trigger = "_stlw";
          body = ''
            class $1 extends StatelessWidget {
              const $1({super.key});

              @override
                Widget build(BuildContext context) {
                  return const Placeholder();
                }
            }
          '';
        }
      ];
    };
  };
}
