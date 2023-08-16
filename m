Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B56B4C001B0
	for <qemu-riscv@archiver.kernel.org>; Wed, 16 Aug 2023 13:49:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qWGs0-000567-Hn; Wed, 16 Aug 2023 09:47:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qWGry-0004iE-4G
 for qemu-riscv@nongnu.org; Wed, 16 Aug 2023 09:47:30 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qWGru-0003PA-28
 for qemu-riscv@nongnu.org; Wed, 16 Aug 2023 09:47:29 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1bdb7b0c8afso30116205ad.3
 for <qemu-riscv@nongnu.org>; Wed, 16 Aug 2023 06:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1692193644; x=1692798444;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=l/z8QZ0Iyfmp7CByB11orbYdHmX+bbWzBKeQ+vlrDZA=;
 b=B2FXIFjwY4yHzn6USOC/GxHZnIVSlW4HHE37ljJr0T6ccLMl1BRU5Hnw6nsm8eH/a+
 3Uew6y3gd+f9B05ajxeuUvPsPsj+s/NJmd8T6OQGNFSYltZmikZLtYdKhhy7XtAD6Bb5
 yCVALmeVzvpwyYV5V83uVUxVWqr+e8Cfrn+UMoxYR3ImwrOlGgFc7uXCH7Se9p+2xY8P
 pNMCHJP/QldmjQUckv402gRF8uzckTov5MfEYnYMgnxJYT0jDxSU9AIc05oR1ZFS+Dmq
 RI83O7smbdn3rPjam5MzvYQfnONohf+OYX77Is0hmQjtMIEHFDH2RoR8G1Av9QLnt634
 RuMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692193644; x=1692798444;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=l/z8QZ0Iyfmp7CByB11orbYdHmX+bbWzBKeQ+vlrDZA=;
 b=XIDoC9QC3AIDqsl4ssnvbFRWio7Stgax2zDRALmwPT2UGv1MIOLTX407zsCgV6wkBR
 OBe4GT/4sndkzXJ2Wzyj8EOWZW5tHYFS54tQo3TUw8I3V5139d56b4wqdHdctNLmYz/8
 03QW5ap15QFhZfapjvcqAvfiFfPlYS4LFfrQn12Dzzs68NiofYIHufnwaz5Q/2n9qaLb
 GDNDWsdmPmfkEXmH5mgyZosXBKaCagMDOdjfmtxXS40fPaLuUAkZBOhO87tqO/wktGfX
 jxPK3S5ZQQ5oBsteQOZvgL53R5Yx+wfQZDKI6sR+MUJ/5HeEhpQ17pc10pTZTyF93mqV
 Iy+w==
X-Gm-Message-State: AOJu0Yz+KpVSwiRmbxFoXSSDJ+nDoE9dUgcSgMWnjdEJUS21Px6XAzQr
 RTZxEWzLPFozx89E3AAP19Nk/Q==
X-Google-Smtp-Source: AGHT+IEX7HQ67DyK6O1PBSM6FlzIn8b+m72ZldbtSyZnYGzkcPcROr4VNrH508/KmTITzYkfoj3QiA==
X-Received: by 2002:a17:902:830b:b0:1b8:5ab2:49a4 with SMTP id
 bd11-20020a170902830b00b001b85ab249a4mr1610182plb.53.1692193643961; 
 Wed, 16 Aug 2023 06:47:23 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:78d2:b862:10a7:d486?
 ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
 by smtp.gmail.com with ESMTPSA id
 bg3-20020a1709028e8300b001b6a27dff99sm13144303plb.159.2023.08.16.06.47.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Aug 2023 06:47:23 -0700 (PDT)
Message-ID: <ee599577-f185-4f12-b985-209a6322d2f7@daynix.com>
Date: Wed, 16 Aug 2023 22:47:13 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 06/24] hw/core/cpu: Replace gdb_core_xml_file with
 gdb_core_feature
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour
 <ma.mandourr@gmail.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Michael Rolnik
 <mrolnik@gmail.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Brian Cain <bcain@quicinc.com>, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Laurent Vivier
 <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
References: <20230731084354.115015-1-akihiko.odaki@daynix.com>
 <20230731084354.115015-7-akihiko.odaki@daynix.com>
 <871qg5sryb.fsf@linaro.org>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <871qg5sryb.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62c;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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

