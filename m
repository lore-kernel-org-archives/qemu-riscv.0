Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWhoG-00049x-Gd
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 13:01:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pWho2-0003bu-I8; Mon, 27 Feb 2023 13:01:08 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pWho0-0005mW-IR; Mon, 27 Feb 2023 13:00:58 -0500
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31REQb0k025549; Mon, 27 Feb 2023 18:00:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=V5sdepZcSdJt3yn25sVX06qqjLjKRabpzZnt45hTY3o=;
 b=IzpudqH/kcQMCXmOIrzhxlT6G3IZTsrDrbK2zHfinyv9fS3C9twP2Ox5XkhATqMDRiEO
 ReLswCgQTTCmT3l0wNbTvdsnnD/Hp2Npo4Wp6WpzZvyUqdE1aPX4dsgqfvrwtBGXEgEN
 jIBgpb3U0sRTcwAhthPjzUJmulBVWUljsV+VH4fp5/x9XrQeyN5qrT1U5HRJBOn6kmAP
 o0aHk7fpvtJqSVbDgdLqVe/26MgMn/QZJAG/BUYRJjVvpntZDDAio1EUR+wN0anl0Rcx
 kuvcjqL2RZfRIdG91DDqf+n6Vj65ZPhiJv3V1hy1QLcw36halv1vilIeNG2DwzniYh8A 2Q== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ny9nuwq1x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Feb 2023 18:00:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JJGowetl4+nLo7O6OmvqdWe/2sPj1Bjj+AHNLmD2pPIUSjASA8xmvMKanifDpCfApj7dJU+HzkUTel5MmS/woy0Vr9ExBR9wyCdI7Wwu3p5SBd8MLOU7OM7iV3Y44+QMv+YnavCSiqqATIFxfx18KUayAfH/qvn+hqfYMnpmZe2awmhpAXYWT1DHDjtyAf+HeGPyCo2zOQmP0Uf2Ujwye5QtvQyeVB29LFFN2acKeHXjdsG7mHAxAClkjFRdr93LKaXj6WaxOq8cqHSe2Vq5PcZmIz692e3S46J7N9DI2CQWk6z0HBWJr/J3lFKb8YHcG66nBjfk1nrmj0efyHwwBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V5sdepZcSdJt3yn25sVX06qqjLjKRabpzZnt45hTY3o=;
 b=lUY1mpXuPxZVf4DqNJbHmWrN+i9PyS5P8Jt/+KuFdxE7jpy5/U6CyT7Zs50ibcw3Uo2NlPu7qdWyBHkdklzrbN0OM6DgAgiDAepMrgEWkLw2qYp2kqY87RKMcUDjn913DyoFtduSisv5ZL3lNLNgcD4kpY/uXIvnzc1UaBI1UU0Ishlm0aJNLr23SeHQACyM8yyCtTvLZCh1wlADUwFzXcqhyyjBFMN0CFywWixEkrWSoT3LHkOLZIg9HC2lgj5SbLAbpt1obcHwlQiAnhXEduJVZX6FK65QZhV0zpLeuxeXEXnAzEfMyaT0latcrhQYU9fE1sG3jW03+/orRXHGSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by MN2PR02MB6975.namprd02.prod.outlook.com
 (2603:10b6:208:205::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 18:00:26 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::3e12:c026:afdc:beda]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::3e12:c026:afdc:beda%5]) with mapi id 15.20.6134.027; Mon, 27 Feb 2023
 18:00:26 +0000
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
Subject: RE: [PATCH v2 27/76] target/hexagon/idef-parser: Drop tcg_temp_free
Thread-Topic: [PATCH v2 27/76] target/hexagon/idef-parser: Drop tcg_temp_free
Thread-Index: AQHZSmwNrVGdGckg80O53M5iXekG5K7jFN2Q
Date: Mon, 27 Feb 2023 18:00:26 +0000
Message-ID: <SN4PR0201MB8808025666E1C48156E9F6F2DEAF9@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-28-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-28-richard.henderson@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|MN2PR02MB6975:EE_
x-ms-office365-filtering-correlation-id: 6eda27aa-f2c7-42b9-d854-08db18ec8122
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9imgLByJMvD1aV38nCskSyAHwxcXlMphEr6F8frktVEBgSOQEvYQib2nGWDzFRKEv3NqXG1U0yMDQ49QR8DzOLDqB/LVWTK5+2lDigZ87+X0xROT0878XMO6n2zu/ENC9zzaCuhrcSfL//brQ3RkTITyJSKM5vd8ngjMfQ+KqlpEhBNL2+/Hq3oduh0RgEkrOzbHxu4OXyA1n1S9El/6bTMx4ddJB/aQFgYlgCId3uwusBd98MEkY+K9WjhqVq1NS/ugTVbBhqZFtYY2waghViKGsTyG0WD3chlU7oOSl2262uBL6gelF91O+1MUp4X8UXBpQH3FukVq/zUrl2wXpLa4bZ7El+9AqC5hYCFyZ4RFXwBB1tfYYfojvcm2AFl2c5jTasHi0LQjWl1DCQRAfYlRfz1OmdGAzDhR/uIGBHFyZqJ/yRyrVBl1Osz5AVfe25XAGB5XM3Qdi3488FkWnFU+SGUG8JyKMpSGf1H5xy/TXtI/KKJNnUbGwbBnDzKLL9COCU01VWupltmN90eR79hv1E0G9OjNKoUKwfwD51oW8oCCjPoC0OX6HZIGcZkfR/vjQ4WTZtZHTBLCizUNvqqOYbeqaFT0Lrb2TH19KAAOfKjRkLb+8fmkZvTn3rhbQPIZHWFxv+p9s26VgfK7qh5g2WSA4GK9g+PeaIQeVmCGatjrC4Ra7zRlBAmZ0tTJUm35XGCwp5gHJ+wYsrBSKw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(376002)(39860400002)(396003)(366004)(346002)(451199018)(26005)(38100700002)(2906002)(122000001)(7416002)(5660300002)(83380400001)(8936002)(316002)(86362001)(66446008)(66476007)(66556008)(52536014)(38070700005)(8676002)(6506007)(186003)(53546011)(4326008)(9686003)(41300700001)(66946007)(54906003)(7696005)(478600001)(110136005)(71200400001)(76116006)(55016003)(33656002)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?NxcEUTk1hqnp5quI43CMo6wt2XgRtTZvC2qYF+OaWmZhhVOSSliKJ/Ox4296?=
 =?us-ascii?Q?WUf1M74Zj60urfi2r+Yhj+nINhL+VRlDYQCVloA5rEiwD8Qw8AdfxvKO1FZd?=
 =?us-ascii?Q?Nc/G0hInjHLHQyl5pt5dLLI2RTBfYxNyzZy0DFzHzEONZykwvAOOn1GSsye5?=
 =?us-ascii?Q?AMMlbWqCecD3VJDPNeKqGykNKXjg23nHmlulIpIQjgVXEzZETfZbjDZIpe4m?=
 =?us-ascii?Q?wj6zmTswepz/4pMwC3eOP0XNit5JbQef8pdhxJyElJv1LjvYv6T87XJYF8HE?=
 =?us-ascii?Q?UTBZepC0Qg0KgmEeSNbh34+LWtyZcXNahzYPUqxbDfgI/5qafG05fUWtudO+?=
 =?us-ascii?Q?pcuYJs7atBsrjzT7oUDAop9G7Vfh8b0LWnPU1fNMETKy4nzCDJcDCT5JTDyM?=
 =?us-ascii?Q?TohmdV2ts2WlUAd86SrrP+UgO6Ua3cIoGlAKjey5b4VZEuvDXJ/lK+tj1yPg?=
 =?us-ascii?Q?8mwLaJvoh1poTS6cgjGfb6BDRrPK3SIp8kfwRHWEFnKbc9stRWf0nt493WK1?=
 =?us-ascii?Q?d569K8Nu58PI7dGsWiLXvuWaGMePIrGv3HCp57TbNE2fTSEzSCOHjUjMdyj/?=
 =?us-ascii?Q?/K2TJ7QjGxh6VHmC0106GLLCPAXHyZidJ5dpjt+c1empXwvG16TvktyhMxOG?=
 =?us-ascii?Q?awPgObMfQ+zwynwYo4VTV/klUmFs1QJ5sBl+13cWBbVbkZcqQuHKdopHKQTU?=
 =?us-ascii?Q?mKHqLHUFZnhLrkTfZlo7HoZe+yuobBmTLjiKyH7vx4ha3PDuVhBBjIwCYqIc?=
 =?us-ascii?Q?yWd+5bEfskZYhQQh8cyTDxx7NzWFoet3tD5QSJtxCr5uJ/kPQKuSAevYBj0V?=
 =?us-ascii?Q?y/bOc9u43H0PaO5ALe/lEMTwoE0U4ovOkQz8dzhXpuH3OJYnRATXreTnS4P+?=
 =?us-ascii?Q?9KDIC1w1Gcg79/1K2ZzdzVW4cexZ75l0yxINQEpuYDSRNpVSo4NNThFgc1f9?=
 =?us-ascii?Q?ItA/2ubr0IBLHkJ17FEtlW4uvij58QUFxO+PwwOoayAv1b7m0YaHnXbxr5Zu?=
 =?us-ascii?Q?NyUAcNimppUN6wYyO77v5RuWsp7PsZUPM/H5VTXl5QrfUPnwHaoMUUwfR3hk?=
 =?us-ascii?Q?79iOuO1KArJu196Loa8976JKjuEYriApOsQbLthADL/zO7ChN5EGbjstOb99?=
 =?us-ascii?Q?R4stnxD+ov6BEL3UwDEUS7+L1KIJooIlHemUbDlh0Fz5Pi3j8QwaMODm1CLH?=
 =?us-ascii?Q?axHozgj7jfa8yO4VvwvrEfq8kJTml9dn7uqBsKhFmDDCqR/443YANFrXRzUc?=
 =?us-ascii?Q?k+weBwcSbxg57V4dMpl802ibE4b7up5mIvMox6lKhzdnsW4al2nLXPOngKBO?=
 =?us-ascii?Q?Nr/BNb4L8mYsTj1YQZArVP6u9LXl+2l+uhJZ5nYbjGK0M49pt/RqoLQ8ykJ5?=
 =?us-ascii?Q?QgnWp5imCwpCRvOvhlYR5e5Jqp+B0i6bleNuqEkEopH5bWp5QDj24tjXwuTQ?=
 =?us-ascii?Q?ZEO7H1ZlGTlSaksPEDWlHYpsR2pw4kjrogWK6UYb+u+KcQtTEeGRTjlqriDh?=
 =?us-ascii?Q?3rV4sUpPOZqR6NqGa1xNdD8dsTBRB9U65JbNvKMg8SbWKfiL1Zs0/8XZ5fDv?=
 =?us-ascii?Q?nq1r87/g7qg42FhPkNLKI6U/fGs7VI2eTslu02q7?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?us-ascii?Q?Z45PaicGkaqIrmsafHfWFi5H3exy5jtnWUAhwwOa15qWAsn4upPphKSGs4OP?=
 =?us-ascii?Q?cVTbdHjGCajVqh5VzYjIXfCh5uHBfwLQlVtS75oUMp0o74Rk2hEXADxNubeX?=
 =?us-ascii?Q?uOFO/dQfs0s6me1DTZVLre3zEt6/UkEFDa0gY7z+H69SYBXhki+t2CRw/FnA?=
 =?us-ascii?Q?ZAQBFTX1xwobIDJ64yM6jUiZeayJJ62eVDQDLgyyhb5fk87epMg0tcMXIwzw?=
 =?us-ascii?Q?BV6m2lN2xNb+2vaHJzhdVQguWKc+0dPVJ6Vx1C4k8JjPjrdWJDMat5xuWNi2?=
 =?us-ascii?Q?8wHigC0BjoVIDjeVGUm3AI+KzZ0KRwW99QX68dWo6GGVHyqaj61xE54XYx2O?=
 =?us-ascii?Q?H1mmOJuDFESmX0cFd58DXUsOcUZI5voHl9XFHZLN1MHl9lSOX+2UvRcnlTOL?=
 =?us-ascii?Q?nYPbs7rJapkpwoANEksyt2mvZ5kSRo+yIuZRCpOZ305qHA5nHgBo/PVgtcL5?=
 =?us-ascii?Q?FNvmbDWxMHyTUtxGvU0ClbVVd3DyIkBLazFI/PKiGsxVkjRRKrm/iCp/SeCE?=
 =?us-ascii?Q?6367S64QCXV40XomURuBYrtWYHBqN6RHEXQRIbGxOr4hDe5duqGRzZdVgHCY?=
 =?us-ascii?Q?uCUXtl8D+O/WZHbgL1viXKw68oVF346Bws71NFACxIyTfMoD6maKeX8VWjWl?=
 =?us-ascii?Q?iY9kflHx0Oycrg3HhsLiuhxD4hFRyN+/hEFv1gO69Ip1iUOvpVYNF5SbsNCQ?=
 =?us-ascii?Q?ucTiat9s7rtE6PWUBDAeSnP+2/0CW5aaR8PsmCSyvXpNwUY4/AjMFBGjMoNH?=
 =?us-ascii?Q?SGBkZLCiueZeaAlAgLlqwnxdnsmET8IV1ESauahn7/nbaxZwmIrVyMuRwnsd?=
 =?us-ascii?Q?sXrzImCbT5cLEbntRWO8RnBDnxUW49Anq2WIvy90ZCp+A3CD7mTMIG+xBYQc?=
 =?us-ascii?Q?r8Tw72vN570JAUouOiXbLMIVuR35D2o4XfKVyq/JYfZvbob9dVXYn2DZafVB?=
 =?us-ascii?Q?u546Ju09hGjkAY0Q3fjB9VC3gXUtRZRic5RBRxsMEMTd+LF0KPrYnAompaZL?=
 =?us-ascii?Q?mHV2nE0bpkgDWhwEKkg5IaaZlg=3D=3D?=
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eda27aa-f2c7-42b9-d854-08db18ec8122
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2023 18:00:26.0637 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bpCp5M3BJjowVWaEDZHiSJTVyk5pAqMGHQmohmBnUt0ADq9PpkQaSoWqOzxOiq+wtJPxNOSuS1RHxw46O/APaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6975
X-Proofpoint-ORIG-GUID: kldJW5E2k_o8PWAKfnGXx0NIZMW7Kqbz
X-Proofpoint-GUID: kldJW5E2k_o8PWAKfnGXx0NIZMW7Kqbz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-27_15,2023-02-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 adultscore=0 phishscore=0 mlxlogscore=292 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302270141
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
X-List-Received-Date: Mon, 27 Feb 2023 18:01:09 -0000



> -----Original Message-----
> From: Richard Henderson <richard.henderson@linaro.org>
> Sent: Sunday, February 26, 2023 10:24 PM
> To: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org; qemu-ppc@nongnu.org; qemu-
> riscv@nongnu.org; qemu-s390x@nongnu.org; jcmvbkbc@gmail.com;
> kbastian@mail.uni-paderborn.de; ysato@users.sourceforge.jp;
> gaosong@loongson.cn; jiaxun.yang@flygoat.com; Taylor Simpson
> <tsimpson@quicinc.com>; ale@rev.ng; mrolnik@gmail.com;
> edgar.iglesias@gmail.com
> Subject: [PATCH v2 27/76] target/hexagon/idef-parser: Drop tcg_temp_free
>=20
> Translators are no longer required to free tcg temporaries.
> This removes gen_rvalue_free, gen_rvalue_free_manual and
> free_variables, whose only purpose was to emit tcg_temp_free.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/hexagon/idef-parser/README.rst       |   8 --
>  target/hexagon/idef-parser/parser-helpers.h |   4 -
>  target/hexagon/idef-parser/parser-helpers.c | 142 --------------------
>  target/hexagon/idef-parser/idef-parser.y    |  10 --
>  4 files changed, 164 deletions(-)

Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>


