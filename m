Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28FD9C48260
	for <qemu-riscv@archiver.kernel.org>; Fri, 16 Feb 2024 18:57:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rb3OK-0000uK-3R; Fri, 16 Feb 2024 13:56:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rb3OI-0000u5-SN
 for qemu-riscv@nongnu.org; Fri, 16 Feb 2024 13:56:54 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rb3OF-0005aV-Gn
 for qemu-riscv@nongnu.org; Fri, 16 Feb 2024 13:56:54 -0500
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1d953fa3286so9124395ad.2
 for <qemu-riscv@nongnu.org>; Fri, 16 Feb 2024 10:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708109810; x=1708714610; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RAWapSTMXGK36m8ARbQQlTB/w+UMQ/roARNJOzJtx2U=;
 b=FNHPzNANkXrJQOQikCfRUYo9itQv/4FSJ5QnnbIdX5AoinpP2bB2oRnrVCOum5cQ1i
 O6XnKDIcsPpfjfDNxpn8UJoy9sFLFhYs4c8ic5HdZeuXhLWMFGl0nmrdIiVrpJrXcXjW
 Vo2mxxpEFiF/lUCBh0NxtOtcthVqjuStxYE7dKldf2yTsMKegarMWMjsJ8ael9t9y/bm
 WmQreQMCE7jYxNrOwxd/XXF0+4YUK7DT8xIWvQvMp6yD43CKEgrNzyCyiYplbFC5eXWW
 tOakwmVHlJyq2uSxcjVb/gzwgS+yU9Ei58KltsEFojBCBm5y89OIwEjvReSWZjFjQNtV
 oEyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708109810; x=1708714610;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RAWapSTMXGK36m8ARbQQlTB/w+UMQ/roARNJOzJtx2U=;
 b=ixtxTgI82m4Gcet5shOz7XdUqsoIb5wpw9rB7MXHeuBd3naUrPVMujNZvK17QcikNd
 kJNAYzRxkBKKECqnotMXjghxTZnygkRGGlIHmOKGmEoagCTLajyfbPdRTpDI5UZwiJuw
 dklWDzfjMIM1vvvjw6RCaOlGbHTKfZOoj56ZobenDi0dPrPqQdzilQDcY0GyD9a91uyQ
 BKxgWCGjnITm4m79yvua88wOaoFDmyHw27qklaRPPfBd8CkYLgo08KKqmPgyYRVO5qjU
 evLTMKaQvVhXcglyZ+ZHLmzHi4L0jhAiM2HaZxN4m++fD9nVLs94wwY5wCzzHKNDGvtW
 IeCA==
X-Gm-Message-State: AOJu0Yzha5yc59b+6KhgdlHqJeW5s4S+HL3Rpp5OZF04r9VagMCE2E2G
 B2IIqxqcbby7y6/+sLtQDXHGXtvQGwV0pD5eLgsnNSsdhGREATDIgOjydPanmts=
X-Google-Smtp-Source: AGHT+IE3aS8fc+S/Wyj503gVZWKq7YiSG6x1TYJvewoSjRVXEX9ZpGOxA5B6URnd5KVTPg/ZBBSglw==
X-Received: by 2002:a17:902:d484:b0:1d9:373a:6124 with SMTP id
 c4-20020a170902d48400b001d9373a6124mr6995613plg.22.1708109809681; 
 Fri, 16 Feb 2024 10:56:49 -0800 (PST)
Received: from [172.20.1.19] (173-197-098-125.biz.spectrum.com.
 [173.197.98.125]) by smtp.gmail.com with ESMTPSA id
 kq13-20020a170903284d00b001db5079b705sm195381plb.36.2024.02.16.10.56.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Feb 2024 10:56:49 -0800 (PST)
Message-ID: <16087154-b3d2-4cab-938f-4a04fc8dd166@linaro.org>
Date: Fri, 16 Feb 2024 08:56:44 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] target/riscv/translate.c: set vstart_eq_zero in
 mark_vs_dirty()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 max.chou@sifive.com
References: <20240216135719.1034289-1-dbarboza@ventanamicro.com>
 <20240216135719.1034289-4-dbarboza@ventanamicro.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240216135719.1034289-4-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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

On 2/16/24 03:57, Daniel Henrique Barboza wrote:
> The 'vstart_eq_zero' flag which is used to determine if some insns, like
> vector reductor operations, should SIGILL. At this moment the flag is
> being updated only during cpu_get_tb_cpu_state(), at the start of each
> translation block.
> 
> This cadence isn't enough and we're facing situations where a vector
> instruction successfully updated 'vstart' to zero, but the flag was
> still marked as 'false', resulting in a SIGILL because instructions are
> checking the flag.
> 
> mark_vs_dirty() is called after any instruction changes Vector CSR
> state, making it a good place to update 'vstart_eq_zero'.
> 
> Fixes: 8e1ee1fb57 ("target/riscv: rvv-1.0: add translation-time vector context status")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1976
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   target/riscv/translate.c | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
> 
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 177418b2b9..f9ff7b6173 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -652,6 +652,8 @@ static inline void mark_fs_dirty(DisasContext *ctx) { }
>    */
>   static void mark_vs_dirty(DisasContext *ctx)
>   {
> +    TCGLabel *vstart_zero = gen_new_label();
> +    TCGLabel *done = gen_new_label();
>       TCGv tmp;
>   
>       if (ctx->mstatus_vs != EXT_STATUS_DIRTY) {
> @@ -669,6 +671,24 @@ static void mark_vs_dirty(DisasContext *ctx)
>               tcg_gen_st_tl(tmp, tcg_env, offsetof(CPURISCVState, mstatus_hs));
>           }
>       }
> +
> +    /*
> +     * We can safely make 'vl_eq_vlmax = false' if we marked
> +     * VS as dirty with non-zero 'vstart', i.e. there's a fault
> +     * to be handled. If 'vstart' is zero then we should retain
> +     * the existing 'vl_eq_vlmax' - it'll be recalculated on the
> +     * start of the next TB or during vset{i}vl{i} (that forces a
> +     * TB end).
> +     */
> +    tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vstart, 0, vstart_zero);
> +    ctx->vstart_eq_zero = false;
> +    ctx->vl_eq_vlmax = false;
> +    tcg_gen_br(done);
> +
> +    gen_set_label(vstart_zero);
> +    ctx->vstart_eq_zero = true;
> +
> +    gen_set_label(done);

This is very confused, apparently generating code to test vstart at runtime, and then set 
some translation time variables in the branches.

Afaik, the only way vstart != 0 is an explicit set to the CSR or exiting a load via 
exception.  Therefore you have no need to have any sort of brcond here -- just set
ctx->vstart_eq_zero = true.

Also, you need to move the ifdefs from around mark_vs_dirty, because it is now relevant to 
user-only.

It may be worth a rename, because it does more than mark vs dirty, and therefore is 
different than mark_fs_dirty.

You need to review all instances of

     TCGLabel *over = gen_new_label();
     tcg_gen_brcond_tl(TCG_COND_GEU, cpu_vstart, cpu_vl, over);
...
     gen_set_label(over);
     return true;

because this *should have* set vstart = 0.  With vstart < vl, this is done in the helper 
function, but every place using a conditional branch needs attention.


r~

