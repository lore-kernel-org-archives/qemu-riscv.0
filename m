Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nSaoJ-0007FZ-GH
	for mharc-qemu-riscv@gnu.org; Fri, 11 Mar 2022 03:39:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nSaoG-0007D1-Uj; Fri, 11 Mar 2022 03:39:40 -0500
Received: from smtp23.cstnet.cn ([159.226.251.23]:34036 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nSaoD-0007xI-K1; Fri, 11 Mar 2022 03:39:40 -0500
Received: from [192.168.0.105] (unknown [180.156.147.178])
 by APP-03 (Coremail) with SMTP id rQCowAB3f5u+CitiFE5sAg--.6240S2;
 Fri, 11 Mar 2022 16:39:28 +0800 (CST)
Subject: Re: [PATCH] target/riscv: write back unmodified value for csrrc/csrrs
 with rs1 is not x0 but holding zero
To: Alistair Francis <alistair23@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V"
 <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?=
 <lazyparser@gmail.com>
References: <20220302122946.29635-1-liweiwei@iscas.ac.cn>
 <CAKmqyKOgJA49Mc4H=WFN+soxaFKtJc+d+nviKiro7eCdMg7hcA@mail.gmail.com>
 <bde533f4-e55d-1058-9cad-6b0aca2fd70d@iscas.ac.cn>
 <CAKmqyKOPDi12pQh5EUCEFHO0kudiFUqyESXELvGR00-CkX_nAQ@mail.gmail.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <4f95b797-42de-13d5-b08f-ab7e1b4e0671@iscas.ac.cn>
Date: Fri, 11 Mar 2022 16:39:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKOPDi12pQh5EUCEFHO0kudiFUqyESXELvGR00-CkX_nAQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: rQCowAB3f5u+CitiFE5sAg--.6240S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Xw1xJr43Jw43XrWDWrW3Jrb_yoWxJF1fpr
 W5Kan8CF4vqr9F93ZFv3WDXF1rt3y8GrWxXwn7t345Xwn8tFyFqF4DJa1IkFykZr4fWr40
 vFs0yFyxuw4jyFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07AlzVAY
 IcxG8wCY1x0264kExVAvwVAq07x20xyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7
 v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
 1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
 AIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0D
 MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
 VFxhVjvjDU0xZFpf9x0JU2fOwUUUUU=
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.23; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 11 Mar 2022 08:39:41 -0000


在 2022/3/11 下午3:54, Alistair Francis 写道:
> On Fri, Mar 11, 2022 at 2:58 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>>
>> 在 2022/3/11 上午10:58, Alistair Francis 写道:
>>> On Wed, Mar 2, 2022 at 11:50 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>>>>        For csrrs and csrrc, if rs1 specifies a register other than x0, holding
>>>>        a zero value, the instruction will still attempt to write the unmodified
>>>>        value back to the csr and will cause side effects
>>>>
>>>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
>>>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
>>>> ---
>>>>    target/riscv/csr.c       | 46 ++++++++++++++++++++++++++++------------
>>>>    target/riscv/op_helper.c |  7 +++++-
>>>>    2 files changed, 39 insertions(+), 14 deletions(-)
>>>>
>>>> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>>>> index aea82dff4a..f4774ca07b 100644
>>>> --- a/target/riscv/csr.c
>>>> +++ b/target/riscv/csr.c
>>>> @@ -2872,7 +2872,7 @@ static RISCVException write_upmbase(CPURISCVState *env, int csrno,
>>>>
>>>>    static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
>>>>                                                   int csrno,
>>>> -                                               bool write_mask,
>>>> +                                               bool write_csr,
>>>>                                                   RISCVCPU *cpu)
>>>>    {
>>>>        /* check privileges and return RISCV_EXCP_ILLEGAL_INST if check fails */
>>>> @@ -2895,7 +2895,7 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
>>>>            return RISCV_EXCP_ILLEGAL_INST;
>>>>        }
>>>>    #endif
>>>> -    if (write_mask && read_only) {
>>>> +    if (write_csr && read_only) {
>>>>            return RISCV_EXCP_ILLEGAL_INST;
>>>>        }
>>>>
>>>> @@ -2915,7 +2915,8 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
>>>>    static RISCVException riscv_csrrw_do64(CPURISCVState *env, int csrno,
>>>>                                           target_ulong *ret_value,
>>>>                                           target_ulong new_value,
>>>> -                                       target_ulong write_mask)
>>>> +                                       target_ulong write_mask,
>>>> +                                       bool write_csr)
>>>>    {
>>>>        RISCVException ret;
>>>>        target_ulong old_value;
>>>> @@ -2935,8 +2936,8 @@ static RISCVException riscv_csrrw_do64(CPURISCVState *env, int csrno,
>>>>            return ret;
>>>>        }
>>>>
>>>> -    /* write value if writable and write mask set, otherwise drop writes */
>>>> -    if (write_mask) {
>>>> +    /* write value if needed, otherwise drop writes */
>>>> +    if (write_csr) {
>>>>            new_value = (old_value & ~write_mask) | (new_value & write_mask);
>>>>            if (csr_ops[csrno].write) {
>>>>                ret = csr_ops[csrno].write(env, csrno, new_value);
>>>> @@ -2960,18 +2961,27 @@ RISCVException riscv_csrrw(CPURISCVState *env, int csrno,
>>>>    {
>>>>        RISCVCPU *cpu = env_archcpu(env);
>>>>
>>>> -    RISCVException ret = riscv_csrrw_check(env, csrno, write_mask, cpu);
>>>> +    /*
>>>> +     * write value when write_mask is set or rs1 is not x0 but holding zero
>>>> +     * value for csrrc(new_value is zero) and csrrs(new_value is all-ones)
>>> I don't understand this. Won't write_mask also be zero and when reading?
>>>
>>> Alistair
>>>
>> Yeah. It's true. To distinguish only-read operation with the special
>> write case(write_mask = 0), I also modified the new_value of riscv_csrrw
>> from 0 to 1 in helper_csrr :
>>
>>    target_ulong helper_csrr(CPURISCVState *env, int csr)
>>    {
>>        target_ulong val = 0;
>> -    RISCVException ret = riscv_csrrw(env, csr, &val, 0, 0);
>> +
>> +    /*
>> +     * new_value here should be none-zero or none-all-ones here to
>> +     * distinguish with csrrc/csrrs with rs1 is not x0 but holding zero value
>> +     */
>> +    RISCVException ret = riscv_csrrw(env, csr, &val, 1, 0);
> This is confusing though and I worry a future change will break this.
> I think we should be explicit instead of using special combinations of
> masks. What if a write operation occurred that wanted to write 1 with
> a mark of 0?

  When we write csr, if the mask is zero,  the new_value will be ignored 
and write back the original value.

So choose any none-zero and none-all-ones value here is OK. and a new 
instruction to write 1 with a mark of 0

seems  unnecessary. I have no idea what future change may break this 
currently.

>
> The two options seem to either add a check for the seed CSR in
> helper_csrr() to fault if the address matches. That's not the best as
> then we have specific code, but this requirement seems pretty specific
> as well so it's probably ok.

The side effect of writing CSR with original value is ignored in 
previous code.  So I think it's a missing function,

not only the requirement of seed csr.

>
> The other option would be to modify riscv_csrrw() to explicitly pass
> in a `bool write_op` that you check against.

I agree that it may be more intuitive and easy to understand if we 
explicitly pass a new "write_op" argument.

I'll try this. Maybe we can judge which one is better later.

>
> Alistair
>
>>        if (ret != RISCV_EXCP_NONE) {
>>            riscv_raise_exception(env, ret, GETPC());
>>
>>
>> After modification, the cases for all csr related instructions is as follows:
>>
>> index     instruction                   helper write_mask
>> new_value        Read/Write     write_csr
>>
>> 1              csrrw                         csrrw/csrw all-ones
>>           src1 (R)W                 true
>>
>> 2             csrrs(rs1=0) csrr                      zero
>> 1                           R                      false
>>
>> 3              csrrs(rs1!=0)               csrrw                   src1
>>                    all-ones RW                   true
>>
>> 4              csrrs(rs1=0) csrr                     zero
>> 1                           R                     false
>>
>> 5              csrrc(rs1!=0)               csrrw                   src1
>>                         zero                     RW                  true
>>
>> 6              csrrc(rs1=0) csrr                      zero
>> 1                           R                    false
>>
>> 7              csrrwi                     csrrw/csrw
>> all-ones                rs1 (R)W                  true
>>
>> 8              csrrsi(rs1=0) csrr                      zero
>> 1                           R                    false
>>
>> 9              csrrsi(rs1!=0)               csrrw                    rs1
>>                    all-ones RW                   true
>>
>> 10           csrrci(rs1=0) csrr                      zero
>> 1                           R                    false
>>
>> 11           csrrci(rs1!=0)               csrrw                    rs1
>>                           zero                   RW                    true
>>
>>
>> Only row 3 and 5 can be Write-operation with write_mask = 0 when src1 =
>> 0.  And it's the special case will be identified by :
>>
>> ((write_mask == 0) && ((new_value == 0) || (new_value == (target_ulong)-1)));
>>
>> for other only-read instructions, the write_mask is zero, but the new_value is changed to 1 (none-zero and none-all-ones), so they will make write_csr to be false.
>>
>> Regards,
>> Weiwei Li
>>
>>>> +     */
>>>> +    bool write_csr = write_mask || ((write_mask == 0) &&
>>>> +                                    ((new_value == 0) ||
>>>> +                                     (new_value == (target_ulong)-1)));
>>>> +
>>>>
>>>> --
>>>> 2.17.1
>>>>
>>>>


