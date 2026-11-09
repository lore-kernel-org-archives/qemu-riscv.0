Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6D7606A326
	for <qemu-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 19:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eZOHBjD/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gBs24QXF
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xQVU1-0002CX-Th; Mon, 09 Nov 2026 14:56:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQVTW-00027O-GW
 for qemu-riscv@nongnu.org; Mon, 09 Nov 2026 14:56:20 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xQVTS-0003ty-Rm
 for qemu-riscv@nongnu.org; Mon, 09 Nov 2026 14:56:17 -0500
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A9HGwbV4125811
 for <qemu-riscv@nongnu.org>; Mon, 9 Nov 2026 19:56:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2+EXaHpDc72ldrAuZGfHui0hFMnIRkBeoi4cZSnr/Wk=; b=eZOHBjD/zIr59zQK
 b94Y83kzjb1iMT1VtlEpXsN1enZR7Mh4TESASikNwCPio1Ba/PAmSfPJOyxeDe9c
 LK9CJGHOHxLBv05/WCUIQIpbo6wbo7jQL0vjXjfk4Tuzn9s5POpA9eP9FuEHKCNt
 DMYsa9ECOj8Sqg153te6sYfw7YlH8sq0zxjkVMvfSlpkpxtrXmwqvkruelO14pBU
 +KngdtE5+nkzHOrNGI5O685zR1HZdreP2Afv4fWa8rjeHbDrQoc/RJzS2pBs+nm3
 ElhgBb4hJLOlgWLZ+L/oDUkUJSG9i53d9H1K+cBEL+EIOXPYKk+nJJ6a9hyLNgdl
 CtRBPQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hudcj9u57-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 09 Nov 2026 19:56:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93cb93c874bso269907285a.0
 for <qemu-riscv@nongnu.org>; Mon, 09 Nov 2026 11:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794254172; x=1794858972; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=2+EXaHpDc72ldrAuZGfHui0hFMnIRkBeoi4cZSnr/Wk=;
 b=gBs24QXFkGdKeiiJ5T4i4oe2hxRisyjrDm3B59OHl4jklwH2hPJVdk/iVRbjjAy4/2
 jv3rUeor+hpdNRwsU/laQN299zWBPzsXEL3juVtmHRHY8mU1rk6zOcFsW2a6b59/4xfa
 j1NY4NtN1f80abqaaFfRe0/9Czi7hqFA9G/0DSOf5Xq0GgpH/w6yj7OBMAoQv4j8gLYo
 +g889UCo6BfYLmhCaIw+qpz7HbX23/xIzYzm41rwYTWOcunvlYCWHqBxd8hjUG1pU8Bz
 NLl6SThBqo5qgsZa9eYjU6fok3xxUpaFrOafBUxRCfzlE1ghbBysx/8iDkrV/aZE3dRI
 r3qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794254172; x=1794858972;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=2+EXaHpDc72ldrAuZGfHui0hFMnIRkBeoi4cZSnr/Wk=;
 b=sR0LjyxLp9A7ttlhLOBLXeG0WkACL3UMY8BYSZB+WZYJ4ORsCYxoIYbw25dw9EL6Zz
 kSkyJYc/j+oyadqxLp4MjqFIenWmeO/G0K3g7gkjyHnNjRdPCVphAs5pzWnhYgQh3Pqk
 NRfsS2VB44lVerJ3SBE7g4biJ7mQeOpooXalqKNx26gBAC/v8apTlZJ0Qy4Pu8UN0bFb
 Sqdnx2OXLUKYsmtx1JvRCsZVJjOMKxQ+aDyXeoooLKH5zAC5u1tWGTaZu2oNs8XSt3IY
 lDQXmhlAMFPr9Uj84kCc1P65hLGYYOUh8ZTc2yz61xFNbj6G4bv8sdDnARq/Ck+YdMLY
 oXXQ==
X-Forwarded-Encrypted: i=1;
 AL+hErEtj9DfuDJwbZ9RfkoNE7V4bm0Y0TbWiiqx0sO1RogNkbsDHVbiWJEtvJw6smPFYeIhFTb6kxNo20L8@nongnu.org
