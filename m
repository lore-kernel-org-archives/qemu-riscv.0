Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWhPW-0007r8-Bw
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 12:35:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pWhPV-0007qR-4G; Mon, 27 Feb 2023 12:35:37 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pWhPT-0000X2-HQ; Mon, 27 Feb 2023 12:35:36 -0500
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31RFpgUa031216; Mon, 27 Feb 2023 17:35:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=8JLebwTFaiWO/2+S4YinxBokKVi1B5cXby86Tt25jOs=;
 b=b31AktRZriKOLG8LekqHvDUWM8GnhrO7GZR3YJZ1JKdNCM3edRyM3ZE1t3EZyy4VOFDU
 tyujBAAChb+nM0D3y5MHPoN2ohaj0Es5MtW1+AAyOmZq8MFMOut8lPNK6hytDxdzQMFi
 ydYRGQBOYzJayYPEl8b5lFOWT+q9xtHAKCJ63VabxEji0T8fhDW7kdmf84tdsK/ES++M
 aHMVgbSi5lmwSQXmw3gbAcxilHsfr7MileBrX715+aRDP+jawGXF13jYXbv7oT6BNYL7
 iL/s8NNM7DbMw1fdj3sdcsnMTo/t/0rn1n4MqmuUA15Wb0rks1L+SSsFU+JcGYWsiQJ3 Cw== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ny81qdvs0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Feb 2023 17:35:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Avy8U0WF60y4v07sxTY/63ZeNqBj5Hz95WQmAUrIh5ifzsLo/n07vgM97s/nHHEuOX8j1IHIrJxG75h6tLw+cxgR/N2tKmHL23l3eosg9ye+pdkFGV1rmDzsWfwpvflG408f3+vlkhWXY7MtEAvqrJO9dBEPbh0ZVDSFp8e17XaaaGzX2uu0h3RldRMUDLRYQoN9yBapazhQk45tz3pNL6e9/T6HNHB/cpwl4LQUx5vJ2iK/+YS8kWYhFxm4aVldo08bM6WoboljzyaGGBQihYQJuEsIMQI0Xt+Ep+xs1eRytim9O5lTSylbaKS9MW/6h1l5uAK5PxvLy1HJ7y/WXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8JLebwTFaiWO/2+S4YinxBokKVi1B5cXby86Tt25jOs=;
 b=ehhVsswqNsqXVo1rEUl3Rd6JBYrbUBoyqGUqMoZHCF9IFaIBf+4ojR9OACayeb5zYyfWdbgvrtrkKmWzEnZhUhDrHSPTC7BpNa2XHbPZ2IoXhkUiLzyEy0IVQyrYIKEC5J5ppdHkj7qcuobj/dIVVbyBQv8yinybXs365dYq6wyLan13p2V+Gmjogr4bMzsU7FbPoTbBF7zK/pLoMlaMisa+aMSNwBwCPlpQWgqNLo6Tvno26ZqIaC+aieOclUsCMVRRQSc9HBzgPphyRmvTbQnDDmBf+7l8OylOu6M/T05C+1m0IqYC3hHjFYBPMVSFWgr0zYXCKmrtwDlaDLqrpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by BN0PR02MB7917.namprd02.prod.outlook.com
 (2603:10b6:408:160::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 17:35:11 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::3e12:c026:afdc:beda]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::3e12:c026:afdc:beda%5]) with mapi id 15.20.6134.027; Mon, 27 Feb 2023
 17:35:11 +0000
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
Subject: RE: [PATCH v4 23/31] target/hexagon/idef-parser: Drop gen_tmp_local
Thread-Topic: [PATCH v4 23/31] target/hexagon/idef-parser: Drop gen_tmp_local
Thread-Index: AQHZSm2wb/u+4kwFn0Ckof2+XEyPIa7jDqDg
Date: Mon, 27 Feb 2023 17:35:11 +0000
Message-ID: <SN4PR0201MB88083E4CFD77A8B7C7F53330DEAF9@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20230227053701.368744-1-richard.henderson@linaro.org>
 <20230227053701.368744-24-richard.henderson@linaro.org>
