Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lHaWx-0006by-2c
	for mharc-qemu-riscv@gnu.org; Wed, 03 Mar 2021 18:03:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lHaWv-0006bO-V8; Wed, 03 Mar 2021 18:03:45 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:36642)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lHaWs-0007Wa-T1; Wed, 03 Mar 2021 18:03:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1614812622; x=1646348622;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qV1VxXAimIy5licNcpbh8RuOMF1OdYlCtnxqviowFF4=;
 b=ZO0sxnTu44u0tKC3rFRIra5lcpe88HrsFQxq2VdDMtQpSqyE4scB8SgI
 sLZA8NlJ29MUROIcD7uLHq0HpKMvfzFeXu+C9Fl8k+FpjHDxjvrQOiE2C
 Uz9nopvup2MTKS+2ZqRLcyUAfZC1RtKf9XHN3/3fXeSiZQ+ObwOaVhkZa g=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 03 Mar 2021 15:03:38 -0800
X-QCInternal: smtphost
Received: from nasanexm03b.na.qualcomm.com ([10.85.0.98])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/AES256-SHA;
 03 Mar 2021 15:03:31 -0800
Received: from nasanexm03b.na.qualcomm.com (10.85.0.98) by
 nasanexm03b.na.qualcomm.com (10.85.0.98) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 3 Mar 2021 15:03:30 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (199.106.107.6)
 by nasanexm03b.na.qualcomm.com (10.85.0.98) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Wed, 3 Mar 2021 15:03:30 -0800
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by BY5PR02MB6472.namprd02.prod.outlook.com (2603:10b6:a03:1d7::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.28; Wed, 3 Mar
 2021 23:03:29 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::7980:b3e8:c439:fad6]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::7980:b3e8:c439:fad6%4]) with mapi id 15.20.3912.019; Wed, 3 Mar 2021
 23:03:29 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: Yoshinori Sato <ysato@users.sourceforge.jp>, Chris Wulff
 <crwulff@gmail.com>, "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>, "Marcel
 Apfelbaum" <marcel.apfelbaum@gmail.com>, Greg Kurz <groug@kaod.org>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>, Richard Henderson
 <richard.henderson@linaro.org>, Peter Maydell <peter.maydell@linaro.org>,
 Michael Walle <michael@walle.cc>, Palmer Dabbelt <palmer@dabbelt.com>, "Sarah
 Harris" <S.E.Harris@kent.ac.uk>, Anthony Green <green@moxielogic.com>,
 "Eduardo Habkost" <ehabkost@redhat.com>, Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>, Laurent Vivier <laurent@vivier.eu>, "Edgar
 E. Iglesias" <edgar.iglesias@gmail.com>, Claudio Fontana <cfontana@suse.de>,
 Artyom Tarasenko <atar4qemu@gmail.com>, "qemu-s390x@nongnu.org"
 <qemu-s390x@nongnu.org>, Thomas Huth <thuth@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>, Alistair Francis
 <Alistair.Francis@wdc.com>, Michael Rolnik <mrolnik@gmail.com>, "David
 Hildenbrand" <david@redhat.com>, Aleksandar Rikalo
 <aleksandar.rikalo@syrmia.com>, Stafford Horne <shorne@gmail.com>, "Jiaxun
 Yang" <jiaxun.yang@flygoat.com>, Marek Vasut <marex@denx.de>, Mark
 Cave-Ayland <mark.cave-ayland@ilande.co.uk>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, David Gibson <david@gibson.dropbear.id.au>, Sagar
 Karandikar <sagark@eecs.berkeley.edu>, Guan Xuetao <gxt@mprc.pku.edu.cn>, Max
 Filippov <jcmvbkbc@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>
