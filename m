Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B04A606A323
	for <qemu-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 13:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ilj0TYSf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WiBhsR/F
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xQP84-0007kn-38; Mon, 09 Nov 2026 08:09:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQP81-0007kF-9y
 for qemu-riscv@nongnu.org; Mon, 09 Nov 2026 08:09:41 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQP7y-0002B0-7S
 for qemu-riscv@nongnu.org; Mon, 09 Nov 2026 08:09:40 -0500
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A9Aug8H034222
 for <qemu-riscv@nongnu.org>; Mon, 9 Nov 2026 13:09:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 mWLN6obTMtnFC76B2TIOQRwG3bz7kYSQfu/y3ryaxZg=; b=Ilj0TYSfItUjs7ZT
 w3yrvbAi3KjBsGLMmGMzlRIVbZI/ywBpXgiqN+LYxjboEDyp9hxEZQUUFsRzerQb
 cmbA7/cFE9UpquINZ+ahJwzaNW/aT2Fu3621SdtX8hTdcWcaqMaDhcQMF1NGaTos
 4UGnx+VqcEEWcj03vx8ICNeP9iyKh9gloSip5AUHH4pQDxRA0Pv/dcHDBg7CoqO0
 GkfHX+GAHURth4okVte/c8Ru3iBnBTg4iHjjnN4TKFtACJDPEjbvMvmdk9RikueG
 1bnTzi7davDtbJ0GzuaUXOVN7hHHfIpT63G083ZDx/2rVMLcyiuD2X7JVTCEwhz8
 /J56UQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucr5rebj-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 09 Nov 2026 13:09:36 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id
 ada2fe7eead31-7d2d5cc693fso125146137.3
 for <qemu-riscv@nongnu.org>; Mon, 09 Nov 2026 05:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794229775; x=1794834575; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=mWLN6obTMtnFC76B2TIOQRwG3bz7kYSQfu/y3ryaxZg=;
 b=WiBhsR/FUddgEd0QIjUXG2+PS7r22xmJQlL+zqt6jh8Pxq1Zib5tt3mDiVAyWmZKZ+
 xAkeQJKLgWxfRjKzZEqT+m4C3Tpcf4U1ddLxiKIG846rcn/HzJRzvob++02XAoRMEwaJ
 O3Mey9IIZiQEO7Vk8/NffBBIiYzOXi9yL7xOG9t5aKAgUbhHzE2WMmBsrptGvFayfhvh
 MTfdbReSFv0rYDO3/OnELa0tggSF0dCYC1KCX2qod/e0FzZgnkEylijZJOH0MHeKy3Dp
 8+fTGBZplLVvY9fArk32mOCjGhIICkezYl/8/5PwUZrNWo+M/E+ExEaLCv71Kz/3r44L
 0Btg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794229775; x=1794834575;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=mWLN6obTMtnFC76B2TIOQRwG3bz7kYSQfu/y3ryaxZg=;
 b=I0k8Ai00PD94LUhfYFu9JGhJ0GYYEHCn5W9aOWqagiPTUZQPh/DISGpCJOAc/mttva
 I66QovzI6CZhW712cFg206khGf/qHi5MMMgR3qKdUl5DyNf3i7WOe1smFdbsqJlacl3k
 1NO4jk0LxWbRsVRY2vEzDhDSn08zysuOetFEaVnAv2T+RWg3NQSeu+GvcUwBmPzh5Jhi
 Il82mTT4bOYarqmWwY2eLI6AYJdQu5L/Jdym46eBh/24yOvvAquIKd3p4jN2maqQiJWk
 YXgiJTFNkRKN9pFBLvBoHTpx2my+KfHgbtap96N9YkePe9qXwDpqSi23XnMQbvkAwXLQ
 b6Hg==
