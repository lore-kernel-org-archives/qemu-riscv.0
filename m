Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pgzOY-0003x8-Pu
	for mharc-qemu-riscv@gnu.org; Mon, 27 Mar 2023 22:49:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pgzOX-0003wu-1B; Mon, 27 Mar 2023 22:49:09 -0400
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pgzOU-00026h-70; Mon, 27 Mar 2023 22:49:08 -0400
Received: from [192.168.0.120] (unknown [180.175.29.170])
 by APP-01 (Coremail) with SMTP id qwCowACnrc2YVSJkLg3zFw--.2607S2;
 Tue, 28 Mar 2023 10:48:57 +0800 (CST)
Message-ID: <c1b60f5e-5bb8-5462-ae93-7813da4269bb@iscas.ac.cn>
Date: Tue, 28 Mar 2023 10:48:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/5] target/riscv: Fix effective address for pointer mask
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230327100027.61160-1-liweiwei@iscas.ac.cn>
 <20230327100027.61160-2-liweiwei@iscas.ac.cn>
 <c0abfb39-56a7-a184-f134-bcb075908f57@linux.alibaba.com>
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <c0abfb39-56a7-a184-f134-bcb075908f57@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowACnrc2YVSJkLg3zFw--.2607S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXFWDuF1UZw43Xw15Gry5XFb_yoW5XrW7pF
 1kGrWkury5Xr97JFy7tr4DXFyrGr1UJa1DXw1vva4YyrWUXr10qr4DXrZIgr4jyr48Xr4U
 Ar45GryUuF17XrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
 1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_
 JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcS
 sGvfC2KfnxnUUI43ZEXa7VUbXdbUUUUUU==
X-Originating-IP: [180.175.29.170]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Tue, 28 Mar 2023 02:49:09 -0000


On 2023/3/28 10:20, LIU Zhiwei wrote:
>
> On 2023/3/27 18:00, Weiwei Li wrote:
>> Since pointer mask works on effective address, and the xl works on the
>> generation of effective address, so xl related calculation should be 
>> done
>> before pointer mask.
>
> Incorrect. It has been done.
>
> When updating the pm_mask,  we have already considered the env->xl.
>
> You can see it in riscv_cpu_update_mask
>
>     if (env->xl == MXL_RV32) {
>         env->cur_pmmask = mask & UINT32_MAX;
>         env->cur_pmbase = base & UINT32_MAX;
>     } else {
>         env->cur_pmmask = mask;
>         env->cur_pmbase = base;
>     }
>
Yeah, I missed this part. Then we should ensure cur_pmmask/base is 
updated when xl changes.

If so, I'll drop this patch.

Regards,

Weiwei Li

>>
>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
>> ---
>>   target/riscv/translate.c | 16 ++++++++++++----
>>   1 file changed, 12 insertions(+), 4 deletions(-)
>>
>> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
>> index 0ee8ee147d..bf0e2d318e 100644
>> --- a/target/riscv/translate.c
>> +++ b/target/riscv/translate.c
>> @@ -568,11 +568,15 @@ static TCGv get_address(DisasContext *ctx, int 
>> rs1, int imm)
>>       TCGv src1 = get_gpr(ctx, rs1, EXT_NONE);
>>         tcg_gen_addi_tl(addr, src1, imm);
>> +
>> +    if (get_xl(ctx) == MXL_RV32) {
>> +        tcg_gen_ext32u_tl(addr, addr);
>> +    }
>> +
>>       if (ctx->pm_mask_enabled) {
>>           tcg_gen_andc_tl(addr, addr, pm_mask);
>> -    } else if (get_xl(ctx) == MXL_RV32) {
>> -        tcg_gen_ext32u_tl(addr, addr);
>>       }
>
> The else is processing when only xl works, and the pm_mask doesn't work.
>
> Zhiwei
>
>> +
>>       if (ctx->pm_base_enabled) {
>>           tcg_gen_or_tl(addr, addr, pm_base);
>>       }
>> @@ -586,11 +590,15 @@ static TCGv get_address_indexed(DisasContext 
>> *ctx, int rs1, TCGv offs)
>>       TCGv src1 = get_gpr(ctx, rs1, EXT_NONE);
>>         tcg_gen_add_tl(addr, src1, offs);
>> +
>> +    if (get_xl(ctx) == MXL_RV32) {
>> +        tcg_gen_ext32u_tl(addr, addr);
>> +    }
>> +
>>       if (ctx->pm_mask_enabled) {
>>           tcg_gen_andc_tl(addr, addr, pm_mask);
>> -    } else if (get_xl(ctx) == MXL_RV32) {
>> -        tcg_gen_ext32u_tl(addr, addr);
>>       }
>> +
>>       if (ctx->pm_base_enabled) {
>>           tcg_gen_or_tl(addr, addr, pm_base);
>>       }


