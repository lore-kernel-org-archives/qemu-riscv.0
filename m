Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nAp4s-000251-Hx
	for mharc-qemu-riscv@gnu.org; Fri, 21 Jan 2022 03:15:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nAp4q-000216-3D; Fri, 21 Jan 2022 03:15:20 -0500
Received: from smtp23.cstnet.cn ([159.226.251.23]:56584 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nAp4n-00087Z-3m; Fri, 21 Jan 2022 03:15:19 -0500
Received: from [192.168.0.104] (unknown [180.156.147.178])
 by APP-03 (Coremail) with SMTP id rQCowAAnLy+Ga+phfDXSBQ--.65147S2;
 Fri, 21 Jan 2022 16:15:03 +0800 (CST)
Subject: Re: [RFC PATCH v5 14/14] target/riscv: rvk: expose zbk* and zk*
 properties
To: Alistair Francis <alistair23@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V"
 <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?=
 <lazyparser@gmail.com>, luruibo2000@163.com, lustrew@foxmail.com
References: <20220119113754.20323-1-liweiwei@iscas.ac.cn>
 <20220119113754.20323-15-liweiwei@iscas.ac.cn>
 <CAKmqyKM_rj9N4O2057KxApMymApRC7wtiFCaunJkj3n3bqZmhg@mail.gmail.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <992cab6e-2538-f5eb-7880-a190fde8233c@iscas.ac.cn>
Date: Fri, 21 Jan 2022 16:15:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKM_rj9N4O2057KxApMymApRC7wtiFCaunJkj3n3bqZmhg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: rQCowAAnLy+Ga+phfDXSBQ--.65147S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uw17uFyxCryDGry7KF1DAwb_yoW8Zr48pr
 15JFW7K3Z7JrySk3yUtw1DtrW8G3WrC39Fq34Iv3ZrAr4fGrsxGF1DKa1vkr47Ar48ZF4I
 9F43ur1FvrZ0va7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBa14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
 0xkIwI1lc7I2V7IY0VAS07AlzVAYIcxG8wCY1x0264kExVAvwVAq07x20xyl42xK82IYc2
 Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
 6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
 vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
 42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2js
 IEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JU2fOwUUUUU=
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.23; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L3=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 21 Jan 2022 08:15:20 -0000


在 2022/1/21 上午8:35, Alistair Francis 写道:
> On Wed, Jan 19, 2022 at 11:09 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>
> Alistair
>
Thanks for your comments.

Regards,

Weiwei Li

>> ---
>>   target/riscv/cpu.c | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index b487a8282c..04e8e8d3c6 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -694,7 +694,20 @@ static Property riscv_cpu_properties[] = {
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
>>       DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
>> --
>> 2.17.1
>>
>>


