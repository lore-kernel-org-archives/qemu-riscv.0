Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4260C54E66
	for <qemu-riscv@archiver.kernel.org>; Wed, 13 Mar 2024 21:17:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rkVyW-0004A1-My; Wed, 13 Mar 2024 17:17:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rkVyV-00049j-G5
 for qemu-riscv@nongnu.org; Wed, 13 Mar 2024 17:17:23 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rkVyT-0004rv-ON
 for qemu-riscv@nongnu.org; Wed, 13 Mar 2024 17:17:23 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-6e6c10bdd2fso363078b3a.3
 for <qemu-riscv@nongnu.org>; Wed, 13 Mar 2024 14:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710364639; x=1710969439; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9LA32x4bAq7N51W51DbJjLo8OzFpBdGXq7iH5r8duwE=;
 b=m92HLioxv31tnR7sUDZt6tmb4iELhoQvnFnBgFs98HgZgmgEW3/og77n+jo5kGa4DI
 YKaCWrc4p3CnMDE2uc/az4P5SSD/3LY+kxCeFdbx4HiUZUhS1182t1bogZTVd36HerZb
 9f/M5aEH6GYqjz4IdZVk879nTQxAl5I+OqUFkO+AmmWlsbGimPBlVdEvjLVr2V0CblG8
 H6hAdmR2aLOPXvyUYKrDlJ7BqoyFqlekTq22aXjLHVBLfE1dY23e7RaW/z2altLuYUvD
 OMsOeN6BuqP6ap+L6xhCh4IuZksU8us0wKwE7v/yQ2yW0w9ORp72ubO2Z1/l5Z+JGzLT
 yqxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710364639; x=1710969439;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9LA32x4bAq7N51W51DbJjLo8OzFpBdGXq7iH5r8duwE=;
 b=DWePMfvi53yXfBLzG+nzshZ7GTvSwjh1BHyfCGVO5PKuO68+nadR6M27i2feNs812F
 cI8+T7vcC46fh0/I76HDwI9M+xEjshmuhgdKPAIQpnUYLXSm7XNHChNpoP+U4qOjOn8L
 uruu6ohWdL9hZUYqecTgi41h7c0GzZP7IGSHmUe8OVCSqLXYt8Hd8fnSaBYAgUceHPE1
 dKX041ttjMHJ57tcpAtr9QJykprdKKJtyI562Ea6rajkjFz9n6UYu0ZEhyqmSzFGErjz
 /S8rpAsTyYthrjCF4RXEc4/C5QwnF7Kkvacp0nXZ89VufU2dprH8grIGp5NoBQK1NDga
 CBqg==
X-Gm-Message-State: AOJu0YxWz64uEa+1iCNFjt1cJAMbV4bW4g8mde6t5CHh5kKgNwr4uTRe
 44TKBs1B3pk+BzOyHoHDe1FzAlrzPVA7ga8aUwqnNLW5wbEToctJK/ddkAurfnttjKS0htqAnYr
 u
X-Google-Smtp-Source: AGHT+IHcn4868ih0sM/IkecDTSdpN142VYOUVh4KSN8vI6DTT8TxaSr0GYQOpMicO7oAAVa66gWGOw==
X-Received: by 2002:a05:6a20:b288:b0:1a1:67fb:924b with SMTP id
 ei8-20020a056a20b28800b001a167fb924bmr117673pzb.28.1710364639378; 
 Wed, 13 Mar 2024 14:17:19 -0700 (PDT)
Received: from [172.20.1.19] (173-197-098-125.biz.spectrum.com.
 [173.197.98.125]) by smtp.gmail.com with ESMTPSA id
 a26-20020aa7865a000000b006e6b5e65579sm54500pfo.106.2024.03.13.14.16.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Mar 2024 14:17:18 -0700 (PDT)
Message-ID: <87936b8f-4900-4a5f-a63d-266c1550c9a1@linaro.org>
Date: Wed, 13 Mar 2024 11:16:37 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-9.0 v13 4/8] target/riscv: always clear vstart in
 whole vec move insns
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 philmd@linaro.org
References: <20240313193059.405329-1-dbarboza@ventanamicro.com>
 <20240313193059.405329-5-dbarboza@ventanamicro.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240313193059.405329-5-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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

On 3/13/24 09:30, Daniel Henrique Barboza wrote:
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
> happens.  This way we're now 100% sure that vstart is being clearer in
> the end of the execution, regardless of the path taken.
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
> index b4360dbd52..7260a5972b 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -5163,6 +5163,11 @@ void HELPER(vmvr_v)(void *vd, void *vs2, CPURISCVState *env, uint32_t desc)
>   
>       VSTART_CHECK_EARLY_EXIT(env);
>   
> +    if (env->vstart >= maxsz) {
> +        env->vstart = 0;
> +        return;
> +    }

Did you need the VSTART_CHECK_EARLY_EXIT here then?
It certainly seems like the vstart >= vl check is redundant...


r~

