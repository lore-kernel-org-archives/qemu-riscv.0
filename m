Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 604DBEC8722
	for <qemu-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 12:55:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qeEXh-0000zh-PA; Thu, 07 Sep 2023 08:55:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qeB2c-0008OY-PD
 for qemu-riscv@nongnu.org; Thu, 07 Sep 2023 05:11:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qeB2a-0003JU-F3
 for qemu-riscv@nongnu.org; Thu, 07 Sep 2023 05:11:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694077867;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eeMgvZVuwwc5tBYGgCkZlXtjtK159QxCYcggUkkSACY=;
 b=DwrEARz1Nv19JcMe31OHZ+1o8pG4Fp/iu2sMVVXY9KkdMB4IznfErrdUzXj07WvSW3NHgE
 1b8vXkRHoUWLjb4B+w1hh5dAvpaJJu2Z0eVx7E7k+647pjsnXf8M52jcGdFG5hsKWAcio8
 2oOew0Pan5wta/VUl93M6T/KuhNvN7U=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-413-Ku9pJRaUNva0lfN9PKSchQ-1; Thu, 07 Sep 2023 05:11:06 -0400
X-MC-Unique: Ku9pJRaUNva0lfN9PKSchQ-1
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-64abfd83a0cso9446756d6.2
 for <qemu-riscv@nongnu.org>; Thu, 07 Sep 2023 02:11:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694077865; x=1694682665;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eeMgvZVuwwc5tBYGgCkZlXtjtK159QxCYcggUkkSACY=;
 b=OflwgpT3iTPVGXFxjD8PXE8iHe7Xth9p3B4/rAELoiJVKa2zWfcrhPAWofsTJl1BQm
 NrBNeutxw/DSOzOevtfYYMSN5kf9pJCr785w3uvHAhS6P8yA0TnWxg0ehG4aGpveQ+7T
 oyxRlvhZS6+vCUJg6Nfs90VNmYNaV5S3go27CDssRtBZnAwrqI1Tz+Lf9XKr9ABzFDUd
 X4QTvPr03VvH7gXB7hBBWVcWpUZFTzqPkzxSWXtFu8o5qRYFnhV2cjufSuLv7ZnduTSY
 8pqexLnc8tFbKarPzL0+PitFvvIOuQgIkjRlM1W4GtZik47My0h0+ml/LZga66OZHvzR
 Z4Jw==
X-Gm-Message-State: AOJu0YyGujytFqmeY26rhgAAaYusJH0ELr/w1LibNzW8j5q7R2Cqyt6Q
 3urteb9Sn51/LLEzULIgvLU2TRPym/5omcKfd1JCFOEibXjBTL3CP54+E5UpvKjnmQm3oYSFZ1o
 JO7Nc3tmjTjSX5Ro=
X-Received: by 2002:a0c:df13:0:b0:639:91ad:64d6 with SMTP id
 g19-20020a0cdf13000000b0063991ad64d6mr20094929qvl.61.1694077865611; 
 Thu, 07 Sep 2023 02:11:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9ekltmz/rY+Gir4DQ4NctVk637hzRIJwLBV6Czjt2uNPeo8oCO+FDZhwhHBEOlkM/jwiesQ==
X-Received: by 2002:a0c:df13:0:b0:639:91ad:64d6 with SMTP id
 g19-20020a0cdf13000000b0063991ad64d6mr20094910qvl.61.1694077865347; 
 Thu, 07 Sep 2023 02:11:05 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a0cf50a000000b0064906cfe430sm6261494qvm.135.2023.09.07.02.11.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Sep 2023 02:11:04 -0700 (PDT)
Message-ID: <2916216f-39a0-1a27-ad4e-6c664bf4a04e@redhat.com>
Date: Thu, 7 Sep 2023 11:10:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] hw/riscv: split RAM into low and high memory
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 "Wu, Fei" <fei2.wu@intel.com>, Andrew Jones <ajones@ventanamicro.com>
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Andrei Warkentin <andrei.warkentin@intel.com>, qemu-arm
 <qemu-arm@nongnu.org>, Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
