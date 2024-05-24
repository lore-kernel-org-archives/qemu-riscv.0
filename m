Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B87F7C25B74
	for <qemu-riscv@archiver.kernel.org>; Fri, 24 May 2024 11:38:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sATFV-0002qN-B8; Fri, 24 May 2024 07:38:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1sATFU-0002q3-95
 for qemu-riscv@nongnu.org; Fri, 24 May 2024 07:38:12 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1sATFS-0000bf-Gh
 for qemu-riscv@nongnu.org; Fri, 24 May 2024 07:38:11 -0400
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-6818811cb8aso533607a12.0
 for <qemu-riscv@nongnu.org>; Fri, 24 May 2024 04:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1716550689; x=1717155489; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eHPNtf/9KE2zXS08pwcc/KMZf+/Pjc5+PlR1+CFrP0o=;
 b=hCRm6Tfn5rBgyEbDe4U9KGsV/WYCEwcoQ2nazNMXn+iY68bqE2hwA8kKIOWdgtu4rY
 Uzx/kWkxlJ8bG2L4vHwV9wWIG1/tWJ07YrZ1CeVcYRWusCHXd7XnJRYFDK43mpqF37/F
 BN3ZFYJJQbXrvU0bcFpi60YNu3GyfsWKGFQ9yihhWMGkzrZVq2dz+66IASz84OLMEcTf
 Ely+jetPLfTrxlJs1HQCJpVAAhYWB82leDenGDI8u72QxvzW4xMjRVBGfpWOnxgriF0K
 PSAwNSX8w/A+ahgnNe7467e2t1LTzQSavMPE1oVJeqOO3wLbl0rrcV3xlPsUBAQLRyki
 Fedw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716550689; x=1717155489;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eHPNtf/9KE2zXS08pwcc/KMZf+/Pjc5+PlR1+CFrP0o=;
 b=RurDaTha3KaSM1MY5lvYm4+YpZm/0IphIrbTkFyGHli+63ECm8tkiJJMj2nFJNZqlY
 qKbVzibmKb2bizkB6fjWr4m3qhGAVppOOTqz+s+KMGYbIbT6gdtiMNvzOHX3QhOgRcbS
 m9kbbdEUB1JqRLIXCvJ7B8YjqVczwTfHbUv3f2ItY+gPU4Hvxd3BJYsmk0zl6xhqc+gu
 SqA3wUucgbF2FOZs7HhxZQsBbk0yAZ1DH/Ga+j4vnO+8d0vQTd6ClXhOArlPD7kGQUji
 t6o/lHm+lMEirZ532HzneyEEvDGwIZzP9t9YdOg1unTbuf/IDdUC6WdqjptlBpLtMy2k
 GLgw==
X-Gm-Message-State: AOJu0YyQcVEtRYT4xOEaZ1Ic1eYlYPzihTu6lSkhgYwhZLD59N8kD5T6
 UffMxWrKx3vyBW05qRyrXoWAKgIkpROFPvuMmGFaBehB2kltsuEA6NR5Fb5prGk=
X-Google-Smtp-Source: AGHT+IGhVLSLHmViFvfbSO4jM2d1/9T+mbsOFmIFzG/j/w7ViFRVkRlku9umVTGX7JKDm02P63vVJw==
X-Received: by 2002:a05:6a20:d42a:b0:1af:d153:b76a with SMTP id
 adf61e73a8af0-1b212d1e0a4mr2065573637.18.1716550688806; 
 Fri, 24 May 2024 04:38:08 -0700 (PDT)
Received: from [192.168.68.110] ([177.94.42.4])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f44c9a5388sm12023195ad.220.2024.05.24.04.38.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 May 2024 04:38:08 -0700 (PDT)
Message-ID: <0b1e0da4-647f-40cc-918b-e1a549e0cc58@ventanamicro.com>
Date: Fri, 24 May 2024 08:38:04 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] target/riscv: Enable zabha for max cpu
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, Alistair.Francis@wdc.com,
 bmeng.cn@gmail.com, liwei1518@gmail.com
References: <20240523124045.1964-1-zhiwei_liu@linux.alibaba.com>
 <20240523124045.1964-6-zhiwei_liu@linux.alibaba.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20240523124045.1964-6-zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pg1-x52e.google.com
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



On 5/23/24 09:40, LIU Zhiwei wrote:
> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> ---
>   target/riscv/cpu.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 21d4e36405..9ec03a1edc 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -118,6 +118,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
>       ISA_EXT_DATA_ENTRY(zaamo, PRIV_VERSION_1_12_0, ext_zaamo),
>       ISA_EXT_DATA_ENTRY(zacas, PRIV_VERSION_1_12_0, ext_zacas),
>       ISA_EXT_DATA_ENTRY(zama16b, PRIV_VERSION_1_12_0, ext_zama16b),
> +    ISA_EXT_DATA_ENTRY(zabha, PRIV_VERSION_1_12_0, ext_zabha),

I think this should be place right after zaamo. Thanks,


Daniel

>       ISA_EXT_DATA_ENTRY(zalrsc, PRIV_VERSION_1_12_0, ext_zalrsc),
>       ISA_EXT_DATA_ENTRY(zawrs, PRIV_VERSION_1_12_0, ext_zawrs),
>       ISA_EXT_DATA_ENTRY(zfa, PRIV_VERSION_1_12_0, ext_zfa),
> @@ -1470,6 +1471,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
>       MULTI_EXT_CFG_BOOL("zcmop", ext_zcmop, false),
>       MULTI_EXT_CFG_BOOL("zacas", ext_zacas, false),
>       MULTI_EXT_CFG_BOOL("zama16b", ext_zama16b, false),
> +    MULTI_EXT_CFG_BOOL("zabha", ext_zabha, false),
>       MULTI_EXT_CFG_BOOL("zaamo", ext_zaamo, false),
>       MULTI_EXT_CFG_BOOL("zalrsc", ext_zalrsc, false),
>       MULTI_EXT_CFG_BOOL("zawrs", ext_zawrs, true),

