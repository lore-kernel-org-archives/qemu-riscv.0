Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582D9606A31D
	for <qemu-riscv@archiver.kernel.org>; Wed, 28 Oct 2026 13:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GFC8HNxH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J7osPM5R
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xM47r-00053q-TK; Wed, 28 Oct 2026 09:55:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prajwal.n@oss.qualcomm.com>)
 id 1xM3lt-0003to-FV
 for qemu-riscv@nongnu.org; Wed, 28 Oct 2026 09:32:56 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prajwal.n@oss.qualcomm.com>)
 id 1xM3lr-0007N1-DC
 for qemu-riscv@nongnu.org; Wed, 28 Oct 2026 09:32:53 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69SDIH4T3916337
 for <qemu-riscv@nongnu.org>; Wed, 28 Oct 2026 13:32:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 n6BYAif61YNxLMR26cNQmvYoHVQuGk4/6A2sFyMuB8E=; b=GFC8HNxHhvCPrBuy
 lV4lOl0ARmJDb3yevQWz8ESBhnZO6hkRvajj93RcEjvSOqv2iAPx1CTIxUBJ5BCa
 18jy80uGBXF7mPZOn9fEiAcr8TkORwrOxhGHJW6WSqu81Tqxv+4Ljk8dsKo7ehFN
 5z7Vnese8SVWj+UaRXZR97ttSa4Gflt0UB7ZoqPHqOB+83jDW85pOE7izg1yjXMy
 QqW/fvrI4wleWILg/b1lgLRl8lDbQOJDqpz6hiCFxC5kpTbfJ+iC34tOF2DdEPoT
 U+CDIUEfqOFUk4q3v5EueAneIpPZGb/+Sefcqpa1ctvUFLTT1yyzs7eP6QdU50lY
 6wvFPQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkhtng1xw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 28 Oct 2026 13:32:48 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id
 ada2fe7eead31-7cc36b97a77so237409137.0
 for <qemu-riscv@nongnu.org>; Wed, 28 Oct 2026 06:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793194367; x=1793799167; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=n6BYAif61YNxLMR26cNQmvYoHVQuGk4/6A2sFyMuB8E=;
 b=J7osPM5RLTV7HzgB54VuG38Z1ZbkpD9PQc2FY9vZkUNT2tUlMRZGur/lDOxfyZ6Iwb
 v5RrAQiDo5K9AiLCy1cSEyGI1IJPFUmqxK28dbX2Oc14PDpGWGRsfKmr0qrdrPXYJuxl
 CuiKCWEEBjvpHw5W4wTxdhSP/EMDSgkcK+5I5htv7r1ZKBDgccxpY+/SGjHBXlDzmbe9
 5VGmIBfQO0ZBVvoKsiD2OTJjEyte1d0iQn3ie1Srm8GDzGwna25hlPncs+a0OYH+brNK
 k6qaIM92FCLDqk7kXBn0lai7P7PgqAKjktqPPVk1UP5w3rpxtMN/MXI/ckK2AHkEMtgt
 T2bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793194367; x=1793799167;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=n6BYAif61YNxLMR26cNQmvYoHVQuGk4/6A2sFyMuB8E=;
 b=fQNmRE5FF7VWid8kgxMk4b0RBLK9Zp+6PnRY3gORA9AvX3T6tXdDNbFe8bBhZkjiUM
 6Vm6ZWK+2yi/n4fWT/2PmZRFzI9xSkvduNEGqjWyfwo6dfCWVfv+/Kg3iJP+YP2hoQWP
 XaMPRrvkIgbhymK9bqtfe/aMPKE34hWwEWFcubCPT359UGbIRhOzdgej5EZbT6ah2/8d
 STBFDaTKUmx1JNkEq0dLHOsEbvPmHCag8pnO43Uvo5PhiL3m6fezmZbO9GRKT4PtKk8M
 x6x+yyhFgTPkNVsh/AKbXoSnr7WJJGNXSUb14zRK975q+SijSfl87YpVEgVIm5380LiD
 9Jmw==
X-Gm-Message-State: AFq9FYLqriLrjIm4sixwv6CJfabU5Q6gLA+ZzoSFgnbV+MqMfOIbx9xh
 MFygthzOZKWr0UiPfO3EwGsTMNLld4CC49umymCNC5A4vh0neOtq9jlSHyFbALFPI5KO0cc1Ivc
 b4c0s5MdHIvOA1kJUdzzKepw1eiA+Ecg8AweCiWo+1c+bVjIT7i6jekQtkw==
