Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 981D8C021B2
	for <qemu-riscv@archiver.kernel.org>; Tue, 25 Feb 2025 17:56:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tmzAV-0003br-Eh; Tue, 25 Feb 2025 12:56:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tmzAI-0003Ys-Dg
 for qemu-riscv@nongnu.org; Tue, 25 Feb 2025 12:56:20 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tmzAG-0000qz-BY
 for qemu-riscv@nongnu.org; Tue, 25 Feb 2025 12:56:18 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-2fa8ac56891so9581139a91.2
 for <qemu-riscv@nongnu.org>; Tue, 25 Feb 2025 09:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1740506173; x=1741110973; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nQgXZ0mMIQoHFov7MzlQ5j2szkWD4b2laCNt1dxfFr0=;
 b=Xfm7OyTXz7SXarrQM9QLnCGB3ujoyA9RPvXJsOWzcFOp3TkjrGzq8h9GXRTjdsMQzL
 Id4SbdaBGHccHRRk2KN2p+nRI56cUMvGBFT6u7zI8K39sGPlMjqnIxCQgxE6d5ug++VO
 SifrSuOGC57UoyvCsvai+iLNkzPSUI61I4HQig8PTGeV3/vPLASHMiG31rupb8XwBlvi
 xZ1Ji6xzuz982MIPyrmjeqERU0yKvJWZ0kQaATUlu5W4mfhwp4f+E4NBmYQ2yolt3PN6
 XpaUTba6BHHbX4hNVB3fKo/2Dqhdw7z+Fx7JdHT4RXj8UKjm/bKPCTR6ZU5qWUNVMVU0
 rS2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740506173; x=1741110973;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nQgXZ0mMIQoHFov7MzlQ5j2szkWD4b2laCNt1dxfFr0=;
 b=wdgbmzGS+3bBc2o9KPo9zaY4mpjyDwsg8CVikZHRUKaYMsgto2BpJz7ppYVM8C4//N
 Hd2KMQZXgmGwzMe1x8apbw5Hn9KPo5c9KsnDZFmcv6/yxUdWIYJTBNz1oHogjx5s6mZb
 8S/4j0z4/rJ+zU6VRpnajCtkdrOU0OjWoWRjLHFtA07K9o8Djlh8s3IFZQvvEjzSou37
 DhF2HemplDyFrDELcA7uUxjYTtZrepH57kfYeJrB8p/rFIwmN0C7ZQ42mafR/+nGWLGJ
 lryQLECrjS4ynDCfP3iVZ22657zXL/bXUVNAYtLrv8q9enh39BSZTYgNxShDZEsZyP8Z
 RiIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVff9eskqBZlACmRaZeOWl3pOyweSIX2X6pz8HklL4C3J0Tu7SoyP5cfhef6N1hIjjgonQ5QxbrnScm@nongnu.org
X-Gm-Message-State: AOJu0YwwS+kgg2qgoqVLhYXVJj7tpEPTSEkBzIFd7A2SuZNMb1dbPP9e
 l+uzbBEdybJIw1m/fhQ/ChBmmvH8RNlqOwqxq3s/MSB51QOU7ruUval2Zw0vMZs=
X-Gm-Gg: ASbGncszd27+AzkC9+PUZhdjBfJ1GJqfc7V2EX9M/JIAKIjHsQOGQQuUjvu34rM7ieq
 2t4gGRYWcwKclO+v5jO2jb7/oYBi9ezksvS3KjBJhaMhTtq77UFzD2cdER/7p1VdpgBIboqEOsF
 LFly4R+COxB8ifrEI9ooE4RhtiufwjyzryoSF4rNc8GbTplZh01aZdxmi6xibC1g/9AUWUudZlF
 Uarr+Ldb+dv7V+roO2mb4bTNINL6TpVErIUMDjl8H+AMiCexqw1PrwAeJLMeNNubr9n6RgSSpu9
 mJChbEPE91epwD/ibJ41nBJQmZzf8W4pgdNCDQWhHg==
