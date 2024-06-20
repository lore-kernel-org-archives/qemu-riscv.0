Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B19C27C79
	for <qemu-riscv@archiver.kernel.org>; Thu, 20 Jun 2024 19:54:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sKNrU-0004RV-0T; Thu, 20 Jun 2024 15:54:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1sKNrR-0004Oh-Cb
 for qemu-riscv@nongnu.org; Thu, 20 Jun 2024 15:54:21 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1sKNrP-0000s6-4N
 for qemu-riscv@nongnu.org; Thu, 20 Jun 2024 15:54:21 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-2c80637ee79so524557a91.0
 for <qemu-riscv@nongnu.org>; Thu, 20 Jun 2024 12:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1718913257; x=1719518057; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oqZjtmViJbgsfJown30IfrrKzf7iFf5uKnPvkSUnIuY=;
 b=nocVLbQeJpbAMTagQ5x5pg4i9oeaTch55+OkaqROSb6AYN4SwMDxj6L5WC27Tu2OSm
 PDpT0nKPG4+eQxl4PbQuWwalPOl9XzZN9idqlea8LmI36/VPGGoN/RwtzZJsl0gViii5
 46Nrq9YZmEonvaiQuK1BoLBqxQmHbQ1feq5nOt6ecTwMY7r3vcH9h1a6fom02qr78xnl
 9xGD66khNd8O1txzWeNEngkTRGgA5uWb+Ned1esw+zK7A9KqjMfcz5eX+yW/x0+9DY+Y
 7k2UcT1UiJfR4RXQbahm3Z65SoTO26kpEfHzd8pcsXJFt14zgBka5/rV32aKZ6XKvrul
 avyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718913257; x=1719518057;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oqZjtmViJbgsfJown30IfrrKzf7iFf5uKnPvkSUnIuY=;
 b=UDEa4I7Hx99omaQdWrXlxcHqAUBHgToK+lp85jjnYCeUUbpyE8x5vZykW/7hdTBa00
 c1gN2sp9sUw/5slCXqVxhkGKny8lJImQPTFrLgwT8vvALGrn36cEbADADiuzAyvVdla7
 4rRHkxlEsNKlcuM2uxWtAa74IjNO27QvH6Ju8+S4sw/lRUp53CfQc1PY+JjSzz8+s3OT
 VTZqLfdb8UxgoXCrxM8EIFITUOT5VQSsL7m4bM0+Owy3s3eXmzRd6oXPYqD2fkrie1Pd
 4mDTw68jrZpAo1OtnGq73IPIIMq4SPDgQt1MjlzYDWORxXAYzY60tpYhiT029DMewR56
 UO5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcLWLdBAAi+JZCd6v2L9fESB7d+BpPHN1C6iX3Ybkop7qse4Xfa3nDzF2WiqV3fPg6sS8zEBTLt9ME4Kq80OvGoNW72MU=
X-Gm-Message-State: AOJu0Yyef/e6/BzegmdCGZDgI8QVQXTVcnyEUawRVhh58IQtCfSjovgB
 rDxLzhR8UwdHjayrnB7c0SWHx3vAM7A/qYgXG/74/9mxP6r1MieUKHC5v9gbPT4=
X-Google-Smtp-Source: AGHT+IGJxH+F3vnZP79z3/w8EKCPwwRK+IkDhFLV1UC6cQLozkW2syEHuT7SjWnwxThu8B7SQ1oOaw==
X-Received: by 2002:a17:90a:df07:b0:2c1:ebc4:4f1f with SMTP id
 98e67ed59e1d1-2c7b5d56b91mr6118409a91.33.1718913257159; 
 Thu, 20 Jun 2024 12:54:17 -0700 (PDT)
Received: from ?IPV6:2804:7f0:bdcd:fb00:6501:2693:db52:c621?
 ([2804:7f0:bdcd:fb00:6501:2693:db52:c621])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c819a76ccasm63434a91.13.2024.06.20.12.54.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jun 2024 12:54:16 -0700 (PDT)
Message-ID: <acd9e49d-9cb0-4c35-b7ec-78aa10bcfedc@ventanamicro.com>
Date: Thu, 20 Jun 2024 16:54:12 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] target/riscv: Remove extension auto-update check
 statements
To: frank.chang@sifive.com, qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Jerry Zhang Jian <jerry.zhangjian@sifive.com>, Max Chou <max.chou@sifive.com>
References: <20240616024657.17948-1-frank.chang@sifive.com>
 <20240616024657.17948-7-frank.chang@sifive.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20240616024657.17948-7-frank.chang@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pj1-x102b.google.com
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



