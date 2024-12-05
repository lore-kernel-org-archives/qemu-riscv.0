Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C5CE7716E
	for <qemu-riscv@archiver.kernel.org>; Thu,  5 Dec 2024 21:26:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tJJMI-00046y-FP; Thu, 05 Dec 2024 16:26:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tJJMG-00042M-3Q
 for qemu-riscv@nongnu.org; Thu, 05 Dec 2024 16:26:00 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tJJME-0005VY-FY
 for qemu-riscv@nongnu.org; Thu, 05 Dec 2024 16:25:59 -0500
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-385f4a4093eso859390f8f.1
 for <qemu-riscv@nongnu.org>; Thu, 05 Dec 2024 13:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733433956; x=1734038756; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=omtQbRMQhqbRzIcyX5GaHy4F6zk+WwtROZbCOmMuv1M=;
 b=uX24dUbGjhKDPYUKHC1IIuD35UsYrf6fXpnjGMXjwlV4InovPlLE6PfWBkT7f/eQDF
 wXAl0McZibgfLLC3bglDwuY31uzmJBig+IysJYO/tlEM6mpFMlhrakhYZJR3WzTC/ZHM
 CrM+O/ai5dKUpwwL/zaCTNrumU9qd/qQhWj+CUlWSzDuhriQcoyOtQnsLz5zYI+gBwV1
 vm5VmgGv08+/3Fb+yd4te1c3iGxQcOu0qqmxu5GAJcGJW95250PfD3Wc6oSd8LadKUOz
 qJCPgvQkqgUNUJRZYS0EUyczH9ezn0bMUSqBfJiOEeyTzWRiIQvkzLIHL0PzapiGxj+z
 sS0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733433956; x=1734038756;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=omtQbRMQhqbRzIcyX5GaHy4F6zk+WwtROZbCOmMuv1M=;
 b=vFHL2PgX5WNfwpf7Xzo3B7fHeVcFFmTfLOhyS149phwpUokWlUqbU2DhBN8lMTY8NH
 fkLzJyQyBClzhDOTbfl972zMg1guNBEZIT6AxjAUrs+3dVVQCYWF6rIbicc9MP92mHR0
 QBXKoqsNEh2o7NZFaFFxfrn3o+DBdcBrGIHEOnbezgOreOJtDEuR9dnmZdPmpsfbFJJK
 Dx3U3oc0F85C1k1erQU/HPlsWphxOV2rrjjCsl7Mvxktc1q/ezV/MAnT939LPIxHw0zO
 en4kfcWli1rDG99KppnjgeluzpWPFiC06OmeyyskZkRTW/x8TE58lvk9Ufyy9Ju1+Wdg
 qr8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUETPjTe3Lf73HRXJpLqLqPkGaInM/Wd0PTBT6YZDbueqxnvCUEPTZpbQxmTaKzBtuSvB53W/exSjwr@nongnu.org
X-Gm-Message-State: AOJu0YxHwzNG8u1uMyRiNqbGy3y3TVGMBA181QYlLRQeSlt/K6u4nIxs
 y6yTLOxb2HB+ccgS2Z2qbVLOICSHJJArStLDcrB1kLCWArYksOL74qR3gO7gW+o=
X-Gm-Gg: ASbGncubybRqeYa8vHF6YfxKpEoCJ4R3uI75jIWYFPVWTiW4Z6R9sHNN94evUsHVRc5
 5W52mNkhJfp/55FGpZ/i7Iglky1vosoW5+iBRp2xcTaXe8Tlv/43dx9JO34qGC+qo57xQF6iASt
 FsUaxbFfNJGe6KRtUfzY99rchH2M7rrz0q/2aHJ4mMe/HWE2gkrdSKmb4zfr+TvuE97fM/28Ax3
 sppu827FaYm5b8t5fB0BXXbbDJYccNJEr4mFjdE0sMKEyXEvXTojz4keE/zBMVwQHc4/8Ni/+XI
 2wnaMPJzy0XA5/1dRA==
