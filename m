Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8858C0218F
	for <qemu-riscv@archiver.kernel.org>; Fri, 31 Jan 2025 20:28:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tdxdC-0000d1-AE; Fri, 31 Jan 2025 15:28:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tdxdA-0000ce-VR
 for qemu-riscv@nongnu.org; Fri, 31 Jan 2025 15:28:49 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1tdxd9-0008F5-D9
 for qemu-riscv@nongnu.org; Fri, 31 Jan 2025 15:28:48 -0500
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-2165448243fso38296185ad.1
 for <qemu-riscv@nongnu.org>; Fri, 31 Jan 2025 12:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1738355323; x=1738960123; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FjUp1ATTyPE2z8h+Uj8HpjPvxMKO7ADE1eqM/YuE/wc=;
 b=g36k9+9JwFSR8mgR+Qmnir/xoFhcCViJwn7wW0NbfK4CxB1SagAJG7d0tQJ6hmbo2l
 SAgtUuYHEkUlxFYyvMUlwFZE8IgY6tX4Rj9ip5Xlbe6mrAVwxxC1wPgeGOZqcUwmQg53
 zKmlydIg+dzQfqAGi5SrMDXjvsUAltVknZXfu652qVUxOtHJS2MVuq9HHXqbFqneN0u2
 u/WVcGkNc/s79f1HrMGpu2Lm35BccU3Fy4RFNRxVghkgJvm+BJKSu+1x3OgvZd0kGRBE
 qg7Np/LAZGNJ1eiYGS17cQPyYKgMGLzxgrEZnKdUAJYQH2+TlAo9kPCU2xP0F+a9NzM3
 +tew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738355323; x=1738960123;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FjUp1ATTyPE2z8h+Uj8HpjPvxMKO7ADE1eqM/YuE/wc=;
 b=LtKT/ukcKJmqUt3JzhU/gs40U5QvNIKf/3T/jmJryRjw9YX3aqzLvkZDw/cOQ1fZFd
 V9AGjso/wbyG7ILkK6V1eSkpZ+k0dsTwu0tI5CNcPAzZw+1c1XblkzJcothTZutl9oBZ
 bBsfdaF1aJ4HIPidirjH6jUHhLY/aUEqoninqdzDHVGWN7lMD6H9vif8ZFo/Hrm0yfo7
 T/sE+NQukHjyE03k61JmawxU7Ufr+bv1NiTGsZ7za7EQ9QIrN6m1futhO/3/vdNZZZmw
 ezWiMw91LCUWdceBXmq7XzmNmugnBVi1ZxTUsawYilvOflblAU+K58vmSbZ7dUHfqhP3
 aJrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzC/OzDePxQGdD4OsjyvWcVkMlWF0gviIaeBgsli/TyIV0KHuzQCw1rpm3+gjOeTwIwAK2kr7F5aFY@nongnu.org
X-Gm-Message-State: AOJu0Yzwdyy7A1phAtV4fWVUcHF6s1xWgrLvpCZHnLPEgNX72nWN1mJx
 VsVE+rsA/hKrSlZ8y/bKamtDEs3WgoZIsucCOW/1uuMuSTbazR+6QSkHvn1bNKU=
X-Gm-Gg: ASbGncvcg9+pn9JEJSaTMR9xZkpQ2CNuWzep6bN/iep3xHNVO+ZlIqkc1xX39YS/T31
 yUXCd0dP4zPuwfYX4pnrR3FwJsGG7/7+5Mc8ELYPGYslIwReLqRSNIMo371hZySnjDd2KclORHs
 xsYsUYYjYgwR7iivjbJXtmXD1xOUfj4iIssjifW4Gx+/stntcWVqoiOCGX6JxanEU5EMubwJlzk
 3Zek0oX0Is+jhsEK/1eT4dBrL1PDdY/BT5rB+18Oxn/5TYBkFLLHEPhqOvOYpX1e3DmN2KPgnsA
 gWu/EEh0mFCS+4/jm+rUKeJyys9K3ppnn9e8A3ENiIYb6S86dwKzSeplIEqwAEAsN+vzGQ==
