Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3182DC6FA8F
	for <qemu-riscv@archiver.kernel.org>; Wed, 30 Aug 2023 20:55:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qbSDS-0000mZ-L6; Wed, 30 Aug 2023 16:55:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbSDP-0000li-Tk
 for qemu-riscv@nongnu.org; Wed, 30 Aug 2023 16:55:04 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbSDN-00045t-82
 for qemu-riscv@nongnu.org; Wed, 30 Aug 2023 16:55:03 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-31dca134c83so3277664f8f.3
 for <qemu-riscv@nongnu.org>; Wed, 30 Aug 2023 13:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693428899; x=1694033699; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QTOYn7M3xmkrE7uRIAr8EYGFQiXtdi95iLI3EwpLfTM=;
 b=XYyOGojafzI5/ss45pwphA8Lvj62y2HGul8ags7wxlEUqkv5Sk88qbTpxDmHeoxv+d
 IQ1wZVgUvGdllDFx0+JsRzAboZfXzCbmiiQDICGxB7+jLhty3fbNmUTrkwVfMcUioX5Y
 ySueKpzSExQq3nM5i0s8cOKBnk2vFWCFMEZPZfrWlRN1ZVDKjIlYlqKnCWk7QTpwtRie
 mQYuAp9SRXa83VwmE5UrC3kdTW98gVq1/EPADB84shdmPK3heMSPfd2yCezv7N7EALfu
 WlKtnweNyebqw8O8YKVzu/NauHimzco/UZdZAeB67nQR1BKUrdp3Hn3hvahpng//I+Fj
 dsbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693428899; x=1694033699;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QTOYn7M3xmkrE7uRIAr8EYGFQiXtdi95iLI3EwpLfTM=;
 b=hZhSWjHK6tpdVCoIlREUjmsphX2ytp7t03znX3qNJBlI9BogkVaqcThhSbd1kJGxU7
 Eo5PFXo+09h8HSCaEenV+VbZ3NzJRd934M+RyksR1EUgoyhGw0U+5XipNOxvlIy9rVhU
 zVr45bmOfv7Lpzi/n1ZmpmHL8YK0ZxI2G83Y2oYPyTsCdMVei9eWe2ijbvBYOD5zL7dl
 L0wkbtvAthDG41/vP9XO5P2v8vvrEYPfgZIzB5431V4BmgTwNssRS0wAp/QJXzJcKrCT
 u7zqeoqejPnDBjBMT/+QxJNxzmLUSECfiFOqGy+ZE64GX/N//NKwsSR2y6UB9rkW8Bg8
 JCHg==
X-Gm-Message-State: AOJu0YwrSAaqQ+j8waLei8TwFKwyEWlc7E0Bo+n1pmCp7t+2UhXnoO/g
 ZjaeGb5kIdrVhBLZ8K2hCv7ZAw==
X-Google-Smtp-Source: AGHT+IHywk5gdnTQCY26D+n3xPApnnp3rIIrky+CWd223bsAcMj5TOoUjG9x6c5C05FRCDCSoZXSOQ==
X-Received: by 2002:adf:e686:0:b0:31a:e89a:df0a with SMTP id
 r6-20020adfe686000000b0031ae89adf0amr2402114wrm.45.1693428899174; 
 Wed, 30 Aug 2023 13:54:59 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.142.89])
 by smtp.gmail.com with ESMTPSA id
 b3-20020adfde03000000b0031accc7228asm17561661wrm.34.2023.08.30.13.54.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Aug 2023 13:54:58 -0700 (PDT)
Message-ID: <34a72862-02a1-327d-ef43-1b47ef2eb865@linaro.org>
Date: Wed, 30 Aug 2023 22:54:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH 12/20] target/riscv: move KVM only files to kvm subdir
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
References: <20230825130853.511782-1-dbarboza@ventanamicro.com>
 <20230825130853.511782-13-dbarboza@ventanamicro.com>
 <355beacc-19a4-f860-52ec-c421858b40e1@linaro.org>
 <646bd37a-367b-5877-f54d-721f61cbfcd0@ventanamicro.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <646bd37a-367b-5877-f54d-721f61cbfcd0@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.242,
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

