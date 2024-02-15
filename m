Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E324C48BC4
	for <qemu-riscv@archiver.kernel.org>; Thu, 15 Feb 2024 21:12:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1raj1G-0007Q7-NO; Thu, 15 Feb 2024 16:11:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1raj1F-0007Pf-HV
 for qemu-riscv@nongnu.org; Thu, 15 Feb 2024 16:11:45 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1raj1D-0007yX-E7
 for qemu-riscv@nongnu.org; Thu, 15 Feb 2024 16:11:45 -0500
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1db51e55023so9120075ad.1
 for <qemu-riscv@nongnu.org>; Thu, 15 Feb 2024 13:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1708031501; x=1708636301; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ajcUd7BoGoAErpFwgcsY7Xh78sqBPCqncnr8BhUPTdQ=;
 b=T5bwO+7YkonyakBojISUeotUK9p3ms5djO5ardn9/4l4hCnLYJgTCd4EhXRCfCnTQh
 ucoCgPf0+iM7zrxbNDKos1nRHS75in22vK8uPlX7WE00JWyBZalNuCG1DQzeGGEIBR8e
 0S4ovpUaSJ9L527QHSCrfzlzhPI8PQH5lzXgFDFHuHwNzVyX8RFo7+Gntl/aLMMDph2w
 N4TlMQphOuRYDWgCgyd/K5/LCc14Ob/+4fb8Zo5sxW1oTvF9cQNcXaAtjK2ff4sXXgbw
 MbQrDoKj3/sOMarosz5Dnft9Laj3yb2wn7l5oyH69A4w4HXFU9O7YksKJG6cde/M7tfU
 TfoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708031501; x=1708636301;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ajcUd7BoGoAErpFwgcsY7Xh78sqBPCqncnr8BhUPTdQ=;
 b=MmAhvagNGgPSEM4kVfVYGx9icoPPSyY2qIVUSLsJ511bazcfr4nxOqTxE7dKp5sV03
 L4+uQ33Sww4C40aVJKbVVBAKp+C+n7i16IzZiIGJ83TejQmWpMrqP29HIyaBglofIhts
 dSEuajGGTIFztu0rGyS1IGR/vJK1RWDjx56OmuDB3nKKELoDeTMpSSizPQXTE2vMJcu1
 0idRF1rL4wSYTjjNwfhEqBP1N9I5Z36twn7EBEHvU6qDpHvYUDtjb+QqsKgyLtsVEXa4
 jw1emd/NlqzpiWDPuxpquAQ3sbs7NvwvVZj7fxRJN9XyZ0gfbZDt8CKrtycTrFypz4lW
 W2KA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfUSecYo3zi4KwTC/ABnb2qO67pJvFAgQkrPh+bkEykaBZ4Grv+Xrr/YNA6W8BUTNe1tE0OPMq30+YhBE7cEm9BBopMiI=
X-Gm-Message-State: AOJu0Yz2qk+41PmNzCbtE3TZCXx2sY8aPkUMyxxP/p6uT1PX3PlB8bda
 0rwXmuXqHW7RTn6XkdykksBbFXIecIBm6QrJlv//OJMaBTGKoq7KrudKJQSaQjQ=
X-Google-Smtp-Source: AGHT+IGTsiH3lMbKsM1FK+onm2rLjTE8hFWyKRQTB36EmG30pFNjUzjkOy3BvPFjynIWmtQdDnamlw==
X-Received: by 2002:a17:903:2593:b0:1d9:9c67:58eb with SMTP id
 jb19-20020a170903259300b001d99c6758ebmr2880355plb.30.1708031500971; 
 Thu, 15 Feb 2024 13:11:40 -0800 (PST)
Received: from [192.168.68.110] ([177.94.15.159])
 by smtp.gmail.com with ESMTPSA id
 v17-20020a170902e8d100b001db3a0c52basm1697480plg.92.2024.02.15.13.11.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Feb 2024 13:11:40 -0800 (PST)
Message-ID: <2701c3a3-d9ab-4058-99f6-d542baf293ec@ventanamicro.com>
Date: Thu, 15 Feb 2024 18:11:36 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/6] target/riscv: Inline vext_ldst_us and
 coressponding function for performance
Content-Language: en-US
To: Max Chou <max.chou@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20240215192823.729209-1-max.chou@sifive.com>
 <20240215192823.729209-4-max.chou@sifive.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20240215192823.729209-4-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



On 2/15/24 16:28, Max Chou wrote:
> In the vector unit-stride load/store helper functions. the vext_ldst_us
> function corresponding most of the execution time. Inline the functions
> can avoid the function call overhead to imperove the helper function
> performance.
> 
> Signed-off-by: Max Chou <max.chou@sifive.com>
> ---

