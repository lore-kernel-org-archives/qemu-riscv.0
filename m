Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB0ECC54E66
	for <qemu-riscv@archiver.kernel.org>; Wed, 13 Mar 2024 22:37:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rkXDe-0000Er-IY; Wed, 13 Mar 2024 18:37:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rkXDY-0000EO-M0
 for qemu-riscv@nongnu.org; Wed, 13 Mar 2024 18:37:00 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rkXDU-0001iX-7h
 for qemu-riscv@nongnu.org; Wed, 13 Mar 2024 18:36:57 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-29c09ee1bceso312629a91.2
 for <qemu-riscv@nongnu.org>; Wed, 13 Mar 2024 15:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710369413; x=1710974213; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dO8ccKxzJHaIy2yAQd4/WywGxkHMEzfzmRlq3plwDsc=;
 b=lMNW+pmjffTbVkuSmTRe+Snx1Up/zH4VqhC0Kuw1QzXg2WUgR1ODHUpgo1qTEkwvUR
 onZU527nTeIVnd1nfPRtPCouOEX5uoW9MmRH7rLHW+4b1lP517cI/A2yzPAHUhhrGHLj
 YmfpyQR/64hQdWjvZqPQNQC5uTa43cDOR9OF2qrXem4pCBgDe+7HTNIqa+C6fqVZisAV
 deefbGJUsWj+HT7HLXst3xW7MWSdcn1yoOcyvRc5EgzLkJkYz8btY9hKRmgUHGrFwCGL
 tmSFo56ccXSjuVlf+nMN6X36ecD0aS1XGUFxv8Gqh+l/wNvOfvwdFfOJo8W4NR9FNzDa
 bCjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710369413; x=1710974213;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dO8ccKxzJHaIy2yAQd4/WywGxkHMEzfzmRlq3plwDsc=;
 b=K+zj4JGRThRe66AarW5Hf28SCC0H9SxJAI8JK0fxSja/FdmhSfTUgHNCw5+WsKtf10
 xnTV37PD05CD4GFye9r1xqR24yOsGRr+80b6ywEHYdlbvIKvMo+wwdSyUfTlHWw7GYsa
 OT98rdfZL/ve5bgxdswcFT2dl9ysVZSFiwerfNirmCKVdXfrMTmbGTRLOnxhSjs9FSr7
 VCaI4utPA/wIRXyKVaVM5Tu0ZCiBtbbox9QZzx2o8gu92arT6JlSsHd20i2MAD9X8daS
 4AS6sbGcA0jAWLLPVtltO3y1/rA0zumZ6l3lmRdWwp/Q7s9vPYgvEdgmo+QVlrrS69kW
 2mZA==
X-Gm-Message-State: AOJu0Yyt4q9oRkgsPRHIEee2Dq8mdLpjAw/9WYdlYinxnXPhD6JFb5p/
 e5J7lklqDaV9+PGk4eZ6PuBYa4PeMmfDb7xt1IuFyl8d3M3LxOooRTVy2kG0kkvSVw/x1F7x/k7
 i
X-Google-Smtp-Source: AGHT+IG4q+MeJaGvzmiPHTXBUndwCa0XpXlI2mcAbVWmc5W+fXxYAqTLcwpxUsjZk/LbD+W7RyqZpA==
X-Received: by 2002:a17:90a:7446:b0:29c:1262:ec7a with SMTP id
 o6-20020a17090a744600b0029c1262ec7amr62009pjk.21.1710369413257; 
 Wed, 13 Mar 2024 15:36:53 -0700 (PDT)
Received: from [192.168.0.227] (173-197-098-125.biz.spectrum.com.
 [173.197.98.125]) by smtp.gmail.com with ESMTPSA id
 e16-20020a17090ab39000b0029ba1b5a692sm1843228pjr.12.2024.03.13.15.36.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Mar 2024 15:36:52 -0700 (PDT)
Message-ID: <5f882160-fdec-4f28-af23-3bda8bcb186b@linaro.org>
Date: Wed, 13 Mar 2024 12:36:41 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-9.0 v14 3/8] target/riscv: always clear vstart in
 whole vec move insns
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 philmd@linaro.org
References: <20240313220141.427730-1-dbarboza@ventanamicro.com>
 <20240313220141.427730-4-dbarboza@ventanamicro.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240313220141.427730-4-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On 3/13/24 12:01, Daniel Henrique Barboza wrote:
> These insns have 2 paths: we'll either have vstart already cleared if
> vstart_eq_zero or we'll do a brcond to check if vstart >= maxsz to call
> the 'vmvr_v' helper. The helper will clear vstart if it executes until
> the end, or if vstart >= vl.
> 
> However, if vstart >= maxsz, the helper will be skipped, and vstart
> won't be cleared since the helper is being responsible from doing it.
> 
> We want to make the helpers responsible to manage vstart, including
> these corner cases, precisely to avoid these situations. Move the vstart
>> = maxsz cond to the helper, and be sure to clear vstart if that
> happens. This way we're now sure that vstart is being cleared in the end
> of the execution, regardless of the path taken.
> 
> Fixes: f714361ed7 ("target/riscv: rvv-1.0: implement vstart CSR")
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   target/riscv/insn_trans/trans_rvv.c.inc | 3 ---
>   target/riscv/vector_helper.c            | 5 +++++
>   2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 8c16a9f5b3..52c26a7834 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -3664,12 +3664,9 @@ static bool trans_##NAME(DisasContext *s, arg_##NAME * a)               \
>                                vreg_ofs(s, a->rs2), maxsz, maxsz);        \
>               mark_vs_dirty(s);                                           \
>           } else {                                                        \
> -            TCGLabel *over = gen_new_label();                           \
> -            tcg_gen_brcondi_tl(TCG_COND_GEU, cpu_vstart, maxsz, over);  \
>               tcg_gen_gvec_2_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, a->rs2), \
>                                  tcg_env, maxsz, maxsz, 0, gen_helper_vmvr_v); \
>               mark_vs_dirty(s);                                           \
> -            gen_set_label(over);                                        \
>           }                                                               \
>           return true;                                                    \
>       }                                                                   \
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index ca79571ae2..cd8235ea98 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -5075,6 +5075,11 @@ void HELPER(vmvr_v)(void *vd, void *vs2, CPURISCVState *env, uint32_t desc)
>       uint32_t startb = env->vstart * sewb;
>       uint32_t i = startb;
>   
> +    if (env->vstart >= maxsz) {
> +        env->vstart = 0;
> +        return;
> +    }

I think you were right to be concerned about vlmax -- you need to use startb not vstart in 
this comparison, otherwise you've got mixed units on the comparison.

>       memcpy((uint8_t *)vd + H1(i),
>              (uint8_t *)vs2 + H1(i),
>              maxsz - startb);

Unrelated to this patch series, this has a big-endian host error.
With big-endian, the bytes to be copied may not be sequential.

     if (HOST_BIG_ENDIAN && i % 8 != 0) {
         uint32_t j = ROUND_UP(i, 8);
         memcpy(vd + H(j - 1), vs2 + H1(j - 1), j - i);
         i = j;
     }
     memcpy(vd + i, vs2 + i, maxsz - i);


r~

