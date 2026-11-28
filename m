Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A707606A323
	for <qemu-riscv@archiver.kernel.org>; Sat, 28 Nov 2026 16:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=processmission.com header.i=@processmission.com header.a=rsa-sha256 header.s=selector1 header.b=JWUzvU+i
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xXLNK-0007lZ-1c; Sat, 28 Nov 2026 11:34:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.liu@processmission.com>)
 id 1xXLNI-0007lE-6g; Sat, 28 Nov 2026 11:34:08 -0500
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com
 ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.liu@processmission.com>)
 id 1xXLNF-0001TQ-Am; Sat, 28 Nov 2026 11:34:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qZgRLk1LfTo1DqClSTMfTPsLcrXjp+hD2VZMrvvJf/9PKOgdtWYCfYVbpYacUEuZP8j9hFSdg9gNgS+kQ9OIHjRiMBn3F1+P5YN0pIJ1DKSBvL2yGVDhjBHlyDK7o7FdkUHtz6hi4qwRi7QbcRrZnznJpb8AkxhaKsLSM/oqYI9vKjpl/4eD5QLu96/HR2JnYXYutjLNcF6jurglkPvcvVgin1l9Snf5eodXlzGxmHexcum3QMYrLR/4gyu/pLIE60ttQQfHKBOjX9bpZZOUPzLiTQK71ePKMbN0akVY2DV9HddRwzg16KH8KZ7hrUeKpVNxEbB7TAOreGPf1UQ1/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8AJP+yQQX4yWvjZHYaL6OKYPzC5qakgvy0MsZk4Fprs=;
 b=aAD/bRx4+goFVgh7QQpweVfeFTndz+mdsdhqZKgy9XRPqutcyP0QNt9LTUcg5ZNQ0bD8Jlzoy9Jwwy+rA8r4WYeJUPC9gZp+k62xLYqbSVCmrctBIuE6N96Ub3CGFWU8jOmZeqwEn9ohXOY2HiNgUICuvKcq5tqolXxf5Q6TYPuDJ1VXTJPyfmXb2Pwa31n5g5EFflS4tSusgLZ02+dHhvibCad4/4V3ndP7UnVtb2h5XnccB3d0mAXHz+RlC0pQK/cp1Ll1lqDOA9LaaluLLcVtVEy/WVd4fgdoary7wmlELRWzxZYtYuamKREx4z5zC+YXMASfp0mERR5fJnH6wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=processmission.com; dmarc=pass action=none
 header.from=processmission.com; dkim=pass header.d=processmission.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=processmission.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8AJP+yQQX4yWvjZHYaL6OKYPzC5qakgvy0MsZk4Fprs=;
 b=JWUzvU+iwg11QwrT6qxxZCCx75vymSC09AwQEIkIaFyX2g3MuEfplPCvO+Sb8R1eBGGVwaUngNSX0NG+V60+2toLtDCjIMN1v02xZo8zBDcwNlxfe+1fJOgWmIFwIrTqR/ZdCUT+zYuL3bt7A2e1g1aE/lSY4f0BRjBEb8Z3V64G/U7aQhknTvllAB3BncwBEMC2vmWu6L2O0ymg1wGY6qqSxqOXr5XdRszzaU33PDDPXl/QhgrwZiJs2fpGMPZvqK1s8RMi8RY/kHF+Nf3eaAczD3pSY+8UG7zvuaearO4vqSx52VD2jiPGCl3H5NWUivmbH+iUL7btuZopsy8mcg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=processmission.com;
Received: from TYNPR02MB9351.apcprd02.prod.outlook.com (2603:1096:405:3d0::15)
 by KU2PPF7C8EB3041.apcprd02.prod.outlook.com with HTTP via P2P;
 Sat, 28 Nov 2026 16:33:54 +0000
