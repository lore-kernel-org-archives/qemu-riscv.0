Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F10C83F12
	for <qemu-riscv@archiver.kernel.org>; Mon, 28 Aug 2023 08:48:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qaXv4-00008P-Bq; Mon, 28 Aug 2023 04:48:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qaXv0-0008QB-HJ; Mon, 28 Aug 2023 04:48:18 -0400
Received: from out30-97.freemail.mail.aliyun.com ([115.124.30.97])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qaXux-0000PH-N1; Mon, 28 Aug 2023 04:48:18 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R151e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046059;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=14; SR=0;
 TI=SMTPD_---0VqjBRTm_1693212486; 
Received: from 30.221.109.39(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VqjBRTm_1693212486) by smtp.aliyun-inc.com;
 Mon, 28 Aug 2023 16:48:07 +0800
Message-ID: <11a0292f-5a43-88e2-a06f-6a55a4bc241e@linux.alibaba.com>
Date: Mon, 28 Aug 2023 16:47:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [RFC PATCH 2/3] target/riscv: Add API list_cpu_props
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com,
 richard.henderson@linaro.org, pbonzini@redhat.com, bin.meng@windriver.com,
 liweiwei@iscas.ac.cn, qemu-riscv@nongnu.org, ajones@ventanamicro.com
References: <20230825121651.1534-1-zhiwei_liu@linux.alibaba.com>
 <20230825121651.1534-3-zhiwei_liu@linux.alibaba.com>
 <18c74a22-c4bc-248e-eeef-3120959cf45a@ventanamicro.com>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <18c74a22-c4bc-248e-eeef-3120959cf45a@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.97;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-97.freemail.mail.aliyun.com
X-Spam_score_int: -102
X-Spam_score: -10.3
X-Spam_bar: ----------
X-Spam_report: (-10.3 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.414, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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


On 2023/8/25 21:46, Daniel Henrique Barboza wrote:
>
>
> On 8/25/23 09:16, LIU Zhiwei wrote:
>> This API used for output current configuration for one specified CPU.
>> Currently only RISC-V frontend implements this API.
>>
>> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
>> ---
>>   cpu.c                     |  8 ++++++++
>>   include/exec/cpu-common.h |  1 +
>>   target/riscv/cpu.c        | 10 ++++++++++
>>   target/riscv/cpu.h        |  2 ++
>>   4 files changed, 21 insertions(+)
>>
>> diff --git a/cpu.c b/cpu.c
>> index e1a9239d0f..03a313cd72 100644
>> --- a/cpu.c
>> +++ b/cpu.c
>> @@ -299,6 +299,14 @@ void list_cpus(void)
>>   #endif
>>   }
>>   +void list_cpu_props(CPUState *cs)
>> +{
>> +    /* XXX: implement xxx_cpu_list_props for targets that still miss 
>> it */
>> +#if defined(cpu_list_props)
>> +    cpu_list_props(cs);
>> +#endif
>> +}
>> +
>>   #if defined(CONFIG_USER_ONLY)
>>   void tb_invalidate_phys_addr(hwaddr addr)
>>   {
>> diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
>> index 87dc9a752c..b3160d9218 100644
>> --- a/include/exec/cpu-common.h
>> +++ b/include/exec/cpu-common.h
>> @@ -166,5 +166,6 @@ int cpu_memory_rw_debug(CPUState *cpu, vaddr addr,
>>     /* vl.c */
>>   void list_cpus(void);
>> +void list_cpu_props(CPUState *);
>>     #endif /* CPU_COMMON_H */
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index 6b93b04453..3ea18de06f 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -2226,6 +2226,16 @@ void riscv_cpu_list(void)
>>       g_slist_free(list);
>>   }
>>   +void riscv_cpu_list_props(CPUState *cs)
>> +{
>> +    char *enabled_isa;
>> +
>> +    enabled_isa = riscv_isa_string(RISCV_CPU(cs));
>> +    qemu_printf("Enable extension:\n");
>
> I suggest "Enabled extensions". LGTM otherwise.

Fixed, thanks.

Zhiwei

>
> Daniel
>
>> +    qemu_printf("\t%s\n", enabled_isa);
>> +    /* TODO: output all user configurable options and all possible 
>> extensions */
>> +}
>> +
>>   #define DEFINE_CPU(type_name, initfn)      \
>>       {                                      \
>>           .name = type_name,                 \
>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>> index 6ea22e0eea..af1d47605b 100644
>> --- a/target/riscv/cpu.h
>> +++ b/target/riscv/cpu.h
>> @@ -443,9 +443,11 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr 
>> address, int size,
>>                           bool probe, uintptr_t retaddr);
>>   char *riscv_isa_string(RISCVCPU *cpu);
>>   void riscv_cpu_list(void);
>> +void riscv_cpu_list_props(CPUState *cs);
>>   void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp);
>>     #define cpu_list riscv_cpu_list
>> +#define cpu_list_props riscv_cpu_list_props
>>   #define cpu_mmu_index riscv_cpu_mmu_index
>>     #ifndef CONFIG_USER_ONLY