X-Google-Smtp-Source: AGHT+IFZX2lUhrkBx2EWjeRRiTIQEavJnQXo2jc+SRpgzwHL+fdkclng+L9B5fBjAQDvoYCK0iLWlA==
X-Received: by 2002:a17:90b:1f88:b0:2fc:bc04:2092 with SMTP id
 98e67ed59e1d1-2fe68ae29cdmr7515013a91.17.1740506173635; 
 Tue, 25 Feb 2025 09:56:13 -0800 (PST)
Received: from [192.168.68.110] ([177.170.227.219])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fceb12b532sm8835111a91.47.2025.02.25.09.56.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2025 09:56:13 -0800 (PST)
Message-ID: <3443f418-7e3c-4f5a-855a-51afaa4b847d@ventanamicro.com>
Date: Tue, 25 Feb 2025 14:56:08 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1 V2] [RISC-V/RVV] optimize the memory probing for
 vector fault-only-first loads.
To: Paolo Savini <paolo.savini@embecosm.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Richard Handerson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Helene Chelin <helene.chelin@embecosm.com>, Nathan Egge <negge@google.com>,
 Max Chou <max.chou@sifive.com>, Jeremy Bennett
 <jeremy.bennett@embecosm.com>, Craig Blackmore <craig.blackmore@embecosm.com>
References: <20250221155320.59159-1-paolo.savini@embecosm.com>
 <20250221155320.59159-2-paolo.savini@embecosm.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20250221155320.59159-2-paolo.savini@embecosm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pj1-x102d.google.com
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



