Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nAMwb-0001Bm-AA
	for mharc-qemu-riscv@gnu.org; Wed, 19 Jan 2022 21:12:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1nAMwX-0001A3-Lj; Wed, 19 Jan 2022 21:12:54 -0500
Received: from out28-220.mail.aliyun.com ([115.124.28.220]:36536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1nAMwU-00024e-OY; Wed, 19 Jan 2022 21:12:53 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.08232489|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.223016-0.000529995-0.776454;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047194; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=8; RT=8; SR=0; TI=SMTPD_---.MfcJETu_1642644761; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.MfcJETu_1642644761)
 by smtp.aliyun-inc.com(10.147.42.241);
 Thu, 20 Jan 2022 10:12:42 +0800
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
Message-ID: <508b3d54-0641-cab2-c153-8f2bb76c79ed@c-sky.com>
Date: Thu, 20 Jan 2022 10:12:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKP=NNEVDDGrbSEeWLfLyX_+=Ao0yWJ9RtyazyycGHM3+w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.220; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-220.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Thu, 20 Jan 2022 02:12:56 -0000


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

I am  almost sure that there is an UXL  field write error in Xvisor.

I guess there is an write_sstatus instruction that  writes a 0 to 
SSTATUS64_UXL.

We can fix it on Xvisor. But before that, we should also give more 
strict constraints on SSTATUS64_UXL write.

+        if ((val & SSTATUS64_UXL) != 0) {
+            mask |= SSTATUS64_UXL;
+        }
-        mask |= SSTATUS64_UXL;


I will send v8 patch set later for you to test later.


Thanks,
Zhiwei

> Alistair

