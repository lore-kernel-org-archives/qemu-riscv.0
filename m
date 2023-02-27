Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWlTX-0005tm-63
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 16:56:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pWlTV-0005rV-A2; Mon, 27 Feb 2023 16:56:01 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pWlTT-00014j-Lm; Mon, 27 Feb 2023 16:56:01 -0500
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31RKnaA7003284; Mon, 27 Feb 2023 21:55:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=AA9lGHfXp2gPNAIoRpiKJwyIEZgHmu9o82OEFotcJZ4=;
 b=Rt2gacJQFA+2tOk5ZkJD/YHmx65My9J+UREyOD6uTrYcm3mG4RzdTM++QGtvIsBDkC52
 CoC9AK3MRvsWfEt1hkYtA9eYaUq5f++lvGqDp5kDuoEc3lyef9C/Nj20RRuEAJ+Xg8Wp
 gkWKHMSvopuBrG4pHzU7MppDKjIu4dUGEt6hMd/u1aD1TFvbDzyNmOkWRF5PCVIcR/37
 CgwaegiVjvy6NWnAOX0NpQh8Vmz/4wAA1nQYA7pPs2aZNgh8IVDSS1E7nNLRmfSxXGUl
 EAHjiexPQEgXzHCbXp64CdMKNz84ZruMDQXOk4OiZdlaNndjAWZG6ftQw8pCHslvLu9X jQ== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2173.outbound.protection.outlook.com [104.47.55.173])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ny81qefe0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Feb 2023 21:55:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L2dvDBwWHNxOhlduAyNZ3nE5cBhGtCQt+/uGZ0NmQRabUIwZct40xejuhMcsNMENwSv33REnxuw4Rug0LU+jBR6L4OMqdjfY8xQbTyl9xNLq5v/XviMpqfxCIvbGtZPjMcIRcyYkkKi7aGptUE6qNgOLm5FqqYQmr3+EvA5Zwsk8EgwGISDwet7G0hhWFZUGCYMvSONPALUm0w0khdKtC2dX/e7nhy/BTsv/fdOi81Btkf2Ti2fh8acJOLchgCFgtUUNyRlZxQWtvagox1Jc8mMmboG4N0oKS5EaRKcjAe4G6jyuWvJIqWnV8DOZsTDSR8dkhjq48WLviNdLUERSoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AA9lGHfXp2gPNAIoRpiKJwyIEZgHmu9o82OEFotcJZ4=;
 b=P/FoxMAaZk3fqnJTImv6VKChYKmjwdPKyOZX93Z8HhopLECkSORXOVPXwENu8GSKZrw11uAqSC3NjsR092buReGwywNaEFJJsRCHWhsqb5F66QbaBeEsX1X008vl+G+pnz2b7qBYvF1ZkRqLgVX1OAbXOO3Ceu6Dbp5BGC+gZ+jQFdfDARzeYWzDLLP+box2xDc4j+37MGjidu950ZIPVT0wIgZeQYUtwsUtl5oGcvHueEcXyobHxofidi5I6avwnTzZZE1fQ5pKXVl7elw00uef7OCK+oSOwi66P/6oiTiosxFuplxIuW+gJzNRk50PB9PVB98UzdgTbNuht0wo+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by BY5PR02MB6948.namprd02.prod.outlook.com
 (2603:10b6:a03:23f::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 21:55:38 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::3e12:c026:afdc:beda]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::3e12:c026:afdc:beda%5]) with mapi id 15.20.6134.027; Mon, 27 Feb 2023
 21:55:38 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-ppc@nongnu.org"
 <qemu-ppc@nongnu.org>, "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 "qemu-s390x@nongnu.org" <qemu-s390x@nongnu.org>, "jcmvbkbc@gmail.com"
 <jcmvbkbc@gmail.com>, "kbastian@mail.uni-paderborn.de"
 <kbastian@mail.uni-paderborn.de>, "ysato@users.sourceforge.jp"
 <ysato@users.sourceforge.jp>, "gaosong@loongson.cn" <gaosong@loongson.cn>,
 "jiaxun.yang@flygoat.com" <jiaxun.yang@flygoat.com>, "ale@rev.ng"
 <ale@rev.ng>, "mrolnik@gmail.com" <mrolnik@gmail.com>,
 "edgar.iglesias@gmail.com" <edgar.iglesias@gmail.com>
