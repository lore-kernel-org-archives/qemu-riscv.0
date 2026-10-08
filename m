Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F30FDCA6007
	for <qemu-riscv@archiver.kernel.org>; Thu,  8 Oct 2026 02:37:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xEe0b-0000xl-Ck; Wed, 07 Oct 2026 22:37:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xEe06-0000v9-8u
 for qemu-riscv@nongnu.org; Wed, 07 Oct 2026 22:36:55 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xEe03-0000jq-0H
 for qemu-riscv@nongnu.org; Wed, 07 Oct 2026 22:36:53 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6981higA838080
 for <qemu-riscv@nongnu.org>; Thu, 8 Oct 2026 02:36:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 5AZ0imk9leCxmFnk1WrVKPBAISpyrF3FRNjkW2CI5rg=; b=HUOcRHP1qBNkVmYr
 SHiwDhE8+AA5WRgRy2coL26b7A6/iHx4FF0oe/RRN0XO0O4HeiRSeuXbALbWGw43
 siE55Jiay7KahHk2zwSndaXdfKLp/cI+yrjG0i1lbXCOPLwb2uDNTaBHgr2mzMcH
 E20QPCbci5DsFHvgEW525bHJBNCgCrmfyJp98JUAVKR8j9Rmb+vk2DPGVgQbUFqm
 gY2OBBcZ0cEWivHJj3XNCmPfpg6JtfY2lGByn6yT9cuJJDMZLBuMPy5R8WWOf6aT
 coTF2sMeHFWtMWDPKtVw2v37nTzK64ccXJ/9knx4ADXZRCC0P//O3HGBjPoxjXz5
 WqNwjA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe50rhb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 08 Oct 2026 02:36:45 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-5345ded3f6dso109250711cf.3
 for <qemu-riscv@nongnu.org>; Wed, 07 Oct 2026 19:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791427004; x=1792031804; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=5AZ0imk9leCxmFnk1WrVKPBAISpyrF3FRNjkW2CI5rg=;
 b=AwdnZaiA/TkQsL69UxHsx6hHsM7t2vmDG4JMukLTbfnTXKx4iTLQ2mWieQsbZNEZjF
 LjuRaPaIxkRRiPkru+VhzhBLh+wO2nC8gjD6agjWVgOtqYyLWn2c03gtNvUnXFzGXcnJ
 U+Y5tx3s/dJHHATIPo8RGpPJ8CQ3KJYBF7SvyZUotiLMJ6nzn71wsu2ru+KwSaBXUrfX
 5UNcAPrU811wh3bG9mibrdy0CveuiGjkbmSbiGRosHqwhWUD+lveoha4VFbDP/Lf2Ik1
 D4tdkG2jFbSfcCqp8ui64c+oQ7iyYlfxpU3iQhBJNKAVht1gbMof7JeoOrG9E9xclAkM
 l2eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791427004; x=1792031804;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=5AZ0imk9leCxmFnk1WrVKPBAISpyrF3FRNjkW2CI5rg=;
 b=SUI89+KHBeNKVzqnQLwx3S+q6zqoZBI5KX6cylpsYyVCKPyzzl2bD0eJEuLxk2JYuD
 ZrP7UEbJHaeJlt8fHKIQj3b0yLIdnbQvRLJ+opd4S3eOCR/m3CKL1TnJk+U+khV58QAR
 FkzADSOfht8F/uW3B0n6RKl8gEaAsd2WxPzKG5tqC98P2DPoya9bfxnAuFEjJDeCiqIT
 VBBdk8Hjqj0apfFRUkqKGEOHzI25P2VTVnQLd0BAGzAS1wwuxrKsRAwqGRTOtT4HifaT
 BnV8MJphrt8SEaqFkYyyqiuI5cOFd2WCfLFXgQ3XQgFzUzFujNfqkTPXfD8f6nP0tJOb
 1Ejg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxE8RF090I9MSHIfSjZ2mEDmlANzoQThMlQuPwjThg7OAvyOBDKhSlM3ArVkcKZ8PrCdLToV5gMd17/@nongnu.org
