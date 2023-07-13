Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E95C0015E
	for <qemu-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 22:35:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qK4u2-0001Yj-LT; Thu, 13 Jul 2023 18:35:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qK4ty-0001Y7-JP
 for qemu-riscv@nongnu.org; Thu, 13 Jul 2023 18:35:10 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qK4tv-0002qW-UU
 for qemu-riscv@nongnu.org; Thu, 13 Jul 2023 18:35:09 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-1b3f722fdafso1050525fac.3
 for <qemu-riscv@nongnu.org>; Thu, 13 Jul 2023 15:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1689287706; x=1691879706;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xnl899DnW28MqtEKQfEvFKzBolU6ytR3AztorS+3lyA=;
 b=hq0Z+nI4UFw7kkF5fV1lbgf+jsf9RW33P4mrP1DI08JBvqeACnbcC+LLsrpVJ+KX6Z
 8As+7YNqQTfu1ZrlaEWKi60u0UiAY4vtdmE0HSJz1v61TWgKhVg2tvT9Gf2DXKuZdU9W
 Qm8w8nqhtTng9X5KlQXoCcEqtTwe6ZePRapHZm+7aQ6qWFk2YFcI/RB4YY548+QrURBF
 O3h3QMi1w7si6AUgsajSle7iJ4uo4biGCQhz2zE865BuFiTyXNzGF7ylqx3gtwnVZqfL
 /clbc0enPdqxTbWCEOh588xli0BLVoPvHomooa6aEsEDV+taZbYXG/9FZDvVhcY2cWDk
 RbpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689287706; x=1691879706;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xnl899DnW28MqtEKQfEvFKzBolU6ytR3AztorS+3lyA=;
 b=UuObJkctNyQJpxwAEutJZ1fKJ3KOVEvxujJ9dBlyywveZiOn05W07qNlD7D3J1Q6po
 vngF++Wy+XeAqKQNH4ifsA6gze9qn847QgL5Yaldu7SchUqqEVC3PV0hpK2lZHKPt/GS
 hFk5B1N40ID+YVScQV7+LGPPKRMdQ4yvzTMe0DLjNBpgJvuVcd6/W2jm+Zz898yctbI3
 9OTWqsbIxA+5dsmig0CPDG3jzuKslt5INKEFuh/b1fZyV08KdrwUSt+reichOXCrEblN
 hs14VQdbkz7/VIgzaQRhlsXoigP95E6SCz/XVFIrJiVU3QsANcKZPIBuxG0/eXKaLp+y
 kOXQ==
X-Gm-Message-State: ABy/qLarPgLT9nnJmLQszoOUz1++K8UwndpFbi3m1Z/3AmTjIX5eiOt6
 /exEUd5h4VjCpKLXLTeVetSN3g==
X-Google-Smtp-Source: APBJJlHmYC3CLf2Rap+bqJCiBmPc4DZ//9VolnKfEizyw6D8NOYz/G0d08th5GX1RXl71ohzBX59bw==
X-Received: by 2002:a05:6870:440f:b0:18b:1936:30ee with SMTP id
 u15-20020a056870440f00b0018b193630eemr3879205oah.56.1689287706220; 
 Thu, 13 Jul 2023 15:35:06 -0700 (PDT)
Received: from [192.168.68.107] (201-69-66-19.dial-up.telesp.net.br.
 [201.69.66.19]) by smtp.gmail.com with ESMTPSA id
 zh27-20020a0568716b9b00b001a663e49523sm3469232oab.36.2023.07.13.15.35.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jul 2023 15:35:05 -0700 (PDT)
