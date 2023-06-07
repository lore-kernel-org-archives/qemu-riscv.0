Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E05EC7EE29
	for <qemu-riscv@archiver.kernel.org>; Wed,  7 Jun 2023 13:33:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q6tHk-0006mV-Rs; Wed, 07 Jun 2023 09:33:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q6tHi-0006lm-2w
 for qemu-riscv@nongnu.org; Wed, 07 Jun 2023 09:33:10 -0400
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1q6tHc-0003L1-Mj
 for qemu-riscv@nongnu.org; Wed, 07 Jun 2023 09:33:09 -0400
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-19f454bd2c8so8143109fac.3
 for <qemu-riscv@nongnu.org>; Wed, 07 Jun 2023 06:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1686144782; x=1688736782;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fsKPdzX1DJqk5vQ7b+c3MWiFCu10Kts7rO4tKGv1WnE=;
 b=RIFtH7+f/hVawEAjhboT/tjtqk4FlUbYS1xmoT+V/y035CRlGm4dNq9v8G+uCgmaiV
 Bw8bf+i+w2hlZ+e68HoomtSNJofoUl3vUHbSmbLvxm3dZlEKiowf69xPEljoGllMgU2u
 lI/a8ZdHWyPu+1V5Ugn0q9Fbd2h+Au//IqCug1CzHO2IPG+u2xaPQ5VFcwJItc5v1yhh
 9JJXbdBQmuFLFHH71d2UuV4qfHomKiuLz+60uiIzDYXKKO4PVGptEVc4iJg/gTdp0ls6
 GOqhtAx7+1x+V7xvwT+X+HS7qdYhRfpH9ga7nFAWoqxOexXWlHD//psTEM+6huq7P3Ko
 3EAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686144782; x=1688736782;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fsKPdzX1DJqk5vQ7b+c3MWiFCu10Kts7rO4tKGv1WnE=;
 b=M6TRB481seuLcYTVimgdvCnG5oUp/PmeG4OOV+gZvTG9jN93+/yZmlSRgcqs2azp+S
 iOzXhgXM+Q3QpZhTMNWzOq5tdTLuG3xmG9pcsavVPozuNhBkIQrEJsWBKVDSnFR4aGyy
 6VETELUzUmF/rjlvJlMKXUt5NxEE2HTk324FK1CjooL7qUH0Mv1y4hOA9sz4PuN6MH3Q
 6rau9jcXi7WeblWnir6BTsXqXL551mMQpw9YQs3krbu5P1McO6F+h/nMn6yYiJ4dZ+AI
 QwJruWj6bfOyKbNHa2F8K+8QYNkyr51yCrMh+qzN8cZfE/yvhefcj4sNLP+X1e7UFkYl
 b2Jg==
X-Gm-Message-State: AC+VfDw2RStOF7IA3HTMoDN75RZ8YpTgfD6lMcFjHoXdSIQLkH+EzFSU
 bJg/qjrLanbbLQOyi3VccfPm0A==
X-Google-Smtp-Source: ACHHUZ703xUFAl1ZA5V7gu2qYfMsh8UAVVsnuJwoEnoyiX34vOOVYsSIz9iasmXCD20NIUcvgmObIA==
X-Received: by 2002:a05:6871:22ca:b0:19f:62ac:117f with SMTP id
 se10-20020a05687122ca00b0019f62ac117fmr8538626oab.52.1686144782436; 
 Wed, 07 Jun 2023 06:33:02 -0700 (PDT)
Received: from [192.168.68.107] ([177.170.117.52])
 by smtp.gmail.com with ESMTPSA id
 s17-20020a4aa551000000b00529cc3986c8sm5178182oom.40.2023.06.07.06.32.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jun 2023 06:33:02 -0700 (PDT)
Message-ID: <7cea6808-5c2b-74e9-51cc-95d999606472@ventanamicro.com>
Date: Wed, 7 Jun 2023 10:32:57 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2] target/riscv/vector_helper.c: Remove the check for
 extra tail elements
Content-Language: en-US
To: Xiao Wang <xiao.w.wang@intel.com>, qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
References: <20230607091646.4049428-1-xiao.w.wang@intel.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230607091646.4049428-1-xiao.w.wang@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x32.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.091,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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



