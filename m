Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 138C5EB64D7
	for <qemu-riscv@archiver.kernel.org>; Fri, 23 Jun 2023 14:36:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qChtZ-0006D6-R6; Fri, 23 Jun 2023 10:36:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <lakshmi.bai.rajasubramanian@bodhicomputing.com>)
 id 1qChtX-0006Cs-Tq; Fri, 23 Jun 2023 10:36:15 -0400
Received: from mail-maxind01on2061d.outbound.protection.outlook.com
 ([2a01:111:f403:700f::61d]
 helo=IND01-MAX-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <lakshmi.bai.rajasubramanian@bodhicomputing.com>)
 id 1qChtW-000723-64; Fri, 23 Jun 2023 10:36:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jJjdkzpax9UJhodjB490gfWQxKX7KmW7SmGydXbkmwKElRfgCWyUzaYKWbxv4gQ/gU5KbDQZIXNtQiCYYvOO1Osn9KcO2ZoKa97NPfls9R3WnZ8z+7/lC9LvWZa18MV2Wa7WodgIM4It31PqKCXrUNWnDHoVUzA1lvXOg5dPHGyXMkEsX7/k0TfCAWcuRXVXA9NnCqa7sC4izlucFU0dHpQSp79i9w/4KT+0cpHA7evpA/kCyvHVRJnDQltt2OSvPZ5tgx5YvwjpqIkbz6ZuZsqf38y84A1iNEH3EOb/HCJangSgvg5bNPunQavDxPwzlWVI7nluYG5YxQ7CuchKhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+3bw8TDidPmCT7Ueurg5RoOsNMihiBkahkaclPlWme0=;
 b=TuP4ntrLs2evNYEz0yIMPiz0uxKmHVwbjNJi7VdF6A6m2Lrhl22AaJ/h3YiVwkug6f13P5U53E2HX6kUw1vGtbB9fhSj/AY+LixeDYcWEucUykTqV0KR38IHeh0t8vpeGNY0uO6fY3vjlffmoKEERLrc5fzfpQZKVo6xGNPh6bpt4fN800KzgnPqvuFMr0kj+XQhRk4qFXot0nQpjXjhE04xiSRXVTRpKAR/MW93lTWKyPdDcHQiF2yoYYkERmCi3rbL6kKdmekL9qBfrMF293Dc0IW2UPGmoRmeWJqob8m5KK4JQsMvNJZo4ZdipFT2BryFqEC6FMU5OaTfb1dPkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bodhicomputing.com; dmarc=pass action=none
 header.from=bodhicomputing.com; dkim=pass header.d=bodhicomputing.com;
 arc=none
Received: from PN0P287MB0120.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:e3::12)
 by PN3P287MB0083.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:d0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Fri, 23 Jun
 2023 14:36:05 +0000
Received: from PN0P287MB0120.INDP287.PROD.OUTLOOK.COM
 ([fe80::b8da:994e:bab2:bb25]) by PN0P287MB0120.INDP287.PROD.OUTLOOK.COM
 ([fe80::b8da:994e:bab2:bb25%4]) with mapi id 15.20.6521.026; Fri, 23 Jun 2023
 14:36:04 +0000
From: Lakshmi Bai Raja Subramanian
 <lakshmi.bai.rajasubramanian@bodhicomputing.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>, Alistair Francis
 <alistair.francis@wdc.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH qemu v2] change the fdt_load_addr variable datatype to
 handle 64-bit DRAM address
Thread-Topic: [PATCH qemu v2] change the fdt_load_addr variable datatype to
 handle 64-bit DRAM address
Thread-Index: AQHZpTnDqfRSlnyfUUmNVFwuFsP1bq+YdPJw
Date: Fri, 23 Jun 2023 14:36:04 +0000
Message-ID: <PN0P287MB0120BDEF4C2919FE81A85153D523A@PN0P287MB0120.INDP287.PROD.OUTLOOK.COM>
References: <168728374725.24164.15960018589525015764-0@git.sr.ht>
 <da9768b2-84be-5e80-cdfd-ca60bdb48ac9@ventanamicro.com>
