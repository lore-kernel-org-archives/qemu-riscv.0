Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49DC4C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 20:41:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rL82u-0006a7-Hx; Wed, 03 Jan 2024 15:41:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rL82t-0006Zq-Po
 for qemu-riscv@nongnu.org; Wed, 03 Jan 2024 15:40:59 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rL82q-0004Uh-Bo
 for qemu-riscv@nongnu.org; Wed, 03 Jan 2024 15:40:59 -0500
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-1d4c3393f99so15990255ad.0
 for <qemu-riscv@nongnu.org>; Wed, 03 Jan 2024 12:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1704314455; x=1704919255; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=obr0rT5ltUkVhW08aqamm6C2nliAU020IL7X/tYqAY0=;
 b=OwGfchM9Wl46pg3YytCwmHxJYjb88vNMp7Er/2jjwRHlQ91aekZOwjRWak7g2VWeG0
 G1Y+HzvN33kzew5unkFyv7WRGSELMDF6B6MFmk2aQx3SNVZaAzsqPrlBa+nVqkXRU7SY
 CaWpqESiPsfCEJEOB0D2TcqPFmK64LAeCYNHjJ5EF2+6r36BCMVL4h5bXmiGj1KDarni
 Ph0kWoyNE626EaOQ59bx3iQfTTZC84BlF7LxtjnfC9H2WtAK3LlsrXOcuTQu+P7hrhyS
 K+ygQTPkuqRbkNbMS91hZVf6U2MyKFphSxqonnS/6h1ozcbht7j1ZSP5EMAiBUOqCZC0
 FVpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704314455; x=1704919255;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=obr0rT5ltUkVhW08aqamm6C2nliAU020IL7X/tYqAY0=;
 b=BVBBEtSje1ePNPLV2MpgLxvbxQoD1irow8tqoPRTp0B8Gi2M6VnYhUpbWuMWcc+s/G
 q1wTG7KjEjg9sUIb217d/Z/dEfG5pijzylf5uNUxti+iktYHtLug4yqXQ+V6W9Ro20Nw
 GSYkUTKh7KY4ITxgAz/USmpAB5Xn22JJgqVfyuCIv1RK5PmRnuUQ3bNvS5jlevuOi+Nc
 3BjV833JMKWrY2rX/FIqZDq00ZFJFO3+c+Zap6BOxTgGTQ39FJJilmVHjb2OYQ/u7ka0
 4XoMpyVIQxFwl2VT+/bLin5h7D0x8KbNwZKs/kvqQWvpBpyOTUBxnFmIYiMojdZZRwLO
 CMGw==
X-Gm-Message-State: AOJu0YydQAd6BptcMeiCsDY81jSJDd5tngOBVWj5sFz+sJwf2JnKx6HX
 PN9y5mHik0aGmHf0JyM9ERmnsgvnCvxJ+Q==
X-Google-Smtp-Source: AGHT+IFbLqs95YqHE45FVQTYBlIGrqqt5lAHKTSOisHvDEtcc2/+2cwyD3lpOXRkqEg2+L0pwETIqA==
X-Received: by 2002:a17:902:e547:b0:1d4:acc3:304 with SMTP id
 n7-20020a170902e54700b001d4acc30304mr5462222plf.15.1704314455164; 
 Wed, 03 Jan 2024 12:40:55 -0800 (PST)
Received: from [192.168.68.110] ([189.79.21.107])
 by smtp.gmail.com with ESMTPSA id
 bb10-20020a170902bc8a00b001d4b7176b17sm6069831plb.307.2024.01.03.12.40.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jan 2024 12:40:54 -0800 (PST)
Message-ID: <4c8bca8b-f4f8-4ad4-8de3-59e44a619b1c@ventanamicro.com>
Date: Wed, 3 Jan 2024 17:40:51 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] qemu-options: enable -smbios option on RISC-V
Content-Language: en-US
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20231229120724.41383-1-heinrich.schuchardt@canonical.com>
 <20231229120724.41383-5-heinrich.schuchardt@canonical.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20231229120724.41383-5-heinrich.schuchardt@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x633.google.com
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



On 12/29/23 09:07, Heinrich Schuchardt wrote:
> With SMBIOS support added for RISC-V we also should enable the command line
> option.
> 
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> ---
> v2:
> 	new patch
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   qemu-options.hx | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 7bdb414345..5ed82df11f 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -2705,7 +2705,7 @@ DEF("smbios", HAS_ARG, QEMU_OPTION_smbios,
>       "                specify SMBIOS type 17 fields\n"
>       "-smbios type=41[,designation=str][,kind=str][,instance=%d][,pcidev=str]\n"
>       "                specify SMBIOS type 41 fields\n",
> -    QEMU_ARCH_I386 | QEMU_ARCH_ARM | QEMU_ARCH_LOONGARCH)
> +    QEMU_ARCH_I386 | QEMU_ARCH_ARM | QEMU_ARCH_LOONGARCH | QEMU_ARCH_RISCV)
>   SRST
>   ``-smbios file=binary``
>       Load SMBIOS entry from binary file.

