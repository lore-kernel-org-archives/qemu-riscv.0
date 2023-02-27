Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWj2U-00083O-1O
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 14:19:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pWj2Q-00080w-C0; Mon, 27 Feb 2023 14:19:55 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pWj2O-0000eS-Np; Mon, 27 Feb 2023 14:19:54 -0500
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31RIPJXv006128; Mon, 27 Feb 2023 19:19:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=lpBLltFAFdZOwuMKQB1dBCzUjZJ1s7vT8yt58ThDT/g=;
 b=dDZL/alYPAWBdYMKNH50jDsd49cffMzF+MsYbymm9d6ZEfbFgPbg9VgzWACuwUuyAhvR
 5R4Wq8yZIv+c45bUxp/4MBqQQOZ25P1WwcUoSHAWNGQeLXs2RCi0+W0BCVjSB/MkgQcK
 nVdUrsOI/VLjKz4a+D62c1fPtlFPcV2Vv03HzQ9y2MTa6P8eKp8QYnN7nCdAYIEwB80o
 uLI5CUBS9zwBa4GMpxmVvv7mQPszNOAzSa890LPcb/4m8w6o55wqUTzaWZgdqD32mvSl
 ES83+blHtgyBu2ApdpcCsWSd1YMWxgspseZ05oKhTFlp/qezX6LaD3CdnkIpU9Zy/lHh pA== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2105.outbound.protection.outlook.com [104.47.58.105])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ny9bfdxr4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Feb 2023 19:19:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ahx8KSYvg3Ddp9be0MJil8YD1TDHLMjJQViZlIs25N6f3s4KXmCB6dkTvFcs8QjGhy8bajKPWTNrBAHi8Itlx/mZu61Zc2rk47p2bZGWaHwrvXAslCXIWCf8xFoUQx/u3dS0HSkq/KnM2bpuIwcg1IxsBa0fQapNhOCljixlKnw6vujeAw7PWBPqv3lMCeWR6A9uDhejEh63iLqC/wvuIeUG1WQJxV+qPxcy32/Y0B/IcZc6u+76wBcKYOgsTpGACX2IWWpAKDzak/uOvIu346xcfTMdVvfPMsSencz8waMJCv8i09V56BebkFplzEohIROl/+XUbbHV0DxGNkJ6Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lpBLltFAFdZOwuMKQB1dBCzUjZJ1s7vT8yt58ThDT/g=;
 b=jBP9K8/iQtqB66GBkZajJskBePizwRR4p/nBZl9/GAL1ZAbSAlTSrIYFJIiZPvvYrzsi49qu+BhKnPSzpzKiclULJmhvPEO60EVfJl/clSnGaM/1bzokOU6TUYern4jWmBNE8AKt1jdjQKYL246EhhmQBZYYbo26uwSifX0mPuY52xqBFXXsqJcAEryhjRaaAKx3cr7e/XyTQZtNRRWfJhoR6gJTXR3srzR0BW7N2GIIX6MSLSVBMOWRiXK0okGNq2m4FmCmMx23XIK61aF3pB/Tcg7Bgm9C7IR+eoZM7q0xjb1zHx9v9BbGakTaZ/KDbjVZaeUPQboE+BILWQetyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by IA1PR02MB9540.namprd02.prod.outlook.com
 (2603:10b6:208:3f7::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 19:19:27 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::3e12:c026:afdc:beda]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::3e12:c026:afdc:beda%5]) with mapi id 15.20.6134.027; Mon, 27 Feb 2023
 19:19:27 +0000
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
Subject: RE: [PATCH v2 28/76] target/hexagon/idef-parser: Drop
 HexValue.is_manual
Thread-Topic: [PATCH v2 28/76] target/hexagon/idef-parser: Drop
 HexValue.is_manual
