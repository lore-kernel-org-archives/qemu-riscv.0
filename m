Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06FAFC0032E
	for <qemu-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 23:48:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qvnbs-0007zC-Nh; Wed, 25 Oct 2023 19:48:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qvnbc-0007lS-Ea
 for qemu-riscv@nongnu.org; Wed, 25 Oct 2023 19:48:09 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qvnbZ-0002nT-I6
 for qemu-riscv@nongnu.org; Wed, 25 Oct 2023 19:48:08 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1c9a1762b43so2090845ad.1
 for <qemu-riscv@nongnu.org>; Wed, 25 Oct 2023 16:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698277683; x=1698882483; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zGmpFEe24xeT/GOBUv2FyL1Q7AjXTnEK8MVowHI07hA=;
 b=wRP7lyohbpBVkEkn0bXWnYOprJbP5WZWDxfohz/qx8s1cTH2fPcEwelLajHKgzK/o8
 pIjjgGsu3xmgBKdFtgCaBek9QyfP1COUrmjfKWQG++F0gM5RcA2GN9kY9nmdzEcukgz6
 XOTsDvCyPceQ4/oA/IxorAHCTWLxw0HszJV50F5LhFlAC3K7hIvOBJqETO8yhsOxrfMW
 4FuA0nqCgsd6EbdhNGZTEDRmFqIdGv3j6YZ2aXmAZ5UUBu9rdLxiTiuDl3GC/PEMGDx4
 UolzKLRCIBzszbmjFUk9pWLNTzYpimrpa7IxYGjbnfwItgFwkostXox11zZ3HoQ8yTLq
 ySfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698277683; x=1698882483;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zGmpFEe24xeT/GOBUv2FyL1Q7AjXTnEK8MVowHI07hA=;
 b=DI0/XCOb3mhXOuQZtmbMap8ACwAvhuLpRzBGaqQsepsasjRMVXqTXoJvbFsQ0qbrjE
 HcSRBWdjQ/NMlxMdYBDQft3gEHf4jbNUO3iF07BBsbHBBOdt/KJRuq2qB/LyfPB+oOVf
 +Ao5neBKfjTN4uuKKXs++EPZntbiFiNV1bXkx49XrKpie2JkZNbtAYmzyb+TVONgEZw8
 4BzPIYdDqBTfFGlGrI7MDJY4Ar3AaOOZiBrM2XBmogf5UzwYJnoSV/fkzRRINZitQVP5
 nqjDNOH10UCZYAhvjiX6toKtyk27P0MkDj7l4WQquDKdmKuE8R/zEavaiGwta7VVESFF
 WcxQ==
X-Gm-Message-State: AOJu0Yy7hW0XfnXNX3iRCNDaXM46qNdo9HV06IEvaHXxZyXrb8q53xvL
 wwgoNTSEa0Slsa0v2tXW8KbdwQ==
X-Google-Smtp-Source: AGHT+IFy/jn7HnCd7myAjPFpHYNtQ4VGtGz3QUosjrrBAzu5Stsi2NAGwWDtuWydomYvcGGOFmdwBg==
X-Received: by 2002:a17:902:c1ca:b0:1ca:8419:1857 with SMTP id
 c10-20020a170902c1ca00b001ca84191857mr14282699plc.47.1698277683289; 
 Wed, 25 Oct 2023 16:48:03 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.149.95])
 by smtp.gmail.com with ESMTPSA id
 ji18-20020a170903325200b001c99b3a1e45sm9789424plb.84.2023.10.25.16.48.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Oct 2023 16:48:02 -0700 (PDT)
Message-ID: <585e307c-5c08-4bee-a9d3-2965c4be494f@linaro.org>
Date: Wed, 25 Oct 2023 16:48:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/9] target/riscv: add rva22u64 profile definition
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
References: <20231025135001.531224-1-dbarboza@ventanamicro.com>
 <20231025135001.531224-2-dbarboza@ventanamicro.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231025135001.531224-2-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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

On 10/25/23 06:49, Daniel Henrique Barboza wrote:
> +/* Optional extensions left out: RVV, zfh, zkn, zks */
> +static RISCVCPUProfile RVA22U64 = {

const.

> +    .name = "rva22u64",
> +    .misa_ext = RVI | RVM | RVA | RVF | RVD | RVC,
> +    .ext_offsets = {
> +        CPU_CFG_OFFSET(ext_zicsr), CPU_CFG_OFFSET(ext_zihintpause),
> +        CPU_CFG_OFFSET(ext_zba), CPU_CFG_OFFSET(ext_zbb),
> +        CPU_CFG_OFFSET(ext_zbs), CPU_CFG_OFFSET(ext_zfhmin),
> +        CPU_CFG_OFFSET(ext_zkt), CPU_CFG_OFFSET(ext_zicntr),
> +        CPU_CFG_OFFSET(ext_zihpm), CPU_CFG_OFFSET(ext_zicbom),
> +        CPU_CFG_OFFSET(ext_zicboz),
> +
> +        RISCV_PROFILE_EXT_LIST_END
> +    }
> +};
> +
> +RISCVCPUProfile *riscv_profiles[] = {
> +    &RVA22U64, NULL,
> +};

const RISCVCPUProfile * const riscv_profiles[]


r~

