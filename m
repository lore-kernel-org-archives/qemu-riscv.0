Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0926CCA5FB1
	for <qemu-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 09:39:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xBqmN-00043C-0o; Wed, 30 Sep 2026 05:39:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xBqmG-00040z-A2
 for qemu-riscv@nongnu.org; Wed, 30 Sep 2026 05:39:04 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xBqmE-0007yE-Gt
 for qemu-riscv@nongnu.org; Wed, 30 Sep 2026 05:39:04 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68U7dOh32213405
 for <qemu-riscv@nongnu.org>; Wed, 30 Sep 2026 09:39:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 G9znUFWp4/ikGNQv5GE1Vek2AqjWXxe+faMMxz6W1Yk=; b=AWplIIMVSLfHKySo
 GyGHMkVa1KJ7msy74xQnFckNA747ANW070B1sLO1i9Av+2mQ79wXgQfXOSN27Sx/
 3ZTorBtfcnYLPOtzlT2Vx5now25RstYuAHBpXmZQGd+mC9xsRSPBLlJnK8cMe7XM
 1xPutsJ0+x1uQ/v8W6Zr6R9HWoLQBq86YjzkFIMp/EuknkJ74IpxNTokjUJezV2E
 /8uqiBl6JIg8U4ZehqBdkqPEXkAnadAaGWzRciRma6QQA3IbC8trKflMKQOfBfTw
 8QOMO5dPu8x4e9+n043A5q9uXrKzM/ThAFdX8ufvdptB/rjX1wQEuQiVEUvnInjn
 i1Fe7g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0smjhruu-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 30 Sep 2026 09:39:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-93a0312937eso685310385a.1
 for <qemu-riscv@nongnu.org>; Wed, 30 Sep 2026 02:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790761140; x=1791365940; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=G9znUFWp4/ikGNQv5GE1Vek2AqjWXxe+faMMxz6W1Yk=;
 b=Zuqebqw0kPk/GtvHSiIDbx9BwN1jc7x1iPMDnV5lt8bhb2kBA7uVOibWhMZLCEBJch
 v9rLc+gUTXWSjFpCNxiY0DTZccS8huWkPW8INjy4WRfSfRyMe27Ap/DESgWf14TnB3yx
 QxoOLb99YA8yYSaJ0wArZWDuzMRrmlUAEptQ7WMmi3vS6HifTKAEVCXSoaSgHZ6tGAO1
 ToM1heQCiGlnco3dy8znqgFhn3EZG/AtvM//j6Mk9LkcF/8KPDgiANbEW53oQFzbNJc5
 iEjAUdxK3cAo998e6SMssGOgGvHCfuSDzb59W5Cdr9bwX0ldhtmBuALGGcbG+slGgv2G
 GGKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790761140; x=1791365940;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=G9znUFWp4/ikGNQv5GE1Vek2AqjWXxe+faMMxz6W1Yk=;
 b=upi+QTUBN9pQ2E/RVi2Q2RoHZotxh8ZgUkGsSTDC1ITIdK0vyayuhy+4kPpzhC3XVg
 dC6ssqVwKZ/fVI4Bgnt7aaHihCUnbGumj9OCWft7hB29NS6OjS8XNXTVQLFCagytx+sl
 /cTQvJxaUjK7mG7tBdBkc7ppwcXme6uRXbt0hsk8zZ087d4IeJsgc2CJltCNtNHPnTEi
 Zeje+RKqBXF5Ln7qm4+bnins920dQCzzAliPmvR1wMlhRM2BzNJN+vGMlOoTTNpyL7oF
 FXxf2Yw4Tqe36neQerD7E+bLqqdTE+tXVwqSzAUtuU3rqeet3XIFJ5qafnuP4HZRQ2Ju
 oIFA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzRq1VOkA+b6HTnoKrdozhbZijWPzzhy/T9Y72DzAr2vBvdR/EP1b8rkhFIbcQIdQLikLBQva38NShS@nongnu.org
X-Gm-Message-State: AFuF++lXDc9jVKbOdVaSnbFIY2D2FUEVu01TUYzxn5gQSfXLNdUi3JNN
 rdkpw/dJTUQbOGkmrlOzu5CJMPEBcVwz2KFVjWfRq+0oe7FBvXWAp9c0HSTeS6QL06e2gRLRbjU
 b1/gDD3DZyTYPHL8aBlF+rBb/whCJpgF314IytuSGoChtyF0ij8D0UDS297GTQAt8vw==
X-Gm-Gg: AYBFou2zLG9LPycXaPj9aiYHY4C2iWIkXa6WrDR/i7lcsGH+0C2e75gJFxpYcgMLrvI
 ml09BXlXxeoF0oImn2mdT2CTfmABsp48/0XEYtjbIGKNhXEQ2/XShyAD5+ypkF3czq/hU8Ay/U8
 +nzuFfLErLNtZLg267MJt3EoZKgldLTLkoMp4+6W5dheNBGO+QKUFIk2osr1xSOM088Trl25xx+
 jYf2pTtiD26hlZcctDYk/yflvKnqDsbRv1Hm0kLXF1MYwKrBsF9J/hy7RTPjUUYbUN/NBuw1dmt
 Bvv+3SqS9tpPh2GkwhcHsGZXXMWnGrelhsvamBhh3CgObMg9dH19g/DhBnWy4m+VNlYJC9o6lRd
 QKms/BHQSe+dnXG43Ge98NMDbq3p8QQfEMT7XXFI=
X-Received: by 2002:a05:620a:1712:b0:939:7e19:ac3 with SMTP id
 af79cd13be357-93ca9752a1dmr105568885a.45.1790761139349; 
 Wed, 30 Sep 2026 02:38:59 -0700 (PDT)
