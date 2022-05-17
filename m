Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nqm6H-0007NG-BP
	for mharc-qemu-riscv@gnu.org; Mon, 16 May 2022 21:34:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nqm6F-0007HY-91; Mon, 16 May 2022 21:34:11 -0400
Received: from smtp23.cstnet.cn ([159.226.251.23]:33132 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nqm6C-0002B9-R6; Mon, 16 May 2022 21:34:10 -0400
Received: from [192.168.3.6] (unknown [180.156.147.178])
 by APP-03 (Coremail) with SMTP id rQCowABXEuCM+4JiVjyDBw--.57923S2;
 Tue, 17 May 2022 09:34:05 +0800 (CST)
Subject: Re: [PATCH 2/2] target/riscv: disable zb* extensions by default
To: Alistair Francis <alistair23@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V"
 <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?=
 <lazyparser@gmail.com>
References: <20220516033357.12371-1-liweiwei@iscas.ac.cn>
 <20220516033357.12371-2-liweiwei@iscas.ac.cn>
 <CAKmqyKNwjv1MwGqj7LP+jF5AKg8Cpvnwx5U8gKVASFRtCYFirQ@mail.gmail.com>
 <CAKmqyKPrx3aEBjqcT4jOG3rfNfU7LCve3QywLVCBsCP-kLcr6A@mail.gmail.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <703a183e-3d61-36f3-f5af-2bbd6d5467e1@iscas.ac.cn>
Date: Tue, 17 May 2022 09:34:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKPrx3aEBjqcT4jOG3rfNfU7LCve3QywLVCBsCP-kLcr6A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: rQCowABXEuCM+4JiVjyDBw--.57923S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KFyruw4xtry3AFyDZr15twb_yoW8Kr1fpr
 y5JFW7Kan5JryfC3y0yw1Dtr40k3W5K392q3yIv3ZrXrWfGrsxJF1kKanYkr47Ar48Zw4I
 9F43uF1SvrZIva7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9Y14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
 1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
 7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
 1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE
 67vIY487MxkF7I0Ew4C26cxK6c8Ij28IcwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
 kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
 67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
 CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6Fyj6rWU
 JwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCT
 nIWIevJa73UjIFyTuYvjfUnXdbUUUUU
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
X-List-Received-Date: Tue, 17 May 2022 01:34:11 -0000


在 2022/5/17 上午8:54, Alistair Francis 写道:
> On Tue, May 17, 2022 at 10:33 AM Alistair Francis <alistair23@gmail.com> wrote:
>> On Mon, May 16, 2022 at 1:34 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>>>   - enable zb* extensions by default will make cpu types(such as sifive-u34) implicitly support zb* extensions
>> Agh, this is a pain.
>>
>> Can you enable these by default for the base machines then? That way
>> they will be enabled for the virt machine
> Actually, come to think of it, we can probably just register the
> riscv_cpu_properties for the base cpus. That way only those CPUs can
> be configured by the user. Can you do that instead?
>
> Alistair
>
Yeah, This is OK. I'll do this later.

Regards,

Weiwei Li

>> Alistair
>>
>>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
>>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
>>> ---
>>>   target/riscv/cpu.c | 8 ++++----
>>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>>> index b12f69c584..a3a17323e7 100644
>>> --- a/target/riscv/cpu.c
>>> +++ b/target/riscv/cpu.c
>>> @@ -847,13 +847,13 @@ static Property riscv_cpu_properties[] = {
>>>       DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
>>>       DEFINE_PROP_BOOL("svpbmt", RISCVCPU, cfg.ext_svpbmt, false),
>>>
>>> -    DEFINE_PROP_BOOL("zba", RISCVCPU, cfg.ext_zba, true),
>>> -    DEFINE_PROP_BOOL("zbb", RISCVCPU, cfg.ext_zbb, true),
>>> -    DEFINE_PROP_BOOL("zbc", RISCVCPU, cfg.ext_zbc, true),
>>> +    DEFINE_PROP_BOOL("zba", RISCVCPU, cfg.ext_zba, false),
>>> +    DEFINE_PROP_BOOL("zbb", RISCVCPU, cfg.ext_zbb, false),
>>> +    DEFINE_PROP_BOOL("zbc", RISCVCPU, cfg.ext_zbc, false),
>>>       DEFINE_PROP_BOOL("zbkb", RISCVCPU, cfg.ext_zbkb, false),
>>>       DEFINE_PROP_BOOL("zbkc", RISCVCPU, cfg.ext_zbkc, false),
>>>       DEFINE_PROP_BOOL("zbkx", RISCVCPU, cfg.ext_zbkx, false),
>>> -    DEFINE_PROP_BOOL("zbs", RISCVCPU, cfg.ext_zbs, true),
>>> +    DEFINE_PROP_BOOL("zbs", RISCVCPU, cfg.ext_zbs, false),
>>>       DEFINE_PROP_BOOL("zk", RISCVCPU, cfg.ext_zk, false),
>>>       DEFINE_PROP_BOOL("zkn", RISCVCPU, cfg.ext_zkn, false),
>>>       DEFINE_PROP_BOOL("zknd", RISCVCPU, cfg.ext_zknd, false),
>>> --
>>> 2.17.1
>>>
>>>


