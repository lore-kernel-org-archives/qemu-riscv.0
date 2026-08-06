Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A13FC5AC67
	for <qemu-riscv@archiver.kernel.org>; Thu,  6 Aug 2026 21:16:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1ws5Rm-0001Ww-K8; Thu, 06 Aug 2026 17:16:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1ws5Qw-0001Uh-KA
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2026 17:15:23 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1ws5Qu-000436-Jt
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2026 17:15:22 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 676L8NF23662417
 for <qemu-riscv@nongnu.org>; Thu, 6 Aug 2026 21:15:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 hiZ6ZF6dhHMSvTIej8W3b4zDVpHzNuOle3BhJicedTI=; b=MDhXU7Ob8QSpFMl8
 I3M1lI/wsHQoVryRLTkHO5pQV4kl1rhjAcH3cqvctzZROrPYP+QdlrTx7KKD1yxV
 3UZDA+Rh1Nk3Q4+JDlKBDXO7EHc774wt2Ob/AVAFZe4ieASTpZ6q5yZwI8PasOP+
 8ysigaQi55nq3Yo3qD/JHYWK8nicQWhTIwZTtL/QZ5SE70jefFCcYQoY5C1mRgsH
 SBMdUUO5mkQzQF15rBTqAwA2RfCbmUbKiJa4PhMmC+LSFAa+HzD+mns8BzjLs/y4
 aOwU/CiwJ3lVb9dK1C5SOfUGy5yLsAZOADQNWi40X3p8Rstk+XxIX36YnZPYzuhn
 V8Gjtg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6h8s6d-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 06 Aug 2026 21:15:16 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-8e9489f62bfso27818276d6.2
 for <qemu-riscv@nongnu.org>; Thu, 06 Aug 2026 14:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786050915; x=1786655715; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=hiZ6ZF6dhHMSvTIej8W3b4zDVpHzNuOle3BhJicedTI=;
 b=ApKQ3UNu9VOfM/wdSP8hNluwMDtvtUwrv0ZPvURH8bi8CnGHPELRUWr3olPtTVcdi1
 m5Qc0puMvlwi0A91XmAWsPH1k0JP1mFHzr6+tsoyfLlVPul5D+DybJu4Te8htVwaP7ae
 WtAKvGxjuAHVaDw1tZP9azC5IrZWcDqSHMEy+qQdHV53ajNCxxKqruVZaipQSmDUHtfw
 jca9imZ8HwtlNnGKOYcrbzBkSHLddwuGSXZveMncDmFaJIZbPlE9NSnzqcvJ0Clkmpyw
 1hW5TYaIrX4ndYY4fTmUIMQPy5jHmSa4ujTCSfJ/J0H5EWmvpa0BO8QE6CcUrqq/cOT4
 XrCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786050915; x=1786655715;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=hiZ6ZF6dhHMSvTIej8W3b4zDVpHzNuOle3BhJicedTI=;
 b=PjwrzcyCdwlskMuWjWLx52q6YrU22dUVYnwoBi0ukGyrlNb1QdnfMaDiHh2G/o1hpu
 nE6SXKsXyM1hBk45KWVD4rLbqpSFKpeCFRlMvrytYn++GKpx4RVIcbdRfbd9b0X2AJFo
 6l4hmbcsnNIWhiI0YkodXABAY0xdH390H475vcbG6KIvvEs78T7FO4CQT7gSVhN7GuX8
 BftOxZK3Rx7uL1dy1EeWsZ0oqddAXWk02401BWWrAi33csF16/g/Ts5d2a3gFUz089J3
 cxSleSWATAxRYDJQX6BDJ71RJ4TDK1jYmgDqG7mh/K55pCBm/bXHMECHXk2zhCyqprvD
 xTJw==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro+bSveVdVg1P1IcE9FY0WqAR3FeMwtjTQYcylUdWRrTWKG6QvL89ORdmTSk1+Z8ozhbRzFnKidrtho@nongnu.org
X-Gm-Message-State: AOJu0YzITFL8/IAAfQuoonK1VRVz36lIy9KNfvzMKaz+N1W8bgga3hCP
 JSCw7/8SkSCH09bJMI6CRir+XfdUXpShrEAYqY6nyF3Tz53b9s4DdZnUvLAKUYdQaiv/2PJWTmW
 qrP5F4RXY8tRG/udzSn7KTDZCxk1vHw2sLo/6KuXYoE8irL00xP9h8ky8nA==
