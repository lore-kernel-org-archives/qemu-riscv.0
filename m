Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADA7ACDB474
	for <qemu-riscv@archiver.kernel.org>; Fri, 13 Oct 2023 01:43:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qr7Cf-0004MM-Fs; Thu, 12 Oct 2023 21:43:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qr7Cd-0004Lw-MI; Thu, 12 Oct 2023 21:42:59 -0400
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qr7Ca-0008Kj-Ns; Thu, 12 Oct 2023 21:42:59 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R191e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046060;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=10; SR=0;
 TI=SMTPD_---0Vu0Cxbi_1697161366; 
Received: from 30.221.101.97(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0Vu0Cxbi_1697161366) by smtp.aliyun-inc.com;
 Fri, 13 Oct 2023 09:42:47 +0800
Message-ID: <5e9662e6-2bbf-4e8d-999a-fc91bbc0c21d@linux.alibaba.com>
Date: Fri, 13 Oct 2023 09:41:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] target/riscv: Add "pmu-mask" property to replace
 "pmu-num"
To: Rob Bradford <rbradford@rivosinc.com>, LIU Zhiwei <baxiantai@gmail.com>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, atishp@rivosinc.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com
References: <20231011145032.81509-1-rbradford@rivosinc.com>
 <20231011145032.81509-6-rbradford@rivosinc.com>
 <e68ea00e-3f7a-4590-beae-6946d9fde671@gmail.com>
 <95425ae7f47334754aa7b706ba8362c2349d2f48.camel@rivosinc.com>
Content-Language: en-US
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <95425ae7f47334754aa7b706ba8362c2349d2f48.camel@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.131;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-131.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001,
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


