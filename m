Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A89A6C83F01
	for <qemu-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 13:57:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qbiAO-0002O0-4G; Thu, 31 Aug 2023 09:57:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qbiAN-0002Ia-1h
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 09:56:59 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qbiAK-0006o0-Fv
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 09:56:58 -0400
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-50087d47d4dso1632696e87.1
 for <qemu-riscv@nongnu.org>; Thu, 31 Aug 2023 06:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1693490214; x=1694095014; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=lRr6uuKK72TETXM5MmOQAX/v+LIdh8T2DWCtZGe2M1o=;
 b=Pgo1GmawloNRZLuZzUXDFuki4oZJNW6fl8GqJ4DJb47l/82X9gkEYIir7vHequkx39
 Mvtt8E+vnqzz+3PepnLmFrIgEoPcMYxq7t6ITcJ+jYpjOCZQGz8HojiUCYPPKQWuzHZQ
 1i80O+rSRSfkzzx8723gcnSI15ADMiu/+XIyEPja6EnNqYhUJq2zGjuBPAjelYC4+xlX
 4reJbrY1uoXPGkxIoYxh5V7PBSZheWlyEuKO0Leeeumu1L9C0V4cN7AgTsut+8dsxRmQ
 0oJBDIpdvCj/H2c2VTbjwBBcCtFFvglwSzcIQjgnm8iZSQOYbjjCanb+OXK8TuT0FY06
 M4+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693490214; x=1694095014;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lRr6uuKK72TETXM5MmOQAX/v+LIdh8T2DWCtZGe2M1o=;
 b=gLn/6CIqiPIFOXYEMTcavi1quyFjlesXqafXrHPTU5g7eDoAOPGOuGc6d7YKU5or//
 POVnEz5uMAygkPIcY4Cc2c7BTsEU1u/HnuZnwu0rR4f1yfOYHcviHCVdHMBDz+C4G7w7
 Pfe8wCelniPV631H0Wn/5AgzJE2LZVy1ZJyQm1TZeFUy6yzpTDwj1ppN6kDKhv4HOBZp
 HOgvis57O3vjEOfhc2BA4R7d6y+C8zL/0u0eD/OBkpb0l4X+dU3kB3JBLU2ARuPmIs+I
 Ia0NnFreZOEB1osCeqJBhBhh8PA4GRG04W4LYDbNtm6nw2L8kXG9n02r1KxIBRL7TB4I
 VyyQ==
X-Gm-Message-State: AOJu0YxOR4pfImrP+c2N3WFcI6ud3oA2wfNBAznpgaQsPScktueSAhmw
 aKMMSOSQ7AFxiuxYknDumrsiDw==
X-Google-Smtp-Source: AGHT+IFOYV1LDehjhVMH+gIkBXdtDEl5gNltNEuBtrcVgPu3zJORQXGwT9wsxHAmrqbkPA7LpxuY0g==
X-Received: by 2002:a05:6512:606:b0:4fe:94a1:da84 with SMTP id
 b6-20020a056512060600b004fe94a1da84mr4022664lfe.5.1693490214245; 
 Thu, 31 Aug 2023 06:56:54 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 r9-20020aa7d589000000b0052a1c0c859asm829911edq.59.2023.08.31.06.56.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Aug 2023 06:56:53 -0700 (PDT)
Date: Thu, 31 Aug 2023 15:56:53 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH RESEND v8 18/20] target/riscv: use
 isa_ext_update_enabled() in init_max_cpu_extensions()
Message-ID: <20230831-f38837e8878b942e5056299f@orel>
References: <20230824221440.484675-1-dbarboza@ventanamicro.com>
 <20230824221440.484675-19-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230824221440.484675-19-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=ajones@ventanamicro.com; helo=mail-lf1-x136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, Aug 24, 2023 at 07:14:38PM -0300, Daniel Henrique Barboza wrote:
> Before adding support to detect if an extension was user set we need to
> handle how we're enabling extensions in riscv_init_max_cpu_extensions().
> object_property_set_bool() calls the set() callback for the property,
> and we're going to use this callback to set the 'multi_ext_user_opts'
> hash.
> 
> This means that, as is today, all extensions we're setting for the 'max'
> CPU will be seen as user set in the future. Let's change set_bool() to
> isa_ext_update_enabled() that will just enable/disable the flag on a
> certain offset.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index adfe671bd4..ae8c35402f 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -2163,24 +2163,24 @@ static void riscv_init_max_cpu_extensions(Object *obj)
>      set_misa(env, env->misa_mxl, env->misa_ext | RVG | RVJ | RVV);
>  
>      for (prop = riscv_cpu_extensions; prop && prop->name; prop++) {
> -        object_property_set_bool(obj, prop->name, true, NULL);
> +        isa_ext_update_enabled(cpu, prop->offset, true);
>      }
>  
>      /* set vector version */
>      env->vext_ver = VEXT_VERSION_1_00_0;
>  
>      /* Zfinx is not compatible with F. Disable it */
> -    object_property_set_bool(obj, "zfinx", false, NULL);
> -    object_property_set_bool(obj, "zdinx", false, NULL);
> -    object_property_set_bool(obj, "zhinx", false, NULL);
> -    object_property_set_bool(obj, "zhinxmin", false, NULL);
> +    isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_zfinx), false);
> +    isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_zdinx), false);
> +    isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_zhinx), false);
> +    isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_zhinxmin), false);
>  
> -    object_property_set_bool(obj, "zce", false, NULL);
> -    object_property_set_bool(obj, "zcmp", false, NULL);
> -    object_property_set_bool(obj, "zcmt", false, NULL);
> +    isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_zce), false);
> +    isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_zcmp), false);
> +    isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_zcmt), false);
>  
>      if (env->misa_mxl != MXL_RV32) {
> -        object_property_set_bool(obj, "zcf", false, NULL);
> +        isa_ext_update_enabled(cpu, CPU_CFG_OFFSET(ext_zcf), false);
>      }
>  }
>  
> -- 
> 2.41.0
> 
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

