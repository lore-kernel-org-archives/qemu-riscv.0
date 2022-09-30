Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oeO0r-0007R3-Sp
	for mharc-qemu-riscv@gnu.org; Fri, 30 Sep 2022 17:57:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1oeO0p-0007Py-KE; Fri, 30 Sep 2022 17:57:39 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131]:21438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1oeO0m-0001dX-JW; Fri, 30 Sep 2022 17:57:38 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28ULsZwG004797;
 Fri, 30 Sep 2022 21:56:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=Orav7RyeJUIEzVoKqPXBFZwoZW/MFkFZqKJ61HTgkdc=;
 b=BOh1Albt7IIJ+iplLJX3e8Nku+45GHmSgvp0C0m/gCalMPzm7JtXip7QOERwIfqg69D6
 K2NbdwGkpxIAcPZH2RkaeE1P41/u2jZQ35ik1cl+KplZcNUMGWZFOIr9/2iXsWzK+Ab+
 9pEj0p4pr+vGr+qj7RpKnb6tzfHjDIb7Gp534gLDDUgnlHVe+WO9blGIbGoRmDVVg9bO
 rUFio+Go9djxdTObF3EhU5nhxksD+GSR3kyUiVeInY+MfsShlVyKbNkT05d5GGgmRw4A
 /XAM1F9WmgOz329rP0UzrtPcOEogCbq2gqvnEe+5nrP3Baz1ctg1jGXx2cdU0PdT6Wt7 nA== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jx6by8dpc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Sep 2022 21:56:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AlHl4OcD00yQ93BxrR/+Un3cWLsfziaDQryZiS8rMUyPRP1zMTYZ1zou/E2Sf+fyWblsbFZ6D6JYoSb8VcHJQrLM68Jn3JhTkaNGiSlydIM0EMCXgrFL+dBjIfdtidvqK3ih3xRLH5k5ehwpeTfg/zStH6jcW0n8TQPlh1kx8LdZxh7+3uPqK2LntzAi2KRumDNZu1iMBK1mZavjzTEtq68zkMt6Rwm/OwpKCuyneIu02z5Qx1z8hc0zqMwaFsjNqaYbJLipH/guvnDz64zvngj3aYvhlifvI4i0cadfVARtiAKA3Mzr4cr2ZBLNZw3Hq1w231Lkja6jHc76/dMDxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Orav7RyeJUIEzVoKqPXBFZwoZW/MFkFZqKJ61HTgkdc=;
 b=ImOB+5fhvRvq+t8lw/5MaTYUqTMf3Gx4v9/iOveERNzKSitLmIXEA1IsMvvXbSF8aaP7FeOswtuKKpwdL45HocbHAjo/fHsd1RfbaaIcplgO1JkAHG3TwD5IqRxmn1nYZp6ff1hBjLJXE4W1WPwsX5Nqa+qZolO7IpkvSNzVf3k35xJ3jE8ELRfRluBmeAPdk2rPMZNI0IPWen7XnkXjIGBrS4RFpdOL40aEiqOxFGd+qUflPpBjzyh03OF1n7sUg5IS8zk4/gCutrDPsR1rAR8JRu0n5jH8sagxx4wHdYfYx6ZqzTEnDzUGvMWfo6wNZjosq5yzX4vpskllgMyc7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by PH0PR02MB8565.namprd02.prod.outlook.com
 (2603:10b6:510:100::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 30 Sep
 2022 21:56:56 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::48c8:3e4b:46c1:ca87]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::48c8:3e4b:46c1:ca87%5]) with mapi id 15.20.5676.023; Fri, 30 Sep 2022
 21:56:56 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "peter.maydell@linux.org" <peter.maydell@linux.org>,
 "alex.bennee@linux.org" <alex.bennee@linux.org>, Eduardo Habkost
 <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>, Yanan Wang
 <wangyanan55@huawei.com>, Michael Rolnik <mrolnik@gmail.com>, "Edgar E.
 Iglesias" <edgar.iglesias@gmail.com>, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Laurent Vivier <laurent@vivier.eu>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>, Yoshinori Sato
 <ysato@users.sourceforge.jp>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>, Max Filippov <jcmvbkbc@gmail.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-ppc@nongnu.org"
 <qemu-ppc@nongnu.org>, "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 "qemu-s390x@nongnu.org" <qemu-s390x@nongnu.org>
