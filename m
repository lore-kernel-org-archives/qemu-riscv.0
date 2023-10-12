Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 290F6CDB46E
	for <qemu-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 14:45:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qqwwB-0002eW-7X; Thu, 12 Oct 2023 10:45:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qqww9-0002b8-TF
 for qemu-riscv@nongnu.org; Thu, 12 Oct 2023 10:45:17 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1qqww8-0007F5-1P
 for qemu-riscv@nongnu.org; Thu, 12 Oct 2023 10:45:17 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-690bd59322dso811837b3a.3
 for <qemu-riscv@nongnu.org>; Thu, 12 Oct 2023 07:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1697121914; x=1697726714;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+gxakmX5egNupoUva4qv0ThRigbN+mUSk0Jo0iRI4+c=;
 b=meXKpO649cTfMDc008ur7aG1Nv16iAGgiRmdTqChr/Ska0ys3j3rN7sFctXB/OqMWc
 YMQIknigJlI8OEfRXqgWn3QV4DIwN+bKmkBGzwI3VWRvEXaXoSy+xLUrBHqgtclgduQb
 BNym/67XkeA6XFJcVY8SaIFtzgLDHOs6ozByOavZz63ELu9ViunXXP4csqBId4PAyp5N
 kGE/ISsPAG5KXTUTVphCHcfvpvNBByCEldarj/F9kT2cwdIaB88lTmE0JgDhVYCmFbVw
 Z+8rMTntNSHTMC+he1eRs5fPM9ymUQYz/gKjZ73EM5VtW7civwgkc4tv8gG9HiiVp3Fj
 foCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697121914; x=1697726714;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+gxakmX5egNupoUva4qv0ThRigbN+mUSk0Jo0iRI4+c=;
 b=Jn87Yf2KikzUA+ns4oZrpoKC6PV6ChCAozpCtPQsCL45EDCafcSdrgoaqyQceqWYgF
 dJBz07QlKMr121U99hCEOduzcTkBhbMslE2UeOGqbdMrKdZrJW6VeVeW9lmias1cE0iC
 yScM4POBt+wU3hDZi0Gu4/QZFSCyB2jSZxyPkivwH+tG5Cx0RVd1Arx+fkHRIZ+0YYjT
 6Br3UxzAtSjweAmIwyf6NTw8OjueSE++MCwFF1yIrAd+mpJ7YfTob3xZHOPHz8bfIPlW
 SOfMlRn81s2GeyBB4ITlAssBksZ889SRWQImt3ta+zXGa7RjbuoyKtmSgB9KelVgFQI7
 0mJQ==
X-Gm-Message-State: AOJu0YzULkAh9cwlCpbf0PU+ukTiUGPUGoVpnmWkRM4cbJI0mqoSqvUS
 h3R3yENPhzMqDaWZ0Yg+XnQA+g==
X-Google-Smtp-Source: AGHT+IG6msMDBy42iIKwAHANSgWLrCQlK34Sg8Ybyakh4SAKLr0ImFK8wAXKv4pv6OmMhYZ+V96BQw==
X-Received: by 2002:a05:6a20:dda4:b0:16b:7602:1837 with SMTP id
 kw36-20020a056a20dda400b0016b76021837mr14670113pzb.29.1697121914552; 
 Thu, 12 Oct 2023 07:45:14 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:78d2:b862:10a7:d486?
 ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
 by smtp.gmail.com with ESMTPSA id
 jw10-20020a170903278a00b001c5fa48b9a0sm2083248plb.33.2023.10.12.07.45.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Oct 2023 07:45:14 -0700 (PDT)
Message-ID: <d38a342b-4c63-46b0-9ce3-952412708eea@daynix.com>
Date: Thu, 12 Oct 2023 23:45:07 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 11/18] gdbstub: Infer number of core registers from XML
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Mikhail Tyutin <m.tyutin@yadro.com>, Aleksandr Anenkov
 <a.anenkov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Peter Maydell
 <peter.maydell@linaro.org>, Michael Rolnik <mrolnik@gmail.com>,
 Brian Cain <bcain@quicinc.com>, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Laurent Vivier
 <laurent@vivier.eu>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 "open list:S390 general arch..." <qemu-s390x@nongnu.org>
