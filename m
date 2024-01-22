Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76B2EC4725D
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 13:22:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rRuFr-0008TD-Ax; Mon, 22 Jan 2024 08:22:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heinrich.schuchardt@canonical.com>)
 id 1rRuFp-0008Ss-Vc
 for qemu-riscv@nongnu.org; Mon, 22 Jan 2024 08:22:22 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heinrich.schuchardt@canonical.com>)
 id 1rRuFl-0005ad-AO
 for qemu-riscv@nongnu.org; Mon, 22 Jan 2024 08:22:21 -0500
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id F2ECD40C6B
 for <qemu-riscv@nongnu.org>; Mon, 22 Jan 2024 13:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1705929732;
 bh=6cVA8fWMFl6x88fq4D3SL0fjNy3wS32WKYPg1inKUrM=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=hqaMNAL2KiQRRXD8dOVzMY+A5O1QMtrTi/50X4lLi1UsBBF3n2skYpH8CUDXgYQ+l
 2feIQtcWLR4McQv8IR/QuaIP+ZRwNm6dES8/5p/vQltl+8ysNOGRWgv++xz6IUOEs5
 IILIS70DqZMU8yg9gypd//4uU2DmrnaynlEq+/hBYD9M9z2sS1rxrNcPb0i/qKgdC2
 M7rg6dKZrmH6koj6hR6PRuHLdvcodEZIvj2PNGDrA+RF85iHldQchf0KmEQYy/yWvF
 QRGnHQW/B2SIT4RaQiAv6jAGliQAdIwsigCnVhj3OqzJr+zMtft/TtI9L7/s3xcCx+
 /iT70Ap/7/L4g==
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-40e59340c2aso29691445e9.3
 for <qemu-riscv@nongnu.org>; Mon, 22 Jan 2024 05:22:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705929730; x=1706534530;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6cVA8fWMFl6x88fq4D3SL0fjNy3wS32WKYPg1inKUrM=;
 b=oT56nKVQphgfyVysT0t9K4KXC6eV95V9zuASRv6fvdmn7p9sGFRnmCIqq+hW7dsjAq
 xTpAqCJFnVD4C6/GSmnydW5sXxt/hxAZhywvQg1ZXXixDrm9IlD2cRqtcDD1By5HilZW
 +sGheSknNGbVgE1vPz2ms70I9i2NnCBzoHaVIUYVsVVhw/3oxN26BsVDjv9lP/FVvXsa
 Hk1PZHMIKegyqB7Iw9qukOTeDU09w5xBKhif9hXoTIxGntvTybZiLv0PtpRj7z6ktzT1
 CKIBP/VUjX/ibapWz5NrKsbQTRCbzqc8NLBWK+meNeHQUn6+mFyUWY+5yt37rbDpwHcc
 BLFw==
X-Gm-Message-State: AOJu0YyHkYOOFLXvFKt9EEvq4gf6wmm/xzCt610/rlChJ+Hb6QGigva6
 Tqa1RvF9oOQVYDjE3wxNioWsUVuFizi99BxeF9xLfJMYR9VmdoGvStCD9ym5E1ISwAzruLDxLIe
 g43bjXbLW2AOd6+ZBocZZDx6zL6xcNkFGLVUlpwB/NficnS9OVP2+jyPJXFnMOpHHzHN3
X-Received: by 2002:a05:600c:154b:b0:40e:4794:f225 with SMTP id
 f11-20020a05600c154b00b0040e4794f225mr1575897wmg.9.1705929730409; 
 Mon, 22 Jan 2024 05:22:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHryeTnvpXnUw8ktQ1SGX/ECCaaI0aKUJa/gCbMxzdbYNb5cLlD5/6VlCZMcOg4cN2TQTV4eQ==
X-Received: by 2002:a05:600c:154b:b0:40e:4794:f225 with SMTP id
 f11-20020a05600c154b00b0040e4794f225mr1575881wmg.9.1705929730002; 
 Mon, 22 Jan 2024 05:22:10 -0800 (PST)
Received: from [192.168.123.67] (ip-178-202-040-247.um47.pools.vodafone-ip.de.
 [178.202.40.247]) by smtp.gmail.com with ESMTPSA id
 az40-20020a05600c602800b0040ead8c6c0fsm3743588wmb.21.2024.01.22.05.22.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jan 2024 05:22:09 -0800 (PST)
Message-ID: <2dfd12d7-d3dc-47af-ba1c-2d2e25cb9c5f@canonical.com>
Date: Mon, 22 Jan 2024 14:22:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] target/riscv: SMBIOS support for RISC-V virt
 machine
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20231229120724.41383-1-heinrich.schuchardt@canonical.com>
 <20231229120724.41383-4-heinrich.schuchardt@canonical.com>
 <20240122-4f4cbce3692cd684e0409f9e@orel>
 <22105210-d8d1-4808-b9ed-41eee71c53ca@canonical.com>
 <20240122-195c4a8d0ece609441068e16@orel>
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20240122-195c4a8d0ece609441068e16@orel>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=185.125.188.123;
 envelope-from=heinrich.schuchardt@canonical.com;
 helo=smtp-relay-internal-1.canonical.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.289,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 22.01.24 13:59, Andrew Jones wrote:
> On Mon, Jan 22, 2024 at 01:28:18PM +0100, Heinrich Schuchardt wrote:
>> On 22.01.24 10:57, Andrew Jones wrote:
>>> On Fri, Dec 29, 2023 at 01:07:23PM +0100, Heinrich Schuchardt wrote:
> ...
>>>> +#if defined(TARGET_RISCV32)
>>>> +    smbios_set_default_processor_family(0x200);
>>>> +#elif defined(TARGET_RISCV64)
>>>> +    smbios_set_default_processor_family(0x201);
>>>> +#endif
>>>
>>> I think we should use misa_mxl_max to determine the family, rather than
>>> TARGET_*, because, iirc, we're slowly working our ways towards allowing
>>> rv32 cpus to be instantiated with qemu-system-riscv64.
>>
>> Hello Andrew,
>>
>> thank you for reviewing. I guess you mean something like:
>>
>>      if (riscv_is_32bit(&s->soc[0])) {
>>          smbios_set_default_processor_family(0x200);
>> #if defined(TARGET_RISCV64)
>>      } else {
>>          smbios_set_default_processor_family(0x201);
>> #endif
>>      }
> 
> Yes, but I'm not sure we need the #ifdef around the 64-bit part.

I just followed the style in riscv_cpu_validate_misa_mxl().

Best regards

Heinrich

> 
>>
>> riscv_is_32bit returns harts->harts[0].env.misa_mxl_max == MXL_RV32.
>>
>> Some real hardware has a 32bit hart and multiple 64bit harts. Will QEMU
>> support mixing harts with different bitness on the virt machine in future?
>> In that case we would have to revisit the code using misa_mxl_max in
>> multiple places.
>>
> 
> Never say never, but I don't think there has been much effort to support
> these types of configurations with a single QEMU binary. My googling is
> failing me right now, but I seem to recall that there may have been
> efforts to implement Arm big.LITTLE with multiprocess QEMU [1]. IOW, I
> think we're safe to use misa_mxl_max, since we'll have one for each QEMU
> instance and we'll use a different QEMU instance for each hart bitness.
> 
> [1] docs/system/multi-process.rst
> 
> Thanks,
> drew