Subject: RE: [PATCH v6 16/18] hw/core: Add CPUClass.get_pc
Thread-Topic: [PATCH v6 16/18] hw/core: Add CPUClass.get_pc
Thread-Index: AQHY1RNozORddest9UW0LZCrbLTvh634hBTA
Date: Fri, 30 Sep 2022 21:56:55 +0000
Message-ID: <SN4PR0201MB88087BDEDDD8C27B33284121DE569@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20220930212622.108363-1-richard.henderson@linaro.org>
 <20220930212622.108363-17-richard.henderson@linaro.org>
In-Reply-To: <20220930212622.108363-17-richard.henderson@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|PH0PR02MB8565:EE_
x-ms-office365-filtering-correlation-id: d7d36438-8635-43aa-ae04-08daa32eb15e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SUPVjtsWhbbIMxILWSU3rIaxEQJycbv1qPtPqY/OJmCSIYv3WwpqbyOkLCh7rJYeHEYhEClHsDRHsCd1knwxnbkJivBbJAb3X93MQJKk767+wDoU+kCmCEVuQ+KaA9mjhg0E5ss7GvaKJNpYrKu1Q2c4cKUB1XbyzOgGHlLzngw3V26loVJQPmpxQL0EIZcOxE6hB99GU8VgtGkKUZiaPsIJOpVb2nrLcg1hnk4s8kwlty1s3Zm++YDX3tElQZ0hxiiIzb0aSWd7SviMnoy5B7cEGITcFugqq4GMgBec77BcF/+IZMGcdd8uuWhd8ng7p6qowYeAyAvfM8rd5PW6zGE2aBiUglxX6QIrKqlyV4os6i7vKNPcTgNOkQrOTEyZmdhWCGYehh/fOhoBRTy07amm0ynXsM835EZWOIJx5P/1I596LMmFbLuvtWhhdVmsgAF8rZOX0zZD7w5dtpuJfql0xRWjjwC4Btrl7u5GSwZJ8Rv7FIYqrOMS57zRUpJGMJk9Hn0w6wFdmNwKZVZ6PA3HXXRAEWkkYq5qUp3PI8qLgmZRblyifcZYfxsHfYMiFlxkkQuoQArpBYbPfG5ujYiTOnikK9ABRMZcAekkw3VIe8i0xSGOMoiFwEoxZjQzOE8+AWir54IbO6z5wTgeTv4PQVGKBGRoXosyGtvUqHbwyt/uDoH11Ce9XKfmRhQtagTNFTMEomWWpm1VL5jzfWMLUB5kHJrxeomK0inrChweEgZMB31Dq4oC58jyTGQCY2C2D0d3weOcylY5jf4NiQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(376002)(39860400002)(346002)(366004)(451199015)(83380400001)(478600001)(71200400001)(110136005)(53546011)(7696005)(6506007)(26005)(41300700001)(5660300002)(33656002)(52536014)(66476007)(66446008)(9686003)(66556008)(64756008)(66946007)(76116006)(4326008)(8936002)(7416002)(54906003)(316002)(8676002)(86362001)(186003)(2906002)(55016003)(38070700005)(38100700002)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aUFQcEFnRjd5cytqVHQrWk9PM1lZVEFmOWpvZG1Kd2d5bHdxRThPNFcyZ29I?=
 =?utf-8?B?amtjaGhQbElGcVNYQnNaWGVpTHp6VjRzOFFobFpENWE4S0xDcWIvQjZ1Mjdy?=
 =?utf-8?B?S0wzVEtDZ3UxeUtiRWpGV3VwNG1mTjY4WC9ZVG50Mnlqbmh5UnpySEQ4c3Fi?=
 =?utf-8?B?bDdkbWR4clEyS1E2OURvajY0V2xQL0Z2UXk4Y3NSYk5JL1JRTitCazJuZnFh?=
 =?utf-8?B?SXIzSVVwbGczQWIyNXpoUTdyVndLdHJYQmx4SU5iSmhRUzB5SEpOWVFKM0Jy?=
 =?utf-8?B?U25ZYnN4Uk42Mmoxb0RmL0xGTDh4SGtIOC92TG81NFJhQVVpeW04Y1JSQUdY?=
 =?utf-8?B?RmorcUVLaTBvNHJ4ajhweGUwUjRaSjdVNGJHSTJDOXE2VUxVMjhSSjB5S0Fi?=
 =?utf-8?B?WTlBM1ZIYVdJTVFFd1JUWGhsY2JDK1NYaGFZTUhFbUE1eWVuNWQ2RGgya09y?=
 =?utf-8?B?M2hseXNXbisxMVNjZklGUlZCU1pLM1lXT2xkMC9ZUUxiQjdsMlZvRlIxTGph?=
 =?utf-8?B?Q3pxU25yKzdsL1VKTjRBaFRMYWs1NWpDTWdCeWgyRW94elJJZG5WTlpNWDh3?=
 =?utf-8?B?djNOaXNqa2VkU1EwdVRSTWhpS0kvUEZXKzNURTBDWGJ2Z0lDQ1AxM0xoTG85?=
 =?utf-8?B?em9jUXBNeWhsTnFQaDJHcVI3UG9aUWhJYmdKNnZ4bkFFaVRhSm9nZ0FneGpL?=
 =?utf-8?B?bm1qNU94dWxlMWpGQWdsei9SUUZZNkJNSVJvaDkzRjIzNzBZejdTY3dmUWJQ?=
 =?utf-8?B?c2tGdVJCemtseVZRQzhra1VjYXVjNzMrSXJoOXBIbnBpNFlwTHZoZys3RTV4?=
 =?utf-8?B?YW5JS1NtVXp3OG4yTmxoTm9Cbiszd25oZEJ5TFZVbGNDb2NXbVBybVZFTG5W?=
 =?utf-8?B?VXRPNW1uT3haSk5CUlJWNGZFcmlXVVZjc1R6ZE9VZStIZEtwY1E1QkJ6Mnll?=
 =?utf-8?B?eVBIbkpFS2YvQmFObFVOczFtS29rQmNxRmtOOEhORGFvOWViN2QwNXJPbVZj?=
 =?utf-8?B?UzliOVB2Vmp1OGtlZ2JDS0ZOQUFyU1F1UmI0OWFGNEZCOU9iRWMyKzFXR2Ey?=
 =?utf-8?B?dW15cG5xblB1Y1VWN2JCNGJzalRyWFNDZGZUZWhoVXVTMnNtdkcwWUhDK1BJ?=
 =?utf-8?B?bCtSSGhZdnFmZnF1cVdUS3NSRkxFMWgvRk1uL1B1YVpuTTZyaExyWnhqakN2?=
 =?utf-8?B?aU5lVFByK2RudTJ2QjNmWkJGSHJLY3RUYWpOaDNSV2hvUGkyK0dLZUhiQVZ1?=
 =?utf-8?B?SUZhdEJ3ZTBvdGdjN3l5S3J3NW9ieUthbGJxN3phUnVLVjY4Q0x1RTRlcXpU?=
 =?utf-8?B?bDd5bldPRVBUSUUvMG9BaXpTMmFuU2xiSEI3VjNtVkMrZkM3YnBOeUJuZmgr?=
 =?utf-8?B?WmxHWTNOWjJoMFl2TW9PbmJXRElCSThxSTR4d2dCSzB5QXJrcGVaaExhc3ZY?=
 =?utf-8?B?S1pEWDgyS3JScllQc3FtR3VRbmZ2UEhyVnYwZFZIek4yYzkrNUt0cXpqTi8v?=
 =?utf-8?B?M05XSzBHTFpzWitsVFVmZkY3OE1rRFZlOHdWK2tWZUJGUTlSYWhPbzRtNVFw?=
 =?utf-8?B?TUhQRGpXT1YyMDZoRjJtdXZmN21BWUoxeU5lZms1bGZKRkxnSHdKQjZ2SlhJ?=
 =?utf-8?B?R0puWks1L0xVd0xyYkQvemtDWXlTQkM4enRsNUYzNjRkbnljbW8yVjN6cVNB?=
 =?utf-8?B?VDFHQWgyM3RPWTIwU3NEZXpSY2xUNm5nRmgyVnhRZllQTDIyZHZUMUErNi8x?=
 =?utf-8?B?M1FadmpNK29adXdCdy9mc0ZrMmZYSlR6UTdZa1hLNUxhNmhvalFYbVphWjlR?=
 =?utf-8?B?VUNUbXROKzAwUlVsQVg4bnAveG1BN1RSNTA1NWJ2dXkwOU5qWm1OQW1RdUJ0?=
 =?utf-8?B?UzNrWFBRNFgxdEFCNGUrREwrbDBHd0toYS8zbVFEbnI2Wkh0RnZuVXJZZU94?=
 =?utf-8?B?c1JiT0JlYzZpSCtZTktqQzBZUHJQcU5lV1MyUkEyTDkvRVFEU2EwOGkrRW9S?=
 =?utf-8?B?QzU2RkdtZzZzY1lCK2gxeUVKOEdQR2kydUhKc3JWSjdzT2czMWE2QTgyTlJR?=
 =?utf-8?B?V2MwSXgzQ1VnYkVrSmMreUhGOTB5QWhpclpOamlzQXZOelozU1MybjNDblMv?=
 =?utf-8?Q?TLdIzc/qSVmcUUOJubQM8qa00?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7d36438-8635-43aa-ae04-08daa32eb15e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2022 21:56:56.5316 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aKV33fwKVUMq3wHPgDg+76u7ajaYrp48K/pn+L9uKVYTYZ3zyIVRNBizFuBd530/shPrUF1aUf8Sduo7aX2pnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB8565
