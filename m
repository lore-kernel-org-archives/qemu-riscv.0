Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AABBEC83F01
	for <qemu-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 12:07:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qbgSJ-000109-1e; Thu, 31 Aug 2023 08:07:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qbgSH-0000x6-96
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 08:07:21 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qbgSE-0007Px-MD
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 08:07:21 -0400
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-99bdeae1d0aso83901566b.1
 for <qemu-riscv@nongnu.org>; Thu, 31 Aug 2023 05:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1693483636; x=1694088436; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3FZ3PCxobbE/Qeq3Uj2VV8YpBRHGgPXdJpY24Xo2bqY=;
 b=WmuchqmEq9k0BY4y8Vt3GFH+ZLEzXhkoEHZtBK7hlFZA08SB5b4XbMC3gwtilMzARy
 Ex/5BavWa7PAsHGojejPXP+hwQZsm5BoGy3iNHFNNwrj5/xBPOrf2bhcVQ9NaF+XSdyx
 krLI7chzLYGWXqyBCXCY9qVKxaDKZPt0z86VonTCeV04pZZB+eX431WgyWG3rbGQKtaW
 yieUQ6mtjEb/F6/We8nAxAZn1Gu0gSUMhZC9BIf6JATZCoG++oy3Kqce+5kKKC2zQPsB
 XZ9k/WJtToRKHTj+IDSlng6GqRA2/+3/XvRD9TKdkvZP9E2ts395St8BdgP95p/6O/R3
 8zYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693483636; x=1694088436;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3FZ3PCxobbE/Qeq3Uj2VV8YpBRHGgPXdJpY24Xo2bqY=;
 b=DPguyZX8V8D3At16wkswNQLa8sf8Y9CmpXEEAUD/pZVgWNDNyya+Owfj3VXMIdE00x
 U+7mfQ4W7U8FdgIB2zTv5gtnboPPY+EmaOpB/G9twKVr36ePPwwW0sFEloCJe5qetAf6
 GtnK58bRznVIQz1Rw/5M/vL6zm4s1JUfMdnKN4QbWV10Mba4KdMAi4kNDoRmpCoAAf8z
 D1i7F4I9cvcPjw3Nze4yccmfGOfDYXz9A1sRQnmzclTgrXCGQyGvIAdzbV+zpUMxbUH6
 WFyEy1D1weorI5vvBo4bp+dTdFuv6B+DA6HXknfBmpXJKBzRpdiFfiDt+JHaAPo1NjWK
 yHAw==
X-Gm-Message-State: AOJu0YwLX/acKMtEjt4QdFVN4k3zMxxhqev4XCrdi3hEt2b+SMIuXe5r
 SLjFvspXUSVbU47/Mw6z+y1dgA==
X-Google-Smtp-Source: AGHT+IEqCbYY+szsNgLHBeYOhky5ku0SWVQYkDdFejQN+UGWpFvhpoxiWruLjUcuy3VEnh4L6bUABA==
X-Received: by 2002:a17:906:5303:b0:99d:f2dc:97e3 with SMTP id
 h3-20020a170906530300b0099df2dc97e3mr3990876ejo.20.1693483636375; 
 Thu, 31 Aug 2023 05:07:16 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 f22-20020a170906495600b0098e2eaec395sm685372ejt.130.2023.08.31.05.07.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Aug 2023 05:07:16 -0700 (PDT)
Date: Thu, 31 Aug 2023 14:07:15 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH 18/20] target/riscv/cpu: move priv spec functions to
 tcg-cpu.c
Message-ID: <20230831-7679a0a5766303607d328eb9@orel>
References: <20230825130853.511782-1-dbarboza@ventanamicro.com>
 <20230825130853.511782-19-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230825130853.511782-19-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x62f.google.com
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

