Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22227C48BC3
	for <qemu-riscv@archiver.kernel.org>; Sat, 17 Feb 2024 10:10:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rbHeM-0008FL-D2; Sat, 17 Feb 2024 05:10:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1rbHeK-0008Ew-Hn
 for qemu-riscv@nongnu.org; Sat, 17 Feb 2024 05:10:24 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1rbHeI-0007KE-Ba
 for qemu-riscv@nongnu.org; Sat, 17 Feb 2024 05:10:24 -0500
Received: by mail-ot1-x343.google.com with SMTP id
 46e09a7af769-6e2dfc98664so1478346a34.2
 for <qemu-riscv@nongnu.org>; Sat, 17 Feb 2024 02:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1708164620; x=1708769420; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fEg0kiUMPVpFNQ2jnfDUipTODBk8+lx/5Pn6EqiSHLw=;
 b=lj/yIyErjRVSdp+fR9UZBm21uNUXljwR9QgZT0g9fHpot2a66cSBQz2QCYtsTZ8Cfi
 NC07a4R1ycZyrq+kVzSGADoxc9MoGQdXOfLxAOCFjBievixYDsKp2oM32Es7/gkqlwtt
 A4SSEK1Aelr60SsMG3Xela4bhVg6BN2nlR/VP3xnj5WbvRboQZDFv0vTzM9zFAQPnJma
 N4rsUjpxkICT2zdvyn4zDfjP5NMtERU2Sf3T5zY7qxyTU5e7134WVyh0Hs/ftitk6sv8
 nfxONziuGgaxm8nD2oi+ctna+rQPDHjoa+D1yAza15Yo8FkxUZ9u+7oaIyZ1N6Phixnd
 VwPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708164620; x=1708769420;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fEg0kiUMPVpFNQ2jnfDUipTODBk8+lx/5Pn6EqiSHLw=;
 b=VXJfaOVZRgzqJOM9PppleTa9td5EzHAkDlmYC+Tyxuv81GECnWTftnOJ1E4pTh1Kfu
 fSsuBlFQ1gUsO1At+teNP+GhZvbImz/rOxSV18Z47IYB5DGmD82//CVUSf4GTSXDrSSq
 AyItf4Ox3DkBU7kRFrnIXPExLkOMMnzDkXUDNL2oTagM8COdxF+Ose/nNxyeXH0Czkk2
 5HXmf5B6Z8xWEty3MwSpJawekJqD5NGjMj7uT0DMctT10/0JCYzoREqFNlgsWQ6j6nLV
 QnaoARL9K1uPf40ROVKrW2v8NdmqpAIpeWpBPkBqMxbuuO7w12lT5XSnpVQNKCGiB7On
 CdLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1fj1sFS0x48h84aWgF2NhEdHWST8dgj8QMVqGaCLcx8AIqZwe2P3tYz+JS4rvmfmHZHVc0QwH3E3OQTuNxSzVpo6Ml5U=
X-Gm-Message-State: AOJu0YxbgP6q7RMsJzl2LoVgnIn9r965JKbpAOKeRUktvd/LwnPHJLLg
 RxiX2IHwIPP3Kow1FluvkcWUCmcVjfdLvQUaH4wOzxj+2Hr4NAyGDq/2j2i0Ogs=
X-Google-Smtp-Source: AGHT+IGc11M61aBlcSv69c21hBxsTi0G2epduZVn2YcjeIbimA/Sq/oe4RXYd5OI4ZEHLoVVZnvk3w==
X-Received: by 2002:a05:6359:4597:b0:178:95b6:f87c with SMTP id
 no23-20020a056359459700b0017895b6f87cmr6098518rwb.11.1708164620293; 
 Sat, 17 Feb 2024 02:10:20 -0800 (PST)
Received: from [100.64.0.1] ([136.226.240.197])
 by smtp.gmail.com with ESMTPSA id
 ph12-20020a17090b3bcc00b0029696f7f443sm1451569pjb.50.2024.02.17.02.10.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Feb 2024 02:10:19 -0800 (PST)
Message-ID: <8c626d62-85b4-c940-a544-09fcc496b19d@sifive.com>
Date: Sat, 17 Feb 2024 18:10:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [RFC PATCH 3/6] target/riscv: Inline vext_ldst_us and
 coressponding function for performance
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20240215192823.729209-1-max.chou@sifive.com>
 <20240215192823.729209-4-max.chou@sifive.com>
 <2701c3a3-d9ab-4058-99f6-d542baf293ec@ventanamicro.com>
From: Max Chou <max.chou@sifive.com>
In-Reply-To: <2701c3a3-d9ab-4058-99f6-d542baf293ec@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=max.chou@sifive.com; helo=mail-ot1-x343.google.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.399,
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

Hi Daniel,

Thank you for the information and suggestion.
Yes, we can do it better if we load/store more bytes at a time.
I'll try to improve the RFC on this way.

Thanks,

Max