X-Gm-Message-State: APuU4Z9GkVyu1RnWb4zTc14fwTvumtFncUkyR2d2h/88dXhgdChPtpaH
 5SBYEVmvnFRGu6GCNLNRBP3WGoKYPTuQq05ZkOVAlcNZR34XJZGwhopJKsmgxx/f1Xdh2ViB/p7
 6Os12hRabdjJ0n20cYBiMRj/5fFYznINhMNL7VJmhIrqTsS2TWKUY/k9/rg==
X-Gm-Gg: AYBFou0jK8tDAexbDFyd8roqiSSSaWl6xZ77PuOP4/rmBX0Snvr55PiK5FELUCJ1jBE
 GXLgrwHB3+JuDgi+d+XB4TuNbENl2Zl5NsawgDnoe9e7JWyB++c6WwF1fhTSW3U8pPhA+fXG7ec
 46MBgcFvs8p+OJ9XXUSGRKKlbRHNFjXsJ58YEEwjCfZVY0UprZBp6MKX99hSZaehP7LszUXYlA3
 53soSdny8fTdgiusDwJMXlf2MY/5i2MoswL+iKShXlG1SBmBEJ8nOPikzou4NWO1LPCFlMAwmkt
 jDbo2QGxmab1VEQHrRx+EcekHsu8CuEO5hMwWd4xLZmps3kSWWWd+15iwOIvuPFeQiL6mz4rZAK
 AE346nGXTSUvFdtMtyOnDYN1pdhzQFJq+EsLvs7/71gmiBWxBwKg/IsHKdv7EVHgRzJFhe9VLMR
 iU5hdJ5RGW
X-Received: by 2002:a05:6102:4243:b0:7d2:76af:fcce with SMTP id
 ada2fe7eead31-7d2daf13da1mr883789137.9.1794229775323; 
 Mon, 09 Nov 2026 05:09:35 -0800 (PST)
X-Received: by 2002:a05:6102:4243:b0:7d2:76af:fcce with SMTP id
 ada2fe7eead31-7d2daf13da1mr883772137.9.1794229774711; 
 Mon, 09 Nov 2026 05:09:34 -0800 (PST)
Received: from [192.168.68.100] ([152.234.124.231])
 by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-99c02aa78e9sm3820985241.12.2026.11.09.05.09.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2026 05:09:34 -0800 (PST)
Message-ID: <c9bc3a82-61ea-491a-ab1f-0e09e6d55a54@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 10:09:29 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/6] hw/riscv: implement CBQRI bandwidth controller
To: Drew Fustini <fustini@kernel.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Sunil V L <sunilvl@oss.qualcomm.com>,
 Anup Patel <anup.patel@oss.qualcomm.com>, Weiwei Li <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Nicolas Pitre <npitre@baylibre.com>,
 =?UTF-8?Q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>,
 Atish Patra <atish.patra@linux.dev>,
 =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <radim.krcmar@oss.qualcomm.com>,
 yunhui cui <cuiyunhui@bytedance.com>,
 Chen Pei <cp0613@linux.alibaba.com>, guo.wenjia23@zte.com.cn,
 liu.qingtao2@zte.com.cn
