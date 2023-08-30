Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1F58C83F15
	for <qemu-riscv@archiver.kernel.org>; Wed, 30 Aug 2023 18:22:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qbPpQ-0007yM-AB; Wed, 30 Aug 2023 14:22:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qbPpK-0007wS-8R
 for qemu-riscv@nongnu.org; Wed, 30 Aug 2023 14:22:03 -0400
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qbPpG-0006v6-E2
 for qemu-riscv@nongnu.org; Wed, 30 Aug 2023 14:22:02 -0400
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-1cccbd43250so4089907fac.1
 for <qemu-riscv@nongnu.org>; Wed, 30 Aug 2023 11:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1693419717; x=1694024517; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ybMlO36yVsWWZqjpl3dswAOIwf63QiGvHAGprVkkdGs=;
 b=If9umJzu0+yM56bc/018zsn4fLif3oJuRgBWgJDfSe4Af/FN6v3ogu9CEMytewq5RZ
 OAfKQm1HuQDyxfbEtwWWSrBlJfa+2Xcft2QSlfrAHnAQhsg39QbxlaRXImJt2wboICyZ
 MUoGW8dVvymt992TclO8PbBeurYpw2HfvtVjRCJCZnCsjnsxnO3SogObIH6dKXvwk+2d
 VYGNA9dWsoKZc9aTNXBagZdrkrg+JZXCCs2l0K300ubRvBxlCoU6qNg+o5R+lun0QVcx
 A5vmEl7x2gmAHa+VQESXXXmoTgZH4rj2VhJwvdVWk8TKc8YoQBGpbK4eeV/g+mDG6VBh
 D7mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693419717; x=1694024517;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ybMlO36yVsWWZqjpl3dswAOIwf63QiGvHAGprVkkdGs=;
 b=B256ahwMNWQVInwNH1P/K39nzD96TjssDkjAfROSMoZX90B5TfZhBg17cT1i3Cd7DY
 mSOek8iGlI98S4ZP0gz6buYT300eU+1j4yfHCxXA+vInOl3SFUyklp8coqlvG3rypaSV
 EeQWZiEm+Tn81yLMzwq6C6+mVv4uMSMlv5uM9EhqjaAP9CXbQNgMVPvcptcKuPQMEMKI
 I4fLlNLOSVqoKw467hhNNOGMm3zcB5WsY58ZRnEMnelGFdDvrFZBPQ2oRz8wLtUZ+JvR
 j5MQdmr3yq+rjMdJRyvzplnRtWWr+tRF7/y78PNhPQTNB26ab/9QBN2qTlf1p0ir/7zS
 Hlxg==
X-Gm-Message-State: AOJu0YxldoESuFYU7eHKhdlSM69k3gcS12Nvd11wxE990l417SUFug1m
 hJSPvvDXpsWbhUlfOciprrnEKw==
X-Google-Smtp-Source: AGHT+IFXl1cpGxPKK+fyxbk74t820laJBHgXgxCXMIw9qP9Fush4NqQ3k3tOLoU4c2oo+bakdGYudg==
X-Received: by 2002:a05:6870:e988:b0:1c8:c909:8942 with SMTP id
 r8-20020a056870e98800b001c8c9098942mr3794358oao.26.1693419717060; 
 Wed, 30 Aug 2023 11:21:57 -0700 (PDT)
Received: from [192.168.68.108] ([177.94.15.194])
 by smtp.gmail.com with ESMTPSA id
 ny3-20020a056870be0300b001cd07e1c66dsm6704382oab.6.2023.08.30.11.21.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Aug 2023 11:21:56 -0700 (PDT)
Message-ID: <646bd37a-367b-5877-f54d-721f61cbfcd0@ventanamicro.com>
Date: Wed, 30 Aug 2023 15:21:52 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 12/20] target/riscv: move KVM only files to kvm subdir
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
References: <20230825130853.511782-1-dbarboza@ventanamicro.com>
 <20230825130853.511782-13-dbarboza@ventanamicro.com>
 <355beacc-19a4-f860-52ec-c421858b40e1@linaro.org>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <355beacc-19a4-f860-52ec-c421858b40e1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x2a.google.com
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