On 6/15/24 11:46 PM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> Remove the old-fashioned extension auto-update check statements as
> they are replaced by the extension implied rules.
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Jerry Zhang Jian <jerry.zhangjian@sifive.com>
> Tested-by: Max Chou <max.chou@sifive.com>
> ---


Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/tcg/tcg-cpu.c | 119 -------------------------------------
>   1 file changed, 119 deletions(-)
> 
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index fe84d4402e..94875c8ec9 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -468,10 +468,6 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>           return;
>       }
>   
> -    if (cpu->cfg.ext_zfh) {
> -        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zfhmin), true);
> -    }
> -
>       if (cpu->cfg.ext_zfhmin && !riscv_has_ext(env, RVF)) {
>           error_setg(errp, "Zfh/Zfhmin extensions require F extension");
>           return;
> @@ -493,9 +489,6 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>               error_propagate(errp, local_err);
>               return;
>           }
> -
> -        /* The V vector extension depends on the Zve64d extension */
> -        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zve64d), true);
>       }
>   
>       /* The Zve64d extension depends on the Zve64f extension */
> @@ -504,18 +497,6 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>               error_setg(errp, "Zve64d/V extensions require D extension");
>               return;
>           }
> -        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zve64f), true);
> -    }
> -
> -    /* The Zve64f extension depends on the Zve64x and Zve32f extensions */
> -    if (cpu->cfg.ext_zve64f) {
> -        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zve64x), true);
> -        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zve32f), true);
> -    }
> -
> -    /* The Zve64x extension depends on the Zve32x extension */
> -    if (cpu->cfg.ext_zve64x) {
> -        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zve32x), true);
>       }
>   
>       /* The Zve32f extension depends on the Zve32x extension */
> @@ -524,11 +505,6 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>               error_setg(errp, "Zve32f/Zve64f extensions require F extension");
>               return;
>           }
> -        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zve32x), true);
> -    }
> -
> -    if (cpu->cfg.ext_zvfh) {
> -        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zvfhmin), true);
>       }
>   
>       if (cpu->cfg.ext_zvfhmin && !cpu->cfg.ext_zve32f) {
> @@ -551,11 +527,6 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>           return;
>       }
>   
> -    /* Set the ISA extensions, checks should have happened above */
> -    if (cpu->cfg.ext_zhinx) {
> -        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zca), true);
> -    }
> -
>       if ((cpu->cfg.ext_zdinx || cpu->cfg.ext_zhinxmin) && !cpu->cfg.ext_zfinx) {
>           error_setg(errp, "Zdinx/Zhinx/Zhinxmin extensions require Zfinx");
>           return;
> @@ -573,27 +544,6 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>           }
>       }
>   
> -    if (cpu->cfg.ext_zce) {
> -        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zca), true);
> -        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zcb), true);
> -        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zcmp), true);
> -        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zcmt), true);
> -        if (riscv_has_ext(env, RVF) && mcc->misa_mxl_max == MXL_RV32) {
> -            cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zcf), true);
> -        }
> -    }
> -
> -    /* zca, zcd and zcf has a PRIV 1.12.0 restriction */
> -    if (riscv_has_ext(env, RVC) && env->priv_ver >= PRIV_VERSION_1_12_0) {
> -        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zca), true);
> -        if (riscv_has_ext(env, RVF) && mcc->misa_mxl_max == MXL_RV32) {
> -            cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zcf), true);
> -        }
> -        if (riscv_has_ext(env, RVD)) {
> -            cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zcd), true);
> -        }
> -    }
> -
>       if (mcc->misa_mxl_max != MXL_RV32 && cpu->cfg.ext_zcf) {
>           error_setg(errp, "Zcf extension is only relevant to RV32");
>           return;
> @@ -627,52 +577,6 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>           return;
>       }
>   
> -    /*
> -     * Shorthand vector crypto extensions
> -     */
> -    if (cpu->cfg.ext_zvknc) {
> -        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zvkn), true);
> -        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zvbc), true);
> -    }
> -
> -    if (cpu->cfg.ext_zvkng) {
> -        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zvkn), true);
> -        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zvkg), true);
> -    }
> -
> -    if (cpu->cfg.ext_zvkn) {
> -        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zvkned), true);
> -        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zvknhb), true);
> -        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zvkb), true);
> -        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zvkt), true);
> -    }
> -
> -    if (cpu->cfg.ext_zvksc) {
> -        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zvks), true);
> -        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zvbc), true);
> -    }
> -
> -    if (cpu->cfg.ext_zvksg) {
> -        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zvks), true);
> -        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zvkg), true);
> -    }
> -
> -    if (cpu->cfg.ext_zvks) {
> -        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zvksed), true);
> -        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zvksh), true);
> -        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zvkb), true);
> -        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zvkt), true);
> -    }
> -
> -    if (cpu->cfg.ext_zvkt) {
> -        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zvbb), true);
> -        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zvbc), true);
> -    }
> -
> -    if (cpu->cfg.ext_zvbb) {
> -        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zvkb), true);
> -    }
> -
>       if ((cpu->cfg.ext_zvbb || cpu->cfg.ext_zvkb || cpu->cfg.ext_zvkg ||
>            cpu->cfg.ext_zvkned || cpu->cfg.ext_zvknha || cpu->cfg.ext_zvksed ||
>            cpu->cfg.ext_zvksh) && !cpu->cfg.ext_zve32x) {
> @@ -688,29 +592,6 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>           return;
>       }
>   
> -    if (cpu->cfg.ext_zk) {
> -        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zkn), true);
> -        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zkr), true);
> -        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zkt), true);
> -    }
> -
> -    if (cpu->cfg.ext_zkn) {
> -        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zbkb), true);
> -        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zbkc), true);
> -        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zbkx), true);
> -        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zkne), true);
> -        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zknd), true);
> -        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zknh), true);
> -    }
> -
> -    if (cpu->cfg.ext_zks) {
> -        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zbkb), true);
> -        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zbkc), true);
> -        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zbkx), true);
> -        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zksed), true);
> -        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_zksh), true);
> -    }
> -
>       if (cpu->cfg.ext_zicntr && !cpu->cfg.ext_zicsr) {
>           if (cpu_cfg_ext_is_user_set(CPU_CFG_OFFSET(ext_zicntr))) {
>               error_setg(errp, "zicntr requires zicsr");