The inline is a good idea but I think we can do better. I mentioned in a thread
last year [1] about the time we're spending in single byte loads/stores, even
for strided instructions.

E.g. in vext_ldst_stride():


     for (i = env->vstart; i < env->vl; i++, env->vstart++) {
         k = 0;
         while (k < nf) {
             if (!vm && !vext_elem_mask(v0, i)) {
                 /* set masked-off elements to 1s */
                 vext_set_elems_1s(vd, vma, (i + k * max_elems) * esz,
                                   (i + k * max_elems + 1) * esz);
                 k++;
                 continue;
             }
             target_ulong addr = base + stride * i + (k << log2_esz);
             ldst_elem(env, adjust_addr(env, addr), i + k * max_elems, vd, ra);
             k++;
         }
     }

We're doing single byte load/stores in ldst_elem() when, in this case, we could do
it in a whole block only once. ARM does something similar in SVE.

I update the gitlab bug https://gitlab.com/qemu-project/qemu/-/issues/2137 with this
additional info too.



Thanks,

Daniel


[1] https://lore.kernel.org/qemu-riscv/0e54c6c1-2903-7942-eff2-2b8c5e21187e@ventanamicro.com/


>   target/riscv/vector_helper.c | 30 ++++++++++++++++--------------
>   1 file changed, 16 insertions(+), 14 deletions(-)
> 
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index e8fbb921449..866f77d321d 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -149,25 +149,27 @@ static inline void vext_set_elem_mask(void *v0, int index,
>   typedef void vext_ldst_elem_fn(CPURISCVState *env, abi_ptr addr,
>                                  uint32_t idx, void *vd, uintptr_t retaddr);
>   
> -#define GEN_VEXT_LD_ELEM(NAME, ETYPE, H, LDSUF)            \
> -static void NAME(CPURISCVState *env, abi_ptr addr,         \
> -                 uint32_t idx, void *vd, uintptr_t retaddr)\
> -{                                                          \
> -    ETYPE *cur = ((ETYPE *)vd + H(idx));                   \
> -    *cur = cpu_##LDSUF##_data_ra(env, addr, retaddr);      \
> -}                                                          \
> +#define GEN_VEXT_LD_ELEM(NAME, ETYPE, H, LDSUF)         \
> +static inline QEMU_ALWAYS_INLINE                        \
> +void NAME(CPURISCVState *env, abi_ptr addr,             \
> +          uint32_t idx, void *vd, uintptr_t retaddr)    \
> +{                                                       \
> +    ETYPE *cur = ((ETYPE *)vd + H(idx));                \
> +    *cur = cpu_##LDSUF##_data_ra(env, addr, retaddr);   \
> +}                                                       \
>   
>   GEN_VEXT_LD_ELEM(lde_b, int8_t,  H1, ldsb)
>   GEN_VEXT_LD_ELEM(lde_h, int16_t, H2, ldsw)
>   GEN_VEXT_LD_ELEM(lde_w, int32_t, H4, ldl)
>   GEN_VEXT_LD_ELEM(lde_d, int64_t, H8, ldq)
>   
> -#define GEN_VEXT_ST_ELEM(NAME, ETYPE, H, STSUF)            \
> -static void NAME(CPURISCVState *env, abi_ptr addr,         \
> -                 uint32_t idx, void *vd, uintptr_t retaddr)\
> -{                                                          \
> -    ETYPE data = *((ETYPE *)vd + H(idx));                  \
> -    cpu_##STSUF##_data_ra(env, addr, data, retaddr);       \
> +#define GEN_VEXT_ST_ELEM(NAME, ETYPE, H, STSUF)         \
> +static inline QEMU_ALWAYS_INLINE                        \
> +void NAME(CPURISCVState *env, abi_ptr addr,             \
> +          uint32_t idx, void *vd, uintptr_t retaddr)    \
> +{                                                       \
> +    ETYPE data = *((ETYPE *)vd + H(idx));               \
> +    cpu_##STSUF##_data_ra(env, addr, data, retaddr);    \
>   }
>   
>   GEN_VEXT_ST_ELEM(ste_b, int8_t,  H1, stb)
> @@ -289,7 +291,7 @@ GEN_VEXT_ST_STRIDE(vsse64_v, int64_t, ste_d)
>    */
>   
>   /* unmasked unit-stride load and store operation */
> -static void
> +static inline QEMU_ALWAYS_INLINE void
>   vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
>                vext_ldst_elem_fn *ldst_elem, uint32_t log2_esz, uint32_t evl,
>                uintptr_t ra)