Thread-Index: AQHZSmwNH/LX0EHzlUaRueTGQZ1nVq7jK23Q
Date: Mon, 27 Feb 2023 19:19:27 +0000
Message-ID: <SN4PR0201MB8808E3343F42305C56491316DEAF9@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-29-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-29-richard.henderson@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|IA1PR02MB9540:EE_
x-ms-office365-filtering-correlation-id: bd878c1e-5985-4bbc-f2ad-08db18f78b55
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6Jrh7ALglReJQvGhlsuOgolSlvUBKWoFxvzaVBcDmOidcq4mjwm641gqSAxXgF0yxxJl75+5iuTEnzfFZQekcR2Hj0+mem1RkOq1qdtASf5MVcLTcqi7eE1IQtGVZcrROZlzD0bQhiZQdjydkT4i7Z8x2QiIi/IxRg7zff645iMpJnTvauwb4iqAt9F2vEQr4xxJ4SWNSCY6X1LFd2vnyDJtYgCPJUrAPd4u7niTKsS8/lDxHDx1jIKAbXnt8Kv5IKZqY0y6VKZ+nlzzErcAvWppeJH/ME091MnzkKBqpsJwVqWVYeB3TEGFJf/6e4r4Al9RzCoT+JVeOkcpSaBQI2r1z2CjCfsj5vtJMOD43mj0eszXr4Y5oUTDNg0B+LyQzncb4l7eGnuMTuUiJfPwVfbw2CPHvRwbpJLsdVmHFY2RgiHQ17J0lSPyjOaL/KJqg49/KWtRJwQIUOl7wzcN2rZgcCD4h7Pnya7LhRP6F9ty28kYmg7IW8v+d2of5w/YbMNvDnM5FK5Rp7GQ3Mu0C50FeY134pE8b8RXj9+jVEufqX8jPzvT6rrnoiS7/mXElcvDWughwxWcCh0hPl6UBP4D4kL5hLPK+uEPKnMLnS3mbBXCFls/JXMpYuYzavgJTpWsx9FCQgo6uAcUudAFSojrVTs+A4tGTebtH74SyltcaSg8MoM5kbITASZGHID5XYtlJe2wNN3aiK/5RwL6JQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(396003)(346002)(39860400002)(136003)(376002)(451199018)(83380400001)(316002)(54906003)(110136005)(33656002)(4326008)(122000001)(8676002)(64756008)(66446008)(38100700002)(76116006)(6506007)(53546011)(478600001)(9686003)(186003)(26005)(7696005)(71200400001)(7416002)(5660300002)(66476007)(66556008)(55016003)(66946007)(2906002)(4744005)(52536014)(8936002)(86362001)(41300700001)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?b2dTTVa1gXw7xcjyUXrA24OgugHTeXl45g9kPHqsArSDlAbIxOOMgACr8SD3?=
 =?us-ascii?Q?ZhRKkXkictwJyHYqFrjvhVnkblnqvRNISJE15Yw3OfA10gcTVtAjxMiaiMV9?=
 =?us-ascii?Q?LNbi0aqcayYw17LwIHDTqCXSshQzrD1L9VRdo6Zpa9wUtG7Ti1WSdnrXA8vi?=
 =?us-ascii?Q?+mUtsCYlMAdnP83yXJxWhs6Eq9YHMszTggSV+13bPwEu7rC8MwjquR118it9?=
 =?us-ascii?Q?u11Km2Yj6+4ug7uIAVe2uAzIeid85Qw+8XleaK3FMT/R3KtoLKCsc+QrY+gA?=
 =?us-ascii?Q?Xf5Vb2eh8PP7uUPqKdrd+n+VjxpZfq87y9SBpJvEfUHM3nPOKHYbwY/GKT4m?=
 =?us-ascii?Q?n3hiAAlk7tNqzJqX4llFjNTMEQ1AH3bOFgPgbCs3kMEFSzWC9ibcyxzg+cEW?=
 =?us-ascii?Q?LdxGeZwDqUuboB93UF4mSd5l9lPmt5NWN6xsFBSgoaH3N5JO+htmgT2j6L+/?=
 =?us-ascii?Q?wfY68mrbHC+j8iQJP2Q8WZ08o/OOlAhxhIfAUFXaVZ1ysBsZ1EjlX7iQaynO?=
 =?us-ascii?Q?V9Cv2dL8PazN9ukYsPPgyKWb7U41t1c4V6F0Uf3/YnIki+5U/Ykw56/0gXJ+?=
 =?us-ascii?Q?dQ0oxfrlE3IcxnwGyjmmKSTOHeWgbwke1Z/ns924bC52dP1rgRQ98JDeuIxQ?=
 =?us-ascii?Q?MWKDm6m8iRbrq+R10d59Jezn+5Y1l18Z8oMepFj4czSG8RGybbYp7jNSCkzH?=
 =?us-ascii?Q?IwLN7kO3YSLFmX2nT92N74LJzRchPki8DWhXvrO2beG2RP2FgkwzDwixmpbR?=
 =?us-ascii?Q?9YDiRA8CLTgmntiTqUX3iTxXIEoOf7tbKW7qvoQdjZJXKhuzSJ0FTDrvFHL7?=
 =?us-ascii?Q?aoii7e4jBjaXCI6WeYdm8qjIQy4kDIneyYgoeM6H8wm+Kw+s8cFcY9xv0EW5?=
 =?us-ascii?Q?IIWe+FtqU+4gs2yuDlu/LPXvg4s4qEE6Z9X2ZXC/wA4sFDULgiJVG1AZVxyW?=
 =?us-ascii?Q?prIOGcYNvyL1EQt+i2gNgP2ccJdJC8FYi/Q6frcHY/+Ejt8h3XP0BhWPZCFF?=
 =?us-ascii?Q?sSxJPq+BW/R2MeVwD6nvVegWfsNaglT6+PKnmZSs+zyd0VDDMNoqH7NgNKS1?=
 =?us-ascii?Q?j9G2woRNHTPxTj5iUK3qnEFj6LZgtsQvQPIRzg7flS2Iitjt8g1t2ehH/jbE?=
 =?us-ascii?Q?SoK4MvGUbYlCykgB63uuiF7c4TjucrhkvEaTn9mq9ywiZDeEelWDXt2unAyX?=
 =?us-ascii?Q?zjQzKhFqg0nFiFM8sUbcIr1+O6O5WlNCvusrSYrng0RuQCFsJUvYxOy9hB+9?=
 =?us-ascii?Q?qUoKnCBnGi6OnmVb7nt5XVkMRKWNdjzCWlhLP8ECpknKMmQMDFHVryMRGfD+?=
 =?us-ascii?Q?MJheEFqbV3leRSuQ7Z0vHrafBvN71HQ6ABVMWjmuim4mpjFuU8QacJ7Ggj9L?=
 =?us-ascii?Q?xUA0BHqbE5+kFcUErkTZaYB8ZyrN3qLaXQFuYduwKzjJP98BlsOkEIoGRU/K?=
 =?us-ascii?Q?PfFXHW7LS4/NOEpWzA2F0pqx5eWFi0ICl1DpNqLya6c1Dlu/HNyjL6eZ6Bd/?=
 =?us-ascii?Q?UAdsrQdSRy4FY3DoGQxBPM6cOOuTxh+qaZwXAX79okof/uxNn3YlEZAdCLOc?=
 =?us-ascii?Q?w06GIT67UzOeh0vKtFb+3NGjcT0Zw2u5PP89HPNe?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?us-ascii?Q?soYnzD6IjFHo93+upQ+o2nq9+sRo19eZHOvSP4dU4+QPZtnlhzUxtwVfLNgK?=
 =?us-ascii?Q?dGh8RqhvhstCTkOTO6B4V7O5oY8Izn9Z7JD0j2bPR8VL1eh8zPQX5lUT4YXq?=
 =?us-ascii?Q?poDsjB2sAOMfZejgR8eQuva585czW8YTHnlI4k7592IEBKG8wp0CWIi9IjMv?=
 =?us-ascii?Q?dFVhgBGNP83tqtMAX1TF3pIZWVwyprB4q/GEoTyWtsxV516tWNEJ4RASmO4g?=
 =?us-ascii?Q?GMcuvbOYwBgtIP4CJhMnl7qEo2Cprde4IvxsUUHQCUKxw3bHUnbjw6tkdP+h?=
 =?us-ascii?Q?/gWHwumRphmb+TmKQzDvzLl5K+UOiCoonXR0mGu0yJJgaTeiZ1c+sFjogo/5?=
 =?us-ascii?Q?hYMfM2eK51YesLjC/tEThNdqnZMe82ZApDCUJ/GUrsdgU4hJWClUJH5wpJic?=
 =?us-ascii?Q?H28ceZxm22uKDKTs+e/VCrJHLn3O24cKiCwR0iYQlv+jPpAvYdKFIepLbLze?=
 =?us-ascii?Q?E9aZ+x+6wMim4FnMoos9kAfaNpROGMJyetXk++r2YJdl+TV0m+ood/k7v3gG?=
 =?us-ascii?Q?6Yi9TzcfKrw3cA15DShpBU9XuC10uixB+xLDb8PlIu+UMJRj9vgLf/2JaqXK?=
 =?us-ascii?Q?4DTPLJoJ8leMwhH6dt7Lcg9YncE8qt/sgSbSgwbB/B4GLZFIJWObljmHVupF?=
 =?us-ascii?Q?HuQikKo8AbTGtDPR8VibuorKcNI1t5/G9tepBbEXLpZwgm0mjgdYfhmK1Ida?=
 =?us-ascii?Q?Gxc7AqiC41z3zVdb/FNc768AfYGqz0aV898+VKRE6zVH47Ns/CPDGBCmJHZ2?=
 =?us-ascii?Q?0y5vTwQGcojEaLWmZ+SiuNp3Wbs9Dtzle0cQzK47tByp1XDC7OuxD5oe5f5P?=
 =?us-ascii?Q?paTeHt9fp05ybu0N3hGAmu9ZNeDfEjyifaa8pJzCm3VijzD7DLiF3RtGkTa2?=
 =?us-ascii?Q?DEvTm6zQKO/0RXA86xbIXkMMjP0WFqPIGeejIF0OTfUg2JpYGguKG+3KChL6?=
 =?us-ascii?Q?ae9MUiHprr8HdQUVMMQ4HIOVX+zBF95UySzlP5j+lMZGrx2bKFnrf/5eYU1M?=
 =?us-ascii?Q?3SkeK7raxHEnGIGMker9GfXrOg=3D=3D?=
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd878c1e-5985-4bbc-f2ad-08db18f78b55
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2023 19:19:27.6399 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BfAQ5ap1npb+MpZcp0+gZ7xF2CWs4WqJ3QLyEBKCV8MSYDFQ6+Xih3rmOSaQzK37Yn02TIN4BZHxaBh7m0f3CA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR02MB9540
X-Proofpoint-GUID: IGflx2CxVSFe9A0XekPojGQnkb_RmB7I
X-Proofpoint-ORIG-GUID: IGflx2CxVSFe9A0XekPojGQnkb_RmB7I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-27_15,2023-02-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=304
 priorityscore=1501 mlxscore=0 bulkscore=0 malwarescore=0 phishscore=0
 adultscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302270151
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
X-List-Received-Date: Mon, 27 Feb 2023 19:19:55 -0000



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
> Subject: [PATCH v2 28/76] target/hexagon/idef-parser: Drop
> HexValue.is_manual
>=20
> This field is no longer used.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/hexagon/idef-parser/idef-parser.h    |  1 -
>  target/hexagon/idef-parser/parser-helpers.c | 15 ---------------
>  target/hexagon/idef-parser/idef-parser.y    |  2 --
>  3 files changed, 18 deletions(-)

Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>


