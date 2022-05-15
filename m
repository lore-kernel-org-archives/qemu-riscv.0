Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nqG60-0000SC-Pd
	for mharc-qemu-riscv@gnu.org; Sun, 15 May 2022 11:23:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nqG5z-0000Rz-T8; Sun, 15 May 2022 11:23:47 -0400
Received: from smtp23.cstnet.cn ([159.226.251.23]:54574 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nqG5w-0001Nm-Uz; Sun, 15 May 2022 11:23:47 -0400
Received: from [192.168.3.6] (unknown [180.156.147.178])
 by APP-03 (Coremail) with SMTP id rQCowACHTeL2GoFiJ2rsBg--.7531S2;
 Sun, 15 May 2022 23:23:35 +0800 (CST)
Subject: Re: [PATCH v2 4/5] target/riscv: FP extension requirements
To: Tsukasa OI <research_trasio@irq.a4lg.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, Alistair Francis <alistair23@gmail.com>,
 Frank Chang <frank.chang@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <cover.1652435138.git.research_trasio@irq.a4lg.com>
 <cover.1652583332.git.research_trasio@irq.a4lg.com>
 <00e7b1c6060dab32ac7d49813b1ca84d3eb63298.1652583332.git.research_trasio@irq.a4lg.com>
 <be76b33b-4999-6760-cc78-2fb5109b50aa@iscas.ac.cn>
 <cf6c14de-d373-a623-8e76-7dc18f621281@irq.a4lg.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <3dd957f8-e26e-3df6-1a4f-4c0bee986737@iscas.ac.cn>
Date: Sun, 15 May 2022 23:23:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <cf6c14de-d373-a623-8e76-7dc18f621281@irq.a4lg.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: rQCowACHTeL2GoFiJ2rsBg--.7531S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXr13Zw1DCry8KF4Uuw47XFb_yoWrJryxpr
 1kJa90kryUJr18Gw1UXF1jyFyUur18Aa17X348X3W7Jr47Gr12qr1jqr1qgr1UJrs5Jr43
 Xr1UGrnrZrsxJ3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvj14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
 1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CE
 bIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
 AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIY
 rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
 v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVWU
 JVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU5W
 lkUUUUU
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
X-List-Received-Date: Sun, 15 May 2022 15:23:48 -0000


在 2022/5/15 下午10:45, Tsukasa OI 写道:
> On 2022/05/15 23:37, Weiwei Li wrote:
>> 在 2022/5/15 上午10:56, Tsukasa OI 写道:
>>> QEMU allowed inconsistent configurations that made floating point
>>> arithmetic effectively unusable.
>>>
>>> This commit adds certain checks for consistent FP arithmetic:
>>>
>>> -   F requires Zicsr
>>> -   Zfinx requires Zicsr
>>> -   Zfh/Zfhmin require F
>>> -   D requires F
>>> -   V requires D
>> Why 'V requires D'? I know partial vector instructions require D, However,  I think they  just like c.fsd
>>
>> instruction requires D, not 'C requires D' or 'D requires C'. Is there any rvv spec change I don't know?
> I thought it was crystal-clear.
>
> RISC-V "V" Vector Extension Version 1.0 (riscv-v-spec-1.0.pdf)
> 18.3. V: Vector Extension for Application Processors
> Page 94:
>
>> The V extension requires the scalar processor implements the F and D
>> extensions, and implements all vector floating-point instructions
>> (Section Vector Floating-Point Instructions) for floating-point operands
>> with EEW=32 or EEW=64 (including widening instructions and conversions
>> between FP32 and FP64).
> c.f. <https://github.com/riscv/riscv-v-spec/releases/tag/v1.0>
>
> Thanks,
>
> Tsukasa

OK. Thanks.

Regards,

Weiwei Li

>
>> Regards.
>>
>> Weiwei Li
>>
>>> Because F/D/Zicsr are enabled by default (and an error will not occur unless
>>> we manually disable one or more of prerequisites), this commit just enforces
>>> the user to give consistent combinations.
>>>
>>> Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
>>> ---
>>>    target/riscv/cpu.c | 25 +++++++++++++++++++++++++
>>>    1 file changed, 25 insertions(+)
>>>
>>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>>> index 0854ca9103..f910a41407 100644
>>> --- a/target/riscv/cpu.c
>>> +++ b/target/riscv/cpu.c
>>> @@ -610,11 +610,36 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>>>                cpu->cfg.ext_ifencei = true;
>>>            }
>>>    +        if (cpu->cfg.ext_f && !cpu->cfg.ext_icsr) {
>>> +            error_setg(errp, "F extension requires Zicsr");
>>> +            return;
>>> +        }
>>> +
>>> +        if ((cpu->cfg.ext_zfh || cpu->cfg.ext_zfhmin) && !cpu->cfg.ext_f) {
>>> +            error_setg(errp, "Zfh/Zfhmin extensions require F extension");
>>> +            return;
>>> +        }
>>> +
>>> +        if (cpu->cfg.ext_d && !cpu->cfg.ext_f) {
>>> +            error_setg(errp, "D extension requires F extension");
>>> +            return;
>>> +        }
>>> +
>>> +        if (cpu->cfg.ext_v && !cpu->cfg.ext_d) {
>>> +            error_setg(errp, "V extension requires D extension");
>>> +            return;
>>> +        }
>>> +
>>>            if (cpu->cfg.ext_zdinx || cpu->cfg.ext_zhinx ||
>>>                cpu->cfg.ext_zhinxmin) {
>>>                cpu->cfg.ext_zfinx = true;
>>>            }
>>>    +        if (cpu->cfg.ext_zfinx && !cpu->cfg.ext_icsr) {
>>> +            error_setg(errp, "Zfinx extension requires Zicsr");
>>> +            return;
>>> +        }
>>> +
>>>            if (cpu->cfg.ext_zk) {
>>>                cpu->cfg.ext_zkn = true;
>>>                cpu->cfg.ext_zkr = true;


