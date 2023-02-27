Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWlTP-0005mx-FK
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 16:55:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pWlTN-0005mS-Ih; Mon, 27 Feb 2023 16:55:53 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pWlTL-00011t-VD; Mon, 27 Feb 2023 16:55:53 -0500
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31RAnJcQ000921; Mon, 27 Feb 2023 21:55:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=N+/+sllBEjzfIQzviwVhownU8OEvk5gC9xFlDEZs4RY=;
 b=A1ohtlx7Lh9FU1YI5ocMm8H57aVGhB7xsklALGDx5BBu1pqDzDsSb9xV04p128qUyud/
 AhPRsJAwCZQPV/XlBzz3n/hjUYBOKrxx9ZpHc+7zzxEVKinK66tFGdyRG/9zCu3+vlOj
 nqmeYE8GYlz79jcYd+7FWgyayMeSZc2bL5N1/b8zQnG6oDHbu44XXPG/sckBHmKj5VRS
 /8pD7GB33oRgnw156tEujtIgE9A9qLmS8dGRlh9P2PCzexchNyWUUlJEF5rqWfDuhK+u
 Mc5oHSCwjwuH+tAdvzhLHCkft8m6oFbYgnjdhDetaF6Gw4tz1aTsQ6ZjrVi43Vn7QtYX rg== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p0u3thkgn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Feb 2023 21:55:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OwcnmKcOXdkGwOjRQVahzcQmfE5XRm9bhv9X/KU6IqroZXx6+5rxFGEFmz4O9SJVpMWLykB3KQybGR8gO1dmhD8HihbrpYPFPhNshhiTfUq0KIBmORgX0JqW6rI+CyeJHICaVolcOPNsTEulD5Ju8MI4Vetupj81xKLKzKDP2jhbYYIruXseIFc1tfxcDVzY3GBNJy6q5fXDlNnaAYqw909E/Ur83M7l/e8/U/pErctfw+ALTv2kz3nVAWhmFV2bwmL386QGz/2AYEBgaS6GI+b2xgqEtvoXSvfVBlDhlJnenU84nnj4p4YLR02L6M56hLs6/0LP7xRQRgnXQJZgeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N+/+sllBEjzfIQzviwVhownU8OEvk5gC9xFlDEZs4RY=;
 b=NYaWV4W5xguhOYLa459IVkYorJTnnYWnq5BpATGKlP9Bc5Y5OHGzsEygXmw68DfDw8aUYeo62d31gVWJPtkWYaGgNeZgCZHFa1+nQMTn8WVtd+6HUjGr6gcxzZFYkHb2gVfjWKYYx/zEk4WwlhEnPGbknRxdUBFWw5maKgTMMgasHpjtyWepTg8edn/Pr58WdyrRPKBteOE8Vh4MBOCZJmZUJVTSORSkwMBWM5LztARlXz77XxRCP6E/Wdkt9uhxgJXr19Qvpp6x4IwZEqhjEPVwMAIFENDOa+xzJX1Si+3fjXjug1GWP5P+N3Pqu4/G7Z0ecL4/Yl3aQfPkt80h3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by BY5PR02MB6948.namprd02.prod.outlook.com
 (2603:10b6:a03:23f::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 21:55:33 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::3e12:c026:afdc:beda]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::3e12:c026:afdc:beda%5]) with mapi id 15.20.6134.027; Mon, 27 Feb 2023
 21:55:33 +0000
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
Subject: RE: [PATCH 17/70] target/hexagon/idef-parser: Use gen_tmp for
 gen_pred_assign
Thread-Topic: [PATCH 17/70] target/hexagon/idef-parser: Use gen_tmp for
 gen_pred_assign
