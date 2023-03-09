Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pa6qR-00062U-UE
	for mharc-qemu-riscv@gnu.org; Wed, 08 Mar 2023 22:21:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pa6qQ-00062C-HU; Wed, 08 Mar 2023 22:21:30 -0500
Received: from out30-111.freemail.mail.aliyun.com ([115.124.30.111])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pa6qN-0002fi-Iv; Wed, 08 Mar 2023 22:21:30 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R951e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045170;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0VdRhDF5_1678332072; 
Received: from 30.221.99.193(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VdRhDF5_1678332072) by smtp.aliyun-inc.com;
 Thu, 09 Mar 2023 11:21:13 +0800
Message-ID: <e7520c9b-4ff9-35b3-ddaf-108e8d82ef92@linux.alibaba.com>
Date: Thu, 9 Mar 2023 11:21:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/2] target/riscv: Make the "virt" register writable by GDB
To: Jim Shu <jim.shu@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
References: <20230305094231.1616-1-jim.shu@sifive.com>
 <20230305094231.1616-2-jim.shu@sifive.com>
 <0b2407ee-a7dd-d651-763a-a73b3802dc8f@linux.alibaba.com>
 <CALw707rM3w+yDWhizA122eH5L_OVjhnE2t2BVQy5edr23V6S-Q@mail.gmail.com>
Content-Language: en-US
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <CALw707rM3w+yDWhizA122eH5L_OVjhnE2t2BVQy5edr23V6S-Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.111;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-111.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
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
X-List-Received-Date: Thu, 09 Mar 2023 03:21:30 -0000


On 2023/3/9 11:05, Jim Shu wrote:
> On Mon, Mar 6, 2023 at 7:26 PM LIU Zhiwei <zhiwei_liu@linux.alibaba.com> wrote:
>>
>> On 2023/3/5 17:42, Jim Shu wrote:
>>> This patch also enables debugger to set current privilege mode to
>>> VU/VS-mode.
>>>
>>> Extend previous commit 81d2929c41d32af138f3562f5a7b309f6eac7ca7 to
>>> support H-extension.
>>>
>>> Signed-off-by: Jim Shu <jim.shu@sifive.com>
>>> Reviewed-by: Frank Chang <frank.chang@sifive.com>
>>> ---
>>>    target/riscv/gdbstub.c | 18 ++++++++++++++++--
>>>    1 file changed, 16 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
>>> index 1755fd9d51..a7f234beaf 100644
>>> --- a/target/riscv/gdbstub.c
>>> +++ b/target/riscv/gdbstub.c
>>> @@ -203,15 +203,29 @@ static int riscv_gdb_get_virtual(CPURISCVState *cs, GByteArray *buf, int n)
>>>
>>>    static int riscv_gdb_set_virtual(CPURISCVState *cs, uint8_t *mem_buf, int n)
>>>    {
>>> +#ifdef CONFIG_USER_ONLY
>>> +    if (n >= 0 && n <= 1) {
>>> +        return sizeof(target_ulong);
>>> +    }
>>> +#else
>>> +    bool virt;
>>> +
>>>        if (n == 0) {
>>> -#ifndef CONFIG_USER_ONLY
>>>            cs->priv = ldtul_p(mem_buf) & 0x3;
>>>            if (cs->priv == PRV_H) {
>>>                cs->priv = PRV_S;
>>>            }
>>> -#endif
>>> +        return sizeof(target_ulong);
>> We should return according to the misa_mxl_max. And this is a bug before
>> your commit.
> Hi Zhiwei,
>
> After reading other gdbstub.c code, I think it is OK to use
> 'sizeof(target_ulong)' as virtual register length.

No, you should refer to the riscv_cpu_gdb_read(write)_register.

> Its length is 32-bit in RV32 and is 64-bit in RV64/RV128.
Although we don't support MXLEN 32bit  currently on qemu-system-riscv64, 
we should not introduce more code
to make dynamic xlen support complex.

Zhiwei

> We don't
> need to handle RV128 specially.
> Virtual register length is same as CSR length and
> 'riscv_gdb_set_csr()' also use 'sizeof(target_ulong)'.
>
> Jim Shu
>
>>> +    } else if (n == 1) {
>>> +        virt = ldtul_p(mem_buf) & 0x1;
>>> +        if ((cs->priv == PRV_M) && (virt == true)) {
>>> +            /* M-mode only supports V=0. */
>>> +            virt = false;
>>> +        }
>>> +        riscv_cpu_set_virt_enabled(cs, virt);
>>>            return sizeof(target_ulong);
>> Same error here. Otherwise,
>>
>> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
>>
>> Zhiwei
>>
>>>        }
>>> +#endif
>>>        return 0;
>>>    }
>>>

