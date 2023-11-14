Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DF1AC4332F
	for <qemu-riscv@archiver.kernel.org>; Tue, 14 Nov 2023 11:21:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r2rTK-0003w4-C5; Tue, 14 Nov 2023 06:20:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r2rTJ-0003tT-2q
 for qemu-riscv@nongnu.org; Tue, 14 Nov 2023 06:20:45 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1r2rTG-0001HX-5b
 for qemu-riscv@nongnu.org; Tue, 14 Nov 2023 06:20:44 -0500
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1cc5b6d6228so34609795ad.2
 for <qemu-riscv@nongnu.org>; Tue, 14 Nov 2023 03:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1699960841; x=1700565641; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nuOCvN68DpIA+eH3/8+OASw2MwSNBc35QJvzI7sI8RQ=;
 b=ieD0P+05OQtittRbJIC22SXZNT4KLazIk9HikWwszEMquqjFSRr0+0puHzb2vkMqKG
 YCEsumbYsuppBgYaOIDLnXPCFZcKaHGVxaDp9OEqFWmWfaN0yZrlcUbG9fxmpjN+6zyM
 kkDzGgTpqJ8i07BadlePMtIPqCvNULfkpkw4cIWJqdrbiH2IXUejouRrA6tztkRQ1x9L
 AnuVJxQOQPyTpIzshgWx3DJmiK9/HMlcG21/OVotY7LwY1AwcWbnVW2PIm1wWdBgrc62
 1pTHdCH9UG2jSCE+nT1nv978mCj0H6XurgH7GQzwzOEGpfK2O0XAKot+ZdsVzA+vONSH
 M+dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699960841; x=1700565641;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nuOCvN68DpIA+eH3/8+OASw2MwSNBc35QJvzI7sI8RQ=;
 b=B6a+Ae+b0qsTG7id/7y+f3bIfecAA7jqhA2ER3YTEUBIBXm2jz1i4qloOCO8seSghZ
 g8ZiPnEy8Fymery0hxchgNcw4GCK4Bdnq0kpYvBQyBb6JC/AyHn+Py/TZADzOGpkXDa4
 1n2pxkgITO/Kh/rD+9XRlCKHMv2+k9dkdPvf84kg37fYYrAwA+1wqCYCRmDgM1wathDq
 06KZ6hXlxRmkGlQI1mIgkgLWEIazwVx9o8mDlA4q3ZyKbZh3quPdOLDxbSCHnKQ50Gz7
 hWUHYIX+nAJ/M0IWZYURo+SeVde8QsrfOOCMyaek5aBkK3b18+BRLnfABW3YdtL6Q019
 46+A==
X-Gm-Message-State: AOJu0YzjdHu+U0r12PiCCyQvNL+BK/rA7dV29IUbUUAyfdKnl/jiQWUf
 HCZTUCpLcSTN06zP/5ObZ/FpLw==
X-Google-Smtp-Source: AGHT+IFTtqMvc/RKc+BMTfF6Ff90wBrCOgjVX3blDfQm+ZIt6J30cbyOrbUorrKSDf7vdIG84Z6RNw==
X-Received: by 2002:a17:902:f685:b0:1cc:dade:2784 with SMTP id
 l5-20020a170902f68500b001ccdade2784mr1943810plg.22.1699960840636; 
 Tue, 14 Nov 2023 03:20:40 -0800 (PST)
Received: from ?IPV6:2804:7f0:bcc0:f7fc:9d46:b65e:128d:39a8?
 ([2804:7f0:bcc0:f7fc:9d46:b65e:128d:39a8])
 by smtp.gmail.com with ESMTPSA id
 l12-20020a170903244c00b001c877f27d1fsm5473588pls.11.2023.11.14.03.20.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Nov 2023 03:20:40 -0800 (PST)
Message-ID: <6439d06c-7b9b-4fe7-83dd-a33be98ef98e@ventanamicro.com>
Date: Tue, 14 Nov 2023 08:20:35 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: don't verify ISA compatibility for zicntr
 and zihpm
To: =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng@tinylab.org>
References: <20231114094412.413408-1-chigot@adacore.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20231114094412.413408-1-chigot@adacore.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

(adding maintainers in the CC)



On 11/14/23 06:44, Clément Chigot wrote:
> The extensions zicntr and zihpm were officially added in the privilege
> instruction set specification 1.12. However, QEMU has been implemented
> them long before it and thus they are forced to be on during the cpu
> initialization to ensure compatibility (see riscv_cpu_init).
> riscv_cpu_disable_priv_spec_isa_exts was not updated when the above
> behavior was introduced, resulting in these extensions to be disabled
> after all.
> 

Please add the following tags:

Fixes: c004099330 ("target/riscv: add zicntr extension flag for TCG")
Fixes: 0824121660 ("target/riscv: add zihpm extension flag for TCG")

> Signed-off-by: Clément Chigot <chigot@adacore.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>


>   target/riscv/tcg/tcg-cpu.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 08adad304d..8a35683a34 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -250,6 +250,15 @@ static void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
>       for (edata = isa_edata_arr; edata && edata->name; edata++) {
>           if (isa_ext_is_enabled(cpu, edata->ext_enable_offset) &&
>               (env->priv_ver < edata->min_version)) {
> +            /*
> +             * These two extensions are always enabled as they were supported
> +             * by QEMU before they were added as extensions in the ISA.
> +             */
> +            if (!strcmp(edata->name, "zicntr") ||
> +                !strcmp(edata->name, "zihpm")) {
> +                continue;
> +            }
> +
>               isa_ext_update_enabled(cpu, edata->ext_enable_offset, false);
>   #ifndef CONFIG_USER_ONLY
>               warn_report("disabling %s extension for hart 0x" TARGET_FMT_lx

