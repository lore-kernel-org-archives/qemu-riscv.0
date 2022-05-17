Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nqp9L-00057X-Ng
	for mharc-qemu-riscv@gnu.org; Tue, 17 May 2022 00:49:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nqp9J-00056g-QL; Tue, 17 May 2022 00:49:33 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:40166 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nqp9G-00072u-J0; Tue, 17 May 2022 00:49:33 -0400
Received: from [192.168.3.6] (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowACnrHxOKYNizmHsBw--.14664S2;
 Tue, 17 May 2022 12:49:19 +0800 (CST)
Subject: Re: [PATCH v2 2/2] target/riscv: disable zb* extensions for
 sifive/ibex cpu types by default
To: Alistair Francis <alistair23@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V"
 <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?=
 <lazyparser@gmail.com>
References: <20220517021907.10060-1-liweiwei@iscas.ac.cn>
 <20220517021907.10060-2-liweiwei@iscas.ac.cn>
 <CAKmqyKNzfDxNbk6G-fURk-wXygU6z_GgjVFnKc0JdsptZHLkSg@mail.gmail.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <47e65753-cb70-69bb-cef3-9928211e49f2@iscas.ac.cn>
Date: Tue, 17 May 2022 12:49:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKNzfDxNbk6G-fURk-wXygU6z_GgjVFnKc0JdsptZHLkSg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: zQCowACnrHxOKYNizmHsBw--.14664S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWw17JF4UZFWxJw45tr15CFg_yoWrAr1rpr
 98Aa13KrW8Jr1xGa1IgrZrCr18Cw18KrZxXw4SkFyUCayUA395XF1UCw40k3W8XrW8uF9I
 9a18WwsrX3s7Gr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9Y14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
 1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CE
 bIxvr21lc7CjxVAKzI0EY4vE52x082I5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
 AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
 17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
 IF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq
 3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCT
 nIWIevJa73UjIFyTuYvjfU8VbyDUUUU
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
X-List-Received-Date: Tue, 17 May 2022 04:49:34 -0000


在 2022/5/17 下午12:16, Alistair Francis 写道:
> On Tue, May 17, 2022 at 12:21 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>>   - properties for zb* extensions are enabled by default which will make sifive/ibex cpu types implicitly support zb* extensions
>>
>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
>> ---
>>   target/riscv/cpu.c | 24 ++++++++++++++++++++++++
>>   1 file changed, 24 insertions(+)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index b12f69c584..e205be34e9 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -176,6 +176,10 @@ static void rv64_sifive_u_cpu_init(Object *obj)
>>       CPURISCVState *env = &RISCV_CPU(obj)->env;
>>       set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
>>       set_priv_version(env, PRIV_VERSION_1_10_0);
>> +    qdev_prop_set_bit(DEVICE(obj), "zba", false);
>> +    qdev_prop_set_bit(DEVICE(obj), "zbb", false);
>> +    qdev_prop_set_bit(DEVICE(obj), "zbc", false);
>> +    qdev_prop_set_bit(DEVICE(obj), "zbs", false);
> This is very error prone. I think we should either disable the
> extensions by default, then enable them for the rv32/rv64 CPUs, or
> instead do something like this:
> https://patchew.org/QEMU/20220517041100.93045-1-alistair.francis@opensource.wdc.com/
>
> Alistair

OK, I think the way from your patchset is better.

Regards,

Weiwei Li

>>   }
>>
>>   static void rv64_sifive_e_cpu_init(Object *obj)
>> @@ -184,6 +188,10 @@ static void rv64_sifive_e_cpu_init(Object *obj)
>>       set_misa(env, MXL_RV64, RVI | RVM | RVA | RVC | RVU);
>>       set_priv_version(env, PRIV_VERSION_1_10_0);
>>       qdev_prop_set_bit(DEVICE(obj), "mmu", false);
>> +    qdev_prop_set_bit(DEVICE(obj), "zba", false);
>> +    qdev_prop_set_bit(DEVICE(obj), "zbb", false);
>> +    qdev_prop_set_bit(DEVICE(obj), "zbc", false);
>> +    qdev_prop_set_bit(DEVICE(obj), "zbs", false);
>>   }
>>
>>   static void rv128_base_cpu_init(Object *obj)
>> @@ -211,6 +219,10 @@ static void rv32_sifive_u_cpu_init(Object *obj)
>>       CPURISCVState *env = &RISCV_CPU(obj)->env;
>>       set_misa(env, MXL_RV32, RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
>>       set_priv_version(env, PRIV_VERSION_1_10_0);
>> +    qdev_prop_set_bit(DEVICE(obj), "zba", false);
>> +    qdev_prop_set_bit(DEVICE(obj), "zbb", false);
>> +    qdev_prop_set_bit(DEVICE(obj), "zbc", false);
>> +    qdev_prop_set_bit(DEVICE(obj), "zbs", false);
>>   }
>>
>>   static void rv32_sifive_e_cpu_init(Object *obj)
>> @@ -219,6 +231,10 @@ static void rv32_sifive_e_cpu_init(Object *obj)
>>       set_misa(env, MXL_RV32, RVI | RVM | RVA | RVC | RVU);
>>       set_priv_version(env, PRIV_VERSION_1_10_0);
>>       qdev_prop_set_bit(DEVICE(obj), "mmu", false);
>> +    qdev_prop_set_bit(DEVICE(obj), "zba", false);
>> +    qdev_prop_set_bit(DEVICE(obj), "zbb", false);
>> +    qdev_prop_set_bit(DEVICE(obj), "zbc", false);
>> +    qdev_prop_set_bit(DEVICE(obj), "zbs", false);
>>   }
>>
>>   static void rv32_ibex_cpu_init(Object *obj)
>> @@ -228,6 +244,10 @@ static void rv32_ibex_cpu_init(Object *obj)
>>       set_priv_version(env, PRIV_VERSION_1_10_0);
>>       qdev_prop_set_bit(DEVICE(obj), "mmu", false);
>>       qdev_prop_set_bit(DEVICE(obj), "x-epmp", true);
>> +    qdev_prop_set_bit(DEVICE(obj), "zba", false);
>> +    qdev_prop_set_bit(DEVICE(obj), "zbb", false);
>> +    qdev_prop_set_bit(DEVICE(obj), "zbc", false);
>> +    qdev_prop_set_bit(DEVICE(obj), "zbs", false);
>>   }
>>
>>   static void rv32_imafcu_nommu_cpu_init(Object *obj)
>> @@ -237,6 +257,10 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
>>       set_priv_version(env, PRIV_VERSION_1_10_0);
>>       set_resetvec(env, DEFAULT_RSTVEC);
>>       qdev_prop_set_bit(DEVICE(obj), "mmu", false);
>> +    qdev_prop_set_bit(DEVICE(obj), "zba", false);
>> +    qdev_prop_set_bit(DEVICE(obj), "zbb", false);
>> +    qdev_prop_set_bit(DEVICE(obj), "zbc", false);
>> +    qdev_prop_set_bit(DEVICE(obj), "zbs", false);
>>   }
>>   #endif
>>
>> --
>> 2.17.1
>>
>>


