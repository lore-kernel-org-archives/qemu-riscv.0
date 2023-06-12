Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B269AC7EE25
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 11:59:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q8gC8-0000ph-At; Mon, 12 Jun 2023 07:58:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baxiantai@gmail.com>)
 id 1q8gC6-0000p9-17; Mon, 12 Jun 2023 07:58:46 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baxiantai@gmail.com>)
 id 1q8gC4-0002kr-5o; Mon, 12 Jun 2023 07:58:45 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1b3be39e666so8915065ad.0; 
 Mon, 12 Jun 2023 04:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686571122; x=1689163122;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Wcf7mc+shhfQcwKF7sHQ9cz4ZrU639Uy1ZfRCWgw9Xk=;
 b=r7ZNc8qw5YyyfUjk/Qi3qZZBt2gtPT/ftL0pvLJPc27+svmz7tzCw9YRhGFWFQvsCJ
 gH0RyWOppdIHyQqDowirLiGibDrSVfn3WzDDuDQAxOoPO811TYBeYpeVOm83W4frkV2p
 r78hrS3Ex++LP21XW1azuBBqHB+ZzG09UguLrzpaoB48mnwCUuwOFMS+HrG5oa4Y6MBT
 37HzNZWv01mghRSA5h8XVvKJnXYR2Mn3C3E22wUHlgtp/W55qzWZ4b4BGO5+jOzRRuJ7
 PJDPrbWLuAbHvRrZlsZt4R9fWFqQMW1ZTLg6mYYgflPQZWQod5DkLbt3p0OtSXqj7AMt
 DVQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686571122; x=1689163122;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Wcf7mc+shhfQcwKF7sHQ9cz4ZrU639Uy1ZfRCWgw9Xk=;
 b=ITR8TlaNRPQvPlIpAEGOatBudHhkkhV1dwX+1y72ZrALs9BJgF2LIOhj8t+ZQ4W11J
 395alAvC4vKCbYad+jDq9KKo+Tnl8zBzIEkuCAF/Vdh++oow+a8nKegooVKoNLmkDIkl
 oOryK1SZ5vgNdY0phvgqefjLRfzcOPvhLkzTomNQ1cZUs3ZaiGamaErhxHdJ99CWw/1R
 +rTNauG/9P95NOH3Tp6Vhwo5EKJqENy+iSL5muXr1+g8n4F4uthWZ1r3YSrJD0bA5JrT
 e6oOfhDtA19pb3v5O9dmeGncNwkcHkbmEltkaoC/D+FfzhE3y37O2d24Lzs8Y4cAIaNt
 hs/w==
X-Gm-Message-State: AC+VfDxzAJ+cdGKYyctFtUJ3lDQb1N/zh72JIToh1tavUMgSKmgeeUiQ
 cJ6Ol+OQpxGgtjkxYqO1uZ0=
X-Google-Smtp-Source: ACHHUZ7lqyjAxlm/pNx2WgFKc9pJTFbqvwSqqJKyeL0ADnlaVKUJ9BUxNvmzjP1AV3uxgPpQYJuuDg==
X-Received: by 2002:a17:902:d2c3:b0:1b2:3e9f:69d1 with SMTP id
 n3-20020a170902d2c300b001b23e9f69d1mr6689382plc.18.1686571122307; 
 Mon, 12 Jun 2023 04:58:42 -0700 (PDT)
Received: from [30.221.96.167] ([47.246.101.55])
 by smtp.gmail.com with ESMTPSA id
 w22-20020a1709027b9600b001ac95be5081sm8052657pll.307.2023.06.12.04.58.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jun 2023 04:58:42 -0700 (PDT)
Message-ID: <7f1545ff-3896-4dee-b96a-72f417a5c339@gmail.com>
Date: Mon, 12 Jun 2023 19:58:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 2/8] target/riscv: Factor out extension tests to
 cpu_cfg.h
Content-Language: en-US
To: Christoph Muellner <christoph.muellner@vrull.eu>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Philipp Tomsich
 <philipp.tomsich@vrull.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: Weiwei Li <liweiwei@iscas.ac.cn>
References: <20230612111034.3955227-1-christoph.muellner@vrull.eu>
 <20230612111034.3955227-3-christoph.muellner@vrull.eu>
From: LIU Zhiwei <baxiantai@gmail.com>
In-Reply-To: <20230612111034.3955227-3-christoph.muellner@vrull.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=baxiantai@gmail.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.096, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


