Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lmQQn-0008SR-2T
	for mharc-qemu-riscv@gnu.org; Thu, 27 May 2021 20:32:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lmQQk-0008P0-1U; Thu, 27 May 2021 20:32:50 -0400
Received: from out28-145.mail.aliyun.com ([115.124.28.145]:45043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lmQQb-0005fK-KS; Thu, 27 May 2021 20:32:49 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07437876|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_alarm|0.356991-0.000427249-0.642581;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047209; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.KJnYRmP_1622161953; 
Received: from 172.27.117.59(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KJnYRmP_1622161953)
 by smtp.aliyun-inc.com(10.147.40.44); Fri, 28 May 2021 08:32:34 +0800
Subject: Re: [PATCH 1/1] target/riscv: Fix vsip vsie CSR ops in M and HS mode
To: Alistair Francis <alistair23@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <20210527090051.1837256-1-zhiwei_liu@c-sky.com>
 <CAKmqyKMtRCP7gouO0qBUsKPXCgroKsSXkTr8FTgDydXdrUc8tw@mail.gmail.com>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <dfbb7c28-a768-216e-5637-6fb5f4c6c782@c-sky.com>
Date: Fri, 28 May 2021 08:32:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAKmqyKMtRCP7gouO0qBUsKPXCgroKsSXkTr8FTgDydXdrUc8tw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.145; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-145.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
X-List-Received-Date: Fri, 28 May 2021 00:32:50 -0000


On 5/28/21 6:19 AM, Alistair Francis wrote:
> On Thu, May 27, 2021 at 7:01 PM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>> When V=1, instructions that normally read or modify a supervisor CSR
>> shall instead access the corresponding VS CSR. And the VS CSRs can be
>> accessed as themselves from M-mode or HS-mode.
>>
>> In M and HS mode, VSIP or VSIE should be written normally instead of
>> shift by 1.
>>
>> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
>> ---
>>   target/riscv/csr.c | 19 ++++++++++---------
>>   1 file changed, 10 insertions(+), 9 deletions(-)
>>
>> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>> index fe5628fea6..0cce474d3d 100644
>> --- a/target/riscv/csr.c
>> +++ b/target/riscv/csr.c
>> @@ -837,16 +837,16 @@ static RISCVException read_sie(CPURISCVState *env, int csrno,
>>   static RISCVException write_vsie(CPURISCVState *env, int csrno,
>>                                    target_ulong val)
>>   {
>> -    /* Shift the S bits to their VS bit location in mie */
>>       target_ulong newval = (env->mie & ~VS_MODE_INTERRUPTS) |
>> -                          ((val << 1) & env->hideleg & VS_MODE_INTERRUPTS);
>> +                          (val & env->hideleg & VS_MODE_INTERRUPTS);
> Ok, so when a Hypervisor writes to vsie it should actually set SSIE
> instead of VSSIE.

Hi Alistair,

Thanks for your reply.
I think when HS or M mode writes to vsie, it should set VSSIE instead of 
SSIE.

Best Regards,
Zhiwei

> That looks right.
>
> The problem here now is that you are still using the VS mask, so this
> won't set anything.
>
>>       return write_mie(env, CSR_MIE, newval);
>>   }
>>
>>   static int write_sie(CPURISCVState *env, int csrno, target_ulong val)
>>   {
>>       if (riscv_cpu_virt_enabled(env)) {
>> -        write_vsie(env, CSR_VSIE, val);
>> +        /* Shift the S bits to their VS bit location in mie */
>> +        write_vsie(env, CSR_VSIE, val << 1);
> A write to SIE when virtulised actually sets VSIE, sounds good.
>
>>       } else {
>>           target_ulong newval = (env->mie & ~S_MODE_INTERRUPTS) |
>>                                 (val & S_MODE_INTERRUPTS);
>> @@ -950,12 +950,9 @@ static RISCVException rmw_vsip(CPURISCVState *env, int csrno,
>>                                  target_ulong *ret_value,
>>                                  target_ulong new_value, target_ulong write_mask)
>>   {
>> -    /* Shift the S bits to their VS bit location in mip */
>> -    int ret = rmw_mip(env, 0, ret_value, new_value << 1,
>> -                      (write_mask << 1) & vsip_writable_mask & env->hideleg);
>> +    int ret = rmw_mip(env, 0, ret_value, new_value,
>> +                      write_mask & vsip_writable_mask & env->hideleg);
> The mask seems wrong here as well.
>
> Alistair
>
>>       *ret_value &= VS_MODE_INTERRUPTS;
>> -    /* Shift the VS bits to their S bit location in vsip */
>> -    *ret_value >>= 1;
>>       return ret;
>>   }
>>
>> @@ -966,7 +963,11 @@ static RISCVException rmw_sip(CPURISCVState *env, int csrno,
>>       int ret;
>>
>>       if (riscv_cpu_virt_enabled(env)) {
>> -        ret = rmw_vsip(env, CSR_VSIP, ret_value, new_value, write_mask);
>> +        /* Shift the S bits to their VS bit location in mip */
>> +        ret = rmw_vsip(env, CSR_VSIP, ret_value, new_value << 1,
>> +                       write_mask << 1);
>> +        /* Shift the VS bits to their S bit location in vsip */
>> +        *ret_value >>= 1;
>>       } else {
>>           ret = rmw_mip(env, CSR_MSTATUS, ret_value, new_value,
>>                         write_mask & env->mideleg & sip_writable_mask);
>> --
>> 2.25.1
>>
>>