On 8/28/23 13:47, Philippe Mathieu-Daudé wrote:
> On 25/8/23 15:08, Daniel Henrique Barboza wrote:
>> Move the files to a 'kvm' dir to promote more code separation between
>> accelerators and making our lives easier supporting build options such
>> as --disable-tcg.
>>
>> Rename kvm.c to kvm-cpu.c to keep it in line with its TCG counterpart.
>>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> ---
>>   hw/riscv/virt.c                       | 2 +-
>>   target/riscv/cpu.c                    | 2 +-
>>   target/riscv/{kvm.c => kvm/kvm-cpu.c} | 0
>>   target/riscv/{ => kvm}/kvm-stub.c     | 0
>>   target/riscv/{ => kvm}/kvm_riscv.h    | 0
>>   target/riscv/kvm/meson.build          | 2 ++
>>   target/riscv/meson.build              | 2 +-
>>   7 files changed, 5 insertions(+), 3 deletions(-)
>>   rename target/riscv/{kvm.c => kvm/kvm-cpu.c} (100%)
>>   rename target/riscv/{ => kvm}/kvm-stub.c (100%)
>>   rename target/riscv/{ => kvm}/kvm_riscv.h (100%)
>>   create mode 100644 target/riscv/kvm/meson.build
> 
> 
>> +++ b/target/riscv/kvm/meson.build
>> @@ -0,0 +1,2 @@
>> +riscv_ss.add(when: 'CONFIG_KVM', if_true: files('kvm-cpu.c'),
>> +                                 if_false: files('kvm-stub.c'))
> 
> Hmm maybe we need to add:
> 
> -- >8 --
> diff --git a/include/hw/core/accel-cpu.h b/include/hw/core/accel-cpu.h
> index 5dbfd79955..65973b6f2e 100644
> --- a/include/hw/core/accel-cpu.h
> +++ b/include/hw/core/accel-cpu.h
> @@ -33,6 +33,7 @@ typedef struct AccelCPUClass {
>       void (*cpu_class_init)(CPUClass *cc);
>       void (*cpu_instance_init)(CPUState *cpu);
>       bool (*cpu_realizefn)(CPUState *cpu, Error **errp);
> +    ResettablePhases cpu_reset;
>   } AccelCPUClass;
> ---
> 
> and here:
> 
>   static void kvm_cpu_accel_class_init(ObjectClass *oc, void *data)
>   {
>       AccelCPUClass *acc = ACCEL_CPU_CLASS(oc);
> 
>       acc->cpu_instance_init = kvm_cpu_instance_init;
> +    acc->cpu_reset.hold = kvm_riscv_reset_vcpu;
>   }
> 
> so then calling some accel_cpu_reset_hold() in riscv_cpu_reset_hold(),
> would call kvm_riscv_reset_vcpu() and we can remove kvm-stub.c.


Or we can just remove kvm-stub.c without doing any other changes :)

Just removing it works fine it seems, even with --enable-debug builds. All functions
implemented in the stub are already wrapped in 'if kvm_enabled()' blocks, so the
stub isn't really being used.

I'll take the opportunity to not just remove kvm-stub.c but also add the non-KVM
stubs of all kvm_riscv.h APIs in the header, like you ARM folks are already doing
in kvm_arm.h.  I'll do that in a preliminary patch.


Oh, and a side note: I took a quick look at target/arm/kvm-stub.c and how
write_kvmstate_to_list() and write_list_to_kvmstate() are being called.

Turns out that this works for me:

[danielhb@grind qemu]$ git diff
diff --git a/target/arm/meson.build b/target/arm/meson.build
index e645e456da..e524e1114b 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -8,7 +8,7 @@ arm_ss.add(files(
  ))
  arm_ss.add(zlib)
  
-arm_ss.add(when: 'CONFIG_KVM', if_true: files('hyp_gdbstub.c', 'kvm.c', 'kvm64.c'), if_false: files('kvm-stub.c'))
+arm_ss.add(when: 'CONFIG_KVM', if_true: files('hyp_gdbstub.c', 'kvm.c', 'kvm64.c'))
  arm_ss.add(when: 'CONFIG_HVF', if_true: files('hyp_gdbstub.c'))
  
  arm_ss.add(when: 'TARGET_AARCH64', if_true: files(

[danielhb@grind qemu]$ git rm target/arm/kvm-stub.c
rm 'target/arm/kvm-stub.c'

[danielhb@grind qemu]$ cd build
[danielhb@grind build]$ ../configure --target-list=aarch64-softmmu --enable-debug && make -j
(...)
[2724/2725] Generating docs/QEMU manual with a custom command
[2725/2725] Generating docs/QEMU man pages with a custom command
[danielhb@grind build]$


I suggest you take a look into target/arm/kvm-stub.c. Seems like you can just rip it out.


Thanks,


Daniel


> 
> 
> 