References: <20261101-riscv-ssqosid-cbqri-v7-0-92d1aae43e48@kernel.org>
 <20261101-riscv-ssqosid-cbqri-v7-4-92d1aae43e48@kernel.org>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261101-riscv-ssqosid-cbqri-v7-4-92d1aae43e48@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1MiBTYWx0ZWRfXy9dsJd14lpUg
 TveHnCbOnTkyDCBbyCIVrpO5oeUyO12mEJp5CGumiXXtDnIgGvbbK92Ix6+rbAmnDadv+3xG8xX
 Y+kB2TFKbB9uicGTo/5c9fmdtKt56C0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1MiBTYWx0ZWRfX7K8OF0qXTDnI
 TTEEyd9IRWA5t8nbBh4TBJGoCsqPjKTMROKdAtY9lBno2uesq8KRGpj62NwghSut2PWgGT13NF8
 3AKMhOMWo0ee4elMZ6wpRKwJbXd2qJFLj3fqiQ4DSS6jhgQiW+WQ2c/UAzbi14rb8aO+/8iwdYz
 1kCGRo5RFb4aHxCjuVIbjfl92k8RG1VVtVAZ2tkZXtPhmsk4ruUJAW0/lbJ2jJeTQhjFzos1YPA
 i08z44fwLD0UkeuOfsSRzM5DAGZU2LoyvxEp9F9eqWz3CDiAuf+ClOqw1+QpAwbTvJRjOQ+bh3F
 YplXO7xdooUGrBQs6fzAOW1FqBNrZQjMLW13B6HWzWLmjFnBPl2lPA+cP2jifSSXifVTxlEztHd
 4qd9WvyJBQufP6x391INfUHIr8CfCjxsRqa2QqM54s4MAtIcEZgCs6nFy2u04aJ/ihSNXt2zdWH
 932yKGMSXkuYICgBuqQ==
X-Authority-Analysis: v=2.4 cv=ErlHPicA c=1 sm=1 tr=0 ts=6af1c610 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=8elE1k/PHQNyZ14TNTodlQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=V1jnuoLLAAAA:20 a=IpJZQVW2AAAA:8 a=VwQbUJbxAAAA:8 a=69wJf7TsAAAA:8
 a=qEgIt2FdfcJO6cqLVd8A:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
 a=IawgGOuG5U0WyFbmm1f5:22 a=Fg1AiH1G6rFz08G2ETeA:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: r_7BGaL9iI6LT87esFXMZrvXNRg2aZRZ
X-Proofpoint-GUID: r_7BGaL9iI6LT87esFXMZrvXNRg2aZRZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090052
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/1/2026 5:25 PM, Drew Fustini wrote:
> From: Nicolas Pitre <npitre@baylibre.com>
> 
> Implement a bandwidth controller according to the Capacity and Bandwidth
> QoS Register Interface (CBQRI) which supports these capabilities:
> 
>    - Number of access types: 2 (code and data)
>    - Usage monitoring operations: CONFIG_EVENT, READ_COUNTER
>    - Event IDs supported: None, Total read/write byte count, Total
>                           read byte count, Total write byte count
>    - Bandwidth allocation operations: CONFIG_LIMIT, READ_LIMIT
> 
> The controller gives the Linux resctrl support for CBQRI a device to
> configure and read back bandwidth limits per RCID on the virt machine.
> Only the register interface is modeled. The configured limits are not
> enforced and the monitoring counters are always marked INVALID because
> QEMU does not model memory bandwidth usage.
> 
> Link: https://github.com/riscv-non-isa/riscv-cbqri/releases/tag/v1.0
> Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
> [fustini: add fields introduced in the ratified spec: rpfx and p]
> Signed-off-by: Drew Fustini <fustini@kernel.org>
> ---

LGTM overall.  A few comments:

>   MAINTAINERS                |   1 +
>   hw/riscv/cbqri_bandwidth.c | 650 +++++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 651 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f230cdbbe1b8..6d68b839febc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -408,6 +408,7 @@ M: Nicolas Pitre <npitre@baylibre.com>
>   M: Drew Fustini <fustini@kernel.org>
>   L: qemu-riscv@nongnu.org
>   S: Supported
> +F: hw/riscv/cbqri_bandwidth.c
>   F: hw/riscv/cbqri_capacity.c
>   F: include/hw/riscv/cbqri.h
>   
> diff --git a/hw/riscv/cbqri_bandwidth.c b/hw/riscv/cbqri_bandwidth.c
> new file mode 100644
> index 000000000000..57f8897252bd
> --- /dev/null
> +++ b/hw/riscv/cbqri_bandwidth.c
> @@ -0,0 +1,650 @@
> +/*
> + * RISC-V Capacity and Bandwidth QoS Register Interface
> + * URL: https://github.com/riscv-non-isa/riscv-cbqri/releases/tag/v1.0
> + *
> + * Copyright (c) 2023 BayLibre SAS
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * This file contains the Bandwidth-controller QoS Register Interface.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "qemu/error-report.h"
> +#include "qemu/log.h"
> +#include "qemu/module.h"
> +#include "hw/core/qdev-properties.h"
> +#include "hw/core/sysbus.h"
> +#include "migration/vmstate.h"
> +#include "target/riscv/cpu.h"
> +#include "hw/riscv/cbqri.h"
> +
> +/* Encodings of `AT` field */
> +enum {
> +    BC_AT_DATA = 0,
> +    BC_AT_CODE = 1,
> +    BC_NB_ATS,
> +};
> +
> +/* Capabilities */
> +REG64(BC_CAPABILITIES, 0);
> +FIELD(BC_CAPABILITIES, VER, 0, 8);
> +FIELD(BC_CAPABILITIES, VER_MINOR, 0, 4);
> +FIELD(BC_CAPABILITIES, VER_MAJOR, 4, 4);
> +FIELD(BC_CAPABILITIES, NBWBLKS, 8, 16);
> +FIELD(BC_CAPABILITIES, RPFX, 24, 1);
> +FIELD(BC_CAPABILITIES, P, 25, 4);
> +FIELD(BC_CAPABILITIES, MRBWB, 32, 16);
> +
> +/* Usage monitoring control */
> +REG64(BC_MON_CTL, 8);
> +FIELD(BC_MON_CTL, OP, 0, 5);
> +FIELD(BC_MON_CTL, AT, 5, 3);
> +FIELD(BC_MON_CTL, MCID, 8, 12);
> +FIELD(BC_MON_CTL, EVT_ID, 20, 8);
> +FIELD(BC_MON_CTL, ATV, 28, 1);
> +FIELD(BC_MON_CTL, STATUS, 32, 7);
> +FIELD(BC_MON_CTL, BUSY, 39, 1);
> +
> +/* Usage monitoring operations */
> +enum {
> +    BC_MON_OP_CONFIG_EVENT = 1,
> +    BC_MON_OP_READ_COUNTER = 2,
> +};
> +
> +/* Bandwidth monitoring event ID */
> +enum {
> +    BC_EVT_ID_None = 0,
> +    BC_EVT_ID_RDWR_count = 1,
> +    BC_EVT_ID_RDONLY_count = 2,
> +    BC_EVT_ID_WRONLY_count = 3,
> +};
> +
> +/* BC_MON_CTL.STATUS field encodings */
> +enum {
> +    BC_MON_CTL_STATUS_SUCCESS = 1,
> +    BC_MON_CTL_STATUS_INVAL_OP = 2,
> +    BC_MON_CTL_STATUS_INVAL_MCID = 3,
> +    BC_MON_CTL_STATUS_INVAL_EVT_ID = 4,
> +    BC_MON_CTL_STATUS_INVAL_AT = 5,
> +};
> +
> +/* Monitoring counter value */
> +REG64(BC_MON_CTR_VAL, 16);
> +FIELD(BC_MON_CTR_VAL, CTR, 0, 62);
> +FIELD(BC_MON_CTR_VAL, INVALID, 62, 1);
> +FIELD(BC_MON_CTR_VAL, OVF, 63, 1);
> +
> +/* Bandwidth Allocation control */
> +REG64(BC_ALLOC_CTL, 24);
> +FIELD(BC_ALLOC_CTL, OP, 0, 5);
> +FIELD(BC_ALLOC_CTL, AT, 5, 3);
> +FIELD(BC_ALLOC_CTL, RCID, 8, 12);
> +FIELD(BC_ALLOC_CTL, STATUS, 32, 7);
> +FIELD(BC_ALLOC_CTL, BUSY, 39, 1);
> +
> +/* Bandwidth allocation operations */
> +enum {
> +    BC_ALLOC_OP_CONFIG_LIMIT = 1,
> +    BC_ALLOC_OP_READ_LIMIT = 2,
> +};
> +
> +/* BC_ALLOC_CTL.STATUS field encodings */
> +enum {
> +    BC_ALLOC_STATUS_SUCCESS = 1,
> +    BC_ALLOC_STATUS_INVAL_OP = 2,
> +    BC_ALLOC_STATUS_INVAL_RCID = 3,
> +    BC_ALLOC_STATUS_INVAL_AT = 4,
> +    BC_ALLOC_STATUS_INVAL_BLKS = 5,
> +};
> +
> +/* Bandwidth allocation */
> +REG64(BC_BW_ALLOC, 32);
> +FIELD(BC_BW_ALLOC, Rbwb, 0, 16);
> +FIELD(BC_BW_ALLOC, Mweight, 20, 8);
> +FIELD(BC_BW_ALLOC, sharedAT, 28, 3);
> +FIELD(BC_BW_ALLOC, useShared, 31, 1);
> +
> +
> +typedef struct BandwidthAllocation {
> +    uint32_t Rbwb:16;
> +    uint32_t Mweight:8;
> +    uint32_t sharedAT:3;
> +    bool useShared:1;
> +} BandwidthAllocation;
> +
> +typedef struct RiscvCbqriBandwidthState {
> +    SysBusDevice parent_obj;
> +    MemoryRegion mmio;
> +
> +    /* cached value of some registers */
> +    uint64_t bc_mon_ctl;
> +    uint64_t bc_mon_ctr_val;
> +    uint64_t bc_alloc_ctl;
> +
> +    MonitorCounter *mon_counters;
> +    BandwidthAllocation *bw_allocations;
> +
> +    /* properties */
> +
> +    uint64_t mmio_base;
> +    uint16_t nb_mcids;
> +    uint16_t nb_rcids;
> +
> +    uint16_t nbwblks;
> +    uint16_t mrbwb;
> +
> +    bool supports_at_code;
> +
> +    bool supports_alloc_op_config_limit;
> +    bool supports_alloc_op_read_limit;
> +
> +    bool supports_mon_op_config_event;
> +    bool supports_mon_op_read_counter;
> +
> +    bool supports_mon_evt_id_none;
> +    bool supports_mon_evt_id_rdwr_count;
> +    bool supports_mon_evt_id_rdonly_count;
> +    bool supports_mon_evt_id_wronly_count;
> +} RiscvCbqriBandwidthState;
> +