X-Gm-Gg: AR+sD11PeDDdOcjWGTsdro2AzeosEeq7x4SEGlnlD+RfIP2wcNR8lni05D9Nh3VkdY2
 I0oCZkI3eBAQahIl1VTU0+WoH7CqrFFrIUAwTuzdt5PJXTn+NNidMscWFgC3nZdtCYtD4cgLck9
 1lBOTMnWdHGyL4KnlBUJ8g351Ob3iWmp8kP9X0iw9HjU+F6KCxxJKiJuE833yxvCWnntPHp78v3
 FhJB0XN5rVMSW7ADblCLdeaVv6BV69fQ/KmFawppPxTtXRFesvsyO9+XNFNT8LkR+Vh81LnCr2P
 jpi/NWVtltDhOmt8N5gcf1yOkDzd+pQA+vMv8MxTYFGCWz2YKDYbwuWIs2DeKg92F5rZm7VJ3vp
 JDskOBodgeRxJI5cpqhAB3EVvTjzMk1AnJBC6
X-Received: by 2002:a05:622a:5c1b:b0:51b:f25c:2896 with SMTP id
 d75a77b69052e-52ce5fe8b4bmr198991041cf.11.1786050915369; 
 Thu, 06 Aug 2026 14:15:15 -0700 (PDT)
X-Received: by 2002:a05:622a:5c1b:b0:51b:f25c:2896 with SMTP id
 d75a77b69052e-52ce5fe8b4bmr198989661cf.11.1786050914710; 
 Thu, 06 Aug 2026 14:15:14 -0700 (PDT)
Received: from [192.168.68.103] ([187.11.154.152])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-52ce8975b31sm44757391cf.28.2026.08.06.14.15.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Aug 2026 14:15:13 -0700 (PDT)
Message-ID: <f59d6f78-1a32-45cb-a3b3-ec9780362f4d@oss.qualcomm.com>
Date: Thu, 6 Aug 2026 18:15:10 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] disas/riscv: Add disassembler support for
 Xsfvqmaccdod/Xsfvqmaccqoq
To: Max Chou <max.chou@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Jason Chien <jason.chien@sifive.com>
References: <20260721122034.1567146-1-max.chou@sifive.com>
 <20260721122034.1567146-5-max.chou@sifive.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260721122034.1567146-5-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=G60s1dk5 c=1 sm=1 tr=0 ts=6a74f964 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=iMfxv9gflPUPBcmW7/Gq5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pFyQfRViAAAA:8 a=EUspDBNiAAAA:8 a=69wJf7TsAAAA:8 a=YEB5RgzmAAAA:8
 a=ztKAlPSOJi_btNl3GtIA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=oJz5jJLG1JtSoe7EL652:22 a=Fg1AiH1G6rFz08G2ETeA:22
X-Proofpoint-GUID: ceiU-HY1zB0b7If-HtJTtkBcmt1bg1FF
X-Proofpoint-ORIG-GUID: ceiU-HY1zB0b7If-HtJTtkBcmt1bg1FF
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDE2NiBTYWx0ZWRfX4PN1M4kExXSJ
 3pviLLp9N8aoQCMr67L7eEC1EEI08oKDx8oxXk+PtLFtdnwxZbB68DWS2pq54lRD7j0iGFywpvp
 nKDCY6E3qEbszhjie5nMm/tZU9wXRIA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDE2NiBTYWx0ZWRfXwJMX235TDeu7
 StsuS729ztfhgrscL8VFsJ6Yu0Ck09qWkJcfNumqRFAOQ5oDx4C90haNgC4+bPmriOghGRdbzul
 sKxGnPYyZhz4URqiNdiNLSLpntPJFG8wpsLzAiida86f8wabGe0WKSXC1KR18AZoKMUO+u3cddx
 2svMNXqmS3bkVnZSKzzp7DtQXt+A65HP3FSS3B5+za0NsCBPhc2LFFPQvaPOG7fBz8uwuIDj8Uv
 mEmV1AWobbT15+02VkQkjM8kfTM+4g9gBQrv6rRPpq0nOn9/RS3VDvHaYPT27dFPK6ffMu8IJZr
 9HDItFJrU6IQ6zZACBYBJ1jx7dD8Qb3kD+I1Lc9/4tUp8DvM7I6dnXtWuzFaX3WxIZw0hPY4WcN
 Ohft0at1w0VfSTYCjzt8mjQOzhoI/4HmiKMlrnQG4TLKvDWx1PcwJ+aqGvhCilUeLzVKz9w/f/j
 LrAT7GJbGz7KYLJGdrg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-06_03,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 spamscore=0 clxscore=1015 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060166
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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



