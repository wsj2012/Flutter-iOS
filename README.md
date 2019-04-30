# myapp

#### Fetures:

- 全使用iOS风格widget（CupertinoTabBar搭配CupertinoTabScaffold）
- tabBar上菜单可自由设置显示风格（包括图标、字体大小颜色）

#### Attention:

- 此入口类CupertinoTabScaffold内未设置navigationBar， navigationBar最好都在各自page页内设置，这样可自定制navigationBar上显示的不同元素。（如果在此入口类设置了navigationBar，各tab首页page的navigationBar上显示元素就会一致，个性化定制各page的navigationBar就需要加入更多的逻辑，建议navigationBar分散到各自的page页去实现）

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.io/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.io/docs/cookbook)

For help getting started with Flutter, view our 
[online documentation](https://flutter.io/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.