X-Gm-Message-State: AFuF++l917N9YIm77l9nkxQec99whqCxkIEQl0DUMv4ziPRKIznHKHlS
 NibKxn+BkqACznNRgJhmc70PkMeZ2Q2Ogka9/1/GG0blS6N1p7o9rccEiLmp2pZtnK/7pXDzsPR
 7z0S8Con6Fw0+JGfIVK5/uv5hwiv/k2+JqeFt/xGN53M704ni/op2BSybnVxX/oN8rw==
X-Gm-Gg: AYBFou2MX5JWCUdozUOPyOEChjxgIdzv17XAbR72QfNBLh4ftS6ARp7dc5HNXh3m5/4
 L4hRJTAEJxSHu3gQX9bLvOyUIuWzaX7B5lYzoyLeNI0A7+dml6IJ9Ml058lxb+/GMKB0yYub82n
 8gjMuBdfeTLkreUttTaDh8nejWslpiiTRWcvs+Qu/qu27gRgDdZjZ/bxQgz6OQ232JekIwP+NwE
 ooWRuvqLnsnRYuvfHH9jPeWS4W/uWclf6FCPJzYNn53q79zAfUCP7ty82D/+CBTDup84Q0zP2AF
 NEQfQo4yLdfSYTatKBQXwNdXuXJ5W2KjcsDeYNpNUIuw9Vgv3EFxqwlGuj5Q6j2FhZ2M9KmAOam
 Q3T3Qxk5Za1VTL5PwcxhWreMEhSUmK4Q75pUx
X-Received: by 2002:a05:622a:22c7:10b0:535:84e3:b28e with SMTP id
 d75a77b69052e-53584e3e1f6mr32875511cf.50.1791427004074; 
 Wed, 07 Oct 2026 19:36:44 -0700 (PDT)
X-Received: by 2002:a05:622a:22c7:10b0:535:84e3:b28e with SMTP id
 d75a77b69052e-53584e3e1f6mr32875351cf.50.1791427003346; 
 Wed, 07 Oct 2026 19:36:43 -0700 (PDT)
Received: from [192.168.10.208] ([185.243.168.149])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91997d66da0sm32816366d6.39.2026.10.07.19.36.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Oct 2026 19:36:42 -0700 (PDT)
Message-ID: <2c621af7-892f-456d-8620-4ca0a1108e5e@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 23:36:38 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 03/11] target/riscv: Implement core SMMPT lookup logic
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, chao.liu.zevorn@gmail.com,
 liwei1518@gmail.com, qemu-riscv@nongnu.org, rahul@summations.net,
 xiangyi.zeng@linux.alibaba.com, cxx194832@alibaba-inc.com,
 Huang Tao <eric.huang@linux.alibaba.com>,
 TANG Tiancheng <lyndra@linux.alibaba.com>
References: <20260723200325.24969-1-zhiwei_liu@linux.alibaba.com>
 <20260723200325.24969-4-zhiwei_liu@linux.alibaba.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260723200325.24969-4-zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: oIbCRXndSoNbe3MY7K7DZHnIApu_0PiZ
X-Authority-Analysis: v=2.4 cv=E4dYNqdl c=1 sm=1 tr=0 ts=6ac701bd cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=Adc43iEMMYzOb2FTIT2GVQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=SRrdq9N9AAAA:8 a=EUspDBNiAAAA:8 a=48_SmKypcvxgndsv8iEA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAxMCBTYWx0ZWRfX0vl0E/5hEXiE
 69M59bHh/Pk1h49+jZ19q+zDycgChSsw3iyb6ZCtd6Uoldf3sxE7E+Jh0t5TL7LfRrxBPbAqhWk
 yys4s2tWA9UD2GrfiakRzmpaXR6EEfM=
