Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C6AC021B3
	for <qemu-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 15:12:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tlUh4-0004NT-2m; Fri, 21 Feb 2025 10:11:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1tlUh1-0004N4-ON
 for qemu-riscv@nongnu.org; Fri, 21 Feb 2025 10:11:55 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1tlUgz-0003Rq-VJ
 for qemu-riscv@nongnu.org; Fri, 21 Feb 2025 10:11:55 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-439a1e8ba83so21622815e9.3
 for <qemu-riscv@nongnu.org>; Fri, 21 Feb 2025 07:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1740150712; x=1740755512; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=yciegiRd+LvbEwQ5vXC+IuEx9Zab5j6SC3x5a/DKyr8=;
 b=SUig5Tx0knjCkixrzPaKPlDiTcfCt5shrqAI7oXb3EG8lWOMaNjh5zGR1+Q+JX/TY1
 BV+31KmD5euR5MleoYLt1ynvK+wCuJpzP9Hg9OPITH07FIFvPyVJ8j4pa0gRcvq3M/7h
 /iETv+NXQMTMlkoZ+HENVtBD6IFxcYNkpzTdoRtbIzU+A0mgHSpYP9qDKXL0yhnkP/Dc
 5iHUIp7+E3SIMJbfqHSpr2NJiAZwrCKw7RPXp7Tm7bMNK1HlmSskwfE3Lmpms6u8RVR6
 7tUbiI/5z0d4ftBeuEJEn0YZ6JFWzUrIW9LF/nB/tjO2eqjntWhBG74aaOhU79NK9dMp
 +w3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740150712; x=1740755512;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yciegiRd+LvbEwQ5vXC+IuEx9Zab5j6SC3x5a/DKyr8=;
 b=BGLj1HG9JqcwqC0KN7U7gwOM2ZtO0txCdmGLKyDUdcNoBQ4nwERCCO8SZasPG+c0ra
 om2XhAd22ankr4hwCGw62TWXOJn022SpwdXco4eXKglO+n22ksudZiWoR+lLm4RH3fbm
 j89eklOqrplMmB9O17tUptfN+2BTb5I7l+v0U5g7ftj/lEesE90aIhioLqD3uUSMFMjS
 gY0wqtME7DOkzJyzC+CkH+TXJgFixk/8cQqZxAUGHwdmGH+gx7ztaBn0WhcqHPruHO8r
 uhCULEa3Z11afbq+IDWuTr7bsDUkOLYMW5Ov4DK4TEz1U4XRDwNg5iCtoXhNWYOFf+uY
 A4ag==
X-Forwarded-Encrypted: i=1;
 AJvYcCWc2/wE+QPQTHXR+52e0/oy3gyEjbbyPjJlzaOzZERsZixDgWi/JwDjONmqGAIYOUF8aXJH2wf0UoAI@nongnu.org
X-Gm-Message-State: AOJu0Yx//L22kAIaLK4ksMcBREhuXoOyx4CcsQqj1JwWMSwCaVc62hd3
 YTFCTg8BUEguIEqrMs9QXrz9YFOnbNHkYiSHAG0eQrlovtDDJ2tm6NZd6w+s/2s=
X-Gm-Gg: ASbGncuiongGpHDxEKwlLpYkiu0COL50k/lu8RCEMnrYWRvaB1yveiUJodFfJ2X4e5M
 cxA3AXy8l4e+S/4Knwa53DoPvX9YInd9lGXZ5m/iOhZSHjO5C3Pa38H6yVrcxgGGDwdpeu3vVxz
 H+rM4z93txIUPfRmu1eBcZ7RIUA9TpKI6cj0Qk7Buh9aAABnzqerwKak8ocpuSDLEnsaqSG4s7N
 UYMLfIxNqSkFmIAfodfJ9vSWApScLPCoRxmFcv1AOEEq9xtkXDi0fVvWknTr11a/wSo7UjOquVL
 LvOHwtHIvQ4v+w==
X-Google-Smtp-Source: AGHT+IGFMc7EncM2bla39QtrC0GfMHh0z9w4a3HUhL5HqrENYI4DwJfPM7ygIE1goaiKhtdkWF4AUA==
X-Received: by 2002:a05:600c:5489:b0:439:86fb:7326 with SMTP id
 5b1f17b1804b1-439aebb5558mr23136145e9.22.1740150711748; 
 Fri, 21 Feb 2025 07:11:51 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::766e])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b030be5esm19965505e9.30.2025.02.21.07.11.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 07:11:51 -0800 (PST)