X-Gm-Gg: AYBFou15L5QyyWl4toAAft08G/3DtGNZkeHHaGb8/ZRSEvajsn6EjY5mU0ThIFi7Nf+
 tjaUyESoi0Z5E3BkV5ZKBEkM3SIduCO2nakwnAbdDj/EJIarBAr1xzUVtphbQF2h8yhqpZuFnlG
 SYQstju18gr0XoykkrdBE1aAkuiNMi7lx1S41DDLjqsqhFCFUKGMfFEjgeBcmCX0h9qHzl1ag7K
 GgauUwSFXU/5n7D+pgraYYGwVBMilTpArEXwJjE7yaLehXnhjkgPDCuI+/bbEjJd0U2C1JzTwEj
 l2Z6K42zLD/pMfTVbA05d3/JwV/6XlYo3l3hd7YZ1qYPFvvqK/90TqiK+3kmfTxBPr232eCAxU9
 0CeXwxMyzB1so9E6/ZmdqIVB1VEJl+KHxr3DwBJycqzTGXjUkUeuTCpI8XKbHeAy9s47o4wrJ2A
 ==
X-Received: by 2002:a05:6102:3fa6:b0:7cc:23e7:e743 with SMTP id
 ada2fe7eead31-7d03a5581a0mr949587137.15.1793194367001; 
 Wed, 28 Oct 2026 06:32:47 -0700 (PDT)
X-Received: by 2002:a05:6102:3fa6:b0:7cc:23e7:e743 with SMTP id
 ada2fe7eead31-7d03a5581a0mr949552137.15.1793194366440; 
 Wed, 28 Oct 2026 06:32:46 -0700 (PDT)
Received: from [192.168.1.6] ([125.99.240.160])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5bfca5bd75bsm571829e87.79.2026.10.28.06.32.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2026 06:32:45 -0700 (PDT)
Message-ID: <b789deea-1d49-4d3e-8203-58ff42fcb930@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 19:02:32 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/6] hw/riscv: implement CBQRI capacity controller
To: Drew Fustini <fustini@kernel.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Sunil V L <sunilvl@oss.qualcomm.com>,
 Anup Patel <anup.patel@oss.qualcomm.com>, Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Nicolas Pitre <npitre@baylibre.com>,
 =?UTF-8?Q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>,
 Atish Patra <atish.patra@linux.dev>,
 =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <radim.krcmar@oss.qualcomm.com>,
 yunhui cui <cuiyunhui@bytedance.com>,
 Chen Pei <cp0613@linux.alibaba.com>, guo.wenjia23@zte.com.cn,
 liu.qingtao2@zte.com.cn, prajwal.n.oss@gmail.com
References: <20261026-riscv-ssqosid-cbqri-v6-0-1a367a35cd0e@kernel.org>
 <20261026-riscv-ssqosid-cbqri-v6-3-1a367a35cd0e@kernel.org>
Content-Language: en-US
From: Prajwal N <prajwal.n@oss.qualcomm.com>
In-Reply-To: <20261026-riscv-ssqosid-cbqri-v6-3-1a367a35cd0e@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: pV8MbDTvgu0xIaKiWblQD5MHoEhe8s4o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MiBTYWx0ZWRfX+/2cjCsa4b56
 ZtwewwNVwumKFjDgABZ1ASF0l3QVes58jNm73tg986A+2dExEdWRtXD9D7y9ClIfUFGnNoaEx3Q
 2FdOvhGcbQBh+VWeAhSMzyUZ/iH8qp2c0jDBx66Bk19q+/hi8L+2KN5NDaqRn0aBtaYocuHmmQv
 mueS+bepwEPRt8mUNcv8p1hm8OcuoObNuhW8eZZCZ/QzfPWw0ViXibcntx9VSq2CH3E400WJbfA
 m20wA3X58XnMu9NdbOjIqPzylJf1xAQmtddpefpP2A++Gv2jRCaw68VpjKJYfQNzdTvjXOZTV74
 KuxRi7wxEnrc487zmal9MSz4KvD5N5OliWDJyiobjBMbdsEeRREI1E17fFk/r6KVH1ARKhzXZu6
 0EfurxdiRYGwUlNQpSbfAsRF2H4f/LG9Rzi/o+oufwxGseBT4F2D8rmWT4BWVblwXHkBrcb80o+
 VPnG26p/40WrR+Nzisg==
