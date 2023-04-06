Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkFXP-00010N-Mr
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 22:39:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pkFXO-000105-4C; Wed, 05 Apr 2023 22:39:46 -0400
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pkFXL-00015n-5X; Wed, 05 Apr 2023 22:39:45 -0400
Received: from [192.168.0.120] (unknown [180.175.29.170])
 by APP-01 (Coremail) with SMTP id qwCowAD3_2PkMC5kx1ALAA--.1870S2;
 Thu, 06 Apr 2023 10:39:33 +0800 (CST)
Message-ID: <f9daa3a1-43f6-5eae-2f7c-2423a68ea5bb@iscas.ac.cn>
Date: Thu, 6 Apr 2023 10:39:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Cc: liweiwei@iscas.ac.cn, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Subject: Re: [PATCH 1/2] target/riscv: Fix the mstatus.MPP value after
 executing MRET
Content-Language: en-US
To: Alistair Francis <alistair23@gmail.com>
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
X-CM-TRANSID: qwCowAD3_2PkMC5kx1ALAA--.1870S2
X-Coremail-Antispam: 1UD129KBjvJXoWxurWxKF4rXryxKry7Xr4ruFg_yoWrAF1xpr
 W5GFW2kFWDJFZF93WIqw1Fgr43t3y3KryDWwn5Jr1UAFZ0qw4kuFsFyw4Y9rWDZFy0kryj
 vF4jk3sxZFW7ZFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9Y14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
 xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
 n2IY04v7Mxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
 0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
 zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
 4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
 CwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCT
 nIWIevJa73UjIFyTuYvjfUoOJ5UUUUU
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
X-List-Received-Date: Thu, 06 Apr 2023 02:39:46 -0000


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
OK. I'll send an issue for it.
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

OK . Thanks! I'll try to set it later.

Regards,

Weiwei Li

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


