Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F1C5C54E67
	for <qemu-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 17:38:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rpXDm-0006jQ-Fr; Wed, 27 Mar 2024 13:37:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rpXDl-0006ik-4t
 for qemu-riscv@nongnu.org; Wed, 27 Mar 2024 13:37:53 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rpXDj-0003R0-HD
 for qemu-riscv@nongnu.org; Wed, 27 Mar 2024 13:37:52 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1e0411c0a52so949155ad.0
 for <qemu-riscv@nongnu.org>; Wed, 27 Mar 2024 10:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1711561070; x=1712165870; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DzwcFEMtabmVhbLX7E4sRfHTxjIoZH8AZaETBHUghm8=;
 b=VW0CubHchdSCeuXDrlPSpVpRyoGaLXGYTPmKXLrcn9rlU1j3RR3aBjoxm8/STgwsbB
 XJgKIkzfyBB9Znse4xc/H3JQsO0tRKwJnbYw31eoA1pHIOG2lyXqVRaem3jVF0Pi/Scp
 3/IMqZ3Kbix8sXEStlrCL6v97n73RwzR2Dpub7Yxnge/WIE7FK11VT5RwzZxdRgHxVQa
 GdAyMpt1qj3xf4rLgsF6bh0GSWQ1xrweBfXB+G8a4sHmgTJvXGlpjP3v2KZUa25gNL1z
 1+Ms/OUJLq//dH2DD5xMB4kIREWu/fimxMHyhI0mxFol5DBIoWXj07PBf57nqjr2bxxk
 +eTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711561070; x=1712165870;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DzwcFEMtabmVhbLX7E4sRfHTxjIoZH8AZaETBHUghm8=;
 b=F5H1VRNCvXDXRZy07YC3GmErCE2pN4vAV6WbzJgTZmQzg5creH/Deg9kuDaJzzdh1N
 bx2Ymv0JeAp16dQq943Qeb7gjAb5wNGpMcE87LKMevbTq8OFR2VXzzRB6Cr5mpUVLFgS
 +X3X2CdNRkJA4Ul0JM/0hqQ+NbFQr/rh4FZGpe5lc9melBYRbUhUnyEjaV06QBH9njJ/
 R+5DJ+Olww8kSkShKSGadgcLpUfZghU+pl6haBX2HXsYwvn+eMAsU2IMR61dD1NxSDiP
 MP2G3fdSLq/RkFSkUfpsQ+OOMg4XJp2Y46CydzmqFAqbJw7DoU/4vTQmZZwba4vILJnU
 Ipvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMpCpExcsigQ15SiGW70heImPV3x0/x+Fwq9Mn1qDQGT88hxw/bHFlkFipyyICZ/yLmaTYmAWWdIxYUw/uU/f6odKkz44=
X-Gm-Message-State: AOJu0YxA7WP5j1bm/QRSaeh4VImhbc97dtvTFMDy1vx3/V7jP1kwZz26
 xA3jVaiJdPIpNTYvl6RtlhgPZTyyd7BR9XlC87Lsrm5z7KKq9kWkdE0gwKLK1tM=
X-Google-Smtp-Source: AGHT+IH/n81E5AglP0oSEENlQh31CCTYBjoK6ajII2iSfUUAkaUJSVJtq26HBTy+tnveBDbSG3DvqQ==
X-Received: by 2002:a17:902:b116:b0:1dd:7f7c:945f with SMTP id
 q22-20020a170902b11600b001dd7f7c945fmr369625plr.17.1711561070135; 
 Wed, 27 Mar 2024 10:37:50 -0700 (PDT)
Received: from [192.168.68.110] ([177.45.186.241])
 by smtp.gmail.com with ESMTPSA id
 j11-20020a170902da8b00b001e0c5be4e2esm5878469plx.48.2024.03.27.10.37.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Mar 2024 10:37:49 -0700 (PDT)
Message-ID: <1151f20f-9fe9-4aa9-a688-e92fa6422dd9@ventanamicro.com>
Date: Wed, 27 Mar 2024 14:37:45 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] target/riscv: Expose Zve32x extension to users
Content-Language: en-US
To: Jason Chien <jason.chien@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>, Max Chou <max.chou@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20240325083346.16656-1-jason.chien@sifive.com>
 <20240325083346.16656-3-jason.chien@sifive.com>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20240325083346.16656-3-jason.chien@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x632.google.com
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

I think this patch should be squashed into patch 1. Patch 1 as is
does nothing since there's no way of enabling the flag without this
patch.

Same thing with patch 4: I think it should be squashed into patch 3.



Thanks,

Daniel

On 3/25/24 05:33, Jason Chien wrote:
> Signed-off-by: Jason Chien <jason.chien@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Max Chou <max.chou@sifive.com>
> ---
>   target/riscv/cpu.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 851ac7372c..6bd8798bb5 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1473,6 +1473,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
>       MULTI_EXT_CFG_BOOL("zfh", ext_zfh, false),
>       MULTI_EXT_CFG_BOOL("zfhmin", ext_zfhmin, false),
>       MULTI_EXT_CFG_BOOL("zve32f", ext_zve32f, false),
> +    MULTI_EXT_CFG_BOOL("zve32x", ext_zve32x, false),
>       MULTI_EXT_CFG_BOOL("zve64f", ext_zve64f, false),
>       MULTI_EXT_CFG_BOOL("zve64d", ext_zve64d, false),
>       MULTI_EXT_CFG_BOOL("zvfbfmin", ext_zvfbfmin, false),

