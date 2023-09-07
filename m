Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7591FEE14D0
	for <qemu-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 07:18:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qe9H1-0001m1-SC; Thu, 07 Sep 2023 03:17:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qe9Gi-0001kQ-LZ
 for qemu-riscv@nongnu.org; Thu, 07 Sep 2023 03:17:38 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qe9GP-0000E0-UO
 for qemu-riscv@nongnu.org; Thu, 07 Sep 2023 03:17:30 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-401da71b83cso7034245e9.2
 for <qemu-riscv@nongnu.org>; Thu, 07 Sep 2023 00:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694071007; x=1694675807; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oc3lHUeurO7vGjxw+biDlYs90UYXbFJj5ipqCgg2zvo=;
 b=Uoh/cOkXuUSqD2ju+OHRu/w3j+p+ja1GxQ4kNf3xnFsouYg6J6Wn1OtfXOkQJS1Fnp
 LYFigNtpjyiK4GmcM3ggQl2tsTwI3Z+IrB7hlmMfUXlAN9OdN1KvHETiVRWp7xRUyMZL
 h7tT5DK5LWktWCZFuAXCY265EI7HxsdFyZmX9Nqj5Yz+JpikwHxTnHwaioBtft4Zk0Im
 ulDcl+YEbptTwOF4RAtDdz5QNwYZXEoQkmMFjl9aRJzh7mgAl2xLtgs4yq02kSW2MjIB
 4EFzxUd2rn8pJ8L27Hmiy1Fa/ogfNicuR2Q7bbd4LH+Ye4g6yqRzo5eXEC3KvivrixDF
 MhnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694071007; x=1694675807;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oc3lHUeurO7vGjxw+biDlYs90UYXbFJj5ipqCgg2zvo=;
 b=YdCMPJhldub/g/RDxWvhBDlWfJCFWcKt36COXTI91EsDteZT0/OcfvX6PD6KwbJd16
 n1W4Xyw7S0l7HS8cpRdtV6vHUO+R+r2EwLf3hFmihgIXUOaEcUFZIRbZ6vaz+x063QbT
 1UAOvmQ81CtHi7FzTIt8/ovjp8IZTTbi3tTZJp13FSfx9CpjEiD4LG5slUR+0JKuF5Uv
 lzg1rR4ZYRf92gbHZD8uj3iJqKzGEyd6zo9+7iY2gqVaPdWWLh2P4ZgnhgH4ZI4qUOXc
 s4pQDY3aECV4wF8qBlCMEKMld7ykUdcWoQ/7kQUL3PX4OcEjyJFKoTPwArjBCcU2abFy
 05Dw==
X-Gm-Message-State: AOJu0YwgqGxW1aelLTZ8m24VCKcJWQVUJwyr04MKbdHf6vv7ksn2+b2s
 c+blxM3EamVE6hN+mXcFHOt2rA==
X-Google-Smtp-Source: AGHT+IG4h68aclCHGZHWLvYe8BsVt0cEOYP6Qscq1LUGhKKEQws2mZDhnYrdk49tkNDR/t6+T0MjYQ==
X-Received: by 2002:a05:6000:881:b0:317:ed01:dc48 with SMTP id
 cs1-20020a056000088100b00317ed01dc48mr4458248wrb.9.1694071007001; 
 Thu, 07 Sep 2023 00:16:47 -0700 (PDT)
Received: from [192.168.69.115] (176-131-222-226.abo.bbox.fr.
 [176.131.222.226]) by smtp.gmail.com with ESMTPSA id
 c7-20020a5d4147000000b0031de43fe9bfsm22683297wrq.0.2023.09.07.00.16.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Sep 2023 00:16:46 -0700 (PDT)