On 2023/10/12 20:38, Rob Bradford wrote:
> On Thu, 2023-10-12 at 17:05 +0800, LIU Zhiwei wrote:
>>   
>>
>>   
>>   
>> On 2023/10/11 22:45, Rob Bradford wrote:
>>   
>>   
>>>   
>>> Using a mask instead of the number of PMU devices supports the
>>> accurate
>>> emulation of platforms that have a discontinuous set of PMU
>>> counters.
>>>
>>> Generate a warning if the old property changed from the default but
>>> still go ahead and use it to generate the mask if the user has
>>> changed
>>> it from the default
>>>
>>> Signed-off-by: Rob Bradford <rbradford@rivosinc.com>
>>> ---
>>>   target/riscv/cpu.c     |  5 +++--
>>>   target/riscv/cpu_cfg.h |  3 ++-
>>>   target/riscv/machine.c |  2 +-
>>>   target/riscv/pmu.c     | 14 ++++++++++----
>>>   4 files changed, 16 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>>> index c9d8fc12fe..4d2987e568 100644
>>> --- a/target/riscv/cpu.c
>>> +++ b/target/riscv/cpu.c
>>> @@ -1487,7 +1487,7 @@ static void riscv_cpu_realize_tcg(DeviceState
>>> *dev, Error **errp)
>>>           riscv_timer_init(cpu);
>>>       }
>>>   
>>> -    if (cpu->cfg.pmu_num) {
>>> +    if (cpu->cfg.pmu_mask) {
>>>           riscv_pmu_init(cpu, &local_err);
>>>           if (local_err != NULL) {
>>>               error_propagate(errp, local_err);
>>> @@ -1812,7 +1812,8 @@ static void
>>> riscv_cpu_add_misa_properties(Object *cpu_obj)
>>>   
>>>   static Property riscv_cpu_extensions[] = {
>>>       /* Defaults for standard extensions */
>>> -    DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
>>> +    DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16), /*
>>> Deprecated */
>>> +    DEFINE_PROP_UINT32("pmu-mask", RISCVCPU, cfg.pmu_mask,
>>> MAKE_32BIT_MASK(3, 16)),
>>>       DEFINE_PROP_BOOL("sscofpmf", RISCVCPU, cfg.ext_sscofpmf,
>>> false),
>>>       DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
>>>       DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
>>> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
>>> index 0e6a0f245c..d273487040 100644
>>> --- a/target/riscv/cpu_cfg.h
>>> +++ b/target/riscv/cpu_cfg.h
>>> @@ -123,7 +123,8 @@ struct RISCVCPUConfig {
>>>       bool ext_xtheadsync;
>>>       bool ext_XVentanaCondOps;
>>>   
>>> -    uint8_t pmu_num;
>>> +    uint8_t pmu_num; /* Deprecated */
>>> +    uint32_t pmu_mask;
>>>       char *priv_spec;
>>>       char *user_spec;
>>>       char *bext_spec;
>>> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
>>> index c7c862cdd3..9f6e3f7a6d 100644
>>> --- a/target/riscv/machine.c
>>> +++ b/target/riscv/machine.c
>>> @@ -313,7 +313,7 @@ static bool pmu_needed(void *opaque)
>>>   {
>>>       RISCVCPU *cpu = opaque;
>>>   
>>> -    return cpu->cfg.pmu_num;
>>> +    return (cpu->cfg.pmu_mask > 0);
>>>   }
>>>   
>>>   static const VMStateDescription vmstate_pmu_ctr_state = {
>>> diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
>>> index 360c76f63e..f2d35b4d3b 100644
>>> --- a/target/riscv/pmu.c
>>> +++ b/target/riscv/pmu.c
>>> @@ -18,6 +18,7 @@
>>>   
>>>   #include "qemu/osdep.h"
>>>   #include "qemu/log.h"
>>> +#include "qemu/error-report.h"
>>>   #include "cpu.h"
>>>   #include "pmu.h"
>>>   #include "sysemu/cpu-timers.h"
>>> @@ -182,7 +183,7 @@ int riscv_pmu_incr_ctr(RISCVCPU *cpu, enum
>>> riscv_pmu_event_idx event_idx)
>>>       CPURISCVState *env = &cpu->env;
>>>       gpointer value;
>>>   
>>> -    if (!cpu->cfg.pmu_num) {
>>> +    if (!cpu->cfg.pmu_mask) {
>>>           return 0;
>>>       }
>>>       value = g_hash_table_lookup(cpu->pmu_event_ctr_map,
>>> @@ -432,7 +433,7 @@ void riscv_pmu_init(RISCVCPU *cpu, Error
>>> **errp)
>>>   {
>>>       uint8_t pmu_num = cpu->cfg.pmu_num;
>>>   
>>> -    if (pmu_num > (RV_MAX_MHPMCOUNTERS - 3)) {
>>> +    if (ctpop32(cpu->cfg.pmu_mask) > (RV_MAX_MHPMCOUNTERS - 3)) {
>>>   
>>   
>>   
>>>   
>>>           error_setg(errp, "Number of counters exceeds maximum
>>> available");
>>>           return;
>>>       }
>>> @@ -443,6 +444,11 @@ void riscv_pmu_init(RISCVCPU *cpu, Error
>>> **errp)
>>>           return;
>>>       }
>>>   
>>> -    /* Create a bitmask of available programmable counters */
>>> -    cpu->pmu_avail_ctrs = MAKE_32BIT_MASK(3, pmu_num);
>>> +    /* Check if user set it by comparing against default */
>>> +    if (pmu_num != 16) {
>>> +        warn_report("\"pmu-num\" property is deprecated; use
>>> \"pmu-mask\"");
>>> +        cpu->cfg.pmu_mask = MAKE_32BIT_MASK(3, pmu_num);
>>> +    }
>>> +
>>> +    cpu->pmu_avail_ctrs = cpu->cfg.pmu_mask;
>>>   
>>   
>> How to process the pmu_mask[0:2] no-zero bits? They should not
>> included into pmu_avail_ctrs.
>>   
> Good point, thanks Zhiwei. I think rather than masking those bits it is
> better to add a check and error out if those bits are set.

Agree.

Thanks,
Zhiwei

>
> Cheers,
>
> Rob
>
>> Zhiwei
>>   
>>   
>>>   
>>>   }
>>>   
>>   

