Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C7EC83F01
	for <qemu-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 14:02:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qbiFl-0001tD-8y; Thu, 31 Aug 2023 10:02:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qbiFe-0001qt-D9
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 10:02:27 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qbiFb-0008J5-UZ
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 10:02:26 -0400
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-99c0cb7285fso93678166b.0
 for <qemu-riscv@nongnu.org>; Thu, 31 Aug 2023 07:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1693490542; x=1694095342; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=cFOhxS2SW2fXYN/hI6LPuyg987kqge5H+I9asuckniY=;
 b=TNpzt2nzqCVBL4dUMw03vbDr1himTpP5Ja+jFAqte2kMhPIeTygahsTmvqkjlqYu6a
 LPxHagaZ+OQFlEYZhqUgMULSn2IMuNXCVksOLFtn7o4nJp1M00n+4a2z6rXSqHeIABco
 nDSMO+FMk34uC2+v5Q9hEFLofYIfZ/LCVQhWHWcq9aVUqsU6ttrmNdGGFFWTIR2q4Z54
 VdH4TfY63gMFwg9AkfaFIVwhOXgcxZXkVGkCJTvyiweNr2qhW0ronJ+HEtePHw5WVcaX
 nAw3Hd+DRTH30l8Yc2RdBzajcbjkFDsxKVeVoXGM4ymI+dQbSycaB13dT4TxHSUMTfxN
 APHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693490542; x=1694095342;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cFOhxS2SW2fXYN/hI6LPuyg987kqge5H+I9asuckniY=;
 b=VjWUVBx8QaeIJoKwje0GxwvUwPedzWMYTMDUYdVqT1vH6PJDwmi9mI7G/S4O2oHHpQ
 Spa4QhtIW2PolNMgfes9se4QA6Nv7sHs4rZ48KAwim/tQYJWw+5kYU7WN6J35Y+Mmzcv
 lIAsWQvlzNfOlYhtgFkl1oHRBI+fefvh4Z/Tqdqy2BNYDiJ/HbK4HKCkxS/nignuS3xW
 9s0d4v+ZWGBXpNqx/Fi16r8OkRo8Dq0tk0bfZfsSRhF+SWVvDf7pts2f5xHoqRHflaZu
 j+erG5KRFhe/OQbU7u8Mj9SvO9/RCJIK6dRjAbxQQKPT4v9MAzvRbqTQ6dNqRCY8qy2z
 3dpQ==
X-Gm-Message-State: AOJu0YzRbhcjQ1fNkRI4av72JqbjVUU1WmXTzkWjS9Sq3iBsWhYJRDId
 ukropsVlqlw2pjkdrps+/98a5g==
X-Google-Smtp-Source: AGHT+IGOKLX0K4RJv8mObIY8VkMUTfnJt+KjSEeGxNA9jANm6SC7uasLxii5iK7UIx4VzB/ed2UqBw==
X-Received: by 2002:a17:906:76c1:b0:9a1:bcf9:4f99 with SMTP id
 q1-20020a17090676c100b009a1bcf94f99mr3853825ejn.36.1693490541698; 
 Thu, 31 Aug 2023 07:02:21 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 f27-20020a170906391b00b0099cd1c0cb21sm772792eje.129.2023.08.31.07.02.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Aug 2023 07:02:21 -0700 (PDT)
Date: Thu, 31 Aug 2023 16:02:20 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH RESEND v8 20/20] target/riscv/cpu.c: consider user option
 with RVG
Message-ID: <20230831-4464df075538419005400c02@orel>
References: <20230824221440.484675-1-dbarboza@ventanamicro.com>
 <20230824221440.484675-21-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230824221440.484675-21-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x62b.google.com
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

On Thu, Aug 24, 2023 at 07:14:40PM -0300, Daniel Henrique Barboza wrote:
> Enabling RVG will enable a set of extensions that we're not checking if
> the user was okay enabling or not. And in this case we want to error
> out, instead of ignoring, otherwise we will be inconsistent enabling RVG
> without all its extensions.
> 
> After this patch, disabling ifencei or icsr while enabling RVG will
> result in error:
> 
> $ ./build/qemu-system-riscv64 -M virt -cpu rv64,g=true,Zifencei=false --nographic
> qemu-system-riscv64: warning: Setting G will also set IMAFD_Zicsr_Zifencei
> qemu-system-riscv64: RVG requires Zifencei but user set Zifencei to false

The warning makes it sound like Zifencei is getting overridden, but then
the error says "nope". So I think...

> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.c | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index e07b2c73e7..21ebdbf084 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1155,8 +1155,22 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>            riscv_has_ext(env, RVD) &&
>            cpu->cfg.ext_icsr && cpu->cfg.ext_ifencei)) {
>          warn_report("Setting G will also set IMAFD_Zicsr_Zifencei");

...we want to move this warning down below the checks and we should even
check if it should be issued with

 if (!cpu->cfg.ext_icsr || !cpu->cfg.ext_ifencei || !cpu->cfg.a || ...)
    warn_report(...)

> -        cpu->cfg.ext_icsr = true;
> -        cpu->cfg.ext_ifencei = true;
> +
> +        if (cpu_cfg_ext_is_user_set(CPU_CFG_OFFSET(ext_icsr)) &&
> +            !cpu->cfg.ext_icsr) {
> +            error_setg(errp, "RVG requires Zicsr but user set Zicsr to false");
> +            return;
> +        }
> +
> +        if (cpu_cfg_ext_is_user_set(CPU_CFG_OFFSET(ext_ifencei)) &&
> +            !cpu->cfg.ext_ifencei) {
> +            error_setg(errp, "RVG requires Zifencei but user set "
> +                       "Zifencei to false");
> +            return;
> +        }
> +
> +        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_icsr), true);
> +        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_ifencei), true);
>  
>          env->misa_ext |= RVI | RVM | RVA | RVF | RVD;
>          env->misa_ext_mask |= RVI | RVM | RVA | RVF | RVD;
> -- 
> 2.41.0
> 
>

Thanks,
drew