X-Google-Smtp-Source: AGHT+IGJpvYcCk2owEqMk96nmcKMshS/LUREU8Pv3E+Q7Hl2sgAfaQvAvgXnWYkTEd/BlGPtou55Qg==
X-Received: by 2002:a05:6000:70a:b0:386:1cf9:b96e with SMTP id
 ffacd0b85a97d-3862b3f6940mr432776f8f.55.1733433956239; 
 Thu, 05 Dec 2024 13:25:56 -0800 (PST)
Received: from [192.168.69.223] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3861fd465dcsm2891641f8f.51.2024.12.05.13.25.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Dec 2024 13:25:55 -0800 (PST)
Message-ID: <745069af-8805-4ca9-81f5-6c26915a59db@linaro.org>
Date: Thu, 5 Dec 2024 22:25:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.0 v2 10/13] hw/pci-host/gpex: Expose
 'refuse-bar-at-addr-0' property
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-riscv@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20241126112212.64524-1-philmd@linaro.org>
 <20241126112212.64524-11-philmd@linaro.org>
 <CAFEAcA8Wm7dq--481ZJMb+fN7MsR9FJuB6hqRC4fW7ZBE5KYXw@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA8Wm7dq--481ZJMb+fN7MsR9FJuB6hqRC4fW7ZBE5KYXw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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

On 5/12/24 17:47, Peter Maydell wrote:
> On Tue, 26 Nov 2024 at 11:23, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> Expose the "refuse-bar-at-addr-0" property so machines
>> using a GPEX host bridge can set this flag on the bus.
>> While the default property is set to 'false', all caller
>> set it to 'true' so there is no logical change so far.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   include/hw/pci-host/gpex.h | 1 +
>>   hw/arm/sbsa-ref.c          | 2 ++
>>   hw/arm/virt.c              | 2 ++
>>   hw/i386/microvm.c          | 2 ++
>>   hw/loongarch/virt.c        | 2 ++
>>   hw/mips/loongson3_virt.c   | 2 ++
>>   hw/openrisc/virt.c         | 2 ++
>>   hw/pci-host/gpex.c         | 4 +++-
>>   hw/riscv/virt.c            | 2 ++
>>   hw/xen/xen-pvh-common.c    | 2 ++
>>   hw/xtensa/virt.c           | 2 ++
>>   11 files changed, 22 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/hw/pci-host/gpex.h b/include/hw/pci-host/gpex.h
>> index dce883573ba..44c6463afb3 100644
>> --- a/include/hw/pci-host/gpex.h
>> +++ b/include/hw/pci-host/gpex.h
>> @@ -64,6 +64,7 @@ struct GPEXHost {
>>       int irq_num[GPEX_NUM_IRQS];
>>
>>       bool allow_unmapped_accesses;
>> +    bool refuse_bar_at_addr_0;
>>
>>       struct GPEXConfig gpex_cfg;
>>   };
>> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
>> index e3195d54497..f6cf43cf0c9 100644
>> --- a/hw/arm/sbsa-ref.c
>> +++ b/hw/arm/sbsa-ref.c
>> @@ -647,6 +647,8 @@ static void create_pcie(SBSAMachineState *sms)
>>       int i;
>>
>>       dev = qdev_new(TYPE_GPEX_HOST);
>> +    object_property_set_bool(OBJECT(dev), "refuse-bar-at-addr-0",
>> +                             true, &error_fatal);
>>       sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>>
>>       /* Map ECAM space */
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 1a381e9a2bd..06affc3638b 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -1510,6 +1510,8 @@ static void create_pcie(VirtMachineState *vms)
>>       MachineClass *mc = MACHINE_GET_CLASS(ms);
>>
>>       dev = qdev_new(TYPE_GPEX_HOST);
>> +    object_property_set_bool(OBJECT(dev), "refuse-bar-at-addr-0",
>> +                             true, &error_fatal);
>>       sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>>
>>       ecam_id = VIRT_ECAM_ID(vms->highmem_ecam);
> 
> These don't look right, because both virt and sbsa-ref
> set mc->pci_allow_0_address = true. And in the next
> patch you delete them again...

Indeed.


