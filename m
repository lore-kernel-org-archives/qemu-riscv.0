Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95434C88E5C
	for <qemu-riscv@archiver.kernel.org>; Mon, 14 Sep 2026 00:59:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x5v2M-0004YD-1v; Sun, 13 Sep 2026 20:59:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x5v2K-0004UB-Au
 for qemu-riscv@nongnu.org; Sun, 13 Sep 2026 20:59:08 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x5v2I-0005Hc-DV
 for qemu-riscv@nongnu.org; Sun, 13 Sep 2026 20:59:08 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-2d942c7cc2fso25787225ad.3
 for <qemu-riscv@nongnu.org>; Sun, 13 Sep 2026 17:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789347544; x=1789952344; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=01V8qAHbRrbLD73qF6rxk6ZT+LflPQU2rePEqzW9TEk=;
 b=ni57L6aR/II5ijLMsPjPEdWxbz/Chu8a/D/Xub8iKLeKhmc60smQCCMEwVknKBKWkM
 bDHPu7NdP4GzO2hg4pGHJWjoKkF6nh+zxxaeqP3qO8NU5GKNxYOOQTTHOWcDJfmWUT7o
 BuMF/RfMr3qMD3wUFttedLH4qdCc8KP3c5Ss1xSVF9Bbsd607DzWLc7X8wQY+nvvZcXV
 wZwI6cyozs0frbvuOtGXeGZo+GA+72A2gx6dLMMyworvMEmAzSKHo7XEHYzZTYKv2ibs
 GFwcqIUcdithZpYzaKztW64ewXzeOIOhxyF4jbMe2UXiOxUndJF2Zgnro/UPn8kgAB1r
 UUGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789347544; x=1789952344;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=01V8qAHbRrbLD73qF6rxk6ZT+LflPQU2rePEqzW9TEk=;
 b=d/VtE+T7eyABke7dVLkI3Osrxyt+vGch3r+ukAHpduj4wHBHJ5SAF9dSh8qAgHQB+s
 xXXTJ32m4FNLvQm1mbBAcV1xoTOaoKOYkSOi8cIYSXZVHgwUlf4ZG81Qi/2+XtoepNTZ
 Nx4Ga+JaYJv/C7kbq8T4GHt455ZG0yDpNrTnJMB1g2VoBDVkuhIbxvr8I9PjFxbEqAqz
 PNyVZNq4b5kPqZXqlVDFp4X5AicGvbyLqUOLDFay5cIaBU5kAY5uyOa2dH6kzNh4G3Ol
 h/tc38TzdVRW2kOsCF+GYmaMTkEhsfxCNNcr4ZaquIlWYfiIutz8Fo2owQ6lx4/py/vE
 EKow==
X-Forwarded-Encrypted: i=1;
 AKwUvBzvfFLQO7R5rDg5fbuygWugU4P9v2c6wy3+EEP9eCGHo4O55EdgUnvl/cmr/eInCJ2+e+s9ngfdZEZx@nongnu.org
X-Gm-Message-State: AFuF++mbD2lnW4roWxil6/MUp3mPJ9ESu03HqZ1/3kOTk/BqJB25ophc
 k+1UmH7ZUdnlLlaSN1iz9pcxYxhaa6YEYeAs+lEUE+4+Goc3x6bXiJ/fWS1WoZMqOyQ=
X-Gm-Gg: AYBFou2C03DYOqo4i3/sM9gfTsGF57SYXn0elRw9P3O3RRwE43b3my1k5kx4U0rnnGk
 j3hocYfbGND1jG0vfqza1GYU+N1aVGOqXBvToKsNL1JAYZ3njtnO42kQmh4VMt5ZFWa2cdqMjwn
 TF58olzddpWL8iKPRPcEpJiO9A0tZr9cdMSfDphpby4w0SSDG2I51GEy4jGXK46YDEz/SaDd6S7
 29rZCKEOcT8FjVC1xTsN4vMNDvrqMIRACblKPigc1fb1s96taKZBWamAGr1UHwckpOH/ysX1DhJ
 7ZGIQ4KpjpUp7rtuzQBNX5qc5cHjV+RP1S6LC3Vga2dYm0jmLiWYvNPitKZieGH0tU5wh9HKGz/
 fDtSJtHe47l3IjIcsbQrxSj2w5wDfIu+2dxZwVCWQS4tFS1gZyWE0h/R7P9wXEY4Q+5xzJHCwhT
 ZsxEJr2tXIRHjK/zCIkS0OetqEhOKzwfFkZpDy9Ekkib6DhzT6E0Drm+blUSUSMjbPn4A08Zi7u
 eKHMVCZt0UmgnNGLqAA4irqhZbWpjA4fQFNBZjZvzXpEr3QvR/kKSQG/4VihA==
