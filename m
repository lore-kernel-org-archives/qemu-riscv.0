Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47D88D6B6AE
	for <qemu-riscv@archiver.kernel.org>; Wed, 30 Oct 2024 16:38:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1t6BhQ-0008Gu-Od; Wed, 30 Oct 2024 12:37:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1t6Bh8-0008Dx-4G
 for qemu-riscv@nongnu.org; Wed, 30 Oct 2024 12:37:21 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1t6Bh6-0005a7-EJ
 for qemu-riscv@nongnu.org; Wed, 30 Oct 2024 12:37:17 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-20caea61132so214685ad.2
 for <qemu-riscv@nongnu.org>; Wed, 30 Oct 2024 09:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1730306235; x=1730911035; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hMiLNWIGV7NSnAU7TASNWBFCWHlLdkbPLiy10xQAdAI=;
 b=Dsl8rKtYdHGdwy6ideCcAYwcwXBIyJTqao8rFPOLUNc5hZFIx+F1DUyVNXEhw3YcoB
 3iAot+6rVXpM3h3S/Cj8tz//pJUMTOgb9lUpNaBTJ0979zA/64pH2ls4zvd9SZhOz+Em
 xGuEsscBPC9L7ACNLfESeY8aVdmrg7H6jwHtqDLb4EqFcvM5Q/UJY+/kBqTQqYMBer8y
 nab/Obk1AvI2xxz4Oc9CwNuBtWhXDS0Yi989YhHH3N5no4np3DY/foPeBnzLFVn49AEj
 M39DDG4CjqqXQEAFsMkHKI52aCUUAdYT2+KGyke/yIXpVeeRfmVNt0HvxVedY8Iqhb+z
 Isqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730306235; x=1730911035;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hMiLNWIGV7NSnAU7TASNWBFCWHlLdkbPLiy10xQAdAI=;
 b=Ji7fBh65GLc3ELEE1BqP9R9I/zwSxS4hfX9zhCN4+Jfgn/KGIyn+sCoJ5rmrs3Dzec
 tYALt4wjqnB1kD9gmszimcO4vhItoMHWpztZvGMXHvqmV/abCbmlmF5EyqOevYSSD5Ic
 ne0Hb7bpgZNgAjMM6N/+dwLIAvB1RJ2FUWaCE6CODwOYkvzAS90sSMwR2RAMCjb77+1I
 XTdtqvkXw4462zFwXyX1bdqB3zs6QOlrCUf9ZVko7uHrN/CvgKytv1eyqyKQIiuasygi
 UKPLHKsOR6mCdsbNge57WD7waQeD3krSdfc8zaXnLmZu2LS3y+hSp8teeBlF+vHKu0lq
 GaNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtgBtgGS8Lzhlp34kQYPmNYGRjdB4NfuvSA6p2GMI8VZqlf9EPFRI6c94um5g4/AuTINNkNI9dXLal@nongnu.org
X-Gm-Message-State: AOJu0YykrqAhPqLi2o6fuMN8QrNdfnlzlREmyR4Gs2GjBHrXqfZJ5Sdp
 z2312epjUGn+yzl1r8/xo/8TciRJQ/d5JhEDEmt6mQiQE6pn6gk71lZzM6HPcOk=
X-Google-Smtp-Source: AGHT+IGT+bk8x385PUKg5L/+PH/MUZqFRLFP4LP0v0+IW5qWzBjN47w8b0vqfuAH06jEjSHR9LybIw==
X-Received: by 2002:a17:903:2343:b0:20c:716c:5c2 with SMTP id
 d9443c01a7336-210c68995d7mr220835845ad.13.1730306234672; 
 Wed, 30 Oct 2024 09:37:14 -0700 (PDT)
Received: from [192.168.68.110] ([191.8.109.222])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-210f691eda1sm16658815ad.196.2024.10.30.09.37.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Oct 2024 09:37:14 -0700 (PDT)
Message-ID: <25b14d26-0951-4079-af3f-251a9a821af9@ventanamicro.com>
Date: Wed, 30 Oct 2024 13:37:09 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/7] target/riscv: Inline unit-stride ld/st and
 corresponding functions for performance
To: Max Chou <max.chou@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 richard.henderson@linaro.org, negge@google.com
References: <20240918171412.150107-1-max.chou@sifive.com>
 <20240918171412.150107-8-max.chou@sifive.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20240918171412.150107-8-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x630.google.com
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



