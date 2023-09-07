Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E3AAEC872A
	for <qemu-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 13:50:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qeFO5-0001qD-Ru; Thu, 07 Sep 2023 09:49:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qeFNx-0001kS-Sr
 for qemu-riscv@nongnu.org; Thu, 07 Sep 2023 09:49:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qeFNs-0001Ly-1l
 for qemu-riscv@nongnu.org; Thu, 07 Sep 2023 09:49:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694094563;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YPlcy8RuXa+KzHjTVOg+rsoYduMtAwP/C/LcDtp55Bw=;
 b=PwTmwbZGBP7BAFbZ89nDxsYmN8VtwYifpMBJwlIt2HxafxgAYJaHVNq4dzDhOl+S1bd993
 z53DqaRSUmhkZD36wb0rVMKsQJFpKgY4Ou/BbRIwpK/OesxWQ6v3wfwszX0/O4MUfEuVLl
 YmDppPZKIpY9H1ncQwfBs2bP00U0YuA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-82--kNZ2M4MPfWOSiMPohxzAA-1; Thu, 07 Sep 2023 09:49:20 -0400
X-MC-Unique: -kNZ2M4MPfWOSiMPohxzAA-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-401dba99384so6892005e9.3
 for <qemu-riscv@nongnu.org>; Thu, 07 Sep 2023 06:49:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694094559; x=1694699359;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YPlcy8RuXa+KzHjTVOg+rsoYduMtAwP/C/LcDtp55Bw=;
 b=i6+tutI3wcrtgAp5LMyJhkufOt7iTXkkkypCDq/l3pkseLIhH2VtV7V0kjja8XLkno
 K7oS9p1eJQxmhmtdlmhlSU7uq9n3mfB2EQMvgABOgSPKAhrK0ABPutd0CTwmbElLDHj2
 QDuucKuyFjo2Ir3m2YRi15p/yhENI+j0H6uCrl8e763Qw4P15pELxFr33vteu52ghF0b
 beRJoN0F4zaTH5pol568jNqGfoTRKFrPhW4Spkk2pPQt05FGC7qBOT3T5kdyZAczmwwI
 UpbvJsgS0f643c+9xqBOUHHDOmY4hAMz6qCp7SOh4uGrh8Ut26ix8j+P1lzpxmEoqb+6
 aPpw==
X-Gm-Message-State: AOJu0Yw1ubBFiPQzh/2ITKCAULPT4U4myTGXgDRHQHmA4W5AH16eeHCk
 XSHrQX4yWTIEneu7TLQpwHefBKTpx68etR06btxneHg0zb+aq7MDd8wKjEQJX+rVA/5Odq/+Rv/
 70xW4Yap3DqJApy4=
X-Received: by 2002:a05:600c:d5:b0:402:8896:bb7b with SMTP id
 u21-20020a05600c00d500b004028896bb7bmr4470642wmm.6.1694094558870; 
 Thu, 07 Sep 2023 06:49:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUufHIN578PFhCXbLKo5a/cT5avTYO1POFs7xQQoa4brl59Tly+BoFuet2Kuxdmi97LEfxKA==
X-Received: by 2002:a05:600c:d5:b0:402:8896:bb7b with SMTP id
 u21-20020a05600c00d500b004028896bb7bmr4470634wmm.6.1694094558553; 
 Thu, 07 Sep 2023 06:49:18 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 h8-20020adff4c8000000b0031c3ee933b5sm23162912wrp.108.2023.09.07.06.49.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Sep 2023 06:49:17 -0700 (PDT)
Message-ID: <b59dffd3-0cf0-4a0a-f0a1-12d00b0e5bc8@redhat.com>
Date: Thu, 7 Sep 2023 15:49:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] hw/riscv: split RAM into low and high memory
To: "Wu, Fei" <fei2.wu@intel.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Andrew Jones <ajones@ventanamicro.com>
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
 <2916216f-39a0-1a27-ad4e-6c664bf4a04e@redhat.com>
 <57b4ae4f-ea55-e17c-bb58-2f878c121038@intel.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <57b4ae4f-ea55-e17c-bb58-2f878c121038@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.473, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Hi,

