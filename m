Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C8DCA0FED
	for <qemu-riscv@archiver.kernel.org>; Fri,  1 Sep 2023 17:19:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qc7nt-0005fa-G6; Fri, 01 Sep 2023 13:19:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qc7nr-0005bG-4n
 for qemu-riscv@nongnu.org; Fri, 01 Sep 2023 13:19:28 -0400
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qc7nm-0007sr-3u
 for qemu-riscv@nongnu.org; Fri, 01 Sep 2023 13:19:24 -0400
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-1c0fcbf7ae4so1502355fac.0
 for <qemu-riscv@nongnu.org>; Fri, 01 Sep 2023 10:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1693588760; x=1694193560; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=es38x9Bg1Mw/R8NCbkQ3Xkv9VM+Ky3SPHGId3ZoIHvk=;
 b=HTy3wWs4x4TAt7Idgm2Y8adDoD2Bhf+SoLwVR167yQlF0deG8cmhe4uReC1w16zL81
 C6VxLX7Tg1I4D56n3CneaEcT+QrQ19AIDSmFANZgejbG8smoUFvgJcEJWjoJj73eFs2L
 fD070nszFomYQJDCaJEmWcUGc7s5ShFBFxDME3mA9x0ie4tcRVcAxFABir37eQTj+HMY
 0LrBX+2LPbttCc7+2L83aYJyKoEAQz/x+lYtp9Wugb9TIHbVrcLFaAq3gEjgQQJdgdL4
 fPA6dNPup04HwcTao2MLAJmneT3frx+mRBY33fwE5oXRrVPQN88zgdhK3y7drW6THSEq
 bD+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693588761; x=1694193561;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=es38x9Bg1Mw/R8NCbkQ3Xkv9VM+Ky3SPHGId3ZoIHvk=;
 b=VDr3rXiXAskqGIELKzS2L8qwwage0PB/b04S/J6UQI32zQtCdUDyDK74/7N27YOv3K
 JXRJRdK/BdiPYZELwaIuVMa4eQl6auvN8OgETsa/UxGtdWHSmED79URNTrJJmFQ3PhPk
 htIVt0C99fkFViVtQz+5AoYAozBmNHoE4tDYpG8InJq5YXCE7aPUT5N4PAyZWmivFBl+
 Pxh+Ap4sG6uy8QfgDCWyFamHoGbZTw15rUttEmakqdxAHZJa0BjleVgjoeT3pI25FELH
 P9KC8Ch+mHJBSbZDcm0VXdQo7He4Y6EDp4rpEdAJqr3sgk7SAGSQfMqocHZUS8PIPwns
 Eqsg==
X-Gm-Message-State: AOJu0Yy4d4n8svbVkRfUEI0TzQfwB3HD2B2d7m7DKfCNaVc0xe4Zpoo8
 Jx4odoHzVu+XiZz8MGTB7bbu1w==
X-Google-Smtp-Source: AGHT+IENPpLJlZefo31K91tm396gCSkpYwVaQcBfrqhzOYxNeF0rowgppMyJgHe0mrRR46b/HO5eWQ==
X-Received: by 2002:a05:6870:3925:b0:1bf:26f0:6b5b with SMTP id
 b37-20020a056870392500b001bf26f06b5bmr3505417oap.32.1693588760712; 
 Fri, 01 Sep 2023 10:19:20 -0700 (PDT)
Received: from [192.168.68.108] ([177.94.15.194])
 by smtp.gmail.com with ESMTPSA id
 hv12-20020a056871cc0c00b001c50fb56845sm2358863oac.16.2023.09.01.10.19.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Sep 2023 10:19:20 -0700 (PDT)
Message-ID: <94d6cf97-204c-e190-4cf5-fa47f2aa15ec@ventanamicro.com>
Date: Fri, 1 Sep 2023 14:19:15 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 12/20] target/riscv: move KVM only files to kvm subdir
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 palmer@rivosinc.com
References: <20230825130853.511782-1-dbarboza@ventanamicro.com>
 <20230825130853.511782-13-dbarboza@ventanamicro.com>
 <20230831-032c04ea20e3338ff9170980@orel>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230831-032c04ea20e3338ff9170980@orel>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x36.google.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.478,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



On 8/31/23 08:30, Andrew Jones wrote:
> On Fri, Aug 25, 2023 at 10:08:45AM -0300, Daniel Henrique Barboza wrote:
>> Move the files to a 'kvm' dir to promote more code separation between
>> accelerators and making our lives easier supporting build options such
>> as --disable-tcg.
>>
>> Rename kvm.c to kvm-cpu.c to keep it in line with its TCG counterpart.
> 
> Now that we have 'kvm' and 'tcg' subdirectories, it seems like we should
> be removing prefixes from files, i.e. 'kvm/cpu.c' and 'tcg/cpu.c' would be
> less verbose and just as easy to identify, but whatever people like...