On Fri, Aug 25, 2023 at 10:08:51AM -0300, Daniel Henrique Barboza wrote:
> Priv spec validation is TCG specific. Move it to the TCG accel class.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu.c         | 39 --------------------------------------
>  target/riscv/cpu.h         |  2 --
>  target/riscv/tcg/tcg-cpu.c | 39 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 39 insertions(+), 41 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index ac5ad4727c..6817f94c2c 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -172,22 +172,6 @@ void isa_ext_update_enabled(RISCVCPU *cpu, uint32_t ext_offset, bool en)
>      *ext_enabled = en;
>  }
>  
> -int cpu_cfg_ext_get_min_version(uint32_t ext_offset)
> -{
> -    const RISCVIsaExtData *edata;
> -
> -    for (edata = isa_edata_arr; edata && edata->name; edata++) {
> -        if (edata->ext_enable_offset != ext_offset) {
> -            continue;
> -        }
> -
> -        return edata->min_version;
> -    }
> -
> -    /* Default to oldest priv spec if no match found */
> -    return PRIV_VERSION_1_10_0;
> -}
> -
>  const char * const riscv_int_regnames[] = {
>      "x0/zero", "x1/ra",  "x2/sp",  "x3/gp",  "x4/tp",  "x5/t0",   "x6/t1",
>      "x7/t2",   "x8/s0",  "x9/s1",  "x10/a0", "x11/a1", "x12/a2",  "x13/a3",
> @@ -926,29 +910,6 @@ static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
>      }
>  }
>  
> -void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
> -{
> -    CPURISCVState *env = &cpu->env;
> -    const RISCVIsaExtData *edata;
> -
> -    /* Force disable extensions if priv spec version does not match */
> -    for (edata = isa_edata_arr; edata && edata->name; edata++) {
> -        if (isa_ext_is_enabled(cpu, edata->ext_enable_offset) &&
> -            (env->priv_ver < edata->min_version)) {
> -            isa_ext_update_enabled(cpu, edata->ext_enable_offset, false);
> -#ifndef CONFIG_USER_ONLY
> -            warn_report("disabling %s extension for hart 0x" TARGET_FMT_lx
> -                        " because privilege spec version does not match",
> -                        edata->name, env->mhartid);
> -#else
> -            warn_report("disabling %s extension because "
> -                        "privilege spec version does not match",
> -                        edata->name);
> -#endif
> -        }
> -    }
> -}
> -
>  #ifndef CONFIG_USER_ONLY
>  static void riscv_cpu_satp_mode_finalize(RISCVCPU *cpu, Error **errp)
>  {
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index d9a17df46a..4254f04684 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -711,9 +711,7 @@ enum riscv_pmu_event_idx {
>  /* used by tcg/tcg-cpu.c*/
>  void isa_ext_update_enabled(RISCVCPU *cpu, uint32_t ext_offset, bool en);
>  bool isa_ext_is_enabled(RISCVCPU *cpu, uint32_t ext_offset);
> -int cpu_cfg_ext_get_min_version(uint32_t ext_offset);
>  void set_misa(CPURISCVState *env, RISCVMXL mxl, uint32_t ext);
> -void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu);
>  
>  typedef struct RISCVCPUMultiExtConfig {
>      const char *name;
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 8e3f55d3a6..6c91978920 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -97,6 +97,22 @@ const struct TCGCPUOps riscv_tcg_ops = {
>  #endif /* !CONFIG_USER_ONLY */
>  };
>  
> +static int cpu_cfg_ext_get_min_version(uint32_t ext_offset)
> +{
> +    const RISCVIsaExtData *edata;
> +
> +    for (edata = isa_edata_arr; edata && edata->name; edata++) {
> +        if (edata->ext_enable_offset != ext_offset) {
> +            continue;
> +        }
> +
> +        return edata->min_version;
> +    }
> +
> +    /* Default to oldest priv spec if no match found */
> +    return PRIV_VERSION_1_10_0;
> +}
> +
>  static void cpu_cfg_ext_auto_update(RISCVCPU *cpu, uint32_t ext_offset,
>                                      bool value)
>  {
> @@ -220,6 +236,29 @@ static void riscv_cpu_validate_v(CPURISCVState *env, RISCVCPUConfig *cfg,
>      }
>  }
>  
> +static void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
> +{
> +    CPURISCVState *env = &cpu->env;
> +    const RISCVIsaExtData *edata;
> +
> +    /* Force disable extensions if priv spec version does not match */
> +    for (edata = isa_edata_arr; edata && edata->name; edata++) {
> +        if (isa_ext_is_enabled(cpu, edata->ext_enable_offset) &&
> +            (env->priv_ver < edata->min_version)) {
> +            isa_ext_update_enabled(cpu, edata->ext_enable_offset, false);
> +#ifndef CONFIG_USER_ONLY
> +            warn_report("disabling %s extension for hart 0x" TARGET_FMT_lx
> +                        " because privilege spec version does not match",
> +                        edata->name, env->mhartid);
> +#else
> +            warn_report("disabling %s extension because "
> +                        "privilege spec version does not match",
> +                        edata->name);
> +#endif
> +        }
> +    }
> +}
> +
>  /*
>   * Check consistency between chosen extensions while setting
>   * cpu->cfg accordingly.
> -- 
> 2.41.0
> 
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