Date: Fri, 21 Feb 2025 16:11:50 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH v2 2/3] target/riscv/cpu.c: create flag for ziccrse
Message-ID: <20250221-679a2e65bfea6314820981df@orel>
References: <20250221141834.626722-1-dbarboza@ventanamicro.com>
 <20250221141834.626722-3-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221141834.626722-3-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x32a.google.com
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

On Fri, Feb 21, 2025 at 11:18:33AM -0300, Daniel Henrique Barboza wrote:
> At this moment ziccrse is a TCG always enabled named feature for
> priv_ver > 1.11 that has no exclusive flag. In the next patch we'll make
> the KVM driver update ziccrse as well, turning it on/off depending on
> host settings, but for that we'll need an ext_ziccrse flag in the CPU
> state.
> 
> Create an exclusive flag for it like we do with other named features.
> As with any named features we already have, it won't be exposed to
> users. TCG will keep the same restiction for it (always enabled if
> has_priv_1_11 is true) and KVM will be free to turn it on/off as
> required.

Reading this as "KVM can choose" makes it sound wrong, since KVM can't
choose. However, KVM will turn it on/off depending on whether this
extension is/isn't present. So reading it as "TCG always has it on, but
KVM will turn it off when the extension isn't available", makes more
sense.

> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu.c         | 3 ++-
>  target/riscv/cpu_cfg.h     | 3 +++
>  target/riscv/tcg/tcg-cpu.c | 2 ++
>  3 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 522d6584e4..fc4632ce36 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -105,7 +105,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
>      ISA_EXT_DATA_ENTRY(ziccamoa, PRIV_VERSION_1_11_0, has_priv_1_11),
>      ISA_EXT_DATA_ENTRY(ziccif, PRIV_VERSION_1_11_0, has_priv_1_11),
>      ISA_EXT_DATA_ENTRY(zicclsm, PRIV_VERSION_1_11_0, has_priv_1_11),
> -    ISA_EXT_DATA_ENTRY(ziccrse, PRIV_VERSION_1_11_0, has_priv_1_11),
> +    ISA_EXT_DATA_ENTRY(ziccrse, PRIV_VERSION_1_11_0, ext_ziccrse),
>      ISA_EXT_DATA_ENTRY(zicfilp, PRIV_VERSION_1_12_0, ext_zicfilp),
>      ISA_EXT_DATA_ENTRY(zicfiss, PRIV_VERSION_1_13_0, ext_zicfiss),
>      ISA_EXT_DATA_ENTRY(zicond, PRIV_VERSION_1_12_0, ext_zicond),
> @@ -1749,6 +1749,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_named_features[] = {
>      MULTI_EXT_CFG_BOOL("zic64b", ext_zic64b, true),
>      MULTI_EXT_CFG_BOOL("ssstateen", ext_ssstateen, true),
>      MULTI_EXT_CFG_BOOL("sha", ext_sha, true),
> +    MULTI_EXT_CFG_BOOL("ziccrse", ext_ziccrse, true),
>  
>      { },
>  };
> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> index 3f3c1118c0..8a843482cc 100644
> --- a/target/riscv/cpu_cfg.h
> +++ b/target/riscv/cpu_cfg.h
> @@ -166,6 +166,9 @@ struct RISCVCPUConfig {
>      bool has_priv_1_12;
>      bool has_priv_1_11;
>  
> +    /* Always enabled for TCG if has_priv_1_11 */
> +    bool ext_ziccrse;
> +
>      /* Vendor-specific custom extensions */
>      bool ext_xtheadba;
>      bool ext_xtheadbb;
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index ea8d77d06a..c93612b1da 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -360,6 +360,8 @@ static void riscv_cpu_update_named_features(RISCVCPU *cpu)
>  
>      cpu->cfg.ext_sha = riscv_has_ext(&cpu->env, RVH) &&
>                         cpu->cfg.ext_ssstateen;
> +
> +    cpu->cfg.ext_ziccrse = cpu->cfg.has_priv_1_11;
>  }
>  
>  static void riscv_cpu_validate_g(RISCVCPU *cpu)
> -- 
> 2.48.1
>

Other than my hangup on the commit message,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