References: <20230731015317.1026996-1-fei2.wu@intel.com>
 <20230803-3855259bbabb934c247c5607@orel>
 <d654810c-4f4f-7491-7711-c6076f42dcae@intel.com>
 <efc85591-fd5e-c6e7-ab3d-220d5ca57aa5@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <efc85591-fd5e-c6e7-ab3d-220d5ca57aa5@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.473, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 07 Sep 2023 08:55:28 -0400
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Hi,

On 9/7/23 09:16, Philippe Mathieu-Daudé wrote:
> Widening Cc to ARM/VFIO.
>
> On 4/8/23 11:15, Wu, Fei wrote:
>> On 8/3/2023 11:07 PM, Andrew Jones wrote:
>>> On Mon, Jul 31, 2023 at 09:53:17AM +0800, Fei Wu wrote:
>>>> riscv virt platform's memory started at 0x80000000 and
>>>> straddled the 4GiB boundary. Curiously enough, this choice
>>>> of a memory layout will prevent from launching a VM with
>>>> a bit more than 2000MiB and PCIe pass-thru on an x86 host, due
>>>> to identity mapping requirements for the MSI doorbell on x86,
>>>> and these (APIC/IOAPIC) live right below 4GiB.
>>>>
>>>> So just split the RAM range into two portions:
>>>> - 1 GiB range from 0x80000000 to 0xc0000000.
>>>> - The remainder at 0x100000000
>>>>
>>>> ...leaving a hole between the ranges.
>>>
>>> Can you elaborate on the use case? Maybe provide details of the host
>>> system and the QEMU command line? I'm wondering why we didn't have
>>> any problems with the arm virt machine type. Has nobody tried this
>>> use case with that? Is the use case something valid for riscv, but
>>> not arm?
>>>
>> Firstly we have to enable pcie passthru on host, find the device groups,
>> e.g. the vga card, and add their pci ids to host kernel cmdline:
>>     vfio-pci.ids=10de:0f02,10de:0e08
>>
>> then start vm through qemu as follows:
>> $Q -machine virt -m 4G -smp 4 -nographic \
>>    -bios /usr/lib/riscv64-linux-gnu/opensbi/generic/fw_jump.elf \
>>    -kernel ./vmlinuz -initrd initrd.img -append "root=/dev/vda1 rw" \
>>    -drive
>> file=ubuntu-22.04.1-preinstalled-server-riscv64+unmatched.img,if=virtio,format=raw
>>
>> \
>>    -device vfio-pci,host=01:00.0 -device vfio-pci,host=01:00.1 \
>>    -netdev user,id=vnet,hostfwd=:127.0.0.1:2223-:22 -device
>> virtio-net-pci,netdev=vnet
>>
>> Without this patch, qemu exits immediately instead of boots up.
>>
>> Just tried pcie passthru on arm, it cannot handle 4G memory either.
>> $Q -m 4G -smp 4 -cpu max -M virt -nographic \
>>    -pflash /usr/share/AAVMF/AAVMF_CODE.fd -pflash flash1.img \
>>    -drive if=none,file=ubuntu-22.04-server-cloudimg-arm64.img,id=hd0 \
>>    -device virtio-blk-device,drive=hd0 \
>>    -device vfio-pci,host=01:00.0 -device vfio-pci,host=01:00.1
>>
>> qemu-system-aarch64: -device vfio-pci,host=01:00.0: VFIO_MAP_DMA failed:
>> Invalid argument
>> qemu-system-aarch64: -device vfio-pci,host=01:00.0: vfio 0000:01:00.0:
>> failed to setup container for group 11: memory listener initialization
>> failed: Region mach-virt.ram: vfio_dma_map(0x55de3c2a97f0, 0x40000000,
>> 0x100000000, 0x7f8fcbe00000) = -22 (Invalid argument)

The collision between the x86 host MSI reserved region [0xfee00000,
0xfeefffff] and the ARM guest RAM starting at 1GB has also always
existed. But now this collision is properly detected instead of being
silenced. People have not really complained about this so far. Since the
existing guest RAM layout couldn't be changed, I am afraid we couldn't
do much.

Eric
>>
>> Thanks,
>> Fei.
>>
>>> Thanks,
>>> drew
>>
>>
>


