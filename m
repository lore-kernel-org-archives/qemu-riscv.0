Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1osx6r-0002yt-5k
	for mharc-qemu-riscv@gnu.org; Wed, 09 Nov 2022 21:16:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1osx6o-0002yH-Pt; Wed, 09 Nov 2022 21:16:02 -0500
Received: from out30-57.freemail.mail.aliyun.com ([115.124.30.57])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1osx6m-0007cJ-PA; Wed, 09 Nov 2022 21:16:02 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R161e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046056;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=12; SR=0;
 TI=SMTPD_---0VUQOu09_1668046551; 
Received: from 30.221.97.70(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VUQOu09_1668046551) by smtp.aliyun-inc.com;
 Thu, 10 Nov 2022 10:15:53 +0800
Message-ID: <4fb639df-889f-a76d-6c62-126ec4d9e5e1@linux.alibaba.com>
Date: Thu, 10 Nov 2022 10:15:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v1 4/4] target/riscv: Add itrigger_enabled field to
 CPURISCVState
To: Alistair Francis <alistair23@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, Alistair.Francis@wdc.com,
 palmer@dabbelt.com, bin.meng@windriver.com,
 sergey.matyukevich@syntacore.com, vladimir.isaev@syntacore.com,
 anatoly.parshintsev@syntacore.com, philipp.tomsich@vrull.eu,
 zhiwei_liu@c-sky.com
References: <20221013062946.7530-1-zhiwei_liu@linux.alibaba.com>
 <20221013062946.7530-5-zhiwei_liu@linux.alibaba.com>
 <CAKmqyKO0EUKg7k95RGnk3_=4BXynECBPfV5-_2VPW4A7p45daw@mail.gmail.com>
Content-Language: en-US
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <CAKmqyKO0EUKg7k95RGnk3_=4BXynECBPfV5-_2VPW4A7p45daw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.57;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-57.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
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
X-List-Received-Date: Thu, 10 Nov 2022 02:16:03 -0000


On 2022/11/10 6:55, Alistair Francis wrote:
> On Thu, Oct 13, 2022 at 4:51 PM LIU Zhiwei <zhiwei_liu@linux.alibaba.com> wrote:
>> Avoid calling riscv_itrigger_enabled() when calculate the tbflags.
>> As the itrigger enable status can only be changed when write
>> tdata1, migration load or itrigger fire, update env->itrigger_enabled
>> at these places.
>>
>> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
>> ---
>>   target/riscv/cpu.h        |  1 +
>>   target/riscv/cpu_helper.c |  3 +--
>>   target/riscv/debug.c      |  3 +++
>>   target/riscv/machine.c    | 15 +++++++++++++++
>>   4 files changed, 20 insertions(+), 2 deletions(-)
>>
>> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
>> index 13ca0f20ae..44499df9da 100644
>> --- a/target/riscv/cpu.h
>> +++ b/target/riscv/cpu.h
>> @@ -331,6 +331,7 @@ struct CPUArchState {
>>       struct CPUWatchpoint *cpu_watchpoint[RV_MAX_TRIGGERS];
>>       QEMUTimer *itrigger_timer[RV_MAX_TRIGGERS];
>>       int64_t last_icount;
>> +    bool itrigger_enabled;
>>
>>       /* machine specific rdtime callback */
>>       uint64_t (*rdtime_fn)(void *);
>> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
>> index 7d8089b218..95c766aec0 100644
>> --- a/target/riscv/cpu_helper.c
>> +++ b/target/riscv/cpu_helper.c
>> @@ -106,8 +106,7 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
>>                              get_field(env->mstatus_hs, MSTATUS_VS));
>>       }
>>       if (riscv_feature(env, RISCV_FEATURE_DEBUG) && !icount_enabled()) {
>> -        flags = FIELD_DP32(flags, TB_FLAGS, ITRIGGER,
>> -                           riscv_itrigger_enabled(env));
>> +        flags = FIELD_DP32(flags, TB_FLAGS, ITRIGGER, env->itrigger_enabled);
>>       }
>>   #endif
>>
>> diff --git a/target/riscv/debug.c b/target/riscv/debug.c
>> index db7745d4a3..2c0c8b18db 100644
>> --- a/target/riscv/debug.c
>> +++ b/target/riscv/debug.c
>> @@ -565,6 +565,7 @@ void helper_itrigger_match(CPURISCVState *env)
>>           }
>>           itrigger_set_count(env, i, count--);
>>           if (!count) {
>> +            env->itrigger_enabled = riscv_itrigger_enabled(env);
>>               do_trigger_action(env, i);
>>           }
>>       }
>> @@ -662,6 +663,8 @@ static void itrigger_reg_write(CPURISCVState *env, target_ulong index,
>>                   /* set the count to timer */
>>                   timer_mod(env->itrigger_timer[index],
>>                             env->last_icount + itrigger_get_count(env, index));
>> +            } else {
>> +                env->itrigger_enabled = riscv_itrigger_enabled(env);
>>               }
>>           }
>>           break;
>> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
>> index c2a94a82b3..cd32a52e19 100644
>> --- a/target/riscv/machine.c
>> +++ b/target/riscv/machine.c
>> @@ -21,6 +21,8 @@
>>   #include "qemu/error-report.h"
>>   #include "sysemu/kvm.h"
>>   #include "migration/cpu.h"
>> +#include "sysemu/cpu-timers.h"
>> +#include "debug.h"
>>
>>   static bool pmp_needed(void *opaque)
>>   {
>> @@ -229,11 +231,24 @@ static bool debug_needed(void *opaque)
>>       return riscv_feature(env, RISCV_FEATURE_DEBUG);
>>   }
>>
>> +static int debug_post_load(void *opaque, int version_id)
>> +{
>> +    RISCVCPU *cpu = opaque;
>> +    CPURISCVState *env = &cpu->env;
>> +
>> +    if (icount_enabled()) {
>> +        env->itrigger_enabled = riscv_itrigger_enabled(env);
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>>   static const VMStateDescription vmstate_debug = {
>>       .name = "cpu/debug",
>>       .version_id = 2,
>>       .minimum_version_id = 2,
> The versions here should be bumped

Hi Alistair and Richard,

I am not sure if we should bump versions when just add post_load 
callback without adding new fields.  I once upstreamed a patch
with a similar change but not bumping version.

Could you give some principles for bumping versions?

Thanks,
Zhiwei

> Alistair
>
>>       .needed = debug_needed,
>> +    .post_load = debug_post_load,
>>       .fields = (VMStateField[]) {
>>           VMSTATE_UINTTL(env.trigger_cur, RISCVCPU),
>>           VMSTATE_UINTTL_ARRAY(env.tdata1, RISCVCPU, RV_MAX_TRIGGERS),
>> --
>> 2.17.1
>>
>>

