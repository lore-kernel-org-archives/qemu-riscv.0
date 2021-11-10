Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mkoZB-0000al-B5
	for mharc-qemu-riscv@gnu.org; Wed, 10 Nov 2021 09:27:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mkoZ8-0000aQ-KI; Wed, 10 Nov 2021 09:27:06 -0500
Received: from out28-195.mail.aliyun.com ([115.124.28.195]:34028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mkoZ5-0004Al-5I; Wed, 10 Nov 2021 09:27:06 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07443354|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.0201964-0.000225731-0.979578;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047201; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.LqhxTah_1636554414; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.LqhxTah_1636554414)
 by smtp.aliyun-inc.com(10.147.40.26); Wed, 10 Nov 2021 22:26:54 +0800
Subject: Re: [PATCH v2 12/14] target/riscv: Split out the vill from vtype
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com
References: <20211110070452.48539-1-zhiwei_liu@c-sky.com>
 <20211110070452.48539-13-zhiwei_liu@c-sky.com>
 <df7ad986-8430-9994-83ac-33db2ec1f2e3@linaro.org>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <6c0631e7-bb7c-f69c-c5fd-4023c392a7e6@c-sky.com>
Date: Wed, 10 Nov 2021 22:26:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <df7ad986-8430-9994-83ac-33db2ec1f2e3@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.195; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-195.mail.aliyun.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.678,
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
X-List-Received-Date: Wed, 10 Nov 2021 14:27:07 -0000


On 2021/11/10 下午7:23, Richard Henderson wrote:
> On 11/10/21 8:04 AM, LIU Zhiwei wrote:
>> We need not specially process vtype when XLEN changes.
>> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
>> ---
>>   target/riscv/cpu.h           |  1 +
>>   target/riscv/csr.c           | 15 ++++++++++++++-
>>   target/riscv/machine.c       |  1 +
>>   target/riscv/vector_helper.c |  7 ++-----
>>   4 files changed, 18 insertions(+), 6 deletions(-)
>
> This patch should come before patch 6, which is over-complicated.

Agree.

One question here. Even come before patch 6, we don't have a simple way 
to choose vill and reserved fields from s2 register in patch 6.

>
>> +    target_ulong vill;
>
> This could be bool, though there's no good place to slot it that does 
> not result in unused padding.

As env->vill will be used in read_vtype,  we still need to covert 
env->vill type to target_ulong there.
Is there any benefit to use bool instead of target_ulong?

> Comments should be added to show that this bit is now missing from vtype.
>
>> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
>> index 19e982d3f0..cc4dda4b93 100644
>> --- a/target/riscv/machine.c
>> +++ b/target/riscv/machine.c
>> @@ -104,6 +104,7 @@ static const VMStateDescription vmstate_vector = {
>>               VMSTATE_UINTTL(env.vl, RISCVCPU),
>>               VMSTATE_UINTTL(env.vstart, RISCVCPU),
>>               VMSTATE_UINTTL(env.vtype, RISCVCPU),
>> +            VMSTATE_UINTTL(env.vill, RISCVCPU),
>>               VMSTATE_END_OF_LIST()
>
> This will need a bump to version.
>
>> @@ -45,11 +45,8 @@ target_ulong HELPER(vsetvl)(CPURISCVState *env, 
>> target_ulong s1,
>>       }
>>       if ((sew > cpu->cfg.elen) || vill || (ediv != 0) || (reserved 
>> != 0)) {
>>           /* only set vill bit. */
>> -        if (xlen < TARGET_LONG_BITS) {
>> -            env->vtype = FIELD_DP64(0, VTYPE, VILL_XLEN32, 1);
>> -        } else {
>> -            env->vtype = FIELD_DP64(0, VTYPE, VILL, 1);
>> -        }
>> +        env->vill = 1;
>> +        env->vtype = 0;
>
> This is fine.
>
> You're missing the updates to cpu_get_tb_cpu_state.

Yes.

Thanks,
Zhiwei

>
>
> r~

