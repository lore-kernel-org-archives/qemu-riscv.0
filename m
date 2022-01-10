Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n6pMc-0002vi-GL
	for mharc-qemu-riscv@gnu.org; Mon, 10 Jan 2022 02:45:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n6pMQ-0002u1-VO; Mon, 10 Jan 2022 02:44:59 -0500
Received: from smtp23.cstnet.cn ([159.226.251.23]:51260 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1n6pMO-0005Br-12; Mon, 10 Jan 2022 02:44:58 -0500
Received: from [192.168.0.104] (unknown [180.156.147.178])
 by APP-03 (Coremail) with SMTP id rQCowAA3Py_k49thox9eBQ--.58045S2;
 Mon, 10 Jan 2022 15:44:38 +0800 (CST)
Subject: Re: [PATCH v3 7/7] target/riscv: rvk: expose zbk* and zk* properties
To: Alistair Francis <alistair23@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V"
 <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, lazyparser@gmail.com,
 luruibo2000@163.com, lustrew@foxmail.com
References: <20211230143058.7352-1-liweiwei@iscas.ac.cn>
 <20211230143058.7352-8-liweiwei@iscas.ac.cn>
 <CAKmqyKOQ081MRKveGu6LyAdcZYsPbv5NwWUiu8wptfkFuNCsLw@mail.gmail.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <5ba8f2de-aa71-66cf-c9a5-110b9758fcc7@iscas.ac.cn>
Date: Mon, 10 Jan 2022 15:44:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKOQ081MRKveGu6LyAdcZYsPbv5NwWUiu8wptfkFuNCsLw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: rQCowAA3Py_k49thox9eBQ--.58045S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZFW8uFykXr1UZF4UJFyrWFg_yoW8Zryxpr
 15JFW7KanrJFyfC3yUtw4DtrW8G3WrC3yqg3yIv3ZrAr4fGrnxWF1DKa9Ykr42yr4rZr4x
 uF43ur10vrWvva7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBI14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kI
 c2xKxwCYjI0SjxkI62AI1cAE67vIY487MxkF7I0Ew4C26cxK6c8Ij28IcwCF04k20xvY0x
 0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
 7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
 C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF
 04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aV
 CY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUj0JPtUUUUU==
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.23; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L4=0.001,
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
X-List-Received-Date: Mon, 10 Jan 2022 07:45:02 -0000


在 2022/1/10 下午3:06, Alistair Francis 写道:
> On Fri, Dec 31, 2021 at 12:32 AM liweiwei <liweiwei@iscas.ac.cn> wrote:
>> Signed-off-by: liweiwei <liweiwei@iscas.ac.cn>
>> Signed-off-by: wangjunqiang <wangjunqiang@iscas.ac.cn>
>> ---
>>   target/riscv/cpu.c | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index 961c5f4334..6575ec8cfa 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -668,6 +668,19 @@ static Property riscv_cpu_properties[] = {
>>       DEFINE_PROP_BOOL("zbb", RISCVCPU, cfg.ext_zbb, true),
>>       DEFINE_PROP_BOOL("zbc", RISCVCPU, cfg.ext_zbc, true),
>>       DEFINE_PROP_BOOL("zbs", RISCVCPU, cfg.ext_zbs, true),
>> +    DEFINE_PROP_BOOL("x-zbkb", RISCVCPU, cfg.ext_zbkb, false),
>> +    DEFINE_PROP_BOOL("x-zbkc", RISCVCPU, cfg.ext_zbkc, false),
>> +    DEFINE_PROP_BOOL("x-zbkx", RISCVCPU, cfg.ext_zbkx, false),
>> +    DEFINE_PROP_BOOL("x-zk", RISCVCPU, cfg.ext_zk, false),
>> +    DEFINE_PROP_BOOL("x-zkn", RISCVCPU, cfg.ext_zkn, false),
>> +    DEFINE_PROP_BOOL("x-zknd", RISCVCPU, cfg.ext_zknd, false),
>> +    DEFINE_PROP_BOOL("x-zkne", RISCVCPU, cfg.ext_zkne, false),
>> +    DEFINE_PROP_BOOL("x-zknh", RISCVCPU, cfg.ext_zknh, false),
>> +    DEFINE_PROP_BOOL("x-zkr", RISCVCPU, cfg.ext_zkr, false),
>> +    DEFINE_PROP_BOOL("x-zks", RISCVCPU, cfg.ext_zks, false),
>> +    DEFINE_PROP_BOOL("x-zksed", RISCVCPU, cfg.ext_zksed, false),
>> +    DEFINE_PROP_BOOL("x-zksh", RISCVCPU, cfg.ext_zksh, false),
>> +    DEFINE_PROP_BOOL("x-zkt", RISCVCPU, cfg.ext_zkt, false),
> These are ratified specs, so these don't need to be marked as
> experimental, you can drop the "x-".
>
> Alistair
>
OK. I'll update them. Thanks.
>>       DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
>>       DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
>>       /* ePMP 0.9.3 */
>> --
>> 2.17.1
>>
>>


