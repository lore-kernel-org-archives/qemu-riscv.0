Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51082D1267F
	for <qemu-riscv@archiver.kernel.org>; Tue,  5 Nov 2024 10:51:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1t8H96-0000i7-FM; Tue, 05 Nov 2024 05:50:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1t8H92-0000hR-UU
 for qemu-riscv@nongnu.org; Tue, 05 Nov 2024 05:50:45 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1t8H91-00045i-31
 for qemu-riscv@nongnu.org; Tue, 05 Nov 2024 05:50:44 -0500
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-37d4b0943c7so3351005f8f.1
 for <qemu-riscv@nongnu.org>; Tue, 05 Nov 2024 02:50:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730803841; x=1731408641; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6riB8icHr31bYt7Ypso97Po0mJrHmUtnF5OMisGLVTs=;
 b=YfGZZg+zL7CeN1SWt+SOlu9h65Yc38cpc7ETnPcBBg0tYJyciMk/AM+aUOfF8NNz59
 WA9CiLYZmVtaY9q+VuZBogGVnEao5Kl0QX0l9YS3XtY83AlMwRwnTsg771P6VUbecJzH
 zvRwd6Nc89G0VcSAzX6FXT2meG6xUe0EGV2XEamOyTlDaK5mlrW+L8fdHm8TMdy6rjv+
 66laqc6gQl0/zIDFWSwDYDoFl5i9OjpGSLhS4LyEWJSPrpMPvU3GC5Gxiy0NCT5Obg+K
 0LXxXrfMHjUrRtxXOCop1mTNMPoLb3R6zGhWsCikZAYq9Z4prI/X6KAtZp/+ucHTQqlE
 flRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730803841; x=1731408641;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6riB8icHr31bYt7Ypso97Po0mJrHmUtnF5OMisGLVTs=;
 b=aSPa8w+/BFaQuxjmb1VQPLiEmDM8Xh4KHUAMb6ottIgGkwAQUvIAFhKRo2VVANqhA+
 pGqvPT7xlZWSbqQ5GKY2iGfYbW47Fj9mn6mbEgR50bhTYzGfNXyVrdPIp8bsbgH9YoqY
 mdk7C1r/xKDQahmUYS0jY8SE/cyhT0ugD30KcLXDVDKE1uDB0rZK0+muQsxeSMsqQNx3
 I1r0pvNXkP+YrPUbKs1O6rirMaLzdHp88urlXcfXiidR7NoqgnwYF/edY+lQaq+Rkfpk
 hGTyRm2RWzSBA40qzfTBoP3310jAxY8/qN/5yXsphy7QChAbpBcXWMT/HmhoF52gYH+K
 yS6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCURkwaWP9s8V4RZIGESzhW7WJf7YGaiKV6jbfd3jOidn7lr6411iU212+ypLNVjXulx5bVFmH92ksfy@nongnu.org
X-Gm-Message-State: AOJu0YwXp5cV00JgjEnLTF8BiBPRfb+dkJ0rVYy0ZWnco+vBaFd0ovby
 qSR/9+Tso5CCDrygMtMQJnM7Y8IsLFMqbASWbIgG8BHEFe9u0lSS+JRT44DA168=
X-Google-Smtp-Source: AGHT+IFJbOlO+3+PpO34nBv4DriG0NXeylMyeIE6CqGeeeBZMuMkDbz7fAO2Lnx2GYpQS7KVgbwf1g==
X-Received: by 2002:a5d:6601:0:b0:37d:4db3:af36 with SMTP id
 ffacd0b85a97d-380610f2cd4mr24054517f8f.12.1730803841367; 
 Tue, 05 Nov 2024 02:50:41 -0800 (PST)
Received: from [192.168.21.227] ([154.14.63.34])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c10b7c38sm15785659f8f.24.2024.11.05.02.50.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Nov 2024 02:50:40 -0800 (PST)
Message-ID: <26a36129-67b7-49f7-a14c-28db0234aab5@linaro.org>
Date: Tue, 5 Nov 2024 10:50:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] target/riscv: Add support to record CTR entries.
To: Rajnesh Kanwal <rkanwal@rivosinc.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 atishp@rivosinc.com, apatel@ventanamicro.com, beeman@rivosinc.com,
 tech-control-transfer-records@lists.riscv.org, jason.chien@sifive.com,
 frank.chang@sifive.com
