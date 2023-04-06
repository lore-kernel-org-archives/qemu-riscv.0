Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pkEXI-00068n-Pf
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 21:35:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pkEXG-00068N-Tb; Wed, 05 Apr 2023 21:35:34 -0400
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pkEXE-0000bH-2x; Wed, 05 Apr 2023 21:35:34 -0400
Received: from [192.168.0.120] (unknown [180.175.29.170])
 by APP-01 (Coremail) with SMTP id qwCowACHEdTZIS5kCgoGAA--.1609S2;
 Thu, 06 Apr 2023 09:35:22 +0800 (CST)
Message-ID: <9ceb5823-901f-b8ec-ddcd-ce4a500fcf72@iscas.ac.cn>
Date: Thu, 6 Apr 2023 09:35:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Cc: liweiwei@iscas.ac.cn, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Subject: Re: [PATCH 2/2] target/riscv: Legalize MPP value in write_mstatus
Content-Language: en-US
To: Alistair Francis <alistair23@gmail.com>
References: <20230330135818.68417-1-liweiwei@iscas.ac.cn>
 <20230330135818.68417-3-liweiwei@iscas.ac.cn>
 <CAKmqyKNyfZoff5woowdVvf9WH_AnTPsD3ES7rkgubLKM0E=9Rg@mail.gmail.com>
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <CAKmqyKNyfZoff5woowdVvf9WH_AnTPsD3ES7rkgubLKM0E=9Rg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowACHEdTZIS5kCgoGAA--.1609S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCrWrKF4xuF18Gr47KFykZrb_yoW5WF4fpr
 WkKFW3GFWDJrZFg3WSqF48WF1YyrW3KrWUCan3tw4UJws5JrZYkF1Dt3y3Cr1DZFyxWr1F
 9asru3s8AF47ZFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9F14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F
 4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
 7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
 1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
 n2kIc2xKxwCYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFV
 Cjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWl
 x4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r
 1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_
 JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcS
 sGvfC2KfnxnUUI43ZEXa7VUbXdbUUUUUU==
X-Originating-IP: [180.175.29.170]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.355,
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
X-List-Received-Date: Thu, 06 Apr 2023 01:35:35 -0000


On 2023/4/6 09:26, Alistair Francis wrote:
> On Thu, Mar 30, 2023 at 11:59 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>> mstatus.MPP field is a WARL field, so we remain it unchanged if an
> Only since version 1.11 of the priv spec and we do still support priv 1.10.
>
> I think it's ok to make this change for all priv versions, as it won't
> break any software running 1.10, but it's worth adding a comment or at
> least a mention in the commit message.

OK. I'll add it in next version.

Regards,

Weiwei Li

>
> Alistair
>
>> invalid value is written into it. And after this, RVH shouldn't be
>> passed to riscv_cpu_set_mode().
>>
>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
>> ---
>>   target/riscv/cpu_helper.c |  5 +----
>>   target/riscv/csr.c        | 14 ++++++++++++++
>>   2 files changed, 15 insertions(+), 4 deletions(-)
>>
>> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
>> index f88c503cf4..46baf3ab7c 100644
>> --- a/target/riscv/cpu_helper.c
>> +++ b/target/riscv/cpu_helper.c
>> @@ -659,12 +659,9 @@ void riscv_cpu_set_aia_ireg_rmw_fn(CPURISCVState *env, uint32_t priv,
>>
>>   void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv)
>>   {
>> -    if (newpriv > PRV_M) {
>> +    if (newpriv > PRV_M || newpriv == PRV_H) {
>>           g_assert_not_reached();
>>       }
>> -    if (newpriv == PRV_H) {
>> -        newpriv = PRV_U;
>> -    }
>>       if (icount_enabled() && newpriv != env->priv) {
>>           riscv_itrigger_update_priv(env);
>>       }
>> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>> index d522efc0b6..a99026c3e8 100644
>> --- a/target/riscv/csr.c
>> +++ b/target/riscv/csr.c
>> @@ -1238,6 +1238,18 @@ static bool validate_vm(CPURISCVState *env, target_ulong vm)
>>       return (vm & 0xf) <= satp_mode_max_from_map(cpu->cfg.satp_mode.map);
>>   }
>>
>> +static target_ulong legalize_mpp(CPURISCVState *env, target_ulong old_mpp,
>> +                                 target_ulong val)
>> +{
>> +    target_ulong new_mpp = get_field(val, MSTATUS_MPP);
>> +    bool mpp_invalid = (new_mpp == PRV_S && !riscv_has_ext(env, RVS)) ||
>> +                       (new_mpp == PRV_U && !riscv_has_ext(env, RVU)) ||
>> +                       (new_mpp == PRV_H);
>> +
>> +    /* Remain field unchanged if new_mpp value is invalid */
>> +    return mpp_invalid ? set_field(val, MSTATUS_MPP, old_mpp) : val;
>> +}
>> +
>>   static RISCVException write_mstatus(CPURISCVState *env, int csrno,
>>                                       target_ulong val)
>>   {
>> @@ -1245,6 +1257,8 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
>>       uint64_t mask = 0;
>>       RISCVMXL xl = riscv_cpu_mxl(env);
>>
>> +    val = legalize_mpp(env, get_field(mstatus, MSTATUS_MPP), val);
>> +
>>       /* flush tlb on mstatus fields that affect VM */
>>       if ((val ^ mstatus) & (MSTATUS_MXR | MSTATUS_MPP | MSTATUS_MPV |
>>               MSTATUS_MPRV | MSTATUS_SUM)) {
>> --
>> 2.25.1
>>
>>


