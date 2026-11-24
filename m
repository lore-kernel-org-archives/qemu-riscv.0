Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806C960A2624
	for <qemu-riscv@archiver.kernel.org>; Tue, 24 Nov 2026 17:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IxOn5QpS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NUEyLHdq
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xVu2e-0000pj-Ap; Tue, 24 Nov 2026 12:10:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xVu2c-0000oq-Bd
 for qemu-riscv@nongnu.org; Tue, 24 Nov 2026 12:10:50 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xVu2Z-0002jZ-RM
 for qemu-riscv@nongnu.org; Tue, 24 Nov 2026 12:10:50 -0500
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AOFL4Gs4124150
 for <qemu-riscv@nongnu.org>; Tue, 24 Nov 2026 17:10:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 YFmi0fcOQGbXqb/f+q/R7L095F6Bauo8YNwVGD20A+w=; b=IxOn5QpSETpoUpCh
 GnN8zNlNbdXLKEA58Ycmyi54tjByfAlt7G0R1ZiVofVfwhLrOHMK0VcnObmBRlk2
 CNFbj+H7zFqpzRf+p2Zzlj3cK0F+LOSl3LqZ9M6IxKIYgRdMlOZwuGCnVSq6dQ1M
 pSqrfY+yZBBDwWpYZ/PsaoiajbEGLI7zz6x7+ZpD8sF9hPn3TWonchoEn12+vRkO
 H/zfTKpOfH+TOY1T3+kN95PxQENv5Rfofj2wp55mbNj1Y9XijP2I0Zs85Pxc/txj
 XTezNYbHb+Sa4RnE006k9084VptZzih3EX4QoeMkDBsPTxkV99RRpzVRyr7I6COL
 Cs3AwA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rhaxgp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 24 Nov 2026 17:10:45 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-9210ad74fdeso84778506d6.0
 for <qemu-riscv@nongnu.org>; Tue, 24 Nov 2026 09:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795540244; x=1796145044; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=YFmi0fcOQGbXqb/f+q/R7L095F6Bauo8YNwVGD20A+w=;
 b=NUEyLHdqg1k8VlBKxf6C2dkISDVi/W4CD5M+mQlmrjbXabtzHZ3XnF8qoRYZXUaJ2v
 V9x8fgxwAxhf7boUtPTdwuFcnrdjiBTgqAlr+Vv+BqRWDf0IYnro5UEz2ZHJv7qRgcDD
 IBlptD8+LfsbkrijVWt3/AwnH1GN+UD8r1vMWuz8MwFE54dhWy4I0uzI8RoxfOYCzKOc
 CBMGk6QFFrX1S45wSo38RqRFyAnq6C/68UQ+C1nthWZW+2RPM3qIzckxP2u05pPPhn1J
 5BE/Ht4lV3zn8VH/QswBb8QuWLZ3SZYsJwGyPevB98ct7jJ6p5NPdqJOYafKm7nSRriU
 bujQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795540244; x=1796145044;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=YFmi0fcOQGbXqb/f+q/R7L095F6Bauo8YNwVGD20A+w=;
 b=2q/hp+acjQiwDu9eYhrrTjh1zaOB0Ze5v/hMSDL4N//mIZmtnyJ6n7lWErWJAXkAoa
 UP+HqPvKm810ntnfyAnWwTGKZlB5VmFt0qaByc+/p3ucybCvvVj9oqootQKYyQa+iQew
 64H4WWePmPTnu7gXnTugPGUf+xapaiqONrYeUPMnp5PD2AQ1HkpqRPhvfpBHdF2NaNa9
 FslQfWQ5TSWKi0KeKKQu5ElHeYsfVrQsF6TO6vy0FmhQG/C2pviMCoMbsTgxUAg0yhaj
 x2wAWfFQdC4vPr32JMsMe2xqB1sDZE6ndHSO/8EeC4GpmurkywGyAQ8/lZ2hYMJVLeTZ
 A0qg==
X-Gm-Message-State: APuU4Z+RW1EFrDPQTy+Oy/MQG9wfVVGFHwAE9z5TCLKEuzmsZ1NxzkTh
 qFggQ+DmXdXyq9XJk8hCTYrma73wdSbp9xbYH11kaqeX4E//y3lytt1IS3koN1+mpxh+VlCxdkm
 PP6fyk9atuTR5GVhmX+m00BVk+oRdQOom0haVRPWisv8Gp+v5Qk+Hkg0OQg==