On 2/21/25 12:53 PM, Paolo Savini wrote:
> Fault-only-first loads in the RISC-V vector extension need to update
> the vl with the element index that causes an exception.
> In order to ensure this the emulation of this instruction used to probe the
> memory covered by the load operation with a loop that iterated over each element
> so that when a flag was raised it was possible to set the vl to the
> corresponding element index.
> This loop was executed every time whether an exception happened or not.
> 
> This commit removes the per element memory probing from the main execution path
> and adds a broad memory probing first. If this probing raises any flag that is
> not a watchpoint flag (that per standard is allowed by this instruction) we
> proceed with the per element probing to find the index of the element causing
> the exception and set vl to such index.
> 
> Signed-off-by: Paolo Savini <paolo.savini@embecosm.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/vector_helper.c | 103 ++++++++++++++++++++---------------
>   1 file changed, 58 insertions(+), 45 deletions(-)
> 
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 5386e3b97c..772cff8fbe 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -633,47 +633,69 @@ vext_ldff(void *vd, void *v0, target_ulong base, CPURISCVState *env,
>       uint32_t esz = 1 << log2_esz;
>       uint32_t msize = nf * esz;
>       uint32_t vma = vext_vma(desc);
> -    target_ulong addr, offset, remain, page_split, elems;
> +    target_ulong addr, addr_probe, addr_i, offset, remain, page_split, elems;
>       int mmu_index = riscv_env_mmu_index(env, false);
> +    int flags;
> +    void *host;
>   
>       VSTART_CHECK_EARLY_EXIT(env);
>   
> -    /* probe every access */
> -    for (i = env->vstart; i < env->vl; i++) {
> -        if (!vm && !vext_elem_mask(v0, i)) {
> -            continue;
> -        }
> -        addr = adjust_addr(env, base + i * (nf << log2_esz));
> -        if (i == 0) {
> -            /* Allow fault on first element. */
> -            probe_pages(env, addr, nf << log2_esz, ra, MMU_DATA_LOAD);
> -        } else {
> -            remain = nf << log2_esz;
> -            while (remain > 0) {
> -                void *host;
> -                int flags;
> -
> -                offset = -(addr | TARGET_PAGE_MASK);
> -
> -                /* Probe nonfault on subsequent elements. */
> -                flags = probe_access_flags(env, addr, offset, MMU_DATA_LOAD,
> -                                           mmu_index, true, &host, 0);
> -
> -                /*
> -                 * Stop if invalid (unmapped) or mmio (transaction may fail).
> -                 * Do not stop if watchpoint, as the spec says that
> -                 * first-fault should continue to access the same
> -                 * elements regardless of any watchpoint.
> -                 */
> -                if (flags & ~TLB_WATCHPOINT) {
> -                    vl = i;
> -                    goto ProbeSuccess;
> -                }
> -                if (remain <= offset) {
> -                    break;
> +    addr = base + ((env->vstart * nf) << log2_esz);
> +    page_split = -(addr | TARGET_PAGE_MASK);
> +    /* Get number of elements */
> +    elems = page_split / msize;
> +    if (unlikely(env->vstart + elems >= env->vl)) {
> +        elems = env->vl - env->vstart;
> +    }
> +
> +    /* Check page permission/pmp/watchpoint/etc. */
> +    flags = probe_access_flags(env, adjust_addr(env, addr), elems * msize,
> +                               MMU_DATA_LOAD, mmu_index, true, &host, ra);
> +
> +    /* If we are crossing a page check also the second page. */
> +    if (env->vl > elems) {
> +        addr_probe = addr + (elems << log2_esz);
> +        flags |= probe_access_flags(env, adjust_addr(env, addr_probe),
> +                                    elems * msize, MMU_DATA_LOAD, mmu_index,
> +                                    true, &host, ra);
> +    }
> +
> +    if (flags & ~TLB_WATCHPOINT) {
> +        /* probe every access */
> +        for (i = env->vstart; i < env->vl; i++) {
> +            if (!vm && !vext_elem_mask(v0, i)) {
> +                continue;
> +            }
> +            addr_i = adjust_addr(env, base + i * (nf << log2_esz));
> +            if (i == 0) {
> +                /* Allow fault on first element. */
> +                probe_pages(env, addr_i, nf << log2_esz, ra, MMU_DATA_LOAD);
> +            } else {
> +                remain = nf << log2_esz;
> +                while (remain > 0) {
> +                    offset = -(addr_i | TARGET_PAGE_MASK);
> +
> +                    /* Probe nonfault on subsequent elements. */
> +                    flags = probe_access_flags(env, addr_i, offset,
> +                                               MMU_DATA_LOAD, mmu_index, true,
> +                                               &host, 0);
> +
> +                    /*
> +                     * Stop if invalid (unmapped) or mmio (transaction may
> +                     * fail). Do not stop if watchpoint, as the spec says that
> +                     * first-fault should continue to access the same
> +                     * elements regardless of any watchpoint.
> +                     */
> +                    if (flags & ~TLB_WATCHPOINT) {
> +                        vl = i;
> +                        goto ProbeSuccess;
> +                    }
> +                    if (remain <= offset) {
> +                        break;
> +                    }
> +                    remain -= offset;
> +                    addr_i = adjust_addr(env, addr_i + offset);
>                   }
> -                remain -= offset;
> -                addr = adjust_addr(env, addr + offset);
>               }
>           }
>       }
> @@ -685,15 +707,6 @@ ProbeSuccess:
>   
>       if (env->vstart < env->vl) {
>           if (vm) {
> -            /* Calculate the page range of first page */
> -            addr = base + ((env->vstart * nf) << log2_esz);
> -            page_split = -(addr | TARGET_PAGE_MASK);
> -            /* Get number of elements */
> -            elems = page_split / msize;
> -            if (unlikely(env->vstart + elems >= env->vl)) {
> -                elems = env->vl - env->vstart;
> -            }
> -
>               /* Load/store elements in the first page */
>               if (likely(elems)) {
>                   vext_page_ldst_us(env, vd, addr, elems, nf, max_elems,


