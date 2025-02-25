Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58AD2C021B2
	for <qemu-riscv@archiver.kernel.org>; Tue, 25 Feb 2025 18:04:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tmzHm-0006v3-LL; Tue, 25 Feb 2025 13:04:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tmzHC-0006oV-OY
 for qemu-riscv@nongnu.org; Tue, 25 Feb 2025 13:03:36 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tmzH7-0001hL-Nj
 for qemu-riscv@nongnu.org; Tue, 25 Feb 2025 13:03:24 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-2fc042c9290so9214452a91.0
 for <qemu-riscv@nongnu.org>; Tue, 25 Feb 2025 10:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1740506600; x=1741111400; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Kz/ULFmmFW1L+imp4J+QHBTCN/NNETrnCiCuaeCd76E=;
 b=EedmPsjIpgkKvkPV74vbFRTTMxnrDXApkQghPsDv8M95gs2zVAIoCcl4n7q+qiYDzk
 J6o8rItrwD2lDPf8tMG+R/O4pVN6I1dgracykEDnkKdXNh5g/RKaVa79X83zqHvSJlff
 4x+7l7VikPyeWoEA6voTfqJZxDh65zwbrPWBjOVhGjEqiW/1neIVglsi+BbuQGrDszu+
 bDQnbX/m9ABdnH+sJykLxYdlzilMp04qPY4k/vFyCyXsPwHD8tzT/Qds367inA9nUfz4
 YECrD3YlwkqhcbRcF9JktqZIdop3llfoybxm2wv3UjhZI9zl3D9ZNUrUSCuZkxcTHFht
 ktsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740506600; x=1741111400;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Kz/ULFmmFW1L+imp4J+QHBTCN/NNETrnCiCuaeCd76E=;
 b=LM2xnTB1m/GLD/9SPaBVvDvQUKSLyxXek40V10U3cifUMiLFk6Ucmi/htv3OhgzMPN
 vmp1FxqMUrug8j2bTvE2ehFtWLwW67x+T6JGaxNfInFgZ62SCBCNMWP2AIMYh8FHPLeN
 dEwST2kVi3Bt0e/CjiCtzSJt/pSSf3mpNZFTb9khGhwNSOQl/XaaGLerynNrqs5SSC2p
 c2nH05U63D96/CsR143vYqESFD8u6CgCWLo+yb8rW7IXikIgMia2pdUp6vwchUjFX5gO
 NKYBiyCTH6GA74rMxu4tJK4AGm3GlV1YLynKncYVCF/ZLfJYXzqZIpgpP6ufZJ503ink
 mDXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8Q/htJT6xkkuxNxmiVXG/Y+lfbEaYq1LHKfE8VXKyYR1Woho06KgrqlYj8xoxBthg/A1YQGjBSQGm@nongnu.org
X-Gm-Message-State: AOJu0YyT6xJPXVwItyTMgvXJSiNgIeOPUJgx3VhVMCZo3Z+XA6+7OaMQ
 UU+mQ1DjgLR24N7wHrykvDpxswpSyDm8A/UH2femfUeAoLP3IdTDZK5F2C48b08=
X-Gm-Gg: ASbGncsMJcReUeHSmfpwomrZGyb/C/Sp36c0CPelcalM09Lgv7YEeVieuDVVe1yoU9V
 4HcyJn6dNE0Gg37qTNEix+jvInO0fOzl7w/+cMLXF1hIfoUCV2Dp69MkkfRwILmrfZFBsDJ92Mm
 oBQur5tSjErDS9lOgijATeymEUmOduFBWgKtxL1mipJi8gmkDIujPG0WwVYhEP7xQqIx2UqPqL3
 iIZNk/y4CuPeIG56LShsDaarq1NJVMl+1A7lS1Vhe+NDmUgVcMwUx8P+75BCjFHIPDICCihH0Ps
 cN0+blzT9U6nW0+ncI+myJb9v3mmDhRqG4sJSiEW/A==
