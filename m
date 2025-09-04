Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED38CA1002
	for <qemu-riscv@archiver.kernel.org>; Thu,  4 Sep 2025 13:53:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uuAOx-0001fZ-Fk; Thu, 04 Sep 2025 09:53:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uuAOw-0001ed-8G
 for qemu-riscv@nongnu.org; Thu, 04 Sep 2025 09:53:22 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uuAOs-0004P2-SO
 for qemu-riscv@nongnu.org; Thu, 04 Sep 2025 09:53:21 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-45cb659e858so9050775e9.2
 for <qemu-riscv@nongnu.org>; Thu, 04 Sep 2025 06:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756993992; x=1757598792; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OKAPIZ+2d+SRV7Nywa5xA97xiji6grigfAj+yO0mBIg=;
 b=WtVWDw9taCjyT3mgrlm5nAj6shwXSTsMl4u0tFnm377Vdk7JSv/EFFhZyopd+YOFjA
 QrDrV4g/TO8sAeyvXP/6+g8b6eiSWdidFBncu4fMD2x6C88ai85zWP1Y+rQGVHFINeSu
 qb/wCYjFijbl8jXhT9zgknLBpvyV3K1uosnLB0Tsr/rr4Xmt24ZgTiVQC4iqP2U45Vtm
 s1K5Ssr4TJNdliXag4FrIr/o0e9z2GP7e/hlgOndjNQeYp7UPUZ59uamdppDtgomy3VS
 X3bOW7Kvzkad1m9K2WXL6j82+wG/b+bsvQSWscw8by4EP9UbnsEZ9Dc8bq7YdP0wGHVX
 +3Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756993992; x=1757598792;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OKAPIZ+2d+SRV7Nywa5xA97xiji6grigfAj+yO0mBIg=;
 b=t2bzTa18yTzJog+vrjUNJGd9oyrlsBBBTU3ePho6K2TAbnq3TRwtg7poxPqKYRlHhi
 ZcM66ORZe+HqljQnSQOAWKR4/oqZ88WOS3PRe4KCa4C2t/MrY34POGZAB+UKUo610BA5
 L4yRParmkx3oQeuggzjfwlrzlPhSo0LEZv39/ELbqQJ9LuE7uRyxp5PZR2CvDpQg8AC7
 5Ttv8RaqWwLv6Zc+m7GPEBaeDwxutGOEmrom6KlP7a1plAxP6+uEZRWjDQN1kGmdHKE/
 PVSHs9oNmPTaFIe70tFrt0nkHZ2rf7z9iPEHS0MWifqZbWoptmOxNrbhRjIFB9oTz0gt
 pGjA==
X-Gm-Message-State: AOJu0YxEyL9/KSonLEuorTONAPCJC4NznBWOI+Hig9jyGGDPy8IzJd61
 lvKlbKSKJGcLPgmCHHAO42BQ9GhieV9cqPhX3UyUjgPlbAxMvczS4yiFuH7vSrl3A5M=
X-Gm-Gg: ASbGncs38tTp9khh45Ey6WcbCFNXRSDnbJazhCn/isOcoV9XeuJ2U0w1e2xQE2SNqqi
 seeOF7AwhdtVe5F+WXhsOGsp70nN72Pactt7LVxlHthpCxPYEUGFkkIv3x1cp5jJJ29TWYoK6dQ
 FfCRvf/3Yj0eGSPNkcIwCJAoIJLYvxLfqlDKsGmIIjZ599WE/oSBvcMJk2dqtzDra/hI6XhqEN/
 4Y3RmlEQFiVGfCi8/qB6OUy63OSStkoAxX3WqmK47/5LFe84CHRcpV4gq8DyPpnRCiPfSr4iJW6
 2HmvWmoq0mqDUMQve0JPeq6k0NM+YKGxUKijHDlFCdVd6RHpAHGWuFuHVyF4Qe4aMtdbBv7G6/P
 qcRbLXY7x8AUnj6Nhst8/5RUMJKSWtzLFfOpu
X-Google-Smtp-Source: AGHT+IEqcbTkt6qSg7YMb9qbRE2hplP7bBwMzR5RZT602EFr+jx4t84q17B3Qyfjns8Yyr40PzcLAA==
X-Received: by 2002:a05:600c:3b89:b0:45c:b580:f7a5 with SMTP id
 5b1f17b1804b1-45dcfa3eb0cmr27104165e9.28.1756993991999; 
 Thu, 04 Sep 2025 06:53:11 -0700 (PDT)