Received: from TYNPR02MB9351.apcprd02.prod.outlook.com
 ([fe80::e5f3:5fb7:3d29:5934]) by TYNPR02MB9351.apcprd02.prod.outlook.com
 ([fe80::e5f3:5fb7:3d29:5934%6]) with mapi id 15.21.0662.007; Sat, 28 Nov 2026
 16:33:54 +0000
From: Chao Liu <chao.liu@processmission.com>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Cc: Chao Liu <chao.liu@processmission.com>, qemu-devel@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-riscv@nongnu.org,
 Jeuk Kim <jeuk20.kim@samsung.com>,
 Alistair Francis <alistair@alistair23.me>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: Re: [PATCH 1/8] target/riscv: Add Spacemit X100 CPU type
Date: Sun, 29 Nov 2026 00:33:35 +0800
Message-ID: <20261128163336.34973-1-chao.liu@processmission.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261124-spacemit_k3-v1-1-e911d6e88542@oss.tenstorrent.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8P220CA0026.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:348::12) To TYNPR02MB9351.apcprd02.prod.outlook.com
 (2603:1096:405:3d0::15)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: TYNPR02MB9351:EE_|KU2PPF7C8EB3041:EE_
X-MS-PublicTrafficType: Email
client-request-id: 0cc19527-d79a-4f36-931b-d77d37333b93
request-id: 95abc466-0857-42ee-42e1-08df4d6d6450
X-MS-Office365-Filtering-Correlation-Id: 95abc466-0857-42ee-42e1-08df4d6d6450
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|366016|376014|23010399003|1800799024|6133799003|22082099003|18002099003|56012099006|260925022911599003|260925021311599003|260925021911599003|10067099003|261026140227099003|261026121527099003|261028144727099003|261102124527099003|261021135927099003|261021121427099003|261022105027099003|261022075727099003|261102123227099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: TrpOu7Gr/yMk9Ul6ZLXTjWIgEYgjpWQPPqdXg0cWU/bB+wfsKYM/yUSGxTf+byCbc21cGuD9mzc2n2gCJdFL41AhhFTarHUIs0DCyvuaMor1m7SnEMYUKatpI10hHlOL05ZKvl9mye95I/k0Fmrj/J3pLyWrXUapUwesyt6Q/JQ/Kaowfw2Xnnw0N4M0gkrrZxF49nUZViqEhFPaEut7r4BLuOmzxjtED9GPeUwvekdKEgQW9+ya7UVe222i1pUSFpbVk4jL23p+CT0xSrdp87Z4eH/X/mtRNNkpCVspPUuRgU1waqEgpTbmB2g97kdUaRMzA0U+7dm9txwT2BppDbBNGn+vDHQUeftcThj5JfbX3C0GjEOwECrU8SQy53JXdRDGqjsN1mSDf5cuEo5U09B1uY6GYxI+sso+cQh9cqWgefBrHPWbvBPUkchg+xzq+JGj2A1s3lS8rjArHJlHDfT0JPaiEBFGwdNu0Y1cKvz+yRwgD+ZcI1U/xeUbTfUHjeg5rV7ZahK3pAfrfeXeR0duxjvdajARKuBkMRNqIZAGFiLqPFOU7B0XWvaHXTBMKz/JO8YYl6ZVP4ytgCpl9jW5TR0l4OGz5nPyCOd9YoZ1OeSYVWWdFwwEk6UxCWjx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(376014)(23010399003)(1800799024)(6133799003)(22082099003)(18002099003)(56012099006)(260925022911599003)(260925021311599003)(260925021911599003)(10067099003)(261026140227099003)(261026121527099003)(261028144727099003)(261102124527099003)(261021135927099003)(261021121427099003)(261022105027099003)(261022075727099003)(261102123227099003)(261009223027099003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Eg2DnYLLnJmXqRHm8fyvcvBrBVvBTA7RwUXiLU1cokuvYsY9dXUAmf5LH2Pr?=
 =?us-ascii?Q?dLiW983OAJehuRDcASiQpNbz+8nC8j8rDKKAnPMUuk7ZFkr5T7uXaJXLEyNn?=
 =?us-ascii?Q?XAZUYJ5tz4mHV6D5B9pGKRvoBU3obcBQQQ9J8OETUYuS68F7ndzn/PsfdEWE?=
 =?us-ascii?Q?MoUJ0Jvbgfx+ZtdDqk4I3adDm2vSMUJxPs8RIexFBTHTC+MtmPRrqaEQrByC?=
 =?us-ascii?Q?GkA4VnT1+O9EoyBcfgMJqwpfidNX/xMmvrO9/WuA4XA2LgayCub2nG3+Ka/h?=
 =?us-ascii?Q?oOmxLaFioPaVq9cC9r1WdLx3HQ8rkruwJvq/8HivbY07RfBu/X6Av7yvTGBG?=
 =?us-ascii?Q?ZDH1RCLHsVBubyFMpVtnJBsm2BqFTPnSIwbgyjwCoIe4CMTiad4WyFPhGEJC?=
 =?us-ascii?Q?Evo24Gxqht/w2Bish3Dg7bJAfN7TNv63OJ203cLg8do8J8TaPc8VkU/ATXic?=
 =?us-ascii?Q?sydKKmIs/95Tfp1FXFe3PObA2JM8jjEROoBBc0C5x3fThp51OJ3TnmrZxLAq?=
 =?us-ascii?Q?DsavfbaExGeWlovXc9uklhpH13XWr8Rua+OlPahFGpUK72jCkfkohk9RNLEd?=
 =?us-ascii?Q?TMGFU1RHd86lapZodHza9jFhAulqg4iVtaTIgaIeQYSYM1TGW4YP+Ji/XJ3j?=
 =?us-ascii?Q?KtvDRc9O2IMH/NP1BCZFnuLZ3WmSQCbdNSgGkoeGZbLE1e8mNsrNeKm+bmVR?=
 =?us-ascii?Q?hNib5BAMXI203MftQMr2A93IOEQ9VMkexzsSXdHin1/FKmSXal4iR7fulg+e?=
 =?us-ascii?Q?+drN243RZsIMMAwR4BHD2YoWpQINqG/1vBorx49SS/fwRGYgqqTy+KeK/Vw1?=
 =?us-ascii?Q?5H5Y7HcVTXR67fVO5Iy7JMFExMsM2ov8H/FRC92Mh5oOFPG0QeYjA/UVDThM?=
 =?us-ascii?Q?zHz/wFaumA1QQswLpoepvBIG5enR/t6PwtsHTTuYDcDXn7ZiA0Wz+FOvh35C?=
 =?us-ascii?Q?XJ/rw3aEmd3xOGJ/DVrqbWiGfaEtPpn5zNxRH27UiS7ZQ5UbsDnEslUCjZd3?=
 =?us-ascii?Q?0IA+dmDJedEhQx5CXpIslCEue6kzeu1SbYLjYUoFR+vebSEnu9aS0sC90kku?=
 =?us-ascii?Q?MkI3YFF9ZPgDDbwDBSSuRiif4Jt9e1V+FYx9lqDcYcf1My3nSxAvk//7gChj?=
 =?us-ascii?Q?E3hMgWHoHABTQMzcow9SBxsNkJwKcoNxYeO0oHw36PaSG9wt1doYsDCw+HcC?=
 =?us-ascii?Q?yX6n+cbWbZSpSuATvl43bZqcjSfrL0+O52G7aPE0g480B+37vh65RYylsvB1?=
 =?us-ascii?Q?kc0TPI5ymvFwRPDfj5fwtXmaeL/sccgChY5FyMap0xVl17zAvnxD85OxDu9g?=
 =?us-ascii?Q?GvVXkc+sMEQpC7FgLuRUSF1BpD6bjTc8tfobE5vnpZDslJe2xgTBAo33S31T?=
 =?us-ascii?Q?zkJNHyWmEdUVtZEHuPNBv199Bvniw7FyDp8chAvFIIy1XQ1cMpFaK2zxd3hs?=
 =?us-ascii?Q?MnI/sH25ertzBElIqCovzXFu7GF4G5Kp6953RO4VNaHN8ajf3Ma6wcqfo68d?=
 =?us-ascii?Q?SpzQZMX3p+IVcoMDJ4OoP4G/URGzxZoeI/sT+SAgk0rY1pObVCiGjZhYj2Ac?=
 =?us-ascii?Q?7xh9SiDa55ov0fN0c2HWoz/z7NYPQo6IZvF1CSDZ/pWVQUshDbJ/3UwOQRnI?=
 =?us-ascii?Q?cqMP/xSDz1uf0RQLIqo2xt3a3LZeWZbkz0W9Jvek6l5TFAgcEO8JCv4yHkbt?=
 =?us-ascii?Q?xqibcafirXR1tkpt4ZuBTYwvhKW1IhFUK8N1j7SQjLgSIkZOIiCiGV82LEoS?=
 =?us-ascii?Q?TI5zNbYczJrz8mj74BKWbTnbrcwCXC0=3D?=
X-OriginatorOrg: processmission.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95abc466-0857-42ee-42e1-08df4d6d6450
X-MS-Exchange-CrossTenant-AuthSource: TYNPR02MB9351.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2026 16:33:54.1680 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0544bf7-9765-4630-ab69-0b266dc2169c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 33kGQf1GaPxkyVJqlgRHOvktjKy9DxmYBc/a4wjS2hUg/gXLpFHTDp1JLnja6IMWD/rZYFbevZ6Y7S9fyot46OX4UI/iHUV+2ppGXzNDggQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KU2PPF7C8EB3041
Received-SPF: pass client-ip=2a01:111:f403:c405::5;
 envelope-from=chao.liu@processmission.com;
 helo=TYPPR03CU001.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 24 Nov 2026 20:37:20 -0600 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com> wrote:

> Adds a CPU definition for the X100 cores present in the Spacemit K3 SoC.
> The CPU definition is based on information from datasheet[1] and Linux
> device tree. The custom CSRs are based on what the Spacemit K3 bootrom,
> U-Boot SPL and OpenSBI write to during the boot process.
> 
> [1] https://github.com/spacemit-com/docs-chip/tree/main/en/key_stone/k3
> 
> Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> ---
>  MAINTAINERS                     |  6 +++
>  target/riscv/cpu-qom.h          |  1 +
>  target/riscv/cpu.c              | 87 +++++++++++++++++++++++++++++++++++++++++
>  target/riscv/cpu_vendorid.h     |  4 ++
>  target/riscv/tcg/csr.h          |  3 ++
>  target/riscv/tcg/meson.build    |  1 +
>  target/riscv/tcg/spacemit_csr.c | 82 ++++++++++++++++++++++++++++++++++++++
>  7 files changed, 184 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 40bf63651c..a9dbb39815 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1854,6 +1854,12 @@ F: hw/*/*sifive*.c
>  F: include/hw/*/*sifive*.h
>  F: tests/functional/riscv64/test_sifive_u.py
>  
> +Spacemit Machines
> +M: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> +L: qemu-riscv@nongnu.org
> +S: Supported
> +F: target/riscv/tcg/spacemit_csr.c
> +
>  Tenstorrent Machines
>  M: Joel Stanley <joel@jms.id.au>
>  M: Nicholas Piggin <npiggin@gmail.com>
> diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
> index 61234842e3..d88a56f514 100644
> --- a/target/riscv/cpu-qom.h
> +++ b/target/riscv/cpu-qom.h
> @@ -56,6 +56,7 @@
>  #define TYPE_RISCV_CPU_THEAD_C908       RISCV_CPU_TYPE_NAME("thead-c908")
>  #define TYPE_RISCV_CPU_THEAD_C908V      RISCV_CPU_TYPE_NAME("thead-c908v")
>  #define TYPE_RISCV_CPU_VEYRON_V1        RISCV_CPU_TYPE_NAME("veyron-v1")
> +#define TYPE_RISCV_CPU_SPACEMIT_X100    RISCV_CPU_TYPE_NAME("spacemit-x100")
>  #define TYPE_RISCV_CPU_TT_ASCALON       RISCV_CPU_TYPE_NAME("tt-ascalon")
>  #define TYPE_RISCV_CPU_XIANGSHAN_NANHU  RISCV_CPU_TYPE_NAME("xiangshan-nanhu")
>  #define TYPE_RISCV_CPU_XIANGSHAN_KMH    RISCV_CPU_TYPE_NAME("xiangshan-kunminghu")
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 15c27f4ce4..9bbe0cf626 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -3616,6 +3616,93 @@ static const TypeInfo riscv_cpu_type_infos[] = {
>          .misa_mxl_max = MXL_RV64,
>      ),
>  
> +    DEFINE_RISCV_CPU(TYPE_RISCV_CPU_SPACEMIT_X100, TYPE_RISCV_VENDOR_CPU,
> +        .misa_mxl_max = MXL_RV64,
> +        .misa_ext = RVG | RVB | RVC | RVS | RVU | RVH | RVV,
> +        .priv_spec = PRIV_VERSION_1_13_0,
> +        .vext_spec = VEXT_VERSION_1_00_0,
> +#if !defined(CONFIG_USER_ONLY)
> +        .cfg.pmp_granularity = 1 << 12,
> +        /*
> +         * QEMU doesn't allow setting this yet
> +         * .cfg.pmp_addr_bits = 38,
> +         */
> +        .custom_csrs = spacemit_csr_list,
> +        .num_triggers = 4,
Maybe we need to add an ext_sdtrig as well?

Thanks,
Chao
> +#endif
> +
> +        /* ISA extensions */
> +        .cfg.mmu = true,
> +        .cfg.vlenb = 256 >> 3,
> +        .cfg.elen = 64,
> +        .cfg.pmp = true,
> +        .cfg.pmp_regions = 16,
> +        .cfg.cbom_blocksize = 64,
> +        .cfg.cbop_blocksize = 64,
> +        .cfg.cboz_blocksize = 64,
> +        .cfg.ext_zic64b = true,
> +        .cfg.ext_zicbom = true,
> +        .cfg.ext_zicbop = true,
> +        .cfg.ext_zicboz = true,
> +        .cfg.ext_zicntr = true,
> +        .cfg.ext_zicond = true,
> +        .cfg.ext_zicsr = true,
> +        .cfg.ext_zifencei = true,
> +        .cfg.ext_zihintntl = true,
> +        .cfg.ext_zihintpause = true,
> +        .cfg.ext_zihpm = true,
> +        .cfg.ext_zimop = true,
> +        .cfg.ext_zawrs = true,
> +        .cfg.ext_zfa = true,
> +        .cfg.ext_zfbfmin = true,
> +        .cfg.ext_zfh = true,
> +        .cfg.ext_zfhmin = true,
> +        .cfg.ext_zcb = true,
> +        .cfg.ext_zcmop = true,
> +        .cfg.ext_zba = true,
> +        .cfg.ext_zbb = true,
> +        .cfg.ext_zbc = true,
> +        .cfg.ext_zbs = true,
> +        .cfg.ext_zkt = true,
> +        .cfg.ext_zvbb = true,
> +        .cfg.ext_zvbc = true,
> +        .cfg.ext_zvfbfmin = true,
> +        .cfg.ext_zvfbfwma = true,
> +        .cfg.ext_zvfh = true,
> +        .cfg.ext_zvfhmin = true,
> +        .cfg.ext_zvkb = true,
> +        .cfg.ext_zvkg = true,
> +        .cfg.ext_zvkn = true,
> +        .cfg.ext_zvknc = true,
> +        .cfg.ext_zvkned = true,
> +        .cfg.ext_zvkng = true,
> +        .cfg.ext_zvknha = true,
> +        .cfg.ext_zvknhb = true,
> +        .cfg.ext_zvks = true,
> +        .cfg.ext_zvksc = true,
> +        .cfg.ext_zvksed = true,
> +        .cfg.ext_zvksg = true,
> +        .cfg.ext_zvksh = true,
> +        .cfg.ext_zvkt = true,
> +        .cfg.ext_smaia = true,
> +        .cfg.ext_smcntrpmf = true,
> +        .cfg.ext_smstateen = true,
> +        .cfg.ext_ssaia = true,
> +        .cfg.ext_sscofpmf = true,
> +        .cfg.ext_sstc = true,
> +        .cfg.ext_svinval = true,
> +        .cfg.ext_svnapot = true,
> +        .cfg.ext_svpbmt = true,
> +
> +        .cfg.mvendorid = SPACEMIT_VENDOR_ID,
> +        .cfg.marchid = SPACEMIT_X100_MARCHID,
> +        .cfg.mimpid = SPACEMIT_X100_MIMPID,
> +
> +        .cfg.pmu_mask = MAKE_64BIT_MASK(3, 16),
> +
> +        .cfg.max_satp_mode = VM_1_10_SV39,
> +    ),
> +
>      DEFINE_RISCV_CPU(TYPE_RISCV_CPU_THEAD_C906, TYPE_RISCV_VENDOR_CPU,
>          .misa_mxl_max = MXL_RV64,
>          .misa_ext = RVG | RVC | RVS | RVU,
> diff --git a/target/riscv/cpu_vendorid.h b/target/riscv/cpu_vendorid.h
> index 751a13aace..885604604d 100644
> --- a/target/riscv/cpu_vendorid.h
> +++ b/target/riscv/cpu_vendorid.h
> @@ -10,4 +10,8 @@
>  
>  #define TENSTORRENT_VENDOR_ID   0x7a1
>  
> +#define SPACEMIT_VENDOR_ID      0x710
> +#define SPACEMIT_X100_MARCHID   0x8000000058000002
> +#define SPACEMIT_X100_MIMPID    0x33d8a600
> +
>  #endif /*  TARGET_RISCV_CPU_VENDORID_H */
> diff --git a/target/riscv/tcg/csr.h b/target/riscv/tcg/csr.h
> index 53ba3b4a4d..e2515a9e4c 100644
> --- a/target/riscv/tcg/csr.h
> +++ b/target/riscv/tcg/csr.h
> @@ -81,6 +81,9 @@ bool riscv_csr_is_vpu(int csrno);
>  void riscv_get_csr_ops(int csrno, riscv_csr_operations *ops);
>  void riscv_set_csr_ops(int csrno, const riscv_csr_operations *ops);
>  
> +/* In spacemit_csr.c */
> +extern const RISCVCSR spacemit_csr_list[];
> +
>  /* In th_csr.c */
>  extern const RISCVCSR th_csr_list[];
>  
> diff --git a/target/riscv/tcg/meson.build b/target/riscv/tcg/meson.build
> index 86805b30cb..3d7fc5fcc7 100644
> --- a/target/riscv/tcg/meson.build
> +++ b/target/riscv/tcg/meson.build
> @@ -24,6 +24,7 @@ riscv_system_ss.add(files(
>    'mips_csr.c',
>    'pmp.c',
>    'pmu.c',
> +  'spacemit_csr.c',
>    'th_csr.c',
>  ))
>  
> diff --git a/target/riscv/tcg/spacemit_csr.c b/target/riscv/tcg/spacemit_csr.c
> new file mode 100644
> index 0000000000..8f7a9b9418
> --- /dev/null
> +++ b/target/riscv/tcg/spacemit_csr.c
> @@ -0,0 +1,82 @@
> +/*
> + * Spacemit X100 CSRs
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * Copyright 2026 Anirudh Srinivasan
> + */
> +
> +#include "qemu/osdep.h"
> +#include "cpu.h"
> +#include "cpu_vendorid.h"
> +#include "csr.h"
> +
> +#define CSR_SPACEMIT_TCMCFG   0x5db
> +#define CSR_SPACEMIT_MSETUP   0x7c0
> +#define CSR_SPACEMIT_MHCR     0x7c1
> +#define CSR_SPACEMIT_MHCOR    0x7c2
> +#define CSR_SPACEMIT_PMACFG0  0x7de
> +#define CSR_SPACEMIT_PMAADDR8 0x7e8
> +#define CSR_SPACEMIT_ML2SETUP 0x7f0
> +#define CSR_SPACEMIT_ML2HINT  0x7f7
> +#define CSR_SPACEMIT_MVMD1    0xbf9
> +
> +static RISCVException read_zero(CPURISCVState *env, int csrno,
> +                                target_ulong *val)
> +{
> +    *val = 0;
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException write_none(CPURISCVState *env, int csrno,
> +                                 target_ulong val, uintptr_t ra)
> +{
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static RISCVException any_x100(CPURISCVState *env, int csrno)
> +{
> +    if (env_archcpu(env)->cfg.mimpid != SPACEMIT_X100_MIMPID ||
> +      env_archcpu(env)->cfg.marchid != SPACEMIT_X100_MARCHID) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }
> +
> +    return RISCV_EXCP_NONE;
> +}
> +
> +static bool test_spacemit_mvendorid(RISCVCPU *cpu)
> +{
> +    return cpu->cfg.mvendorid == SPACEMIT_VENDOR_ID;
> +}
> +
> +const RISCVCSR spacemit_csr_list[] = {
> +    { .csrno = CSR_SPACEMIT_TCMCFG,
> +      .insertion_test = test_spacemit_mvendorid,
> +      .csr_ops = { "tcmcfg", any_x100, read_zero, write_none } },
> +    { .csrno = CSR_SPACEMIT_MSETUP,
> +      .insertion_test = test_spacemit_mvendorid,
> +      .csr_ops = { "msetup", any_x100, read_zero, write_none } },
> +    { .csrno = CSR_SPACEMIT_MHCR,
> +      .insertion_test = test_spacemit_mvendorid,
> +      .csr_ops = { "mhcr", any_x100, read_zero, write_none } },
> +    { .csrno = CSR_SPACEMIT_MHCOR,
> +      .insertion_test = test_spacemit_mvendorid,
> +      .csr_ops = { "mhcor", any_x100, read_zero, write_none } },
> +    { .csrno = CSR_SPACEMIT_PMACFG0,
> +      .insertion_test = test_spacemit_mvendorid,
> +      .csr_ops = { "pmacfg0", any_x100, read_zero, write_none } },
> +    { .csrno = CSR_SPACEMIT_PMAADDR8,
> +      .insertion_test = test_spacemit_mvendorid,
> +      .csr_ops = { "pmaaddr8", any_x100, read_zero, write_none } },
> +    { .csrno = CSR_SPACEMIT_ML2SETUP,
> +      .insertion_test = test_spacemit_mvendorid,
> +      .csr_ops = { "ml2setup", any_x100, read_zero, write_none } },
> +    { .csrno = CSR_SPACEMIT_ML2HINT,
> +      .insertion_test = test_spacemit_mvendorid,
> +      .csr_ops = { "ml2hint", any_x100, read_zero, write_none } },
> +    { .csrno = CSR_SPACEMIT_MVMD1,
> +      .insertion_test = test_spacemit_mvendorid,
> +      .csr_ops = { "mvmd1", any_x100, read_zero, write_none } },
> +    { }
> +};
> 
> -- 
> 2.43.0
> 
> 
> 

Sent using hkml (https://github.com/sjp38/hackermail)