X-Google-Smtp-Source: AGHT+IE8BhuRoA3I+joQAkSkZY2yH6cmNXEaAfyry/rV5DjUPMSR8Z1NyoE/MSn7XUUauJV5kK8B9Q==
X-Received: by 2002:a17:90b:4d0d:b0:2f2:a664:df19 with SMTP id
 98e67ed59e1d1-2fe7e2e0719mr535365a91.7.1740506599810; 
 Tue, 25 Feb 2025 10:03:19 -0800 (PST)
Received: from [192.168.68.110] ([177.170.227.219])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2230a094470sm17299285ad.111.2025.02.25.10.03.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2025 10:03:19 -0800 (PST)
Message-ID: <a4054c16-05e1-4d51-a94e-ae5b82113086@ventanamicro.com>
Date: Tue, 25 Feb 2025 15:03:14 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] [RISC-V/RVV] Expand the probe_pages helper function
 to handle probe flags.
To: Paolo Savini <paolo.savini@embecosm.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Richard Handerson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Helene Chelin <helene.chelin@embecosm.com>, Nathan Egge <negge@google.com>,
 Max Chou <max.chou@sifive.com>, Jeremy Bennett
 <jeremy.bennett@embecosm.com>, Craig Blackmore <craig.blackmore@embecosm.com>
References: <20250221162036.61521-1-paolo.savini@embecosm.com>
 <20250221162036.61521-2-paolo.savini@embecosm.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20250221162036.61521-2-paolo.savini@embecosm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pj1-x1033.google.com
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