Received: from [10.175.133.6] ([131.175.126.3])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b6f0c6fe5sm368513785e9.5.2025.09.04.06.53.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Sep 2025 06:53:11 -0700 (PDT)
Message-ID: <0cb963d6-744b-4181-b590-08fee5516e30@linaro.org>
Date: Thu, 4 Sep 2025 15:53:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] target/riscv: Use tcg nodes for strided vector
 ld/st generation
To: Chao Liu <chao.liu@zevorn.cn>, paolo.savini@embecosm.com,
 npiggin@gmail.com, ebiggers@kernel.org, dbarboza@ventanamicro.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <cover.1756975571.git.chao.liu@zevorn.cn>
 <74e3337dfebbeb29667492a1e57e87c75b55c725.1756975571.git.chao.liu@zevorn.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <74e3337dfebbeb29667492a1e57e87c75b55c725.1756975571.git.chao.liu@zevorn.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 9/4/25 11:13, Chao Liu wrote:
> +/*
> + * Check whether the i bit of the mask is 0 or 1.
> + *
> + * static inline int vext_elem_mask(void *v0, int index)
> + * {
> + *     int idx = index / 64;
> + *     int pos = index % 64;
> + *     return (((uint64_t *)v0)[idx] >> pos) & 1;
> + * }
> + *
> + * And
> + *
> + * if (vext_elem_mask(v0, i) != 0) {
> + *     goto label;
> + * }
> + */
> +static void gen_check_vext_elem_mask(TCGLabel *label, TCGv mask, TCGv mask_offs)
> +{
> +    TCGv mask_offs_64 = tcg_temp_new();
> +    TCGv mask_offs_rem = tcg_temp_new();
> +    TCGv mask_elem = tcg_temp_new();
> +
> +    tcg_gen_shri_tl(mask_offs_64, mask_offs, 3);
> +    tcg_gen_add_tl(mask_offs_64, mask_offs_64, mask);
> +    tcg_gen_ld_i64((TCGv_i64)mask_elem, (TCGv_ptr)mask_offs_64, 0);

Each and every time you cast a TCGv, you're doing something wrong.
There are a lot of them in this patch.

Your host pointer arithmetic should be using TCGv_ptr and tcg_gen_*_ptr().
This mask_elem should itself be TCGv_i64.

> +    tcg_gen_andi_tl(mask_elem, mask_elem, 1);
> +    tcg_gen_brcond_tl(TCG_COND_NE, mask_elem, tcg_constant_tl(0), label);

This should be

     tcg_gen_brcond_i64(TCG_COND_TSTNE, mask_elem, tcg_constant_i64(1), label);


> +/*
> + * Simulate the strided load/store main loop:
> + *
> + * for (i = env->vstart; i < env->vl; env->vstart = ++i) {
> + *     k = 0;
> + *     while (k < nf) {
> + *         if (!vm && !vext_elem_mask(v0, i)) {
> + *             vext_set_elems_1s(vd, vma, (i + k * max_elems) * esz,
> + *                               (i + k * max_elems + 1) * esz);
> + *             k++;
> + *             continue;
> + *         }
> + *         target_ulong addr = base + stride * i + (k << log2_esz);
> + *         ldst(env, adjust_addr(env, addr), i + k * max_elems, vd, ra);
> + *         k++;
> + *     }
> + * }

The form of this loop causes you to do more reads for vext_elem_mask than necessary.

Better to test once outside of the loop over K:

     for (i in vl) {
         if (!vm && !vext_elem_mask(v0, i)) {
             for (k in nf) {
                 vd[i, k] = -1;
             }
         } else {
             for (k in nf) {
                 vd[i, k] = ld(addr);
             }
         }
     }

If vl_eq_vlmax, and VL is a multiple of 64, you can structure this loop like:

     i = 0;
     do {
         mask = v0[i / 64];
         do {
             if (mask & 1) {
                 ...
             }
             mask >>= 1;
         } while (++i & 63);
     } while (i < vl);

If VL is a smaller power of 2, you can load smaller units of mask to match.  Though beware 
of the big-endian host addressing fixup.

If VM, you should fuse I and K into a single loop over all elements.


r~