Message-ID: <efc85591-fd5e-c6e7-ab3d-220d5ca57aa5@linaro.org>
Date: Thu, 7 Sep 2023 09:16:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH] hw/riscv: split RAM into low and high memory
Content-Language: en-US
To: "Wu, Fei" <fei2.wu@intel.com>, Andrew Jones <ajones@ventanamicro.com>
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Andrei Warkentin <andrei.warkentin@intel.com>, qemu-arm
 <qemu-arm@nongnu.org>, Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>,
 Eric Auger <eric.auger@redhat.com>
References: <20230731015317.1026996-1-fei2.wu@intel.com>
 <20230803-3855259bbabb934c247c5607@orel>
 <d654810c-4f4f-7491-7711-c6076f42dcae@intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <d654810c-4f4f-7491-7711-c6076f42dcae@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Widening Cc to ARM/VFIO.

On 4/8/23 11:15, Wu, Fei wrote:
> On 8/3/2023 11:07 PM, Andrew Jones wrote:
>> On Mon, Jul 31, 2023 at 09:53:17AM +0800, Fei Wu wrote:
>>> riscv virt platform's memory started at 0x80000000 and
>>> straddled the 4GiB boundary. Curiously enough, this choice
>>> of a memory layout will prevent from launching a VM with
>>> a bit more than 2000MiB and PCIe pass-thru on an x86 host, due
>>> to identity mapping requirements for the MSI doorbell on x86,
>>> and these (APIC/IOAPIC) live right below 4GiB.
>>>
>>> So just split the RAM range into two portions:
>>> - 1 GiB range from 0x80000000 to 0xc0000000.
>>> - The remainder at 0x100000000
>>>
>>> ...leaving a hole between the ranges.
>>
>> Can you elaborate on the use case? Maybe provide details of the host
>> system and the QEMU command line? I'm wondering why we didn't have
>> any problems with the arm virt machine type. Has nobody tried this
>> use case with that? Is the use case something valid for riscv, but
>> not arm?
>>
> Firstly we have to enable pcie passthru on host, find the device groups,
> e.g. the vga card, and add their pci ids to host kernel cmdline:
> 	vfio-pci.ids=10de:0f02,10de:0e08
> 
> then start vm through qemu as follows:
> $Q -machine virt -m 4G -smp 4 -nographic \
>    -bios /usr/lib/riscv64-linux-gnu/opensbi/generic/fw_jump.elf \
>    -kernel ./vmlinuz -initrd initrd.img -append "root=/dev/vda1 rw" \
>    -drive
> file=ubuntu-22.04.1-preinstalled-server-riscv64+unmatched.img,if=virtio,format=raw
> \
>    -device vfio-pci,host=01:00.0 -device vfio-pci,host=01:00.1 \
>    -netdev user,id=vnet,hostfwd=:127.0.0.1:2223-:22 -device
> virtio-net-pci,netdev=vnet
> 
> Without this patch, qemu exits immediately instead of boots up.
> 
> Just tried pcie passthru on arm, it cannot handle 4G memory either.
> $Q -m 4G -smp 4 -cpu max -M virt -nographic \
>    -pflash /usr/share/AAVMF/AAVMF_CODE.fd -pflash flash1.img \
>    -drive if=none,file=ubuntu-22.04-server-cloudimg-arm64.img,id=hd0 \
>    -device virtio-blk-device,drive=hd0 \
>    -device vfio-pci,host=01:00.0 -device vfio-pci,host=01:00.1
> 
> qemu-system-aarch64: -device vfio-pci,host=01:00.0: VFIO_MAP_DMA failed:
> Invalid argument
> qemu-system-aarch64: -device vfio-pci,host=01:00.0: vfio 0000:01:00.0:
> failed to setup container for group 11: memory listener initialization
> failed: Region mach-virt.ram: vfio_dma_map(0x55de3c2a97f0, 0x40000000,
> 0x100000000, 0x7f8fcbe00000) = -22 (Invalid argument)
> 
> Thanks,
> Fei.
> 
>> Thanks,
>> drew
> 
> 