On 2024/2/16 5:11 AM, Daniel Henrique Barboza wrote:
>
>
> On 2/15/24 16:28, Max Chou wrote:
>> In the vector unit-stride load/store helper functions. the vext_ldst_us
>> function corresponding most of the execution time. Inline the functions
>> can avoid the function call overhead to imperove the helper function
>> performance.
>>
>> Signed-off-by: Max Chou <max.chou@sifive.com>
>> ---
>
> The inline is a good idea but I think we can do better. I mentioned in 
> a thread
> last year [1] about the time we're spending in single byte 
> loads/stores, even
> for strided instructions.
>
> E.g. in vext_ldst_stride():
>
>
>     for (i = env->vstart; i < env->vl; i++, env->vstart++) {
>         k = 0;
>         while (k < nf) {
>             if (!vm && !vext_elem_mask(v0, i)) {
>                 /* set masked-off elements to 1s */
>                 vext_set_elems_1s(vd, vma, (i + k * max_elems) * esz,
>                                   (i + k * max_elems + 1) * esz);
>                 k++;
>                 continue;
>             }
>             target_ulong addr = base + stride * i + (k << log2_esz);
>             ldst_elem(env, adjust_addr(env, addr), i + k * max_elems, 
> vd, ra);
>             k++;
>         }
>     }
>
> We're doing single byte load/stores in ldst_elem() when, in this case, 
> we could do
> it in a whole block only once. ARM does something similar in SVE.
>
> I update the gitlab bug 
> https://gitlab.com/qemu-project/qemu/-/issues/2137 with this
> additional info too.
>
>
>
> Thanks,
>
> Daniel
>
>
> [1] 
> https://lore.kernel.org/qemu-riscv/0e54c6c1-2903-7942-eff2-2b8c5e21187e@ventanamicro.com/
>
>
>>   target/riscv/vector_helper.c | 30 ++++++++++++++++--------------
>>   1 file changed, 16 insertions(+), 14 deletions(-)
>>
>> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
>> index e8fbb921449..866f77d321d 100644
>> --- a/target/riscv/vector_helper.c
>> +++ b/target/riscv/vector_helper.c
>> @@ -149,25 +149,27 @@ static inline void vext_set_elem_mask(void *v0, 
>> int index,
>>   typedef void vext_ldst_elem_fn(CPURISCVState *env, abi_ptr addr,
>>                                  uint32_t idx, void *vd, uintptr_t 
>> retaddr);
>>   -#define GEN_VEXT_LD_ELEM(NAME, ETYPE, H, LDSUF)            \
>> -static void NAME(CPURISCVState *env, abi_ptr addr,         \
>> -                 uint32_t idx, void *vd, uintptr_t retaddr)\
>> -{                                                          \
>> -    ETYPE *cur = ((ETYPE *)vd + H(idx));                   \
>> -    *cur = cpu_##LDSUF##_data_ra(env, addr, retaddr);      \
>> -}                                                          \
>> +#define GEN_VEXT_LD_ELEM(NAME, ETYPE, H, LDSUF)         \
>> +static inline QEMU_ALWAYS_INLINE                        \
>> +void NAME(CPURISCVState *env, abi_ptr addr,             \
>> +          uint32_t idx, void *vd, uintptr_t retaddr)    \
>> +{                                                       \
>> +    ETYPE *cur = ((ETYPE *)vd + H(idx));                \
>> +    *cur = cpu_##LDSUF##_data_ra(env, addr, retaddr);   \
>> +}                                                       \
>>     GEN_VEXT_LD_ELEM(lde_b, int8_t,  H1, ldsb)
>>   GEN_VEXT_LD_ELEM(lde_h, int16_t, H2, ldsw)
>>   GEN_VEXT_LD_ELEM(lde_w, int32_t, H4, ldl)
>>   GEN_VEXT_LD_ELEM(lde_d, int64_t, H8, ldq)
>>   -#define GEN_VEXT_ST_ELEM(NAME, ETYPE, H, STSUF)            \
>> -static void NAME(CPURISCVState *env, abi_ptr addr,         \
>> -                 uint32_t idx, void *vd, uintptr_t retaddr)\
>> -{                                                          \
>> -    ETYPE data = *((ETYPE *)vd + H(idx));                  \
>> -    cpu_##STSUF##_data_ra(env, addr, data, retaddr);       \
>> +#define GEN_VEXT_ST_ELEM(NAME, ETYPE, H, STSUF)         \
>> +static inline QEMU_ALWAYS_INLINE                        \
>> +void NAME(CPURISCVState *env, abi_ptr addr,             \
>> +          uint32_t idx, void *vd, uintptr_t retaddr)    \
>> +{                                                       \
>> +    ETYPE data = *((ETYPE *)vd + H(idx));               \
>> +    cpu_##STSUF##_data_ra(env, addr, data, retaddr);    \
>>   }
>>     GEN_VEXT_ST_ELEM(ste_b, int8_t,  H1, stb)
>> @@ -289,7 +291,7 @@ GEN_VEXT_ST_STRIDE(vsse64_v, int64_t, ste_d)
>>    */
>>     /* unmasked unit-stride load and store operation */
>> -static void
>> +static inline QEMU_ALWAYS_INLINE void
>>   vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, 
>> uint32_t desc,
>>                vext_ldst_elem_fn *ldst_elem, uint32_t log2_esz, 
>> uint32_t evl,
>>                uintptr_t ra)

