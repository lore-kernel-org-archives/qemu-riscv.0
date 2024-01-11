Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F456C47258
	for <qemu-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 13:09:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rNuoX-0003VB-Rk; Thu, 11 Jan 2024 08:09:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1rNuoU-0003TK-Dl
 for qemu-riscv@nongnu.org; Thu, 11 Jan 2024 08:09:39 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1rNuoR-0007Qg-Vf
 for qemu-riscv@nongnu.org; Thu, 11 Jan 2024 08:09:37 -0500
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-553ba2f0c8fso6013084a12.1
 for <qemu-riscv@nongnu.org>; Thu, 11 Jan 2024 05:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1704978573; x=1705583373; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=tTMI4mExbmlsx8P1k0FwU4NvniO5QIrQVnB2Pz/gfto=;
 b=GJBRh+dLcKiJqse9iEKNspP++jUpUTmCN3UFLm7QnN4cQC7iLLYTulvAEPXEHnXX7w
 4exZpddkRxzxibrVxJvOffjxQaj+kp5sooNEgr2Vsa6BfTz1GJsUuEu/vDsNnzSeVnrA
 BZmieefuOU6DwK7qYUer4/ttmMZh/8X9GhxG5OEzAz+dtQGyD38WBmy8F7LwW8AYlzP9
 FRAlP2CuGYqSM0hHSvwSjttDigqHT+Q8LvzLAKE9xF/5ASg8WIL+NlnnPDXYRbUykulv
 cMJqM+FwRHzqQ8N/qa10K4jwvYidRZjlj/W1gPVvQMBzqga+OBiZBC6uClFh4WRuhYsk
 1BCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704978573; x=1705583373;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tTMI4mExbmlsx8P1k0FwU4NvniO5QIrQVnB2Pz/gfto=;
 b=tkaSTSfoywwY2zdHePEN7+tXuXgSkLkW/qwQDzR5gNHmnBXglhYI6gdUki8eoqFuIC
 FXRFoAuV4ksChTt5bmiDJ1UgLO00JuuWftVQLtoBQMAiQTLABumVedVVUbSW83sWy8da
 RN4+e1y7RVpOcGaGvAckswcUytwQfzen3oPFCxL1BfXBYDO4RdpUUa548GTODmuy19NV
 Sn4s9uoQ3rrmjwxcCiMD1+AULtI5nskdvXFZdLL5MkmgGBNaIP9YytIEvZl+hswxbrpn
 6eK3SvwNOmBbCfhPL2tNjyrqoWi1q+g8jYj6iSqYtXPenPRciRf/1ZZxjqGUr1lW9Kh0
 md0A==
X-Gm-Message-State: AOJu0YwtDfr5TeIR0iyr/+1jMY2CsBaA9Eix7R4rSpMk3SOsNmTMw5kK
 enAOBvKvaWN9decoSXW5s14zwCWzeATKkw==
X-Google-Smtp-Source: AGHT+IHlmuNMHeyuRhZU6TVVdhPcWOl15iAuUkTXyfjxQ3rn1mJJsDLtIrrAZ3pJ98VAb0abcrJj/w==
X-Received: by 2002:aa7:ca41:0:b0:557:7026:6a7b with SMTP id
 j1-20020aa7ca41000000b0055770266a7bmr311099edt.158.1704978573581; 
 Thu, 11 Jan 2024 05:09:33 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 ew3-20020a056402538300b00558a1937dddsm469808edb.63.2024.01.11.05.09.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jan 2024 05:09:32 -0800 (PST)
Date: Thu, 11 Jan 2024 14:09:31 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Rob Bradford <rbradford@rivosinc.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, atishp@rivosinc.com, 
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com, 
 liwei1518@gmail.com, dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com
Subject: Re: [PATCH 2/3] target/riscv: Add step to validate 'B' extension
Message-ID: <20240111-cbafb19054363e2e33dbd317@orel>
References: <20240109171848.32237-1-rbradford@rivosinc.com>
 <20240109171848.32237-3-rbradford@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240109171848.32237-3-rbradford@rivosinc.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=ajones@ventanamicro.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Tue, Jan 09, 2024 at 05:07:36PM +0000, Rob Bradford wrote:
> If the B extension is enabled warn if the user has disabled any of the
> required extensions that are part of the 'B' extension. Conversely
> enable the extensions that make up the 'B' extension if it is enabled.
> 
> Signed-off-by: Rob Bradford <rbradford@rivosinc.com>
> ---
>  target/riscv/tcg/tcg-cpu.c | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index fda54671d5..f10871d352 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -273,6 +273,35 @@ static void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
>      }
>  }
>  
> +static void riscv_cpu_validate_b(RISCVCPU *cpu)
> +{
> +    const char *warn_msg = "RVB mandates disabled extension %s";
> +
> +    if (!cpu->cfg.ext_zba) {
> +        if (!cpu_cfg_ext_is_user_set(CPU_CFG_OFFSET(ext_zba))) {
> +            cpu->cfg.ext_zba = true;
> +        } else {
> +            warn_report(warn_msg, "zba");
> +        }
> +    }
> +
> +    if (!cpu->cfg.ext_zbb) {
> +        if (!cpu_cfg_ext_is_user_set(CPU_CFG_OFFSET(ext_zbb))) {
> +            cpu->cfg.ext_zbb = true;
> +        } else {
> +            warn_report(warn_msg, "zbb");
> +        }
> +    }
> +
> +    if (!cpu->cfg.ext_zbs) {
> +        if (!cpu_cfg_ext_is_user_set(CPU_CFG_OFFSET(ext_zbs))) {
> +            cpu->cfg.ext_zbs = true;
> +        } else {
> +            warn_report(warn_msg, "zbs");
> +        }
> +    }
> +}
> +
>  /*
>   * Check consistency between chosen extensions while setting
>   * cpu->cfg accordingly.
> @@ -309,6 +338,10 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>          env->misa_ext_mask |= RVI | RVM | RVA | RVF | RVD;
>      }
>  
> +    if (riscv_has_ext(env, RVB)) {
> +        riscv_cpu_validate_b(cpu);
> +    }
> +
>      if (riscv_has_ext(env, RVI) && riscv_has_ext(env, RVE)) {
>          error_setg(errp,
>                     "I and E extensions are incompatible");
> -- 
> 2.43.0
> 
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

