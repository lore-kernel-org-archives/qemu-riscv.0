Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nANGR-0008RI-Mq
	for mharc-qemu-riscv@gnu.org; Wed, 19 Jan 2022 21:33:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1nANGP-0008N3-CP; Wed, 19 Jan 2022 21:33:25 -0500
Received: from out28-221.mail.aliyun.com ([115.124.28.221]:54396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1nANGD-0005VL-6t; Wed, 19 Jan 2022 21:33:23 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.09333985|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_alarm|0.142294-0.00129041-0.856415;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047208; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=8; RT=8; SR=0; TI=SMTPD_---.Mfczad4_1642645985; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.Mfczad4_1642645985)
 by smtp.aliyun-inc.com(10.147.41.138);
 Thu, 20 Jan 2022 10:33:05 +0800
Subject: Re: [PATCH v7 21/22] target/riscv: Enable uxl field write
To: Alistair Francis <alistair23@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, guoren@linux.alibaba.com,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>
References: <20220119051824.17494-1-zhiwei_liu@c-sky.com>
 <20220119051824.17494-22-zhiwei_liu@c-sky.com>
 <CAKmqyKP=NNEVDDGrbSEeWLfLyX_+=Ao0yWJ9RtyazyycGHM3+w@mail.gmail.com>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <7a49a961-ec14-6ed8-563a-c72fc649ea07@c-sky.com>
Date: Thu, 20 Jan 2022 10:33:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKP=NNEVDDGrbSEeWLfLyX_+=Ao0yWJ9RtyazyycGHM3+w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.221; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-221.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 20 Jan 2022 02:33:25 -0000


On 2022/1/20 上午8:35, Alistair Francis wrote:
> On Wed, Jan 19, 2022 at 3:34 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>> ---
>>   target/riscv/csr.c | 17 ++++++++++++-----
>>   1 file changed, 12 insertions(+), 5 deletions(-)
>>
>> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>> index b11d92b51b..90f78eca65 100644
>> --- a/target/riscv/csr.c
>> +++ b/target/riscv/csr.c
>> @@ -572,6 +572,7 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
>>   {
>>       uint64_t mstatus = env->mstatus;
>>       uint64_t mask = 0;
>> +    RISCVMXL xl = riscv_cpu_mxl(env);
>>
>>       /* flush tlb on mstatus fields that affect VM */
>>       if ((val ^ mstatus) & (MSTATUS_MXR | MSTATUS_MPP | MSTATUS_MPV |
>> @@ -583,21 +584,22 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
>>           MSTATUS_MPP | MSTATUS_MXR | MSTATUS_TVM | MSTATUS_TSR |
>>           MSTATUS_TW | MSTATUS_VS;
>>
>> -    if (riscv_cpu_mxl(env) != MXL_RV32) {
>> +    if (xl != MXL_RV32) {
>>           /*
>>            * RV32: MPV and GVA are not in mstatus. The current plan is to
>>            * add them to mstatush. For now, we just don't support it.
>>            */
>>           mask |= MSTATUS_MPV | MSTATUS_GVA;
>> +        if ((val & MSTATUS64_UXL) != 0) {
>> +            mask |= MSTATUS64_UXL;
>> +        }
>>       }
>>
>>       mstatus = (mstatus & ~mask) | (val & mask);
>>
>> -    RISCVMXL xl = riscv_cpu_mxl(env);
>>       if (xl > MXL_RV32) {
>> -        /* SXL and UXL fields are for now read only */
>> +        /* SXL field is for now read only */
>>           mstatus = set_field(mstatus, MSTATUS64_SXL, xl);
>> -        mstatus = set_field(mstatus, MSTATUS64_UXL, xl);
> This change causes:
>
> ERROR:../target/riscv/translate.c:295:get_gpr: code should not be reached
>
> to assert when running an Xvisor (Hypervisor extension) guest on the
> 64-bit virt machine.

Hi Alistair,

Thanks for pointing it out. I will have a test on Xvisor.

Thanks,
Zhiwei

>
> Alistair

