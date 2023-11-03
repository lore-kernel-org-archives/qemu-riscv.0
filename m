Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DABCC4332F
	for <qemu-riscv@archiver.kernel.org>; Fri,  3 Nov 2023 08:33:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qypc7-0001pK-NE; Fri, 03 Nov 2023 04:33:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qypc6-0001pA-V5
 for qemu-riscv@nongnu.org; Fri, 03 Nov 2023 04:33:10 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qypc4-0005Z6-Hf
 for qemu-riscv@nongnu.org; Fri, 03 Nov 2023 04:33:10 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40891d38e3fso12882845e9.1
 for <qemu-riscv@nongnu.org>; Fri, 03 Nov 2023 01:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1699000387; x=1699605187; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=QnzqEGZ7yd9riqS3xkNnSCdzkzqAevXSkIXX6SJSdhU=;
 b=VS9eBDD7fJnjDhDC0tCij1Zw99bu6NCqrACEl+10BRCNILwcCmlXDQGobA6KvrpUTM
 XL/IyLjW/ZwBTXnvtsbCsvr8Zq2qZkoh8Aaw81fcnf/kak9LmLnUVmxDQZ/qm/lNpZkO
 RJq4MwZh/Rgy/rLErgV2gG8soI2IOHYPyZz2Hc5xV7viZsSyxUIuKGl+UrR1OOcA3yT5
 X+008Jol0GX9xgNjPIMf6NOPMhU0mby9dNl9U1w7S+AuGZ6miSyJApl5YwQnVwN9URL/
 EEetTBWUiG7D+fKuSQPFKda47/9hxk3ILfhcWO1p8DmH+RhvsX3JRCCZLSp++2MNVw/z
 lLFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699000387; x=1699605187;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QnzqEGZ7yd9riqS3xkNnSCdzkzqAevXSkIXX6SJSdhU=;
 b=HBU6LwqlE9mOyoros1qXcUC0NJswMCuoJWcz8q1G2Jr24dL2mlB2Fh9U/HorRTp/hP
 FFzWvCjDzkaXu9zSudR2LL3tuqzg7dCgEWUEZUgMjz/TVSy9VvUdnGuPnZmFb+RCJ16z
 0k3FlGXgU6ykSJXGwyWSbKbOC60P4X5tzV2wtyau3VySX5Cdilr47Tlu4wwUcljv3TZ2
 sx/xTWsYCvuTOk6EfuJrlFZ1jFEgEwGfTT1jvfMV4S/31aoXuHZyTFI6s0liNb30Faf0
 Ipz/lWV9S6lulmVyafUuyYI1Ab1O6+yxFFpukZTbcX+cZl4DKEycSujvsppLhN6dMWBp
 3nGA==
X-Gm-Message-State: AOJu0YyMSzj1HQTJGlfJQMX11EKsQadrtcldjn0nIM66Frfn0yLCPKQx
 vttuwZcIxiOWI0aiIzPMqdFcuZ42SlwrhzueGY0=
X-Google-Smtp-Source: AGHT+IEopGgobIBGGnVOvQLHgmLYwUjWC6WAOVpPbnrzunC5rDk4bp/nbgFvuTa1+iOiD2gcSOOI5Q==
X-Received: by 2002:adf:d1c9:0:b0:32d:a0d3:d681 with SMTP id
 b9-20020adfd1c9000000b0032da0d3d681mr17935687wrd.43.1699000386611; 
 Fri, 03 Nov 2023 01:33:06 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 w10-20020a5d680a000000b003143867d2ebsm1281225wru.63.2023.11.03.01.33.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Nov 2023 01:33:06 -0700 (PDT)
Date: Fri, 3 Nov 2023 09:33:05 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH v9 03/19] target/riscv/tcg: update priv_ver on user_set
 extensions
Message-ID: <20231103-3aa3e1b2206f3a8b596c0813@orel>
References: <20231102224445.527355-1-dbarboza@ventanamicro.com>
 <20231102224445.527355-4-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231102224445.527355-4-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x334.google.com
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

