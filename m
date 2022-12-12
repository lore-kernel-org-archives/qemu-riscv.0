Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p4m6W-0007gL-1o
	for mharc-qemu-riscv@gnu.org; Mon, 12 Dec 2022 11:56:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1p4m6U-0007cY-24; Mon, 12 Dec 2022 11:56:34 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1p4m6S-0001dE-7S; Mon, 12 Dec 2022 11:56:33 -0500
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BCE8AEI027503; Mon, 12 Dec 2022 16:55:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=25kRt6C5edUeVcOSmKVh/W5Ap15949bU9qlKOKoa3FA=;
 b=VCr1/SD8nkYs9Q+1vlPfHqrFcdwRf10bg4iB/vq7O6UPWBJzGnUFRe6lwuXxEu2KasVJ
 ig0y7WiP5jLccedrjTvsMqBXzkq42EvQ2Tid+Yb1N4wa8R9UUuXr2EH+MCaB7BDS2U6a
 g586J3m9SdJIZHhgeHLcj2ntoUt0g40npGkSaUa8fzS7zwo177xUNqzesKSyaqWVsYvD
 Qzzq+q3dsMABME4sjcv6clOBRAJX4gpdvpqyj+ztsYff5YaP6GdiWYpoerMBRmjDmQgO
 gvFG7mWiK/x7a/1dNhKIbfOTTcThGzcuK1HymRWBSAbRwFdLn5Tq48xDVbUUXNJDOhQd aQ== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mcjb94jbn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Dec 2022 16:55:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mOIwIJGZN2k8Q6JSKdh7LSR5WajaAzLdbEizBGqxj37q2zQd+Z2eSsXupj8iP00CzTQyNUfEDwfFj3OERUAAk4QFAH3LYflloJ+A8Rdltsf4VO15hMc/VwYdQTBcLfEoC6UCsUwW96rW2jLZ5aeM/IYE5Y0xHxHWCwkLid9XFhbqW3RYPOtd3NmeE9eSKJacpFwFmkdNFZVpMVrGk1Z2NL7ParV7bneIeHO5Q9pza94tcV2l/xZb6hcfXhvrYUfly7vakM4U33vbBXxEhymu+YTS73lvKE9KrhyGUrCF7aaoCinMtTv+GCx/OIbsmE+AcGzkqnkMTkGKE35FCjdxiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=25kRt6C5edUeVcOSmKVh/W5Ap15949bU9qlKOKoa3FA=;
 b=kNccDBG9wN0OMW2lKsFEuj1V/NVsN280ADVniMQf4dYHVvMRKoar8Fo5Uu/3C1i5nPLz5zbzVcVlO6tVFSozoUjij8K0pc2xRo6lpFbfpreeIDh4E5Lr9lLPpALNAeJe8GjzK6n/hnPr9zv0v6oXZOW29ohgb2TH5uuIX/cp1l/xHy3+a7MRcHeS3EIoSZHlsAxY6t3Xqi8Na2EuZSyz0oE5KfD9cqETWCWqyAmXxwBsSTq/wSPnPJKILkixPopZXNXYRQQQv6t+WN134qoduBbYrxM03OxtjWSI9RE5og6MwCLKxwC86TH8jbtV1B5F2YKnONLjIA2fciAMtbQWgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by CH2PR02MB7013.namprd02.prod.outlook.com
 (2603:10b6:610:5c::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Mon, 12 Dec
 2022 16:55:55 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::caac:2d02:279d:4270]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::caac:2d02:279d:4270%9]) with mapi id 15.20.5880.019; Mon, 12 Dec 2022
 16:55:55 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Markus Armbruster <armbru@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: "imp@bsdimp.com" <imp@bsdimp.com>, "kevans@freebsd.org"
 <kevans@freebsd.org>, "berrange@redhat.com" <berrange@redhat.com>,
 "jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>,
 "kbastian@mail.uni-paderborn.de" <kbastian@mail.uni-paderborn.de>,
 "jasowang@redhat.com" <jasowang@redhat.com>, "michael.roth@amd.com"
 <michael.roth@amd.com>, "kkostiuk@redhat.com" <kkostiuk@redhat.com>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>, "alistair.francis@wdc.com"
 <alistair.francis@wdc.com>, "bin.meng@windriver.com"
 <bin.meng@windriver.com>, "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Subject: RE: [PATCH] include: Don't include qemu/osdep.h