X-Gm-Message-State: APuU4Z+rpSbAr5xqv6ePiwJJgWh2P8UsfadNRYB1vkaWJ/TMPtezrEHW
 5IuPYHh8rk0x+X4wMw3gr8gUoVOC6c811gEAXmyDzt35JKxY4x9Xt9eN5kGQwMUqvenrdEY+dSL
 uFLZ3+Ox8ECA/bc2HC3W2BWevYRLzs1HdtRMn0u4NnR/wAdk9k8ipyyr57w==
X-Gm-Gg: AYBFou1NIcgXmoGzDhD3cxZV+VSI17ucJr+8AuyDrOxuJIY81CkurEYpwJJ+yg7vnU/
 x0a+RavTXxTFeEjrOrdVqeHvKG8nhTXyOTLBAxSiaNgRVaXOt7Ew4OdQW21F7/YozB0MTZccPuz
 c+HS+mJ7qLlQkadc5PnXwy1FGXGX0perccRSJ0LMSe1k5M04ocaQJvmE7EzHLxIODlzBQh7nW9g
 Ku1/IR2gqa3caQSI6yOnZfHmUoCCYdXFvCtVkc1K3fHxIOwDiql7+1FTcoLQHh5Ct7AMI0ha+AS
 Qr/0OHcvZZUejmPQvwIlcI7u08YA5OTtBOrg02QRyYX+8dUJK7zefuz1qMCV8rSIaob8UFH7eX4
 kalW7Pl2hGmN92ClrEs6rXT+DK2VP5lWXwhSDgdwxHSAZ318zYHgAlDs7imCNcka/5FiRripjfT
 bB/jmrZCBa
X-Received: by 2002:a05:620a:44ca:b0:93f:231:9ff with SMTP id
 af79cd13be357-9479f220178mr84951085a.27.1794254171959; 
 Mon, 09 Nov 2026 11:56:11 -0800 (PST)
X-Received: by 2002:a05:620a:44ca:b0:93f:231:9ff with SMTP id
 af79cd13be357-9479f220178mr84946985a.27.1794254171387; 
 Mon, 09 Nov 2026 11:56:11 -0800 (PST)
Received: from [192.168.68.100] ([152.234.124.231])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9479e73c3d0sm52467585a.11.2026.11.09.11.56.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2026 11:56:10 -0800 (PST)
Message-ID: <8911070d-8caa-4695-aa81-3733d508fb41@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 16:56:07 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 03/38] target/riscv: rvv: Introduce RVBNA algorithm
 for Zvdota/Zvbdota extensions
To: Max Chou <max.chou@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>
References: <20261104194155.679241-1-max.chou@sifive.com>
 <20261104194155.679241-4-max.chou@sifive.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261104194155.679241-4-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ODnzcVN34QMd5s9dFT_6MzlMg2dMnFzn
