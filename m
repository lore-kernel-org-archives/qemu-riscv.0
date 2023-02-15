Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pS7zT-0001M9-Hz
	for mharc-qemu-riscv@gnu.org; Tue, 14 Feb 2023 21:57:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pS7zR-0001Lk-Cs; Tue, 14 Feb 2023 21:57:49 -0500
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pS7zN-00015N-SN; Tue, 14 Feb 2023 21:57:49 -0500
Received: from [192.168.0.119] (unknown [114.95.238.225])
 by APP-01 (Coremail) with SMTP id qwCowADnANUfSuxjAdwpBQ--.2482S2;
 Wed, 15 Feb 2023 10:57:35 +0800 (CST)
Message-ID: <5612a275-4902-a7e8-2f10-1f1fbd999adf@iscas.ac.cn>
Date: Wed, 15 Feb 2023 10:57:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Cc: liweiwei@iscas.ac.cn, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Subject: Re: [PATCH 18/18] target/riscv: Move configuration check to envcfg
 CSRs predicate()
To: Bin Meng <bmeng.cn@gmail.com>
References: <20230213180215.1524938-19-bmeng@tinylab.org>
 <e0c10cb9-c83b-bb35-3041-0f388dc48267@iscas.ac.cn>
 <CAEUhbmX6Qb1aAdZC+d2F=n5qLo60XGiE3e0xTco1TgNgDxAKVg@mail.gmail.com>
Content-Language: en-US
From: weiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <CAEUhbmX6Qb1aAdZC+d2F=n5qLo60XGiE3e0xTco1TgNgDxAKVg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: qwCowADnANUfSuxjAdwpBQ--.2482S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAryDtry8Cw4fAw4fCFW7Arb_yoW5ArWfpr
 48GanIkFykWF9Fv34ft3Z8tF13uw18Gw45ZwsrGw18Jr1qkry5Jr1DWrW3ua95ZrZ7Gw40
 vF4jkF43ur42ya7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkE14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
 1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
 7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
 1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE
 67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrV
 AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCI
 c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267
 AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_
 Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUdHU
 DUUUUU=
X-Originating-IP: [114.95.238.225]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.35,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Wed, 15 Feb 2023 02:57:49 -0000


On 2023/2/15 10:22, Bin Meng wrote:
> On Tue, Feb 14, 2023 at 10:59 PM weiwei <liweiwei@iscas.ac.cn> wrote:
>>
>> On 2023/2/14 22:27, Bin Meng wrote:
>>> At present the envcfg CSRs predicate() routines are generic one like
>>> smode(), hmode. The configuration check is done in the read / write
>>> routine. Create a new predicate routine to cover such check, so that
>>> gdbstub can correctly report its existence.
>>>
>>> Signed-off-by: Bin Meng <bmeng@tinylab.org>
>>>
>>> ---
>>>
>>>    target/riscv/csr.c | 98 +++++++++++++++++++++++++++++-----------------
>>>    1 file changed, 61 insertions(+), 37 deletions(-)
>>>
>>> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>>> index 37350b8a6d..284ccc09dd 100644
>>> --- a/target/riscv/csr.c
>>> +++ b/target/riscv/csr.c
>>> @@ -41,40 +41,6 @@ void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops)
>>>    }
>>>
>>>    /* Predicates */
>>> -#if !defined(CONFIG_USER_ONLY)
>>> -static RISCVException smstateen_acc_ok(CPURISCVState *env, int index,
>>> -                                       uint64_t bit)
>>> -{
>>> -    bool virt = riscv_cpu_virt_enabled(env);
>>> -    RISCVCPU *cpu = env_archcpu(env);
>>> -
>>> -    if (env->priv == PRV_M || !cpu->cfg.ext_smstateen) {
>>> -        return RISCV_EXCP_NONE;
>>> -    }
>>> -
>>> -    if (!(env->mstateen[index] & bit)) {
>>> -        return RISCV_EXCP_ILLEGAL_INST;
>>> -    }
>>> -
>>> -    if (virt) {
>>> -        if (!(env->hstateen[index] & bit)) {
>>> -            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>>> -        }
>>> -
>>> -        if (env->priv == PRV_U && !(env->sstateen[index] & bit)) {
>>> -            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>>> -        }
>>> -    }
>>> -
>>> -    if (env->priv == PRV_U && riscv_has_ext(env, RVS)) {
>>> -        if (!(env->sstateen[index] & bit)) {
>>> -            return RISCV_EXCP_ILLEGAL_INST;
>>> -        }
>>> -    }
>>> -
>>> -    return RISCV_EXCP_NONE;
>>> -}
>>> -#endif
>>>
>>>    static RISCVException fs(CPURISCVState *env, int csrno)
>>>    {
>>> @@ -318,6 +284,32 @@ static RISCVException umode32(CPURISCVState *env, int csrno)
>>>        return umode(env, csrno);
>>>    }
>>>
>>> +static RISCVException envcfg(CPURISCVState *env, int csrno)
>>> +{
>>> +    RISCVCPU *cpu = env_archcpu(env);
>>> +    riscv_csr_predicate_fn predicate;
>>> +
>>> +    if (cpu->cfg.ext_smstateen) {
>>> +        return RISCV_EXCP_ILLEGAL_INST;
>>> +    }
>> This check seems not right here.  Why  ILLEGAL_INST is directly
>> triggered if smstateen is enabled?
> This logic was there in the original codes. I was confused when I
> looked at this as well.

Sorry, I didn't find the original codes. Do you mean this:

     if (env->priv == PRV_M || !cpu->cfg.ext_smstateen) {
         return RISCV_EXCP_NONE;
     }

If so, I think the check here is to make the following *stateen related
check ignored when smstateen extension is disabled.

Regards,

Weiwei Li

> Anyway, if it is an issue, it should be a separate patch.
>
>> It seems that smstateen related check will be done  for
>> senvcfg/henvcfg{h} when smstateen is enabled.
>>
> Regards,
> Bin


