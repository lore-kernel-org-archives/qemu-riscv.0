Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CCA0C5321D
	for <qemu-riscv@archiver.kernel.org>; Fri, 23 Aug 2024 21:15:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1shbcI-0003fN-L5; Fri, 23 Aug 2024 17:14:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1shbcG-0003dq-HC
 for qemu-riscv@nongnu.org; Fri, 23 Aug 2024 17:14:40 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1shbcE-0002Xx-Sl
 for qemu-riscv@nongnu.org; Fri, 23 Aug 2024 17:14:40 -0400
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-7142014d8dfso2078713b3a.3
 for <qemu-riscv@nongnu.org>; Fri, 23 Aug 2024 14:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1724447677; x=1725052477; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yEEqGzKRWbGgx0Pw8Hc80CwXXFbhTJQz7U27t3F1IHM=;
 b=DnFt/RtmOffSISRtxdjY4L53ziWX7S4z/u7kWSPcMO0ToS/gJqWveirsOHNekXqt/g
 EleEt5JsnEOtmKAk0ZlzajqZ5VwO94LAoDG1j3wFLGDGfUEZKseqHqo5uiwSFgoUJAy1
 ZtFCqYlaYH0ks90AUFvzABEGhI2wp7H0p7fQ6lOqwxSyg4zJBR8I+Z3aE5Rj51h/cmph
 0RdzZsKZCTydp5ohPH8/N0TogYl+vt09Zga4G4iyaxlvOwd66l0RyegsT9ndgpJPpJLp
 bDsqhVWsYHVuYH2vJzfjYWnRA+Sfv9eCgZ/p14nHssV/ZtzVVALwh8AvIb4diCGpg1Bv
 b4Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724447677; x=1725052477;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yEEqGzKRWbGgx0Pw8Hc80CwXXFbhTJQz7U27t3F1IHM=;
 b=kryI7gDrNu/8lWdejc6N47fCN9p92zCbZ999jjpIJ+Grl/SmdRVduYgdVF4R+OMrWG
 PDChDIEoz22NYSITpXevuNXQ1ucKrTDzTnZ2N2E1GBtabfj6DGIG+zN7LTK6vrA8yxxV
 bh/LTxQtowcumRRkKG/mmlFz2UyZCWqZ0nEbDOB9lONID8Cx2hf+JYggWV+QAPAriiC6
 c6troKysNmrPGKFpAYbTi8IQiX3tUVSR4TdKro+mtfnG77gXJFNBQzQamBhBkEIVyvZg
 TBTrRP0PKvZHlTen4UphhQeiHYLt72hgfL/dvyH98onr4XJoglYvz1aWQtse/LtvnjmZ
 Vj1w==
X-Gm-Message-State: AOJu0Yzb6eh9KbOFN9hlZPP31I533tE/nkzp6Zvvie3fHr6n9mYXY8Ec
 cV3h84ngnzbTUZVJUnw0Io9n2mpAXZl7dmjGGth0jusB2x245t2ClNH5Yt8Zl9brE4zTYlC6i4H
 0
X-Google-Smtp-Source: AGHT+IHGW6ATQH5CMdU8RX3NIcLi7wvWbkez4dEjSN3kyQf7sYNyCY7FpNQuxfaOz8rgdZMzvWjwHQ==
X-Received: by 2002:a05:6a20:c6c1:b0:1c0:f216:7f20 with SMTP id
 adf61e73a8af0-1cc8b61c827mr3732679637.49.1724447676879; 
 Fri, 23 Aug 2024 14:14:36 -0700 (PDT)
Received: from [192.168.68.110] ([179.133.97.250])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7143422f6absm3463145b3a.5.2024.08.23.14.14.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Aug 2024 14:14:36 -0700 (PDT)
Message-ID: <e0bf0d3b-436d-4fb0-8707-f196d3256265@ventanamicro.com>
Date: Fri, 23 Aug 2024 18:14:32 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: fix za64rs enabling
To: Vladimir Isaev <vladimir.isaev@syntacore.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, zhiwei_liu@linux.alibaba.com, liwei1518@gmail.com, 
 bin.meng@windriver.com, alistair.francis@wdc.com, palmer@dabbelt.com
References: <20240823063431.17474-1-vladimir.isaev@syntacore.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20240823063431.17474-1-vladimir.isaev@syntacore.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pf1-x434.google.com
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



On 8/23/24 3:34 AM, Vladimir Isaev wrote:
> za64rs requires priv 1.12 when enabled by priv 1.11.
> 
> This fixes annoying warning:
> warning: disabling za64rs extension for hart 0x00000000 because privilege spec version does not match
> 
> on priv 1.11 CPUs.
> 
> Fixes: 68c9e54beae8 ("target/riscv: do not enable all named features by default")

Thanks for fixing it! Worse than an annoying warning is an unwarranted annoying warning.

I took another look at 68c9e54beae8 and this seems to be the only case where I set the
wrong has_priv_Version flag.


> Signed-off-by: Vladimir Isaev <vladimir.isaev@syntacore.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/cpu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index a90808a3bace..07a7af59b6d9 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -115,7 +115,7 @@ const RISCVIsaExtData isa_edata_arr[] = {
>       ISA_EXT_DATA_ENTRY(zihpm, PRIV_VERSION_1_12_0, ext_zihpm),
>       ISA_EXT_DATA_ENTRY(zimop, PRIV_VERSION_1_13_0, ext_zimop),
>       ISA_EXT_DATA_ENTRY(zmmul, PRIV_VERSION_1_12_0, ext_zmmul),
> -    ISA_EXT_DATA_ENTRY(za64rs, PRIV_VERSION_1_12_0, has_priv_1_11),
> +    ISA_EXT_DATA_ENTRY(za64rs, PRIV_VERSION_1_12_0, has_priv_1_12),
>       ISA_EXT_DATA_ENTRY(zaamo, PRIV_VERSION_1_12_0, ext_zaamo),
>       ISA_EXT_DATA_ENTRY(zabha, PRIV_VERSION_1_13_0, ext_zabha),
>       ISA_EXT_DATA_ENTRY(zacas, PRIV_VERSION_1_12_0, ext_zacas),