I believe BandwidthAllocation could be renamed to RiscvCbrqiBandwidthAllocation for
naming consistency.


> +#define RISCV_CBQRI_BC(obj) \
> +    OBJECT_CHECK(RiscvCbqriBandwidthState, (obj), TYPE_RISCV_CBQRI_BC)
> +
> +/*
> + * All bandwidth allocation records are contiguous to simplify
> + * allocation. The first one is used to hold the BC_BW_ALLOC register
> + * content, followed by respective records for each AT per RCID.
> + *
> + * Records are indexed by the AT encoding, so each RCID has one record
> + * per AT value whether or not the controller supports the code access
> + * type. is_valid_at() rejects an unsupported AT before a record is
> + * selected.
> + */
> +static unsigned int bw_alloc_index(uint32_t rcid, uint32_t at)
> +{
> +    assert(at < BC_NB_ATS);

Please use g_assert() instead of assert().

> +
> +    return 1 + rcid * BC_NB_ATS + at;
> +}
> +
> +static BandwidthAllocation *get_bw_alloc(RiscvCbqriBandwidthState *bc,
> +                                         uint32_t rcid, uint32_t at)
> +{
> +    return &bc->bw_allocations[bw_alloc_index(rcid, at)];
> +}
> +


[...]


> +
> +static void riscv_cbqri_bc_reset(DeviceState *dev)
> +{
> +    RiscvCbqriBandwidthState *bc = RISCV_CBQRI_BC(dev);
> +
> +    bc->bc_mon_ctl = 0;
> +    bc->bc_alloc_ctl = 0;
> +}
> +
> +static const Property riscv_cbqri_bc_properties[] = {
> +    DEFINE_PROP_UINT64("mmio_base", RiscvCbqriBandwidthState, mmio_base, 0),
> +
> +    DEFINE_PROP_UINT16("max_mcids", RiscvCbqriBandwidthState, nb_mcids, 256),
> +    DEFINE_PROP_UINT16("max_rcids", RiscvCbqriBandwidthState, nb_rcids, 64),
> +    DEFINE_PROP_UINT16("nbwblks", RiscvCbqriBandwidthState, nbwblks, 1024),
> +    DEFINE_PROP_UINT16("mrbwb", RiscvCbqriBandwidthState, mrbwb, 819),
> +
> +    DEFINE_PROP_BOOL("at_code", RiscvCbqriBandwidthState,
> +                     supports_at_code, true),
> +
> +    DEFINE_PROP_BOOL("alloc_op_config_limit", RiscvCbqriBandwidthState,
> +                     supports_alloc_op_config_limit, true),
> +    DEFINE_PROP_BOOL("alloc_op_read_limit", RiscvCbqriBandwidthState,
> +                     supports_alloc_op_read_limit, true),
> +
> +    DEFINE_PROP_BOOL("mon_op_config_event", RiscvCbqriBandwidthState,
> +                     supports_mon_op_config_event, true),
> +    DEFINE_PROP_BOOL("mon_op_read_counter", RiscvCbqriBandwidthState,
> +                     supports_mon_op_read_counter, true),
> +
> +    DEFINE_PROP_BOOL("mon_evt_id_none", RiscvCbqriBandwidthState,
> +                     supports_mon_evt_id_none, true),
> +    DEFINE_PROP_BOOL("mon_evt_id_rdwr_count", RiscvCbqriBandwidthState,
> +                     supports_mon_evt_id_rdwr_count, true),
> +    DEFINE_PROP_BOOL("mon_evt_id_rdonly_count", RiscvCbqriBandwidthState,
> +                     supports_mon_evt_id_rdonly_count, true),
> +    DEFINE_PROP_BOOL("mon_evt_id_wronly_count", RiscvCbqriBandwidthState,
> +                     supports_mon_evt_id_wronly_count, true),
> +};
> +
> +static const VMStateDescription vmstate_riscv_cbqri_bc = {
> +    .name = "riscv-cbqri-bandwidth",
> +    .unmigratable = 1,
> +};
> +
> +static void riscv_cbqri_bc_class_init(ObjectClass *klass, const void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    dc->realize = riscv_cbqri_bc_realize;
> +    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
> +    dc->desc = "RISC-V CBQRI Bandwidth Controller";
> +    device_class_set_props(dc, riscv_cbqri_bc_properties);
> +    dc->legacy_reset = riscv_cbqri_bc_reset;

We're moving away from legacy_reset for new devices.  We're now declaring a Resettable
interface and setting reset phases.

For this device a simple way of doing it is to slightly change th reset callback params:


static void riscv_cbqri_bc_reset(Object *obj, ResetType type)

And then during class_init:

     ResettableClass *rc = RESETTABLE_CLASS(klass);

     rc->phases.hold = riscv_cbqri_bc_reset;



> +    dc->vmsd = &vmstate_riscv_cbqri_bc;
> +    dc->user_creatable = true;
> +}
> +
> +static const TypeInfo riscv_cbqri_bc_info = {
> +    .name          = TYPE_RISCV_CBQRI_BC,
> +    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(RiscvCbqriBandwidthState),
> +    .class_init    = riscv_cbqri_bc_class_init,
> +};
> +
> +static void riscv_cbqri_bc_register_types(void)
> +{
> +    type_register_static(&riscv_cbqri_bc_info);
> +}
> +
> +DeviceState *riscv_cbqri_bc_create(hwaddr addr,
> +                                   const RiscvCbqriBandwidthCaps *caps)
> +{
> +    DeviceState *dev = qdev_new(TYPE_RISCV_CBQRI_BC);
> +
> +    qdev_prop_set_uint64(dev, "mmio_base", addr);
> +    qdev_prop_set_uint16(dev, "max_mcids", caps->nb_mcids);
> +    qdev_prop_set_uint16(dev, "max_rcids", caps->nb_rcids);
> +    qdev_prop_set_uint16(dev, "nbwblks", caps->nbwblks);
> +    qdev_prop_set_uint16(dev, "mrbwb", caps->mrbwb);
> +
> +    qdev_prop_set_bit(dev, "at_code",
> +                      caps->supports_at_code);
> +    qdev_prop_set_bit(dev, "alloc_op_config_limit",
> +                      caps->supports_alloc_op_config_limit);
> +    qdev_prop_set_bit(dev, "alloc_op_read_limit",
> +                      caps->supports_alloc_op_read_limit);
> +    qdev_prop_set_bit(dev, "mon_op_config_event",
> +                      caps->supports_mon_op_config_event);
> +    qdev_prop_set_bit(dev, "mon_op_read_counter",
> +                      caps->supports_mon_op_read_counter);
> +    qdev_prop_set_bit(dev, "mon_evt_id_none",
> +                      caps->supports_mon_evt_id_none);
> +    qdev_prop_set_bit(dev, "mon_evt_id_rdwr_count",
> +                      caps->supports_mon_evt_id_rdwr_count);
> +    qdev_prop_set_bit(dev, "mon_evt_id_rdonly_count",
> +                      caps->supports_mon_evt_id_rdonly_count);
> +    qdev_prop_set_bit(dev, "mon_evt_id_wronly_count",
> +                      caps->supports_mon_evt_id_wronly_count);
> +
> +    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> +
> +    return dev;
> +}

