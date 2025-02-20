Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 823FEC021B2
	for <qemu-riscv@archiver.kernel.org>; Thu, 20 Feb 2025 22:29:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tlF2i-0005YQ-Sb; Thu, 20 Feb 2025 17:29:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tlF2b-0005Xa-7A
 for qemu-riscv@nongnu.org; Thu, 20 Feb 2025 17:29:11 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tlF2Z-0005KM-AD
 for qemu-riscv@nongnu.org; Thu, 20 Feb 2025 17:29:08 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43996e95114so9769325e9.3
 for <qemu-riscv@nongnu.org>; Thu, 20 Feb 2025 14:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740090543; x=1740695343; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=N/7rqyRjk2jq5+8gYrc7ktRzu/nUFo5bffB0tKFoM7Q=;
 b=nQYL9Eztr6oYgPy0GDJu1F2v1Pwpjh7lIU2QMw/0RGhZjgm6DggwPtp+IW3owP+5oQ
 pEmwsdaYNTj04gZMqanu8eKi+q1j9bWoQCbM696KWJS9ZkXUWFle/6iVnmFQZMTZSvLW
 7yMZjso0eZuVx9kNSOpTs70b4baRmkQ/ienDc4bpHHbXB5JL6f498NtVOMaFXcW7QkFF
 FMheqVw5o7lUCebsQdbU35UlHBQZx8RcRZfOXbjs9Cw0XHMAQM9NMk9qRDden2OsQ+cu
 MXLlSK1Kp4OTyWY6vjeAAok3J8dW1jOxjIGr25KFpaExczD+T1JhIKWqLMU5dTy3vLU/
 lpLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740090543; x=1740695343;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N/7rqyRjk2jq5+8gYrc7ktRzu/nUFo5bffB0tKFoM7Q=;
 b=mMXpdiCKUmV1XMoVuDRvrfQfTiuNVZ0IXy5/FI05q9ih+ZL+ZDkevQDL5ujYcmc3mn
 0dgJnchlFvu+vUaCqqur1Vfcvleo7n13xuW6hhGQulExZe5V/27rUg1kcjR1D8icBrde
 sCza7e/imz6mcOTvsIsOZjqAmUdd+clkS8msVCHiByAXJiLxmMNQfYqLbyIKv0g6chRY
 B/wjHt8uyjiYw0CHlgzZPovKzwNO9PRIZRUtwsv+a6ErxWUUOIotVi68forAGAuNYoSc
 dikSeaaTlUQMmaiA7pTF/t/OZ43SnV4Q49x1QBKjjInQ49fB8y+pbuD522WUwJtmtGCp
 gdkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJqFL9UmJtSoEVD1eI1DNgRcGkHZDdWyJTLBiwxBC0tnpz80dwB7Badp/XRWmPOye4b741u4o+o8zC@nongnu.org
X-Gm-Message-State: AOJu0Yxnd3MBE4R2Jr2k3k28ZcPSZkLZXoMuY/4ItYKWCZuT8keG//zy
 3K/PrFME/dZSDIqcGW4C62ImFZklvBZG7nCuKJ1A2bs3rjvXPtOrk0tGeYt5xvg=
X-Gm-Gg: ASbGncsKhJb6PtOlDdL8QE6e8D2ByOqXRK8q95bkLICv6aSq55b1cD8iwHuMJQ8+KPn
 tJl3ZTrzXhpjvib1Js+RYTIrvTbDEl++/XpeaUg1Z42UuTsgtTPkreTzM5jGRFDEYPFqjiB/Hgl
 AZVbXbcLmYIIZ/+qR1ifXMY3yI1geVDCX/m2aVW6Ij/xSVUwErM8Hqi93GjBumLUA+bmaRRxmnQ
 L0ygyzB57M5mXkfp4MRH65+K0nGnaski+a4C7la0xOoOu6SFaT93GFGwyP2H/r1iAWZajL0af+4
 51QsZfHpM4isrEBQDwPWb7d4pBReThaS9l+tEzssGAMpFmMygLZC5u1IcRA=
