Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lmRjg-0001tR-S7
	for mharc-qemu-riscv@gnu.org; Thu, 27 May 2021 21:56:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lmRjf-0001sl-F4; Thu, 27 May 2021 21:56:27 -0400
Received: from out28-2.mail.aliyun.com ([115.124.28.2]:55538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lmRjc-0001Zu-25; Thu, 27 May 2021 21:56:27 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07598961|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.256127-0.00494922-0.738924;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047207; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.KJpNlTk_1622166974; 
Received: from 172.27.117.59(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KJpNlTk_1622166974)
 by smtp.aliyun-inc.com(10.147.40.44); Fri, 28 May 2021 09:56:15 +0800
Subject: Re: [PATCH] target/riscv: hardwire bits in hideleg and hedeleg
To: Jose Martins <josemartins90@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <20210522155902.374439-1-josemartins90@gmail.com>
 <434d8825-8bd6-5344-aea2-e176fad6183e@c-sky.com>
 <CAC41xo2v7kU92+MkZfB7f_86X58k8R5Ft=2vSO3OORT2OJ-Exw@mail.gmail.com>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <bca94724-96ed-5acf-e668-a0769626358e@c-sky.com>
Date: Fri, 28 May 2021 09:56:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAC41xo2v7kU92+MkZfB7f_86X58k8R5Ft=2vSO3OORT2OJ-Exw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.2; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-2.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Fri, 28 May 2021 01:56:27 -0000


On 5/26/21 1:50 AM, Jose Martins wrote:
>> We can use it directly if only one macro VS_MODE_INTERRUPTS.
> I wrote it like this to be more coherent with what was already there
> which also makes it more readable. Furthermore, the compiler will just
> probably optimize the variable away, right?

Hi Jose,

Sorry I missed this mail.

Sounds good. Just keep it.

>
>> I didn't find that the RISCV_EXCP_VS_ECALL should be read-only 0 from the specification.
> You are right. I had doubts about this also. The table that defines it
> in the spec is missing this bit. I raised an issue on the spec repo
> (https://github.com/riscv/riscv-isa-manual/issues/649). But in my
> opinion, it wouldn't really make sense to allow this exception to be
> delegated.
Agree.
> What do you think? Is there any use case for this to be
> allowed? Maybe we'll need a clarification from the spec to reach a
> final decision.
That's will be great.
>
>> However, as hedeleg is WARL, you had better reserve the other fields like medeleg:
>>
>> env->medeleg = (env->medeleg & ~delegable_excps) | (val & delegable_excps);
> Isn't the patch's implementation of hedeleg/hideleg providing a WARL
> behavior already? I don't think we need this preservation behavior
> since in the case of hideleg/hedeleg there can only be 0-wired bits. I
> believe this won't change. For hedeleg the spec states that  "Each bit
> of hedeleg shall be either writable or hardwired to zero". For
> hideleg: "Among bits 15:0 of hideleg, only bits 10, 6, and 2
> (corresponding to the standard VS-level interrupts) shall be writable,
> and the others shall be hardwired to zero."
Agree.
>
>> I really don't understand why medeleg codes this way. Is there anyone can give a better explanation?
>>
>> I don't know if I fully understood your question, but I don't get why
>> you would need to preserve non-delegable bits in medeleg in this way,
>> even to keep WARL behavior.
>   Again, the specification only allows
> medeleg bits to be hardwired to zero: "An implementation shall not
> hardwire any bits of medeleg to one, i.e., any synchronous trap that
> can be delegated must support not being delegated.", so a bitwise-and
> should suffice.

That's the current way to implement medeleg in QEMU. I just copy the code.

In my opinion, WARL means:

1) For writable fields with WARL, any illegal written value will be 
discarded.

2) For reserved fields with WARL,  any written value will be discarded 
and it should always keep hardwired value.

I agree with your opinion. We can just use bitwise-and for medeleg.

Best Regards,
Zhiwei

> José

