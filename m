Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1phgof-0000yn-Do
	for mharc-qemu-riscv@gnu.org; Wed, 29 Mar 2023 21:11:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1phgod-0000yU-V9; Wed, 29 Mar 2023 21:11:00 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1phgob-0002um-Mp; Wed, 29 Mar 2023 21:10:59 -0400
Received: from [192.168.0.119] (unknown [180.175.29.170])
 by APP-05 (Coremail) with SMTP id zQCowADn7xeb4SRkrPEFDA--.23400S2;
 Thu, 30 Mar 2023 09:10:52 +0800 (CST)
Message-ID: <b4d70dd2-3a29-2ccc-0b19-8ab8b9c78801@iscas.ac.cn>
Date: Thu, 30 Mar 2023 09:10:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Cc: liweiwei@iscas.ac.cn, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Subject: Re: [PATCH v2 5/5] target/riscv: Add pointer mask support for
 instruction fetch
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20230329032346.55185-1-liweiwei@iscas.ac.cn>
 <20230329032346.55185-6-liweiwei@iscas.ac.cn>
 <a1809221-ed92-01ec-28b9-7a9397c9066e@linaro.org>
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <a1809221-ed92-01ec-28b9-7a9397c9066e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowADn7xeb4SRkrPEFDA--.23400S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kry5Zw13tw1xtrW5ZF15CFg_yoW8XrWrpr
 93Gay5KryDCrZ7Cw4fJr1UGry5Jrs5Kw1UGwsa93WfJw45JrWF9F1qgw42gFnrZFWxGr1j
 vF1jkF13uF45ZrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9F14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
 1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
 7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
 1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
 n2kIc2xKxwCYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFV
 Cjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWl
 x4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r
 1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_
 JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcS
 sGvfC2KfnxnUUI43ZEXa7VU1a9aPUUUUU==
X-Originating-IP: [180.175.29.170]
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
X-List-Received-Date: Thu, 30 Mar 2023 01:11:00 -0000


On 2023/3/30 00:36, Richard Henderson wrote:
> On 3/28/23 20:23, Weiwei Li wrote:
>> Transform the fetch address in cpu_get_tb_cpu_state() when pointer
>> mask for instruction is enabled.
>> Enable PC-relative translation when J is enabled.
>>
>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
>> ---
>>   target/riscv/cpu.c        |  4 ++++
>>   target/riscv/cpu.h        |  1 +
>>   target/riscv/cpu_helper.c | 20 +++++++++++++++++++-
>>   target/riscv/csr.c        |  2 --
>>   4 files changed, 24 insertions(+), 3 deletions(-)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index 646fa31a59..99f0177c6d 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -1193,6 +1193,10 @@ static void riscv_cpu_realize(DeviceState 
>> *dev, Error **errp)
>>       #ifndef CONFIG_USER_ONLY
>> +    if(cpu->cfg.ext_j) {
>> +        cs->tcg_cflags |= CF_PCREL;
>> +    }
>
> "if ("
>
> Consider enabling it always for system mode.  The reason for the 
> existence of CF_PCREL is to improve performance with the guest 
> kernel's address space randomization.  Each guest process maps libc.so 
> (et al) at a different virtual address, and this allows those 
> translations to be shared.
>
> I would enable CF_PCREL in a separate patch from MMTE_*_PM_INSN.

OK. I'll update this in next version.

Regards,

Weiwei Li

>
>
> r~