Subject: RE: [RFC PATCH 6/7] cpu: Move CPUClass::has_work() to TCGCPUOps
Thread-Topic: [RFC PATCH 6/7] cpu: Move CPUClass::has_work() to TCGCPUOps
Thread-Index: AQHXD07T7beo7/uQWk2tT+ZCOhVNu6py4bVg
Date: Wed, 3 Mar 2021 23:03:29 +0000
Message-ID: <BYAPR02MB48864335799EF6BB5C440206DE989@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <20210302102737.1031287-1-f4bug@amsat.org>
 <20210302102737.1031287-7-f4bug@amsat.org>
In-Reply-To: <20210302102737.1031287-7-f4bug@amsat.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: amsat.org; dkim=none (message not signed)
 header.d=none;amsat.org; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [70.115.140.19]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1b152704-b964-454b-688f-08d8de988f58
x-ms-traffictypediagnostic: BY5PR02MB6472:
x-microsoft-antispam-prvs: <BY5PR02MB6472D428706192589D6FBB47DE989@BY5PR02MB6472.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:549;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iLmoiKgcbM+NmOtT2NyybgXOU4ssWYizkhf62qAlF9fBp36ynI/sRKm9yQ/Hb636zdNXhgNAM6SFr5lZDl1v8XrmIpXx+EXW9nhOsGVxUgPXvymn2Y889ZhAKnvTQQNQilXWmTvi9WRsfh8gPd9YX+LzKxMtyz7xlJlFDs07mAoNU/70JHSJXG4f7MGoXdD3asVkrYKL/LZh18jXYxx+Xuvg/iJZkNuVnJWyhWVsgo/IpirhhHktU9ZZh/UZWXi99REAcXjUywYfvV3vb2N7tH7vtujRQU9KseMMvhEibw7A/sH64VzkRoCL/O++SaFxFXf/N2VYAIVK4xADCUYeLyZYenZXZJb1T54oJCQaH4uBWeCkhULijt3zBbNQKyK98ROp5S8sfaGpMvaBuEdrFAn8uGrXFXMwveSMuPymlx59ZWKpvoueOvnWFl3csHKpMZYG0KkfxZaQm4QkEXTr8/sFSYzZNzsUtNJWgbXz6W4nBIiSfEwV9W66Q7pludS+awmCwqH1F0LUscfYT1j1IQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(39860400002)(366004)(396003)(9686003)(86362001)(83380400001)(76116006)(7416002)(7406005)(66446008)(5660300002)(66476007)(110136005)(26005)(316002)(53546011)(2906002)(478600001)(6506007)(64756008)(8676002)(52536014)(66556008)(54906003)(186003)(71200400001)(7696005)(8936002)(55016002)(66946007)(33656002)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?bFhDanBPdXQ3eVdvbG8ySGZaYVdodk1LZmNGN2dyWGh1T1dCY240R09SVXpK?=
 =?utf-8?B?K2xPNjk0UG1FOTJ2NVVtVHZMTmV1NUJyclM4YStHdndMazZ0c0d4V1BYWFJR?=
 =?utf-8?B?TlNyMUNWWVBWdHRnOExkYzgrUjZBWGE3dmQrYTdXNGpJekt4bFQ2QnA4MGFv?=
 =?utf-8?B?aFVMa2RnT1IrWm9qTVN1akFSa2pneXQ0Q2luOUlUaGg1NWUweDR1dzRpR2U2?=
 =?utf-8?B?V2czd0lkZzVsWlpjSytYNlA5cXFDOWZJcERvUnVHRDY5Y0t1L2oyNHpIU2Zs?=
 =?utf-8?B?d0RZMGN6MUh5amxqZTRzWlhZMTdmV2hybkdVVjZlbjlYd251cHd2VmEyQmYv?=
 =?utf-8?B?QWJkQkw3UHFiR0dtTXhpbUtSVGQ4eUZ4MWIxeUhRTWw2T2l5QU9aWWhTNVRM?=
 =?utf-8?B?d3BjTGdGRWxCM0RXK3JFYVAzYzNkaDd0VkdSZ2ZJR0RIMGI0NCtTUmI1dVpj?=
 =?utf-8?B?djl4VVVhNVN4OUNRaUR5cnMyUUNGR3RUNzFCUFNsb1RHb0lRK1pqTkpxZXcv?=
 =?utf-8?B?S050UElTMVJTNDd0ZGZRK1pJZzNMOE9BbkkwKzg5VUFsQXJtOFVYb1A0WlNt?=
 =?utf-8?B?T2hlaGl1c05RV0Myb0NkTnhPSUY0RWwzQTgwc3VjMXFaS252YW5iVXBUSk9W?=
 =?utf-8?B?L1BiLzVRWVI1RGNGNFRxdmZZa0hOQStyMDRXcXREMlBHRzJtdkk1aDl5bDNx?=
 =?utf-8?B?ditJTkhxMzBYK2lYa1FiTE9RZFkrbE83OHNvSW44YzNvK1VvTmRjMHRyaFBa?=
 =?utf-8?B?VUhPdFZ3c2JGSTIrNURiYVVjM3p5WWhiVFJuWmVVSXQ3TGw3NUJqVmNoTHdU?=
 =?utf-8?B?dmRwVjhOemlGc0Fmc2RnUzdJYTJ1ZmhWQ3NtbWFBS3VaaHVxSDNuNXRHRmFo?=
 =?utf-8?B?TGdsbkNDZ3paMk5VVFRwMFQ3c1FvODdJeXVjTVBmTmN2ckt0bTFBOEtTazZ1?=
 =?utf-8?B?NnpVeTZHckZVQTZWeEZHQlpWQUo5MHhkUXlqWDRxdlNTUWptN1p0aHFIZUd2?=
 =?utf-8?B?bXhrMStqVjBIL3ZwZFVCMWFVWTlZNDNTUnNDVkZOSGFZRlRFSTFWdTNvTHNJ?=
 =?utf-8?B?cjdxd0NRbHN2T3p3Nnl3SjVyeUQ0L1hsamIyUlpHell1dXo2K3IwVng4K2ln?=
 =?utf-8?B?VjU2Ky9CdlJQRGtjYmNGVitLMVllekdNcVdPM2lCQWVHUU5STDNMQzZYc2VY?=
 =?utf-8?B?dFZiQld1VnZZdlZ3ZDNUcFdNNlI4THRtOW1yS2lic1BuY093OEJRaStNVWx6?=
 =?utf-8?B?dGhOYzlOYTNqL2tBTzFiQTR1VnhlYXBsWXZ4cEtjdENicjA2TjBJcCt1TmNN?=
 =?utf-8?B?ZU9hKy9VWFBINGtMN3hWQ1IvWE05Y09tdEJnUlpoeVBHenQ5c2FTcXc3ZVJp?=
 =?utf-8?B?NFJyb3IyQVdjVnl0TmZ4L21CTE9lMW9NVlZvMHFyMEcvUlJmMHhQVWVDb21u?=
 =?utf-8?B?Vnh2WllKNTRTbzE1Qy96Y2dyQUxzd2liMFUxblpHSXRZdUxyVTViaU4zdEI2?=
 =?utf-8?B?aGdTU05RQUNGdzBjcktNUTN0ei9GbUV3cE4yYTBSQmRCYnNTTFpURy9rY1Az?=
 =?utf-8?B?V0NrR2V2SXl6ZnYvaDk3RzFIZ09jNW81bzJLbmk0QnNRSUZ0TVNmNXExalQv?=
 =?utf-8?B?b3FYemUzRyswQjg5RllYQ2dIbndhb2luUXovRkZJdXRQbUMyeFVIdC9JdkZQ?=
 =?utf-8?B?WlYwR1BjZWR1MkxHc3dtVHU5ZHFvMDhGNXlIKzVrcVowTmwzUU9vano2Mmxt?=
 =?utf-8?Q?kzCBQDJVKy6E814Uvii2meadhbA2geMPE2j5Nhd?=