X-Google-Smtp-Source: AGHT+IGBkuQ1gIBOS/BVUD60VzYUYHU9DSIMdyftFWFk8WMnNFKwEioZQAlRU6EyIIA97mN1RDywWA==
X-Received: by 2002:a17:902:ce91:b0:216:48f4:4f20 with SMTP id
 d9443c01a7336-21dd7c6693emr181868795ad.16.1738355323218; 
 Fri, 31 Jan 2025 12:28:43 -0800 (PST)
Received: from ?IPV6:2804:7f0:bcc0:6ed1:1da4:43bf:cd98:5364?
 ([2804:7f0:bcc0:6ed1:1da4:43bf:cd98:5364])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21de31ef08esm33914035ad.13.2025.01.31.12.28.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Jan 2025 12:28:42 -0800 (PST)
Message-ID: <8b5538d1-cd50-4d3c-a933-2a7a61891df2@ventanamicro.com>
Date: Fri, 31 Jan 2025 17:28:38 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Remove Bin Meng from RISC-V maintainers
To: Alistair Francis <alistair23@gmail.com>, palmer@dabbelt.com,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, qemu-riscv@nongnu.org,
 philmd@linaro.org
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Bin Meng <bmeng@tinylab.org>
References: <20250128060546.1374394-1-alistair.francis@wdc.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20250128060546.1374394-1-alistair.francis@wdc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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



On 1/28/25 3:05 AM, Alistair Francis wrote:
> Bin Meng has been a long time contributor and maintainer for QEMU RISC-V
> and has been very beneficial to the RISC-V ecosystem.
> 
> Unfortunately his email has started to bounce so this patch is removing
> them from MAINTAINERS. If in the future Bin Meng wants to return we will
> happily re-add them.
> 
> Note that I'm not removing Bin Meng as a "SD (Secure Card)" maintainer.
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---

For the record I tried to contact Bin Jan 16th, using the following emails, about the
bouncing of his gmail:

- bin.meng@windriver.com
- bmeng@tinylab.org

Still no reply as of this writing.

The better course of action seems to be just remove him for now and add him back once
the situation is solved. He can then choose to keep using the gmail or another email
of his preference.


Acked-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>




>   MAINTAINERS | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7be3d8f431..a0e305aa99 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -318,7 +318,6 @@ F: tests/functional/test_ppc_74xx.py
>   RISC-V TCG CPUs
>   M: Palmer Dabbelt <palmer@dabbelt.com>
>   M: Alistair Francis <alistair.francis@wdc.com>
> -M: Bin Meng <bmeng.cn@gmail.com>
>   R: Weiwei Li <liwei1518@gmail.com>
>   R: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>   R: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
> @@ -1599,7 +1598,6 @@ F: include/hw/riscv/opentitan.h
>   F: include/hw/*/ibex_*.h
>   
>   Microchip PolarFire SoC Icicle Kit
> -M: Bin Meng <bmeng.cn@gmail.com>
>   L: qemu-riscv@nongnu.org
>   S: Supported
>   F: docs/system/riscv/microchip-icicle-kit.rst
> @@ -1626,7 +1624,6 @@ F: include/hw/char/shakti_uart.h
>   
>   SiFive Machines
>   M: Alistair Francis <Alistair.Francis@wdc.com>
> -M: Bin Meng <bmeng.cn@gmail.com>
>   M: Palmer Dabbelt <palmer@dabbelt.com>
>   L: qemu-riscv@nongnu.org
>   S: Supported
> @@ -3721,7 +3718,7 @@ S: Orphan
>   F: hw/i386/amd_iommu.?
>   
>   OpenSBI Firmware
> -M: Bin Meng <bmeng.cn@gmail.com>
> +L: qemu-riscv@nongnu.org
>   S: Supported
>   F: pc-bios/opensbi-*
>   F: .gitlab-ci.d/opensbi.yml