X-Authority-Analysis: v=2.4 cv=c/A+0h9l c=1 sm=1 tr=0 ts=6ae1f980 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=GuUutMOJDLuJj3+4/pSvWA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=V1jnuoLLAAAA:20 a=IpJZQVW2AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=69wJf7TsAAAA:8 a=2KBuwwOf-fcKeFyZZlUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22 a=IawgGOuG5U0WyFbmm1f5:22 a=Fg1AiH1G6rFz08G2ETeA:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: pV8MbDTvgu0xIaKiWblQD5MHoEhe8s4o
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MiBTYWx0ZWRfX29pIQJ/43HFY
 gpdyy6AACGWY0G8LlkjiYHvvWfFvxr/3xiAXBLfRSClg/kAe4XLvYfCh1Czm4jZ+5b/Li6BmxvL
 89wAlGS6/ZBsn5+UC69wdsKrGqKneH0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 clxscore=1011 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280052
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=prajwal.n@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, KHOP_DYNAMIC=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 28 Oct 2026 09:55:20 -0400
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

Hi Drew,

On 26-10-2026 23:17, Drew Fustini wrote:
> From: Nicolas Pitre <npitre@baylibre.com>
> 
> Implement a capacity controller according to the Capacity and Bandwidth
> QoS Register Interface (CBQRI) which supports these capabilities:
> 
>   - Number of access types: 2 (code and data)
>   - Usage monitoring operations: CONFIG_EVENT, READ_COUNTER
>   - Event IDs supported: None, Occupancy
>   - Capacity allocation ops: CONFIG_LIMIT, READ_LIMIT, FLUSH_RCID
> 
> Link: https://github.com/riscv-non-isa/riscv-cbqri/releases/tag/v1.0
> Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
> [fustini: add fields introduced in the ratified spec: cunits, rpfx, p]
> Reviewed-by: Radim Krčmář <radim.krcmar@oss.qualcomm.com>
> Signed-off-by: Drew Fustini <fustini@kernel.org>
> ---
>  MAINTAINERS               |   1 +
>  hw/riscv/cbqri_capacity.c | 727 ++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 728 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2984779ce43a..f230cdbbe1b8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -408,6 +408,7 @@ M: Nicolas Pitre <npitre@baylibre.com>
>  M: Drew Fustini <fustini@kernel.org>
>  L: qemu-riscv@nongnu.org
>  S: Supported
> +F: hw/riscv/cbqri_capacity.c
>  F: include/hw/riscv/cbqri.h
>  
>  RISC-V SiFive (Xsf*) extensions
> diff --git a/hw/riscv/cbqri_capacity.c b/hw/riscv/cbqri_capacity.c
> new file mode 100644
> index 000000000000..7ea20532b950
> --- /dev/null
> +++ b/hw/riscv/cbqri_capacity.c
> @@ -0,0 +1,727 @@
> +/*
> + * RISC-V Capacity and Bandwidth QoS Register Interface
> + * URL: https://github.com/riscv-non-isa/riscv-cbqri/releases/tag/v1.0
> + *
> + * Copyright (c) 2023 BayLibre SAS
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * This file contains the Capacity-controller QoS Register Interface.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "qemu/error-report.h"
> +#include "qemu/log.h"
> +#include "qemu/module.h"
> +#include "qemu/bitmap.h"
> +#include "hw/core/qdev-properties.h"
> +#include "hw/core/sysbus.h"
> +#include "target/riscv/cpu.h"
> +#include "hw/riscv/cbqri.h"

[...]

> +static void riscv_cbqri_cc_write(void *opaque, hwaddr addr,
> +                                 uint64_t value, unsigned size)
> +{
> +    RiscvCbqriCapacityState *cc = opaque;
> +
> +    assert((addr % 8) == 0);
> +
The same comments in the riscv_cbqri_cc_read() below are applicable
here as well.

> +    switch (addr) {
> +    case A_CC_CAPABILITIES:
> +        /* read-only register */
> +        break;
> +    case A_CC_MON_CTL:
> +        riscv_cbqri_cc_write_mon_ctl(cc, value);
> +        break;
> +    case A_CC_ALLOC_CTL:
> +        riscv_cbqri_cc_write_alloc_ctl(cc, value);
> +        break;
> +    case A_CC_MON_CTR_VAL:
> +        /* read-only register */
> +        break;
> +    case A_CC_BLOCK_MASK:
> +        if (cc->ncblks == 0) {
> +            break;
> +        }
> +        /* fallthrough */
> +    default:
> +        uint32_t blkmask_slot = (addr - A_CC_BLOCK_MASK) / 8;
> +        if (blkmask_slot == get_slots(cc)) {
> +            /* this is cc_cunits register */
> +            break;
> +        } else if (blkmask_slot > get_slots(cc)) {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "%s: out of bounds (addr=0x%x)",
> +                          __func__, (uint32_t)addr);
> +            break;
> +        }
> +        cc->alloc_blockmasks[blkmask_slot] = value;
> +    }
> +}
> +
> +static uint64_t riscv_cbqri_cc_read(void *opaque, hwaddr addr, unsigned size)
> +{
> +    RiscvCbqriCapacityState *cc = opaque;
> +    uint64_t value = 0;
> +
> +    assert((addr % 8) == 0);
> +
To access the 64 bit CBQRI register, the Linux kernel is performing two
32 bit reads. The register offsets that are passed to this function are 0x00,
0x04, 0x08 ... The assert is triggered for the addr 0x04, 0x0c.. and the
QEMU exists.
This check should have been:
assert((addr %4) == 0)

The switch statement uses the register offsets that are 8-byte aligned.
A_CC_CAPABILITIES (0x00), A_CC_MON_CTL (0x08) etc.
Since the kernel invokes read twice, the second readl() has the offset addr
0x04. This does not match any offset and falls into the default case.
The following change fixes the problem.

       hwaddr reg_addr = addr & ~7ULL; /* align down to 8-byte boundary */> +    switch (addr) {
       switch (reg_addr) {> +    case A_CC_CAPABILITIES:
> +        value = FIELD_DP64(value, CC_CAPABILITIES, VER_MAJOR,
> +                           RISCV_CBQRI_VERSION_MAJOR);
> +        value = FIELD_DP64(value, CC_CAPABILITIES, VER_MINOR,
> +                           RISCV_CBQRI_VERSION_MINOR);
> +        value = FIELD_DP64(value, CC_CAPABILITIES, NCBLKS,
> +                           cc->ncblks);
> +        value = FIELD_DP64(value, CC_CAPABILITIES, FRCID,
> +                           cc->supports_alloc_op_flush_rcid);
> +        value = FIELD_DP64(value, CC_CAPABILITIES, CUNITS, 0);
> +        value = FIELD_DP64(value, CC_CAPABILITIES, RPFX, 0);
> +        value = FIELD_DP64(value, CC_CAPABILITIES, P, 0);
> +        break;
> +    case A_CC_MON_CTL:
> +        value = cc->cc_mon_ctl;
> +        break;
> +    case A_CC_ALLOC_CTL:
> +        value = cc->cc_alloc_ctl;
> +        break;
> +    case A_CC_MON_CTR_VAL:
> +        value = cc->cc_mon_ctr_val;
> +        break;
> +    case A_CC_BLOCK_MASK:
> +        if (cc->ncblks == 0) {
> +            break;
> +        }
> +        /* fallthrough */
> +    default:
> +        unsigned int blkmask_slot = (addr - A_CC_BLOCK_MASK) / 8;
> +        if (blkmask_slot == get_slots(cc)) {
> +            /*
> +             * The cc_cunits register is always the slot following the
> +             * last slot of cc_blockmask register. Capacity units are
> +             * not supported by this implementation so must return 0.
> +             */
> +            value = 0;
> +            break;
> +        } else if (blkmask_slot > get_slots(cc)) {
> +            qemu_log_mask(LOG_GUEST_ERROR, "%s: out of bounds (addr=0x%x)",
> +                          __func__, (uint32_t)addr);
> +            break;
> +        }
> +        value = cc->alloc_blockmasks[blkmask_slot];
> +    }
> +
The logic within the switch statement always computes the full 64-bit register
value. But the Linux kernel requested for 32 bits. The kernel is creating a
64-bit value with the two 32-bit values. This should return only the relevant half.
The following code snippet fixed the problem.
    /* Return the correct 32-bit */
    if (size == 4) {
        if (addr & 4)
            return value >> 32;   // high word
        else
            return value & 0xffffffff;  // low word
    }

Thanks,
Prajwal N