Message-ID: <f5f76a03-411c-fb7e-5c21-f261a0e0b141@ventanamicro.com>
Date: Thu, 13 Jul 2023 19:35:01 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: Boot failure after QEMU's upgrade to OpenSBI v1.3 (was Re: [PATCH
 for-8.2 6/7] target/riscv: add 'max' CPU type)
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 palmer@rivosinc.com, opensbi@lists.infradead.org
References: <20230712190149.424675-1-dbarboza@ventanamicro.com>
 <20230712190149.424675-7-dbarboza@ventanamicro.com>
 <20230712-stench-happiness-40c2ea831257@spud>
 <3e9b5be8-d3ca-3a17-bef9-4a6a5bdc0ad0@ventanamicro.com>
 <20230712-tulip-replica-0322e71c3e81@spud>
 <744cbde6-7ce5-c327-3c5a-3858e994cc39@ventanamicro.com>
 <20230712-superhero-rabid-578605f52927@spud>
 <5dd3366d-13ba-c7fb-554f-549d97e7d4f9@ventanamicro.com>
 <20230712-fancied-aviator-270f51166407@spud>
 <20230713-craziness-lankiness-8aec3db24993@spud>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230713-craziness-lankiness-8aec3db24993@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.096,
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



On 7/13/23 19:12, Conor Dooley wrote:
> +CC OpenSBI Mailing list
> 
> I've not yet had the chance to bisect this, so adding the OpenSBI folks
> to CC in case they might have an idea for what to try.
> 
> And a question for you below Daniel.
> 
> On Wed, Jul 12, 2023 at 11:14:21PM +0100, Conor Dooley wrote:
>> On Wed, Jul 12, 2023 at 06:39:28PM -0300, Daniel Henrique Barboza wrote:
>>> On 7/12/23 18:35, Conor Dooley wrote:
>>>> On Wed, Jul 12, 2023 at 06:09:10PM -0300, Daniel Henrique Barboza wrote:
>>>>
>>>>> It is intentional. Those default marchid/mimpid vals were derived from the current
>>>>> QEMU version ID/build and didn't mean much.
>>>>>
>>>>> It is still possible to set them via "-cpu rv64,marchid=N,mimpid=N" if needed when
>>>>> using the generic (rv64,rv32) CPUs. Vendor CPUs can't have their machine IDs changed
>>>>> via command line.
>>>>
>>>> Sounds good, thanks. I did just now go and check icicle to see what it
>>>> would report & it does not boot. I'll go bisect...
>>>
>>> BTW how are you booting the icicle board nowadays? I remember you mentioning about
>>> some changes in the FDT being required to boot and whatnot.
>>
>> I do direct kernel boots, as the HSS doesn't work anymore, and just lie
>> a bit to QEMU about how much DDR we have.
>> .PHONY: qemu-icicle
>> qemu-icicle:
>> 	$(qemu) -M microchip-icicle-kit \
>> 		-m 3G -smp 5 \
>> 		-kernel $(vmlinux_bin) \
>> 		-dtb $(icicle_dtb) \
>> 		-initrd $(initramfs) \
>> 		-display none -serial null \
>> 		-serial stdio \
>> 		-D qemu.log -d unimp
>>
>> The platform only supports 2 GiB of DDR, not 3, but if I pass 2 to QEMU
>> it thinks there's 1 GiB at 0x8000_0000 and 1 GiB at 0x10_0000_0000. The
>> upstream devicetree (and current FPGA reference design) expects there to
>> be 1 GiB at 0x8000_0000 and 1 GiB at 0x10_4000_0000. If I lie to QEMU,
>> it thinks there is 1 GiB at 0x8000_0000 and 2 GiB at 0x10_0000_0000, and
>> things just work. I prefer doing it this way than having to modify the
>> DT, it is a lot easier to explain to people this way.
>>
>> I've been meaning to work the support for the icicle & mpfs in QEMU, but
>> it just gets shunted down the priority list. I'd really like if a proper
>> boot flow would run in QEMU, which means fixing whatever broke the HSS,
>> but I've recently picked up maintainership of dt-binding stuff in Linux,
>> so I've unfortunately got even less time to try and work on it. Maybe
>> we'll get some new graduate in and I can make them suffer in my stead...
>>
>>> If it's not too hard I'll add it in my test scripts to keep it under check. Perhaps
>>> we can even add it to QEMU testsuite.
>>
>> I don't think it really should be that bad, at least for the direct
>> kernel boot, which is what I mainly care about, since I use it fairly
>> often for debugging boot stuff in Linux.
>>
>> Anyways, aa903cf31391dd505b399627158f1292a6d19896 is the first bad commit:
>> commit aa903cf31391dd505b399627158f1292a6d19896
>> Author: Bin Meng <bmeng@tinylab.org>
>> Date:   Fri Jun 30 23:36:04 2023 +0800
>>
>>      roms/opensbi: Upgrade from v1.2 to v1.3
>>      
>>      Upgrade OpenSBI from v1.2 to v1.3 and the pre-built bios images.
>>
>> And I see something like:
>> qemu//build/qemu-system-riscv64 -M microchip-icicle-kit \
>>          -m 3G -smp 5 \
>>          -kernel vmlinux.bin \
>>          -dtb icicle.dtb \
>>          -initrd initramfs.cpio.gz \
>>          -display none -serial null \
>>          -serial stdio \
>>          -D qemu.log -d unimp
> 
>> qemu-system-riscv64: warning: disabling zca extension for hart 0x0000000000000000 because privilege spec version does not match
>> qemu-system-riscv64: warning: disabling zca extension for hart 0x0000000000000001 because privilege spec version does not match
>> qemu-system-riscv64: warning: disabling zcd extension for hart 0x0000000000000001 because privilege spec version does not match
>> qemu-system-riscv64: warning: disabling zca extension for hart 0x0000000000000002 because privilege spec version does not match
>> qemu-system-riscv64: warning: disabling zcd extension for hart 0x0000000000000002 because privilege spec version does not match
>> qemu-system-riscv64: warning: disabling zca extension for hart 0x0000000000000003 because privilege spec version does not match
>> qemu-system-riscv64: warning: disabling zcd extension for hart 0x0000000000000003 because privilege spec version does not match
>> qemu-system-riscv64: warning: disabling zca extension for hart 0x0000000000000004 because privilege spec version does not match
>> qemu-system-riscv64: warning: disabling zcd extension for hart 0x0000000000000004 because privilege spec version does not match
> 
> Why am I seeing these warnings? Does the mpfs machine type need to
> disable some things? It only supports rv64imafdc per the DT, and
> predates things like Zca existing, so emitting warnings does not seem
> fair at all to me!