X-Google-Smtp-Source: AGHT+IFHur79MHodt2fHRD4QAVOlAQO0M3XCLOXhCit1yE2o1YrzOczcxvLsJYGvnRYze11ZPBsrRA==
X-Received: by 2002:a05:600c:3b94:b0:439:8653:20bb with SMTP id
 5b1f17b1804b1-439aeb2b6afmr4032185e9.14.1740090543491; 
 Thu, 20 Feb 2025 14:29:03 -0800 (PST)
Received: from [192.168.69.157] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43995391824sm87349315e9.23.2025.02.20.14.29.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Feb 2025 14:29:03 -0800 (PST)
Message-ID: <ade78f31-5279-4862-acdd-15f083a000e2@linaro.org>
Date: Thu, 20 Feb 2025 23:29:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] Improve Microchip Polarfire SoC customization
To: Conor Dooley <conor@kernel.org>,
 Sebastian Huber <sebastian.huber@embedded-brains.de>
Cc: qemu-devel@nongnu.org, Conor Dooley <conor.dooley@microchip.com>,
 Bin Meng <bin.meng@windriver.com>, alistair.francis@wdc.com,
 qemu-riscv@nongnu.org
References: <20250214062443.9936-1-sebastian.huber@embedded-brains.de>
 <20250220-reggae-hardness-907e385516d8@spud>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250220-reggae-hardness-907e385516d8@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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

Hi Conor,

On 20/2/25 19:30, Conor Dooley wrote:
> +cc qemu-riscv, Alistar.
> 
> On Fri, Feb 14, 2025 at 07:24:37AM +0100, Sebastian Huber wrote:
>> Booting the microchip-icicle-kit machine using the latest PolarFire SoC
>> Hart Software Services (HSS) no longer works since Qemu lacks support
>> for several registers (clocks, DRAM controller). Also reading from the
>> SDCard does not work currently.
> 
> On that note, I think the inaccurate docs about polarfire should be
> removed. There's a wiki page here with dead links, or links to things
> that do not work anymore:
> https://wiki.qemu.org/Documentation/Platforms/RISCV#Microchip_PolarFire_SoC_Icicle_Kit
> I think the whole section should be removed, find it kinda odd that
> there's a polarfire section but not for any other board. Either way,
> it's talking about something that just does not work, the current HSS
> and Yocto don't boot.
> 
> There's also a docs page here:
> https://www.qemu.org/docs/master/system/riscv/microchip-icicle-kit.html
> that has a copy of the table your patch 4 modifies, that probably should
> be updated to match your changes.
> 
> In a similar vein to the wiki, it talks about the HSS and booting a
> yocto wic image. I think those should be deleted since they don't work.
> 
> Alistar/Other RISC-V folks, what do you think? Bin wrote the port but
> seems to be AFK and I don't have the capacity to fix any of that stuff
> on top of what I already do in my spare time - do you agree that
> deleting the now inaccurate docs makes sense?
> 
>> In order to allow tests runs for real-time kernels such as RTEMS and
>> Zephyr, improve the boot customization. This patch set enables a direct
>> run of kernel executables, for example:
>>
>> qemu-system-riscv64 -no-reboot -nographic \
>>    -serial null -serial mon:stdio \
>>    -smp 2 \
>>    -bios none \
>>    -machine microchip-icicle-kit,clint-timebase-frequency=10000000 \
>>    -kernel rtos.elf
> 
> The series breaks my usage:
> qemu//build/qemu-system-riscv64 -M microchip-icicle-kit \
>          -m 3G -smp 5 \
>          -kernel vmlinux.bin \
>          -dtb riscvpc.dtb \
>          -initrd initramfs.cpio.gz \
>          -display none -serial null \
>          -serial mon:stdio \
>          -D qemu.log -d unimp
> opensbi-riscv64-generic-fw_dynamic.bin: No such file or directory
> qemu-system-riscv64: could not load firmware 'opensbi-riscv64-generic-fw_dynamic.bin'
> make: *** [Makefile:305: qemu-icicle] Error 1
> 
> Figure it is likely to be your patch 4? The file does exist, so probably
> some sort of path-to-it issues?

Maybe missing the -L option?

   -L path         set the directory for the BIOS, VGA BIOS and keymaps

Regards,

Phil.