X-Gm-Gg: AZFdTZci2VzsAcvefDsx4Ua8lGdof0+Sp8OjK1OI/2TCjVyTteMACIZnipZWNLuTR2E
 mFFPNX8TxYCGiLmzgz8XyibmAxaENp4+oMgGXPCuZ9fqn+5u1t9EejjGwPpltnaavMT3GIYJi0c
 ml17J6qXs5OjxuTNFulHBp6pEY3daGd9JOO3uic64VXSSn1oj9pt9lQUzFgHK2LNT/VCzwAXC2s
 uVe4EbIMGwwb8c86gsFTViGcngdNbAaWk0RHqizKTxdZrc1XRuM563D51UoQJLssjweD53p73uM
 glcyTjs0d+K7QUgVdiOdMmcx0poSj1pT57NmPlWeGAIgnqebk4A90ZCre2DZOmloulzuq30BOGY
 W+3uC80T463ahQV+6FWgMAJBbobcpHciCJTz+SWf9OSDwbb5tKzlwwMdaf4mggu41vLDzZfIPsH
 +clo2AZwf1
X-Received: by 2002:a05:6214:3a84:b0:921:3171:b604 with SMTP id
 6a1803df08f44-92134b48c88mr260646606d6.54.1795540244330; 
 Tue, 24 Nov 2026 09:10:44 -0800 (PST)
X-Received: by 2002:a05:6214:3a84:b0:921:3171:b604 with SMTP id
 6a1803df08f44-92134b48c88mr260645526d6.54.1795540243587; 
 Tue, 24 Nov 2026 09:10:43 -0800 (PST)
Received: from [192.168.68.101] ([189.110.107.17])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-921349cdfbasm140183066d6.17.2026.11.24.09.10.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Nov 2026 09:10:43 -0800 (PST)
Message-ID: <a7c3c466-25e1-4324-b32c-83c58940ace7@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 14:10:39 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] target/riscv: Split out riscv_compute_tb_flags
To: SeungJu Cheon <suunj1331@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liwei1518@gmail.com>,
 Chao Liu <chao.liu@processmission.com>
References: <20261119164438.193579-1-suunj1331@gmail.com>
 <20261119164438.193579-2-suunj1331@gmail.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261119164438.193579-2-suunj1331@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BKkmP1QG c=1 sm=1 tr=0 ts=6b05c515 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=2Chh/y2wedAoPG2p3qwUfw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=P59yoAlMZRhNRrukf9sA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2NyBTYWx0ZWRfX0i+3rPM5JHYI
 5SwniANk4HzUHj9f9uZiYkoo15F7jzG0OS3VS4CADSsKaJb4nXJDg0xsJWf5g6VPf4Z51+lK8oL
 J9Aucq//zTEvNEPKjjokIamMZKWiqGU=
X-Proofpoint-GUID: iNBZCzrzrw1GqJ2hYyoUCCTdKRpKplwI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2NyBTYWx0ZWRfX948oGJyx1rfT
 4tcreMQO05O+byb43mcTmZ1ESzILfwxcmTWhFfdozOT0NIpusEnyT+duuhmOxWDl0r0xmfiH9NX
 fRlZY6mG18r0MOHOCwfJCeOeg/gu6pyBxdi4kOv6pGMw1lq5rETZs7v27A7tpdm1eru+9FP3/70
 LoEFtZ0VNJ2r3baRxHt85TxpmiX6VUtLVnXzQklVX14EhRBzP+J9UdMVRp8+RmLJqbRgp2RtEmU
 oaLVA1LCpFaSJKgP2LzKOIzPk/FYWU/azHrMndinpKjqtXJ6Rk7BN2k+spissxs/EZiWtmDxrgS
 RAUxK1OcBX4kKsbiZDv+OTs1y8JqcAlvP4gSTClYgse+L4W+KgGUdv8F/EqnqFQJRHkRwNThApR
 Tjy6DCEwwM/H0uXZ0twLbWsbD2zGBZP1C7p99e7h2kFivxRBTp7WpVYbDDtztJuAMpv1H49HjeC
 DGCOV7GYgiErLyh4etw==
