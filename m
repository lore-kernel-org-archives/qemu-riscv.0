Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkFsx-000499-0D
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 23:02:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pkFst-00048N-U1; Wed, 05 Apr 2023 23:02:00 -0400
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pkFsq-000494-72; Wed, 05 Apr 2023 23:01:59 -0400
Received: from [192.168.0.120] (unknown [180.175.29.170])
 by APP-01 (Coremail) with SMTP id qwCowAD3_2scNi5kqxkNAA--.2369S2;
 Thu, 06 Apr 2023 11:01:49 +0800 (CST)
Message-ID: <49a0e0dd-c304-46de-4734-0a1eb134ee9d@iscas.ac.cn>
Date: Thu, 6 Apr 2023 11:01:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/2] target/riscv: Fix the mstatus.MPP value after
 executing MRET
Content-Language: en-US
To: Alistair Francis <alistair23@gmail.com>, liweiwei <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230330135818.68417-1-liweiwei@iscas.ac.cn>
 <20230330135818.68417-2-liweiwei@iscas.ac.cn>
 <CAKmqyKMzPwFpScWg2H+JMZpvH6oJAP0A5vgaKAEiXR57db0r4w@mail.gmail.com>
 <2b52f993-158e-a7ee-9180-b84f85f432c6@iscas.ac.cn>
 <CAKmqyKOOHs-Wq2s6fNJLyEUAQ1B3=PoyU5EFZ7e_=BDL-vLwAg@mail.gmail.com>
 <0b8f3928-1901-b338-43a6-b436fb9013ed@iscas.ac.cn>
 <CAKmqyKM=R2c+ayUQnyMTJA8SweGAnLc=5ZxrcZpKn3JtUqgHYg@mail.gmail.com>
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <CAKmqyKM=R2c+ayUQnyMTJA8SweGAnLc=5ZxrcZpKn3JtUqgHYg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAD3_2scNi5kqxkNAA--.2369S2
X-Coremail-Antispam: 1UD129KBjvJXoWxurWxKF4rXryxKry7Xr4ruFg_yoWrZr1fpF
 W5CFW2kFWDJFZF93WIqw1Fgr43t3y3KryDWwn5Jr1UAFZ0v3ykuFsrAw4Y9ryDZF10kryj
 vF4jkr9xZFWUZFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPI14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
 0xkIwI1lc7I2V7IY0VAS07AlzVAYIcxG8wCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x
 0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02
 F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GF
 ylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
 xVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
 1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUd
 -B_UUUUU=
X-Originating-IP: [180.175.29.170]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.355,
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
X-List-Received-Date: Thu, 06 Apr 2023 03:02:00 -0000


On 2023/4/6 10:24, Alistair Francis wrote:
> On Thu, Apr 6, 2023 at 12:14 PM liweiwei <liweiwei@iscas.ac.cn> wrote:
>>
>> On 2023/4/6 09:46, Alistair Francis wrote:
>>> On Thu, Apr 6, 2023 at 10:56 AM liweiwei <liweiwei@iscas.ac.cn> wrote:
>>>> On 2023/4/6 08:43, Alistair Francis wrote:
>>>>
>>>> On Thu, Mar 30, 2023 at 11:59 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>>>>
>>>> The MPP will be set to the least-privileged supported mode (U if
>>>> U-mode is implemented, else M).
>>>>
>>>> I don't think this is right, the spec in section 8.6.4 says this:
>>>>
>>>> Sorry, I didn't find this section in latest release of both privilege and un-privilege spec
>>> I updated my spec, using commit
>>> f6b8d5c7d2dcd935b48689a337c8f5bc2be4b5e5 it's now section 9.6.4 Trap
>>> Return
>> Yeah. I see it. However, this is a little different from the description
>> in section 3.1.6.1.
> They seem to be in conflict. It's probably worth opening an issue
> against the spec to get some clarification here.

I have sent an issue for 
it(https://github.com/riscv/riscv-isa-manual/issues/1006).

However, I just find it may be not a conflict. Section 9.6.4 is the spec 
for hypervisor. And when hypervisor is supported,

S-mode, then U-mode should be supported too.

Regards,

Weiwei Li

>
>> And MPP is WARL field.  PRV_U will be an illegal value for MPP if U-mode
>> is not implemented.
> Yeah, I think you are right. It just directly goes against the mret
> section. I suspect the mret section is wrong and needs to be updated
>
>> So I think description in section 3.1.6.1 seems more reasonable.
>>
>>>> (draft-20230131-c0b298a: Clarify WFI trapping behavior (#972)).
>>> Also, you replied with a HTML email which loses the conversation
>>> history (just see above). Can you fixup your client to reply with
>>> plain text please
>> Sorry. I don't get your problem. I replied by Thunderbird. Above is the
> Have a look at your previous email, it's a HTML email. If I view the
> source of the email I see this:
>
>      Content-Type: text/html; charset=UTF-8
>
> and the formatting is a little off.
>
> This email that I'm replying to is a plain text email. I'm not sure
> what happened, but try to check that your responses are plain text. I
> think there is a setting in Thunderbird to just open and reply to all
> emails as plain text, which is probably worth turning on
>
> Alistair
>
>> title for the latest release version of the spec in riscv-isa-manual
>> github
>> (https://github.com/riscv/riscv-isa-manual/releases/tag/draft-20230131-c0b298a).
>>
>> Regards,
>>
>> Weiwei Li
>>
>>> Alistair
>>>
>>>> "MRET then in mstatus/mstatush sets MPV=0, MPP=0,
>>>> MIE=MPIE, and MPIE=1"
>>>>
>>>> In section 3.1.6.1, the privilege spec says this:
>>>>
>>>> "An MRET or SRET instruction is used to return from a trap in M-mode or S-mode respectively.
>>>> When executing an xRET instruction, supposing xPP holds the value y, xIE is set to xPIE; the
>>>> privilege mode is changed to y; xPIE is set to 1; and xPP is set to the least-privileged supported
>>>> mode (U if U-mode is implemented, else M). If y̸=M, xRET also sets MPRV=0"
>>>>
>>>> And I think PRV_U is an illegal value for MPP if U-mode is not implemented.
>>>>
>>>> Regards,
>>>>
>>>> Weiwei Li
>>>>
>>>> So it should just always be 0 (PRV_U is 0)
>>>>
>>>> Alistair
>>>>
>>>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
>>>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
>>>> ---
>>>>    target/riscv/op_helper.c | 3 ++-
>>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
>>>> index 84ee018f7d..991f06d98d 100644
>>>> --- a/target/riscv/op_helper.c
>>>> +++ b/target/riscv/op_helper.c
>>>> @@ -339,7 +339,8 @@ target_ulong helper_mret(CPURISCVState *env)
>>>>        mstatus = set_field(mstatus, MSTATUS_MIE,
>>>>                            get_field(mstatus, MSTATUS_MPIE));
>>>>        mstatus = set_field(mstatus, MSTATUS_MPIE, 1);
>>>> -    mstatus = set_field(mstatus, MSTATUS_MPP, PRV_U);
>>>> +    mstatus = set_field(mstatus, MSTATUS_MPP,
>>>> +                        riscv_has_ext(env, RVU) ? PRV_U : PRV_M);
>>>>        mstatus = set_field(mstatus, MSTATUS_MPV, 0);
>>>>        if ((env->priv_ver >= PRIV_VERSION_1_12_0) && (prev_priv != PRV_M)) {
>>>>            mstatus = set_field(mstatus, MSTATUS_MPRV, 0);
>>>> --
>>>> 2.25.1
>>>>
>>>>


