Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pmtE5-0004gQ-2u
	for mharc-qemu-riscv@gnu.org; Thu, 13 Apr 2023 05:26:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pmtE3-0004gE-TM; Thu, 13 Apr 2023 05:26:43 -0400
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pmtE0-0007lT-Ag; Thu, 13 Apr 2023 05:26:43 -0400
Received: from [192.168.0.120] (unknown [180.165.241.15])
 by APP-01 (Coremail) with SMTP id qwCowACXnZ3EyjdkQjtXAw--.1858S2;
 Thu, 13 Apr 2023 17:26:28 +0800 (CST)
Message-ID: <201aa452-f7c8-f095-2e51-83c4c8c4801b@iscas.ac.cn>
Date: Thu, 13 Apr 2023 17:26:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] target/riscv: Update check for Zca/zcf/zcd
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn,
 lazyparser@gmail.com, Richard Henderson <richard.henderson@linaro.org>
References: <20230412030648.80470-1-liweiwei@iscas.ac.cn>
 <c581590c-88e6-0eb2-3e89-d00436091824@ventanamicro.com>
Content-Language: en-US
From: Weiwei Li <liweiwei@iscas.ac.cn>
In-Reply-To: <c581590c-88e6-0eb2-3e89-d00436091824@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowACXnZ3EyjdkQjtXAw--.1858S2
X-Coremail-Antispam: 1UD129KBjvJXoW3XrWfWF4DKF4DKF4kGr43trb_yoWfJryxpr
 n5CrW7GryUGr95AF4UJr1UJFyUJr47Kw1DJrnYq3WDJa1UJr4jqr1qqr1agr1UGr48Xr15
 JF1UArnxZr1UXrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9j14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kI
 c2xKxwCYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
 AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
 17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
 IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
 IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
 C2KfnxnUUI43ZEXa7VUbXdbUUUUUU==
X-Originating-IP: [180.165.241.15]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.083,
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
X-List-Received-Date: Thu, 13 Apr 2023 09:26:44 -0000


On 2023/4/13 01:03, Daniel Henrique Barboza wrote:
>
>
> On 4/12/23 00:06, Weiwei Li wrote:
>> Even though Zca/Zcf/Zcd can be included by C/F/D, however, their priv
>> version is higher than the priv version of C/F/D. So if we use check
>> for them instead of check for C/F/D totally, it will trigger new
>> problem when we try to disable the extensions based on the configured
>> priv version.
>>
>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
>> ---
>
> Two things:
>
> - the patch fails checkpatch.pl. I fixed it in my tree, but in case 
> the patch
> needs a new version entirely here's the error:
>
> v7-0005-target-riscv-Mask-the-implicitly-enabled-extensio.patch has no 
> obvious style problems and is ready for submission.
>
> Checking v7-0006-target-riscv-Update-check-for-Zca-zcf-zcd.patch...
> ERROR: space required before the open parenthesis '('
> #36: FILE: target/riscv/insn_trans/trans_rvd.c.inc:36:
> +        if(!has_ext(ctx, RVD) || !has_ext(ctx, RVC)) { \
>
> ERROR: space required before the open parenthesis '('
> #72: FILE: target/riscv/insn_trans/trans_rvf.c.inc:35:
> +        if(!has_ext(ctx, RVF) || !has_ext(ctx, RVC)) { \
>
>
Sorry. I forgot to run the checkpatch.pl. I'll fix it later.
>
> - yesterday Richard sent the following review in the patch "[RFC PATCH 
> 3/4]
> target/riscv: check smstateen fcsr flag":
>
>
> ====================================
>
>> +#define REQUIRE_ZFINX_OR_F(ctx) do { \
>> +    if (!has_ext(ctx, RVF)) { \
>> +        if (!ctx->cfg_ptr->ext_zfinx) { \
>> +            return false; \
>> +        } \
>> +        smstateen_fcsr_check(ctx); \
>>       } \
>>   } while (0)
>
> As a matter of style, I strongly object to a *nested* macro returning 
> from the calling function.  These should all be changed to normal 
> functions of the form
>
>     if (!require_xyz(ctx) || !require_abc(ctx)) {
>         return something;
>     }
>
> etc.  insn_trans/trans_rvv.c.inc is much much cleaner in this respect.
>
> ====================================
>
> I believe his comment is also valid for this patch as well due to how
> REQUIRE_ZCD_OR_DC(ctx) and REQUIRE_ZCF_OR_FC(ctx) is implemented. Before
> re-sending this patch as is it's better to check with him now.

I think there is no nested macro in REQUIRE_ZCD_OR_DC(has_ext() is an 
inline function)

Regards,

Weiwei Li

