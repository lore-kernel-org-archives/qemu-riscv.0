Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nOrZ8-0003TF-2f
	for mharc-qemu-riscv@gnu.org; Mon, 28 Feb 2022 20:44:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nOrZ4-0003Sf-9u; Mon, 28 Feb 2022 20:44:34 -0500
Received: from smtp84.cstnet.cn ([159.226.251.84]:58142 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nOrZ1-0002WL-9A; Mon, 28 Feb 2022 20:44:33 -0500
Received: from [192.168.0.104] (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowADXxUBzeh1imznQAQ--.17518S2;
 Tue, 01 Mar 2022 09:44:20 +0800 (CST)
Subject: Re: [PATCH v7 12/14] target/riscv: rvk: add CSR support for Zkr
To: Richard Henderson <richard.henderson@linaro.org>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, lustrew@foxmail.com,
 luruibo2000@163.com
References: <20220228144810.7284-1-liweiwei@iscas.ac.cn>
 <20220228144810.7284-13-liweiwei@iscas.ac.cn>
 <0879f52c-165b-75f2-82e1-761013816f03@linaro.org>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <72840ca4-9dde-e496-da85-75547f37a096@iscas.ac.cn>
Date: Tue, 1 Mar 2022 09:44:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <0879f52c-165b-75f2-82e1-761013816f03@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: zQCowADXxUBzeh1imznQAQ--.17518S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGF1DXry5Kr4rWryUCF1UGFg_yoW5Xw1kpr
 1ktrWUArWUJrs5Jr1UtryUXa45Jry5J3Z8Jw1vqFyDJr47Jr1jqr1UXrWqgr1UJF48tw1U
 Jr45XrnxZF1DXrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBv14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
 1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
 7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
 1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
 n2kIc2xKxwCYjI0SjxkI62AI1cAE67vIY487MxkF7I0Ew4C26cxK6c8Ij28IcwCF04k20x
 vY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I
 3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIx
 AIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAI
 cVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
 A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUTOJ5UUUUU=
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
X-List-Received-Date: Tue, 01 Mar 2022 01:44:35 -0000


在 2022/3/1 上午4:11, Richard Henderson 写道:
> On 2/28/22 04:48, Weiwei Li wrote:
>> +/* Crypto Extension */
>> +static RISCVException rmw_seed(CPURISCVState *env, int csrno,
>> +                              target_ulong *ret_value,
>> +                              target_ulong new_value, target_ulong 
>> write_mask)
>> +{
>> +    if (!write_mask) {
>> +        return RISCV_EXCP_ILLEGAL_INST;
>> +    }
>
> This is incorrect.  The error should only be with a write-mask of the 
> actual x0 register, not another register which happens to contain 0.  
> There is in fact no way to diagnose exactly what you want here, which 
> IIRC has an existing fixme comment somewhere.
Yeah. write_mask is also used in riscv_csrrw_check to check whether the 
read-only csr is written. We cannot distinguish x0 and reg which 
contains 0  here without changing total progress of csr read/write.
>
>> +    uint32_t return_status = SEED_OPST_ES16;
>> +
>> +    *ret_value = return_status;
>> +    if (return_status == SEED_OPST_ES16) {
>> +        uint16_t random_number;
>> +        qemu_guest_getrandom_nofail(&random_number, 
>> sizeof(random_number));
>> +        *ret_value = (*ret_value) | random_number;
>> +    } else if (return_status == SEED_OPST_BIST) {
>> +        /* Do nothing */
>> +    } else if (return_status == SEED_OPST_WAIT) {
>> +        /* Do nothing */
>> +    } else if (return_status == SEED_OPST_DEAD) {
>> +        /* Do nothing */
>> +    }
>
> This is also incorrect.  This should be
>
>     uint32_t result;
>     uint16_t random_v;
>     Error *random_e = NULL;
>     int random_r;
>
>     random_r = guest_getrandom(&random_v, 2, &random_e);
>     if (unlikely(random_r < 0)) {
>         /*
>          * Failed, for unknown reasons in the crypto subsystem.
>          * The best we can do is log the reason and return a
>          * failure indication to the guest.  There is no reason
>          * we know to expect the failure to be transitory, so
>          * indicate DEAD to avoid having the guest spin on WAIT.
>          */
>         qemu_log_mask(LOG_UNIMP, "%s: Crypto failure: %s",
>                       __func__, error_get_pretty(random_e));
>         error_free(random_e);
>         result = SEED_OPST_DEAD;
>     } else {
>         result = random_v | SEED_OPST_ES16;
>     }
>
> C.f. target/arm/helper.c, rndr_readfn.

OK.  I'll fix this.

Regards,

Weiwei Li

>
>
> r~