x-ms-exchange-transport-forked: True
arc-seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BaVM4KJQZEi/IwPsPDSFYBJfhH0NV6H9he10lzN2aE1DMukClaten3zUzxj7zLn/FdMGv2aM2IJKm88jgXAOPRDfeuypEGvwJ4iI8g+MfRqIh8G3tkHe5gQcQWIzo6a62liHSG38RAwMsCdYaAiwIhVqBcVNusePA5nWRApOl8Vj/22/DdUMD5h/t9aBGDaQRAz6lFoL1GLblwHh2ygrC5V/Gx0+1JPAL1wtwtez5Vwshh+XJ8yBWImEhtfT663tb7t5G76Y0bsYoSGPa0YOIuj11tmlUL0UwSiaAgJ7Xqx7rRqU8SYM8uhv903uMwk6E4pYGMBsCcBj/v7m5Xm0tA==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QoT9FlUjwP1kSxkwl5RFKl0VsW2EVQwMIu4HtbuEEc8=;
 b=jS8z9eG72HCtohjHNUPwHf7Qk/9aMqMUyBuG+AKAPmOfOfJhm20weMMVxEpP5f3L2cvQgmH+O1o963w39MvgNbnpaPZhsF0wbceTQ9qzbgyYEoKJViggarDWGQlkE++6BQERGDMXNLbho2M5daVFg4kaxYQ1Qa+dClP+kFLaiOTg8OY1/9zYB5rPDOj9KRF5QHcro7QFTs9MuWpXIoq+WCT+KNfgqNwnuLuRBQksNIJsamT0cLsFTgH/gACTdX0KSquRlumd2YtaAeaX4Doz1Vc89EJR8odp5JVrXy2LbEnz3B0BmuB7qu4AAF1rRPx1LpewfZVVz8gcxCXhBC+t9A==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BYAPR02MB4886.namprd02.prod.outlook.com