I don't mind shortening the names. I chose these because x86 names it that
way.

It's also easier to identify in the editor which file I'm editing at that
moment via the filename alone, e.g. tcg-cpu.c is easier to identify than
seeing 'cpu.c' and having to check the rest of the path.

Yes, VSCode user here, too old for vim/emacs :D



Thanks,

Daniel


> 
>>
>> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>> ---
>>   hw/riscv/virt.c                       | 2 +-
>>   target/riscv/cpu.c                    | 2 +-
>>   target/riscv/{kvm.c => kvm/kvm-cpu.c} | 0
>>   target/riscv/{ => kvm}/kvm-stub.c     | 0
>>   target/riscv/{ => kvm}/kvm_riscv.h    | 0
>>   target/riscv/kvm/meson.build          | 2 ++
>>   target/riscv/meson.build              | 2 +-
>>   7 files changed, 5 insertions(+), 3 deletions(-)
>>   rename target/riscv/{kvm.c => kvm/kvm-cpu.c} (100%)
>>   rename target/riscv/{ => kvm}/kvm-stub.c (100%)
>>   rename target/riscv/{ => kvm}/kvm_riscv.h (100%)
>>   create mode 100644 target/riscv/kvm/meson.build
>>
>> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
>> index 388e52a294..77c384ddc3 100644
>> --- a/hw/riscv/virt.c
>> +++ b/hw/riscv/virt.c
>> @@ -35,7 +35,7 @@
>>   #include "hw/riscv/virt.h"
>>   #include "hw/riscv/boot.h"
>>   #include "hw/riscv/numa.h"
>> -#include "kvm_riscv.h"
>> +#include "kvm/kvm_riscv.h"
>>   #include "hw/intc/riscv_aclint.h"
>>   #include "hw/intc/riscv_aplic.h"
>>   #include "hw/intc/riscv_imsic.h"
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index 04c6bfaeef..bf6c8519b1 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -33,7 +33,7 @@
>>   #include "fpu/softfloat-helpers.h"
>>   #include "sysemu/kvm.h"
>>   #include "sysemu/tcg.h"
>> -#include "kvm_riscv.h"
>> +#include "kvm/kvm_riscv.h"
>>   #include "tcg/tcg.h"
>>   
>>   /* RISC-V CPU definitions */
>> diff --git a/target/riscv/kvm.c b/target/riscv/kvm/kvm-cpu.c
>> similarity index 100%
>> rename from target/riscv/kvm.c
>> rename to target/riscv/kvm/kvm-cpu.c
>> diff --git a/target/riscv/kvm-stub.c b/target/riscv/kvm/kvm-stub.c
>> similarity index 100%
>> rename from target/riscv/kvm-stub.c
>> rename to target/riscv/kvm/kvm-stub.c
>> diff --git a/target/riscv/kvm_riscv.h b/target/riscv/kvm/kvm_riscv.h
>> similarity index 100%
>> rename from target/riscv/kvm_riscv.h
>> rename to target/riscv/kvm/kvm_riscv.h
>> diff --git a/target/riscv/kvm/meson.build b/target/riscv/kvm/meson.build
>> new file mode 100644
>> index 0000000000..1cd6783894
>> --- /dev/null
>> +++ b/target/riscv/kvm/meson.build
>> @@ -0,0 +1,2 @@
>> +riscv_ss.add(when: 'CONFIG_KVM', if_true: files('kvm-cpu.c'),
>> +                                 if_false: files('kvm-stub.c'))
>> diff --git a/target/riscv/meson.build b/target/riscv/meson.build
>> index f0486183fa..c53962215f 100644
>> --- a/target/riscv/meson.build
>> +++ b/target/riscv/meson.build
>> @@ -24,7 +24,6 @@ riscv_ss.add(files(
>>     'zce_helper.c',
>>     'vcrypto_helper.c'
>>   ))
>> -riscv_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'), if_false: files('kvm-stub.c'))
>>   
>>   riscv_system_ss = ss.source_set()
>>   riscv_system_ss.add(files(
>> @@ -39,6 +38,7 @@ riscv_system_ss.add(files(
>>   ))
>>   
>>   subdir('tcg')
>> +subdir('kvm')
>>   
>>   target_arch += {'riscv': riscv_ss}
>>   target_softmmu_arch += {'riscv': riscv_system_ss}
>> -- 
>> 2.41.0
>>
>>
> 
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