On 30/8/23 20:21, Daniel Henrique Barboza wrote:
> 
> 
> On 8/28/23 13:47, Philippe Mathieu-Daudé wrote:
>> On 25/8/23 15:08, Daniel Henrique Barboza wrote:
>>> Move the files to a 'kvm' dir to promote more code separation between
>>> accelerators and making our lives easier supporting build options such
>>> as --disable-tcg.
>>>
>>> Rename kvm.c to kvm-cpu.c to keep it in line with its TCG counterpart.
>>>
>>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>>> ---
>>>   hw/riscv/virt.c                       | 2 +-
>>>   target/riscv/cpu.c                    | 2 +-
>>>   target/riscv/{kvm.c => kvm/kvm-cpu.c} | 0
>>>   target/riscv/{ => kvm}/kvm-stub.c     | 0
>>>   target/riscv/{ => kvm}/kvm_riscv.h    | 0
>>>   target/riscv/kvm/meson.build          | 2 ++
>>>   target/riscv/meson.build              | 2 +-
>>>   7 files changed, 5 insertions(+), 3 deletions(-)
>>>   rename target/riscv/{kvm.c => kvm/kvm-cpu.c} (100%)
>>>   rename target/riscv/{ => kvm}/kvm-stub.c (100%)
>>>   rename target/riscv/{ => kvm}/kvm_riscv.h (100%)
>>>   create mode 100644 target/riscv/kvm/meson.build
>>
>>
>>> +++ b/target/riscv/kvm/meson.build
>>> @@ -0,0 +1,2 @@
>>> +riscv_ss.add(when: 'CONFIG_KVM', if_true: files('kvm-cpu.c'),
>>> +                                 if_false: files('kvm-stub.c'))
>>
>> Hmm maybe we need to add:
>>
>> -- >8 --
>> diff --git a/include/hw/core/accel-cpu.h b/include/hw/core/accel-cpu.h
>> index 5dbfd79955..65973b6f2e 100644
>> --- a/include/hw/core/accel-cpu.h
>> +++ b/include/hw/core/accel-cpu.h
>> @@ -33,6 +33,7 @@ typedef struct AccelCPUClass {
>>       void (*cpu_class_init)(CPUClass *cc);
>>       void (*cpu_instance_init)(CPUState *cpu);
>>       bool (*cpu_realizefn)(CPUState *cpu, Error **errp);
>> +    ResettablePhases cpu_reset;
>>   } AccelCPUClass;
>> ---
>>
>> and here:
>>
>>   static void kvm_cpu_accel_class_init(ObjectClass *oc, void *data)
>>   {
>>       AccelCPUClass *acc = ACCEL_CPU_CLASS(oc);
>>
>>       acc->cpu_instance_init = kvm_cpu_instance_init;
>> +    acc->cpu_reset.hold = kvm_riscv_reset_vcpu;
>>   }
>>
>> so then calling some accel_cpu_reset_hold() in riscv_cpu_reset_hold(),
>> would call kvm_riscv_reset_vcpu() and we can remove kvm-stub.c.
> 
> 
> Or we can just remove kvm-stub.c without doing any other changes :)
> 
> Just removing it works fine it seems, even with --enable-debug builds. 
> All functions
> implemented in the stub are already wrapped in 'if kvm_enabled()' 
> blocks, so the
> stub isn't really being used.
> 
> I'll take the opportunity to not just remove kvm-stub.c but also add the 
> non-KVM
> stubs of all kvm_riscv.h APIs in the header, like you ARM folks are 
> already doing
> in kvm_arm.h.  I'll do that in a preliminary patch.
> 
> 
> Oh, and a side note: I took a quick look at target/arm/kvm-stub.c and how
> write_kvmstate_to_list() and write_list_to_kvmstate() are being called.
> 
> Turns out that this works for me:
> 
> [danielhb@grind qemu]$ git diff
> diff --git a/target/arm/meson.build b/target/arm/meson.build
> index e645e456da..e524e1114b 100644
> --- a/target/arm/meson.build
> +++ b/target/arm/meson.build
> @@ -8,7 +8,7 @@ arm_ss.add(files(
>   ))
>   arm_ss.add(zlib)
> 
> -arm_ss.add(when: 'CONFIG_KVM', if_true: files('hyp_gdbstub.c', 'kvm.c', 
> 'kvm64.c'), if_false: files('kvm-stub.c'))
> +arm_ss.add(when: 'CONFIG_KVM', if_true: files('hyp_gdbstub.c', 'kvm.c', 
> 'kvm64.c'))
>   arm_ss.add(when: 'CONFIG_HVF', if_true: files('hyp_gdbstub.c'))
> 
>   arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
> 
> [danielhb@grind qemu]$ git rm target/arm/kvm-stub.c
> rm 'target/arm/kvm-stub.c'
> 
> [danielhb@grind qemu]$ cd build
> [danielhb@grind build]$ ../configure --target-list=aarch64-softmmu 
> --enable-debug && make -j
> (...)
> [2724/2725] Generating docs/QEMU manual with a custom command
> [2725/2725] Generating docs/QEMU man pages with a custom command
> [danielhb@grind build]$
> 
> 
> I suggest you take a look into target/arm/kvm-stub.c. Seems like you can 
> just rip it out.

Great news, thanks Daniel!