X-Proofpoint-GUID: oIbCRXndSoNbe3MY7K7DZHnIApu_0PiZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAxMCBTYWx0ZWRfX9xAWnX+vjJEu
 r6vWtEBFSub0ZMwOcUpYo+g1Je9SSAgBPsZ01T4l2DnAUhovt/BwpWa2wzbKhREBjKPorXmXoDM
 U2XvVfS4qF9D7m0BbKps/gI5VPYu36OfdE8d4ZHEWz+mDcoivhecFFd9qgo8Z2N1Mwf+L6VMvHM
 1XZ5w45L17KbQHgFvTVY9vc+ChsusVF/oNUuqLbuDdogLOffAC0o5w3qM7Ak5zZGg0ABhijQYXB
 CI1WJioYuWpL1gLQQ/BpqRjg2qvUWDno4er+6cCC7pY9vos5VzfZYnVe/6tP4fOMHBKppL7SfuX
 JLwM7coxemoZO/xYIDamXoDAuLEfb1cmHAgWrqlgK9+vxOX1/HDNyOufF3T0p5i9OTyEuTtuv00
 wZqNYLmnzJMYpu/O3zJq61J41FuIUdkcvbF1wvUBty0ddd2tAmTduoDv7SJqRsDXigvD4GS3g0M
 LMI8dwDqz7x1xCF9Dhg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_01,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080010
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