In-Reply-To: <da9768b2-84be-5e80-cdfd-ca60bdb48ac9@ventanamicro.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bodhicomputing.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN0P287MB0120:EE_|PN3P287MB0083:EE_
x-ms-office365-filtering-correlation-id: 5f7e8e74-68b9-4a15-1736-08db73f72cd2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: W34Xs3psTVgFMbE11WQCZd3aSWNeqh4bnxoeCuwEYnCd5FoY2XeeAt/J0Z4cvdimNslh194KNYZ78Apdi3NtygY62f2NXWffs08ka0HLZpGPCtTUN2seOyr86GPElpsPGR3opPEWwwQPs8KwDI5fHNdpV5G5Gci1zj2IPgi87bxGVvv4zwVf5QHSOUb0I6Jvq6/+hbGHXFKKP5wtTUliuAYU8SXs1SliMG2Zaj8zEmhVSTEjJFK8MgbF0M6+LwYjydQDhmbuinhfdGzuTjXxHEsW9FcI+I4BFtveJadYjRkQLvnid1sV+CqpcW89evErzSEwtuwlKELwJY1L0Dpq9e37JpGlDAVEEWw+/WSEkmGQxY62TrtSQTQlLRE3rOW8vKYVBMiv6mRfMjCH2jfWzmFyMS723to7VcUt5Zx14FjvOPMpJZUUA1Qlju7MHEyKOQ/BeJyYrhm7ECStWQ+DBM5QolqUn94OrVNMd96OelxqMxq7N+Id0BQOcpMJ2sGEhCR7Nu2vni3Qiq9Mte7fc/EAU4ZYMypuZ2toJJGRQAJbAZCAuE32e6k8xnKfezjFPJ9WT7VUO128GyPvnsBl3QOR1SNsYqWXwqNXiqWFpfk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PN0P287MB0120.INDP287.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(366004)(39830400003)(136003)(346002)(396003)(451199021)(2906002)(7696005)(71200400001)(38100700002)(83380400001)(122000001)(6506007)(26005)(53546011)(186003)(9686003)(966005)(55016003)(41300700001)(110136005)(86362001)(38070700005)(478600001)(316002)(76116006)(66556008)(4326008)(66446008)(66946007)(8936002)(8676002)(64756008)(66476007)(33656002)(52536014)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ckptNzRIT09mM0RxV2grczI1QTJXYTFMaDFLajhUNm9KbUMrUDBPYVlhcHlD?=
 =?utf-8?B?WXlmRndhWFFWazUwYlBnNWp6WGs0SDhndjNJRytaN2kxOFFDUnZsNXkwK0NH?=
 =?utf-8?B?UFd6VEJTbXJUcHd4TTFJU25TOXhVMi83VlJ3a3o2THkvU3c0TmdJaHF4K3dP?=
 =?utf-8?B?bk8wUmsxa3F1eUdHNmlqWnFSelhqYWV6OEYrYkVoM3JISHJxWFd2ak9QbHpa?=
 =?utf-8?B?SG5RV1A3bTE1L1k3STJLVml0U1ArMmFHQnZrL0laTmNkMHVHdTlrWVdwVklM?=
 =?utf-8?B?M2JqZ3pabEFVZDJFdk5lVjNqYnhyUkdBVjRzd0oyWmFYMGM0UGJNWU9aSUdF?=
 =?utf-8?B?dDlQSjVoZEd5dU9rc3J5TmdsbmNrdFJFSm5Vd0RaY0ordEJ6eW5PNXBEVW44?=
 =?utf-8?B?bjBCT25tcWF3RHJJRk5XbkZxeDc2K0g5ZUpoT3lrUzRGY2srVnlvbW0vVUJm?=
 =?utf-8?B?UXhqcVcrTEwxeGJTdEp1bktWckx6R0cwNzNjN1djWG1nSi9nTXk1bzhJY2pj?=
 =?utf-8?B?eldZZW83aDlCZnpBRnNyTm9jZ016Rm1kWUx2dFlabHlJeXJmRXRKT2s5ZGZC?=
 =?utf-8?B?M1BneWhiTEI0OFdDM01FMi9pRXZVVEUwdkVNT2w1dCtLMnY1M0IxV2JabzNl?=
 =?utf-8?B?TXFWZmduSWE5TzhJcGVoVFVKSHMyT1dwVlRocWJXZkdjZytGT1RNdlhBRWJY?=
 =?utf-8?B?NU5mS3lwVmt0ZnNiWUJhenFqVkZNT0VsYWNVZkdWS1pWUWJGcVNZTE1VMXh3?=
 =?utf-8?B?WEVwSDFHdDhrd1VZM1FlR2NYTWhwUUlVTUVjYU9iZlZtQjZTSk1paU44T2NX?=
 =?utf-8?B?aVR6aGpqOEMvKy83azlLanFTV3FXV0o5SEt2YTVEckE0WDBVS0NWZTFZMkk4?=
 =?utf-8?B?Nlo0cVVRSzd4WW9VbjQvM3dGL1VFejR3NmFhZnQyVnJxYSs0RUQxUU1ad1J0?=
 =?utf-8?B?Q2RldmN4SUtteml0NU5hV25WeEZXMmxvaWVTRnJtaFhIUlU1d3ZqSzZiUkdk?=
 =?utf-8?B?WVlkd1dhOW9PbytKM0czRjJhcVFUVmE2TnpMSHVVbkdkeXRkQTdCdEl2OS9i?=
 =?utf-8?B?SkdOZHNxVzVpaHVXN3MxZVNHQWE3MXhVSWNSWEZ2ZS90NS9PaGdqelB6cDA5?=
 =?utf-8?B?VUdnWnpRR1lxdjBDZHBBemZISmU0RDFrWUpqeXJRL05ETnBSR2p6Umk2cVo1?=
 =?utf-8?B?amtQdzZSbTByeGFUUGpLcmdGRFhLWnErS1dhNEx2TmJIbk9CNzBuY1dWZ3RP?=
 =?utf-8?B?K2Y4Z0dLbE1Vd3FKM2JxdVFHbnlGVFd5NCt6d2lUVHo5dWVUcmR4RFZTT3VV?=
 =?utf-8?B?Zm8zQk52V0FqNFVCb2Q0alluM3hrN2hPVWZjQzJSZi9aSk9DdlFsOVl1VklT?=
 =?utf-8?B?bUlvOTJtK0RxM0FsVjN1dEtGYmJmRlcyTjZheGtuZEdrZk9Kbk44MmlrVUts?=
 =?utf-8?B?NHh3ZDh1MjhDY2xNeklVNzRXTVUwUHMyakVuNFlzcDdYK3JNUzFPZjBINmJl?=
 =?utf-8?B?U2Q2Yms4WXBRZ2ZHUVRRWkF3Y3Zqc0tiQ0FqbmtTWHM3cHJHbi9QS29lcW9O?=
 =?utf-8?B?aXdiL3lBZzBQS0IzckMyVkdpTHlNSUVNZ0ZkUWttWVU1dWRnMXEwbWpVbHZv?=
 =?utf-8?B?VE9ibU1GNzk3WWl3bCtaUGNaQ2lLYW5zZVprL2lPMURqdUdjVHBPTkh5ME1J?=
 =?utf-8?B?MUZSZnVjemZOUkhGVzhZcWY5eDdXVGQvSTdORFhUaUJaOUdxc2MzYVBZOU1s?=
 =?utf-8?B?UzhId1BTOWFVZ1NuRjV3Wlk1QXVSVzAvWWsxWUR2Z0dFcDZJdUk5NmI5UkJp?=
 =?utf-8?B?cFE2ODRMTWREUEZlTUtPcDVZdEVDV1VRSFlkRUh0cFZXUmZQdFRCcjBHWXNH?=
 =?utf-8?B?Z25yUVFYeXRlVmpodFVJZXg0NGJwMVlTMTdMa3BKdmxNWFBhbnhCUWEwbE02?=
 =?utf-8?B?RFJiZ1hRMlJ5S1hmWjZUV04rbnFWN1gxSTdOblFibklwUFlRTHIvRnprUUJv?=
 =?utf-8?B?WFBFZTlkMG1NN2RpeGRHM1VHRml0dlhST3A3MGY3UHQ5S1d1M0I1bDMxUURC?=
 =?utf-8?B?cnc0MTJGQUt6b0V3OUJaZXFHRTVNV2RramFjQ3h2S1JZSmovS1hYTitaS050?=
 =?utf-8?B?OTZrcGxMcnAra1AzMzNpVmZUTkFHV2x5a2x0Yk5uVGRFdGxNT3VJNUNId2JM?=
 =?utf-8?Q?3wYEdGLOwYY+HquA3zxR6QUmJyawlQl1n91S8x1U4kqH?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bodhicomputing.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB0120.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f7e8e74-68b9-4a15-1736-08db73f72cd2
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2023 14:36:04.9009 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 952ec668-7cb7-414e-891d-dbe9c50f72a7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RpAxJA7stst5bd3yJohbr2R84QrhNkc+o/8bI65nFfCJxzJVqv1EbuqAM4jkbkqUjJwQYCvepOddl60fsct1XQ1yAO4DaFtVWwpcgizXDMgpV/cuqVfAd+hwvgKK3nMx3cDzGEOCdFkIXMWbpE9sQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB0083
Received-SPF: pass client-ip=2a01:111:f403:700f::61d;
 envelope-from=lakshmi.bai.rajasubramanian@bodhicomputing.com;
 helo=IND01-MAX-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

