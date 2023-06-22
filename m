Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D122CEB64D8
	for <qemu-riscv@archiver.kernel.org>; Thu, 22 Jun 2023 17:41:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qCOJI-0003IA-4w; Thu, 22 Jun 2023 13:41:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qCOJH-0003GS-0N
 for qemu-riscv@nongnu.org; Thu, 22 Jun 2023 13:41:31 -0400
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qCOJF-00017n-3G
 for qemu-riscv@nongnu.org; Thu, 22 Jun 2023 13:41:30 -0400
Received: by mail-ot1-x32d.google.com with SMTP id
 46e09a7af769-6b5cf23b9fcso1637916a34.0
 for <qemu-riscv@nongnu.org>; Thu, 22 Jun 2023 10:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1687455687; x=1690047687;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5auePfU2reJg2xD4JzocZz3c/cYy3Pi3+DxTXNu0T8M=;
 b=AZTTa03YPgH9w5l0jySwjX7rxx4hOVDfDof0uX+0jK2Wxc9aez6xlxBTQ7voTAAK2v
 Q4NZfNUAhhoMJKSPQoMgTu5CpraLP9h4Vha5hMKR70N4Zot2D1vJ1vRjbKHVYfPoKF+c
 wVGCDPDD2W4tgn65rsMffMH4tfarAIiq50OhOVhmxpwtybOiRBv5JGL3XPdEWzICZfeT
 5ChrdUuj9sVvQqk7+jJGxqVML62F64CAxrU1VA2SJoI7hAJpTHVdfiL4+xkjNnLKrxjW
 19AVTD/qG8/ZcZ7eX/T0ShpOXkSfBdl4dB1UuCm/9dGVHnHGbAebGTJhwbtPGyj6pnMk
 J8Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687455687; x=1690047687;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5auePfU2reJg2xD4JzocZz3c/cYy3Pi3+DxTXNu0T8M=;
 b=OZ40zMAtg+b+ayESaoqZ8bMcBQIptcPOQyA304Rl2irRMJmHsHoOD9z+qglFm+pyd2
 TZwbA0jmh5352oLPm1+XPYv8IAyGRqUhpQhzi68cE3y+iKWZOg8+aA5pgVUIat7fbAjF
 9neM1z7shs/Sxx+QykNLImi87m8Y7CARX2mXL+eV/Obw4wMXzKe95hjxCb4P+0ppd1ae
 0gjnyeY8U2eUZWA65tILYRWrQmmZaRkMi4Fk12VMpHeszmDCto9y7E0rAzt8dksqepHU
 0a+p+svp/0PkC+vfxwWMJokocbax2h1n1gzEOmq7al4vjyulY6pDKcgoA7oFGyIyK+Jj
 AjeA==
X-Gm-Message-State: AC+VfDzpfkdrsdHZ1z0AjkD4z3k9EonynEjRmalndIC1TUH2bhQQQGP5
 VJ5RICY2qmb+IYxaA7W0orFC4Q==
X-Google-Smtp-Source: ACHHUZ4p2FA+fEu/5tWNa2ScDd0V7hsipFM/A/vZ0MvTHSg4gysa6CV8ynDffBXnzQYzYqDwI9V2Mw==
X-Received: by 2002:a05:6871:c18a:b0:19f:6af1:87f8 with SMTP id
 yr10-20020a056871c18a00b0019f6af187f8mr13999095oab.41.1687455687660; 
 Thu, 22 Jun 2023 10:41:27 -0700 (PDT)
Received: from [192.168.68.108] (201-69-66-110.dial-up.telesp.net.br.
 [201.69.66.110]) by smtp.gmail.com with ESMTPSA id
 y19-20020a9d6353000000b006b5d40bd738sm1337744otk.70.2023.06.22.10.41.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jun 2023 10:41:27 -0700 (PDT)
Message-ID: <12f82e04-7379-0d8c-c54b-348cd30c31b2@ventanamicro.com>
Date: Thu, 22 Jun 2023 14:41:22 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 17/17] target/riscv: Expose Zvk* and Zvb[b,c] cpu
 properties
Content-Language: en-US
To: Max Chou <max.chou@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Nazar Kazakov <nazar.kazakov@codethink.co.uk>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20230622161646.32005-1-max.chou@sifive.com>
 <20230622161646.32005-18-max.chou@sifive.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230622161646.32005-18-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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



On 6/22/23 13:16, Max Chou wrote:
> From: Nazar Kazakov <nazar.kazakov@codethink.co.uk>
> 
> Exposes earlier CPU flags allowing the use of the vector cryptography extensions.
> 
> Signed-off-by: Nazar Kazakov <nazar.kazakov@codethink.co.uk>
> Signed-off-by: Max Chou <max.chou@sifive.com>
> ---
>   target/riscv/cpu.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index c1956dc29b..48d584ab0d 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1714,6 +1714,16 @@ static Property riscv_cpu_extensions[] = {
>       DEFINE_PROP_BOOL("x-zvfh", RISCVCPU, cfg.ext_zvfh, false),
>       DEFINE_PROP_BOOL("x-zvfhmin", RISCVCPU, cfg.ext_zvfhmin, false),
>   
> +    /* Vector cryptography extensions */
> +    DEFINE_PROP_BOOL("x-zvbb", RISCVCPU, cfg.ext_zvbb, false),
> +    DEFINE_PROP_BOOL("x-zvbc", RISCVCPU, cfg.ext_zvbc, false),
> +    DEFINE_PROP_BOOL("x-zvkg", RISCVCPU, cfg.ext_zvkg, false),
> +    DEFINE_PROP_BOOL("x-zvkned", RISCVCPU, cfg.ext_zvkned, false),
> +    DEFINE_PROP_BOOL("x-zvknha", RISCVCPU, cfg.ext_zvknha, false),
> +    DEFINE_PROP_BOOL("x-zvknhb", RISCVCPU, cfg.ext_zvknhb, false),
> +    DEFINE_PROP_BOOL("x-zvksed", RISCVCPU, cfg.ext_zvksed, false),
> +    DEFINE_PROP_BOOL("x-zvksh", RISCVCPU, cfg.ext_zvksh, false),
> +

We usually add the cpu properties in the same commit that the extension was
added, e.g. "x-zvbb" would be added by patch 9. This is no hard rule though.

Let's leave this as is and, if a v5 is required for any other reason, you can
put each property into its own patch. For now:

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>       DEFINE_PROP_END_OF_LIST(),
>   };
>   

