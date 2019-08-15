import 'package:test/test.dart';
import 'package:reading_time/reading_time.dart';

const TEST_STR =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut tempus tempor lacus id commodo. Nullam fermentum vitae nisi eget scelerisque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse elementum at sapien vitae rutrum. Vestibulum id ex et sem vehicula fermentum sed non tortor. Integer iaculis, justo et blandit sagittis, odio ligula molestie sem, eu lobortis metus nibh quis nibh. Fusce ornare varius tellus, ac porta est. In eleifend iaculis erat vel iaculis. Maecenas sit amet aliquet diam. Proin eu semper tortor. Maecenas accumsan rutrum erat, ornare ullamcorper ipsum hendrerit quis. Sed at pulvinar erat.";

const MULTILINE = """
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut tempus tempor lacus id commodo. Nullam fermentum vitae nisi eget scelerisque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Suspendisse elementum at sapien vitae rutrum. Vestibulum id ex et sem vehicula fermentum sed non tortor. Integer iaculis, justo et blandit sagittis, odio ligula molestie sem, eu lobortis metus nibh quis nibh. Fusce ornare varius tellus, ac porta est. In eleifend iaculis erat vel iaculis. Maecenas sit amet aliquet diam. Proin eu semper tortor. Maecenas accumsan rutrum erat, ornare ullamcorper ipsum hendrerit quis. Sed at pulvinar erat.

In et cursus dui. In viverra tincidunt maximus. Etiam sit amet lobortis mauris, eget sollicitudin augue. Mauris finibus felis nisl. Mauris id lorem blandit ligula faucibus rhoncus. Sed molestie ipsum id nisl vestibulum vehicula. Proin dictum mi iaculis velit aliquet rhoncus. Suspendisse elementum maximus velit, ut elementum sem cursus ac. Phasellus efficitur congue odio, sit amet suscipit lacus convallis pulvinar. Etiam posuere dolor at nunc bibendum venenatis. Nam ac justo risus. Etiam ac metus sit amet diam malesuada maximus. Quisque odio arcu, cursus eget suscipit id, hendrerit non nisl. Fusce lacinia eu ipsum non mattis.

Mauris bibendum pellentesque quam. Sed bibendum malesuada orci, vel aliquam sem. Nunc sit amet ante id eros finibus cursus eget pharetra mi. Quisque eleifend accumsan lorem, id interdum felis rhoncus quis. Morbi a auctor risus. Nam placerat, nisl dapibus commodo facilisis, tellus metus semper odio, vel fringilla nisi mi id sapien. Etiam eget turpis sed ante venenatis accumsan ut non velit. Integer ut tellus placerat, tempus erat sit amet, scelerisque turpis. Aliquam velit leo, dictum quis dictum vitae, congue a turpis. Integer gravida risus ante.

Aenean ac nunc lacinia, vehicula purus at, malesuada nulla. Sed fermentum ante eu nisl pulvinar vehicula. Phasellus sem ante, cursus ut nisl sit amet, sagittis mollis magna. Quisque dapibus blandit tincidunt. Donec condimentum leo viverra egestas lobortis. Nulla pharetra ex ex, non laoreet ligula sodales sed. Donec tortor elit, feugiat et nunc et, sagittis eleifend metus. Nullam erat turpis, tincidunt sed quam sit amet, condimentum tincidunt leo. Curabitur imperdiet pharetra libero a cursus. Donec massa nisi, faucibus nec ornare sed, eleifend at dolor. Cras ullamcorper auctor nisl in porta.

Maecenas eleifend lobortis lectus vitae porttitor. Suspendisse at ex nec ante lobortis lacinia. In id diam aliquet nunc rhoncus placerat quis et quam. Nulla ut egestas diam. Quisque varius, nisi eget ullamcorper tincidunt, lacus eros fringilla nunc, vitae faucibus lacus diam at leo. Cras magna enim, interdum eget consectetur non, volutpat sit amet ex. Quisque mollis eget risus ac aliquam. Integer ultricies lorem neque.
""";

const SMALL =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut tempus tempor lacus id commodo.";

main() {
  test('testing out reading', () {
    expect(readingTime(TEST_STR)['text'], '1 min read');
    expect(readingTime(MULTILINE)['text'], '2 min read');
  });
  test('test out small text', () {
    expect(readingTime(SMALL)['text'], 'less than a minute');
  });
}