Subject: RE: [PATCH 15/70] target/hexagon: Use tcg_constant_* for
 gen_constant_from_imm
Thread-Topic: [PATCH 15/70] target/hexagon: Use tcg_constant_* for
 gen_constant_from_imm
Thread-Index: AQHZSm5s6JNtH9RKTkiznkaVXqrqe67jMIgw
Date: Mon, 27 Feb 2023 21:55:38 +0000
Message-ID: <SN4PR0201MB880813094A5F17F64315E002DEAF9@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-16-richard.henderson@linaro.org>
In-Reply-To: <20230227054233.390271-16-richard.henderson@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|BY5PR02MB6948:EE_
x-ms-office365-filtering-correlation-id: 6c273409-eac5-4e5e-5b91-08db190d5d07
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /1lyeHWnkkwSRveOtB2m95r/6AdbXAl8E2UBa/I4U90jUYpSQZx9tEPZHKesRA9F8gC+Y4Vna91eJTh27JDXw/NP5WAGpnWv08MkMX4lZDQ9laxzO7GaEnbyoh2FwMn8bv/c41IRsSHldycdm0HoKN3413ub0yiRGnlehNfgikD7F+0E/YTKV9YsRqbqFtigjrcaDTDFnedHoicWXGmj1014q5nBvNr56rhfvojzZK7T1zoiytvH5R4AejDRkK2/30j9TJkJnFvUlbNsTMba8oJb/+tizby1IAwmEdvzdN07mMaKqknaAMpZ9/ZZtieSwF8LH8jTRcmoQ2+HWhvZJv2/Mtmc7Cw5b1MgwROQZjCfUaj2BqUFOlcE4mTpOKlMS3N3FbmWQqtNEeQISB3DBxxP3frzH6SfDc2dhvj6XMqphn34v+ZiRj4Tja+8i1EY0z7uPS5molxQEvCkxc/hRQaK9kIOmFjvwLwdpe5NBabvQnB7kqxkwY/vgYhOly29tlOWkkyFuYdfK5k39n+eXSijfVYTFpXB4QC+f71v1vi43Styms0Qae4Y8NVRGPFzftBGrkDJyCe7XulxUPV49xcg+AbtA8W8oAhFjdK12O3r+Et92uAZSu1UC/tN8/f78ndUatDFIV4QDebm5OT+6rdaecjrU/Ao4rnFpHqIBrpbcVhy6F5PSMtvA2n5QDvYZsdKQU3SXykHP6zxztnrFg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(396003)(376002)(346002)(136003)(366004)(451199018)(83380400001)(54906003)(110136005)(316002)(33656002)(4326008)(122000001)(64756008)(66476007)(8676002)(66446008)(38100700002)(53546011)(6506007)(478600001)(186003)(26005)(9686003)(7696005)(71200400001)(7416002)(5660300002)(55016003)(66556008)(76116006)(66946007)(4744005)(52536014)(8936002)(38070700005)(86362001)(2906002)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9WOjyX3RU+bcoO2Iu2sMP1F7aXYApoYLSOrWpRItncRY2oaXa/L5s5vqLOjV?=
 =?us-ascii?Q?JtbCskLjD3S/p5QF/i1wBfsY8rB1z4vnzZakch4cauP6KK8ViGUpZ/VshNfB?=
 =?us-ascii?Q?RvwGPuyRfatriya1joB0ipX71fzEELBpl8rzeXg7dbl7lhhPe2obxcx2IsGX?=
 =?us-ascii?Q?RG2ui6POUaYOVEQfK32X39P0tqFAuaxNBGQcvPzToml6Hu95Zk+nRQ6AK61M?=
 =?us-ascii?Q?7AeQf1RUMBO50sq6TCDPOPw5hILblsAtF9yXdz6hZ4h7fzqMGunGJ4U1jVnp?=
 =?us-ascii?Q?t+CPLRdGo0Lq+wiidU9WBgc7Wd9iAG4h6pBSs38qv7+vI9uGKjZsb6/CQUYt?=
 =?us-ascii?Q?SBMA3+yyMcMj29L6dSCz7/7iallHrFAgS64VwVOrBQ7bUWbvtng/iZtbIuy+?=
 =?us-ascii?Q?evyqdz2ZNL7yIzWGA2/abSGNszBI7Lpmxt1L7AY0lXj3KeDCY3J3pejBBL8p?=
 =?us-ascii?Q?+D1tKeEvCsoDV6WnHbW6MUFI7pAixwtBFu4+qw5rg1Jd8OU9nuqojKAPAYbz?=
 =?us-ascii?Q?kkeTAIJHL0lhBEJ8xdGd8Q9nlFhnymmSNUSKCJhAvZkcdZHpxm6bm9ul/84C?=
 =?us-ascii?Q?MEFXn6fjogHUy5G1Lu/GCei9cnFS45H6ny722CPdA2DAIwPP6nvNL2B1S6BI?=
 =?us-ascii?Q?mEWxR6w7YJPpFVNldD6igpLxFk42XkOHUwib2kB6M5VVBCdjchEB8Wx1915N?=
 =?us-ascii?Q?0AS4peNAuwYVc1fDpVrr2db2nIOpttV77gMjKa7nD7OyQLofMFCW1t21jQd3?=
 =?us-ascii?Q?HMDVOhU4e85fAdn587FwAIFSO23YdT77l+2RvDm+aRYJHW//Ef3J5XtJk05i?=
 =?us-ascii?Q?BAMr9gd4XwDXschAR4FkOvtxiJz3DTYs4i7VCM08P2BFr3mCcbjLZ+xnI+Dx?=
 =?us-ascii?Q?64HCojdoUyi4qLhM9X6EXAbi/MdTkHKTWaWMaJ4kTiuJNmiqtqpurohldC31?=
 =?us-ascii?Q?JW3WLOyDN2S1f5+0bSmTfET/RGr/ThupYHCbO2T+yI0fjwCzQHuRR+mXDvfZ?=
 =?us-ascii?Q?Yg6f6tfO0O8mh1cUQtjp77FpLUlzsq6e1c0tv6cFKzK0fakXACs3TeVBP2FN?=
 =?us-ascii?Q?JnTMbei9H7f/y9n0bTU6+EPAn/o54ouujWBCPJM5rKFE6/JrK4sL0YjsdBqD?=
 =?us-ascii?Q?Qj2fFscv0jT3B3F7shj7invW+bBYs6mwq3kpKXq71+8OsolumZcPU8Hsviji?=
 =?us-ascii?Q?df0vN6/3d0smfqEb5kmfqajhVeovYQo4uOXhmHOvdMpY4OO1RIUXo3tPfIw3?=
 =?us-ascii?Q?9v7/8O/g9DbM20xAl1Fif8Sz4KYjuItlxNAeDGQPq1QQAfiy8VKXMYjlV0Qy?=
 =?us-ascii?Q?DhHvAqvGy38b/8rXf8vppbdnVR+2TuSHX09Duodc/yjTsZS4P0tfTIsTIQAh?=
 =?us-ascii?Q?aJBf4UgRyf2eG/vY2o3qIUmqFowOChQKUl/6eTIxV+EEunQibv0WixwGiXKW?=
 =?us-ascii?Q?sNsj80Xr/1vDixD72vxxS5YCj/VQUolff/oSjKfq5qgfwRAjozIMDFFVoJ0s?=
 =?us-ascii?Q?cvGK0qBoUZ9513EkRORKcxNGJYwE3I38jxIk3d+MuxLB3lFYD4SIb2MZcrz5?=
 =?us-ascii?Q?T2xg/MLW0JuJt+n0JyKPc5C2Z7Hs+mmtaQO6uR7L?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?us-ascii?Q?Hm0KTZby6IVJlDN7Q+4dAmPN+w6NeMWpaLsR4cFQJ2FGg11vHyCDjS4AWjzj?=
 =?us-ascii?Q?MXbuzbUPWnj0rGgizLGToPlVf5lpq/kCbusC+3wt9Nhv4wa4QyAYjn+TnIE8?=
 =?us-ascii?Q?xtwv7MEmKY6hW1PBjuo4Sflyskfvrz8cmMVgOL+VvwxXvN/KKxTAO0M5+Dlr?=
 =?us-ascii?Q?Opx7MX/vh5IpMf5cWZaQkgMWxFzqLY5E5oNKBEr4ospzulEMsNusPdy5nc6h?=
 =?us-ascii?Q?vZkSXmxc9avCrd/4ru77l5AK6Zpl2oAVzq8wWyjXTFLToSpSYct5B31mfPCj?=
 =?us-ascii?Q?FiMmyIkrbvNF0hlD+/Z/A0cvfO4A/ov62SNe1q/KTUJ48vgLC0stxtl+8ial?=
 =?us-ascii?Q?va2G1szThH6IVZRfJ5UY7GJzMxNWALp8z/grpU2PLRJWNImYOCUmdHtvyAFF?=
 =?us-ascii?Q?ENxU9DcgkVL2mQS0Pv266oIFwitXTbqxBUG4gRwkzU8dUoZDXQPpejfFStu/?=
 =?us-ascii?Q?J5CaA8EsBfcY9gtknttCjRA7ze7qHgDh2GPCB7hzKpJeLryS3MzwYSkB8bep?=
 =?us-ascii?Q?kfdyiKpBzi0T1ynL8Mnkgf8rdwiVuCvrryUc3RqQs+bhHewkU67xAcsDExNo?=
 =?us-ascii?Q?fTO7KEywC11MNN0nRtZ0XCTqPdNEqyO+ipENg2+DJEp0NCH5s7V2K9NVusyg?=
 =?us-ascii?Q?D06rv4+D5YCh9fKHstvu23ULyhvZ5VUnTgJXP38ZzrLI3MKx407YoNUfmzeP?=
 =?us-ascii?Q?BdRLSZZ3YsR9kLIc5JyEQxLsu7YKK2YHB3r9ZKxZhgc8vJXrrIkXUR5K1L2T?=
 =?us-ascii?Q?KiiPYU9K7ZTtuSJRfRul8b5m/NXcDmT9HQQazLdkYYMqGO6C3Q785SZM+kUF?=
 =?us-ascii?Q?q7F1O4u1yOgkr4XO7er0HLWJS9oGFKr6Ok8RGrUrao0uHIcmvRY6rrk5Rs26?=
 =?us-ascii?Q?WC58yET1aXfnqbnGILiJNOwG7t28AruXG4hRfbqLpP9+lNxXiJdzYXoOw3R9?=
 =?us-ascii?Q?Y+Kvhj8+B6U5m3QDJcbzYcqTzPEELlFOxpoVM2EmM7RpkZeN5+WlUsy+KN6I?=
 =?us-ascii?Q?mUo0ileTDQDdzrgIADppV4Sz/A=3D=3D?=
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c273409-eac5-4e5e-5b91-08db190d5d07
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2023 21:55:38.8933 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WzkKwvTJPjtWtmocFY4q4qhaXx+4YDq4GzD9KZYSQR3CFUL58glwm7tWsQQcGjwwNTe2ir9JZ4NGUcwvCfCujA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6948
X-Proofpoint-ORIG-GUID: 1eDntFxkiUyTaXWxmNZ9BPQ_YqQFCETn
X-Proofpoint-GUID: 1eDntFxkiUyTaXWxmNZ9BPQ_YqQFCETn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-27_17,2023-02-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0
 malwarescore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=352 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302270175
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
X-List-Received-Date: Mon, 27 Feb 2023 21:56:01 -0000


> -----Original Message-----
> From: Richard Henderson <richard.henderson@linaro.org>
> Sent: Sunday, February 26, 2023 10:42 PM
> To: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org; qemu-ppc@nongnu.org; qemu-
> riscv@nongnu.org; qemu-s390x@nongnu.org; jcmvbkbc@gmail.com;
> kbastian@mail.uni-paderborn.de; ysato@users.sourceforge.jp;
> gaosong@loongson.cn; jiaxun.yang@flygoat.com; Taylor Simpson
> <tsimpson@quicinc.com>; ale@rev.ng; mrolnik@gmail.com;
> edgar.iglesias@gmail.com
> Subject: [PATCH 15/70] target/hexagon: Use tcg_constant_* for
> gen_constant_from_imm
>=20
> Rename from gen_tmp_value_from_imm to match gen_constant vs
> gen_tmp.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/hexagon/idef-parser/parser-helpers.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)

Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>


