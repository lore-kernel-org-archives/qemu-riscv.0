Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 654E1C021AA
	for <qemu-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 12:39:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tlSIv-00014V-Ds; Fri, 21 Feb 2025 07:38:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1tlSIr-00013m-4W
 for qemu-riscv@nongnu.org; Fri, 21 Feb 2025 07:38:49 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1tlSIp-0000am-9N
 for qemu-riscv@nongnu.org; Fri, 21 Feb 2025 07:38:48 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43989226283so14149385e9.1
 for <qemu-riscv@nongnu.org>; Fri, 21 Feb 2025 04:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1740141523; x=1740746323; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rf3LUmAuDPqJgdA5v98FsidszCrYagrk7k6Bkr042IE=;
 b=Rx+fekJlSNO2RMMgXBx0xkPC1km4QQ/1SN2cbpNCdrd8xJ0rC+5zJsO+/PxHxnsXab
 gVqPtrb59e9vTsytiP1Vu3qJ0VBi5yrqiPrbk5F+7vEzSU4UIlbjoijiDTn//57EH1Ng
 93APwzCVeo1uIlAiVNiORE6V4DHcjjeXA150cOlu3sGUtRtsfynuicUIO6huO3aCvqrO
 Omitdmg3yBfiBgaDtdfAB96oZ+QcBY2KtJMxB3TXjYBVOPksntXHX5N2Y8gQpja8dgIB
 1nCIgbAJgn0MayCh1Uad08E7afwlpBH0GQG1N0xpCSYgdyWRwE6E9idqteC5nPqWG4j9
 QgCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740141523; x=1740746323;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rf3LUmAuDPqJgdA5v98FsidszCrYagrk7k6Bkr042IE=;
 b=bEFPEWkKQOYj7DiT4msg1t53CPW8ZsCUT2XaaMmDWHGqzKW0SuJyQGLNLIeyT4VFwU
 L1IFAWU1UmFiZ4Jw5XWhsqj4NAOEmovJpb5jrW8oo3DIJGlpQMrxGWOBmFwuHkxC1xqL
 8IxdkuJkog9hUrjfPKihpzVvOTLPxTefVNUrvGaDuaqGBdT7qSgsnS5z8qtf4VNg1x1F
 C4qrhSg3EGsKW1XGWCCWGSycKqO3lrwcPAY31y1nS7sAA4V8yOYA/z6wvA0DuF/iYyGK
 h5/IxMa3yfbZzDNByZ/KbeqA2ty38Yp7Jb2eEtBbLdShiBhHJxjhDxJxeAIj8wxUp7xo
 86bA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuzwuTbOBLXh7F9pJ2GvsU4E7RmpT9/zeHYEWmD71RV4HfnKEuc6lkqFeiuG/FIsWotA/tPqIsuU9/@nongnu.org
X-Gm-Message-State: AOJu0Yxh44093vjedw8A0H5f1OrFTxGuLGoEQ8+sDoUFZHNTYcKKneFb
 lU6MgS6/axzm8FQBX6v44FDlli1P7EsTLbeNpjAew4+TfXczk+aZJxILpOmw4wU=
X-Gm-Gg: ASbGncs190PiCXLLccxaXe0geLlZda0sfe/p6ldLqzEbsjwOKHM4gh7UDsjkcR0Sd82
 ZSzagLLCIFq4Hv6oABtI1IXtna500svLZ+6oUcPh8270pv1PI3+lBneOvZJfRDkm744inDpviKX
 S8XL+LiL3HCEE2/BaY4iqGH15gj5MEzbfcFbMZJuihJ1URLiDWLlR6hI9dd+J2+dqejd3QdiMry
 DfRpX0rJ5O4vnSNzEbYTmJQIrTx4thZC01iYQlqlUS4+uTU7772RNERJYhB12elYLMePFVz5UBD
 cFCduDr1eRqDlQ==
X-Google-Smtp-Source: AGHT+IG30wzaMx/KSG+h/RJ+yZ5re4V0NcEowIG61whhJodnXroUnREW+JG3WHsCKEozgecLx2ny4g==
X-Received: by 2002:adf:f3c9:0:b0:38f:2b59:3f78 with SMTP id
 ffacd0b85a97d-38f6f0ac5a3mr2318123f8f.45.1740141523499; 
 Fri, 21 Feb 2025 04:38:43 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::766e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258ddba7sm23600061f8f.38.2025.02.21.04.38.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 04:38:43 -0800 (PST)
Date: Fri, 21 Feb 2025 13:38:42 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH 2/3] target/riscv/cpu.c: create flag for ziccrse
Message-ID: <20250221-b980af795e562471da881f9d@orel>
References: <20250218163854.425607-1-dbarboza@ventanamicro.com>
 <20250218163854.425607-3-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218163854.425607-3-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x332.google.com
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

On Tue, Feb 18, 2025 at 01:38:53PM -0300, Daniel Henrique Barboza wrote:
> At this moment ziccrse is a TCG always enable ext that has no flag. KVM
> will expose ziccrse to users, allowing them to turn it on/off.

KVM won't allow this to be disabled, since it can't be (there's no way
to turn off the behavior or fake that it's not there for the guest.)

The reason KVM has added it to its ISA extension list is to inform a
VMM that the extension is present on the current host, which may be
of interest when determining migration targets (especially since it
can't be disabled.)

> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu.c     | 5 +++++
>  target/riscv/cpu_cfg.h | 3 +++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 522d6584e4..0b8d2c0c25 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1711,6 +1711,11 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
>      MULTI_EXT_CFG_BOOL("zvksc", ext_zvksc, false),
>      MULTI_EXT_CFG_BOOL("zvksg", ext_zvksg, false),
>  
> +    /*
> +     * KVM can turn it on/off. For TCG this is always
> +     * enabled if priv_ver >= 1.11.
> +     */
> +    MULTI_EXT_CFG_BOOL("ziccrse", ext_ziccrse, true),
>      { },
>  };
>  
> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> index 3f3c1118c0..88565e29fd 100644
> --- a/target/riscv/cpu_cfg.h
> +++ b/target/riscv/cpu_cfg.h
> @@ -157,6 +157,9 @@ struct RISCVCPUConfig {
>      bool ext_ssstateen;
>      bool ext_sha;
>  
> +    /* Always enabled for TCG, KVM wants to switch it on/off */
> +    bool ext_ziccrse;
> +
>      /*
>       * Always 'true' booleans for named features
>       * TCG always implement/can't be user disabled,
> -- 
> 2.48.1
> 
>

I would just drop all the comments from this patch and reword the commit
message to state something along the lines of what I did.

Thanks,
drew