Thread-Topic: [PATCH] include: Don't include qemu/osdep.h
Thread-Index: AQHZDfgFslR1ZGc/50G3a4nahR00Ga5qd+ZA
Date: Mon, 12 Dec 2022 16:55:55 +0000
Message-ID: <SN4PR0201MB8808461347A55B9870BB6C4ADEE29@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20221212070431.306727-1-armbru@redhat.com>
In-Reply-To: <20221212070431.306727-1-armbru@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|CH2PR02MB7013:EE_
x-ms-office365-filtering-correlation-id: fdf68dc7-fffb-4a5c-05b5-08dadc61bc7a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LZBhnAEMbzmQnN7njkhwMqBvl4S8rBn5DFHzQ/LTTfOOSRboIDmsd2uKoBXyeBOomrRXv54LnvVrJH1nQsMxg/LCud7mXHUu+obGZAKIE87jGPzccxK3CtVAODGltsy2PM8BNU1mvokGPT4vfHRlflrVOJQCMY17cKg/cKxf8oShjoP/P/wmoBxFSDA+BvFD4SjW4520vwikeCjllhdWpZ/PCYLraAbWx8pBSO4QuCgn7IXHuYgQ5WcHp80jTzzDIktt+Z8i5BIC3TwoxPAX3B3+KwYJQs86x/W7fltHdost9anpmLameMbPf557j7FpQgQC1zWWMs1cQJ0XPcfK/zTE2tTxLwxMU10JH2BGYt79ppbyCyxI+uWVyA/PpY5gWnRUr3BC7q5CHy2w+btrjgM3l7z697acAarzhBXs3UW8MrL//yjXWXX/zj00oQaqcgpy3JWJtNySC+DS/aHdgeyengZpTwLp/5smXtbRWwT118g6w5cpANm4ZTfwE1Nm8x7XoVqySi7QSqmZot37NGQ+/jGGCcNh5ebTXpfqyBiYVciu+EUVfmJwfBHrbAtt1zvLk2bkfhjA8wntS/B+vkOahHBTzBTYxmLzHIMyXPjvOPREdkpTMDfFpl8jdLQ5l/1hfegYnl8gpRElwec6+K2fpLAARkGy9LhRPZPJ+yR4G9lLuOASF7qDufDCZ132n/l95eycWWKQbp9UmJHBPw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(366004)(396003)(376002)(346002)(136003)(451199015)(66556008)(7416002)(66446008)(8936002)(66946007)(66476007)(76116006)(52536014)(54906003)(316002)(2906002)(33656002)(83380400001)(186003)(110136005)(7696005)(9686003)(38100700002)(86362001)(55016003)(71200400001)(6506007)(53546011)(26005)(122000001)(38070700005)(41300700001)(5660300002)(478600001)(8676002)(4326008)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lFBy5IYDisSktiDTQs4xDEv+2msAvVLOffG2HT3BoPIdokAlxUOmhFfSPXdy?=
 =?us-ascii?Q?bflBvfJPsVq1s7Tpg8O4CULzAhIUpV45fNr01S1h7lOlDuV7IEiB56zqY6ra?=
 =?us-ascii?Q?B5njNFDYck9QGoB7FeJae8DH/5PoXxDZx8GxWSywbpDI8IiMtcZn9GJ8ugxE?=
 =?us-ascii?Q?a/kInK/4vJ0oGX0pPIu2RVWX6U0m8Y3uQ0IOMLUoxzyA5Sl8FPPdYYPtzjMX?=
 =?us-ascii?Q?LaYGeOIVu2wQNu4s6R2BPyLzcI9hawlj2gtOiKb3NRIwawCKCEgu3WkIuCPE?=
 =?us-ascii?Q?jx7dGCeF6FYMjfl2GUmZ1Ac5D8emxXRg2LGhXy0JjaJXa9ywxQ7l7SajXyrA?=
 =?us-ascii?Q?XUzM8Qax87o7SpCU8nyUUiQJ3x00AhZGFhaulsynaQw0qL3Z8N6qZK//XdRB?=
 =?us-ascii?Q?zOBTrmg9p1UT83HQtAuUrDkExIPmNg1h4fu6qQnjVHDWkf4Y4pTU4SiUiTZR?=
 =?us-ascii?Q?lyBwhTahu/krc/xal6Emf5jHQTpAy45dy74gZKXcz9iL1DCkALpd+rP+LirK?=
 =?us-ascii?Q?JeWypxnQuOlb+AVNDBuE3shlChP4MPjMdpYd8j4a3tUpadGytsfyZITjz6xH?=
 =?us-ascii?Q?/tu7UQiYmCBNz9JM/xE0AJRP9NBMGiH9OHfhf9bEt55228GyYM4dUbsatzdl?=
 =?us-ascii?Q?wavInCJ9YhJZZzzskMXLGJJPwIV+4gH1RlkfmelR0Cb3Ze1VZDoumSCIVfS3?=
 =?us-ascii?Q?zmKP5WRd7XQaQCr1WGaLtBJsgCMRbTcdoIKQIZOREH/P+kyslacI4+HZ8s1K?=
 =?us-ascii?Q?6+VWjPDHW9y3686EOJiMUYovh4g8hSZ/SqF5DPpUw/EslT+RqipB+i41biNd?=
 =?us-ascii?Q?9jNG0Tvwmo9lh7g5TKPCuEX3FtKFG0+8tYRoG2/g4Xo95p6FIi0b9vdz+EsF?=
 =?us-ascii?Q?k97nr4J/qMyp7u2J3sGSUP21boGs9W8lCo9MGDEAALr9K8plfomNolvQFtLk?=
 =?us-ascii?Q?BHP1Pg+jEy0DSQa/j1gMhWkUr95SL05hvO8xODmXd1mRVMZMzbFwHrdrBQK+?=
 =?us-ascii?Q?UxVmylLmFvdOenHuK8HV38pxK4pBCMh1TeGkXOJFItv+XjkNvgNYCfD3sVFd?=
 =?us-ascii?Q?rryuuyHrZL1d8XEIkHyupagtbJvNzOj9TETq9PufhiVcMHBR2KfPIvYAjMvM?=
 =?us-ascii?Q?y8rVIjeAbuGb3AZpRXyGY3yTgVcov5deU4U3eRlyeHMs2G0lwmRAP9pcJHAH?=
 =?us-ascii?Q?Qkyr2kkRi9XFmcF6Aj2bPF6TxFdGAzNDT88b8/YyPauR+ALk14b+EAX+ada+?=
 =?us-ascii?Q?8xbd/XcBXrgVm0437hrEHSidax8L20EMLLtjYDy06ucDxhVIqumeb5bX/epD?=
 =?us-ascii?Q?NTr/sXPk658DogbMyOUY8Hbw0HGa3fW+TIH1/TH9uwkBrkldSVHhIcNj6bkC?=
 =?us-ascii?Q?3eIoLmEmBuw1lG/Tvt/76BB/uwUHY+WaJxOQ20SdnkeFeF2qHIVq+bWYxMck?=
 =?us-ascii?Q?ZFG5QKn5yBM44AbWmbXZ6Zt4CjGAVS6cKxN13q3xKJRidkQ08hKxBavHvyEF?=
 =?us-ascii?Q?mpfz6+EN4LZo5riB9aAw8m6i4DzETy4vgcLmdFYkJ7wgiWbiE92YKj3QcGDh?=
 =?us-ascii?Q?DB0R3jJqPfp/W90gVQCrXY/SKVRKeQbUhxNx58qY?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdf68dc7-fffb-4a5c-05b5-08dadc61bc7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2022 16:55:55.8242 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dm3giIILDzqULegbPVcXysDxO5tcC79RwMLpr9mt6Ar3rdiTKbU+ZcULk0agEeeHSUhI42YMUKjEgm4kkulBFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB7013