X-Received: by 2002:a17:902:d591:b0:2d7:5ebe:a588 with SMTP id
 d9443c01a7336-2dd6c6da391mr7219595ad.13.1789347544495; 
 Sun, 13 Sep 2026 17:59:04 -0700 (PDT)
Received: from ?IPV6:2603:800c:7900:ed00:1665:91c0:9a80:f870?
 ([2603:800c:7900:ed00:1665:91c0:9a80:f870])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-33ba4cf015csm24984449eec.4.2026.09.13.17.59.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Sep 2026 17:59:03 -0700 (PDT)
Message-ID: <1781cb62-97c0-4ff8-bd76-02e149030359@linaro.org>
Date: Sun, 13 Sep 2026 14:59:00 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] target/riscv: extract check_sfence_vma() from
 helper_tlb_flush()
To: Trevor Gamblin <tgamblin@baylibre.com>, qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, qemu-riscv@nongnu.org
References: <20260904-riscv_tlb_page_flush-v2-0-defec3f29312@baylibre.com>
 <20260904-riscv_tlb_page_flush-v2-1-defec3f29312@baylibre.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260904-riscv_tlb_page_flush-v2-1-defec3f29312@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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

On 9/4/26 08:43, Trevor Gamblin wrote:
> Create a new function to encapsulate the privilege/hypervisor checks
> performed inside helper_tlb_flush(). The idea is to pass GETPC() as an
> argument directly to it inside the helper_tlb_flush() function. We'll
> use this function in the following patch for helper_tlb_flush_page().
> 
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
>   target/riscv/tcg/op_helper.c | 16 ++++++++++------
>   1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/target/riscv/tcg/op_helper.c b/target/riscv/tcg/op_helper.c
> index 3e94005d2b..7f63f3ada5 100644
> --- a/target/riscv/tcg/op_helper.c
> +++ b/target/riscv/tcg/op_helper.c
> @@ -588,21 +588,25 @@ void helper_wrs_nto(CPURISCVState *env)
>       }
>   }
>   
> -void helper_tlb_flush(CPURISCVState *env)
> +static void check_sfence_vma(CPURISCVState *env, uintptr_t ra)
>   {
> -    CPUState *cs = env_cpu(env);
>       if (!env->virt_enabled &&
>           (env->priv == PRV_U ||
>            (env->priv == PRV_S && get_field(env->mstatus, MSTATUS_TVM)))) {
> -        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
> +        riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, ra);
>       } else if (env->virt_enabled &&
>                  (env->priv == PRV_U || get_field(env->hstatus, HSTATUS_VTVM))) {
> -        riscv_raise_exception(env, RISCV_EXCP_VIRT_INSTRUCTION_FAULT, GETPC());
> -    } else {
> -        tlb_flush(cs);
> +        riscv_raise_exception(env, RISCV_EXCP_VIRT_INSTRUCTION_FAULT, ra);
>       }
>   }

The priv and virt_enabled tests can be done in the translator.
Honestly, I'm surprised that PRV_U isn't already tested there.

PRV_M, could avoid the test.
PRV_S could perform the TVM test at runtime.

     ctx->virt_inst_excp = ctx->virt_enabled;
     if (ctx->priv == PRV_U) {
         gen_exception_illegal(ctx);
     } else if (ctx->priv == PRV_S) {
         TCGv_i64 t = tcg_temp_new_i64();
         TCGLabel *l = gen_new_label();
         uint64_t mask;
         ptrdiff_t ofs;

         if (ctx->virt_enabled) {
             ofs = offsetof(CPUArchState, hstatus);
             mask = HSTATUS_VTVM;
         } else {
             ofs = offsetof(CPUArchState, mstatus);
             mask = MSTATUS_TVM;
         }

         tcg_gen_ld_i64(t, tcg_env, ofs);
         gen_update_pc(ctx, 0);
         tcg_gen_brcondi_i64(TCG_COND_TSTEQ, t, mask, l);

         gen_exception_illegal(ctx);
         gen_set_label(l);
     }

Although the subtlety of virt_inst_excp vs virt_enabled wrt which 
exception is raised confuses me.

It appears this criticism is true for all privileged instructions, so 
perhaps this should be done as part of a more global cleanup.


r~

