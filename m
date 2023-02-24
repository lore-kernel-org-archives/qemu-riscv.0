Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVXJr-0002I6-3n
	for mharc-qemu-riscv@gnu.org; Fri, 24 Feb 2023 07:36:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pVXJp-0002Hr-Mq; Fri, 24 Feb 2023 07:36:57 -0500
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pVXJm-0007Ne-SV; Fri, 24 Feb 2023 07:36:57 -0500
Received: from [192.168.0.120] (unknown [114.95.238.225])
 by APP-01 (Coremail) with SMTP id qwCowAAHD89br_hjbegECA--.55355S2;
 Fri, 24 Feb 2023 20:36:44 +0800 (CST)
Message-ID: <9cf44206-76c3-0163-77b3-68fed20f886d@iscas.ac.cn>
Date: Fri, 24 Feb 2023 20:36:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/6] target/riscv: Fix the relationship of PBMTE/STCE
 fields between menvcfg and henvcfg
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230224040852.37109-1-liweiwei@iscas.ac.cn>
 <20230224040852.37109-3-liweiwei@iscas.ac.cn>
 <20230224121905.mciqkge4qji6xczb@orel>
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230224121905.mciqkge4qji6xczb@orel>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAAHD89br_hjbegECA--.55355S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KFy7CF4DJF4kXr1UZr43KFg_yoW8tr13pF
 18XFW5G395tr929as7trn0gF1Yy3WDCws8Zw429anYvFy3ArWrAF9rKas8u348W34kCr1v
 v3yUJFy3uF4DZ3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvGb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
 8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
 64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
 Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
 c7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
 W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
 1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
 IIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvE
 x4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa
 73UjIFyTuYvjxU2rcTDUUUU
X-Originating-IP: [114.95.238.225]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.094,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 24 Feb 2023 12:36:57 -0000


On 2023/2/24 20:19, Andrew Jones wrote:
> On Fri, Feb 24, 2023 at 12:08:48PM +0800, Weiwei Li wrote:
>> henvcfg.PBMTE/STCE are read-only zero if menvcfg.PBMTE/STCE are zero.
>>
>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
>> ---
>>   target/riscv/csr.c | 13 +++++++++----
>>   1 file changed, 9 insertions(+), 4 deletions(-)
>>
>> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>> index feae23cab0..02cb2c2bb7 100644
>> --- a/target/riscv/csr.c
>> +++ b/target/riscv/csr.c
>> @@ -1956,7 +1956,11 @@ static RISCVException read_henvcfg(CPURISCVState *env, int csrno,
>>           return ret;
>>       }
>>   
>> -    *val = env->henvcfg;
>> +    /*
>> +     * henvcfg.pbmte is read_only 0 when menvcfg.pbmte = 0
>> +     * henvcfg.stce is read_only 0 when menvcfg.stce = 0
>> +     */
>> +    *val = env->henvcfg & (~(HENVCFG_PBMTE | HENVCFG_STCE) | env->menvcfg);
>>       return RISCV_EXCP_NONE;
>>   }
>>   
>> @@ -1972,7 +1976,7 @@ static RISCVException write_henvcfg(CPURISCVState *env, int csrno,
>>       }
>>   
>>       if (riscv_cpu_mxl(env) == MXL_RV64) {
>> -        mask |= HENVCFG_PBMTE | HENVCFG_STCE;
>> +        mask |= env->menvcfg & (HENVCFG_PBMTE | HENVCFG_STCE);
> nit:
>
>    While HENVCFG_PBMTE == MENVCFG_PBMTE, I'd prefer we use
>    MENVCFG_* with menvcfg and HENVCFG_* with henvcfg.

Yeah. I agree. However, I think this mask is finally used for henvcfg. 
We just use menvcfg to mask the  bits

when the same bits are zero. So I didn't modify HENVCFG_* here.

Regards,

Weiwei Li

>
>>       }
>>   
>>       env->henvcfg = (env->henvcfg & ~mask) | (val & mask);
>> @@ -1990,14 +1994,15 @@ static RISCVException read_henvcfgh(CPURISCVState *env, int csrno,
>>           return ret;
>>       }
>>   
>> -    *val = env->henvcfg >> 32;
>> +    *val = (env->henvcfg & (~(HENVCFG_PBMTE | HENVCFG_STCE) |
>> +                            env->menvcfg)) >> 32;
>>       return RISCV_EXCP_NONE;
>>   }
>>   
>>   static RISCVException write_henvcfgh(CPURISCVState *env, int csrno,
>>                                     target_ulong val)
>>   {
>> -    uint64_t mask = HENVCFG_PBMTE | HENVCFG_STCE;
>> +    uint64_t mask = env->menvcfg & (HENVCFG_PBMTE | HENVCFG_STCE);
>>       uint64_t valh = (uint64_t)val << 32;
>>       RISCVException ret;
>>   
>> -- 
>> 2.25.1
>>
>>
> Thanks,
> drew


