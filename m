Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oAsnB-0002Qe-5G
	for mharc-qemu-riscv@gnu.org; Mon, 11 Jul 2022 08:45:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oAsmt-0002JY-MT; Mon, 11 Jul 2022 08:45:24 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:40610 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oAsmp-0001hM-LF; Mon, 11 Jul 2022 08:45:17 -0400
Received: from [192.168.3.6] (unknown [180.156.173.38])
 by APP-01 (Coremail) with SMTP id qwCowAC3FxVTG8xiPR+hDg--.57713S2;
 Mon, 11 Jul 2022 20:45:07 +0800 (CST)
Subject: Re: [PATCH 5/6] target/riscv: fix checks in hmode/hmode32
To: Alistair Francis <alistair23@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V"
 <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?=
 <lazyparser@gmail.com>
References: <20220710082400.29224-1-liweiwei@iscas.ac.cn>
 <20220710082400.29224-6-liweiwei@iscas.ac.cn>
 <CAKmqyKM2ghDn0=sBMuj-9-Uba7mBCNmCVps224c-2XUbBBSBsg@mail.gmail.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <626a6b2f-6412-624c-5dc3-3467668289a7@iscas.ac.cn>
Date: Mon, 11 Jul 2022 20:45:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKM2ghDn0=sBMuj-9-Uba7mBCNmCVps224c-2XUbBBSBsg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: qwCowAC3FxVTG8xiPR+hDg--.57713S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KFyrtrW3tF4UCr4UJrWrKrg_yoW8Cw1xpF
 4xZFWjkF9xAFZF9ayIqr1jgF15uF4Ygw4UGwsav3y8JFsxJ3yYyFyDtw4Fk34kXa48ur40
 va17CFn5Za17tFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvE14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
 Y487MxkF7I0Ew4C26cxK6c8Ij28IcwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbV
 WUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF
 67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42
 IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6Fyj6rWUJwCI
 42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWI
 evJa73UjIFyTuYvjfUnXdbUUUUU
X-Originating-IP: [180.156.173.38]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.21; envelope-from=liweiwei@iscas.ac.cn;
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
X-List-Received-Date: Mon, 11 Jul 2022 12:45:34 -0000


在 2022/7/11 下午2:46, Alistair Francis 写道:
> On Sun, Jul 10, 2022 at 6:24 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>> - It seems that there is no explicitly description about whether
>> the Hypervisor CSRs requires S extension
>> - Csrs only existed in RV32 will not trigger virtual instruction fault
>> when not in RV32
>>
>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
>> ---
>>   target/riscv/csr.c | 9 ++-------
>>   1 file changed, 2 insertions(+), 7 deletions(-)
>>
>> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
>> index 0d8e98b7a9..975007f1ac 100644
>> --- a/target/riscv/csr.c
>> +++ b/target/riscv/csr.c
>> @@ -311,8 +311,7 @@ static int aia_smode32(CPURISCVState *env, int csrno)
>>
>>   static RISCVException hmode(CPURISCVState *env, int csrno)
>>   {
>> -    if (riscv_has_ext(env, RVS) &&
>> -        riscv_has_ext(env, RVH)) {
>> +    if (riscv_has_ext(env, RVH)) {
> This doesn't seem right. The spec doesn't explicitly say this, but I
> don't see how you can have the Hypervisor extension without S-mode

I'm also wonder about this. However, if H extension implicitly requires  
S-mode,

maybe it's better to add a check for this in riscv_cpu_realize, and we 
just check H here.

Regards,

Weiwei Li

>
>>           /* Hypervisor extension is supported */
>>           if ((env->priv == PRV_S && !riscv_cpu_virt_enabled(env)) ||
>>               env->priv == PRV_M) {
>> @@ -328,11 +327,7 @@ static RISCVException hmode(CPURISCVState *env, int csrno)
>>   static RISCVException hmode32(CPURISCVState *env, int csrno)
>>   {
>>       if (riscv_cpu_mxl(env) != MXL_RV32) {
>> -        if (!riscv_cpu_virt_enabled(env)) {
>> -            return RISCV_EXCP_ILLEGAL_INST;
>> -        } else {
>> -            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
>> -        }
>> +        return RISCV_EXCP_ILLEGAL_INST;
> Good catch
>
> Alistair
>
>>       }
>>
>>       return hmode(env, csrno);
>> --
>> 2.17.1
>>
>>


