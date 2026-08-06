Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F325FC5AC67
	for <qemu-riscv@archiver.kernel.org>; Thu,  6 Aug 2026 21:13:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1ws5PM-0000oH-04; Thu, 06 Aug 2026 17:13:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1ws5PJ-0000nN-2p
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2026 17:13:41 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1ws5PE-0003jj-Dv
 for qemu-riscv@nongnu.org; Thu, 06 Aug 2026 17:13:40 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 676L95sX3078236
 for <qemu-riscv@nongnu.org>; Thu, 6 Aug 2026 21:13:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 icGdEWO7viZ04UWKLGf0wY/QhkOl+rtGQRbeKAdZx+8=; b=BJiWG+OrZAxuIVTJ
 zVsvuBxVwuowmeN0C9FK6lPHl6VnkNWT/mUNAzE0pYZ1DKEs2/30hvKqCpoYRKxm
 qZ3b4bPEWiFTmLJHBnjaTXLVmUnvvZtrM8mZfNyTBZ0NtYnm+Db6kh2GfGZ7tEwb
 c9TU2YUP88RhRY145Hhv7MyEkPtoGu6cQcIQwB9Ev6ns5DZYnj9XLW+aHCUB/c3Z
 uUp5IiU6vnu1riUkxaCaOdajmh6tRvHC5hLzA2UYqzEi9NUFh43KmnOPnsOWaoKH
 8QjAsPUJ49M5DONdenaYiQkpSn1dAWZBXRKROuy0k0i+vYNlT8OAi4SyOpp2Hv78
 QmxUFA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6h8txq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 06 Aug 2026 21:13:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93106d8affcso247352785a.0
 for <qemu-riscv@nongnu.org>; Thu, 06 Aug 2026 14:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1786050809; x=1786655609; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=icGdEWO7viZ04UWKLGf0wY/QhkOl+rtGQRbeKAdZx+8=;
 b=O51oAdksuQ+KrMa4y3sgcWtWeACt27IF4eiMu23rcuoBPvqrPusHFB3+ubZYD+lTbG
 hrNFftcWi+C62gE4BDw435L+viOrB3Xl3brCxSGMQp5fbMqgBKMAo1HkHy1/wn/hFdGv
 X0zJhUQpH5DAtQ75byQ5rlDTImlcKwmkxONsHFpzqWWzeo4z/DL2Nn+/do5tJTVdk3d+
 uBJhWtSg7MJvFmlVdzDEi/V5yByObn2IhPz3mqIwG4mudnFKonCNCMdBsIHRagFPHn3x
 iWPN0EjgIFtG6is84bVZIHN90yx2K60seOidpzdSNX+PTnTUrYd2vMhc/BdIStW5VP0G
 qJhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786050809; x=1786655609;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=icGdEWO7viZ04UWKLGf0wY/QhkOl+rtGQRbeKAdZx+8=;
 b=RqlEbjrHkCH7NWosAE0KHMvM+wHLKOqmSYMuLIQeqyqtvnnMo4hIOFh7eyMajAEqqu
 c9lGa/zDLD8omqvW0Mv8LwFhySCDq4KIPiu3wwwyX9AmXPrcdv8as8uGaxP6Mxl9x4xH
 60cEzCwt8KAwGqVb3ZuedQQ9wVENSIGfWpFeR7CZiaaCLqlRic+I4LiWrsf7wmWvsZtK
 hhUla+Aj69g+js+UCMUBineqtMkpE2MNcScszd9MncXW6wRPVtmahdmO4H29JzZMaNuO
 OP/JPA0ld4lN7rkOY6J9s47UdsvMTTUQh3jfrxm+qAKK4/BTtlBDCGOVZ+0o9Q4TPi0l
 iyjQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp/13GQi3JWAktJhxrotwBtpOeMQx6Kg5l9j2ROaW6pFxLEwyhQF5HKRQkvS62UiTG/0NhRU+1oqgUl@nongnu.org