X-Proofpoint-ORIG-GUID: iNBZCzrzrw1GqJ2hYyoUCCTdKRpKplwI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240067
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
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/19/2026 1:44 PM, SeungJu Cheon wrote:
> Move the computation of TB flags derived from state that changes on
> CSR writes, traps, privilege changes and vsetvl into
> riscv_compute_tb_flags(). Continue to read FS/VS, elp, vstart and vl
> in riscv_get_tb_cpu_state(), since they can change between lookups.
> 
> The lookup calls the new helper directly, preserving the TB flag
> values. The helper returns UINT32_MAX when maxsz is below the 8-byte
> gvec minimum, so the vl comparison leaves VL_EQ_VLMAX clear in the
> same cases as the previous maxsz >= 8 check.
> 
> Signed-off-by: SeungJu Cheon <suunj1331@gmail.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   target/riscv/tcg/tcg-cpu.c | 101 +++++++++++++++++++++++++------------
>   1 file changed, 69 insertions(+), 32 deletions(-)
> 
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 5834ec1524..5c5d8fcb94 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -99,13 +99,20 @@ static int riscv_cpu_mmu_index(CPUState *cs, bool ifetch)
>       return riscv_env_mmu_index(cpu_env(cs), ifetch);
>   }
>   
> -static TCGTBCPUState riscv_get_tb_cpu_state(CPUState *cs)
> +/*
> + * Compute the TB flags that depend only on state changed through CSR
> + * writes, traps, privilege changes and vsetvl.  For now the result is
> + * fed straight back to riscv_get_tb_cpu_state(), which adds the bits
> + * that translated code changes between two lookups -- FS/VS dirtying,
> + * elp, vstart, and vl, which fault-only-first loads shrink.
> + */
> +static void riscv_compute_tb_flags(CPURISCVState *env, uint32_t *pflags,
> +                                   uint64_t *pext_flags, uint32_t *pvlmax)
>   {
> -    CPURISCVState *env = cpu_env(cs);
>       RISCVCPU *cpu = env_archcpu(env);
> -    RISCVExtStatus fs, vs;
>       uint32_t flags = 0;
>       uint64_t ext_flags = 0;
> +    uint32_t vlmax_cached = UINT32_MAX;
>       bool pm_signext = riscv_cpu_virt_mem_enabled(env, false);
>   
>       if (cpu->cfg.ext_zve32x) {
> @@ -124,49 +131,93 @@ static TCGTBCPUState riscv_get_tb_cpu_state(CPUState *cs)
>           uint32_t vsew = FIELD_EX64(env->vtype, VTYPE, VSEW);
>           uint32_t vlmax = vext_get_vlmax(cpu->cfg.vlenb, vsew, lmul);
>           uint32_t maxsz = vlmax << vsew;
> -        bool vl_eq_vlmax = (env->vstart == 0) && (vlmax == env->vl) &&
> -                           (maxsz >= 8);
> +
> +        /* vl is compared per lookup: fault-only-first loads shrink it. */
> +        vlmax_cached = maxsz >= 8 ? vlmax : UINT32_MAX;
>           flags = FIELD_DP32(flags, TB_FLAGS, VILL, env->vill);
>           flags = FIELD_DP32(flags, TB_FLAGS, SEW, vsew);
>           flags = FIELD_DP32(flags, TB_FLAGS, LMUL,
>                              FIELD_EX64(env->vtype, VTYPE, VLMUL));
> -        flags = FIELD_DP32(flags, TB_FLAGS, VL_EQ_VLMAX, vl_eq_vlmax);
>           flags = FIELD_DP32(flags, TB_FLAGS, VTA,
>                              FIELD_EX64(env->vtype, VTYPE, VTA));
>           flags = FIELD_DP32(flags, TB_FLAGS, VMA,
>                              FIELD_EX64(env->vtype, VTYPE, VMA));
> -        flags = FIELD_DP32(flags, TB_FLAGS, VSTART_EQ_ZERO, env->vstart == 0);
>           ext_flags = FIELD_DP64(ext_flags, EXT_TB_FLAGS, ALTFMT, altfmt);
>       } else {
>           flags = FIELD_DP32(flags, TB_FLAGS, VILL, 1);
>       }
>   
>       if (cpu_get_fcfien(env)) {
> +        flags = FIELD_DP32(flags, TB_FLAGS, FCFI_ENABLED, 1);
> +    }
> +
> +    if (cpu_get_bcfien(env)) {
> +        flags = FIELD_DP32(flags, TB_FLAGS, BCFI_ENABLED, 1);
> +    }
> +
> +#ifndef CONFIG_USER_ONLY
> +    flags = FIELD_DP32(flags, TB_FLAGS, PRIV, env->priv);
> +    flags |= riscv_env_mmu_index(env, 0);
> +
> +    if (env->virt_enabled) {
> +        flags = FIELD_DP32(flags, TB_FLAGS, VIRT_ENABLED, 1);
> +    }
> +
> +    if ((cpu->cfg.debug || cpu->cfg.ext_sdtrig)
> +        && !icount_enabled()) {
> +        flags = FIELD_DP32(flags, TB_FLAGS, ITRIGGER, env->itrigger_enabled);
> +    }
> +#endif
> +
> +    flags = FIELD_DP32(flags, TB_FLAGS, XL, env->xl);
> +    flags = FIELD_DP32(flags, TB_FLAGS, AXL, cpu_address_xl(env));
> +    flags = FIELD_DP32(flags, TB_FLAGS, PM_PMM, riscv_pm_get_pmm(env));
> +    flags = FIELD_DP32(flags, TB_FLAGS, PM_SIGNEXTEND, pm_signext);
> +
> +    ext_flags = FIELD_DP64(ext_flags, EXT_TB_FLAGS, MISA_EXT, env->misa_ext);
> +    ext_flags = FIELD_DP64(ext_flags, EXT_TB_FLAGS, BIG_ENDIAN,
> +                           mo_endian_env(env) == MO_BE);
> +
> +    *pflags = flags;
> +    *pext_flags = ext_flags;
> +    *pvlmax = vlmax_cached;
> +}
> +
> +static TCGTBCPUState riscv_get_tb_cpu_state(CPUState *cs)
> +{
> +    CPURISCVState *env = cpu_env(cs);
> +    RISCVCPU *cpu = env_archcpu(env);
> +    RISCVExtStatus fs, vs;
> +    uint32_t flags, vlmax;
> +    uint64_t ext_flags;
> +
> +    riscv_compute_tb_flags(env, &flags, &ext_flags, &vlmax);
> +
> +    if (cpu->cfg.ext_zve32x) {
> +        bool vstart_eq_zero = env->vstart == 0;
> +
> +        flags = FIELD_DP32(flags, TB_FLAGS, VL_EQ_VLMAX,
> +                           vstart_eq_zero && env->vl == vlmax);
> +        flags = FIELD_DP32(flags, TB_FLAGS, VSTART_EQ_ZERO, vstart_eq_zero);
> +    }
> +
> +    if (FIELD_EX32(flags, TB_FLAGS, FCFI_ENABLED)) {
>           /*
>            * For Forward CFI, only the expectation of a lpad at
>            * the start of the block is tracked via env->elp. env->elp
>            * is turned on during jalr translation.
>            */
>           flags = FIELD_DP32(flags, TB_FLAGS, FCFI_LP_EXPECTED, env->elp);
> -        flags = FIELD_DP32(flags, TB_FLAGS, FCFI_ENABLED, 1);
> -    }
> -
> -    if (cpu_get_bcfien(env)) {
> -        flags = FIELD_DP32(flags, TB_FLAGS, BCFI_ENABLED, 1);
>       }
>   
>   #ifdef CONFIG_USER_ONLY
>       fs = EXT_STATUS_DIRTY;
>       vs = EXT_STATUS_DIRTY;
>   #else
> -    flags = FIELD_DP32(flags, TB_FLAGS, PRIV, env->priv);
> -
> -    flags |= riscv_env_mmu_index(env, 0);
>       fs = get_field(env->mstatus, MSTATUS_FS);
>       vs = get_field(env->mstatus, MSTATUS_VS);
>   
>       if (env->virt_enabled) {
> -        flags = FIELD_DP32(flags, TB_FLAGS, VIRT_ENABLED, 1);
>           /*
>            * Merge DISABLED and !DIRTY states using MIN.
>            * We will set both fields when dirtying.
> @@ -181,27 +232,13 @@ static TCGTBCPUState riscv_get_tb_cpu_state(CPUState *cs)
>                ? EXT_STATUS_DIRTY : EXT_STATUS_DISABLED;
>       }
>   
> -    if ((cpu->cfg.debug || cpu->cfg.ext_sdtrig)
> -        && !icount_enabled()) {
> -        flags = FIELD_DP32(flags, TB_FLAGS, ITRIGGER, env->itrigger_enabled);
> +    if (cpu->cfg.ext_sdext && !env->debug_mode && (env->dcsr & DCSR_STEP)) {
> +        ext_flags = FIELD_DP64(ext_flags, EXT_TB_FLAGS, SDEXT_STEP, 1);
>       }
>   #endif
>   
>       flags = FIELD_DP32(flags, TB_FLAGS, FS, fs);
>       flags = FIELD_DP32(flags, TB_FLAGS, VS, vs);
> -    flags = FIELD_DP32(flags, TB_FLAGS, XL, env->xl);
> -    flags = FIELD_DP32(flags, TB_FLAGS, AXL, cpu_address_xl(env));
> -    flags = FIELD_DP32(flags, TB_FLAGS, PM_PMM, riscv_pm_get_pmm(env));
> -    flags = FIELD_DP32(flags, TB_FLAGS, PM_SIGNEXTEND, pm_signext);
> -
> -    ext_flags = FIELD_DP64(ext_flags, EXT_TB_FLAGS, MISA_EXT, env->misa_ext);
> -    ext_flags = FIELD_DP64(ext_flags, EXT_TB_FLAGS, BIG_ENDIAN,
> -                           mo_endian_env(env) == MO_BE);
> -#ifndef CONFIG_USER_ONLY
> -    if (cpu->cfg.ext_sdext && !env->debug_mode && (env->dcsr & DCSR_STEP)) {
> -        ext_flags = FIELD_DP64(ext_flags, EXT_TB_FLAGS, SDEXT_STEP, 1);
> -    }
> -#endif
>   
>       return (TCGTBCPUState){
>           .pc = env->xl == MXL_RV32 ? env->pc & UINT32_MAX : env->pc,