>
> Richard, does this patch use the nested macro style you strongly object?
>
>
> Thanks,
>
>
> Daniel
>
>
>>   target/riscv/insn_trans/trans_rvd.c.inc | 12 +++++++-----
>>   target/riscv/insn_trans/trans_rvf.c.inc | 14 ++++++++------
>>   target/riscv/insn_trans/trans_rvi.c.inc |  5 +++--
>>   target/riscv/translate.c                |  5 +++--
>>   4 files changed, 21 insertions(+), 15 deletions(-)
>>
>> diff --git a/target/riscv/insn_trans/trans_rvd.c.inc 
>> b/target/riscv/insn_trans/trans_rvd.c.inc
>> index 2c51e01c40..f8d0ae48c7 100644
>> --- a/target/riscv/insn_trans/trans_rvd.c.inc
>> +++ b/target/riscv/insn_trans/trans_rvd.c.inc
>> @@ -31,9 +31,11 @@
>>       } \
>>   } while (0)
>>   -#define REQUIRE_ZCD(ctx) do { \
>> -    if (!ctx->cfg_ptr->ext_zcd) {  \
>> -        return false;     \
>> +#define REQUIRE_ZCD_OR_DC(ctx) do { \
>> +    if (!ctx->cfg_ptr->ext_zcd) { \
>> +        if(!has_ext(ctx, RVD) || !has_ext(ctx, RVC)) { \
>> +            return false; \
>> +        } \
>>       } \
>>   } while (0)
>>   @@ -67,13 +69,13 @@ static bool trans_fsd(DisasContext *ctx, 
>> arg_fsd *a)
>>     static bool trans_c_fld(DisasContext *ctx, arg_fld *a)
>>   {
>> -    REQUIRE_ZCD(ctx);
>> +    REQUIRE_ZCD_OR_DC(ctx);
>>       return trans_fld(ctx, a);
>>   }
>>     static bool trans_c_fsd(DisasContext *ctx, arg_fsd *a)
>>   {
>> -    REQUIRE_ZCD(ctx);
>> +    REQUIRE_ZCD_OR_DC(ctx);
>>       return trans_fsd(ctx, a);
>>   }
>>   diff --git a/target/riscv/insn_trans/trans_rvf.c.inc 
>> b/target/riscv/insn_trans/trans_rvf.c.inc
>> index 9e9fa2087a..58467eb409 100644
>> --- a/target/riscv/insn_trans/trans_rvf.c.inc
>> +++ b/target/riscv/insn_trans/trans_rvf.c.inc
>> @@ -30,10 +30,12 @@
>>       } \
>>   } while (0)
>>   -#define REQUIRE_ZCF(ctx) do {                  \
>> -    if (!ctx->cfg_ptr->ext_zcf) {              \
>> -        return false;                          \
>> -    }                                          \
>> +#define REQUIRE_ZCF_OR_FC(ctx) do {                    \
>> +    if (!ctx->cfg_ptr->ext_zcf) {                      \
>> +        if(!has_ext(ctx, RVF) || !has_ext(ctx, RVC)) { \
>> +            return false;                              \
>> +        }                                              \
>> +    }                                                  \
>>   } while (0)
>>     static bool trans_flw(DisasContext *ctx, arg_flw *a)
>> @@ -69,13 +71,13 @@ static bool trans_fsw(DisasContext *ctx, arg_fsw *a)
>>     static bool trans_c_flw(DisasContext *ctx, arg_flw *a)
>>   {
>> -    REQUIRE_ZCF(ctx);
>> +    REQUIRE_ZCF_OR_FC(ctx);
>>       return trans_flw(ctx, a);
>>   }
>>     static bool trans_c_fsw(DisasContext *ctx, arg_fsw *a)
>>   {
>> -    REQUIRE_ZCF(ctx);
>> +    REQUIRE_ZCF_OR_FC(ctx);
>>       return trans_fsw(ctx, a);
>>   }
>>   diff --git a/target/riscv/insn_trans/trans_rvi.c.inc 
>> b/target/riscv/insn_trans/trans_rvi.c.inc
>> index c70c495fc5..e33f63bea1 100644
>> --- a/target/riscv/insn_trans/trans_rvi.c.inc
>> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
>> @@ -56,7 +56,7 @@ static bool trans_jalr(DisasContext *ctx, arg_jalr *a)
>>       tcg_gen_andi_tl(cpu_pc, cpu_pc, (target_ulong)-2);
>>         gen_set_pc(ctx, cpu_pc);
>> -    if (!ctx->cfg_ptr->ext_zca) {
>> +    if (!has_ext(ctx, RVC) && !ctx->cfg_ptr->ext_zca) {
>>           TCGv t0 = tcg_temp_new();
>>             misaligned = gen_new_label();
>> @@ -169,7 +169,8 @@ static bool gen_branch(DisasContext *ctx, arg_b 
>> *a, TCGCond cond)
>>         gen_set_label(l); /* branch taken */
>>   -    if (!ctx->cfg_ptr->ext_zca && ((ctx->base.pc_next + a->imm) & 
>> 0x3)) {
>> +    if (!has_ext(ctx, RVC) && !ctx->cfg_ptr->ext_zca &&
>> +        ((ctx->base.pc_next + a->imm) & 0x3)) {
>>           /* misaligned */
>>           gen_exception_inst_addr_mis(ctx);
>>       } else {
>> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
>> index d0094922b6..661e29ab39 100644
>> --- a/target/riscv/translate.c
>> +++ b/target/riscv/translate.c
>> @@ -551,7 +551,7 @@ static void gen_jal(DisasContext *ctx, int rd, 
>> target_ulong imm)
>>         /* check misaligned: */
>>       next_pc = ctx->base.pc_next + imm;
>> -    if (!ctx->cfg_ptr->ext_zca) {
>> +    if (!has_ext(ctx, RVC) && !ctx->cfg_ptr->ext_zca) {
>>           if ((next_pc & 0x3) != 0) {
>>               gen_exception_inst_addr_mis(ctx);
>>               return;
>> @@ -1137,7 +1137,8 @@ static void decode_opc(CPURISCVState *env, 
>> DisasContext *ctx, uint16_t opcode)
>>            * The Zca extension is added as way to refer to 
>> instructions in the C
>>            * extension that do not include the floating-point loads 
>> and stores
>>            */
>> -        if (ctx->cfg_ptr->ext_zca && decode_insn16(ctx, opcode)) {
>> +        if ((has_ext(ctx, RVC) || ctx->cfg_ptr->ext_zca) &&
>> +            decode_insn16(ctx, opcode)) {
>>               return;
>>           }
>>       } else {