Thread-Index: AQHZSm5u79X54etuPUOojtvVSv5+fq7jQj7A
Date: Mon, 27 Feb 2023 21:55:33 +0000
Message-ID: <SN4PR0201MB8808828122BD8C167B433CCFDEAF9@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-18-richard.henderson@linaro.org>
In-Reply-To: <20230227054233.390271-18-richard.henderson@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|BY5PR02MB6948:EE_
x-ms-office365-filtering-correlation-id: 605e1768-2239-45ee-be75-08db190d59ef
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: etcPv2mYVG23sBLqabZYFpTKINzAJoobu6cE8pMHd6hwjyAaNyrsOOXEQhW0xXKs3Xo4Yfyila+mfcYl2x8PaqsUqwCeQ26ypZEoJt1tx9LjJoxU8ztZfs2deJ4tRzqViCE7e2JF/dDX/OrVLCFzYTXJf4oHVGFXXxGM7ElzdngBywQxFZ7G85OGW6DNpBSxXNqCrTTw8x12loFWNN+zVBFM06sKx4AHvAUHk9uBLzki5a/OsyMA0sjEtyyoNp/mKJDm6S1qSu3nXC9yBb2lSQl/87l5RRhIlK8NXBrzFWsJQbbhzsOYF1+fpPfH8l84NhJwr6IIOuM5UXJHmhgkwI/M2+DnqI+KrqYbn/xyHspqxdjuWQpNFCkxDzuTJ2kMhwbvZUBRSIskIaIrtYMHP/prsKATXEvsFOQbjbTrq7vCxANQsm/ybYOa4wcMuAjJamrFZ5Ki/sKctAqkO/sVeIycEC1eUOrSXgOVvigX9ZV+53VJp41fal77/6CRboXVsz51Xo498XB/VR1s7/+Ovv3S3alZN9LPoyonmeUjUNG93LNmsdQv6XiM83dP0OOgSjKypR/we4E1dV6HRxEUgaTrYqk3qw+/+QD/vLifmtLIvtpjaTn4sUk3eWt5w4TXybX19F5UbTIjKaxtIQfQlsPGGjTz/9Tdk625nTgP2JXnfJNnrG7xs5c8Qm4+inwaHaxQ6brM1+UrIj9Cjt9DrA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(396003)(376002)(346002)(136003)(366004)(451199018)(83380400001)(54906003)(110136005)(316002)(33656002)(4326008)(122000001)(64756008)(66476007)(8676002)(66446008)(38100700002)(53546011)(6506007)(478600001)(186003)(26005)(9686003)(7696005)(71200400001)(7416002)(5660300002)(55016003)(66556008)(76116006)(66946007)(52536014)(8936002)(38070700005)(86362001)(2906002)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?bDYMPaRnXODBYYCLHLoWh5jjo7OVoFuwzjWf5onjvzomA/8MQIasg60qyB4h?=
 =?us-ascii?Q?J/EiQw5Fe2yGJ24LWs1M47xXjTBAzcOtNbM99v4a1XejzctrsDrCspxcGkn7?=
 =?us-ascii?Q?w5Y2tKhKzZgbjW+pUhS+ifTEqxrq/GRjQocgJPCS4VlV4kc9byy3HRV1++rR?=
 =?us-ascii?Q?WFiD1He07AAgzTa92gNkf5Hxy6ZE2pWUn9vX0akajdtXKeos3ypMEERuaX7M?=
 =?us-ascii?Q?ax4EwqgaZTUPIv8r0q+Unc0dTOQ9zsQgPfHJrzEKNA7E4E0zfyEv46OSAR77?=
 =?us-ascii?Q?dRXe54lBC+g8P+GElJFNj5j/IbmZ0zpyrNubb6P4e1Koi5jXUdhoGKA4yEGg?=
 =?us-ascii?Q?htZU1rZlC0/ixjS1R1N5OctN+4bqN+jL+4iBCPJuRPguqCLZfset8QXXv6R4?=
 =?us-ascii?Q?ecnp4wuI/lWn4yXWOOKo7A6bAgh9nGqnVFAARJ6NTj9hxtyjmwHortX6evCY?=
 =?us-ascii?Q?p+AgpVRWZZxJdvQkgdglANe512ned5KCb8CGIl+w7hlDmrmc8ImwJ4S3Nu16?=
 =?us-ascii?Q?e0GueTMWV/mhlq5aWFkK52WXfyMIWDrjT9O7FFO9rW6MfweAI3EC1OClYxPa?=
 =?us-ascii?Q?5K/Ts2UDDAwNEj+3AzCeTELl1uEyihnGN0H13pJ7NS05nr/bfoCbZ1LMKC8u?=
 =?us-ascii?Q?ebcinN/UAtTiGUkp3QQkZn5oLDKR3iGVZ4ldgJZvu3ixmo1VfHxOc5UUsir7?=
 =?us-ascii?Q?sg75pcCmJafoMkeOqvPCTssan+Agyml6dtRAQm/mgqhhdURgp/RhimJ6u6g3?=
 =?us-ascii?Q?DK8NEYdf6oS0K99qXPjgxvZbcLdfnF+oE5263AvR3ejcxSLSbpOCq/zq/X3R?=
 =?us-ascii?Q?3P3Q0y8xiA88u4q4nbpEBjaUP87Y2vUZ/xykza2AkqYMlAAiIsPvqyOZbzPW?=
 =?us-ascii?Q?xdyLLuiId9/w4Jmmuukwzw7I0ixq3Eeu6ZaH7siP4NzFK5FRnIuWXhXmaEZ2?=
 =?us-ascii?Q?ubQKhNmKP7j08CYtJbb5qhIJiX4nDLzC3oOQiJ2yeXTDyD8nshIZOEqsrNO0?=
 =?us-ascii?Q?xwQLZdtcn4GCDJVZDtRCU5Wvst6ZJE0wLW1KdlkZM7n9Qbzyf2Fk5N3oEOC4?=
 =?us-ascii?Q?r0VepQQAHCtAhwLl4OJqU5Wj14uXwmaB9E+KiHx8vbsF6Qvb1hrYmfpnotcE?=
 =?us-ascii?Q?ULmG3o9Jyh+9ssXxWbkVi1pqs9vSrCzjF1ccMkNV8u5SLjrMoVPkoes54nWA?=
 =?us-ascii?Q?BKb4IauPDZYpmjvQSBJywrYTT1XYqtFRnozSwu1/RP60CMGRpygCNmAX5gTd?=
 =?us-ascii?Q?OWtrFCBEXLEGpw7WOwSgDNNJWGUm0Fk0W7MAqguKivfJa2CtCODHut1RjV/T?=
 =?us-ascii?Q?IhANwvv6/Z55GZDupfUN+vZmY3coMbNClUrexevCQ7WLHUOW8QZPZMSdgtxQ?=
 =?us-ascii?Q?TKiszLO7ahsryXrViTObk49TT79jeCIsm1PIYBpOrf8yNSbmzBjkHln3fW1c?=
 =?us-ascii?Q?UifJfpX39kJDCP/0I73jasc4q+Xcn7db0SAzIYWkIFKOw0677IdD83YGx/tO?=
 =?us-ascii?Q?Y+W1MdLAp7o9xVClJ5IEjONWYXsDZlqkCM3NMnTXLwT7b5LstiJHfgcTvK1S?=
 =?us-ascii?Q?lkj982IXtmL+vMDH56RZo5jEzzbbwccJplWA1WWi?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?us-ascii?Q?VgwdIFI/7167aEihxPvuQolTuhDrGsrLKeSMqsm62P3xD4mkQuNqbZzyBUEh?=
 =?us-ascii?Q?MOLGZM4/Gv9bw/4cekVyNsdRVBc9fg5cpLjN5Xcvi+Csqca0PtGkoJJ6nsje?=
 =?us-ascii?Q?+sKSuYhrKMeqESXC1X3FDhIlElZhYhK43om0KExE4LeWXTcELw7E8vCLQJqT?=
 =?us-ascii?Q?NTbnZUXOnJt5I1YJAHOQkwdS+W1gjum5bcUvvb9s4gEnQeZBMR25dveoHep9?=
 =?us-ascii?Q?0Vb5tMH1yf6O0Y4+aPiuC8ScpX3YMX4iIrNFvt1Ul+dKibpgS+8iygKd9NUj?=
 =?us-ascii?Q?oIfAVdmPm/FmOusMZL9ZlC3l8LoH3h11jYMCzEuPcLpgi8jkT395bqGJkUHz?=
 =?us-ascii?Q?GS/DQpPvSwgMmEvGKxHSrsSkKyYo9fFbc4Gqk8k5z82ZJfM5tit7t2YREbSI?=
 =?us-ascii?Q?i5u1BJ6mBGwZg/hjC7Ad7z4lsjsl3vgtZz+JDclcsK5NcX8nB0G/WGGet6Kd?=
 =?us-ascii?Q?4M2VarO8a9RniTY7AbD7hGP1SHzz43eyEZqYKN3KCZCphnsAso6afC2H1rNz?=
 =?us-ascii?Q?pTmbp4GtBThXzPsU5fp/hr++5TQ96ifPMzdKszTuI1QM+jmey10N0s9dffVm?=
 =?us-ascii?Q?dpg6wLEfOEQ/jDWVwRJMekVDLx6JEe+fVbsGXU+dgfTxJLgdvyaNEl7Dx/8w?=
 =?us-ascii?Q?GhJQwp43DcTyah4lz69fVyJ02Cg3kuuhrcR5agbAyM3s3Box2eFzzRUJ2eCg?=
 =?us-ascii?Q?cdXqAjEl9GPi1h0tnNmDXf80bsVDOBqCdz9XVAChHutctGYb+zXLd/4IPJKA?=
 =?us-ascii?Q?jcLJIzuvju98WBbj1VjEFzusq/saQ/l4+lHCqRyAXASrBpIqCiTotQ3Hj8IQ?=
 =?us-ascii?Q?0AIdQSdIiOaRotBfjNjq5962XXhPXLqJserxzS6O/17X8CIC100IK+lDdbl+?=
 =?us-ascii?Q?4AbgzVkQC0zHqNTOwk+TL/X++XpYltemJbUwPK+ehXyT+P/wgWz7VEDnKsRJ?=
 =?us-ascii?Q?GxyLj54D7OzLJV/UQmB+dl/orfObGvOqO8Y8NO8CRSAAwDn74i/5zZxTo6aQ?=
 =?us-ascii?Q?Gu/c5jirDGpaurgFg78h6Il2+w=3D=3D?=
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 605e1768-2239-45ee-be75-08db190d59ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2023 21:55:33.6585 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j2mlrLC7PucJ7PRwBJxVHWHDpnbAivk7v+oS6pX778z19pTaIyBmekKWp0uOLwcn72Z8N0YiOSS3PUPj6sHvsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6948
X-Proofpoint-GUID: aVfYopoC8R4BTcdWSXpUAPk6vLC6xkON
X-Proofpoint-ORIG-GUID: aVfYopoC8R4BTcdWSXpUAPk6vLC6xkON
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-27_17,2023-02-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 mlxscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 lowpriorityscore=0 mlxlogscore=780 malwarescore=0
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
X-List-Received-Date: Mon, 27 Feb 2023 21:55:53 -0000



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
> Subject: [PATCH 17/70] target/hexagon/idef-parser: Use gen_tmp for
> gen_pred_assign
>=20
> The allocation is immediately followed by tcg_gen_mov_i32, so the initial
> assignment of zero is discarded.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/hexagon/idef-parser/parser-helpers.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/target/hexagon/idef-parser/parser-helpers.c
> b/target/hexagon/idef-parser/parser-helpers.c
> index be979dac86..760e499149 100644
> --- a/target/hexagon/idef-parser/parser-helpers.c
> +++ b/target/hexagon/idef-parser/parser-helpers.c
> @@ -1743,7 +1743,7 @@ void gen_pred_assign(Context *c, YYLTYPE *locp,
> HexValue *left_pred,
>               "Predicate assign not allowed in ternary!");
>      /* Extract predicate TCGv */
>      if (is_direct) {
> -        *left_pred =3D gen_tmp_value(c, locp, "0", 32, UNSIGNED);
> +        *left_pred =3D gen_tmp(c, locp, 32, UNSIGNED);
>      }
>      /* Extract first 8 bits, and store new predicate value */
>      OUT(c, locp, "tcg_gen_mov_i32(", left_pred, ", ", &r, ");\n");

Let's combine this OUT statement with the next one
-    OUT(c, locp, "tcg_gen_mov_i32(", left_pred, ", ", &r, ");\n");
-    OUT(c, locp, "tcg_gen_andi_i32(", left_pred, ", ", left_pred,
+    OUT(c, locp, "tcg_gen_andi_i32(", left_pred, ", ", &r,
         ", 0xff);\n");

Otherwise,
Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>