On 7/21/2026 9:20 AM, Max Chou wrote:
> From: Jason Chien <jason.chien@sifive.com>
> 
> Add disassembler support for all SiFive custom int8 matrix-multiply
> instructions: sf.vqmacc{u,,us,su}.4x8x4 and sf.vqmacc{u,,us,su}.2x8x2.
> 
> These instructions share opcode 0b1011011 and funct3 0b010, and are
> distinguished by funct6: 60-63 for the 4x8x4 (Xsfvqmaccqoq) tile and
> 44-47 for the 2x8x2 (Xsfvqmaccdod) tile.
> 
> Signed-off-by: Jason Chien <jason.chien@sifive.com>
> Signed-off-by: Max Chou <max.chou@sifive.com>
> ---


Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   MAINTAINERS       |  1 +
>   disas/meson.build |  3 +-
>   disas/riscv-xsf.c | 79 +++++++++++++++++++++++++++++++++++++++++++++++
>   disas/riscv-xsf.h | 18 +++++++++++
>   disas/riscv.c     |  2 ++
>   disas/riscv.h     |  1 +
>   6 files changed, 103 insertions(+), 1 deletion(-)
>   create mode 100644 disas/riscv-xsf.c
>   create mode 100644 disas/riscv-xsf.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 94cd63eeba..1a40d86685 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -395,6 +395,7 @@ L: qemu-riscv@nongnu.org
>   S: Supported
>   F: target/riscv/xsf.decode
>   F: target/riscv/tcg/insn_trans/trans_xsf.c.inc
> +F: disas/riscv-xsf*
>   
>   RENESAS RX CPUs
>   R: Yoshinori Sato <yoshinori.sato@nifty.com>
> diff --git a/disas/meson.build b/disas/meson.build
> index 42977a1f74..9135716268 100644
> --- a/disas/meson.build
> +++ b/disas/meson.build
> @@ -8,7 +8,8 @@ common_ss.add(when: 'CONFIG_RISCV_DIS', if_true: files(
>       'riscv.c',
>       'riscv-xthead.c',
>       'riscv-xventana.c',
> -    'riscv-xlrbr.c'
> +    'riscv-xlrbr.c',
> +    'riscv-xsf.c'
>   ))
>   common_ss.add(when: 'CONFIG_SH4_DIS', if_true: files('sh4.c'))
>   common_ss.add(when: 'CONFIG_SPARC_DIS', if_true: files('sparc.c'))
> diff --git a/disas/riscv-xsf.c b/disas/riscv-xsf.c
> new file mode 100644
> index 0000000000..8f752657a7
> --- /dev/null
> +++ b/disas/riscv-xsf.c
> @@ -0,0 +1,79 @@
> +/*
> + * QEMU RISC-V Disassembler for xsf (SiFive vendor extensions).
> + *
> + * Copyright (c) 2023 SiFive, Inc.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +
> +#include "disas/riscv.h"
> +#include "disas/riscv-xsf.h"
> +
> +typedef enum {
> +    /* 0 is reserved for rv_op_illegal. */
> +    xsf_op_sf_vqmaccu_4x8x4 = 1,
> +    xsf_op_sf_vqmacc_4x8x4 = 2,
> +    xsf_op_sf_vqmaccus_4x8x4 = 3,
> +    xsf_op_sf_vqmaccsu_4x8x4 = 4,
> +    xsf_op_sf_vqmaccu_2x8x2 = 5,
> +    xsf_op_sf_vqmacc_2x8x2 = 6,
> +    xsf_op_sf_vqmaccus_2x8x2 = 7,
> +    xsf_op_sf_vqmaccsu_2x8x2 = 8,
> +} rv_xsf_op;
> +
> +const rv_opcode_data xsf_opcode_data[] = {
> +    { "illegal", rv_codec_illegal, rv_fmt_none, NULL, 0, 0, 0 },
> +    { "sf.vqmaccu.4x8x4", rv_codec_v_r, rv_fmt_vd_vs1_vs2, NULL, 0, 0, 0 },
> +    { "sf.vqmacc.4x8x4", rv_codec_v_r, rv_fmt_vd_vs1_vs2, NULL, 0, 0, 0 },
> +    { "sf.vqmaccus.4x8x4", rv_codec_v_r, rv_fmt_vd_vs1_vs2, NULL, 0, 0, 0 },
> +    { "sf.vqmaccsu.4x8x4", rv_codec_v_r, rv_fmt_vd_vs1_vs2, NULL, 0, 0, 0 },
> +    { "sf.vqmaccu.2x8x2", rv_codec_v_r, rv_fmt_vd_vs1_vs2, NULL, 0, 0, 0 },
> +    { "sf.vqmacc.2x8x2", rv_codec_v_r, rv_fmt_vd_vs1_vs2, NULL, 0, 0, 0 },
> +    { "sf.vqmaccus.2x8x2", rv_codec_v_r, rv_fmt_vd_vs1_vs2, NULL, 0, 0, 0 },
> +    { "sf.vqmaccsu.2x8x2", rv_codec_v_r, rv_fmt_vd_vs1_vs2, NULL, 0, 0, 0 },
> +};
> +
> +void decode_xsf(rv_decode *dec, rv_isa isa)
> +{
> +    rv_inst inst = dec->inst;
> +    rv_opcode op = rv_op_illegal;
> +
> +    switch ((inst >> 0) & 0b1111111) {
> +    case 0b1011011:
> +        switch ((inst >> 12) & 0b111) {
> +        case 0b010:
> +            switch ((inst >> 26) & 0b111111) {
> +            case 60:
> +                op = xsf_op_sf_vqmaccu_4x8x4;
> +                break;
> +            case 61:
> +                op = xsf_op_sf_vqmacc_4x8x4;
> +                break;
> +            case 62:
> +                op = xsf_op_sf_vqmaccus_4x8x4;
> +                break;
> +            case 63:
> +                op = xsf_op_sf_vqmaccsu_4x8x4;
> +                break;
> +            case 44:
> +                op = xsf_op_sf_vqmaccu_2x8x2;
> +                break;
> +            case 45:
> +                op = xsf_op_sf_vqmacc_2x8x2;
> +                break;
> +            case 46:
> +                op = xsf_op_sf_vqmaccus_2x8x2;
> +                break;
> +            case 47:
> +                op = xsf_op_sf_vqmaccsu_2x8x2;
> +                break;
> +            }
> +            break;
> +        }
> +        break;
> +    }
> +
> +    dec->op = op;
> +}
> diff --git a/disas/riscv-xsf.h b/disas/riscv-xsf.h
> new file mode 100644
> index 0000000000..b8462c356e
> --- /dev/null
> +++ b/disas/riscv-xsf.h
> @@ -0,0 +1,18 @@
> +/*
> + * QEMU disassembler -- RISC-V specific header (xsf*).
> + *
> + * Copyright (c) 2023 SiFive, Inc.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#ifndef DISAS_RISCV_XSF_H
> +#define DISAS_RISCV_XSF_H
> +
> +#include "disas/riscv.h"
> +
> +extern const rv_opcode_data xsf_opcode_data[];
> +
> +void decode_xsf(rv_decode *, rv_isa);
> +
> +#endif /* DISAS_RISCV_XSF_H */
> diff --git a/disas/riscv.c b/disas/riscv.c
> index 7f1b262773..032cd31e35 100644
> --- a/disas/riscv.c
> +++ b/disas/riscv.c
> @@ -27,6 +27,7 @@
>   #include "disas/riscv-xthead.h"
>   #include "disas/riscv-xventana.h"
>   #include "disas/riscv-xlrbr.h"
> +#include "disas/riscv-xsf.h"
>   
>   typedef enum {
>       /* 0 is reserved for rv_op_illegal. */
> @@ -5454,6 +5455,7 @@ static GString *disasm_inst(rv_isa isa, uint64_t pc, rv_inst inst,
>           { has_xtheadsync_p, xthead_opcode_data, decode_xtheadsync },
>           { has_XVentanaCondOps_p, ventana_opcode_data, decode_xventanacondops },
>           { has_xlrbr_p, rv_xlrbr_opcode_data, decode_xlrbr },
> +        { has_xsf_p, xsf_opcode_data, decode_xsf },
>       };
>   
>       for (size_t i = 0; i < ARRAY_SIZE(decoders); i++) {
> diff --git a/disas/riscv.h b/disas/riscv.h
> index 379e642ec8..66683201b9 100644
> --- a/disas/riscv.h
> +++ b/disas/riscv.h
> @@ -280,6 +280,7 @@ enum {
>   #define rv_fmt_vd_vs2_imm_vm          "O\tD,F,im"
>   #define rv_fmt_vd_vs2_uimm            "O\tD,F,u"
>   #define rv_fmt_vd_vs2_uimm_vm         "O\tD,F,um"
> +#define rv_fmt_vd_vs1_vs2             "O\tD,E,F"
>   #define rv_fmt_vd_vs1_vs2_vm          "O\tD,E,Fm"
>   #define rv_fmt_vd_rs1_vs2_vm          "O\tD,1,Fm"
>   #define rv_fmt_vd_fs1_vs2_vm          "O\tD,4,Fm"