X-Gm-Message-State: AOJu0YxfzXdnoRAU4DObpohVZ2MDUfXUg2D/hMiqhquscPxndydAdHvD
 hCfBkLBcpkL19QbOEx442QlBAW31EYrwFf2t3f3DMdfEFLrRHDosQbuOvGKxqhuPbST+4oIjJt8
 d5N2liNE7FQUPb1FwfygNqpPJ3nuZHUh32eQemkA2SYqnTGJrz0s1e2Su6VqWpR8wNQ==
X-Gm-Gg: AR+sD11/je5aXnWJ/ScedgxvOiI/GBS5q24r/+zWp1R71URUuLrl8X/xLc8g8XIr5NU
 8yZnoJzU3J+SsboRcO97mvH2OV1Uu/lo8Bb3vSnx7LfPUYsbQZsMhaluvTj0l0MtZ2NPPC/NY45
 O9Uk12PkGBF179j1X6dc5bBuSbRFNKn7bsoozlhd2k8+p2oGzTSjqeROd297tueJvyjkNS/URIZ
 tzeR0wpt2KMPrAHfrMlUrhWVTqX2MWmQY77RjnKzjYdYI/+EwZCbzA0vf93VS7pOMHqupEYG5s2
 /NVkqff2EiSAhanJR/jUuTN2Pz68Pd0DsU3/+qUSJr9Ee+VPWSlNG5WevDJC1iUF0W3CNl4TOHL
 rYwrHUlg3lVdSuz6/vbrMuOQAMYzcCw0bL16Y
X-Received: by 2002:a05:6214:e4c:b0:8f0:4e44:79e0 with SMTP id
 6a1803df08f44-9088105e4b6mr211087916d6.1.1786050809328; 
 Thu, 06 Aug 2026 14:13:29 -0700 (PDT)
X-Received: by 2002:a05:6214:e4c:b0:8f0:4e44:79e0 with SMTP id
 6a1803df08f44-9088105e4b6mr211087196d6.1.1786050808750; 
 Thu, 06 Aug 2026 14:13:28 -0700 (PDT)
Received: from [192.168.68.103] ([187.11.154.152])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-9087ffbccd6sm60717966d6.16.2026.08.06.14.13.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Aug 2026 14:13:28 -0700 (PDT)
Message-ID: <537a0ac1-8970-4ffc-934d-293d44f159c0@oss.qualcomm.com>
Date: Thu, 6 Aug 2026 18:13:24 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] target/riscv: rvv: Add SiFive custom int8 matmul
 instructions
To: Max Chou <max.chou@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>,
 Frank Chang <frank.chang@sifive.com>
References: <20260721122034.1567146-1-max.chou@sifive.com>
 <20260721122034.1567146-4-max.chou@sifive.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260721122034.1567146-4-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1KqQ9X7CaK9DMtSowYFa1xn2GEml-KGa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDE2NiBTYWx0ZWRfX9oyGAEFClwBR
 tedIvgompUgXThwcHTRYu4t6YHwbxbA8o3U1H1V+YCEZR4mMy7USznwra7mXo1a6i2N/QOmmIp9
 ToEBRzBJFQPZ/8IUUr+FZ5MAFHHyHyOcCu5iHdY4hdMCfXOILTmpctzDIxiUT6ApkUxNbM4gAZF
 l8jrLm2KMutucDQx4qnJlMy17Ii2/NP1RENksDtFrvTgZvLa9hqzJB2bcmnu9A9RFT104/qBJ4l
 /xDFEWU8r/0+EXQBNl+XGJ/Y46FO9TO8AIxbunbh9wh13c2N9An46xnAvB8QC7DEfIW454AcQ53
 R2GGqP63os2bkD1fjp/hASHuJNp6fEszWKR0NYGAx0WToanqY7zbksLuPFHjDbnDzobqZSI85CN
 wkKBMYzO+iJPM3+89qXknmyB3+FH5OteW9/RkpFGQllzs50dWPxTfAVMq1qEQjttb7NuRGM5Xy1
 7nc1vpwVdThp0Nsca1g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDE2NiBTYWx0ZWRfX/b9T+2t8GfJY
 3B1aEI/8eqYUcFCj3yo7BgnS9aikXDFmH1m9qCE7/r4qDIY3Il4DFPP3C4XzyMbGL/bR8CCyHOH
 BALZXOz5B1xmu8P2rJKqnmlAp6Uwmg0=