References: <20231012130616.7941-1-akihiko.odaki@daynix.com>
 <20231012130616.7941-12-akihiko.odaki@daynix.com>
 <62fd649b-1c07-c0f5-11cc-ca17ad0675e5@linaro.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <62fd649b-1c07-c0f5-11cc-ca17ad0675e5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42b;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On 2023/10/12 22:43, Philippe Mathieu-Daudé wrote:
> Hi Akihiko,
> 
> On 12/10/23 15:06, Akihiko Odaki wrote:
>> GDBFeature has the num_regs member so use it where applicable to
>> remove magic numbers.
>>
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>> ---
>>   include/hw/core/cpu.h   | 3 ++-
>>   target/s390x/cpu.h      | 2 --
>>   gdbstub/gdbstub.c       | 5 ++++-
>>   target/arm/cpu.c        | 1 -
>>   target/arm/cpu64.c      | 1 -
>>   target/avr/cpu.c        | 1 -
>>   target/hexagon/cpu.c    | 1 -
>>   target/i386/cpu.c       | 2 --
>>   target/loongarch/cpu.c  | 2 --
>>   target/m68k/cpu.c       | 1 -
>>   target/microblaze/cpu.c | 1 -
>>   target/riscv/cpu.c      | 1 -
>>   target/rx/cpu.c         | 1 -
>>   target/s390x/cpu.c      | 1 -
>>   14 files changed, 6 insertions(+), 17 deletions(-)
>>
>> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
>> index 3968369554..11d4b5cd0c 100644
>> --- a/include/hw/core/cpu.h
>> +++ b/include/hw/core/cpu.h
>> @@ -127,7 +127,8 @@ struct SysemuCPUOps;
>>    * @gdb_adjust_breakpoint: Callback for adjusting the address of a
>>    *       breakpoint.  Used by AVR to handle a gdb mis-feature with
>>    *       its Harvard architecture split code and data.
>> - * @gdb_num_core_regs: Number of core registers accessible to GDB.
>> + * @gdb_num_core_regs: Number of core registers accessible to GDB or 
>> 0 to infer
>> + *                     from @gdb_core_xml_file.
>>    * @gdb_core_xml_file: File name for core registers GDB XML 
>> description.
>>    * @gdb_stop_before_watchpoint: Indicates whether GDB expects the 
>> CPU to stop
>>    *           before the insn which triggers a watchpoint rather than 
>> after it.
>> diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
>> index 7bea7075e1..83eafbe4b1 100644
>> --- a/target/s390x/cpu.h
>> +++ b/target/s390x/cpu.h
>> @@ -452,8 +452,6 @@ static inline void 
>> cpu_get_tb_cpu_state(CPUS390XState *env, vaddr *pc,
>>   #define S390_R13_REGNUM 15
>>   #define S390_R14_REGNUM 16
>>   #define S390_R15_REGNUM 17
>> -/* Total Core Registers. */
>> -#define S390_NUM_CORE_REGS 18
>>   static inline void setcc(S390CPU *cpu, uint64_t cc)
>>   {
>> diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
>> index 49fb23a68a..c19f1785e4 100644
>> --- a/gdbstub/gdbstub.c
>> +++ b/gdbstub/gdbstub.c
>> @@ -541,9 +541,12 @@ void gdb_init_cpu(CPUState *cpu)
>>           gdb_register_feature(cpu, 0,
>>                                cc->gdb_read_register, 
>> cc->gdb_write_register,
>>                                feature);
>> +        cpu->gdb_num_regs = cpu->gdb_num_g_regs = feature->num_regs;
>>       }
>> -    cpu->gdb_num_regs = cpu->gdb_num_g_regs = cc->gdb_num_core_regs;
>> +    if (cc->gdb_num_core_regs) {
>> +        cpu->gdb_num_regs = cpu->gdb_num_g_regs = cc->gdb_num_core_regs;
> 
> Why not remove SysemuCPUOps::gdb_num_core_regs entirely?

It is used by targets without XMLs and ppc, which overrides the number 
from XML.