On 9/7/23 12:04, Wu, Fei wrote:
> On 9/7/2023 5:10 PM, Eric Auger wrote:
>> Hi,
>>
>> On 9/7/23 09:16, Philippe Mathieu-Daudé wrote:
>>> Widening Cc to ARM/VFIO.
>>>
>>> On 4/8/23 11:15, Wu, Fei wrote:
>>>> On 8/3/2023 11:07 PM, Andrew Jones wrote:
>>>>> On Mon, Jul 31, 2023 at 09:53:17AM +0800, Fei Wu wrote:
>>>>>> riscv virt platform's memory started at 0x80000000 and
>>>>>> straddled the 4GiB boundary. Curiously enough, this choice
>>>>>> of a memory layout will prevent from launching a VM with
>>>>>> a bit more than 2000MiB and PCIe pass-thru on an x86 host, due
>>>>>> to identity mapping requirements for the MSI doorbell on x86,
>>>>>> and these (APIC/IOAPIC) live right below 4GiB.
>>>>>>
>>>>>> So just split the RAM range into two portions:
>>>>>> - 1 GiB range from 0x80000000 to 0xc0000000.
>>>>>> - The remainder at 0x100000000
>>>>>>
>>>>>> ...leaving a hole between the ranges.
>>>>> Can you elaborate on the use case? Maybe provide details of the host
>>>>> system and the QEMU command line? I'm wondering why we didn't have
>>>>> any problems with the arm virt machine type. Has nobody tried this
>>>>> use case with that? Is the use case something valid for riscv, but
>>>>> not arm?
>>>>>
>>>> Firstly we have to enable pcie passthru on host, find the device groups,
>>>> e.g. the vga card, and add their pci ids to host kernel cmdline:
>>>>     vfio-pci.ids=10de:0f02,10de:0e08
>>>>
>>>> then start vm through qemu as follows:
>>>> $Q -machine virt -m 4G -smp 4 -nographic \
>>>>    -bios /usr/lib/riscv64-linux-gnu/opensbi/generic/fw_jump.elf \
>>>>    -kernel ./vmlinuz -initrd initrd.img -append "root=/dev/vda1 rw" \
>>>>    -drive
>>>> file=ubuntu-22.04.1-preinstalled-server-riscv64+unmatched.img,if=virtio,format=raw
>>>>
>>>> \
>>>>    -device vfio-pci,host=01:00.0 -device vfio-pci,host=01:00.1 \
>>>>    -netdev user,id=vnet,hostfwd=:127.0.0.1:2223-:22 -device
>>>> virtio-net-pci,netdev=vnet
>>>>
>>>> Without this patch, qemu exits immediately instead of boots up.
>>>>
>>>> Just tried pcie passthru on arm, it cannot handle 4G memory either.
>>>> $Q -m 4G -smp 4 -cpu max -M virt -nographic \
>>>>    -pflash /usr/share/AAVMF/AAVMF_CODE.fd -pflash flash1.img \
>>>>    -drive if=none,file=ubuntu-22.04-server-cloudimg-arm64.img,id=hd0 \
>>>>    -device virtio-blk-device,drive=hd0 \
>>>>    -device vfio-pci,host=01:00.0 -device vfio-pci,host=01:00.1
>>>>
>>>> qemu-system-aarch64: -device vfio-pci,host=01:00.0: VFIO_MAP_DMA failed:
>>>> Invalid argument
>>>> qemu-system-aarch64: -device vfio-pci,host=01:00.0: vfio 0000:01:00.0:
>>>> failed to setup container for group 11: memory listener initialization
>>>> failed: Region mach-virt.ram: vfio_dma_map(0x55de3c2a97f0, 0x40000000,
>>>> 0x100000000, 0x7f8fcbe00000) = -22 (Invalid argument)
>> The collision between the x86 host MSI reserved region [0xfee00000,
>> 0xfeefffff] and the ARM guest RAM starting at 1GB has also always
>> existed. But now this collision is properly detected instead of being
>> silenced. People have not really complained about this so far. Since the
>> existing guest RAM layout couldn't be changed, I am afraid we couldn't
>> do much.
>>
> Just as what this patch does for riscv, arm guest on x86 could do the
> same thing to adjust the guest RAM layout if necessary? This looks like
> a nice-to-have feature for arm if there still is a requirement to run
> arm guest on x86.

Well Peter was opposed to any change in the legacy RAM layout. At some
point on ARM VIRT we added some extra RAM but never changed the existing
layout . But actually nobody ever complained about the lack of support
of this UC (TCG arm guest with host assigned device on x86 host).

Eric
>
> Thanks,
> Fei.
>
>> Eric
>>>> Thanks,
>>>> Fei.
>>>>
>>>>> Thanks,
>>>>> drew
>>>>