X-Proofpoint-ORIG-GUID: 1KqQ9X7CaK9DMtSowYFa1xn2GEml-KGa
X-Authority-Analysis: v=2.4 cv=MbpcfZ/f c=1 sm=1 tr=0 ts=6a74f8fa cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=iMfxv9gflPUPBcmW7/Gq5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pFyQfRViAAAA:8 a=EUspDBNiAAAA:8 a=69wJf7TsAAAA:8 a=YEB5RgzmAAAA:8
 a=VDADOufJE_lkxdHrtJsA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=oJz5jJLG1JtSoe7EL652:22 a=Fg1AiH1G6rFz08G2ETeA:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-06_03,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060166
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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



On 7/21/2026 9:20 AM, Max Chou wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> Add the 8 SiFive custom int8 matrix-multiply vector instructions:
> sf.vqmacc{u,,us,su}.4x8x4 and sf.vqmacc{u,,us,su}.2x8x2. Each name
> suffix encodes the signedness of vs1/vs2.
> The 4x8x4 forms multiply-accumulate a 4x8 by 8x4 int8 tile into a
> 4x4 int32 result; the 2x8x2 forms use a 2x8 by 8x2 tile producing a
> 2x2 int32 result. Both Xsfvqmaccqoq/Xsfvqmaccdod extensions are
> gated on vlenb >= 32, sew == 8 and vm == 1, per the SiFive Int8
> Matrix Multiplication Extensions Specification.
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Signed-off-by: Max Chou <max.chou@sifive.com>
> ---

One thing that caught my attention is adding what is, at least for now,
a vendor specific helper in vector_helper.c which is a common code
helper.  Existing vendor extensions in QEMU doesn't do that, at least
from what I can see.

All this said, I have a suspicion that the code for this extension will
be re-used in zvldot/zvbdot, so keeping this helper in vector_helper.c
is ok to me.


Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>