QEMU will disable extensions that are newer than a priv spec version that is set
by the CPU. IIUC the icicle board is running a sifive_u54 CPU by default. That
CPU has a priv spec version 1_10_0. The CPU is also enabling C.

We will enable zca if C is enabled. C and D enabled will also enable zcd. But
then the priv check will disabled both because zca and zcd have priv spec 1_12_0.

This is a side effect for a change that I did a few months ago. Back then we
weren't disabling stuff correctly. The warnings are annoying but are benign.
And apparently the sifive_u54 CPU is being inconsistent for some time and
we noticed just now.

Now, if the icicle board is supposed to have zca and zcd then we have a problem.
We'll need to discuss whether we move sifive_u54 CPU priv spec to 1_12_0 (I'm not
sure how this will affect other boards that uses this CPU) or remove this priv spec
disable code altogether from QEMU.


Thanks,

Daniel



> 
>>
>> OpenSBI v1.3
>>     ____                    _____ ____ _____
>>    / __ \                  / ____|  _ \_   _|
>>   | |  | |_ __   ___ _ __ | (___ | |_) || |
>>   | |  | | '_ \ / _ \ '_ \ \___ \|  _ < | |
>>   | |__| | |_) |  __/ | | |____) | |_) || |_
>>    \____/| .__/ \___|_| |_|_____/|___/_____|
>>          | |
>>          |_|
>>
>> init_coldboot: ipi init failed (error -1009)
>>
>> Just to note, because we use our own firmware that vendors in OpenSBI
>> and compiles only a significantly cut down number of files from it, we
>> do not use the fw_dynamic etc flow on our hardware. As a result, we have
>> not tested v1.3, nor do we have any immediate plans to change our
>> platform firmware to vendor v1.3 either.
>>
>> I unless there's something obvious to you, it sounds like I will need to
>> go and bisect OpenSBI. That's a job for another day though, given the
>> time.
>>
>> Cheers,
>> Conor.
> 
> 