On 2/21/25 1:20 PM, Paolo Savini wrote:
> This commit expands the probe_pages helper function in
> target/riscv/vector_helper.c to handle also the cases in which we need access to
> the flags raised while probing the memory and the host address.
> This is done in order to provide a unified interface to probe_access and
> probe_access_flags.
> The new version of probe_pages can now act as a regular call to probe_access as
> before and as a call to probe_access_flags. In the latter case the user need to
> pass pointers to flags and host address and a boolean value for nonfault.
> The flags and host address will be set and made available as for a direct call
> to probe_access_flags.
> 
> Signed-off-by: Paolo Savini <paolo.savini@embecosm.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/vector_helper.c | 57 +++++++++++++++++++++++-------------
>   1 file changed, 37 insertions(+), 20 deletions(-)
> 
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 772cff8fbe..c0f1b7994e 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -114,25 +114,42 @@ static inline uint32_t vext_max_elems(uint32_t desc, uint32_t log2_esz)
>    * It will trigger an exception if there is no mapping in TLB
>    * and page table walk can't fill the TLB entry. Then the guest
>    * software can return here after process the exception or never return.
> + *
> + * This function can also be used when direct access to probe_access_flags is
> + * needed in order to access the flags. If a pointer to a flags operand is
> + * provided the function will call probe_access_flags instead, use nonfault
> + * and update host and flags.
>    */
> -static void probe_pages(CPURISCVState *env, target_ulong addr,
> -                        target_ulong len, uintptr_t ra,
> -                        MMUAccessType access_type)
> +static void probe_pages(CPURISCVState *env, target_ulong addr, target_ulong len,
> +                        uintptr_t ra, MMUAccessType access_type, int mmu_index,
> +                        void **host, int *flags, bool nonfault)
>   {
>       target_ulong pagelen = -(addr | TARGET_PAGE_MASK);
>       target_ulong curlen = MIN(pagelen, len);
> -    int mmu_index = riscv_env_mmu_index(env, false);
>   
> -    probe_access(env, adjust_addr(env, addr), curlen, access_type,
> -                 mmu_index, ra);
> +    if (flags != NULL) {
> +        *flags = probe_access_flags(env, adjust_addr(env, addr), curlen,
> +                                    access_type, mmu_index, nonfault, host, ra);
> +    } else {
> +        probe_access(env, adjust_addr(env, addr), curlen, access_type,
> +                     mmu_index, ra);
> +    }
> +
>       if (len > curlen) {
>           addr += curlen;
>           curlen = len - curlen;
> -        probe_access(env, adjust_addr(env, addr), curlen, access_type,
> -                     mmu_index, ra);
> +        if (flags != NULL) {
> +            *flags = probe_access_flags(env, adjust_addr(env, addr), curlen,
> +                                        access_type, mmu_index, nonfault,
> +                                        host, ra);
> +        } else {
> +            probe_access(env, adjust_addr(env, addr), curlen, access_type,
> +                         mmu_index, ra);
> +        }
>       }
>   }
>   
> +
>   static inline void vext_set_elem_mask(void *v0, int index,
>                                         uint8_t value)
>   {
> @@ -332,8 +349,8 @@ vext_page_ldst_us(CPURISCVState *env, void *vd, target_ulong addr,
>       MMUAccessType access_type = is_load ? MMU_DATA_LOAD : MMU_DATA_STORE;
>   
>       /* Check page permission/pmp/watchpoint/etc. */
> -    flags = probe_access_flags(env, adjust_addr(env, addr), size, access_type,
> -                               mmu_index, true, &host, ra);
> +    probe_pages(env, addr, size, ra, access_type, mmu_index, &host, &flags,
> +                true);
>   
>       if (flags == 0) {
>           if (nf == 1) {
> @@ -635,7 +652,7 @@ vext_ldff(void *vd, void *v0, target_ulong base, CPURISCVState *env,
>       uint32_t vma = vext_vma(desc);
>       target_ulong addr, addr_probe, addr_i, offset, remain, page_split, elems;
>       int mmu_index = riscv_env_mmu_index(env, false);
> -    int flags;
> +    int flags, probe_flags;
>       void *host;
>   
>       VSTART_CHECK_EARLY_EXIT(env);
> @@ -649,15 +666,15 @@ vext_ldff(void *vd, void *v0, target_ulong base, CPURISCVState *env,
>       }
>   
>       /* Check page permission/pmp/watchpoint/etc. */
> -    flags = probe_access_flags(env, adjust_addr(env, addr), elems * msize,
> -                               MMU_DATA_LOAD, mmu_index, true, &host, ra);
> +    probe_pages(env, addr, elems * msize, ra, MMU_DATA_LOAD, mmu_index, &host,
> +                &flags, true);
>   
>       /* If we are crossing a page check also the second page. */
>       if (env->vl > elems) {
>           addr_probe = addr + (elems << log2_esz);
> -        flags |= probe_access_flags(env, adjust_addr(env, addr_probe),
> -                                    elems * msize, MMU_DATA_LOAD, mmu_index,
> -                                    true, &host, ra);
> +        probe_pages(env, addr_probe, elems * msize, ra, MMU_DATA_LOAD,
> +                    mmu_index, &host, &probe_flags, true);
> +        flags |= probe_flags;
>       }
>   
>       if (flags & ~TLB_WATCHPOINT) {
> @@ -669,16 +686,16 @@ vext_ldff(void *vd, void *v0, target_ulong base, CPURISCVState *env,
>               addr_i = adjust_addr(env, base + i * (nf << log2_esz));
>               if (i == 0) {
>                   /* Allow fault on first element. */
> -                probe_pages(env, addr_i, nf << log2_esz, ra, MMU_DATA_LOAD);
> +                probe_pages(env, addr_i, nf << log2_esz, ra, MMU_DATA_LOAD,
> +                            mmu_index, &host, NULL, false);
>               } else {
>                   remain = nf << log2_esz;
>                   while (remain > 0) {
>                       offset = -(addr_i | TARGET_PAGE_MASK);
>   
>                       /* Probe nonfault on subsequent elements. */
> -                    flags = probe_access_flags(env, addr_i, offset,
> -                                               MMU_DATA_LOAD, mmu_index, true,
> -                                               &host, 0);
> +                    probe_pages(env, addr_i, offset, 0, MMU_DATA_LOAD,
> +                                mmu_index, &host, &flags, true);
>   
>                       /*
>                        * Stop if invalid (unmapped) or mmio (transaction may