On 9/18/24 2:14 PM, Max Chou wrote:
> In the vector unit-stride load/store helper functions. the vext_ldst_us
> & vext_ldst_whole functions corresponding most of the execution time.
> Inline the functions can avoid the function call overhead to improve the
> helper function performance.
> 
> Signed-off-by: Max Chou <max.chou@sifive.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/vector_helper.c | 18 +++++++++++-------
>   1 file changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 654d5e111f3..0d5ed950486 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -152,14 +152,16 @@ typedef void vext_ldst_elem_fn_tlb(CPURISCVState *env, abi_ptr addr,
>   typedef void vext_ldst_elem_fn_host(void *vd, uint32_t idx, void *host);
>   
>   #define GEN_VEXT_LD_ELEM(NAME, ETYPE, H, LDSUF)             \
> -static void NAME##_tlb(CPURISCVState *env, abi_ptr addr,    \
> +static inline QEMU_ALWAYS_INLINE                            \
> +void NAME##_tlb(CPURISCVState *env, abi_ptr addr,           \
>                   uint32_t idx, void *vd, uintptr_t retaddr)  \
>   {                                                           \
>       ETYPE *cur = ((ETYPE *)vd + H(idx));                    \
>       *cur = cpu_##LDSUF##_data_ra(env, addr, retaddr);       \
>   }                                                           \
>                                                               \
> -static void NAME##_host(void *vd, uint32_t idx, void *host) \
> +static inline QEMU_ALWAYS_INLINE                            \
> +void NAME##_host(void *vd, uint32_t idx, void *host)        \
>   {                                                           \
>       ETYPE *cur = ((ETYPE *)vd + H(idx));                    \
>       *cur = (ETYPE)LDSUF##_p(host);                          \
> @@ -171,14 +173,16 @@ GEN_VEXT_LD_ELEM(lde_w, uint32_t, H4, ldl)
>   GEN_VEXT_LD_ELEM(lde_d, uint64_t, H8, ldq)
>   
>   #define GEN_VEXT_ST_ELEM(NAME, ETYPE, H, STSUF)             \
> -static void NAME##_tlb(CPURISCVState *env, abi_ptr addr,    \
> +static inline QEMU_ALWAYS_INLINE                            \
> +void NAME##_tlb(CPURISCVState *env, abi_ptr addr,           \
>                   uint32_t idx, void *vd, uintptr_t retaddr)  \
>   {                                                           \
>       ETYPE data = *((ETYPE *)vd + H(idx));                   \
>       cpu_##STSUF##_data_ra(env, addr, data, retaddr);        \
>   }                                                           \
>                                                               \
> -static void NAME##_host(void *vd, uint32_t idx, void *host) \
> +static inline QEMU_ALWAYS_INLINE                            \
> +void NAME##_host(void *vd, uint32_t idx, void *host)        \
>   {                                                           \
>       ETYPE data = *((ETYPE *)vd + H(idx));                   \
>       STSUF##_p(host, data);                                  \
> @@ -317,7 +321,7 @@ GEN_VEXT_ST_STRIDE(vsse64_v, int64_t, ste_d_tlb)
>    */
>   
>   /* unmasked unit-stride load and store operation */
> -static void
> +static inline QEMU_ALWAYS_INLINE void
>   vext_page_ldst_us(CPURISCVState *env, void *vd, target_ulong addr,
>                     uint32_t elems, uint32_t nf, uint32_t max_elems,
>                     uint32_t log2_esz, bool is_load, int mmu_index,
> @@ -369,7 +373,7 @@ vext_page_ldst_us(CPURISCVState *env, void *vd, target_ulong addr,
>       }
>   }
>   
> -static void
> +static inline QEMU_ALWAYS_INLINE void
>   vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
>                vext_ldst_elem_fn_tlb *ldst_tlb,
>                vext_ldst_elem_fn_host *ldst_host, uint32_t log2_esz,
> @@ -756,7 +760,7 @@ GEN_VEXT_LDFF(vle64ff_v, int64_t, lde_d_tlb, lde_d_host)
>   /*
>    * load and store whole register instructions
>    */
> -static void
> +static inline QEMU_ALWAYS_INLINE void
>   vext_ldst_whole(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
>                   vext_ldst_elem_fn_tlb *ldst_tlb,
>                   vext_ldst_elem_fn_host *ldst_host, uint32_t log2_esz,

