Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECB75C61D97
	for <qemu-riscv@archiver.kernel.org>; Fri, 24 Nov 2023 17:17:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r6ZnY-0000yd-Sa; Fri, 24 Nov 2023 12:17:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1r6ZnM-0000Jw-SD
 for qemu-riscv@nongnu.org; Fri, 24 Nov 2023 12:16:49 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1r6ZnL-0007zq-B4
 for qemu-riscv@nongnu.org; Fri, 24 Nov 2023 12:16:48 -0500
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a06e59384b6so255544266b.1
 for <qemu-riscv@nongnu.org>; Fri, 24 Nov 2023 09:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1700846206; x=1701451006; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ANdA//no5fPTT99aMmWOLI3pj7CRht00cxQScqAFTZ4=;
 b=V1THvqcq0gMtezQ5Cl2kUn2IIwT0G02jhPQ9UPUrUMpHmu5vBzW/YwaXWeAa/2qg1i
 Qd5bb/4gvaXW9PvZ7BUuV5HXGadP3aB+WnlTY817fgrBb9kxzjBxq2qgGst3wS0KHehz
 B5y0kJ+XpNaaOec207yWiq/gteO+0jj55FEiqXYqrCun8kEQ7PFtXOU0J2zq0eMj7M61
 FhRyTSvO6gaHPrrDAdNYRvXI0G2YlBN46fniMYD4QexAyZVXUiuX+/HJWR46uYFL6rNV
 7XlbHlPhGxEc539EojLN+leY8xyq/VXC1+vYCrn0LOHkXChmCTU8zvr9PNK1JATCvbNY
 LULw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700846206; x=1701451006;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ANdA//no5fPTT99aMmWOLI3pj7CRht00cxQScqAFTZ4=;
 b=XR9uhvEXYeP0Gs+ROFi+IChARArnhOyrw5qBeNkgj3bLeMU6uEc/npCGZiEeUyr2OZ
 0Ptm86QW+FEcKEF3fV/LqKfyE1usCNzMlYkIr4c8OqAe3KQtvSI1uMUCDY0IZCT/2Ba9
 srQnWH7mG6Z7bOjnMuCing6MQPT1Qir97n6OFtcbuBqqinJPeQQm8djlgaq4PcYKpBte
 hM66xXu7pEJU9pEVBvGnp+smXpET2lBEfvMynCxizFXhS60VSsebngKuqhmc0r1Co7ei
 nqNpnQYQGT552SOz9iYC+8kjHAtzMbgngC1/8A1Tr6yPZegH+SK7m28QwFLr+ez9mL01
 WOrg==
X-Gm-Message-State: AOJu0YzZzjXC8AlVKcJ3SacKfcviVCDZx6Giuc/KGXDVvOrt1AiTEbCU
 zp88mR+xqcwSfWwV9XZtDZU/mw==
X-Google-Smtp-Source: AGHT+IHaJsLJ/Q75v/caQ2GVRDMVenkFq7KGfR/M7CIlcBHwxr6s00crMhgEj+nzKW+Qu2Elqxu96A==
X-Received: by 2002:a17:906:39c9:b0:a01:d364:ddaf with SMTP id
 i9-20020a17090639c900b00a01d364ddafmr3127852eje.51.1700846206079; 
 Fri, 24 Nov 2023 09:16:46 -0800 (PST)
Received: from localhost ([81.19.4.232]) by smtp.gmail.com with ESMTPSA id
 cb8-20020a170906a44800b009fd4583851esm2315718ejb.178.2023.11.24.09.16.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 09:16:45 -0800 (PST)
Date: Fri, 24 Nov 2023 18:16:44 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH for-9.0 7/7] target/riscv: add rva22s64 cpu
Message-ID: <20231124-c0d3f3a3d9ea69501ba2a1aa@orel>
References: <20231123191532.1101644-1-dbarboza@ventanamicro.com>
 <20231123191532.1101644-8-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231123191532.1101644-8-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x633.google.com
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

On Thu, Nov 23, 2023 at 04:15:32PM -0300, Daniel Henrique Barboza wrote:
> Add a new profile CPU 'rva22s64' to work as an alias of
> 
> -cpu rv64i,rva22s64
> 
> Like the existing rva22u64 CPU already does with the RVA22U64 profile.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu-qom.h | 1 +
>  target/riscv/cpu.c     | 8 ++++++++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
> index 12fe78fc52..9219c2fcc3 100644
> --- a/target/riscv/cpu-qom.h
> +++ b/target/riscv/cpu-qom.h
> @@ -36,6 +36,7 @@
>  #define TYPE_RISCV_CPU_BASE128          RISCV_CPU_TYPE_NAME("x-rv128")
>  #define TYPE_RISCV_CPU_RV64I            RISCV_CPU_TYPE_NAME("rv64i")
>  #define TYPE_RISCV_CPU_RVA22U64         RISCV_CPU_TYPE_NAME("rva22u64")
> +#define TYPE_RISCV_CPU_RVA22S64         RISCV_CPU_TYPE_NAME("rva22s64")
>  #define TYPE_RISCV_CPU_IBEX             RISCV_CPU_TYPE_NAME("lowrisc-ibex")
>  #define TYPE_RISCV_CPU_SHAKTI_C         RISCV_CPU_TYPE_NAME("shakti-c")
>  #define TYPE_RISCV_CPU_SIFIVE_E31       RISCV_CPU_TYPE_NAME("sifive-e31")
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index d00548d164..f6d1d4c7a6 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1631,6 +1631,13 @@ static void rva22u64_profile_cpu_init(Object *obj)
>  
>      RVA22U64.enabled = true;
>  }
> +
> +static void rva22s64_profile_cpu_init(Object *obj)
> +{
> +    rv64i_bare_cpu_init(obj);
> +
> +    RVA22S64.enabled = true;
> +}
>  #endif
>  
>  static const gchar *riscv_gdb_arch_name(CPUState *cs)
> @@ -1975,6 +1982,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
>      DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_BASE128,  rv128_base_cpu_init),
>      DEFINE_BARE_CPU(TYPE_RISCV_CPU_RV64I, rv64i_bare_cpu_init),
>      DEFINE_PROFILE_CPU(TYPE_RISCV_CPU_RVA22U64, rva22u64_profile_cpu_init),
> +    DEFINE_PROFILE_CPU(TYPE_RISCV_CPU_RVA22S64, rva22s64_profile_cpu_init),
>  #endif
>  };
>  
> -- 
> 2.41.0
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

