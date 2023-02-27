Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWlTf-00060I-Mu
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 16:56:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pWlTd-0005yL-Ls; Mon, 27 Feb 2023 16:56:09 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pWlTc-0001Ao-0A; Mon, 27 Feb 2023 16:56:09 -0500
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31RAnHr7000879; Mon, 27 Feb 2023 21:55:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=9jETjSZXUz0JwZTivzAZsowukAIw9j1stqjepqwNU9Q=;
 b=ADjpgaCiCWCTXyaySZNIDVIhrTiOKrO1527PiipsCo12/ZWtsgm9dvwvg4v0H3VapvpU
 bjWrTWKX9qPHOXgjZ0mlCafGD6dfzTJImRa4UWF0fPwoDwIto1jXegJ675qVb4Qp6KQu
 FAW6UXnNH0r6nlQtGGNQODCUpudhbQPR+tPvxKGNuHkHCVVGE1KCdb3h6hNExGUY8a7n
 ZG4qc9q6VExKDwjeIkWLKyFkj5+NN4wBQL9pGxFiLs0p5yzVWgxpqIr/17cJh5nj/3qW
 6LF822C0iEtcf2tjE+Q/lKRimw159PLFAHurG8nLs9HtABLqWvJ2GuZFC5k3lxbc4UNh 8Q== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p0u3thkgw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Feb 2023 21:55:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iXQjPGxDr4F5r2q3cDOXFolp85gVKiwIMRU485gxuvq8X3vDxywlQ1rYN9r4xTRoizjYm0PR0dqRSbegcyqjASqHCgTwOVFHeZIpgJPWmtOMHw8YTFUbua5r0yZ6KOGg0UcEYsIcKMF4nEdpPpodCOG4mQ2rhFJkOvwi1yasMMpQ9pAd0Bs9x0ligYIQJEaEQJJux7DiHkaxUKrixp6g0uobqa/QUE7YdPSvNnm21G87eLHxZocvtbu0r4i4KACWNLTxCU+1bavNkf6ngqfE/mImtq85qN13tm53MRfd1tOphgUCiTdcwhMGfCC8JidQHUDdfQET/wsnVeEljq+NEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9jETjSZXUz0JwZTivzAZsowukAIw9j1stqjepqwNU9Q=;
 b=Gpou1qW+IZPa7FUNz6GqS0l4L/ZnWu15S3keUQo4zigr58hdYsz7kFHV8yv7fw3jTG4V7XvCWzS3iNNYrb/uF0UHFois86CBeCuPfHjMHksbNXJhSyuyeEUE7tXoutQC/ZbpgPwROZICtCo59/Eejg8YcXyNWJD5fOzHYQfFQD7Ol5L/9ZA9hKpFp0T72m7eKqhKvVq7mqMvJojMa7KE78m6OtNsMCZRkK9nHPP1SbgngPpoPgUldx7s+o8UX++cd1doWsYk3xwOZIj0toIeeFK0AagFggGOGG/+d59oEodLc66d6onXzD3MPvdakWKq9MzsjjALGOnZRD+XO7X9Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by BY5PR02MB6948.namprd02.prod.outlook.com
 (2603:10b6:a03:23f::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 21:55:49 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::3e12:c026:afdc:beda]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::3e12:c026:afdc:beda%5]) with mapi id 15.20.6134.027; Mon, 27 Feb 2023
 21:55:49 +0000
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
Subject: RE: [PATCH 16/70] target/hexagon/idef-parser: Use gen_tmp for LPCFG
Thread-Topic: [PATCH 16/70] target/hexagon/idef-parser: Use gen_tmp for LPCFG
Thread-Index: AQHZSm5sF03FsZqMzki+4yS2+RS1+K7jQfoA
Date: Mon, 27 Feb 2023 21:55:49 +0000
Message-ID: <SN4PR0201MB88081449FF23093FFE2A5594DEAF9@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-17-richard.henderson@linaro.org>
In-Reply-To: <20230227054233.390271-17-richard.henderson@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|BY5PR02MB6948:EE_
x-ms-office365-filtering-correlation-id: 7ee3f960-ddf4-461e-7150-08db190d632b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FSdzGhrC6R6EnQVpy0C6Ys/QEC4l67WDUJNMW0xWwQT89FVdx2wL2mKp9cv8qWgbOEXvYy1Yr9bPqgQ8SG1d49uje/kh5Wam1BMOdal+mocXqH9UWmzCZkciqia61lNvBwERj9jYHXLl4tV9IOAarnhEirB9X6PjUs+whm9rlkP5r2WuGDcfRfxK2/h7yfpeBRQfi4M6iTd+P+SOAi7QrsmgRg6pHyhNEKVS0cXqms1BnBIF2dZDquq0vBQ4/uIrYP423wzJDeefWw10YQAzS2hReuJqbmkf08NsTTaNC4l7zNrVMlAdgEA12GpF5it6negXIkjOMGxJrX3+IH6DyURvoQv9ieUqL4zGnRorItEsqdLPh13JsxAJ/ue5qgW0G1BirDrHzcDG26yvq5ygkdrhXCYKz8DJ8/Y8KlgC44FmBXMqrF759R9/6vk4UmdLPevPd1PHUpRkI0wYYZW5rbU2faj63hPlQ17q1Xk90JVroAxUAiQuaCIjNk+xR/JGdQP722mdjgcVPzzKns9UA4mbARk5rY+jnjs1YsGiHcgz+QiebvK33eyrry1nE6ri4rdY/jwPxKTYgmQsytXS59B0v2yA0tsFG4r4quIZ5a9aIeOM1SL2cDLEgH7pIu9VY4C2fjvRfTESu34C00lhluLXid87ndCbfcxTunqGC160nNsETrIJeGuO9lB2wQL0+606rip8J1XaCG4dFYJ4Xg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(396003)(376002)(346002)(136003)(366004)(451199018)(83380400001)(54906003)(110136005)(316002)(33656002)(4326008)(122000001)(64756008)(66476007)(8676002)(66446008)(38100700002)(53546011)(6506007)(478600001)(186003)(26005)(9686003)(7696005)(71200400001)(7416002)(5660300002)(55016003)(66556008)(76116006)(66946007)(4744005)(52536014)(8936002)(38070700005)(86362001)(2906002)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TIk2pKcd1v81Y1vVbqDIK26Y/cdfYU+zVcIkUqcCXkOgWDMall1pR71bYIRm?=
 =?us-ascii?Q?YYcFQVefcbZnLbHCEYAF2tAU6+bEYrvqqspPPQhomf87QLcBTHMEr8x5L8MF?=
 =?us-ascii?Q?6/mdlhhi6k46hdcyeLMHpX0SRuY83SDKwi5yAPTgL8Ffo+nY1kXBA/4/g8XT?=
 =?us-ascii?Q?oUTQlXfnmCHAz0dnaQv6ZKOeRomKYSIOXUnOTTC/m4BcDuGn6EBLq66gbxIk?=
 =?us-ascii?Q?5WWwfpGAJ+q7Jr9jVSpVYdacEp9Tp057PnCEN35kxNrT4UMZ6xoY9JsVpqLJ?=
 =?us-ascii?Q?DXySrpCIlt2vdMVnqi87iSeuhDCfujdj9OMPmgl1nX4sm5sbh5BT2UaZyri5?=
 =?us-ascii?Q?FOY35SHoGTc9fuYKfhRDEX8p4fD1kLmOdWiU4aoHIPfstLnm/VVN0tcjH7Yw?=
 =?us-ascii?Q?0YhVdDWl4ewsFs9wnCsK8BDGTL8wpGGC1ahLbZtNlsyDcu7Dx6kOfYJ5dhPU?=
 =?us-ascii?Q?5XbbI5Kk4IcB+gmmj7354APIMPVICbL4SYELMh3/ZC7bipWTbCgETeoaONqv?=
 =?us-ascii?Q?xCwtd2AwXTQaTeRtlZ541FlvMy9ecjvIAJTedk0sF5yhMx2NqRlQdfJE4yDb?=
 =?us-ascii?Q?HV1MR3Sm4TzDsHe4eCf5xeI8L7SX0ObTe04ukXyMWKn7PCCsA/NNKbq2N9xz?=
 =?us-ascii?Q?1P7fkPa/iD3kO1a1wZzMDBvMAu6YBimMz2RmEU+GG5qS9JezaUKd8cbzzRMg?=
 =?us-ascii?Q?2vDph5jSnm51spOSQ15+6JCVsDWAsFfHDVDC/3/+gJ4Z/JKcvAl9dLDpc/cf?=
 =?us-ascii?Q?WptVyXObVT/VeY7KDDXp9wsLcK9fr+xn5Vbh4Zst7A1uzueWfjvrFDJZ9iC7?=
 =?us-ascii?Q?B15d2i57I7nykaJRWnEFWk68G6EZ32QifqAHwE3R6CLMYEr8bWanh0q1Hh9V?=
 =?us-ascii?Q?Xeb7EmHUU4eMnhqm8EVINwxFsi5Hu5mZQaCT6l/8FLgd+Io6o53//Z5pNfpt?=
 =?us-ascii?Q?wYToVzww+yo+6qeplqzfGhSe5LR11XJ+n6F4RVzaIYxNDNmQ2jBLTJMxsxc9?=
 =?us-ascii?Q?F/W4dFmJuomlzoabKElVOk4HTZKqSMkUxTMboojWwBPAL+ocEK/2v2UJL1wH?=
 =?us-ascii?Q?emjKXt8pLzNudkskqw94h/P1as67wMGIbgM4aRu+RHrkZ+dcBLQqKKhtJ7pU?=
 =?us-ascii?Q?HJOjYJ8fl+EFYW3oxZKlKcfm7jq3b9zsG1t5hOgx9R06t37qAObDOQAvLLcB?=
 =?us-ascii?Q?Q5wFqITUluijkzGxVZCGBSjaM9h4J3c5jeipaRFI4tbWNaLIf0+5jRieYe0D?=
 =?us-ascii?Q?sUKykjemxHSMTxU9QhGgiU8rLOYypUQU3AxnpuctttHHUL4Rnq2xF6VwsDUH?=
 =?us-ascii?Q?B6Be8si14UsDpTFUNDRNG5FFEnVh/h49zvCFNtMqZkQCZ4SqMTQoVwEcuy+v?=
 =?us-ascii?Q?+0Va1gyB5pVZGOMC4TZhzoy/82LrRxjkGS8vwMhqB9hkxlNEwBI85MifwPcB?=
 =?us-ascii?Q?SVS1L58xvh6wrMFkoqj2dqymuUUDXo/TlR2xuFUoJCG7t9uQXfT9c8PuKsHw?=
 =?us-ascii?Q?v2+DLVhbc7q2vddxWKjmdTkbBgdz7p5ULB8CbZyaPBaL/xi7USHONTA9Mpi5?=
 =?us-ascii?Q?4CTl3G95eUiLH9VMGPTqnPvV4jCAYesnUrelSHa5?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?us-ascii?Q?iHiABuNZqHIEK+qlQV19437DMBL0c9bKg5O/4QuZYNLesgG6DHvKzCRj7H7o?=
 =?us-ascii?Q?7X/kMBk5QrZJ6m+AAyY4x29tT8VjLt1pcHeV1p66OSHyn6f/7c1NcQuZ7+NW?=
 =?us-ascii?Q?jWI33mSk/wgFMs/gYfzdRX0L3NJpDgW+yBrDNW96hV/s5khgIrpm68U2NzHj?=
 =?us-ascii?Q?S8d0xEyVGtq/FSqpftOdY4yDmSA0X4TdmqAkZdj4RGZsoBDdBXPySWp8GU3E?=
 =?us-ascii?Q?jsL4cpE1VCv8tyc3bO2KeaD4rdYn+E+j8D7KN7YTdq0dGaIpSrEI95JpI0d2?=
 =?us-ascii?Q?zaBgbFRdPYEFkIrD3taNxFDSl9v6x1v6bnvDRZOq/7DY/3MUQrAR/hAV871x?=
 =?us-ascii?Q?fTo8jy8S1QLWNd27wFRE1HKKD1yKb6R0httOF4hexYNHZXXb92m+k7/zPbhM?=
 =?us-ascii?Q?guc4EUiy0wqWzw/IelKb5vfuPDotLpUN8mkXHMRP2wMbxMPrekL7l4GKnnsD?=
 =?us-ascii?Q?rtTKIqcQQsjFaPVSkuMSRJ5Yq2VuSTjmm6qlSzdVE9lktKrw26esuBENuMKn?=
 =?us-ascii?Q?SgZM/O8qa63r+kYjJpzsFSMS7iLP9+yZgjc0RO7VpYM+qIEGDnP/MKtWxJoj?=
 =?us-ascii?Q?pv1ydke5ySU/QGv1zkvtxRN4m2oP0YkrNAk3aHjPg5U2JCnFnyChOsJ+HM/A?=
 =?us-ascii?Q?+nCzY1eqly6w6elC10ojYCUJHLmcu6AxAsRN6mXDb9E57xulYnRKMlej8O4l?=
 =?us-ascii?Q?8NAN23WEaF11k3I0DJ0bmHa0EiAdbFwpNOBPbx8vzsG3dMeggoHi9w2us90X?=
 =?us-ascii?Q?i+Kyv5PgX+VWsm8U/9Y1toibYJ+9Jf/zHvTuHBias4IdiEr1/jChfEHn8f2I?=
 =?us-ascii?Q?EW/oEielquBkIN9sZZnVZ2LlAe4ApawtrGe7a1jhnoJSm4hT4b2dL1R2LW4p?=
 =?us-ascii?Q?zw/EJkWFINPXUD5B+GA7+HrLAt4ZtSi+jJltDMYys6HniXOmolxvkPeVDfXR?=
 =?us-ascii?Q?oLy4HzYfxPWa5cbhHknofeF7/giEYOna1CQQRXZ1fIiTb96oT+MMLRwd8yuS?=
 =?us-ascii?Q?B5re/6cxur5Li3y9+SziKvbDuQ=3D=3D?=
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ee3f960-ddf4-461e-7150-08db190d632b
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2023 21:55:49.1492 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z9FaMezlGnQDTJgcV3lexTTab98ZcSlusBsdHy6ug58LxqHGprK50djLJ/p8I/uk8lCpP7hUQQQ7vcZnSRQXoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6948
X-Proofpoint-GUID: vfj_KRSSRXOvAa57kAz5XKvpCRM-8mir
X-Proofpoint-ORIG-GUID: vfj_KRSSRXOvAa57kAz5XKvpCRM-8mir
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-27_17,2023-02-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 mlxscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 lowpriorityscore=0 mlxlogscore=440 malwarescore=0
 suspectscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302270174
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
X-List-Received-Date: Mon, 27 Feb 2023 21:56:10 -0000



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
> Subject: [PATCH 16/70] target/hexagon/idef-parser: Use gen_tmp for LPCFG
>=20
> The GET_USR_FIELD macro initializes the output, so the initial assignment=
 of
> zero is discarded.  This is the only use of get_tmp_value outside of pars=
er-
> helper.c, so make it static.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/hexagon/idef-parser/parser-helpers.h | 6 ------
> target/hexagon/idef-parser/parser-helpers.c | 2 +-
>  target/hexagon/idef-parser/idef-parser.y    | 2 +-
>  3 files changed, 2 insertions(+), 8 deletions(-)

Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>


