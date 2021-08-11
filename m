Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mDotG-0008Kv-85
	for mharc-qemu-riscv@gnu.org; Wed, 11 Aug 2021 10:07:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mDotD-0008J6-Vz; Wed, 11 Aug 2021 10:07:28 -0400
Received: from out28-170.mail.aliyun.com ([115.124.28.170]:35328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mDotB-0006jj-4Z; Wed, 11 Aug 2021 10:07:27 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07439106|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.175162-0.00193328-0.822905;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047203; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.KyXUvdo_1628690811; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KyXUvdo_1628690811)
 by smtp.aliyun-inc.com(10.147.41.187);
 Wed, 11 Aug 2021 22:07:14 +0800
Subject: Re: [PATCH] target/riscv: Don't wrongly overide isa version
To: Bin Meng <bmeng.cn@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <Alistair.Francis@wdc.com>
References: <20210810033310.7252-1-zhiwei_liu@c-sky.com>
 <CAEUhbmUdLzc7Xt0VEFQaOPRWy-BZqv-p_9pipSzOVzQ+6mo-ig@mail.gmail.com>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <b3a5feb1-e257-ad91-d0bf-30f1645af848@c-sky.com>
Date: Wed, 11 Aug 2021 22:06:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmUdLzc7Xt0VEFQaOPRWy-BZqv-p_9pipSzOVzQ+6mo-ig@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.170; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-170.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Aug 2021 14:07:28 -0000


On 2021/8/11 下午5:26, Bin Meng wrote:
> On Tue, Aug 10, 2021 at 11:35 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>> For some cpu, the isa version has already been set in cpu init function.
>> Thus only overide the isa version when isa version is not set, or
> typo: override, please fix the commit title as well
OK
>
>> users set different isa version explicitly by cpu parameters.
>>
>> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
>> ---
>>   target/riscv/cpu.c | 14 ++++++++------
>>   1 file changed, 8 insertions(+), 6 deletions(-)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index 991a6bb760..425efba0c8 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -392,9 +392,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>>       RISCVCPU *cpu = RISCV_CPU(dev);
>>       CPURISCVState *env = &cpu->env;
>>       RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
>> -    int priv_version = PRIV_VERSION_1_11_0;
>> -    int bext_version = BEXT_VERSION_0_93_0;
>> -    int vext_version = VEXT_VERSION_0_07_1;
>> +    int priv_version = env->priv_ver;
>>       target_ulong target_misa = env->misa;
>>       Error *local_err = NULL;
>>
>> @@ -417,9 +415,11 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>>           }
>>       }
>>
>> -    set_priv_version(env, priv_version);
>> -    set_bext_version(env, bext_version);
>> -    set_vext_version(env, vext_version);
>> +    if (!env->priv_ver) {
>> +        set_priv_version(env, PRIV_VERSION_1_11_0);
>> +    } else if (env->priv_ver != priv_version) {
>> +        set_priv_version(env, priv_version);
>> +    }
> This logic seems incorrect to me. So if cpu init function does not set
> the priv, and cfg set it to v1.10, v1.11 will be set in the new logic.

Yes,  it's also here.

Thanks,
Zhiwei

> The previous logic makes sure the cfg value overrides the cpu init
> value which seems to be intended.
>
>>       if (cpu->cfg.mmu) {
>>           set_feature(env, RISCV_FEATURE_MMU);
>> @@ -497,6 +497,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>>               target_misa |= RVH;
>>           }
>>           if (cpu->cfg.ext_b) {
>> +            int bext_version = BEXT_VERSION_0_93_0;
>>               target_misa |= RVB;
>>
>>               if (cpu->cfg.bext_spec) {
>> @@ -515,6 +516,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>>               set_bext_version(env, bext_version);
>>           }
>>           if (cpu->cfg.ext_v) {
>> +            int vext_version = VEXT_VERSION_0_07_1;
>>               target_misa |= RVV;
>>               if (!is_power_of_2(cpu->cfg.vlen)) {
>>                   error_setg(errp,
>> --
> Regards,
> Bin