References: <20241104-b4-ctr_upstream_v3-v3-0-32fd3c48205f@rivosinc.com>
 <20241104-b4-ctr_upstream_v3-v3-4-32fd3c48205f@rivosinc.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241104-b4-ctr_upstream_v3-v3-4-32fd3c48205f@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x434.google.com
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

On 11/4/24 21:51, Rajnesh Kanwal wrote:
> +/*
> + * Indirect calls
> + * - jalr x1, rs where rs != x5;
> + * - jalr x5, rs where rs != x1;
> + * - c.jalr rs1 where rs1 != x5;
> + *
> + * Indirect jumps
> + * - jalr x0, rs where rs != x1 and rs != x5;
> + * - c.jr rs1 where rs1 != x1 and rs1 != x5.
> + *
> + * Returns
> + * - jalr rd, rs where (rs == x1 or rs == x5) and rd != x1 and rd != x5;
> + * - c.jr rs1 where rs1 == x1 or rs1 == x5.
> + *
> + * Co-routine swap
> + * - jalr x1, x5;
> + * - jalr x5, x1;
> + * - c.jalr x5.
> + *
> + * Other indirect jumps
> + * - jalr rd, rs where rs != x1, rs != x5, rd != x0, rd != x1 and rd != x5.
> + */
> +void helper_ctr_jalr(CPURISCVState *env, target_ulong src, target_ulong dest,
> +                     target_ulong rd, target_ulong rs1)
> +{
> +    target_ulong curr_priv = env->priv;
> +    bool curr_virt = env->virt_enabled;
> +
> +    if ((rd == 1 && rs1 != 5) || (rd == 5 && rs1 != 1)) {
> +        riscv_ctr_add_entry(env, src, dest, CTRDATA_TYPE_INDIRECT_CALL,
> +                            curr_priv, curr_virt);
> +    } else if (rd == 0 && rs1 != 1 && rs1 != 5) {
> +        riscv_ctr_add_entry(env, src, dest, CTRDATA_TYPE_INDIRECT_JUMP,
> +                            curr_priv, curr_virt);
> +    } else if ((rs1 == 1 || rs1 == 5) && (rd != 1 && rd != 5)) {
> +        riscv_ctr_add_entry(env, src, dest, CTRDATA_TYPE_RETURN,
> +                            curr_priv, curr_virt);
> +    } else if ((rs1 == 1 && rd == 5) || (rs1 == 5 && rd == 1)) {
> +        riscv_ctr_add_entry(env, src, dest, CTRDATA_TYPE_CO_ROUTINE_SWAP,
> +                            curr_priv, curr_virt);
> +    } else {
> +        riscv_ctr_add_entry(env, src, dest,
> +                            CTRDATA_TYPE_OTHER_INDIRECT_JUMP, curr_priv,
> +                            curr_virt);
> +    }
> +}

All of these if's are constant at translation time.
You should move this decision tree...

> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -569,6 +569,16 @@ static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
>          }
>      }
>  
> +#ifndef CONFIG_USER_ONLY
> +    if (ctx->cfg_ptr->ext_smctr || ctx->cfg_ptr->ext_ssctr) {
> +        TCGv dest = tcg_constant_tl(ctx->base.pc_next + imm);
> +        TCGv src = tcg_constant_tl(ctx->base.pc_next);
> +        TCGv tcg_rd = tcg_constant_tl((target_ulong)rd);
> +
> +        gen_helper_ctr_jal(tcg_env, src, dest, tcg_rd);
> +    }
> +#endif

... here.  All you need is to expose helper_ctr_add_entry().

With that,

> +void helper_ctr_popret(CPURISCVState *env, target_ulong src, target_ulong dest)
> +{
> +    riscv_ctr_add_entry(env, src, dest, CTRDATA_TYPE_RETURN,
> +                            env->priv, env->virt_enabled);
> +}
> +
> +void helper_ctr_branch(CPURISCVState *env, target_ulong src, target_ulong dest,
> +                       target_ulong branch_taken)
> +{
> +    target_ulong curr_priv = env->priv;
> +    bool curr_virt = env->virt_enabled;
> +
> +    if (branch_taken) {
> +        riscv_ctr_add_entry(env, src, dest, CTRDATA_TYPE_TAKEN_BRANCH,
> +                            curr_priv, curr_virt);
> +    } else {
> +        riscv_ctr_add_entry(env, src, dest, CTRDATA_TYPE_NONTAKEN_BRANCH,
> +                            curr_priv, curr_virt);
> +    }
> +}

these can go away, simply passing the correct CTRDATA_* constant at the right place.


r~