X-Proofpoint-GUID: NmlL9_j9dhwS6AygmRC3kSLL0FHKZue0
X-Proofpoint-ORIG-GUID: NmlL9_j9dhwS6AygmRC3kSLL0FHKZue0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-12_02,2022-12-12_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0 mlxlogscore=999
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212120153
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
X-List-Received-Date: Mon, 12 Dec 2022 16:56:34 -0000



> -----Original Message-----
> From: Markus Armbruster <armbru@redhat.com>
> Sent: Monday, December 12, 2022 1:05 AM
> To: qemu-devel@nongnu.org
> Cc: imp@bsdimp.com; kevans@freebsd.org; berrange@redhat.com;
> jonathan.cameron@huawei.com; kbastian@mail.uni-paderborn.de;
> jasowang@redhat.com; michael.roth@amd.com; kkostiuk@redhat.com;
> Taylor Simpson <tsimpson@quicinc.com>; palmer@dabbelt.com;
> alistair.francis@wdc.com; bin.meng@windriver.com; qemu-
> riscv@nongnu.org
> Subject: [PATCH] include: Don't include qemu/osdep.h
>=20
> docs/devel/style.rst mandates:
>=20
>     The "qemu/osdep.h" header contains preprocessor macros that affect
>     the behavior of core system headers like <stdint.h>.  It must be
>     the first include so that core system headers included by external
>     libraries get the preprocessor macros that QEMU depends on.
>=20
>     Do not include "qemu/osdep.h" from header files since the .c file
>     will have already included it.
>=20
> A few violations have crept in.  Fix them.
>=20
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  bsd-user/qemu.h                 | 1 -
>  crypto/block-luks-priv.h        | 1 -
>  include/hw/cxl/cxl_host.h       | 1 -
>  include/hw/input/pl050.h        | 1 -
>  include/hw/tricore/triboard.h   | 1 -
>  include/qemu/userfaultfd.h      | 1 -
>  net/vmnet_int.h                 | 1 -
>  qga/cutils.h                    | 1 -
>  target/hexagon/hex_arch_types.h | 1 -
>  target/hexagon/mmvec/macros.h   | 1 -
>  target/riscv/pmu.h              | 1 -
>  qga/cutils.c                    | 3 ++-
>  12 files changed, 2 insertions(+), 12 deletions(-)
>=20
> diff --git a/target/hexagon/hex_arch_types.h
> b/target/hexagon/hex_arch_types.h index 885f68f760..52a7f2b2f3 100644
> --- a/target/hexagon/hex_arch_types.h
> +++ b/target/hexagon/hex_arch_types.h
> @@ -18,7 +18,6 @@
>  #ifndef HEXAGON_HEX_ARCH_TYPES_H
>  #define HEXAGON_HEX_ARCH_TYPES_H
>=20
> -#include "qemu/osdep.h"
>  #include "mmvec/mmvec.h"
>  #include "qemu/int128.h"

Please change the copyright year in this file from "2019-2021" to "2019-202=
2".

Otherwise
Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>