On 7/23/2026 5:03 PM, LIU Zhiwei wrote:
> This patch introduces the core implementation for the Memory Protection Table
> (MPT) walk, which is the central mechanism of the SMMPT extension.
> 
> A new file, `riscv_smmpt.c`, is added to encapsulate the MPT logic. It
> implements the `smmpt_lookup()` function, which performs a multi-level
> page table-like walk starting from the physical address specified in the
> `mptppn` CSR field. This walk determines the access permissions (read,
> write, execute) for a given physical address.
> 
> The implementation supports various SMMPT modes (SMMPT34, SMMPT43, etc.)
> and correctly handles leaf and non-leaf entries, including reserved bit
> checks. Both non-NAPOT leaf entries (per-page XWR tuples) and NAPOT leaf
> entries (a single XWR tuple with a G granularity field) are supported, as
> defined by the v0.4.9 MPTE format. Helper functions for parsing MPT
> entries and converting access permissions are included in the new
> `riscv_smmpt.h` header.
> 
> Co-authored-by: Huang Tao <eric.huang@linux.alibaba.com>
> Co-authored-by: TANG Tiancheng <lyndra@linux.alibaba.com>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> ---
>   target/riscv/meson.build      |   1 +
>   target/riscv/riscv_smmpt.c    | 339 ++++++++++++++++++++++++++++++++++
>   target/riscv/riscv_smmpt.h    |   5 +
>   target/riscv/tcg/cpu_helper.c |   6 +-
>   target/riscv/tcg/pmp.h        |   3 +
>   5 files changed, 351 insertions(+), 3 deletions(-)
>   create mode 100644 target/riscv/riscv_smmpt.c
> 
> diff --git a/target/riscv/meson.build b/target/riscv/meson.build
> index 42d0f6d538..51257a8f3a 100644
> --- a/target/riscv/meson.build
> +++ b/target/riscv/meson.build
> @@ -22,6 +22,7 @@ riscv_ss.add(files(
>   riscv_system_ss = ss.source_set()
>   riscv_system_ss.add(files(
>     'arch_dump.c',
> +  'riscv_smmpt.c',
>     'monitor.c',
>     'machine.c',
>     'time_helper.c',
> diff --git a/target/riscv/riscv_smmpt.c b/target/riscv/riscv_smmpt.c
> new file mode 100644
> index 0000000000..5bdc474dbb
> --- /dev/null
> +++ b/target/riscv/riscv_smmpt.c
> @@ -0,0 +1,339 @@
> +/*
> + * QEMU RISC-V Smmpt (Memory Protection Table)
> + *
> + * Copyright (c) 2024 Alibaba Group. All rights reserved.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * Implements the MPT lookup algorithm per SMMTT specification v0.4.9.
> + *
> + * MPTE format (v0.4.9):
> + *
> + * 32-bit non-leaf:  V[0], L=0[1], Reserved[9:2], PPN[31:10]
> + * 32-bit non-NAPOT leaf: V[0], L=1[1], N=0[2], Reserved[7:3], XWR[31:8]
> + * 32-bit NAPOT leaf: V[0], L=1[1], N=1[2], Reserved[7:3], XWR[10:8], 0[11],
> + *                    G[15:12], Reserved[31:16]
> + *
> + * 64-bit non-leaf:  V[0], L=0[1], Reserved[9:2], PPN[53:10], Reserved[63:54]
> + * 64-bit non-NAPOT leaf: V[0], L=1[1], N=0[2], Reserved[7:3], XWR[55:8],
> + *                         Reserved[63:56]
> + * 64-bit NAPOT leaf: V[0], L=1[1], N=1[2], Reserved[7:3], XWR[10:8], 0[11],
> + *                    G[15:12], Reserved[63:16]
> + */
> +
> +#include "qemu/osdep.h"
> +#include "riscv_smmpt.h"
> +#include "tcg/pmp.h"
> +#include "exec/page-protection.h"
> +#include "system/memory.h"
> +
> +typedef uint64_t load_entry_fn(AddressSpace *, hwaddr,
> +                               MemTxAttrs, MemTxResult *);
> +
> +static uint64_t load_entry_32(AddressSpace *as, hwaddr addr,
> +                              MemTxAttrs attrs, MemTxResult *result)
> +{
> +    return address_space_ldl_le(as, addr, attrs, result);
> +}
> +
> +static uint64_t load_entry_64(AddressSpace *as, hwaddr addr,
> +                              MemTxAttrs attrs, MemTxResult *result)
> +{
> +    return address_space_ldq_le(as, addr, attrs, result);
> +}
> +
> +static inline bool mpte_is_valid(uint64_t mpte)
> +{
> +    return mpte & 0x1;
> +}
> +
> +static inline bool mpte_is_leaf(uint64_t mpte)
> +{
> +    return mpte & 0x2;
> +}
> +
> +static inline bool mpte_get_n(uint64_t mpte)
> +{
> +    return (mpte >> 2) & 0x1;
> +}
> +
> +/*
> + * Get reserved bits from MPTE. Returns non-zero if any reserved bit is set.
> + */
> +static uint64_t mpte_get_rsv(CPURISCVState *env, uint64_t mpte)
> +{
> +    RISCVMXL mxl = riscv_cpu_mxl(env);
> +    bool leaf = mpte_is_leaf(mpte);
> +    bool napot = mpte_get_n(mpte);
> +
> +    if (mxl == MXL_RV32) {
> +        if (!leaf) {
> +            /* non-leaf32: Reserved = bits[9:2] */
> +            return extract32(mpte, 2, 8);
> +        }
> +        if (!napot) {
> +            /* non-NAPOT leaf32: Reserved = bits[7:3] (XWR fills [31:8]) */
> +            return extract32(mpte, 3, 5);
> +        }
> +        /* NAPOT leaf32: Reserved = bits[7:3] | bit[11] (mbz) | bits[31:16] */
> +        return extract32(mpte, 3, 5) | extract32(mpte, 11, 1) |
> +               extract32(mpte, 16, 16);
> +    }
> +
> +    /* RV64 */
> +    if (!leaf) {
> +        /* non-leaf64: Reserved = bits[9:2] | bits[63:54] */
> +        return extract64(mpte, 2, 8) | extract64(mpte, 54, 10);
> +    }
> +    if (!napot) {
> +        /* non-NAPOT leaf64: Reserved = bits[7:3] | bits[63:56] */
> +        return extract64(mpte, 3, 5) | extract64(mpte, 56, 8);
> +    }
> +    /* NAPOT leaf64: Reserved = bits[7:3] | bit[11] (mbz) | bits[63:16] */
> +    return extract64(mpte, 3, 5) | extract64(mpte, 11, 1) |
> +           extract64(mpte, 16, 48);
> +}
> +
> +/*
> + * Get PPN from a non-leaf MPTE.
> + * RV32 non-leaf: PPN = bits[31:10] (22 bits)
> + * RV64 non-leaf: PPN = bits[53:10] (44 bits)
> + */
> +static uint64_t mpte_get_ppn(CPURISCVState *env, uint64_t mpte)
> +{
> +    RISCVMXL mxl = riscv_cpu_mxl(env);
> +
> +    if (mxl == MXL_RV32) {
> +        return extract32(mpte, 10, 22);
> +    }
> +    return extract64(mpte, 10, 44);
> +}
> +
> +/*
> + * Get XWR permission for a specific page index from a non-NAPOT leaf.
> + * The XWR base bit is 8 for both RV32 and RV64; only the number of
> + * entries differs (pi in 0..7 for RV32, 0..15 for RV64).
> + */
> +static uint32_t mpte_get_xwr(CPURISCVState *env, uint64_t mpte, int pi)
> +{
> +    return extract64(mpte, 8 + pi * 3, 3);
> +}
> +
> +/*
> + * Get single XWR from a NAPOT leaf.
> + * The NAPOT XWR base bit is 8 for both RV32 and RV64 (bits[10:8]).
> + */
> +static uint32_t mpte_get_napot_xwr(CPURISCVState *env, uint64_t mpte)
> +{
> +    return extract64(mpte, 8, 3);
> +}
> +
> +/*
> + * Get G field from a NAPOT leaf.
> + * The G base bit is 12 for both RV32 and RV64 (bits[15:12]).
> + */
> +static uint32_t mpte_get_g(CPURISCVState *env, uint64_t mpte)
> +{
> +    return extract64(mpte, 12, 4);
> +}
> +
> +/*
> + * Validate the G encoding for the given MPT mode.
> + * Smmpt34: only G=6 is valid
> + * Smmpt43/52/64: only G=4 is valid
> + */
> +static bool mpte_validate_g(uint32_t g, mpt_mode_t mode)
> +{
> +    switch (mode) {
> +    case SMMPT34:
> +        return g == 6;
> +    case SMMPT43:
> +    case SMMPT52:
> +    case SMMPT64:
> +        return g == 4;
> +    default:
> +        return false;
> +    }
> +}
> +
> +/*
> + * Get page number index pn[i] from the supervisor physical address.
> + *
> + * Smmpt34 (34-bit SPA):
> + *   SPA layout: range_offset[14:0], pn[0][24:15] (10 bits),
> + *   pn[1][33:25] (9 bits)
> + *
> + * Smmpt43/52/64 (RV64 MPT):
> + *   SPA layout: range_offset[15:0], pn[0][24:16] (9 bits), ...
> + *   For Smmpt64, pn[4] (top level) is 12 bits.
> + */
> +static int mpt_get_pn(hwaddr addr, int i, mpt_mode_t mode)
> +{
> +    if (mode == SMMPT34) {
> +        return i == 0
> +            ? extract64(addr, 15, 10)
> +            : extract64(addr, 25, 9);
> +    } else {
> +        int offset = 16 + i * 9;
> +        if ((mode == SMMPT64) && (i == 4)) {
> +            return extract64(addr, offset, 12);
> +        } else {
> +            return extract64(addr, offset, 9);
> +        }
> +    }
> +}
> +
> +/*
> + * Get the page index within a leaf MPTE.
> + *
> + * Smmpt34: pi = SPA[14:12] (3 bits) for level 0, SPA[24:22] for level 1
> + * Smmpt43/52/64: pi = SPA[offset-4 +: 4] (4 bits)
> + */
> +static int mpt_get_pi(hwaddr addr, int i, mpt_mode_t mode)
> +{
> +    if (mode == SMMPT34) {
> +        return i == 0
> +            ? extract64(addr, 12, 3)
> +            : extract64(addr, 22, 3);
> +    } else {
> +        int offset = 16 + i * 9;
> +        return extract64(addr, offset - 4, 4);
> +    }
> +}
> +
> +/*
> + * Check XWR permission bits against the access type.
> + * Returns true if access is allowed.
> + *
> + * The 3-bit XWR field uses the same bit order as RISC-V PTE permissions
> + * (bit0 = R, bit1 = W, bit2 = X), matching QEMU's PAGE_READ / PAGE_WRITE /
> + * PAGE_EXEC. As with PTEs, writable-but-not-readable encodings are reserved.
> + *
> + * XWR encoding (bit2=X, bit1=W, bit0=R):
> + *   000 = No access
> + *   001 = Read only
> + *   010 = Reserved (fault)
> + *   011 = Read + Write
> + *   100 = Execute only
> + *   101 = Read + Execute
> + *   110 = Reserved (fault)
> + *   111 = Read + Write + Execute
> + */
> +static bool mpt_check_xwr(uint32_t xwr, int *prot, MMUAccessType access_type)
> +{
> +    switch (xwr) {
> +    case 0: /* No access */
> +        return false;
> +    case PAGE_EXEC: /* 100: Execute only */
> +        *prot = PAGE_EXEC;
> +        return access_type == MMU_INST_FETCH;
> +    case PAGE_READ | PAGE_EXEC: /* 101: Read + Execute */
> +        *prot = PAGE_READ | PAGE_EXEC;
> +        return (access_type == MMU_DATA_LOAD ||
> +                access_type == MMU_INST_FETCH);
> +    case PAGE_READ: /* 001: Read only */
> +        *prot = PAGE_READ;
> +        return access_type == MMU_DATA_LOAD;
> +    case PAGE_READ | PAGE_WRITE: /* 011: Read + Write */
> +        *prot = PAGE_READ | PAGE_WRITE;
> +        return (access_type == MMU_DATA_LOAD ||
> +                access_type == MMU_DATA_STORE);
> +    case PAGE_READ | PAGE_WRITE | PAGE_EXEC: /* 111: R+W+X */
> +        *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
> +        return true;
> +    default: /* 010, 110: Reserved - fault */
> +        return false;
> +    }
> +}
> +
> +static bool smmpt_lookup(CPURISCVState *env, hwaddr addr, mpt_mode_t mode,
> +                         int *prot, MMUAccessType access_type)
> +{
> +    MemTxResult res;
> +    MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
> +    CPUState *cs = env_cpu(env);
> +    hwaddr mpte_addr, base = (hwaddr)env->mptppn << PGSHIFT;
> +    load_entry_fn *load_entry;
> +    uint32_t mptesize, levels, xwr, g;
> +    int pn, pi, pmp_prot, pmp_ret;
> +    uint64_t mpte;
> +
> +    switch (mode) {
> +    case SMMPT34:
> +        load_entry = &load_entry_32; levels = 2; mptesize = 4; break;
> +    case SMMPT43:
> +        load_entry = &load_entry_64; levels = 3; mptesize = 8; break;
> +    case SMMPT52:
> +        load_entry = &load_entry_64; levels = 4; mptesize = 8; break;
> +    case SMMPT64:
> +        load_entry = &load_entry_64; levels = 5; mptesize = 8; break;
> +    case SMMPTBARE:
> +        *prot = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
> +        return true;
> +    default:
> +        g_assert_not_reached();
> +        break;
> +    }

We don't need this 'break' after g_assert_not_reached() - if execution hits this
assert the whole process will exit.


With the break removed:


Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

> +
> +    for (int i = levels - 1; i >= 0; i--) {
> +        /* Step 1: Get pn[i] as the MPT index */
> +        pn = mpt_get_pn(addr, i, mode);
> +
> +        /* Step 2: Load MPTE from memory */
> +        mpte_addr = base + pn * mptesize;
> +        pmp_ret = get_physical_address_pmp(env, &pmp_prot, mpte_addr,
> +                                           mptesize, MMU_DATA_LOAD, PRV_M);
> +        if (pmp_ret != TRANSLATE_SUCCESS) {
> +            return false;
> +        }
> +        mpte = load_entry(cs->as, mpte_addr, attrs, &res);
> +        if (res != MEMTX_OK) {
> +            return false;
> +        }
> +
> +        /* Step 3: Check valid bit and reserved bits */
> +        if (!mpte_is_valid(mpte) || mpte_get_rsv(env, mpte)) {
> +            return false;
> +        }
> +
> +        /* Step 3 (cont): non-leaf with N=1 is a fault */
> +        if (!mpte_is_leaf(mpte) && mpte_get_n(mpte)) {
> +            return false;
> +        }
> +
> +        /* Step 4: Process non-leaf node */
> +        if (!mpte_is_leaf(mpte)) {
> +            if (i == 0) {
> +                return false;
> +            }
> +            base = mpte_get_ppn(env, mpte) << PGSHIFT;
> +            continue;
> +        }
> +
> +        /* Step 5 & 6: Process leaf node */
> +        if (!mpte_get_n(mpte)) {
> +            /* Step 5: Non-NAPOT leaf - get XWR[pi] */
> +            pi = mpt_get_pi(addr, i, mode);
> +            xwr = mpte_get_xwr(env, mpte, pi);
> +        } else {
> +            /* Step 6: NAPOT leaf - validate G, get single XWR */
> +            g = mpte_get_g(env, mpte);
> +            if (!mpte_validate_g(g, mode)) {
> +                return false;
> +            }
> +            xwr = mpte_get_napot_xwr(env, mpte);
> +        }
> +
> +        /* Step 7: Check permission */
> +        return mpt_check_xwr(xwr, prot, access_type);
> +    }
> +    return false;
> +}
> +
> +bool smmpt_check_access(CPURISCVState *env, hwaddr addr,
> +                        int *prot, MMUAccessType access_type)
> +{
> +    mpt_mode_t mode = env->mptmode;
> +
> +    return smmpt_lookup(env, addr, mode, prot, access_type);
> +}
> diff --git a/target/riscv/riscv_smmpt.h b/target/riscv/riscv_smmpt.h
> index 74dcccf4be..c15637036e 100644
> --- a/target/riscv/riscv_smmpt.h
> +++ b/target/riscv/riscv_smmpt.h
> @@ -9,6 +9,9 @@
>   #ifndef RISCV_SMMPT_H
>   #define RISCV_SMMPT_H
>   
> +#include "cpu.h"
> +#include "exec/mmu-access-type.h"
> +
>   typedef enum {
>       SMMPTBARE = 0,
>       SMMPT34   = 1,
> @@ -18,4 +21,6 @@ typedef enum {
>       SMMPTMAX
>   } mpt_mode_t;
>   
> +bool smmpt_check_access(CPURISCVState *env, hwaddr addr,
> +                        int *prot, MMUAccessType access_type);
>   #endif
> diff --git a/target/riscv/tcg/cpu_helper.c b/target/riscv/tcg/cpu_helper.c
> index 07d9222652..354506c565 100644
> --- a/target/riscv/tcg/cpu_helper.c
> +++ b/target/riscv/tcg/cpu_helper.c
> @@ -903,9 +903,9 @@ void riscv_cpu_set_mode(CPURISCVState *env, privilege_mode_t newpriv,
>    * @access_type: The type of MMU access
>    * @mode: Indicates current privilege level.
>    */
> -static int get_physical_address_pmp(CPURISCVState *env, int *prot, hwaddr addr,
> -                                    int size, MMUAccessType access_type,
> -                                    privilege_mode_t mode)
> +int get_physical_address_pmp(CPURISCVState *env, int *prot, hwaddr addr,
> +                             int size, MMUAccessType access_type,
> +                             privilege_mode_t mode)
>   {
>       pmp_priv_t pmp_priv;
>       bool pmp_has_privs;
> diff --git a/target/riscv/tcg/pmp.h b/target/riscv/tcg/pmp.h
> index 4c95c2767a..16c0db93c6 100644
> --- a/target/riscv/tcg/pmp.h
> +++ b/target/riscv/tcg/pmp.h
> @@ -80,6 +80,9 @@ void pmp_update_rule_nums(CPURISCVState *env);
>   uint32_t pmp_get_num_rules(CPURISCVState *env);
>   int pmp_priv_to_page_prot(pmp_priv_t pmp_priv);
>   void pmp_unlock_entries(CPURISCVState *env);
> +int get_physical_address_pmp(CPURISCVState *env, int *prot, hwaddr addr,
> +                             int size, MMUAccessType access_type,
> +                             privilege_mode_t mode);
>   
>   #define MSECCFG_MML_ISSET(env) get_field(env->mseccfg, MSECCFG_MML)
>   #define MSECCFG_MMWP_ISSET(env) get_field(env->mseccfg, MSECCFG_MMWP)