RGVhciBEYW5pZWwsDQoNClRoYW5rcyBmb3IgeW91ciBjb21tZW50cy4gSW5jb3Jwb3JhdGVkIHRo
ZSBzYW1lIGFuZCB1cGRhdGVkIHRoZSBwYXRjaCBzZXQgYXMgdjMuIA0KDQpodHRwczovL2xpc3Rz
LmdudS5vcmcvYXJjaGl2ZS9odG1sL3FlbXUtcmlzY3YvMjAyMy0wNi9tc2cwMDU3MC5odG1sDQoN
ClJlZ2FyZHMsDQpMYWtzaG1pDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBE
YW5pZWwgSGVucmlxdWUgQmFyYm96YSA8ZGJhcmJvemFAdmVudGFuYW1pY3JvLmNvbT4gDQpTZW50
OiBGcmlkYXksIEp1bmUgMjMsIDIwMjMgMTI6MTYgQU0NClRvOiBMYWtzaG1pIEJhaSBSYWphIFN1
YnJhbWFuaWFuIDxsYWtzaG1pLmJhaS5yYWphc3VicmFtYW5pYW5AYm9kaGljb21wdXRpbmcuY29t
PjsgcWVtdS1yaXNjdkBub25nbnUub3JnOyBBbGlzdGFpciBGcmFuY2lzIDxhbGlzdGFpci5mcmFu
Y2lzQHdkYy5jb20+DQpDYzogcWVtdS1kZXZlbEBub25nbnUub3JnDQpTdWJqZWN0OiBSZTogW1BB
VENIIHFlbXUgdjJdIGNoYW5nZSB0aGUgZmR0X2xvYWRfYWRkciB2YXJpYWJsZSBkYXRhdHlwZSB0
byBoYW5kbGUgNjQtYml0IERSQU0gYWRkcmVzcw0KDQooQ0MtaW5nIEFsaXN0YWlyKQ0KDQpPbiA2
LzIwLzIzIDE0OjQ0LCB+cmxha3NobWliYWkgd3JvdGU6DQo+IEZyb206IExha3NobWkgQmFpIFJh
amEgU3VicmFtYW5pYW4gDQo+IDxsYWtzaG1pLmJhaS5yYWphc3VicmFtYW5pYW5AYm9kaGljb21w
dXRpbmcuY29tPg0KPiANCj4gZmR0X2xvYWRfYWRkciBpcyBnZXR0aW5nIG92ZXJmbG93ZWQgd2hl
biB0aGVyZSBpcyBubyBEUkFNIGF0IGxvd2VyIDMyIGJpdCBhZGRyZXNzIHNwYWNlLg0KPiBUbyBz
dXBwb3J0IHB1cmUgNjQtYml0IERSQU0gYWRkcmVzcywgZmR0X2xvYWRfYWRkciB2YXJpYWJsZSdz
IGRhdGEgDQo+IHR5cGUgaXMgY2hhbmdlZCB0byB1aW50NjRfdCBpbnN0ZWFkwqBvZsKgdWludDMy
X3QuDQoNCkl0J3Mgd29ydGggbWVudGlvbmluZyB0aGF0IGZkdF9sb2FkX2FkZHIgcmVjZWl2ZXMg
dGhlIHJlc3VsdCBvZiByaXNjdl9jb21wdXRlX2ZkdF9hZGRyKCksIHdoaWNoIGlzIGFuIHVpbnQ2
NF90Lg0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBMYWtzaG1pIEJhaSBSYWphIFN1YnJhbWFuaWFu
IA0KPiA8bGFrc2htaS5iYWkucmFqYXN1YnJhbWFuaWFuQGJvZGhpY29tcHV0aW5nLmNvbT4NCj4g
LS0tDQoNClJldmlld2VkLWJ5OiBEYW5pZWwgSGVucmlxdWUgQmFyYm96YSA8ZGJhcmJvemFAdmVu
dGFuYW1pY3JvLmNvbT4NCg0KPiAgIGh3L3Jpc2N2L3ZpcnQuYyB8IDIgKy0NCj4gICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQg
YS9ody9yaXNjdi92aXJ0LmMgYi9ody9yaXNjdi92aXJ0LmMgaW5kZXggDQo+IDk1NzA4ZDg5MGUu
LmMzNDg1MjlhYzAgMTAwNjQ0DQo+IC0tLSBhL2h3L3Jpc2N2L3ZpcnQuYw0KPiArKysgYi9ody9y
aXNjdi92aXJ0LmMNCj4gQEAgLTEyNDQsNyArMTI0NCw3IEBAIHN0YXRpYyB2b2lkIHZpcnRfbWFj
aGluZV9kb25lKE5vdGlmaWVyICpub3RpZmllciwgdm9pZCAqZGF0YSkNCj4gICAgICAgdGFyZ2V0
X3Vsb25nIHN0YXJ0X2FkZHIgPSBtZW1tYXBbVklSVF9EUkFNXS5iYXNlOw0KPiAgICAgICB0YXJn
ZXRfdWxvbmcgZmlybXdhcmVfZW5kX2FkZHIsIGtlcm5lbF9zdGFydF9hZGRyOw0KPiAgICAgICBj
b25zdCBjaGFyICpmaXJtd2FyZV9uYW1lID0gcmlzY3ZfZGVmYXVsdF9maXJtd2FyZV9uYW1lKCZz
LT5zb2NbMF0pOw0KPiAtICAgIHVpbnQzMl90IGZkdF9sb2FkX2FkZHI7DQo+ICsgICAgdWludDY0
X3QgZmR0X2xvYWRfYWRkcjsNCg0KDQoNCj4gICAgICAgdWludDY0X3Qga2VybmVsX2VudHJ5ID0g
MDsNCj4gICAgICAgQmxvY2tCYWNrZW5kICpwZmxhc2hfYmxrMDsNCj4gICANCg==