X-Proofpoint-ORIG-GUID: ODnzcVN34QMd5s9dFT_6MzlMg2dMnFzn
X-Authority-Analysis: v=2.4 cv=au0nmiZV c=1 sm=1 tr=0 ts=6af2255d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=8elE1k/PHQNyZ14TNTodlQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pFyQfRViAAAA:8 a=EUspDBNiAAAA:8 a=69wJf7TsAAAA:8 a=YEB5RgzmAAAA:8
 a=fAVkfpSqpBLX86kczpIA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=oJz5jJLG1JtSoe7EL652:22 a=Fg1AiH1G6rFz08G2ETeA:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA3OCBTYWx0ZWRfX6gfXowPPnQu0
 NvvZ8ick3/txFsE3HO1Lfs4SiMfizquVpCfXsPG9BbYe31U1UIyAoLNyxlyJRHz/J2n/LB6xfQ3
 a6hL8Zbb+h2YQHweNloI+Asb+V1qDRA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA3OCBTYWx0ZWRfXyj9wv8p7YReL
 FLQ5ZDCNeqkJ0yD6fnO/YDNjbUUlJPMd1juceyVFHiC1Bu7uv2m7fkrj5J8cmB0A7NpLijNXSoc
 93U8RdE5J5mbOxIipgMjjPzfMQEsAKB3PIOAw6wb2KnAiFvIAGh7uAMVLquAKrHsnya9YdQdgjD
 FaK4ObQRqkrJmVc1P2GB/NeL8Pv6OsLoQC4JKP618cKE0K+x/IOhi2LfCTKnu6FUfyWrHk3bKz/
 AQzIdpilQcsRjjWorymKhbaOkBt/BnpvG+qpdpDS/hoIEFCYXjluoWG60OGn+elMo4Z8MuXlkmn
 r2kZ5nJiNnU2/MEAYmdU3C9gsmUYcAw66+vOCRWUPaXiLA2zVaNnp/Hto8wNjuEc4Hq1lG2q/f2
 QjPgMdPteh651xfnJ0+1wqc1ufZL2QIDlfmDZKxQsrMJND2lkeVQcH7ct6h+BdO4HSc41DYdMk9
 AUHN5MsOKqQKyXEny/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090078
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/4/2026 4:41 PM, Max Chou wrote:
> The RISC-V Bulk Normalization Algorithm (RVBNA) is a scheme employed by
> multiple RISC-V extensions (e.g. Zvdota/Zvbdota family) for efficient
> computation of floating-point dot products.
> 
> Signed-off-by: Max Chou <max.chou@sifive.com>
> ---


Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   MAINTAINERS                      |   6 +
>   target/riscv/tcg/meson.build     |   2 +-
>   target/riscv/tcg/rvbna.c         | 185 +++++++++++++++++++++++++++++++
>   target/riscv/tcg/rvbna.h         |  40 +++++++
>   target/riscv/tcg/vector_helper.c |   1 +
>   5 files changed, 233 insertions(+), 1 deletion(-)
>   create mode 100644 target/riscv/tcg/rvbna.c
>   create mode 100644 target/riscv/tcg/rvbna.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 55463103ff1..b91e5925344 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -416,6 +416,12 @@ F: target/riscv/tcg/xsf_helper.c
>   F: disas/riscv-xsf*
>   F: tests/tcg/riscv64/test-xsfvqmacc.S
>   
> +RISC-V Bulk Normalization Algorithm (RVBNA)
> +M: Max Chou <max.chou@sifive.com>
> +L: qemu-riscv@nongnu.org
> +S: Supported
> +F: target/riscv/tcg/rvbna.*
> +
>   RENESAS RX CPUs
>   R: Yoshinori Sato <yoshinori.sato@nifty.com>
>   S: Orphan
> diff --git a/target/riscv/tcg/meson.build b/target/riscv/tcg/meson.build
> index 86805b30cbc..3b7821178fc 100644
> --- a/target/riscv/tcg/meson.build
> +++ b/target/riscv/tcg/meson.build
> @@ -10,6 +10,7 @@ riscv_ss.add(files(
>     'fpu_helper.c',
>     'm128_helper.c',
>     'op_helper.c',
> +  'rvbna.c',
>     'translate.c',
>     'tcg-cpu.c',
>     'vcrypto_helper.c',
> @@ -27,4 +28,3 @@ riscv_system_ss.add(files(
>     'th_csr.c',
>   ))
>   
> -
> diff --git a/target/riscv/tcg/rvbna.c b/target/riscv/tcg/rvbna.c
> new file mode 100644
> index 00000000000..f6150e4976d
> --- /dev/null
> +++ b/target/riscv/tcg/rvbna.c
> @@ -0,0 +1,185 @@
> +/*
> + * RISC-V Bulk Normalization Algorithm (RVBNA)
> + *
> + * Copyright (c) 2026 SiFive, Inc.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/bitops.h"
> +#include "qemu/host-utils.h"
> +#include "fpu/softfloat.h"
> +#include "fpu/softfloat-macros.h"
> +#include "rvbna.h"
> +
> +static inline int rvbna_guard_bits(uint32_t n_prod)
> +{
> +    g_assert(n_prod > 0);
> +    return 32 - clz32(n_prod - 1);
> +}
> +
> +float32 rvbna_final_f32_add(float32 partial, float32 accumulator,
> +                            float_status *fp_status)
> +{
> +    FloatRoundMode old_rm = get_float_rounding_mode(fp_status);
> +    int old_flags = get_float_exception_flags(fp_status);
> +    int new_flags;
> +    float32 result;
> +
> +    set_float_rounding_mode(float_round_to_odd_inf, fp_status);
> +    set_float_exception_flags(0, fp_status);
> +    result = float32_add(partial, accumulator, fp_status);
> +    new_flags = get_float_exception_flags(fp_status) &
> +                (float_flag_invalid | float_flag_overflow);
> +    set_float_rounding_mode(old_rm, fp_status);
> +    set_float_exception_flags(old_flags | new_flags, fp_status);
> +
> +    return result;
> +}
> +
> +#define RVBNA_STACK_THRESHOLD 8
> +
> +#define GEN_RVBNA(TA, TB, TO, A_E, A_M, B_E, B_M, OUT_E, OUT_M)              \
> +TO rvbna_dot_##TA##_##TB(const TA a[], const TB b[], uint32_t n_prod,        \
> +                         float_status *fp_status)                            \
> +{                                                                            \
> +    int32_t stack_ref_exps[RVBNA_STACK_THRESHOLD];                           \
> +    bool stack_signs[RVBNA_STACK_THRESHOLD];                                 \
> +    uint64_t stack_sigs[RVBNA_STACK_THRESHOLD];                              \
> +    int32_t *prod_ref_exps = stack_ref_exps;                                 \
> +    bool *prod_signs = stack_signs;                                          \
> +    uint64_t *prod_sigs = stack_sigs;                                        \
> +    g_autofree int32_t *heap_ref_exps = NULL;                                \
> +    g_autofree bool *heap_signs = NULL;                                      \
> +    g_autofree uint64_t *heap_sigs = NULL;                                   \
> +    int guard_bits = rvbna_guard_bits(n_prod);                               \
> +    int pad = OUT_M - (A_M + B_M) + guard_bits;                              \
> +    int output_bias = (1 << (OUT_E - 1)) - 1;                                \
> +    int a_exp_bias = (1 << (A_E - 1)) - 1;                                   \
> +    int b_exp_bias = (1 << (B_E - 1)) - 1;                                   \
> +    int ref_bias = output_bias - (a_exp_bias + b_exp_bias);                  \
> +    int max_prod_ref_exp = ref_bias;                                         \
> +    int overflow_exp = (1 << OUT_E) - 1;                                     \
> +    int64_t acc = 0;                                                         \
> +    bool nan_result = false;                                                 \
> +    bool inf_result = false;                                                 \
> +    bool inf_sign = false;                                                   \
> +    bool any_pos_inf = false;                                                \
> +    bool any_neg_inf = false;                                                \
> +    bool any_invalid_prod = false;                                           \
> +    bool any_signan = false;                                                 \
> +    bool op_sign_inf, sign, overflow;                                        \
> +    uint32_t i;                                                              \
> +    uint64_t sig;                                                            \
> +    int lead, exp, sig_bits;                                                 \
> +                                                                             \
> +    g_assert(pad >= 0);                                                      \
> +    if (n_prod > RVBNA_STACK_THRESHOLD) {                                    \
> +        heap_ref_exps = g_new(int32_t, n_prod);                              \
> +        heap_signs = g_new(bool, n_prod);                                    \
> +        heap_sigs = g_new(uint64_t, n_prod);                                 \
> +        prod_ref_exps = heap_ref_exps;                                       \
> +        prod_signs = heap_signs;                                             \
> +        prod_sigs = heap_sigs;                                               \
> +    }                                                                        \
> +                                                                             \
> +    for (i = 0; i < n_prod; i++) {                                           \
> +        bool a_sign = TA##_is_neg(a[i]);                                     \
> +        bool b_sign = TB##_is_neg(b[i]);                                     \
> +        bool a_sub = TA##_is_zero_or_denormal(a[i]);                         \
> +        bool b_sub = TB##_is_zero_or_denormal(b[i]);                         \
> +        bool a_zero = TA##_is_zero(a[i]);                                    \
> +        bool b_zero = TB##_is_zero(b[i]);                                    \
> +        bool a_inf = TA##_is_infinity(a[i]);                                 \
> +        bool b_inf = TB##_is_infinity(b[i]);                                 \
> +        bool a_nan = TA##_is_any_nan(a[i]);                                  \
> +        bool b_nan = TB##_is_any_nan(b[i]);                                  \
> +        bool prod_sign = a_sign ^ b_sign;                                    \
> +        bool invalid_prod = (a_inf && b_zero) || (b_inf && a_zero);          \
> +        bool inf_prod_lhs = a_inf && !b_nan && !b_zero;                      \
> +        bool inf_prod_rhs = b_inf && !a_nan && !a_zero;                      \
> +        bool inf_prod = inf_prod_lhs || inf_prod_rhs;                        \
> +        bool invalid_sum = inf_result && inf_prod &&                         \
> +                           (inf_sign != prod_sign);                          \
> +        uint32_t a_mant = extract32(a[i], 0, A_M);                           \
> +        uint32_t b_mant = extract32(b[i], 0, B_M);                           \
> +        bool a_signan = a_nan && TA##_is_signaling_nan(a[i], fp_status);     \
> +        bool b_signan = b_nan && TB##_is_signaling_nan(b[i], fp_status);     \
> +        uint64_t a_sig = a_mant | (!a_sub << A_M);                           \
> +        uint64_t b_sig = b_mant | (!b_sub << B_M);                           \
> +        bool prod_is_zero = a_zero || b_zero;                                \
> +        bool either_inf = a_inf || b_inf;                                    \
> +        bool either_nan = a_nan || b_nan;                                    \
> +                                                                             \
> +        any_invalid_prod |= invalid_prod;                                    \
> +        nan_result |= a_nan || b_nan || any_invalid_prod || invalid_sum;     \
> +        inf_result |= inf_prod;                                              \
> +        inf_sign = inf_prod ? prod_sign : inf_sign;                          \
> +                                                                             \
> +        prod_signs[i] = prod_sign;                                           \
> +        prod_sigs[i] = (uint64_t)(a_sig * b_sig) << pad;                     \
> +        prod_ref_exps[i] = ref_bias;                                         \
> +        if (!prod_is_zero) {                                                 \
> +            prod_ref_exps[i] += (a_sub ? 1 : extract32(a[i], A_M, A_E)) +    \
> +                                (b_sub ? 1 : extract32(b[i], B_M, B_E));     \
> +        }                                                                    \
> +        max_prod_ref_exp = MAX(prod_ref_exps[i], max_prod_ref_exp);          \
> +                                                                             \
> +        any_pos_inf |= (either_inf && !either_nan && !prod_is_zero &&        \
> +                        (a_sign == b_sign));                                 \
> +        any_neg_inf |= (either_inf && !either_nan && !prod_is_zero &&        \
> +                        (a_sign != b_sign));                                 \
> +        any_signan |= a_signan || b_signan;                                  \
> +    }                                                                        \
> +                                                                             \
> +    op_sign_inf = any_pos_inf && any_neg_inf;                                \
> +                                                                             \
> +    if (nan_result) {                                                        \
> +        if (any_signan || any_invalid_prod || op_sign_inf) {                 \
> +            float_raise(float_flag_invalid, fp_status);                      \
> +        }                                                                    \
> +        return TO##_default_nan(fp_status);                                  \
> +    } else if (inf_result) {                                                 \
> +        return TO##_set_sign(TO##_infinity, inf_sign);                       \
> +    }                                                                        \
> +                                                                             \
> +    for (i = 0; i < n_prod; i++) {                                           \
> +        shift64RightJamming(prod_sigs[i],                                    \
> +                            max_prod_ref_exp - prod_ref_exps[i], &sig);      \
> +        acc += prod_signs[i] ? -(int64_t)sig : (int64_t)sig;                 \
> +    }                                                                        \
> +                                                                             \
> +    sign = acc < 0;                                                          \
> +    sig = sign ? -(uint64_t)acc : acc;                                       \
> +    if (sig == 0) {                                                          \
> +        return 0;                                                            \
> +    }                                                                        \
> +                                                                             \
> +    lead = 63 - clz64(sig);                                                  \
> +    exp = max_prod_ref_exp - OUT_M - guard_bits + lead;                      \
> +    overflow = exp >= overflow_exp;                                          \
> +    if (overflow) {                                                          \
> +        float_raise(float_flag_overflow, fp_status);                         \
> +        sig = 0;                                                             \
> +        exp = overflow_exp;                                                  \
> +    } else {                                                                 \
> +        sig_bits = MAX(0, exp <= 0 ? OUT_M - (1 - exp) : OUT_M);             \
> +        if (lead > sig_bits) {                                               \
> +            shift64RightJamming(sig, lead - sig_bits, &sig);                 \
> +        } else {                                                             \
> +            sig <<= (sig_bits - lead);                                       \
> +        }                                                                    \
> +        exp = MAX(exp, 0);                                                   \
> +    }                                                                        \
> +    return (TO)deposit64(deposit64(sig, OUT_M, OUT_E, exp),                  \
> +                         OUT_M + OUT_E,                                      \
> +                         1, sign);                                           \
> +}
> +
> +GEN_RVBNA(float8_e4m3, float8_e4m3, float32, 4, 3, 4, 3, 8, 23)
> +GEN_RVBNA(float8_e4m3, float8_e5m2, float32, 4, 3, 5, 2, 8, 23)
> +GEN_RVBNA(float8_e5m2, float8_e4m3, float32, 5, 2, 4, 3, 8, 23)
> +GEN_RVBNA(float8_e5m2, float8_e5m2, float32, 5, 2, 5, 2, 8, 23)
> +GEN_RVBNA(float16, float16, float32, 5, 10, 5, 10, 8, 23)
> +GEN_RVBNA(bfloat16, bfloat16, float32, 8, 7, 8, 7, 8, 23)
> diff --git a/target/riscv/tcg/rvbna.h b/target/riscv/tcg/rvbna.h
> new file mode 100644
> index 00000000000..d4d3eced952
> --- /dev/null
> +++ b/target/riscv/tcg/rvbna.h
> @@ -0,0 +1,40 @@
> +/*
> + * RISC-V Bulk Normalization Algorithm (RVBNA)
> + *
> + * Copyright (c) 2026 SiFive, Inc.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#ifndef TARGET_RISCV_TCG_RVBNA_H
> +#define TARGET_RISCV_TCG_RVBNA_H
> +
> +#include "fpu/softfloat.h"
> +
> +float32 rvbna_final_f32_add(float32 partial, float32 accumulator,
> +                            float_status *fp_status);
> +
> +float32 rvbna_dot_float8_e4m3_float8_e4m3(const float8_e4m3 a[],
> +                                          const float8_e4m3 b[],
> +                                          uint32_t n_prod,
> +                                          float_status *fp_status);
> +float32 rvbna_dot_float8_e4m3_float8_e5m2(const float8_e4m3 a[],
> +                                          const float8_e5m2 b[],
> +                                          uint32_t n_prod,
> +                                          float_status *fp_status);
> +float32 rvbna_dot_float8_e5m2_float8_e4m3(const float8_e5m2 a[],
> +                                          const float8_e4m3 b[],
> +                                          uint32_t n_prod,
> +                                          float_status *fp_status);
> +float32 rvbna_dot_float8_e5m2_float8_e5m2(const float8_e5m2 a[],
> +                                          const float8_e5m2 b[],
> +                                          uint32_t n_prod,
> +                                          float_status *fp_status);
> +float32 rvbna_dot_float16_float16(const float16 a[], const float16 b[],
> +                                  uint32_t n_prod,
> +                                  float_status *fp_status);
> +float32 rvbna_dot_bfloat16_bfloat16(const bfloat16 a[], const bfloat16 b[],
> +                                    uint32_t n_prod,
> +                                    float_status *fp_status);
> +
> +#endif
> diff --git a/target/riscv/tcg/vector_helper.c b/target/riscv/tcg/vector_helper.c
> index 917a48b5106..172ae0f11dc 100644
> --- a/target/riscv/tcg/vector_helper.c
> +++ b/target/riscv/tcg/vector_helper.c
> @@ -31,6 +31,7 @@
>   #include "tcg/tcg-gvec-desc.h"
>   #include "internals.h"
>   #include "vector_internals.h"
> +#include "rvbna.h"
>   #include <math.h>
>   
>   static target_ulong vtype_reserved(CPURISCVState *env, target_ulong vtype)


