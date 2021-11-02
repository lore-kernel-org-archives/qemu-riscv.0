Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mhiuU-0007aL-5Z
	for mharc-qemu-riscv@gnu.org; Mon, 01 Nov 2021 21:48:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mhiuO-0007YW-EV; Mon, 01 Nov 2021 21:48:16 -0400
Received: from out28-100.mail.aliyun.com ([115.124.28.100]:39849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mhiuJ-0002Cc-QX; Mon, 01 Nov 2021 21:48:15 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07584438|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_alarm|0.535756-0.000629913-0.463614;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047198; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.LlxuS-d_1635817682; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.LlxuS-d_1635817682)
 by smtp.aliyun-inc.com(10.147.42.135);
 Tue, 02 Nov 2021 09:48:02 +0800
Subject: Re: [PATCH 02/13] target/riscv: Extend pc for runtime pc write
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com
References: <20211101100143.44356-1-zhiwei_liu@c-sky.com>
 <20211101100143.44356-3-zhiwei_liu@c-sky.com>
 <03cbb2ba-3fc0-e904-6bf6-56ece9cf46b9@linaro.org>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <e454d42a-4d75-f81e-7d37-c3d81945258e@c-sky.com>
Date: Tue, 2 Nov 2021 09:48:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <03cbb2ba-3fc0-e904-6bf6-56ece9cf46b9@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.100; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-100.mail.aliyun.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.14,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 02 Nov 2021 01:48:19 -0000


On 2021/11/1 下午6:33, Richard Henderson wrote:
> On 11/1/21 6:01 AM, LIU Zhiwei wrote:
>> In some cases, we must restore the guest PC to the address of the 
>> start of
>> the TB, such as when the instruction counter hit zero. So extend pc 
>> register
>> according to current xlen for these cases.
>>
>> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
>> ---
>>   target/riscv/cpu.c        | 20 +++++++++++++++++---
>>   target/riscv/cpu.h        |  2 ++
>>   target/riscv/cpu_helper.c |  2 +-
>>   3 files changed, 20 insertions(+), 4 deletions(-)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index 7d53125dbc..7eefd4f6a6 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -319,7 +319,12 @@ static void riscv_cpu_set_pc(CPUState *cs, vaddr 
>> value)
>>   {
>>       RISCVCPU *cpu = RISCV_CPU(cs);
>>       CPURISCVState *env = &cpu->env;
>> -    env->pc = value;
>> +
>> +    if (cpu_get_xl(env) == MXL_RV32) {
>> +        env->pc = (int32_t)value;
>> +    } else {
>> +        env->pc = value;
>> +    }
>>   }
>
> Good.
>
>>   static void riscv_cpu_synchronize_from_tb(CPUState *cs,
>> @@ -327,7 +332,12 @@ static void 
>> riscv_cpu_synchronize_from_tb(CPUState *cs,
>>   {
>>       RISCVCPU *cpu = RISCV_CPU(cs);
>>       CPURISCVState *env = &cpu->env;
>> -    env->pc = tb->pc;
>> +
>> +    if (cpu_get_xl(env) == MXL_RV32) {
>> +        env->pc = (int32_t)tb->pc;
>> +    } else {
>> +        env->pc = tb->pc;
>> +    }
>
> Bad, since TB->PC should be extended properly.
> Though this waits on a change to cpu_get_tb_cpu_state.

Should the env->pc always hold the sign-extend result? In 
cpu_get_tb_cpu_state, we just truncate to the XLEN bits.

Thanks,
Zhiwei

>
>> @@ -348,7 +358,11 @@ static bool riscv_cpu_has_work(CPUState *cs)
>>   void restore_state_to_opc(CPURISCVState *env, TranslationBlock *tb,
>>                             target_ulong *data)
>>   {
>> -    env->pc = data[0];
>> +   if (cpu_get_xl(env) == MXL_RV32) {
>> +        env->pc = (int32_t)data[0];
>> +    } else {
>> +        env->pc = data[0];
>> +    }
>
> Likewise.
>
>
> r~

