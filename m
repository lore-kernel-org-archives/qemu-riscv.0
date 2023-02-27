Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWhhZ-0002FH-Sx
	for mharc-qemu-riscv@gnu.org; Mon, 27 Feb 2023 12:54:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pWhhY-0002Dy-At; Mon, 27 Feb 2023 12:54:16 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pWhhW-0003yH-JH; Mon, 27 Feb 2023 12:54:16 -0500
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31RCNUvH006494; Mon, 27 Feb 2023 17:53:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=ufnZVgqVYg7UGR4T60U5q/eRYQc+yR2rbRF4MY1teYQ=;
 b=ZHPCpDXHGmVdGJSBIcAiIsEnWn5Z2XmWFxUncD0My3PovIvEk4LvWspZEq4TQu38sKWV
 bjqcwTWwTnKErCfOgjmx2+6Eba0bPhLzGkxFQzeLFifqagmOUi5V3JJleEz0Gz4ayfa/
 JeyJDGrrDAnbsl05DCm5PuaN7eIdCBMR6lOvwihPRbgbW9Raq4ON8WWRgPfxd09VO51P
 dSwS1VH+hAr4yQlbwQO7Vh/ruaXpNwBLfU0FtS66Hy2viEzSURgOywKRp2Gdv3pDy5PJ
 A701DEU/3V5zDpC+N8TfbowgfIsux8jpynRWSnQCnzx+kV2697ypYUXcVde1nEL6idet uw== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nyajawpss-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Feb 2023 17:53:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dWLgsJzgsHbrXemrhG37dTQuZtkICJB1OUp/Znlm7x5ynNfs2dd6crvQHnZtyR5qE2DzIuxJved712zNsnxAU95o2XaLwoLz+du1eMkgP1dkWDtMG+sYcwOhtl16OAVpavqVRBPNgMpO80fBk2zElTK8y+A5M04368EyIZmS7bf7RwCuawWPi6ZbmwfahLq1ObPD1yyQwbvIQR0FWPNSKYay+ZtBC7IVbxGirEEkxwYbwy+Nk+qCLlIbnXS66E3E5EDlBTCZpou8XbRbTMGJCzp3QL35tWrBGGKS4gEUFcQbmpxXCcjJtFWlA136xc5GYZ2bLHs9sAzcfTF7FYpb1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ufnZVgqVYg7UGR4T60U5q/eRYQc+yR2rbRF4MY1teYQ=;
 b=Xkl5y5vQsTdGc5Wa3P6i+X8pk4HNp1pgnYvlHIM1jaNT6JwClKUIG0fTxD4GEnCZ5AD5HeOi6MjlB/Qvz/klv+gdFZSMYIOKtGAUo8C8grnaSZvhTMDylWX9k6hchDpe6pzPO2WFteXOsZ79Rwn6V7K+SEPDnEeDU8HrjSR3UgwSsoNjzQwMtAtYY3us1AprKpn+6v/pso1TUkgO3F/tIaTfNlSPNWCACAWIwbTvHJRzklZUCgr7Rn5quB0cS/FytvjmAsgmCyROcoHQyjSrHVmntqreMP0RyM6133a5qkuTPxaQjlFJ+3CR1W8AJ6rNQxn3PRN3JIq1FKScS/VU8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by CH0PR02MB7914.namprd02.prod.outlook.com
 (2603:10b6:610:113::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 17:53:48 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::3e12:c026:afdc:beda]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::3e12:c026:afdc:beda%5]) with mapi id 15.20.6134.027; Mon, 27 Feb 2023
 17:53:48 +0000
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
Subject: RE: [PATCH v2 25/76] target/hexagon: Drop tcg_temp_free from C code
Thread-Topic: [PATCH v2 25/76] target/hexagon: Drop tcg_temp_free from C code
Thread-Index: AQHZSmwJiYLzaPOAcEekX/c9T35ud67jEv3w
Date: Mon, 27 Feb 2023 17:53:48 +0000
Message-ID: <SN4PR0201MB8808448B18293AF4202A57C4DEAF9@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-26-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-26-richard.henderson@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|CH0PR02MB7914:EE_
x-ms-office365-filtering-correlation-id: 91b912e4-27e3-4d49-d677-08db18eb9443
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kKf1MiAFMipOivQYccGVPHTE5H2i9m15irAvG9CKQzmz0HlSm6c6RIbgvdMNo8zUO5HfaKiiuVqhmbXMFb3XrXgZFNge7vieyRXQqfxbvhQSO6xwY/fsd2p4tKe+etTToDWt/Jo6uG5mUnNXv8rtye0wUGp7z6IKuhWZsjfLBoLzW8Q8mLwI7mqA6zZ+rinFK5ZuvEnKRvkbYbEFMGjVtyADjwY9/e64mRBH81LQy7e1FAPsQrAxUTTXAlhGNFa3zF+pot2W6JvCedhfSiYVx7uO0/qWpThx6yIzzR6aGCEvaWNf0U0uapDjb00FDh3qshwW/wa8QRH7XIyG8ZXVYWGtWYWxPmCw7dr1NFYtnHhcwZlAyLVeDR/YMRFJxKZJtDjKEKXP6mJ4zWBZv5rYh+k2S+tq1IWEVBCBOz4GSmxJKR2YOVIDwnSzjkeXy+5uvnxJ1Xpj4YAsXkEdcWavexf1ovQ5OTY0zZYOLb8SiGd3v9cPEyBo9mZGQ1LZ57YxEv1bp1Hf0nzRQcuUVg4G4/3Yqc2kPKH30lxRZix+K+FVwSNw4QhIEiwmj3gFCfUsH8Sg31TI5ZBBygRV3sTEHT2Ul9ju5UQme0paIIcDKdhx5G8zp/vn/Rw3Clav77UqLO4QIW591Fgg+uL+XrKwoMkmy180SK5d/S0Toa/AYFJLiNwZmG9x2vNidCxaC849hbpHokL9eQ12g8jbsQ/JrA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(396003)(39860400002)(136003)(366004)(346002)(451199018)(316002)(83380400001)(54906003)(110136005)(33656002)(122000001)(8676002)(64756008)(38100700002)(4326008)(66446008)(55016003)(6506007)(478600001)(186003)(53546011)(26005)(9686003)(7696005)(71200400001)(66476007)(5660300002)(7416002)(66946007)(76116006)(66556008)(4744005)(8936002)(52536014)(86362001)(2906002)(38070700005)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Aa4dqYgDgiP8uMdWnsViNYa+eh/Cgr+kYbSbLqY7CQgRt/x8YZC565L+/gno?=
 =?us-ascii?Q?6ROmufBK0KAkgL8WrR/OOL/8PyK+qbkUReEZWwBfOMxRfy/DOC7seTI2zQyh?=
 =?us-ascii?Q?EpbaUL33PMKtZKnWq2TirWSDnvk2mpEO9NyBSM1YSn1x1T6j4GHDOveMe9M7?=
 =?us-ascii?Q?+cFZPKdTZDJUvnRZNa3KcXZVjYyCxI3RYu+9ISAX4vm9OXrcc5msL6u673cq?=
 =?us-ascii?Q?IJf0ciTrke5XWH3Ehf456HG04T0PDFmxBlHGMzpoLbvuVtk3kbqUeEYBNUOR?=
 =?us-ascii?Q?zeSOWKZ28oB6tI1mTqjKdlOrIk0YPZ73zow3IlmABwGFV1YU+9XAUG6bdLqV?=
 =?us-ascii?Q?3KGyomtlzBj0zoVB9zXw+7DG7vgIH/rpWo029ho9+7V6uL2lmqFv9DpJSxD6?=
 =?us-ascii?Q?q+f042AD0dfz0Tu00pwwIh+kEXmsflLCkfN5kHwzMPcahrg+6/8ldSetkhKm?=
 =?us-ascii?Q?9ENOZwVUWBFgQe3lOIzFEOCkhUvm0dCPpFoM72mlDnePOY+gRT3HY+O0imvZ?=
 =?us-ascii?Q?rtFcYyaqHecg1lnnJxpNmY2iG5ROCbW7Pas8jPkKnygtzNpPgKda+RrOOeCQ?=
 =?us-ascii?Q?OaXhAXtBceKoK9kBKpt6dV+Lt2herlFwwkUIbWNb7rMBPUIHrhyWrOqfVuLt?=
 =?us-ascii?Q?cOKKKXDhtY6rR8kbGV6VBIAv7RvXX7EHinnoxFe33tNcdypAHNeDB4hos/wS?=
 =?us-ascii?Q?Hw5E50DDpnC3O5h8amiFOvkThox0cedj1ZM6HsaMwULIsky+NjKrMnqlf+H2?=
 =?us-ascii?Q?IawdCfqEtKc4IMihDz28dzu24bPuM4wjAadUO3lHqjdxNLlBwIuvI4Xmk/PA?=
 =?us-ascii?Q?nMFXzd34et46jCC0601hR6xi9n5zDHetoN4thYufrjMpVHfBvYzw0Wd1+j0C?=
 =?us-ascii?Q?LjnvJw1bHSCqrybOj6BEmq9aGrbrXltEnv+DmFKLn/XV7wCPIf9R7oi2cVH9?=
 =?us-ascii?Q?BmFmYcF+ZnNol+nIbhg6NRp5vxGIxguIuM6RrVd0s2R1kptBsNPvN5GjgVxe?=
 =?us-ascii?Q?6wXtvfmCyDnzFmKo0u+uWl2hM/MVoa9Z1TCXG3IFFKqsZ0uCYr1o2EisPWhP?=
 =?us-ascii?Q?b+xdcNWbOj7uMq3qfgHpVC+lIksIAulyYZB9IfLQ90AnpS+/uMvD+Xqx2LFI?=
 =?us-ascii?Q?KdlLPcQxs+DyWJewCQeDeVDJhs9X4GUK0wntXrCQp8fLJ4hye2UZnqKAMAs+?=
 =?us-ascii?Q?y5g8u09pcfr0z/bTFLSWj/Ew1gWffGdUKNUpVZ11s9rPDwvyT9eZ8V9k2uoM?=
 =?us-ascii?Q?Mk7oVn0IOXqa9KeqMZ59ieJfFy/lXJneUt+JLU/Yq47HSWoYDkH/Y9rrw0ag?=
 =?us-ascii?Q?BJmcTVXyZTERQ16mM7M0GjwGn9HQt9YJ5R5nXdGf8q9QLAPK+JRDy89FpgCC?=
 =?us-ascii?Q?AvK7xN/11PiNwEP9DvhtEk2xTk6/yPBxd0pRcbne8LWAMXVZvcZD01sb6RKU?=
 =?us-ascii?Q?Xe4bTjYu4MB6j+evPo2tOA3ozIXcfm6SUiU/tidJ8DF2w6zO3tS2nONcnad9?=
 =?us-ascii?Q?WLNq7a2L7/0rOIeYv3Iyyc8f8r2JGeaxeOG/9HYniReH9QZBC41BHUjeHbPE?=
 =?us-ascii?Q?YBtvEoFJO9O/vHhV8eUWybf0EoUxRgEE795HJk8L?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?us-ascii?Q?PMc5poCy7bWCruut96ndhaMnZIlvGKkunbG+l7nCMJr4TDS/Wo+jAF/gEIo4?=
 =?us-ascii?Q?TW2X9M/nfrjmj1j6DeQkrt/wsicBDmkDunaX4t9CVYY7d3lni5hAO0LRNDdB?=
 =?us-ascii?Q?Zgcz5b1Fu76aKxS+w9yOQZFr22lna3nzNSqaSctHaMPzjLJXNMi4Jl4Uq5LY?=
 =?us-ascii?Q?7aE3l4oRaePgbQkN9GAl9e309kzar5O4AWwrtzuRBSAZen+oY7lafW6Kbmca?=
 =?us-ascii?Q?VPCqvmHZKtmQC4Gh1WjRSLhIsPDUHYYVoHe7+k0KW7PqHUq4Z45FGziqWEXd?=
 =?us-ascii?Q?IegnlMLTx2MWc29a7IGQeNb1h08daGIdflNYr4Hp6LxQDgYxrVi4gkMbSKVA?=
 =?us-ascii?Q?KNaX2DI6mXycooEHILkV6Xr/ipWO23/1UeJ9vJtHh9SzpY9O2aRoSxAJuNHg?=
 =?us-ascii?Q?wRpFXRfg23yOhhXyimegaggGLFwjJSO0KZB8B+EyxzGuf8MMMaqOlaMA/a9z?=
 =?us-ascii?Q?YQxrASvs+Bgff1yCCRbDhbi/9X0eSM86jkybaVEmF/bg1se1SQUp7NDY7/HA?=
 =?us-ascii?Q?pqtXFZqGUFx6Am9bEFOU+1QCAnRAiMh67Acfq7vEWUTfo35BTwGCblf9e8B9?=
 =?us-ascii?Q?nTWWXx4BcIW0CoMAwJQAniCXE4JzkJNBxZ6+R+KfyIsXjPacCpo+U6L9uBtJ?=
 =?us-ascii?Q?wpugv+zvYUnv4S78z14WUeCOT7ovTHZCByjkZp52gPGQy0GBM9JN3atCvNpG?=
 =?us-ascii?Q?ctBa0cH7a1hkEA1itGke8CWAOEccVABmcCrP2W5dQbB4dTja6EsINDn7ZMly?=
 =?us-ascii?Q?fldN6uEU0hxHsYi6VFwEHNAMypLjKSku8VB1V/A/OVDDYhhfqHVx7+fB+gh1?=
 =?us-ascii?Q?pmFeZ+wpr/ASJDk8MFewue7njj39gtd5NSkq7ghltWczTRecTEDyC3xEGbb+?=
 =?us-ascii?Q?6iIm/UyQshirq79aPQzXJgk1LxgzDnfRWw4fr1ZWtEaIDIuccSmOJFVtOOli?=
 =?us-ascii?Q?LYdcglcFF7uNKFvDU7cSTa+++s4Fx1MXY+gyFaWmRilRE8RqlhHHUCO1XjqG?=
 =?us-ascii?Q?EsdsjCJMOtcBC91ZvYyGDdSTHQ=3D=3D?=
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91b912e4-27e3-4d49-d677-08db18eb9443
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2023 17:53:48.6287 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NW+6XmJSjenqlLDJssr5hHjvzW/v4EYiFsRTP2001vLowkGjVN4TmN9zjrMBbSpq+TSjEfv9LyDMtkC2h3hHDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR02MB7914
X-Proofpoint-GUID: T2ii9TeGAwNDHd3u-WQBn6ezqLlwrNjL
X-Proofpoint-ORIG-GUID: T2ii9TeGAwNDHd3u-WQBn6ezqLlwrNjL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-27_15,2023-02-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=1
 malwarescore=0 adultscore=0
 bulkscore=0 clxscore=1015 phishscore=0 mlxscore=1 mlxlogscore=225
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=1
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302270140
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
X-List-Received-Date: Mon, 27 Feb 2023 17:54:16 -0000



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
> Subject: [PATCH v2 25/76] target/hexagon: Drop tcg_temp_free from C code
>=20
> Translators are no longer required to free tcg temporaries.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/hexagon/gen_tcg.h     | 29 ------------------
>  target/hexagon/gen_tcg_hvx.h | 15 ----------
>  target/hexagon/macros.h      |  7 -----
>  target/hexagon/genptr.c      | 58 ------------------------------------
>  target/hexagon/translate.c   |  7 -----
>  target/hexagon/README        |  5 ----
>  6 files changed, 121 deletions(-)

Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>