On 2023/6/12 19:10, Christoph Muellner wrote:
> From: Christoph Müllner <christoph.muellner@vrull.eu>
>
> This patch moves the extension test functions that are used
> to gate vendor extension decoders, into cpu_cfg.h.
> This allows to reuse them in the disassembler.
>
> This patch does not introduce new functionality.
> However, the patch includes a small change:
> The parameter for the extension test functions has been changed
> from 'DisasContext*' to 'const RISCVCPUConfig*' to keep
> the code in cpu_cfg.h self-contained.
>
> Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

> ---
>   target/riscv/cpu_cfg.h   | 26 ++++++++++++++++++++++++++
>   target/riscv/translate.c | 27 ++-------------------------
>   2 files changed, 28 insertions(+), 25 deletions(-)
>
> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> index c4a627d335..0b4fe4b540 100644
> --- a/target/riscv/cpu_cfg.h
> +++ b/target/riscv/cpu_cfg.h
> @@ -133,4 +133,30 @@ struct RISCVCPUConfig {
>   };
>   
>   typedef struct RISCVCPUConfig RISCVCPUConfig;
> +
> +/* Helper functions to test for extensions.  */
> +
> +static inline bool always_true_p(const RISCVCPUConfig *cfg __attribute__((__unused__)))
> +{
> +    return true;
> +}
> +
> +static inline bool has_xthead_p(const RISCVCPUConfig *cfg)
> +{
> +    return cfg->ext_xtheadba || cfg->ext_xtheadbb ||
> +           cfg->ext_xtheadbs || cfg->ext_xtheadcmo ||
> +           cfg->ext_xtheadcondmov ||
> +           cfg->ext_xtheadfmemidx || cfg->ext_xtheadfmv ||
> +           cfg->ext_xtheadmac || cfg->ext_xtheadmemidx ||
> +           cfg->ext_xtheadmempair || cfg->ext_xtheadsync;
> +}
> +
> +#define MATERIALISE_EXT_PREDICATE(ext) \
> +    static inline bool has_ ## ext ## _p(const RISCVCPUConfig *cfg) \
> +    { \
> +        return cfg->ext_ ## ext ; \
> +    }
> +
> +MATERIALISE_EXT_PREDICATE(XVentanaCondOps)
> +
>   #endif
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 859d5b2dcf..275b922811 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -119,29 +119,6 @@ static inline bool has_ext(DisasContext *ctx, uint32_t ext)
>       return ctx->misa_ext & ext;
>   }
>   
> -static bool always_true_p(DisasContext *ctx  __attribute__((__unused__)))
> -{
> -    return true;
> -}
> -
> -static bool has_xthead_p(DisasContext *ctx  __attribute__((__unused__)))
> -{
> -    return ctx->cfg_ptr->ext_xtheadba || ctx->cfg_ptr->ext_xtheadbb ||
> -           ctx->cfg_ptr->ext_xtheadbs || ctx->cfg_ptr->ext_xtheadcmo ||
> -           ctx->cfg_ptr->ext_xtheadcondmov ||
> -           ctx->cfg_ptr->ext_xtheadfmemidx || ctx->cfg_ptr->ext_xtheadfmv ||
> -           ctx->cfg_ptr->ext_xtheadmac || ctx->cfg_ptr->ext_xtheadmemidx ||
> -           ctx->cfg_ptr->ext_xtheadmempair || ctx->cfg_ptr->ext_xtheadsync;
> -}
> -
> -#define MATERIALISE_EXT_PREDICATE(ext)  \
> -    static bool has_ ## ext ## _p(DisasContext *ctx)    \
> -    { \
> -        return ctx->cfg_ptr->ext_ ## ext ; \
> -    }
> -
> -MATERIALISE_EXT_PREDICATE(XVentanaCondOps);
> -
>   #ifdef TARGET_RISCV32
>   #define get_xl(ctx)    MXL_RV32
>   #elif defined(CONFIG_USER_ONLY)
> @@ -1132,7 +1109,7 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
>        * that are tested in-order until a decoder matches onto the opcode.
>        */
>       static const struct {
> -        bool (*guard_func)(DisasContext *);
> +        bool (*guard_func)(const RISCVCPUConfig *);
>           bool (*decode_func)(DisasContext *, uint32_t);
>       } decoders[] = {
>           { always_true_p,  decode_insn32 },
> @@ -1161,7 +1138,7 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
>           ctx->opcode = opcode32;
>   
>           for (size_t i = 0; i < ARRAY_SIZE(decoders); ++i) {
> -            if (decoders[i].guard_func(ctx) &&
> +            if (decoders[i].guard_func(ctx->cfg_ptr) &&
>                   decoders[i].decode_func(ctx, opcode32)) {
>                   return;
>               }

