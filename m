Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A1A6C47DB7
	for <qemu-riscv@archiver.kernel.org>; Thu, 18 Jan 2024 19:42:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rQYGS-0002e9-Oe; Thu, 18 Jan 2024 14:41:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rQYGR-0002dU-68
 for qemu-riscv@nongnu.org; Thu, 18 Jan 2024 14:41:23 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rQYGP-0006XG-L6
 for qemu-riscv@nongnu.org; Thu, 18 Jan 2024 14:41:22 -0500
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1d70a986c4aso6431705ad.2
 for <qemu-riscv@nongnu.org>; Thu, 18 Jan 2024 11:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1705606880; x=1706211680; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=usspFBKywOw8fllJNpcM3QaLm4KpNoYCxn3eBYMKHas=;
 b=XymdScAqv3xwZb5n8MHTJ0t93yYj4pC4cDfW7BQP6HzF8lveNlejhTHd7CTcVsfKgr
 BgDM2JxySJwScDw4TTbbU+TS7Qjt7Ffo9kxqWnYdJ3VZsvIMI4sawaklttshCsXIyZcf
 PCmjIdroabu2CP2qvuFoxWcI0KAXW473DGFtbIoHTC4KgOGnaNyVPRX2P9Cy6VaVis8D
 Cr0ibilqSAN7UD+kC3jfezqtRxJ30PwfMaPD9+Dn0cE/WuzF16wrSi8nS8eg9nCAwdhC
 yRY65/YXYfl9mTfKhErYm1ZH4RenBw2sqYsVFkwH+6dQYfFJ7lk5RfFtRasezz/aaoN7
 Tgxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705606880; x=1706211680;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=usspFBKywOw8fllJNpcM3QaLm4KpNoYCxn3eBYMKHas=;
 b=AVTP9U6UMm3jqfke1V+++jQvr33pnxc3qmwHwfjMXuyizCltzuC4O+emJmdBgTvydH
 tHYJyZnVIvXocW4BcEk9XFv0V77BmeshjcQtQ6enZ6UTANgjqC2+mJaX6js1DNR+w34A
 QUve+IpyGJCwDRLqYRv/7DQPzMwF6+Xvb8F5AU3ukBJuc2dGGzakufbkQwZih0PfhMD4
 5VbD07J34FS3Epf0ZLtnOjQchBFFKQlY6Lg/tl54slO7Vl0cV9Xe/3VSNquGEqYiotyk
 jvo01XAc0Psmv99p5MnHw4V3cyILD1esRymEaPUIMdT0aUrxFD9YjBSKQekcTdnrT8mj
 +pPQ==
X-Gm-Message-State: AOJu0YwR/9n1035E/8J2xXLM5kC5T3R2QyTcPzddMr0uWp4K7kHVYxty
 J614O4CI/VoY9QZGOP6PDhyy0zodChQKlbJSeeSuhAkNUw9qRZ7fxQWLXbRoizM=
X-Google-Smtp-Source: AGHT+IG3MLmHSsi/Uh+W1zhP7RMh8Mg0hlqRVB/wymSsxaVBg9R+TBI/dh0zKeGCkX1hz9kUJEBbyA==
X-Received: by 2002:a17:903:41cd:b0:1d5:36a9:10da with SMTP id
 u13-20020a17090341cd00b001d536a910damr1901823ple.57.1705606879963; 
 Thu, 18 Jan 2024 11:41:19 -0800 (PST)
Received: from ?IPV6:2804:7f0:bdcd:fb00:6501:2693:db52:c621?
 ([2804:7f0:bdcd:fb00:6501:2693:db52:c621])
 by smtp.gmail.com with ESMTPSA id
 v13-20020a170903238d00b001d5e03543dcsm1751477plh.38.2024.01.18.11.41.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jan 2024 11:41:19 -0800 (PST)
Message-ID: <38ed5f18-c39d-4fd8-8b25-56d2fc2e34cc@ventanamicro.com>
Date: Thu, 18 Jan 2024 16:41:16 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] target/riscv: Add Zaamo and Zalrsc extensions
Content-Language: en-US
To: Rob Bradford <rbradford@rivosinc.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, atishp@rivosinc.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com
References: <20240115162525.63535-1-rbradford@rivosinc.com>
 <20240115162525.63535-2-rbradford@rivosinc.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20240115162525.63535-2-rbradford@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x62f.google.com
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



On 1/15/24 13:25, Rob Bradford wrote:
> These extensions represent the atomic operations from A (Zaamo) and the
> Load-Reserved/Store-Conditional operations from A (Zalrsc)
> 
> Signed-off-by: Rob Bradford <rbradford@rivosinc.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/cpu.c     | 5 +++++
>   target/riscv/cpu_cfg.h | 2 ++
>   2 files changed, 7 insertions(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 8d3ec74a1c..604baf53c8 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -103,7 +103,9 @@ const RISCVIsaExtData isa_edata_arr[] = {
>       ISA_EXT_DATA_ENTRY(zihintpause, PRIV_VERSION_1_10_0, ext_zihintpause),
>       ISA_EXT_DATA_ENTRY(zihpm, PRIV_VERSION_1_12_0, ext_zihpm),
>       ISA_EXT_DATA_ENTRY(zmmul, PRIV_VERSION_1_12_0, ext_zmmul),
> +    ISA_EXT_DATA_ENTRY(zaamo, PRIV_VERSION_1_12_0, ext_zaamo),
>       ISA_EXT_DATA_ENTRY(zacas, PRIV_VERSION_1_12_0, ext_zacas),
> +    ISA_EXT_DATA_ENTRY(zalrsc, PRIV_VERSION_1_12_0, ext_zalrsc),
>       ISA_EXT_DATA_ENTRY(zawrs, PRIV_VERSION_1_12_0, ext_zawrs),
>       ISA_EXT_DATA_ENTRY(zfa, PRIV_VERSION_1_12_0, ext_zfa),
>       ISA_EXT_DATA_ENTRY(zfbfmin, PRIV_VERSION_1_12_0, ext_zfbfmin),
> @@ -1491,6 +1493,9 @@ const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[] = {
>       MULTI_EXT_CFG_BOOL("x-smaia", ext_smaia, false),
>       MULTI_EXT_CFG_BOOL("x-ssaia", ext_ssaia, false),
>   
> +    MULTI_EXT_CFG_BOOL("x-zaamo", ext_zaamo, false),
> +    MULTI_EXT_CFG_BOOL("x-zalrsc", ext_zalrsc, false),
> +
>       MULTI_EXT_CFG_BOOL("x-zvfh", ext_zvfh, false),
>       MULTI_EXT_CFG_BOOL("x-zvfhmin", ext_zvfhmin, false),
>   
> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> index fea14c275f..cc4c30244c 100644
> --- a/target/riscv/cpu_cfg.h
> +++ b/target/riscv/cpu_cfg.h
> @@ -78,7 +78,9 @@ struct RISCVCPUConfig {
>       bool ext_svnapot;
>       bool ext_svpbmt;
>       bool ext_zdinx;
> +    bool ext_zaamo;
>       bool ext_zacas;
> +    bool ext_zalrsc;
>       bool ext_zawrs;
>       bool ext_zfa;
>       bool ext_zfbfmin;

