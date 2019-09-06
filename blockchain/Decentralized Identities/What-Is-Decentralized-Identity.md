# What Is Decentralized Identity

* [일본어 원본 문서](https://speakerdeck.com/chanpu/what-is-decentralized-identity)

> 이 문서는 2018년 11월 10일에 일본 도쿄 케이오기쥬쿠대학에서  
> 열린 Hi-Con 2018에서 발표된 주제에 대한 PPT를 번역한 것입니다.  
> 발표자 : Kunihito Kuwabara

## 분산형 ID란 무엇인가?

### What Is Identity

* Who Am I?
* Who Are You?
  * 1991년 도쿄에서 태어났다.
  * 성장하여,
  * 정말로 동일 인물인가?

* Personal Data
  * Family Register
  * Finance
  * Purchase History
  * Education
  * Occupation
  * Health

* 거짓 정보

* Know Your Cusomer (KYC)
  * AML(Anti-Money Laundering)
    * 자금 세탁 대책
  * CFT(Counter Financing of Terrorism)
    * 테러 자금 공여 대책
  * Verification Documents
    * 여권
    * 면허증
    * 초본
    * 연금 수첩

* Internet Identification
  * Authentication : 인증
    * 본인이라는 것을 확인하는 것
  * Authorization : 인가
    * 리소스의 엑세스 권한을 부여하는 것
    * != 허가?

* Digital Identity

* Federated Identity

* OpenID connect
  1. Access Client
  2. Request Authorization
  3. AuthN & AuthZ
  4. AuthN Response
  5. Token Request
  6. Access Token & IdToken

* Self-Sovereign Identity (자기증명형 신분증명)
  * 특징
    * Secure - 정보유출/공개되지 않는다.
    * Controllability - 자신의 정보를 목적에 따라 관리
    * Portability - Provider에게 종속되지 않고 공개
  * 절차
    1. Attestations Request - 증명 요청
    2. Attestations Respons - 증명 응답
    3. Send Attested information - 증명된 정보 발송
    4. Accept to access - 액세스 동의
  * 내용
    * 제3기관에서 보증(Attestations)되었다
    * 자격 정보 (Credentials)와
    * 속성 정보(Claims)를 분권화된 증명(Proofs)로써
    * 유지해서 자기관리할 수 있는 개념

### Self-Sovereign Identity Management on the Blockchain

* ERC725 By Fabian Vogelsteller

  * [ERC725](https://github.com/ethereum/EIPs/issues/725)
    * Identity가 소유하는 공개키의 관리
    * key type
      * MANAGEMENT：Identity를 관리한다.
      * ACTION ：Tx, login, access등을 취급.
      * CLAIM_SIGNER ：Claim를 서명
      * ENCRYPTION ：데이터를 암호화한다.

  * [ERC735](https://github.com/ethereum/EIPs/issues/735) - ERC725의 구현
    * Claim의 관리
      * 인터페이스를 정의
    * [Origin Protocol](https://www.originprotocol.com/) (ERC735 기반 DApp 마켓플레이스)

``` solidity
  struct Claim {
    uint256 topic;
    uint256 scheme;
    address issuer; // msg.sender
    bytes signature; // this.address + topic + data
    bytes data;
    string uri;
}
```

* [ERC780](https://github.com/ethereum/EIPs/issues/780) By Joel Torstensson

  * Ethereum Claims Registry (ECR)
    * Claim을 유지하는 레지스트리
    * 가스 소비를 감소

* [ERC1056](https://github.com/ethereum/EIPs/issues/1056) By Pelle Braendgaard, Joel Torstensson

  * Lightweight Identity
    * DID 기준을 준수
    * Identity의 작성
  * Identity Ownership
    * Claim 소유의 변경
  * Delegate management
    * On / Off 체인의 델리게이트 관리
  * Attribute management
    * Attribute의 관리

* [ERC1056 ❤ ERC780 — an open identity and claims protocol for Ethereum](https://medium.com/uport/erc1056-erc780-an-open-identity-and-claims-protocol-for-ethereum-aef7207bc744)

* Decentralized Identities (DIDs) - [참고 문헌](https://medium.com/decentralized-identity/the-rising-tide-of-decentralized-identity-2e163e4ec663)
  * Decentralized Identity Foudation (DIF)
    * Microsoft, uPort, Evernym 등
  * 분산ID의 표준화
  * 사람, 조직, 디바이스등 모든 것에 연결  

``` JSON
{
  "@context": "https://w3id.org/did/v1",
  "id": "did:example:123456789abcdefghi",
  "publicKey": [{
    "id": "did:example:123456789abcdefghi#keys-1",
    "type": "RsaVeriﬁcationKey2018",
    "owner": "did:example:123456789abcdefghi",
    "publicKeyPem": "-----BEGIN PUBLIC KEY...END PUBLIC KEY-----\r\n"
  }],
  "authentication": [{
    // this key can be used to authenticate as DID ...9938
    "type": "RsaSignatureAuthentication2018",
    "publicKey": "did:example:123456789abcdefghi#keys-1"
  }],
  "service": [{
    "type": "ExampleService",
    "serviceEndpoint": "https://example.com/endpoint/8377464"
  }]
}
```

  * Verifiable Claims Data Model

```JSON
{
  "@context": [
    "https://w3id.org/identity/v1",
    "https://w3id.org/security/v1"
  ],
  "id": "http://example.gov/credentials/3732",
  "type": ["Credential", "ProofOfAgeCredential"],
  "issuer": "https://dmv.example.gov",
  "issued": "2010-01-01",
  "claim": {
    "id": "did:example:ebfeb1f712ebc6f1c276e12ec21",
    "ageOver": 21
  },
  "signature": {
    "type": "LinkedDataSignature2015",
    "created": "2016-06-18T21:10:38Z",
    "creator": "https://example.com/jdoe/keys/1",
    "domain": "json-ld.org",
    "nonce": "6165d7e8",
    "signatureValue": “g4j9UrpHM4/uu32NlTw0HDaSaYF2sykskfuByD7UbuqEc…
}
```

* Identity Project

  * UniversalLogin SDK
    * Malt factor Authentication
    * Friendly name
    * Meta tx

  * Iden3
    * Circom
    * zkSNARKs
  
  * uPort [By Consensys](https://consensys.net)
    * uPort Connect
      * Client Side의 처리 라이브러리
    * uPort Credentials
      * Node Server의 처리 라이브러리
      * id의 서명과 검증의 라이브러리
      * Attestation, Credential의 리퀘스트
    * uPort Transports
      * QR Code, 푸쉬 알림 등
    * uPort Mobile
      * 모바일 월렛 어플
    * uPort Layer를 통해 이더리움 위에 DID용 DApp을 구축할 수 있음.
    * https://github.com/uport-project/specs/blob/develop/flows/selectivedisclosure.md
