Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9jZ6-0003hj-CC
	for mharc-qemu-riscv@gnu.org; Tue, 18 Jan 2022 03:10:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n9jZ1-0003fH-Iu; Tue, 18 Jan 2022 03:10:01 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25]:55274 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n9jYz-0002Rw-Ls; Tue, 18 Jan 2022 03:09:59 -0500
Received: from [192.168.0.102] (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowADnyRbOdeZh++J0Bg--.39567S2;
 Tue, 18 Jan 2022 16:09:51 +0800 (CST)
Subject: Re: [PATCH v4 7/7] target/riscv: rvk: expose zbk* and zk* properties
To: Alistair Francis <alistair23@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V"
 <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, lazyparser@gmail.com,
 luruibo2000@163.com, lustrew@foxmail.com
References: <20220111035124.9468-1-liweiwei@iscas.ac.cn>
 <20220111035124.9468-8-liweiwei@iscas.ac.cn>
 <CAKmqyKNNWDxQ_TUDgRgri3p67u6v4i3v1oV=HMicQVyqnuJ=SA@mail.gmail.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <eab6c7bc-0336-bfc0-9037-0e531b4d8172@iscas.ac.cn>
Date: Tue, 18 Jan 2022 16:09:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKNNWDxQ_TUDgRgri3p67u6v4i3v1oV=HMicQVyqnuJ=SA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: zQCowADnyRbOdeZh++J0Bg--.39567S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CFyUWFWfXr1UCr1UAr1DWrg_yoW8Zw47pr
 15JFZrK3Z7JFySk3yUtw1DtrWrG3WrA39Fq3yIv3ZrAr4xGrnxGF1DKa1vkr42yr48Zw4I
 9F43ur1FvrZ0va7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBF14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kI
 c2xKxwCYjI0SjxkI62AI1cAE67vIY487MxkF7I0Ew4C26cxK6c8Ij28IcwCF04k20xvY0x
 0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
 7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
 C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF
 04k26cxKx2IYs7xG6r4j6FyUMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7
 CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUTOJ5UUUUU=
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Tue, 18 Jan 2022 08:10:02 -0000


在 2022/1/18 下午12:23, Alistair Francis 写道:
> On Tue, Jan 11, 2022 at 1:53 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
>> ---
>>   target/riscv/cpu.c | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index b487a8282c..628a782ba9 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -694,9 +694,23 @@ static Property riscv_cpu_properties[] = {
>>       DEFINE_PROP_BOOL("zba", RISCVCPU, cfg.ext_zba, true),
>>       DEFINE_PROP_BOOL("zbb", RISCVCPU, cfg.ext_zbb, true),
>>       DEFINE_PROP_BOOL("zbc", RISCVCPU, cfg.ext_zbc, true),
>> +    DEFINE_PROP_BOOL("zbkb", RISCVCPU, cfg.ext_zbkb, false),
>> +    DEFINE_PROP_BOOL("zbkc", RISCVCPU, cfg.ext_zbkc, false),
>> +    DEFINE_PROP_BOOL("zbkx", RISCVCPU, cfg.ext_zbkx, false),
>>       DEFINE_PROP_BOOL("zbs", RISCVCPU, cfg.ext_zbs, true),
>> +    DEFINE_PROP_BOOL("zk", RISCVCPU, cfg.ext_zk, false),
>> +    DEFINE_PROP_BOOL("zkn", RISCVCPU, cfg.ext_zkn, false),
>> +    DEFINE_PROP_BOOL("zknd", RISCVCPU, cfg.ext_zknd, false),
>> +    DEFINE_PROP_BOOL("zkne", RISCVCPU, cfg.ext_zkne, false),
>> +    DEFINE_PROP_BOOL("zknh", RISCVCPU, cfg.ext_zknh, false),
>> +    DEFINE_PROP_BOOL("zkr", RISCVCPU, cfg.ext_zkr, false),
>> +    DEFINE_PROP_BOOL("zks", RISCVCPU, cfg.ext_zks, false),
>> +    DEFINE_PROP_BOOL("zksed", RISCVCPU, cfg.ext_zksed, false),
>> +    DEFINE_PROP_BOOL("zksh", RISCVCPU, cfg.ext_zksh, false),
>> +    DEFINE_PROP_BOOL("zkt", RISCVCPU, cfg.ext_zkt, false),
>>
>>       /* These are experimental so mark with 'x-' */
>> +    DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
> Looks like a rebase error
>
> Alistair

Yeah. I'll fix this.

Regards,

Weiwei Li

>>       DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
>>       /* ePMP 0.9.3 */
>>       DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
>> --
>> 2.17.1
>>
>>