X-Proofpoint-GUID: wzGveNo6adUopSS01yYgbH_cmfYkVOKw
X-Proofpoint-ORIG-GUID: wzGveNo6adUopSS01yYgbH_cmfYkVOKw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-30_04,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=873 bulkscore=0
 spamscore=0 phishscore=0 mlxscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1011
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209300136
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=tsimpson@quicinc.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 30 Sep 2022 21:57:40 -0000

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBIZW5kZXJz
b24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+IFNlbnQ6IEZyaWRheSwgU2VwdGVt
YmVyIDMwLCAyMDIyIDQ6MjYgUE0NCj4gVG86IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZw0KPiBDYzog
cGV0ZXIubWF5ZGVsbEBsaW51eC5vcmc7IGFsZXguYmVubmVlQGxpbnV4Lm9yZzsgRWR1YXJkbyBI
YWJrb3N0DQo+IDxlZHVhcmRvQGhhYmtvc3QubmV0PjsgTWFyY2VsIEFwZmVsYmF1bQ0KPiA8bWFy
Y2VsLmFwZmVsYmF1bUBnbWFpbC5jb20+OyBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqQ0KPiA8ZjRi
dWdAYW1zYXQub3JnPjsgWWFuYW4gV2FuZyA8d2FuZ3lhbmFuNTVAaHVhd2VpLmNvbT47IE1pY2hh
ZWwNCj4gUm9sbmlrIDxtcm9sbmlrQGdtYWlsLmNvbT47IEVkZ2FyIEUuIElnbGVzaWFzIDxlZGdh
ci5pZ2xlc2lhc0BnbWFpbC5jb20+Ow0KPiBUYXlsb3IgU2ltcHNvbiA8dHNpbXBzb25AcXVpY2lu
Yy5jb20+OyBTb25nIEdhbw0KPiA8Z2Fvc29uZ0Bsb29uZ3Nvbi5jbj47IFhpYW9qdWFuIFlhbmcg
PHlhbmd4aWFvanVhbkBsb29uZ3Nvbi5jbj47DQo+IExhdXJlbnQgVml2aWVyIDxsYXVyZW50QHZp
dmllci5ldT47IEppYXh1biBZYW5nIDxqaWF4dW4ueWFuZ0BmbHlnb2F0LmNvbT47DQo+IEFsZWtz
YW5kYXIgUmlrYWxvIDxhbGVrc2FuZGFyLnJpa2Fsb0BzeXJtaWEuY29tPjsgQ2hyaXMgV3VsZmYN
Cj4gPGNyd3VsZmZAZ21haWwuY29tPjsgTWFyZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+OyBTdGFm
Zm9yZCBIb3JuZQ0KPiA8c2hvcm5lQGdtYWlsLmNvbT47IFlvc2hpbm9yaSBTYXRvIDx5c2F0b0B1
c2Vycy5zb3VyY2Vmb3JnZS5qcD47IE1hcmsNCj4gQ2F2ZS1BeWxhbmQgPG1hcmsuY2F2ZS1heWxh
bmRAaWxhbmRlLmNvLnVrPjsgQmFzdGlhbiBLb3BwZWxtYW5uDQo+IDxrYmFzdGlhbkBtYWlsLnVu
aS1wYWRlcmJvcm4uZGU+OyBNYXggRmlsaXBwb3YgPGpjbXZia2JjQGdtYWlsLmNvbT47DQo+IHFl
bXUtYXJtQG5vbmdudS5vcmc7IHFlbXUtcHBjQG5vbmdudS5vcmc7IHFlbXUtcmlzY3ZAbm9uZ251
Lm9yZzsNCj4gcWVtdS1zMzkweEBub25nbnUub3JnDQo+IFN1YmplY3Q6IFtQQVRDSCB2NiAxNi8x
OF0gaHcvY29yZTogQWRkIENQVUNsYXNzLmdldF9wYw0KPiANCj4gZGlmZiAtLWdpdCBhL3Rhcmdl
dC9oZXhhZ29uL2NwdS5jDQo+IGIvdGFyZ2V0L2hleGFnb24vY3B1LmMgaW5kZXggZmE5YmQ3MDJk
Ni4uMDRhNDk3ZGI1ZSAxMDA2NDQNCj4gLS0tIGEvdGFyZ2V0L2hleGFnb24vY3B1LmMNCj4gKysr
IGIvdGFyZ2V0L2hleGFnb24vY3B1LmMNCj4gQEAgLTI1MSw2ICsyNTEsMTMgQEAgc3RhdGljIHZv
aWQgaGV4YWdvbl9jcHVfc2V0X3BjKENQVVN0YXRlICpjcywNCj4gdmFkZHIgdmFsdWUpDQo+ICAg
ICAgZW52LT5ncHJbSEVYX1JFR19QQ10gPSB2YWx1ZTsNCj4gIH0NCj4gDQo+ICtzdGF0aWMgdmFk
ZHIgaGV4YWdvbl9jcHVfZ2V0X3BjKENQVVN0YXRlICpjcykgew0KPiArICAgIEhleGFnb25DUFUg
KmNwdSA9IEhFWEFHT05fQ1BVKGNzKTsNCj4gKyAgICBDUFVIZXhhZ29uU3RhdGUgKmVudiA9ICZj
cHUtPmVudjsNCj4gKyAgICByZXR1cm4gZW52LT5ncHJbSEVYX1JFR19QQ107DQo+ICt9DQo+ICsN
Cj4gIHN0YXRpYyB2b2lkIGhleGFnb25fY3B1X3N5bmNocm9uaXplX2Zyb21fdGIoQ1BVU3RhdGUg
KmNzLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25z
dCBUcmFuc2xhdGlvbkJsb2NrICp0YikgIHsgQEAgLTMzNyw2ICszNDQsNyBAQA0KPiBzdGF0aWMg
dm9pZCBoZXhhZ29uX2NwdV9jbGFzc19pbml0KE9iamVjdENsYXNzICpjLCB2b2lkICpkYXRhKQ0K
PiAgICAgIGNjLT5oYXNfd29yayA9IGhleGFnb25fY3B1X2hhc193b3JrOw0KPiAgICAgIGNjLT5k
dW1wX3N0YXRlID0gaGV4YWdvbl9kdW1wX3N0YXRlOw0KPiAgICAgIGNjLT5zZXRfcGMgPSBoZXhh
Z29uX2NwdV9zZXRfcGM7DQo+ICsgICAgY2MtPmdldF9wYyA9IGhleGFnb25fY3B1X2dldF9wYzsN
Cj4gICAgICBjYy0+Z2RiX3JlYWRfcmVnaXN0ZXIgPSBoZXhhZ29uX2dkYl9yZWFkX3JlZ2lzdGVy
Ow0KPiAgICAgIGNjLT5nZGJfd3JpdGVfcmVnaXN0ZXIgPSBoZXhhZ29uX2dkYl93cml0ZV9yZWdp
c3RlcjsNCj4gICAgICBjYy0+Z2RiX251bV9jb3JlX3JlZ3MgPSBUT1RBTF9QRVJfVEhSRUFEX1JF
R1MgKyBOVU1fVlJFR1MgKw0KDQpSZXZpZXdlZC1ieTogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29u
QHF1aWNpbmMuY29tPg0K