On 2023/08/14 20:59, Alex Bennée wrote:
> 
> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
> 
>> This is a tree-wide change to replace gdb_core_xml_file, the path to
>> GDB XML file with gdb_core_feature, the pointer to GDBFeature. This
>> also replaces the values assigned to gdb_num_core_regs with the
>> num_regs member of GDBFeature where applicable to remove magic numbers.
>>
>> A following change will utilize additional information provided by
>> GDBFeature to simplify XML file lookup.
>>
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>> ---
>>   include/hw/core/cpu.h   | 5 +++--
>>   target/s390x/cpu.h      | 2 --
>>   gdbstub/gdbstub.c       | 6 +++---
>>   target/arm/cpu.c        | 4 ++--
>>   target/arm/cpu64.c      | 4 ++--
>>   target/arm/tcg/cpu32.c  | 3 ++-
>>   target/avr/cpu.c        | 4 ++--
>>   target/hexagon/cpu.c    | 2 +-
>>   target/i386/cpu.c       | 7 +++----
>>   target/loongarch/cpu.c  | 4 ++--
>>   target/m68k/cpu.c       | 7 ++++---
>>   target/microblaze/cpu.c | 4 ++--
>>   target/ppc/cpu_init.c   | 4 ++--
>>   target/riscv/cpu.c      | 7 ++++---
>>   target/rx/cpu.c         | 4 ++--
>>   target/s390x/cpu.c      | 4 ++--
>>   16 files changed, 36 insertions(+), 35 deletions(-)
>>
>> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
>> index fdcbe87352..84219c1885 100644
>> --- a/include/hw/core/cpu.h
>> +++ b/include/hw/core/cpu.h
>> @@ -23,6 +23,7 @@
>>   #include "hw/qdev-core.h"
>>   #include "disas/dis-asm.h"
>>   #include "exec/cpu-common.h"
>> +#include "exec/gdbstub.h"
>>   #include "exec/hwaddr.h"
>>   #include "exec/memattrs.h"
>>   #include "qapi/qapi-types-run-state.h"
>> @@ -127,7 +128,7 @@ struct SysemuCPUOps;
>>    *       breakpoint.  Used by AVR to handle a gdb mis-feature with
>>    *       its Harvard architecture split code and data.
>>    * @gdb_num_core_regs: Number of core registers accessible to GDB.
> 
> It seems redundant to have this when gdb_core_features already
> encapsulates this, especially since...
> 
>> - * @gdb_core_xml_file: File name for core registers GDB XML description.
>> + * @gdb_core_feature: GDB core feature description.
>>    * @gdb_stop_before_watchpoint: Indicates whether GDB expects the CPU to stop
>>    *           before the insn which triggers a watchpoint rather than after it.
>>    * @gdb_arch_name: Optional callback that returns the architecture name known
>> @@ -163,7 +164,7 @@ struct CPUClass {
>>       int (*gdb_write_register)(CPUState *cpu, uint8_t *buf, int reg);
>>       vaddr (*gdb_adjust_breakpoint)(CPUState *cpu, vaddr addr);
>>   
>> -    const char *gdb_core_xml_file;
>> +    const GDBFeature *gdb_core_feature;
>>       gchar * (*gdb_arch_name)(CPUState *cpu);
>>       const char * (*gdb_get_dynamic_xml)(CPUState *cpu, const char *xmlname);
>>   
> <snip>
>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>> index d71a162070..a206ab6b1b 100644
>> --- a/target/arm/cpu.c
>> +++ b/target/arm/cpu.c
>> @@ -2353,7 +2353,6 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
>>   #ifndef CONFIG_USER_ONLY
>>       cc->sysemu_ops = &arm_sysemu_ops;
>>   #endif
>> -    cc->gdb_num_core_regs = 26;
>>       cc->gdb_arch_name = arm_gdb_arch_name;
>>       cc->gdb_get_dynamic_xml = arm_gdb_get_dynamic_xml;
>>       cc->gdb_stop_before_watchpoint = true;
>> @@ -2378,7 +2377,8 @@ static void cpu_register_class_init(ObjectClass *oc, void *data)
>>       CPUClass *cc = CPU_CLASS(acc);
>>   
>>       acc->info = data;
>> -    cc->gdb_core_xml_file = "arm-core.xml";
>> +    cc->gdb_core_feature = gdb_find_static_feature("arm-core.xml");
>> +    cc->gdb_num_core_regs = cc->gdb_core_feature->num_regs;
> 
> You are doing assignments like this. I think something like this in
> gdbstub:
> 
> modified   gdbstub/gdbstub.c
> @@ -440,7 +440,7 @@ int gdb_read_register(CPUState *cpu, GByteArray *buf, int reg, bool has_xml)
>       CPUArchState *env = cpu->env_ptr;
>       GDBRegisterState *r;
>   
> -    if (reg < cc->gdb_num_core_regs) {
> +    if (reg < cc->gdb_core_feature->num_regs) {
>           return cc->gdb_read_register(cpu, buf, reg, has_xml);
>       }
>   
> @@ -459,7 +459,7 @@ static int gdb_write_register(CPUState *cpu, uint8_t *mem_buf, int reg,
>       CPUArchState *env = cpu->env_ptr;
>       GDBRegisterState *r;
>   
> -    if (reg < cc->gdb_num_core_regs) {
> +    if (reg < cc->gdb_core_feature->num_regs) {
>           return cc->gdb_write_register(cpu, mem_buf, reg, has_xml);
>       }
> 
> makes most of the uses go away. Some of the other arches might need
> target specific tweaks.

The problem is how to deal with the target specific tweaks. ppc requires 
gdb_num_core_regs to have some value greater than 
cc->gdb_core_feature->num_regs for compatibility with legacy GDB. Other 
architectures simply do not have XMLs. Simply replacing 
cc->gdb_num_core_regs with cc->gdb_core_feature->num_regs will break 
those architectures.

> 
> <snip>
> 