In-Reply-To: <20230227053701.368744-24-richard.henderson@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|BN0PR02MB7917:EE_
x-ms-office365-filtering-correlation-id: 773e9a82-7559-462b-3efb-08db18e8fa5d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: o5Q0xGeBS3u1z6Y3GjuDyCXVuBEFdaU3Gknn88ZrzZpHRXJcBz++ehJu+lSwHx15vpUwDyvK37QZfFBTItcCdnu2pMDAVPNki+fr93o7X8BaxwW5tBv5M1+W16CvLLeNMKV1G9N9GLOw6BN+baCGA3IevmbZoRS6mNmkpBwPEckjXWFjzBYpK3IXIpmAZtjORW2L/PLOi8vUXizeARFdYhpbAMzcHXtFpfR/o3FgCh6vxQgq+QiUwAK4gZy5Mz6D92xBWbD9HPuoKvbTH6qM3qI2PjPkKEmYNXUfX23Gch3gqez1cKFUNGz9uGEXrtALzVye9/ly+N1VnAIYTnI2cgZyqSYTIZqfCXqhiLeYWA8eyXIRSqAreWTJE86lSazDOKHWouo0bYANX9HtGVoGYrcLEH9Ds9hPisOQ3BewmSsZSSVaZAs7mOaehSGf6o5RK5+bGixBOKoh0vlAssy+zsubNsE8j/aoIfa0AgUPYSpOZzyRqZI4WZODAG1UBF0u6uWa8kd6qa29R4CtCq03tTR1MkjTFXROsZa9BxwDOrTXsPPJ8HmioASBgF/NH0YYnZgWEWZWaZ3d9ZkP91yAaw5EU3nE7f/N2qkV1jFUA6+n/ZuIQLbWaNcIISjfERFq6W6ndsZtwxRg/oOT3KE3OnB3HUxOi9TlUSkYeDDo2xVOBXgDn9k2g0hpROEmWXlMfNVXumH0JNTE21pTpcqPaw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(136003)(396003)(346002)(376002)(366004)(451199018)(122000001)(316002)(2906002)(7416002)(4744005)(33656002)(5660300002)(8936002)(52536014)(55016003)(86362001)(53546011)(76116006)(66946007)(26005)(9686003)(8676002)(66556008)(71200400001)(4326008)(66476007)(66446008)(110136005)(64756008)(54906003)(38100700002)(41300700001)(38070700005)(6506007)(83380400001)(186003)(478600001)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3t4pFJGip6FY0FeanvE49O1rj+SXTZvO6Z8wpqwVq8SBCAM9swjIHhZkLSK4?=
 =?us-ascii?Q?+mYnlsaDT8y/EHVNldTINvZy780/npvMoRKipSGRt4pWKGkGFo7GyAJ6hLJ5?=
 =?us-ascii?Q?IfN0UdiHcy3sYQ7hAFkxZAhna1TtcxhkvrUSAXXsNxxR9FIHVXjg275Du+YK?=
 =?us-ascii?Q?7OramF4QRFppQOvk7ca6nIKn3Wy0xgklBrwL4PiwqkX171topOtaFFnHHoBz?=
 =?us-ascii?Q?1ELISqsSLVe66fGFilB6Dmn1PNY4NqJHODyyQyCbQ0kwjKMWBmKxw88WGQRf?=
 =?us-ascii?Q?ZVOnya0eaWmjwIylt5mJOygSKRTEs7hr73noALQtoIAGPyhvhHP3lX2TFpLP?=
 =?us-ascii?Q?AU3FbiYIsRqhAyh7cbhZO9NeY2vVtgOBzYQGFAZ2ZbrhGhY6gye5d4ZcsjM0?=
 =?us-ascii?Q?KD56t+shUIrqJJBtkbQ6IFP9+H08FGGzh5sxZBM+kpbGKdf7DDcjWljQH+Rw?=
 =?us-ascii?Q?KEIVIJuncgcj2smaNxyusUeHzAS8nMUfo87E90sv002Mze8kvIubgKlj37qv?=
 =?us-ascii?Q?7l/7tYiWuAjc/lmsN77rnrc0+tByC7qcUVFyAf1XmAEK9t+H2wQVOdq8XMQO?=
 =?us-ascii?Q?QByiXCT/4kduBtXYFlRq10t/KxBiKVhSabLFeZYOJTE7fqv9SUr/XBb4qT16?=
 =?us-ascii?Q?hCjsplw3TDjH6Fm9j7rKODNeU0cOSjUlxsc7Xy61chOF/oeVWhrmfcD+LP11?=
 =?us-ascii?Q?D0aV4y9GAtSrmoFkB/ESqbHwBtCb7Xf09qW0mPbdKS1d/RyNET+9//tynXQO?=
 =?us-ascii?Q?rIUWQQ0bL3vPB83pX0bD5lmcI22TmR6UptLUsB0RBWIeLjWvVcup2gGuSeCi?=
 =?us-ascii?Q?2UIcc9NyEMEHHH3YefTO2czdSFcIccM2zl1F/X/56gKCIPkB1vlsb/gKeBdI?=
 =?us-ascii?Q?WrUPjNRidG1R2Ktl5ZnAvPL7yPNgm1SpAQlYQCdCKf1audyBn+o/2ScTgq1R?=
 =?us-ascii?Q?A6CUzlt4UsgwOJQVjNWp+5k8A9kWGx+X1KvMFsTaXtYSDAJRdX1KSQGafjnu?=
 =?us-ascii?Q?4ektDM2K2GlfyaTBVYwVSKEKl/d7UNGw9J/gKE10JM8rKBhgVSjGh8QniH+y?=
 =?us-ascii?Q?xqv2pt9A6jyVfM4NgERA7fLpA2padqm0v/ExWkFsObvnHaTUdrF9oSA7epZc?=
 =?us-ascii?Q?mXa0QgTUtqdJBXYNjDjy+ZaqXhV5sxNRsobdi4POKOte7Li2yiJHG+s5DuLB?=
 =?us-ascii?Q?rSF8fdjQEZ0q8AJBGcaDy6ivg8mEozB6uHKKg88SCuZwxjEWO9LjyThQl+yy?=
 =?us-ascii?Q?sr2z01RKQc5lCubQEYpAcHId/F/Op3B5KE+dIgykOfKjK8VnqZqO2QQUJDy1?=
 =?us-ascii?Q?Ak9+PQ3zceHU2g1M4MJkQLg3qpjRtAQqqElfoTlBdjXzIYwbYjos+AX+IEMb?=
 =?us-ascii?Q?jVUtBCVXguTvhQUmGOeetckgSQ2QuIccaHOLDqFfGhYXAFuKcYoqg+MGWGWl?=
 =?us-ascii?Q?KxpI1VV+LDp1QE25TfO4yICjNMpHBw2R5fmpugxoECGF+Azb/hvj1pVbtdN9?=
 =?us-ascii?Q?pyWMTpMlFQBRx5ch2V5q/ypafUVA0DAjSsyWj7o9MfycSS8Fxz9NQ6jOyPyW?=
 =?us-ascii?Q?iLjtQH8GjLVPRs/WX/cU09yUCADEDwNHIcRi5CP7?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?us-ascii?Q?VeRm21jZ/i3TiOFA8oFhL5e25bfEOb/T32ot3F3Te6yADO7IYKrbR+xpLnAQ?=
 =?us-ascii?Q?alCutotpguVDH9AAXxtC7nLxAoE8hw9xEo1zvflkxd9AG0ukDVfj+nU7GuT0?=
 =?us-ascii?Q?K0yqrTYlVwo757WODFfyWJtJ18URSWqfNeIDmHz/Uip4bHsnn+VukKWeLgDv?=
 =?us-ascii?Q?jVmQ7pW68E2kRYQowrmziJ+p0itH5G6I6sfFUdoexV+I3juKsGdipGi8TTdI?=
 =?us-ascii?Q?oT9s+wnHY37rPhmovD1nwEKC/NtLYo5mphR/oOVOBAecTwUr3RRdnax0HCEz?=
 =?us-ascii?Q?aVKJw+FmOxe1MK5oyeE+id2+xzv3f8Ya5NRw6iS5l5hRZ1tSuZuWYFZYsHTn?=
 =?us-ascii?Q?5S/exSTTlva6esisSPAu6WUUiDIl1PyhOsvhnVi0AXsO6H9xzFS3wW+MUBlp?=
 =?us-ascii?Q?Wb6ZDsGmOxiNz2lHqb91GsGjF5IPWN7x/mKhIQPgB6Wkeoe4nQwGT7Nua3Zt?=
 =?us-ascii?Q?ZlRGuFjK2mwBlm//E76vIFB7ClyoaeOUMwQ3RJbvOw0xo2vdDTdea/KfTuFv?=
 =?us-ascii?Q?omorGVW9e9c2hEJkBwfibeGqAmU2C9VJ3v30tsV8L5/HjyejM5NDnwGFk34S?=
 =?us-ascii?Q?CX8LDKJ+E9l0XH68KkGkKkx6jngGQqAjhV7v/JrVemrGI2yv/Nhh0xbPjsD6?=
 =?us-ascii?Q?6jGxZImA/oCbdAlhJj+2vqueY13OgLpwpX2qTox8MuijQzvTJ5037EFx4oit?=
 =?us-ascii?Q?JxoVSIGYGjfN81mD7KCURNz8jL4CFaJClepqdM2ZXA6NWeEFEyTcv9+33xTF?=
 =?us-ascii?Q?8wQAgnsioix8VnX/cr7CmZfXzh6k4funWXanvTMBZo+w5Hl3Y2/aeLyb4DbJ?=
 =?us-ascii?Q?7NQSYopaKZKGjR2vHHb5qxsMhw0uZUNB1KuV53noWX0nrqjfx7sy4lMV7+uz?=
 =?us-ascii?Q?gGChBNMIXLbsy01jtt1OV2zne3oSleoNii8idD0Em9/FkvQmkaKA3lIrxPZ0?=
 =?us-ascii?Q?dt809aqF4OZIPxpufhIRlXl7lyDmHukxPNWAfyrvbE3Ln3AJECoCuIgweuYj?=
 =?us-ascii?Q?2xJs8xvZpO+mGd7j3XgLKtkdpA=3D=3D?=
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 773e9a82-7559-462b-3efb-08db18e8fa5d
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2023 17:35:11.4795 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WzuwGEAE8nREWVLn90u1lSMq17RBT+s7H2bG3MZ04Pb1v0MMgf6tAVU0cpALuIyr3QQAVn+SkfTDCo0R3W8OLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR02MB7917
X-Proofpoint-ORIG-GUID: M-JLaGTsY8Hcok3emPsn_o2GPuBmKLF3
X-Proofpoint-GUID: M-JLaGTsY8Hcok3emPsn_o2GPuBmKLF3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-27_14,2023-02-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0
 malwarescore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=283 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302270137
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
X-List-Received-Date: Mon, 27 Feb 2023 17:35:37 -0000



> -----Original Message-----
> From: Richard Henderson <richard.henderson@linaro.org>
> Sent: Sunday, February 26, 2023 10:37 PM
> To: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org; qemu-ppc@nongnu.org; qemu-
> riscv@nongnu.org; qemu-s390x@nongnu.org; jcmvbkbc@gmail.com;
> kbastian@mail.uni-paderborn.de; ysato@users.sourceforge.jp;
> gaosong@loongson.cn; jiaxun.yang@flygoat.com; Taylor Simpson
> <tsimpson@quicinc.com>; ale@rev.ng; mrolnik@gmail.com;
> edgar.iglesias@gmail.com
> Subject: [PATCH v4 23/31] target/hexagon/idef-parser: Drop gen_tmp_local
>=20
> This is now equivalent to gen_tmp.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/hexagon/idef-parser/parser-helpers.c | 24 ++-------------------
>  1 file changed, 2 insertions(+), 22 deletions(-)

Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>


