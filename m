Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWlTM-0005l7-7z
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 16:55:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pWlTK-0005kF-KI; Mon, 27 Feb 2023 16:55:50 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pWlTJ-00011E-2V; Mon, 27 Feb 2023 16:55:50 -0500
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31RLFZEQ027675; Mon, 27 Feb 2023 21:55:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=EDv8J3chPtO5xsuFDqBauG3NYxHyTwzz184tKxIc/yI=;
 b=paiTkiCsCGNDHg2at81HmyKseRcmS9Qf1VqpeajIownyiRW7XE7zEXrhDtz6MOFyDc2m
 Si+KYleTwalJ1tykYtRPFVUlKdXYHiVw8kPUxzel4ciz98wsikrJE42o6pALmWzrs675
 VKBWIvSOQdibcXwNJe/nVjXAmBOmAc6sqJH9/9ZnRKR7F/e3yfacjvmzYBwE+3bI5PGs
 AbywdKU+DOXyv5V2dGqbMIQGztG/xx5pRQlv4GXa5shjXP0XSIJd14NssRfFwOq8ukeG
 9/rJkccsT10e+MBcBasQnGUJeCxVVisZggNowTePdOy1g2w5mPfdMv3YHxfxTah9OHn3 vw== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p0u3jskas-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Feb 2023 21:55:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P3tCMo/atTJiXYENPRwRb5GC2bWgEW2XEq1caxJ4Yn5NqvdgJMPpvo+qAnpb+rFiY79SPI9B0IuSVA0ukP2qKr5VVoQS3fSnQ8R35mePqBsNIl64dawUwo7W5ywIY/F6DlwR2pS09PLG94cIOjx8C07snzsckHduNnfnYCeoPVUqONWcILFNxs9ToI4ZwrPaj6UBjItpsPqnLe2zrMSclbFPYAiYTR9p/rmqyWa67ptpamIDoF/iLEuMQ8PYmKgLXuLGqLXy/t6j9r639ZmddXDdYtnev1H6zrnerkT34G1R9OrItQru1QtyL8pFuwxlNgAtEMzhRoDBlXyyMM2/4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EDv8J3chPtO5xsuFDqBauG3NYxHyTwzz184tKxIc/yI=;
 b=n7b7ADCI89H5l7CwcBAnfq3CSCbhI4Z6a+Jr10D18xD3fFCgXAsjXWpy4mtfVROTRQ7T6F8kz8Hf3DtRfXcoTuTDUagB670Kpnp0fXq3Ky/dhHOmuq5pmssE4lZgXwiyYbYC/dquoPOVQ4Z5/bjf/m+xFMgG9ejaygL/jVABqXJwx+Ki248ttgWVZRlGPS3HZv1fVIyY0mgPy2zoFwhSZ3XRrKjPGPLHLwHCx89WyjvzcWGQHoYfDh/37tSVB3pITfCJFd2+jQWPxFWVPufBM1xr/Z3Qo1cKVr4beLw75oEEV6U+7JR3nezXm590ue0EzK9R+l9zb5DAZiZmAIrpAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by BY5PR02MB6948.namprd02.prod.outlook.com
 (2603:10b6:a03:23f::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 21:55:28 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::3e12:c026:afdc:beda]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::3e12:c026:afdc:beda%5]) with mapi id 15.20.6134.027; Mon, 27 Feb 2023
 21:55:28 +0000
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
Subject: RE: [PATCH 18/70] target/hexagon/idef-parser: Use gen_tmp for
 gen_rvalue_pred
Thread-Topic: [PATCH 18/70] target/hexagon/idef-parser: Use gen_tmp for
 gen_rvalue_pred