x-ms-exchange-crosstenant-network-message-id: 1b152704-b964-454b-688f-08d8de988f58
x-ms-exchange-crosstenant-originalarrivaltime: 03 Mar 2021 23:03:29.1627 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
x-ms-exchange-crosstenant-mailboxtype: HOSTED
x-ms-exchange-crosstenant-userprincipalname: MtHaaU/8PiFu73pT3rYiPmGwyjhhBkTujv+kSxIp6fbQadPFMcD1/jtNZWUpm+OZzSAOTQHEU/viowwVdURWhA==
x-ms-exchange-transport-crosstenantheadersstamped: BY5PR02MB6472
x-originatororg: quicinc.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Received-SPF: pass client-ip=199.106.114.38; envelope-from=tsimpson@quicinc.com;
 helo=alexa-out-sd-01.qualcomm.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Mar 2021 23:03:46 -0000

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGhpbGlwcGUgTWF0aGll
dS1EYXVkw6kgPHBoaWxpcHBlLm1hdGhpZXUuZGF1ZGVAZ21haWwuY29tPiBPbg0KPiBCZWhhbGYg
T2YgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kNCj4gU2VudDogVHVlc2RheSwgTWFyY2ggMiwgMjAy
MSA0OjI4IEFNDQo+IFRvOiBxZW11LWRldmVsQG5vbmdudS5vcmcNCj4gQ2M6IFlvc2hpbm9yaSBT
YXRvIDx5c2F0b0B1c2Vycy5zb3VyY2Vmb3JnZS5qcD47IENocmlzIFd1bGZmDQo+IDxjcnd1bGZm
QGdtYWlsLmNvbT47IHFlbXUtcHBjQG5vbmdudS5vcmc7IE1hcmNlbCBBcGZlbGJhdW0NCj4gPG1h
cmNlbC5hcGZlbGJhdW1AZ21haWwuY29tPjsgR3JlZyBLdXJ6IDxncm91Z0BrYW9kLm9yZz47IHFl
bXUtDQo+IHJpc2N2QG5vbmdudS5vcmc7IFJpY2hhcmQgSGVuZGVyc29uIDxyaWNoYXJkLmhlbmRl
cnNvbkBsaW5hcm8ub3JnPjsNCj4gUGV0ZXIgTWF5ZGVsbCA8cGV0ZXIubWF5ZGVsbEBsaW5hcm8u
b3JnPjsgTWljaGFlbCBXYWxsZQ0KPiA8bWljaGFlbEB3YWxsZS5jYz47IFBhbG1lciBEYWJiZWx0
IDxwYWxtZXJAZGFiYmVsdC5jb20+OyBTYXJhaCBIYXJyaXMNCj4gPFMuRS5IYXJyaXNAa2VudC5h
Yy51az47IEFudGhvbnkgR3JlZW4gPGdyZWVuQG1veGllbG9naWMuY29tPjsNCj4gRWR1YXJkbyBI
YWJrb3N0IDxlaGFia29zdEByZWRoYXQuY29tPjsgQmFzdGlhbiBLb3BwZWxtYW5uDQo+IDxrYmFz
dGlhbkBtYWlsLnVuaS1wYWRlcmJvcm4uZGU+OyBMYXVyZW50IFZpdmllciA8bGF1cmVudEB2aXZp
ZXIuZXU+Ow0KPiBFZGdhciBFLiBJZ2xlc2lhcyA8ZWRnYXIuaWdsZXNpYXNAZ21haWwuY29tPjsg
Q2xhdWRpbyBGb250YW5hDQo+IDxjZm9udGFuYUBzdXNlLmRlPjsgQXJ0eW9tIFRhcmFzZW5rbyA8
YXRhcjRxZW11QGdtYWlsLmNvbT47IHFlbXUtDQo+IHMzOTB4QG5vbmdudS5vcmc7IFRob21hcyBI
dXRoIDx0aHV0aEByZWRoYXQuY29tPjsgUGFvbG8gQm9uemluaQ0KPiA8cGJvbnppbmlAcmVkaGF0
LmNvbT47IENvcm5lbGlhIEh1Y2sgPGNvaHVja0ByZWRoYXQuY29tPjsgVGF5bG9yDQo+IFNpbXBz
b24gPHRzaW1wc29uQHF1aWNpbmMuY29tPjsgQWxpc3RhaXIgRnJhbmNpcw0KPiA8QWxpc3RhaXIu
RnJhbmNpc0B3ZGMuY29tPjsgTWljaGFlbCBSb2xuaWsgPG1yb2xuaWtAZ21haWwuY29tPjsgRGF2
aWQNCj4gSGlsZGVuYnJhbmQgPGRhdmlkQHJlZGhhdC5jb20+OyBBbGVrc2FuZGFyIFJpa2Fsbw0K
PiA8YWxla3NhbmRhci5yaWthbG9Ac3lybWlhLmNvbT47IFN0YWZmb3JkIEhvcm5lIDxzaG9ybmVA
Z21haWwuY29tPjsNCj4gSmlheHVuIFlhbmcgPGppYXh1bi55YW5nQGZseWdvYXQuY29tPjsgTWFy
ZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+Ow0KPiBNYXJrIENhdmUtQXlsYW5kIDxtYXJrLmNhdmUt
YXlsYW5kQGlsYW5kZS5jby51az47IFBoaWxpcHBlIE1hdGhpZXUtDQo+IERhdWTDqSA8ZjRidWdA
YW1zYXQub3JnPjsgcWVtdS1hcm1Abm9uZ251Lm9yZzsgRGF2aWQgR2lic29uDQo+IDxkYXZpZEBn
aWJzb24uZHJvcGJlYXIuaWQuYXU+OyBTYWdhciBLYXJhbmRpa2FyDQo+IDxzYWdhcmtAZWVjcy5i
ZXJrZWxleS5lZHU+OyBHdWFuIFh1ZXRhbyA8Z3h0QG1wcmMucGt1LmVkdS5jbj47IE1heA0KPiBG
aWxpcHBvdiA8amNtdmJrYmNAZ21haWwuY29tPjsgQXVyZWxpZW4gSmFybm8gPGF1cmVsaWVuQGF1
cmVsMzIubmV0Pg0KPiBTdWJqZWN0OiBbUkZDIFBBVENIIDYvN10gY3B1OiBNb3ZlIENQVUNsYXNz
OjpoYXNfd29yaygpIHRvIFRDR0NQVU9wcw0KPg0KPiBkaWZmIC0tZ2l0IGEvdGFyZ2V0L2hleGFn
b24vY3B1LmMgYi90YXJnZXQvaGV4YWdvbi9jcHUuYw0KPiBpbmRleCBiMGIzMDQwZGQxMy4uZDU5
N2ZlMTJjZGYgMTAwNjQ0DQo+IC0tLSBhL3RhcmdldC9oZXhhZ29uL2NwdS5jDQo+ICsrKyBiL3Rh
cmdldC9oZXhhZ29uL2NwdS5jDQo+IEBAIC0yNjgsNiArMjY4LDcgQEAgc3RhdGljIGJvb2wgaGV4
YWdvbl90bGJfZmlsbChDUFVTdGF0ZSAqY3MsIHZhZGRyDQo+IGFkZHJlc3MsIGludCBzaXplLA0K
Pg0KPiAgc3RhdGljIHN0cnVjdCBUQ0dDUFVPcHMgaGV4YWdvbl90Y2dfb3BzID0gew0KPiAgICAg
IC5pbml0aWFsaXplID0gaGV4YWdvbl90cmFuc2xhdGVfaW5pdCwNCj4gKyAgICAuaGFzX3dvcmsg
PSBoZXhhZ29uX2NwdV9oYXNfd29yaywNCj4gICAgICAuc3luY2hyb25pemVfZnJvbV90YiA9IGhl
eGFnb25fY3B1X3N5bmNocm9uaXplX2Zyb21fdGIsDQo+ICAgICAgLnRsYl9maWxsID0gaGV4YWdv
bl90bGJfZmlsbCwNCj4gIH07DQo+IEBAIC0yODQsNyArMjg1LDYgQEAgc3RhdGljIHZvaWQgaGV4
YWdvbl9jcHVfY2xhc3NfaW5pdChPYmplY3RDbGFzcyAqYywNCj4gdm9pZCAqZGF0YSkNCj4gICAg
ICBkZXZpY2VfY2xhc3Nfc2V0X3BhcmVudF9yZXNldChkYywgaGV4YWdvbl9jcHVfcmVzZXQsICZt
Y2MtDQo+ID5wYXJlbnRfcmVzZXQpOw0KPg0KPiAgICAgIGNjLT5jbGFzc19ieV9uYW1lID0gaGV4
YWdvbl9jcHVfY2xhc3NfYnlfbmFtZTsNCj4gLSAgICBjYy0+aGFzX3dvcmsgPSBoZXhhZ29uX2Nw
dV9oYXNfd29yazsNCj4gICAgICBjYy0+ZHVtcF9zdGF0ZSA9IGhleGFnb25fZHVtcF9zdGF0ZTsN
Cj4gICAgICBjYy0+c2V0X3BjID0gaGV4YWdvbl9jcHVfc2V0X3BjOw0KPiAgICAgIGNjLT5nZGJf
cmVhZF9yZWdpc3RlciA9IGhleGFnb25fZ2RiX3JlYWRfcmVnaXN0ZXI7DQoNClJldmlld2VkLWJ5
OiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2luYy5jb20+DQo=