>   MAINTAINERS                                 |  7 ++
>   target/riscv/cpu_cfg.h                      |  5 ++
>   target/riscv/helper.h                       | 10 +++
>   target/riscv/meson.build                    |  1 +
>   target/riscv/tcg/insn_trans/trans_xsf.c.inc | 98 +++++++++++++++++++++
>   target/riscv/tcg/translate.c                |  3 +
>   target/riscv/tcg/vector_helper.c            | 74 ++++++++++++++++
>   target/riscv/xsf.decode                     | 30 +++++++
>   8 files changed, 228 insertions(+)
>   create mode 100644 target/riscv/tcg/insn_trans/trans_xsf.c.inc
>   create mode 100644 target/riscv/xsf.decode
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 97dcc78ded..94cd63eeba 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -389,6 +389,13 @@ F: target/riscv/XVentanaCondOps.decode
>   F: target/riscv/insn_trans/trans_xventanacondops.c.inc
>   F: disas/riscv-xventana*
>   
> +RISC-V SiFive (Xsf*) extensions
> +M: Max Chou <max.chou@sifive.com>
> +L: qemu-riscv@nongnu.org
> +S: Supported
> +F: target/riscv/xsf.decode
> +F: target/riscv/tcg/insn_trans/trans_xsf.c.inc
> +
>   RENESAS RX CPUs
>   R: Yoshinori Sato <yoshinori.sato@nifty.com>
>   S: Orphan
> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> index 211d0708ba..d6db1cfb7c 100644
> --- a/target/riscv/cpu_cfg.h
> +++ b/target/riscv/cpu_cfg.h
> @@ -51,6 +51,11 @@ static inline bool has_xthead_p(const RISCVCPUConfig *cfg)
>              cfg->ext_xtheadmempair || cfg->ext_xtheadsync;
>   }
>   
> +static inline bool has_xsf_p(const RISCVCPUConfig *cfg)
> +{
> +    return cfg->ext_xsfvqmaccdod || cfg->ext_xsfvqmaccqoq;
> +}
> +
>   #define MATERIALISE_EXT_PREDICATE(ext) \
>       static inline bool has_ ## ext ## _p(const RISCVCPUConfig *cfg) \
>       { \
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index 542b7c264f..4234f46271 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -1358,3 +1358,13 @@ DEF_HELPER_1(ssamoswap_disabled, void, env)
>   
>   /* Zalrsc SC write probe */
>   DEF_HELPER_FLAGS_3(sc_probe_write, TCG_CALL_NO_WG, void, env, tl, tl)
> +
> +/* SiFive Custom int8 Matrix-Multiply */
> +DEF_HELPER_5(sf_vqmaccu_4x8x4, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(sf_vqmacc_4x8x4, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(sf_vqmaccus_4x8x4, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(sf_vqmaccsu_4x8x4, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(sf_vqmaccu_2x8x2, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(sf_vqmacc_2x8x2, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(sf_vqmaccus_2x8x2, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(sf_vqmaccsu_2x8x2, void, ptr, ptr, ptr, env, i32)
> diff --git a/target/riscv/meson.build b/target/riscv/meson.build
> index 42d0f6d538..c06526adb2 100644
> --- a/target/riscv/meson.build
> +++ b/target/riscv/meson.build
> @@ -6,6 +6,7 @@ gen = [
>     decodetree.process('XVentanaCondOps.decode', extra_args: '--static-decode=decode_XVentanaCodeOps'),
>     decodetree.process('xmips.decode', extra_args: '--static-decode=decode_xmips'),
>     decodetree.process('xlrbr.decode', extra_args: '--static-decode=decode_xlrbr'),
> +  decodetree.process('xsf.decode', extra_args: '--static-decode=decode_xsf'),
>   ]
>   
>   riscv_ss = ss.source_set()
> diff --git a/target/riscv/tcg/insn_trans/trans_xsf.c.inc b/target/riscv/tcg/insn_trans/trans_xsf.c.inc
> new file mode 100644
> index 0000000000..1677352689
> --- /dev/null
> +++ b/target/riscv/tcg/insn_trans/trans_xsf.c.inc
> @@ -0,0 +1,98 @@
> +/*
> + * RISC-V translation routines for the SiFive vendor extensions (xsf*)
> + *
> + * Copyright (c) 2023 SiFive, Inc.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +
> +/*
> + * SiFive Xsfvqmaccdod/Xsfvqmaccqoq custom int8 matrix-multiply extensions
> + */
> +static bool sf_int8_matmul_check(DisasContext *s, arg_rmrr *a)
> +{
> +    return require_rvv(s) &&
> +           vext_check_isa_ill(s) &&
> +           s->vstart_eq_zero &&
> +           (s->cfg_ptr->vlenb >= 32) &&
> +           (s->sew == MO_8) &&
> +           (a->vm == 1);
> +}
> +
> +static bool sf_int8_matmul_4x8x4_check(DisasContext *s, arg_rmrr *a)
> +{
> +    /*
> +     * vd  has EMUL=2*LMUL
> +     * vs2 has EMUL=LMUL
> +     * vs1 has EMUL=1
> +     * vd must not overlap vs1
> +     */
> +    return sf_int8_matmul_check(s, a) &&
> +           (s->cfg_ptr->ext_xsfvqmaccqoq) &&
> +           (s->lmul <= 2) &&
> +           require_align(a->rd, s->lmul + 1) &&
> +           require_align(a->rs2, s->lmul) &&
> +           require_align(a->rs1, 0) &&
> +           require_noover(a->rd, s->lmul + 1, a->rs2, s->lmul) &&
> +           !is_overlapped(a->rd, 1 << MAX(s->lmul + 1, 0), a->rs1, 1);
> +}
> +
> +static bool sf_int8_matmul_2x8x2_check(DisasContext *s, arg_rmrr *a)
> +{
> +    /*
> +     * vd  has EMUL=LMUL
> +     * vs2 has EMUL=LMUL
> +     * vs1 has EMUL=1
> +     * vd must not overlap vs1
> +     */
> +    return sf_int8_matmul_check(s, a) &&
> +           (s->cfg_ptr->ext_xsfvqmaccdod) &&
> +           require_align(a->rd, s->lmul) &&
> +           require_align(a->rs2, s->lmul) &&
> +           require_align(a->rs1, 0) &&
> +           !is_overlapped(a->rd, 1 << MAX(s->lmul, 0), a->rs1, 1);
> +}
> +
> +static bool sf_int8_matmul_op(DisasContext *s, arg_rmrr *a, uint8_t seq)
> +{
> +    static gen_helper_gvec_3_ptr * const fns[8] = {
> +        gen_helper_sf_vqmaccu_4x8x4, gen_helper_sf_vqmacc_4x8x4,
> +        gen_helper_sf_vqmaccus_4x8x4, gen_helper_sf_vqmaccsu_4x8x4,
> +        gen_helper_sf_vqmaccu_2x8x2, gen_helper_sf_vqmacc_2x8x2,
> +        gen_helper_sf_vqmaccus_2x8x2, gen_helper_sf_vqmaccsu_2x8x2,
> +    };
> +
> +    /*
> +     * The helper raises an illegal-instruction exception when vl is not a
> +     * multiple of the tile size; save the opcode so mtval/stval report the
> +     * faulting instruction if that exception is thrown.
> +     */
> +    decode_save_opc(s, 0);
> +
> +    tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, a->rs1),
> +                       vreg_ofs(s, a->rs2), tcg_env,
> +                       s->cfg_ptr->vlenb, s->cfg_ptr->vlenb, 0, fns[seq]);
> +
> +    finalize_rvv_inst(s);
> +
> +    return true;
> +}
> +
> +#define GEN_SF_INT8_MATMUL_TRANS(NAME, CHECK, SEQ)       \
> +static bool trans_##NAME(DisasContext *s, arg_rmrr *a)   \
> +{                                                        \
> +    if (CHECK(s, a)) {                                   \
> +        return sf_int8_matmul_op(s, a, SEQ);             \
> +    }                                                    \
> +    return false;                                        \
> +}
> +
> +GEN_SF_INT8_MATMUL_TRANS(sf_vqmaccu_4x8x4,  sf_int8_matmul_4x8x4_check, 0)
> +GEN_SF_INT8_MATMUL_TRANS(sf_vqmacc_4x8x4,   sf_int8_matmul_4x8x4_check, 1)
> +GEN_SF_INT8_MATMUL_TRANS(sf_vqmaccus_4x8x4, sf_int8_matmul_4x8x4_check, 2)
> +GEN_SF_INT8_MATMUL_TRANS(sf_vqmaccsu_4x8x4, sf_int8_matmul_4x8x4_check, 3)
> +GEN_SF_INT8_MATMUL_TRANS(sf_vqmaccu_2x8x2,  sf_int8_matmul_2x8x2_check, 4)
> +GEN_SF_INT8_MATMUL_TRANS(sf_vqmacc_2x8x2,   sf_int8_matmul_2x8x2_check, 5)
> +GEN_SF_INT8_MATMUL_TRANS(sf_vqmaccus_2x8x2, sf_int8_matmul_2x8x2_check, 6)
> +GEN_SF_INT8_MATMUL_TRANS(sf_vqmaccsu_2x8x2, sf_int8_matmul_2x8x2_check, 7)
> diff --git a/target/riscv/tcg/translate.c b/target/riscv/tcg/translate.c
> index 9684dbe752..41e3dd2fe2 100644
> --- a/target/riscv/tcg/translate.c
> +++ b/target/riscv/tcg/translate.c
> @@ -1216,10 +1216,12 @@ static uint32_t opcode_at(DisasContextBase *dcbase, target_ulong pc)
>   #include "decode-xthead.c.inc"
>   #include "decode-xmips.c.inc"
>   #include "decode-xlrbr.c.inc"
> +#include "decode-xsf.c.inc"
>   #include "insn_trans/trans_xthead.c.inc"
>   #include "insn_trans/trans_xventanacondops.c.inc"
>   #include "insn_trans/trans_xmips.c.inc"
>   #include "insn_trans/trans_xlrbr.c.inc"
> +#include "insn_trans/trans_xsf.c.inc"
>   
>   /* Include the auto-generated decoder for 16 bit insn */
>   #include "decode-insn16.c.inc"
> @@ -1240,6 +1242,7 @@ const RISCVDecoder decoder_table[] = {
>       { has_xthead_p, decode_xthead},
>       { has_XVentanaCondOps_p, decode_XVentanaCodeOps},
>       { has_xlrbr_p, decode_xlrbr},
> +    { has_xsf_p, decode_xsf },
>   };
>   
>   const size_t decoder_table_size = ARRAY_SIZE(decoder_table);
> diff --git a/target/riscv/tcg/vector_helper.c b/target/riscv/tcg/vector_helper.c
> index e321ca2616..a9b5d861dc 100644
> --- a/target/riscv/tcg/vector_helper.c
> +++ b/target/riscv/tcg/vector_helper.c
> @@ -5871,3 +5871,77 @@ GEN_VEXT_INT_EXT(vsext_vf2_d, int64_t, int32_t, H8, H4)
>   GEN_VEXT_INT_EXT(vsext_vf4_w, int32_t, int8_t,  H4, H1)
>   GEN_VEXT_INT_EXT(vsext_vf4_d, int64_t, int16_t, H8, H2)
>   GEN_VEXT_INT_EXT(vsext_vf8_d, int64_t, int8_t,  H8, H1)
> +
> +/* SiFive Custom int8 Matrix-Multiply */
> +#define SF_QOP_SUU_B int32_t, uint8_t, uint8_t, int32_t, int32_t
> +#define SF_QOP_SUS_B int32_t, uint8_t, int8_t, int32_t, int32_t
> +#define SF_QOP_SSU_B int32_t, int8_t, uint8_t, int32_t, int32_t
> +#define SF_QOP_SSS_B int32_t, int8_t, int8_t, int32_t, int32_t
> +
> +/*
> + * vd may overlap vs2, we need to allocate an additional vd array
> + * to save temporary results of vd and write them back at the end.
> + */
> +#define GEN_VEXT_SF_INT8_MATMUL(NAME, TD, T1, T2, TX1, TX2,           \
> +                                HD, HS1, HS2, ROWS, COLS, TILE_SIZE)  \
> +void HELPER(NAME)(void *vd, void *vs1, void *vs2,                     \
> +                  CPURISCVState *env, uint32_t desc)                  \
> +{                                                                     \
> +    int it, il, in, im, ivd, ivs1, ivs2;                              \
> +    TD *vds;                                                          \
> +                                                                      \
> +    if (env->vl % TILE_SIZE) {                                        \
> +        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC()); \
> +        return;                                                       \
> +    }                                                                 \
> +                                                                      \
> +    VSTART_CHECK_EARLY_EXIT(env, env->vl);                            \
> +                                                                      \
> +    vds = g_malloc0(sizeof(TD) *                                      \
> +                    ROWS * ROWS * (env->vl / TILE_SIZE));             \
> +                                                                      \
> +    for (it = 0; it < (env->vl / TILE_SIZE); it++) {                  \
> +        for (il = 0; il < ROWS; il++) {                               \
> +            for (in = 0; in < ROWS; in++) {                           \
> +                ivd = ROWS * ROWS * it + ROWS * il + in;              \
> +                vds[ivd] = *((TD *)vd + HD(ivd));                     \
> +                for (im = 0; im < COLS; im++) {                       \
> +                    ivs1 = il * COLS + im;                            \
> +                    ivs2 = TILE_SIZE * it + im * ROWS + in;           \
> +                    T1 s1 = *((T1 *)vs1 + HS1(ivs1));                 \
> +                    T2 s2 = *((T2 *)vs2 + HS2(ivs2));                 \
> +                    vds[ivd] += (TX1)s1 * (TX2)s2;                    \
> +                }                                                     \
> +            }                                                         \
> +        }                                                             \
> +    }                                                                 \
> +                                                                      \
> +    for (it = 0; it < (env->vl / TILE_SIZE); it++) {                  \
> +        for (il = 0; il < ROWS; il++) {                               \
> +            for (in = 0; in < ROWS; in++) {                           \
> +                ivd = ROWS * ROWS * it + ROWS * il + in;              \
> +                *((TD *)vd + HD(ivd)) = vds[ivd];                     \
> +            }                                                         \
> +        }                                                             \
> +    }                                                                 \
> +                                                                      \
> +    env->vstart = 0;                                                  \
> +    g_free(vds);                                                      \
> +}
> +
> +RVVCALL(GEN_VEXT_SF_INT8_MATMUL, sf_vqmaccu_4x8x4,  SF_QOP_SUU_B,
> +        H4, H1, H1, 4, 8, 32)
> +RVVCALL(GEN_VEXT_SF_INT8_MATMUL, sf_vqmacc_4x8x4,   SF_QOP_SSS_B,
> +        H4, H1, H1, 4, 8, 32)
> +RVVCALL(GEN_VEXT_SF_INT8_MATMUL, sf_vqmaccus_4x8x4, SF_QOP_SUS_B,
> +        H4, H1, H1, 4, 8, 32)
> +RVVCALL(GEN_VEXT_SF_INT8_MATMUL, sf_vqmaccsu_4x8x4, SF_QOP_SSU_B,
> +        H4, H1, H1, 4, 8, 32)
> +RVVCALL(GEN_VEXT_SF_INT8_MATMUL, sf_vqmaccu_2x8x2,  SF_QOP_SUU_B,
> +        H4, H1, H1, 2, 8, 16)
> +RVVCALL(GEN_VEXT_SF_INT8_MATMUL, sf_vqmacc_2x8x2,   SF_QOP_SSS_B,
> +        H4, H1, H1, 2, 8, 16)
> +RVVCALL(GEN_VEXT_SF_INT8_MATMUL, sf_vqmaccus_2x8x2, SF_QOP_SUS_B,
> +        H4, H1, H1, 2, 8, 16)
> +RVVCALL(GEN_VEXT_SF_INT8_MATMUL, sf_vqmaccsu_2x8x2, SF_QOP_SSU_B,
> +        H4, H1, H1, 2, 8, 16)
> diff --git a/target/riscv/xsf.decode b/target/riscv/xsf.decode
> new file mode 100644
> index 0000000000..bb585046ab
> --- /dev/null
> +++ b/target/riscv/xsf.decode
> @@ -0,0 +1,30 @@
> +#
> +# RISC-V translation routines for the SiFive vendor extensions
> +#
> +# Copyright (c) 2023 SiFive, Inc.
> +#
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +# Fields:
> +%rs2       20:5
> +%rs1       15:5
> +%rd        7:5
> +%vm        25:1
> +
> +# Argument sets:
> +&rmrr      vm rd rs1 rs2                           !extern
> +
> +# Formats:
> +@r_vm_1    ......  . ..... ..... ... ..... ....... &rmrr vm=1 %rs2 %rs1 %rd
> +
> +# *** Xsfvqmaccqoq: SiFive custom int8 matrix-multiply (4x8x4 tile) ***
> +sf_vqmaccu_4x8x4    111100 1 ..... ..... 010 ..... 1011011 @r_vm_1
> +sf_vqmacc_4x8x4     111101 1 ..... ..... 010 ..... 1011011 @r_vm_1
> +sf_vqmaccus_4x8x4   111110 1 ..... ..... 010 ..... 1011011 @r_vm_1
> +sf_vqmaccsu_4x8x4   111111 1 ..... ..... 010 ..... 1011011 @r_vm_1
> +
> +# *** Xsfvqmaccdod: SiFive custom int8 matrix-multiply (2x8x2 tile) ***
> +sf_vqmaccu_2x8x2    101100 1 ..... ..... 010 ..... 1011011 @r_vm_1
> +sf_vqmacc_2x8x2     101101 1 ..... ..... 010 ..... 1011011 @r_vm_1
> +sf_vqmaccus_2x8x2   101110 1 ..... ..... 010 ..... 1011011 @r_vm_1
> +sf_vqmaccsu_2x8x2   101111 1 ..... ..... 010 ..... 1011011 @r_vm_1