On Thu, Nov 02, 2023 at 07:44:29PM -0300, Daniel Henrique Barboza wrote:
> We'll add a new bare CPU type that won't have any default priv_ver. This
> means that the CPU will default to priv_ver = 0, i.e. 1.10.0.
> 
> At the same we'll allow these CPUs to enable extensions at will, but
> then, if the extension has a priv_ver newer than 1.10, we'll end up
> disabling it. Users will then need to manually set priv_ver to something
> other than 1.10 to enable the extensions they want, which is not ideal.
> 
> Change the setter() of extensions to allow user enabled extensions to
> bump the priv_ver of the CPU. This will make it convenient for users to
> enable extensions for CPUs that doesn't set a default priv_ver.
> 
> This change does not affect any existing CPU: vendor CPUs does not allow
> extensions to be enabled, and generic CPUs are already set to priv_ver
> LATEST.

The only problem I see is that priv_ver will be silently bumped for any
CPU type which accepts extensions. While generic CPUs currently always
select LATEST, meaning it doesn't matter, and the new bare CPU type needs
this feature, we'll also eventually have CPU types that set a priv_ver
in their definition which should not be changed. For example, when the
rva22s64 profile is introduced it will set its priv_ver to 1.12, as
mandated by the profile, if a user then adds an extension which requires
a later profile, its priv_ver will get silently bumped. Maybe that won't
matter, though, because later in realize we'll check that Ss1p12 is true
and when it's false we'll complain that the profile is not compliant?
Or maybe I'm reading the profile spec too strictly and/or am too
pessimistic about later specs being backwards compatible. If we believe
later specs are always compatible with older, then we could advertise
compliance with a profile which mandates 1.12 as long as its spec is 1.12
or later.

Anyway, just food for thought. I think we can address this later when
we get the first CPU type which sets a priv_ver and accepts extensions.

> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/tcg/tcg-cpu.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 08f8dded56..0e684ab86f 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -114,6 +114,22 @@ static int cpu_cfg_ext_get_min_version(uint32_t ext_offset)
>      g_assert_not_reached();
>  }
>  
> +static void cpu_validate_multi_ext_priv_ver(CPURISCVState *env,
> +                                            uint32_t ext_offset)
> +{
> +    int ext_priv_ver;
> +
> +    if (env->priv_ver == PRIV_VERSION_LATEST) {
> +        return;
> +    }
> +
> +    ext_priv_ver = cpu_cfg_ext_get_min_version(ext_offset);
> +
> +    if (env->priv_ver < ext_priv_ver) {
> +        env->priv_ver = ext_priv_ver;
> +    }
> +}
> +
>  static void cpu_cfg_ext_auto_update(RISCVCPU *cpu, uint32_t ext_offset,
>                                      bool value)
>  {
> @@ -742,6 +758,14 @@ static void cpu_set_misa_ext_cfg(Object *obj, Visitor *v, const char *name,
>              return;
>          }
>  
> +        if (misa_bit == RVH && env->priv_ver < PRIV_VERSION_1_12_0) {
> +            /*
> +             * Note: the 'priv_spec' command line option, if present,
> +             * will take precedence over this priv_ver bump.
> +             */
> +            env->priv_ver = PRIV_VERSION_1_12_0;
> +        }
> +
>          env->misa_ext |= misa_bit;
>          env->misa_ext_mask |= misa_bit;
>      } else {
> @@ -871,6 +895,14 @@ static void cpu_set_multi_ext_cfg(Object *obj, Visitor *v, const char *name,
>          return;
>      }
>  
> +    if (value) {
> +        /*
> +         * Note: the 'priv_spec' command line option, if present,
> +         * will take precedence over this priv_ver bump.
> +         */

The above comment would be better in cpu_validate_multi_ext_priv_ver() at
the line where the bumping is done.

> +        cpu_validate_multi_ext_priv_ver(&cpu->env, multi_ext_cfg->offset);
> +    }
> +
>      isa_ext_update_enabled(cpu, multi_ext_cfg->offset, value);
>  }
>  
> -- 
> 2.41.0
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