We don't have any callers for riscv_cbqri_bc_create() in the series so I can't
see how the intended use would be.  In particular with the RiscvCbqriBandwidthCaps *caps
attribute.

Note that riscv_cbqri_bc_create() is blindly applying all settings from 'caps' to
the device.  This is fine, but note that extra care is required when retrieving 'caps'
w.r.t the defaults established.

E.g. in riscv_cbqri_bc_properties[] we have:

 > +    DEFINE_PROP_UINT16("max_mcids", RiscvCbqriBandwidthState, nb_mcids, 256),

 > +    DEFINE_PROP_UINT16("mrbwb", RiscvCbqriBandwidthState, mrbwb, 819),
 > +
 > +    DEFINE_PROP_BOOL("at_code", RiscvCbqriBandwidthState,
 > +                     supports_at_code, true),


Now let's say that we'll add the device in the 'virt' machine, and I want to change just
nb_mcids to 512 and nothing else. If I do this:


RiscvCbqriBandwidthCaps caps = {.nb_mcids = 512};

(...)

riscv_cbqri_bc_create(addr, &caps);



I'll create a TYPE_RISCV_CBQRI_BC nb_mcids = 512 and everything else will be zeroed, disregarding
all defaults from riscv_cbqri_bc_properties[].


My suggestion here is to create a riscv_cbqri_bc_caps_init(RiscvCbqriBandwidthCaps *caps) helper
that callers can use to set the struct defaults first.  We would then do:


RiscvCbqriBandwidthCaps caps;

riscv_cbqri_bc_caps_init(caps);
caps.nb_mcids = 512;

(...)

riscv_cbqri_bc_create(addr, &caps);


We have precedent for this pattern - most RISC-V boards use riscv_boot_info_init() to init
a boot_info struct.


Thanks,
Daniel


> +
> +type_init(riscv_cbqri_bc_register_types)
> 