Thread-Index: AQHZSm5x1pWKoKrxBE2eqKkIEpuWiq7jUprw
Date: Mon, 27 Feb 2023 21:55:28 +0000
Message-ID: <SN4PR0201MB8808EA2E41EA088425724FB6DEAF9@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-19-richard.henderson@linaro.org>
In-Reply-To: <20230227054233.390271-19-richard.henderson@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|BY5PR02MB6948:EE_
x-ms-office365-filtering-correlation-id: affe83ca-e2cf-4297-117f-08db190d56a8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4Wvihle4kx0JzBZ+9D1yhirmFoAeAR6YDk0rguOWPIq2Cn959Ly50qiHvJUBo+RTj4QxhUAajCxTfKZ6rtO5KvwzF/zX3swNFrFT/kYdRkyRZLVP4fOblaO96jRh9R9Op3pqmsYdoXhXZUF0HqwIrAYyGPlEG9EQMXlUR9Rzh2KHh29Tcj7EGhdILzyUHjEwEeRI1MU1T0htAbGCqNnNdSoFSd5TusKW/LBGIIDMFi+m0N9TN1shIO9+OKEiq/vqpsdgmlcVKLxOIYSgjmRzssr7kLrv4MK1+UsBZLwjDrryrRUcirz6bAwgcQ1QEKysKEj4M3e3CMfUp16fX8qCRmGp+fRSoYABmqut66dRfqn2sJF45R3NZSxjiwqtWjhbQO585XQJAM6lyAgD8KuH/4oWmJmqykL+7gHTLjfsavlmz+9Ug5J42RW7n64xbM8/DHHDgkxF7hDjY+bQyb+0hHEP8nGY9T1k2Qpgw1fJrSQuvmmoYkV/6dy2OIvrQ0mX4CZmSGMjyqjtSZogdUS9TLemmsYVOepeoCTybuFX1fZJNtoDllvEBIiuR/BSL9AWf0gsA5XvhCoDnLGv8QixB/lKToJoU1tr5GqbNq+6i0e0Mu5WNLWwNWPxNmBBZ4oBZ8ql+n0gEmTVHzC307eVG/ED8ZEMQBckW3d9i2tpyXAG6rNM7xHpNUFPjaP2t9PIO4/EQ8OJIh6M3bFfjhFDpA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(396003)(376002)(346002)(136003)(366004)(451199018)(83380400001)(54906003)(110136005)(316002)(33656002)(4326008)(122000001)(64756008)(66476007)(8676002)(66446008)(38100700002)(53546011)(6506007)(478600001)(186003)(26005)(9686003)(7696005)(71200400001)(7416002)(5660300002)(55016003)(66556008)(76116006)(66946007)(4744005)(52536014)(8936002)(38070700005)(86362001)(2906002)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vELBMM9rGcxU4Io4LDqegPItQSjh0150s1uWdqCm21uqppveOHJFWy6NY9Qh?=
 =?us-ascii?Q?/NaQM7I8GfExZw2OecBE1J2bfem8BCPHSuYlFkiE2RwzTlUdKFOCvdOd5HQT?=
 =?us-ascii?Q?7FBKBQGDLKXp3GooDBvBbtaaOU3p52vZEDC0h1mc2WKH9crp8J7Yem2EkXHs?=
 =?us-ascii?Q?vJRRv2x/BUif9EJUgGadT+w0O4DszD5NTQ2gf/doqDg4Nv/91iLYo5rrvD7c?=
 =?us-ascii?Q?mRSxQcGwkBYDJ9QHUvX233DvcNpOleLNORkmjQZduI/deoWq5HZGRgCqbS6o?=
 =?us-ascii?Q?X+gGt+yrx5Lm17lQsfQ8J2mrYFKH2KSwdlzzHckD1l89CEA7/qZrnjRchmz1?=
 =?us-ascii?Q?WhKP0/RJ4m2zzZhTgbztg5R/7D1KV44FSQp8PubN+hY16sMDj84QZhriHBuZ?=
 =?us-ascii?Q?dSo+OLq0xO0TT8zSuXs3xq9oKzwhYuprlvnflX7l2KDsDdvsU0ZraGrlBAc3?=
 =?us-ascii?Q?h5e4iflWtqoFYiUsFFYO3oZw33ulyWr3T0kPErq59Zfds1BEFQALZi/ZF3wI?=
 =?us-ascii?Q?j/O/5NhWh0Z9QbHn6xd1XfzK2GL7PYHYTBTjFY8zdESSC2cR8M6he7kvf+jV?=
 =?us-ascii?Q?5A+P0xwAd8sxqHkGeOvii/Cc/bCFhunfj8pCjWFUsCgx38uFxMDL1Et9V67f?=
 =?us-ascii?Q?zz+TFD6BCf8WyJtwb47L1fuPbwTTLtYTOojrppLAM2ETZmmAaLApX+iML3Bn?=
 =?us-ascii?Q?N+7ZVLq5bYIIfm5KeKxC4zJAV6m4ypRqCrRaXeY/P5dCVbtocvVnD1BooL9M?=
 =?us-ascii?Q?RIWrtEWqmV8lISGwJM5AFkHJBMMcxSUV4DPkug0E2eQUhi+fpJaCU2xz8Z2M?=
 =?us-ascii?Q?4/FtNKrpVfcX22vfYDtcRSV2h1QF9GDst9A07Z2V+qYfF1WiIHxJ2tgLO+cY?=
 =?us-ascii?Q?TPhOU12WfCCRzifLtb998f/6HTwgzeZIoMqfWxD7PLI3ZQ4ncKk9g6H/cbJo?=
 =?us-ascii?Q?VEOu6U8cU0VwE1Sp+4WJCgEhJdj/UiCemPSIPE9mibynLxLP0prnH2Uzlaeo?=
 =?us-ascii?Q?paG8SQE1h1tgozFlAzyeenWCq1gW680KQBndkUa2kpQNPG/aIcCQk2GjG2M7?=
 =?us-ascii?Q?fygnEHAoHkVBWkGbKNt/wY6ukdRdQVsahc33vD+6DS3iWKirqtdRtEIbeAuM?=
 =?us-ascii?Q?Ti/A8JGPZL7hs5ARXr33LW6tzWkgj/Z5HILyRJ0uIcLjoYJ9yEsXxakFtibD?=
 =?us-ascii?Q?fw7NXiwqAyEHP2SX1T1+WBrZTfXYn7fcdJYB4m43EMyOdMSQ9+zyGshfTkaF?=
 =?us-ascii?Q?w0nPv59sAn+zsOcF38aEEyv+7OGIPik4sn+l4/00mHWjtoJjnFxVPjyROLj/?=
 =?us-ascii?Q?7bp/EFcGOdXVno+8zy4uCk4Re8ZNWQ06LcX7/xBS9qi2iR9/q6DZcbZYmVE3?=
 =?us-ascii?Q?qV3rYUTUcTyjcBhOM8ge/vzeDskyW7pc7ptFOLLKcEIxc/go20DFnOjzuFiw?=
 =?us-ascii?Q?SeheoYoUhebbHjnpU5aFf+OuHYhdMlGvtyUButNgzUG+md0QnVDwM/IO/xd2?=
 =?us-ascii?Q?dlETVgFrwB7CySu19DwIBUVk4tYIku+2kLCYnQv0LsEHbAI6wHRUrUsB2hJP?=
 =?us-ascii?Q?ZTgWKm4yU6VDUUK9vLCU8N+IC7JkB7mZhsybFhDO?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?us-ascii?Q?c1c6VqL3waEiC58ZdljPsjBNFkoE1cmCJnAaTfMRhpQlIgCmRtDAFPF4Xmqm?=
 =?us-ascii?Q?Nvpy0+nOnCVW4tQE0FAa8WDOI11LSPDAsKj3TKXxccXd3qW8ocHVAb+2Euw/?=
 =?us-ascii?Q?bZteJhQ3QnAeul/9xBziphAYSeyjDp7+LbZB/bte9ScSJTSUODPrx+PewEE3?=
 =?us-ascii?Q?IrjyXBHXhqDuil2JuSVD1DMOhb9EUElyHlPy+/4nH4tny9cQInLXAjlDbDZi?=
 =?us-ascii?Q?3P9TgfxkaMu7kXQpU3dPcglJAOPFhaD5pV5t+WU0aa0GZcP7ucr3iPMfhvfL?=
 =?us-ascii?Q?0vX9dyuNeLTMnrdpuwF4FRNoSAjL+JKm4ZNBEAWLTClhqS7j/c3VB4s39O0H?=
 =?us-ascii?Q?E4pPwgmVOTI44s3TTNhHjJZOFpdOdhXsOayaX7n8ZvcSeWaPXGmghYQK/NZ/?=
 =?us-ascii?Q?h43cxXsGmuDLr7ZUmyG6jcyTVx/go9GknS2jhQV8Izb6Wn+d2QwrvDP2bDUz?=
 =?us-ascii?Q?HcfR5pEekaciFVwb6g2yhR2f7CRwa3ie8kuhElrL5mFzZ4sKZh5DlVO8DdER?=
 =?us-ascii?Q?X4ZYcLqMAd8OG1DhWam+J8c+dMexWv2jj7fzljYYoEUHjstnaWAG5PClfWWd?=
 =?us-ascii?Q?O5fVYD7DsvMUP4qHPW3KUO7gWd0A7JxaDyvJTv6E4w217VJlbr/KQ8wbPNwL?=
 =?us-ascii?Q?WREP9Xq4KSpR0NKlWek5ysM5I5nWl/dhrCEkdcWkusCCBTrnhMr2SnO/XyP5?=
 =?us-ascii?Q?QQNuB8Hqj/RjAcxD9JA4PmYVCndV25UXMMBolJ7jSCa6Mr6q/cvtBywqWPq+?=
 =?us-ascii?Q?GD507WQZPx+CP5W3ciDKiZKxxNCNKIXyicnTPqB1Zb+cWHROLPQI1ZbzctG7?=
 =?us-ascii?Q?02e5OsOx95CL5SwiqfqmO5WYXzfUEMF6eWLQ/sLl8D9n5fjJ9cw56mms4GUD?=
 =?us-ascii?Q?LZy45VnZnBacDZbZMpz8bCezXCjM2fKS57EC9LZdsdhcAgxL/U8aUGPvjPZn?=
 =?us-ascii?Q?x46lzVSposCG9gKqosfLIBMPnxvJnp3cTiwLBqiJj8dCav8E1HoqTaDJ2Nc+?=
 =?us-ascii?Q?TyIk1/EAajD2d2n/dIHVWHkZKA=3D=3D?=
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: affe83ca-e2cf-4297-117f-08db190d56a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2023 21:55:28.1712 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b+KHzPZdgXdBZ8Ipm44Tk2QrY5mG4zkQxhHexd0hY6xsf03rFP7aBkGqAL5n+tCF8TGLxrb9SGxAuDx7TlHITg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6948
X-Proofpoint-ORIG-GUID: hl0X8HdJ9buIk2WFkaOuk-nRmB5NA6A1
X-Proofpoint-GUID: hl0X8HdJ9buIk2WFkaOuk-nRmB5NA6A1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-27_17,2023-02-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0 mlxlogscore=386
 spamscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302270174
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=tsimpson@quicinc.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 27 Feb 2023 21:55:51 -0000



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
> Subject: [PATCH 18/70] target/hexagon/idef-parser: Use gen_tmp for
> gen_rvalue_pred
> =20
> The allocation is immediately followed by either tcg_gen_mov_i32 or
> gen_read_preg (which contains tcg_gen_mov_i32), so the zero initializatio=
n
> is immediately discarded.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/hexagon/idef-parser/parser-helpers.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>

