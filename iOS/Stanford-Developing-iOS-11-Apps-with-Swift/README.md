# inflearn Stanford iOS 한글자막 강의

## 1강 개요 및 계산기 만들기

### iOS안에는 무엇이 있을까?

* iOS는 크게 4 Layer로 나눠진다.  
  > iOS의 구조  
  >
  > -- User --  
  > Cocoa Touch  
  > Media  
  > Core Services  
  > Core OS  
  > -- Hardware --
  * Core OS
    * iPhone은 UNIX 기반
    * 멀티테스킹, UNIX 파일시스템, 전원관리, 접근제어 Keychain Access 등을 가지고 있음.
  * Core Services
    * 객체지향언어로 작성된 layer
    * 네트워킹, 멀티쓰레드, Preferences, SQL 등을 지원
  * Multimedia
    * video, JPEG, OpenGL 등의 모든 종류의 미디어 프레임워크를 가짐
  * Cocoa Touch
    * 버튼이나 슬라이더만이 UI는 아님. 애니메이션이나 각종 센서를 이용하는 것도 포함한다.
