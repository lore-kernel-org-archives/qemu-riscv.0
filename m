Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99DA2C61D97
	for <qemu-riscv@archiver.kernel.org>; Fri, 24 Nov 2023 09:24:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r6SPs-0001wY-Q0; Fri, 24 Nov 2023 04:24:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1r6SPr-0001wO-93
 for qemu-riscv@nongnu.org; Fri, 24 Nov 2023 04:24:03 -0500
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1r6SPp-0006o2-Iz
 for qemu-riscv@nongnu.org; Fri, 24 Nov 2023 04:24:03 -0500
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-507a0907896so2162046e87.2
 for <qemu-riscv@nongnu.org>; Fri, 24 Nov 2023 01:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1700817839; x=1701422639; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9pxljqwO+woALFQ41UDByycJRL0z5czCfgCEDhXSk4g=;
 b=DxWKKDS26zXx33Pg+BINAlKbIUaMOeSpbDKkeaoUEbgAOcazm/KbaJzJMWubOxRDc3
 nCrnM8qS8LZUAEqs9ol/2ydwS9Zb4LFURtr3Rk1BhbHvkdJsuH5Twv4kZb30PIkhmeNi
 Jv5UEot8BhuMDGYLk6MYskXKBBOeTFaQ9utgK+EUpLAFox9EOuAQpA8pwKKGKh8brwwb
 PRe9pNsrSmtLh+L9mKP9Wwl3acVFmp70DGSPGo3k6pXoaysFTZANVlJzk6xzoGSdIBsl
 pxyROzOu5y6c5+aReeEnlOARcSIfBZBsB90gV17mKC3MOXTGYVGpTpN/OUd2CWfB/z6U
 73YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700817839; x=1701422639;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9pxljqwO+woALFQ41UDByycJRL0z5czCfgCEDhXSk4g=;
 b=eV/kwpJPzg0T38i6Tge+zdKmh5AkUFGsxpPgOHQW5fX1BnqwpMPpPi8DNbR3ODsWfG
 hrk0fmL1yTf4+R6CbYsokXDQOD2Dk/sYw6KEo52OkrRjwy9Km4MN9Ru8+nKlW99LpUx2
 XwYfgSG81pNhJZT+Jte+xE3j8iHESz4Muc3ydfUsC+0mqxnbm3IYNwRk+5P8BqOJsshV
 pA2suBe1VYO3zCNbiuZ/8LEwaBIEOZfahqy+FrJlc+/L8HROVbBOAjEeEcibRE/4Siy5
 m0i2OpeN9noELacJX+NJfS8yEDLbr/Gby04mfrvFlsTdGuBMyPlD8TBB0bU6GaCVMJR+
 FpnA==
X-Gm-Message-State: AOJu0YymLlr12CW8hpQ71dsfAffYq3neaKR7TH6OaFRaOf8xedhI5SHN
 sz+JiMfehAt/8z4XAwegYS1gpQ==
X-Google-Smtp-Source: AGHT+IFdkZa+lc4uMsvr7nCqf6SCgYL2QWrnqk2BRAZQXuNrZ0tKYw1Ub54jURyEhqY+w0hWEhIpyg==
X-Received: by 2002:a19:6449:0:b0:507:c507:c9b6 with SMTP id
 b9-20020a196449000000b00507c507c9b6mr1322672lfj.41.1700817839265; 
 Fri, 24 Nov 2023 01:23:59 -0800 (PST)
Received: from localhost (cst-prg-91-180.cust.vodafone.cz. [46.135.91.180])
 by smtp.gmail.com with ESMTPSA id
 f10-20020a5d568a000000b0032d9caeab0fsm3863635wrv.77.2023.11.24.01.23.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 01:23:58 -0800 (PST)
Date: Fri, 24 Nov 2023 10:23:57 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH for-9.0 v11 03/18] target/riscv/tcg: update priv_ver on
 user_set extensions
Message-ID: <20231124-92b499e54aa4a447386fac16@orel>
References: <20231123185122.1100436-1-dbarboza@ventanamicro.com>
 <20231123185122.1100436-4-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231123185122.1100436-4-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=ajones@ventanamicro.com; helo=mail-lf1-x136.google.com
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

On Thu, Nov 23, 2023 at 03:51:07PM -0300, Daniel Henrique Barboza wrote:
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
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  target/riscv/tcg/tcg-cpu.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 7670120673..d279314624 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -114,6 +114,26 @@ static int cpu_cfg_ext_get_min_version(uint32_t ext_offset)
>      g_assert_not_reached();
>  }
>  
> +static void cpu_validate_multi_ext_priv_ver(CPURISCVState *env,
> +                                            uint32_t ext_offset)

We should probably name this cpu_bump_multi_ext_priv_ver(). "validate"
implies we're checking something and either returning an error when it's
not what we expect or asserting on unexpected input. We do neither here,
we just bump priv_ver, when necessary.

Thanks,
drew

