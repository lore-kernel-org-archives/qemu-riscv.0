Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nju4T-0003sQ-3M
	for mharc-qemu-riscv@gnu.org; Wed, 27 Apr 2022 22:39:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nju4R-0003s9-6p; Wed, 27 Apr 2022 22:39:55 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:36756 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nju4O-0003TR-HA; Wed, 27 Apr 2022 22:39:54 -0400
Received: from [192.168.3.6] (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowACXKSBt_mlioeygAQ--.46165S2;
 Thu, 28 Apr 2022 10:39:42 +0800 (CST)
Subject: Re: [PATCH 1/2] target/riscv: Tentatively remove Zhinx* from ISA
 extension string
To: Alistair Francis <alistair23@gmail.com>,
 Tsukasa OI <research_trasio@irq.a4lg.com>
Cc: Frank Chang <frank.chang@sifive.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
References: <cover.1650777360.git.research_trasio@irq.a4lg.com>
 <cfda1d8da254f2e723e487f0c738c59d5891e492.1650777360.git.research_trasio@irq.a4lg.com>
 <CAKmqyKOx2Q3vjK5b51y1yrKS=f+08qzQFvCiS0iuDqBQ0wo41g@mail.gmail.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <c2a43c93-70a9-721b-d4ae-779a6b3cfd7a@iscas.ac.cn>
Date: Thu, 28 Apr 2022 10:39:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKOx2Q3vjK5b51y1yrKS=f+08qzQFvCiS0iuDqBQ0wo41g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: zQCowACXKSBt_mlioeygAQ--.46165S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZrWUKw1kuFykKr45ur48Zwb_yoW8XFWkpr
 4xKa4vkFyDJas5C3s7J34kWF4rWw1DWws7WwsFvwn3JrWayrWqyrs2kw48Xr4qyF97Ka4f
 Xw4jyr17Zrs3Ja7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9F14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxV
 WxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
 Yx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbV
 WUJVW8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07Al
 zVAYIcxG8wCY1x0264kExVAvwVAq07x20xyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
 0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
 zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
 4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j
 6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcS
 sGvfC2KfnxnUUI43ZEXa7VUU6RRtUUUUU==
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.84; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Thu, 28 Apr 2022 02:39:55 -0000


在 2022/4/28 上午7:58, Alistair Francis 写道:
> On Sun, Apr 24, 2022 at 3:22 PM Tsukasa OI <research_trasio@irq.a4lg.com> wrote:
>> This commit disables ISA string conversion for Zhinx and Zhinxmin
>> extensions for now.  Because extension category ordering of "H" is not
>> ratified, their ordering is likely invalid.
>>
>> Once "H"-extension ordering is determined, we can add Zhinx* again.
>>
>> Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
> Weiwei Li does this sound alright to you?
>
> Alistair

Even though the rule says: "The first letter following the 'Z' 
conventionally indicates the most closely

related alphabetical extension category, IMAFDQLCBKJTPVH", zhinx* is not 
related to 'H' extension actually.

I think the most closely related alphabetical extension is 'F' extension.

Regards,

Weiwei Li

>> ---
>>   target/riscv/cpu.c | 2 --
>>   1 file changed, 2 deletions(-)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index 0c774056c5..c765f7ff00 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -954,8 +954,6 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
>>           ISA_EDATA_ENTRY(zfh, ext_zfh),
>>           ISA_EDATA_ENTRY(zfhmin, ext_zfhmin),
>>           ISA_EDATA_ENTRY(zfinx, ext_zfinx),
>> -        ISA_EDATA_ENTRY(zhinx, ext_zhinx),
>> -        ISA_EDATA_ENTRY(zhinxmin, ext_zhinxmin),
>>           ISA_EDATA_ENTRY(zdinx, ext_zdinx),
>>           ISA_EDATA_ENTRY(zba, ext_zba),
>>           ISA_EDATA_ENTRY(zbb, ext_zbb),
>> --
>> 2.32.0
>>