X-Received: by 2002:a05:620a:1712:b0:939:7e19:ac3 with SMTP id
 af79cd13be357-93ca9752a1dmr105565885a.45.1790761138831; 
 Wed, 30 Sep 2026 02:38:58 -0700 (PDT)
Received: from [192.168.69.225] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a0174e165fsm46956785e9.6.2026.09.30.02.38.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2026 02:38:58 -0700 (PDT)
Message-ID: <7b5afdcd-92ad-4760-b46c-5964d5853037@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 11:38:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/24] hw/misc: pfsoc: Model L2 cache controller
 registers
Content-Language: en-US
To: Bin Meng <bin.meng@processmission.com>, QEMU <qemu-devel@nongnu.org>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Conor Dooley <conor@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Sebastian Huber <sebastian.huber@embedded-brains.de>, qemu-riscv@nongnu.org
References: <20260904155758.3833179-1-bin.meng@processmission.com>
 <20260904155758.3833179-5-bin.meng@processmission.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260904155758.3833179-5-bin.meng@processmission.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAzOCBTYWx0ZWRfX7qXCsRxmhbXY
 HoWuLEuXf4jPPXokgq79twmjcJCKcuTcVroSJlA/VQP45thX/xifD4085un4d0PaNtBg+y2hKdE
 s/LUCZCmNMXsNbpngopwy+Ka6V7SzzA=
X-Proofpoint-GUID: sdPeXr7t_HBjAg0_HY2QV9FD4A7zSw5a
X-Proofpoint-ORIG-GUID: sdPeXr7t_HBjAg0_HY2QV9FD4A7zSw5a
X-Authority-Analysis: v=2.4 cv=KfxHIgYD c=1 sm=1 tr=0 ts=6abcd8b4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=FRSEYCzRAAAA:8 a=JF9118EUAAAA:8 a=X2DtDrvf2-FZo3jniCcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=H4N_Y-AU75W7NKDNhZlT:22 a=xVlTc564ipvMDusKsbsT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAzOCBTYWx0ZWRfX92oaOOL+eiP+
 pder3/jFTDz2oDTtVGbCxG79SAMMt9SuVBUtpbLBxmuXLUmh1c7Sn6PtSHc8jwia/e08EudHH67
 7ChqtuLKx2NzM/EIwtiUKneT4LNd14Ye28Np7ktuBg43fmY2ccwxjbQS6gZyLaskO67wcahepzl
 GOvOZ/onZbctyAPQYxQzPZGpFxMwKEFSzn7RG8C6HvhsW+IyIgtPsj4bdAJtvRV2zIPG3yLEu2C
 ColCaJh3ltL2fyp19VTFKjQ7TfhTzEDH547377Ht7P9rVSocNJ8c3Ih9RWBKv4M8QyEZ8WBojDY
 3xcNZ1l9lzPpNfqT4RhFs0OfLqohVx4xbVUnH/yD8YxdE5vC4htpWoyb/0vv987fe8J9+2zijzM
 uSQWIy0wmc0Y/+LDP1HsSVs2zJ/iGhcW5wkdKlX900QRY3CedBcpJiJT2kmzPUQoDMEiyZri0+m
 Wpg/MXk30Lav3/zgukw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300038
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On 4/9/26 17:57, Bin Meng wrote:
> Implement the Config, WayEnable, and per-master WayMask registers
> described by the PolarFire SoC MSS reference manual. Make WayEnable
> monotonic and report the remaining register space as unimplemented.
> 
> Signed-off-by: Bin Meng <bin.meng@processmission.com>
> Acked-by: Alistair Francis <alistair.francis@wdc.com>
> 
> ---
> 
> Changes in v2:
> - Use the Resettable API instead of a legacy reset handler
> 
>   MAINTAINERS                       |   2 +
>   include/hw/misc/mchp_pfsoc_l2cc.h |  30 +++++
>   hw/misc/mchp_pfsoc_l2cc.c         | 180 ++++++++++++++++++++++++++++++
>   hw/misc/Kconfig                   |   3 +
>   hw/misc/meson.build               |   1 +
>   5 files changed, 216 insertions(+)
>   create mode 100644 include/hw/misc/mchp_pfsoc_l2cc.h
>   create mode 100644 hw/misc/mchp_pfsoc_l2cc.c


> diff --git a/include/hw/misc/mchp_pfsoc_l2cc.h b/include/hw/misc/mchp_pfsoc_l2cc.h
> new file mode 100644
> index 0000000000..1b5b3888d5
> --- /dev/null
> +++ b/include/hw/misc/mchp_pfsoc_l2cc.h
> @@ -0,0 +1,30 @@
> +/*
> + * Microchip PolarFire SoC L2 cache controller
> + *
> + * Copyright (c) 2026 Process Mission
> + *
> + * Author:
> + *   Bin Meng <bin.meng@processmission.com>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#ifndef MCHP_PFSOC_L2CC_H
> +#define MCHP_PFSOC_L2CC_H
> +
> +#include "hw/core/register.h"
> +#include "hw/core/sysbus.h"
> +
> +#define MCHP_PFSOC_L2CC_REG_SIZE 0x1000
> +#define MCHP_PFSOC_L2CC_REG_NUM  (MCHP_PFSOC_L2CC_REG_SIZE / 8)
> +
> +typedef struct MchpPfSoCL2ccState {
> +    SysBusDevice parent;

Nitpicking, 'parent_obj'.

> +    uint64_t regs[MCHP_PFSOC_L2CC_REG_NUM];
> +    RegisterInfo regs_info[MCHP_PFSOC_L2CC_REG_NUM];
> +} MchpPfSoCL2ccState;

