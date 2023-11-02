Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C87BEC4167B
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 09:47:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qyUIO-0004AO-Ss; Thu, 02 Nov 2023 05:47:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qyUIK-00049j-9R
 for qemu-riscv@nongnu.org; Thu, 02 Nov 2023 05:47:22 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qyUII-0003B3-IR
 for qemu-riscv@nongnu.org; Thu, 02 Nov 2023 05:47:20 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-32d80ae19f8so409276f8f.2
 for <qemu-riscv@nongnu.org>; Thu, 02 Nov 2023 02:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1698918437; x=1699523237; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=OFSsSouQLNlw+sXzdlikhskpcX4CIxBHiRvr/qH4X0w=;
 b=pBJx0t/EzGFphOgeDFeLhhgsIYgV+ODRQdmyJ26PpQjj1L0TvmQcfzD0mRIgMX35HY
 llMJ3f6aYdgG3Vzotw18lo5JnqflRimJaNhEAEfMUFGbk3Ihvmpvu2ZVnc8xvSiltocY
 sOZbwW0RJtBHBNUb8hGbl56QzcNWqNq/r8gGKuJjoq4RoV3K/Tc2DIwbNjrsg2O1odcM
 dSyAHcUq5x3gsKDkcb9F/ZsTjDWbBrz+KkvTyl0kE2b5bhNgVn1iKA57hQnyTU3eZuDz
 2fXdQkAY6wfVlSUPPk2Kh0w1x6kYMiPVCZec/XCU94sxzOaohniBoGC369+aD0ALpSJg
 pruw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698918437; x=1699523237;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OFSsSouQLNlw+sXzdlikhskpcX4CIxBHiRvr/qH4X0w=;
 b=o9Ep9Qfc+LszQQjpndhnThytxz5LtOWWI56iIl4bSQbYJ5aMFa3aTGXpJ6KO84LMkK
 Xd4rGp8UQWswnOJNrWTRKNxL2kMYUZ8JMWt5vN8xqN1WPEHVzxW5TeHAVMndfHQ3Ohel
 cLhntkqOkQrKse3xwq782dBlNbUSvrSr0h6mrSARIW2te1x0VVnOSGyv5ZcUpgVStHme
 vHn0G/Yy9/HUhpbjKpsABvpai50V/KgKBwBXdyPjTmhoOgZA6KBjQW4TIEVxx908EP4R
 lBqbXjD91u9/e3IDG9gX353urjnW+avvXwrUrdOnzT7rKlVEFVhqJYbOVRMcxfeqGDMw
 6W0Q==
X-Gm-Message-State: AOJu0YxLUvKBi24+brrU41RaYCpW2glKtumbtjAxqYVjgnWQHG/y0xHf
 DQxDWD3++fkMmPm0r/qphOYzrg==
X-Google-Smtp-Source: AGHT+IG11Bi/mRBhDfKy0THZJZF2i1G5DvTYq/LLlYx7QWOIjfg/PRvY/W/ZQsjVrv5EUdlTx4Xmfw==
X-Received: by 2002:a5d:64ad:0:b0:32f:7b89:2675 with SMTP id
 m13-20020a5d64ad000000b0032f7b892675mr14751252wrp.65.1698918436780; 
 Thu, 02 Nov 2023 02:47:16 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 h11-20020a056000000b00b0031980783d78sm1953618wrx.54.2023.11.02.02.47.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 02:47:16 -0700 (PDT)
Date: Thu, 2 Nov 2023 10:47:15 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH v8 05/19] target/riscv/tcg: update priv_ver on user_set
 extensions
Message-ID: <20231102-bdcd40a9183dbbfe6667a304@orel>
References: <20231101204204.345470-1-dbarboza@ventanamicro.com>
 <20231101204204.345470-6-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231101204204.345470-6-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=ajones@ventanamicro.com; helo=mail-wr1-x42a.google.com
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

On Wed, Nov 01, 2023 at 05:41:50PM -0300, Daniel Henrique Barboza wrote:
> We'll add a new bare CPU type that won't have any default priv_ver. This
> means that the CPU will default to priv_ver = 0, i.e. 1.10.0.
> 
> At the same we'll allow these CPUs to enable extensions at will, but
> then, if the extension has a priv_ver newer than 1.10, we'll end up
> disabling it. Users will then need to manually set priv_ver to something
> other than 1.10 to enable the extensions they want, which is not ideal.
> 
> Change the setter() of multi letter extensions to allow user enabled
> extensions to bump the priv_ver of the CPU. This will make it
> conveniente for users to enable extensions for CPUs that doesn't set a
> default priv_ver.
> 
> This change does not affect any existing CPU: vendor CPUs does not allow
> extensions to be enabled, and generic CPUs are already set to priv_ver
> LATEST.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/tcg/tcg-cpu.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index f54069d06f..b88fce98a4 100644
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

This will ignore user input. If the user, for example, does

 -cpu rv64,priv_spec=v1.10.0,zicbom=on

then, afaict, priv_spec will be silently bumped to 1.12. I think we should
error out in that case instead. And, we should also error out for

 -cpu rv64,zicbom=on,priv_spec=v1.10.0

which means we should know when priv_spec is either

 - its default value
 - has been bumped by an extension
 - has been explicitly set by the user

> +}
> +
>  static void cpu_cfg_ext_auto_update(RISCVCPU *cpu, uint32_t ext_offset,
>                                      bool value)
>  {
> @@ -829,6 +845,10 @@ static void cpu_set_multi_ext_cfg(Object *obj, Visitor *v, const char *name,
>          return;
>      }
>  
> +    if (value) {
> +        cpu_validate_multi_ext_priv_ver(&cpu->env, multi_ext_cfg->offset);
> +    }

Some misa extensions also have priv spec version dependencies. See
riscv_cpu_validate_misa_priv()

> +
>      isa_ext_update_enabled(cpu, multi_ext_cfg->offset, value);
>  }
>  
> -- 
> 2.41.0
>

Thanks,
drew

