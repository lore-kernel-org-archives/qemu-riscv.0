Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j1mzf-0000nn-NK
	for mharc-qemu-riscv@gnu.org; Wed, 12 Feb 2020 03:03:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60554)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1j1mzc-0000mj-EU
 for qemu-riscv@nongnu.org; Wed, 12 Feb 2020 03:03:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1j1mzb-0001ED-HK
 for qemu-riscv@nongnu.org; Wed, 12 Feb 2020 03:03:32 -0500
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:38149)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1j1mzY-000164-U6; Wed, 12 Feb 2020 03:03:29 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436807|-1; CH=green;
 DM=CONTINUE|CONTINUE|true|0.420848-0.005378-0.573774;
 DS=CONTINUE|ham_regular_dialog|0.347987-0.000716277-0.651297;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03307; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=8; RT=8; SR=0; TI=SMTPD_---.GnCK7Sq_1581494594; 
Received: from 192.168.3.18(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.GnCK7Sq_1581494594)
 by smtp.aliyun-inc.com(10.147.42.22); Wed, 12 Feb 2020 16:03:15 +0800
Subject: Re: [PATCH v4 4/4] target/riscv: add vector configure instruction
To: Richard Henderson <richard.henderson@linaro.org>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200210081240.11481-1-zhiwei_liu@c-sky.com>
 <20200210081240.11481-5-zhiwei_liu@c-sky.com>
 <053777e2-7180-5584-cf7f-7876800d9dc8@linaro.org>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <bb1f595d-fbe8-93a2-c67c-25be7996aec3@c-sky.com>
Date: Wed, 12 Feb 2020 16:09:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <053777e2-7180-5584-cf7f-7876800d9dc8@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 121.197.200.217
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
X-List-Received-Date: Wed, 12 Feb 2020 08:03:33 -0000



On 2020/2/12 0:56, Richard Henderson wrote:
> On 2/10/20 8:12 AM, LIU Zhiwei wrote:
>>   static inline void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
>> -                                        target_ulong *cs_base, uint32_t *flags)
>> +                                        target_ulong *cs_base, uint32_t *pflags)
>>   {
>> +    uint32_t flags = 0;
>> +    uint32_t vlmax;
>> +    uint8_t vl_eq_vlmax;
> bool.
OK.

Is it clearer to use "bool" here? Or it's wrong to use "uint8_t "?
>
>> +
>>       *pc = env->pc;
>>       *cs_base = 0;
>> +
>> +    if (env->misa & RVV) {
>> +        vlmax = vext_get_vlmax(env_archcpu(env), env->vext.vtype);
>> +        vl_eq_vlmax = (env->vext.vstart == 0) && (vlmax == env->vext.vl);
> You might as well move the variable declarations inside this block.
OK.
>
>> +target_ulong HELPER(vsetvl)(CPURISCVState *env, target_ulong s1,
>> +     target_ulong s2)
> Indentation.
OK.
>
>> +{
>> +    int vlmax, vl;
>> +    RISCVCPU *cpu = env_archcpu(env);
>> +    uint16_t sew = 1 << FIELD_EX64(s2, VTYPE, SEW);
>> +
>> +    if (sew > cpu->cfg.elen) { /* only set vill bit. */
>> +        env->vext.vtype = FIELD_DP64(0, VTYPE, VILL, 1);
>> +        env->vext.vl = 0;
>> +        env->vext.vstart = 0;
>> +        return 0;
>> +    }
> You're missing checks against EDIV, VILL and the RESERVED field == 0.
This implementation does not support "Zvediv" . So I did not check it. 
I'm not sure if I should check(ediv==0).

I missed check  "VILL" filed.  Fix up it next patch.

I'm not quite sure if I should set VILL if  the RESERVED field != 0.

>
>> +
>> +    vlmax = vext_get_vlmax(cpu, s2);
>> +    if (s1 <= vlmax) {
>> +        vl = s1;
>> +    } else {
>> +        vl = vlmax;
>> +    }
>> +    env->vext.vl = vl;
>> +    env->vext.vtype = s2;
>> +    env->vext.vstart = 0;
>> +    return vl;
>> +}
>>
>
> r~