On 6/7/23 06:16, Xiao Wang wrote:
> Commit 752614cab8e6 ("target/riscv: rvv: Add tail agnostic for vector
> load / store instructions") added an extra check for LMUL fragmentation,
> intended for setting the "rest tail elements" in the last register for a
> segment load insn.
> 
> Actually, the max_elements derived in vext_ld*() won't be a fraction of
> vector register size, since the lmul encoded in desc is emul, which has
> already been adjusted to 1 for LMUL fragmentation case by vext_get_emul()
> in trans_rvv.c.inc, for ld_stride(), ld_us(), ld_index() and ldff().
> 
> Besides, vext_get_emul() has also taken EEW/SEW into consideration, so no
> need to call vext_get_total_elems() which would base on the emul to derive
> another emul, the second emul would be incorrect when esz differs from sew.
> 
> Thus this patch removes the check for extra tail elements.
> 
> Fixes: 752614cab8e6 ("target/riscv: rvv: Add tail agnostic for vector load / store instructions")
> 
> Signed-off-by: Xiao Wang <xiao.w.wang@intel.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>


> v2:
> * Rebased on top of Alistair's riscv-to-apply.next branch.
> ---
>   target/riscv/vector_helper.c | 22 ++++++----------------
>   1 file changed, 6 insertions(+), 16 deletions(-)
> 
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 7505f9470a..f261e726c2 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -264,11 +264,10 @@ GEN_VEXT_ST_ELEM(ste_h, int16_t, H2, stw)
>   GEN_VEXT_ST_ELEM(ste_w, int32_t, H4, stl)
>   GEN_VEXT_ST_ELEM(ste_d, int64_t, H8, stq)
>   
> -static void vext_set_tail_elems_1s(CPURISCVState *env, target_ulong vl,
> -                                   void *vd, uint32_t desc, uint32_t nf,
> +static void vext_set_tail_elems_1s(target_ulong vl, void *vd,
> +                                   uint32_t desc, uint32_t nf,
>                                      uint32_t esz, uint32_t max_elems)
>   {
> -    uint32_t total_elems, vlenb, registers_used;
>       uint32_t vta = vext_vta(desc);
>       int k;
>   
> @@ -276,19 +275,10 @@ static void vext_set_tail_elems_1s(CPURISCVState *env, target_ulong vl,
>           return;
>       }
>   
> -    total_elems = vext_get_total_elems(env, desc, esz);
> -    vlenb = riscv_cpu_cfg(env)->vlen >> 3;
> -
>       for (k = 0; k < nf; ++k) {
>           vext_set_elems_1s(vd, vta, (k * max_elems + vl) * esz,
>                             (k * max_elems + max_elems) * esz);
>       }
> -
> -    if (nf * max_elems % total_elems != 0) {
> -        registers_used = ((nf * max_elems) * esz + (vlenb - 1)) / vlenb;
> -        vext_set_elems_1s(vd, vta, (nf * max_elems) * esz,
> -                          registers_used * vlenb);
> -    }
>   }
>   
>   /*
> @@ -324,7 +314,7 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,
>       }
>       env->vstart = 0;
>   
> -    vext_set_tail_elems_1s(env, env->vl, vd, desc, nf, esz, max_elems);
> +    vext_set_tail_elems_1s(env->vl, vd, desc, nf, esz, max_elems);
>   }
>   
>   #define GEN_VEXT_LD_STRIDE(NAME, ETYPE, LOAD_FN)                        \
> @@ -383,7 +373,7 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
>       }
>       env->vstart = 0;
>   
> -    vext_set_tail_elems_1s(env, evl, vd, desc, nf, esz, max_elems);
> +    vext_set_tail_elems_1s(evl, vd, desc, nf, esz, max_elems);
>   }
>   
>   /*
> @@ -504,7 +494,7 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
>       }
>       env->vstart = 0;
>   
> -    vext_set_tail_elems_1s(env, env->vl, vd, desc, nf, esz, max_elems);
> +    vext_set_tail_elems_1s(env->vl, vd, desc, nf, esz, max_elems);
>   }
>   
>   #define GEN_VEXT_LD_INDEX(NAME, ETYPE, INDEX_FN, LOAD_FN)                  \
> @@ -634,7 +624,7 @@ ProbeSuccess:
>       }
>       env->vstart = 0;
>   
> -    vext_set_tail_elems_1s(env, env->vl, vd, desc, nf, esz, max_elems);
> +    vext_set_tail_elems_1s(env->vl, vd, desc, nf, esz, max_elems);
>   }
>   
>   #define GEN_VEXT_LDFF(NAME, ETYPE, LOAD_FN)               \

