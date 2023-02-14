Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pRvYO-0006QZ-4b
	for mharc-qemu-riscv@gnu.org; Tue, 14 Feb 2023 08:41:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pRvYJ-0006Q1-TR; Tue, 14 Feb 2023 08:41:00 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pRvYG-0007lg-MZ; Tue, 14 Feb 2023 08:40:59 -0500
Received: from [192.168.0.119] (unknown [114.95.238.225])
 by APP-05 (Coremail) with SMTP id zQCowABHT+taj+tjl9cyBQ--.44523S2;
 Tue, 14 Feb 2023 21:40:43 +0800 (CST)
Message-ID: <62413d42-4219-6eb9-4545-13a65750f0da@iscas.ac.cn>
Date: Tue, 14 Feb 2023 21:40:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Cc: liweiwei@iscas.ac.cn, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Subject: Re: [Patch 05/14] target/riscv: Fix relationship between V, Zve*, F
 and D
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20230214083833.44205-1-liweiwei@iscas.ac.cn>
 <20230214083833.44205-6-liweiwei@iscas.ac.cn>
 <78ccde8a-4bbb-d000-de5b-dcb00a65a070@ventanamicro.com>
From: weiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <78ccde8a-4bbb-d000-de5b-dcb00a65a070@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowABHT+taj+tjl9cyBQ--.44523S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGr4kZr4xuFyUCr4UJFy5Jwb_yoW5Zryxpr
 n7G3yYkryDAwn7G34xtr1jqFyUCr40v3WxWanYq3W5ZrW7Wr1jgr1kZrnFgF18Ja1fWr4U
 uw1UWrnrZrsrXa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9j14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
 0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
 jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
 1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY
 04v7Mxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7
 v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
 1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
 AIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI
 42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvf
 C2KfnxnUUI43ZEXa7VUb0D73UUUUU==
X-Originating-IP: [114.95.238.225]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.35,
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
X-List-Received-Date: Tue, 14 Feb 2023 13:41:01 -0000


On 2023/2/14 21:21, Daniel Henrique Barboza wrote:
>
>
> On 2/14/23 05:38, Weiwei Li wrote:
>> Add dependence chain:
>> *  V => Zve64d => Zve64f => Zve32f => F
>> *  V => Zve64d => D
>>
>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
>> ---
>>   target/riscv/cpu.c | 21 ++++++++++++++++++---
>>   1 file changed, 18 insertions(+), 3 deletions(-)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index 9a89bea2a3..4797ef9c42 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -743,12 +743,27 @@ static void 
>> riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>>           return;
>>       }
>>   -    if (cpu->cfg.ext_v && !cpu->cfg.ext_d) {
>> -        error_setg(errp, "V extension requires D extension");
>> +    /* The V vector extension depends on the Zve64d extension */
>> +    if (cpu->cfg.ext_v) {
>> +        cpu->cfg.ext_zve64d = true;
>> +    }
>> +
>> +    /* The Zve64d extension depends on the Zve64f extension */
>> +    if (cpu->cfg.ext_zve64d) {
>> +        cpu->cfg.ext_zve64f = true;
>> +    }
>> +
>> +    /* The Zve64f extension depends on the Zve32f extension */
>> +    if (cpu->cfg.ext_zve64f) {
>> +        cpu->cfg.ext_zve32f = true;
>> +    }
>> +
>> +    if (cpu->cfg.ext_zve64d && !cpu->cfg.ext_d) {
>> +        error_setg(errp, "Zve64d extensions require D extension");
>>           return;
>
> I'll be honest and confess that I wrote a short essay about the 
> problems I have
> with this code. I gave up because in the end it's all stuff that we've 
> been doing
> for a long time in riscv_cpu_validate_set_extensions(). I'll see if I 
> can work in
> a redesign of that function and in how we're setting extensions 
> automatically
> without checking user input and so on.
>
> For now I'll say that this error message seems weird because Zve64d 
> was set to true
> without user input. So this ends up happening:
>
> $ ./qemu-system-riscv64 -M virt -cpu rv64,v=true,d=false
> qemu-system-riscv64: Zve64d extensions require D extension
>
> It's weird because the user didn't enabled Zve64d but the error 
> message is complaining
> about it. Given that the root cause is that ext_v was set, and then 
> we've set other
> extensions under the hood, a saner error message in this case would be 
> "V extension
> requires D extension".
>
>
> Thanks,
>
>
> Daniel

Thanks for your comments.

V extension depends on Zve64d(which is actually parts of V). So Zve64d 
will be enabled when V is enabled.

And in fact, only the instructions in the Zve64d part of V require D 
extension.

To make it more readable, maybe it can be change to :

"Zve64d (or V) extension requires D extension"

Regards,

Weiwei Li

>
>
>
>>       }
>>   -    if ((cpu->cfg.ext_zve32f || cpu->cfg.ext_zve64f) && 
>> !cpu->cfg.ext_f) {
>> +    if (cpu->cfg.ext_zve32f && !cpu->cfg.ext_f) {
>>           error_setg(errp, "Zve32f/Zve64f extensions require F 
>> extension");
>>           return;
>>       }


