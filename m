Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E5EEEB64DA
	for <qemu-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 22:01:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qHAYZ-0008Od-IG; Wed, 05 Jul 2023 18:01:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qHAYW-0008O5-7L
 for qemu-riscv@nongnu.org; Wed, 05 Jul 2023 18:01:01 -0400
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qHAYT-0002g6-LF
 for qemu-riscv@nongnu.org; Wed, 05 Jul 2023 18:00:59 -0400
Received: by mail-oi1-x22f.google.com with SMTP id
 5614622812f47-3a36b309524so143986b6e.3
 for <qemu-riscv@nongnu.org>; Wed, 05 Jul 2023 15:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1688594456; x=1691186456;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=O9Umo4Ym/zYVPcLMiYaq5ll1qCgBNhmHnB4z7LEUNC4=;
 b=iikOq/eDtDK8KKNCXxkd6tz2baLgXYOIQ9ZwD90vCK4kKJ3Fgs3rdYNtOROJHm7X/c
 5O2gimm1iTL2pljzgrubWnHpPFVdnXHLZ9AZyljn98G1aG4ZE3UCELanvLqPp+6rzKak
 oLuVMWQNAf3XRG7BZYuk4dj+1+2p+ZxEjaqeAbSFIW8ueH8/09hszcE2r80xPwVGKDEY
 mCZnqEBUfBgZcZ7KKf7yrRm4BFGo2pCy2LNbcCfqlgbkWUTZIHm9IY99TRpsXspIeEQK
 uGfXLw8JafjVaGruYYO1VPWh603Y2m6M4drwDO5EsbTbGq+0AOdRNEZzKH4KDQyZ4UqY
 hL6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688594456; x=1691186456;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=O9Umo4Ym/zYVPcLMiYaq5ll1qCgBNhmHnB4z7LEUNC4=;
 b=X0Y9Ak4GgGuiInqZa1lwMNBk8SI8Xq7kmQ59B6YFM+Q7ikYR3QGCq1ern4Su8ohhTY
 dOE4ZbB2zgl8GyoBRCOv0bp188zyKG+IK41yyabbVCV97UqNi7tRcfUU0Wsa4GmLjqPj
 DVMoH8ZPTVUYZpSgWIPMj0rvF0aT/Vn3LNe5OqYeW6dQa00C1XBvqpju7wdJ9x26+ybd
 6x88VBC84rmcxi3lMJsYJ0KhaN0VjFixZKDbNUXQWiHxW0iqht6FGhn0i7ZmReuRh69F
 wY/YcARmvyRM9jSK3132EnNsAEZOE3z5DRpu5FnxIM8yCHFZqT1j4lzvJxzl/Sm6tC0m
 EQjg==
X-Gm-Message-State: AC+VfDzRvkqCc+Wx9Jy77aeR3IqN61ZFc5kPGNg8cpzm+ljYyuraYIK5
 ukECOeOK0nDAIIixBe53N1cH8g==
X-Google-Smtp-Source: ACHHUZ5MHj8VTle0m54+QtwHu36+YxYN+Cc/OxQnFOP6KkgvOTAdChhY7u0QBxQiMTvz7kFBVEknVg==
X-Received: by 2002:a05:6808:2020:b0:39d:63eb:3e9a with SMTP id
 q32-20020a056808202000b0039d63eb3e9amr22400244oiw.16.1688594456602; 
 Wed, 05 Jul 2023 15:00:56 -0700 (PDT)
Received: from [192.168.68.107] (201-69-66-110.dial-up.telesp.net.br.
 [201.69.66.110]) by smtp.gmail.com with ESMTPSA id
 e19-20020a05680809b300b003a1e965bf39sm72166oig.2.2023.07.05.15.00.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jul 2023 15:00:56 -0700 (PDT)
Message-ID: <c5372b14-b2b8-4664-4357-a7f22c880dcd@ventanamicro.com>
Date: Wed, 5 Jul 2023 19:00:52 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v8 02/20] hw/riscv/virt.c: skip 'mmu-type' FDT if satp
 mode not set
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 palmer@rivosinc.com, ajones@ventanamicro.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20230705213955.429895-1-dbarboza@ventanamicro.com>
 <20230705213955.429895-3-dbarboza@ventanamicro.com>
 <20230705-gallstone-untitled-1463e43aa33c@spud>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230705-gallstone-untitled-1463e43aa33c@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x22f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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



On 7/5/23 18:49, Conor Dooley wrote:
> On Wed, Jul 05, 2023 at 06:39:37PM -0300, Daniel Henrique Barboza wrote:
>> The absence of a satp mode in riscv_host_cpu_init() is causing the
>> following error:
>>
>> $ ./qemu/build/qemu-system-riscv64  -machine virt,accel=kvm \
>>      -m 2G -smp 1  -nographic -snapshot \
>>      -kernel ./guest_imgs/Image \
>>      -initrd ./guest_imgs/rootfs_kvm_riscv64.img \
>>      -append "earlycon=sbi root=/dev/ram rw" \
>>      -cpu host
>> **
>> ERROR:../target/riscv/cpu.c:320:satp_mode_str: code should not be
>> reached
>> Bail out! ERROR:../target/riscv/cpu.c:320:satp_mode_str: code should
>> not be reached
>> Aborted
>>
>> The error is triggered from create_fdt_socket_cpus() in hw/riscv/virt.c.
>> It's trying to get satp_mode_str for a NULL cpu->cfg.satp_mode.map.
>>
>> For this KVM cpu we would need to inherit the satp supported modes
>> from the RISC-V host. At this moment this is not possible because the
>> KVM driver does not support it. And even when it does we can't just let
>> this broken for every other older kernel.
>>
>> Since mmu-type is not a required node, according to [1], skip the
>> 'mmu-type' FDT node if there's no satp_mode set. We'll revisit this
>> logic when we can get satp information from KVM.
>>
>> [1] https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/cpu.yaml
> 
> I don't think this is the correct link to reference as backup, as the
> generic binding sets out no requirements. I think you would want to link
> to the RISC-V specific cpus binding.

You mean this link?

https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/riscv/cpus.yaml


> 
> That said, things like FreeBSD and U-Boot appear to require mmu-type
> https://lore.kernel.org/all/20230705-fondue-bagginess-66c25f1a4135@spud/
> so I am wondering if we should in fact make the mmu-type a required
> property in the RISC-V specific binding.


To make it required, as far as QEMU is concerned, we'll need to assume a
default value for the 'host' CPU type (e.g. sv57). In the future we can read the
satp host value directly when/if KVM provides satp_mode via get_one_reg().


Thanks,

Daniel

> 
> Since nommu is covered by an mmu type of "riscv,none", I am kinda
> struggling to think of a case where it should be left out (while
> describing real hardware at least).
> 
> Cheers,
> Conor.

