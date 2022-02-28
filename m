Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nOWQe-0000Zr-HI
	for mharc-qemu-riscv@gnu.org; Sun, 27 Feb 2022 22:10:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nOWQa-0000ZL-TL; Sun, 27 Feb 2022 22:10:24 -0500
Received: from smtp84.cstnet.cn ([159.226.251.84]:36274 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nOWQY-00086H-Ri; Sun, 27 Feb 2022 22:10:24 -0500
Received: from [192.168.0.104] (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowAA3PkIXPRxiS8K5AQ--.34623S2;
 Mon, 28 Feb 2022 11:10:16 +0800 (CST)
Subject: Re: [PATCH v6 07/14] target/riscv: rvk: add support for zkne/zknd
 extension in RV64
To: Richard Henderson <richard.henderson@linaro.org>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, lustrew@foxmail.com,
 luruibo2000@163.com
References: <20220227142553.25815-1-liweiwei@iscas.ac.cn>
 <20220227142553.25815-8-liweiwei@iscas.ac.cn>
 <7dcdb5fc-b440-e3f8-36d0-774865b7bf01@linaro.org>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <9eebb465-1359-40c5-3ffe-dcd2f866ac74@iscas.ac.cn>
Date: Mon, 28 Feb 2022 11:10:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <7dcdb5fc-b440-e3f8-36d0-774865b7bf01@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: zQCowAA3PkIXPRxiS8K5AQ--.34623S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAryUXr18Aw4xCrW7Ar4fKrg_yoWrKrWUpr
 n5JFW7JFWUJF93tF4xXw4UZa43Ar1xJ3WUJw4Sq3WjkanrArs2gr1UWrnIgr15Aa18Wr1Y
 y3W5urnrur47XFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBS14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F
 4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
 7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
 1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
 n2kIc2xKxwCYjI0SjxkI62AI1cAE67vIY487MxkF7I0Ew4C26cxK6c8Ij28IcwCF04k20x
 vY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I
 3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIx
 AIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAI
 cVCF04k26cxKx2IYs7xG6Fyj6rWUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87
 Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU08nYUUUUU
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
X-List-Received-Date: Mon, 28 Feb 2022 03:10:25 -0000


在 2022/2/28 上午3:13, Richard Henderson 写道:
> On 2/27/22 04:25, Weiwei Li wrote:
>>   - add aes64dsm, aes64ds, aes64im, aes64es, aes64esm, aes64ks2, 
>> aes64ks1i instructions
>>
>> Co-authored-by: Ruibo Lu <luruibo2000@163.com>
>> Co-authored-by: Zewen Ye <lustrew@foxmail.com>
>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
>> ---
>>   target/riscv/crypto_helper.c            | 136 ++++++++++++++++++++++++
>>   target/riscv/helper.h                   |   8 ++
>>   target/riscv/insn32.decode              |  11 ++
>>   target/riscv/insn_trans/trans_rvk.c.inc | 102 ++++++++++++++++++
>>   4 files changed, 257 insertions(+)
>>
>> diff --git a/target/riscv/crypto_helper.c b/target/riscv/crypto_helper.c
>> index f5a5909538..9e56668627 100644
>> --- a/target/riscv/crypto_helper.c
>> +++ b/target/riscv/crypto_helper.c
>> @@ -136,4 +136,140 @@ target_ulong HELPER(aes32dsi)(target_ulong rs1, 
>> target_ulong rs2,
>>   {
>>       return aes32_operation(bs, rs1, rs2, false, false);
>>   }
>> +
>> +static inline target_ulong aes64_operation(target_ulong rs1, 
>> target_ulong rs2,
>> +                                           bool enc, bool mix)
>> +{
>> +    uint64_t RS1 = rs1;
>> +    uint64_t RS2 = rs2;
>> +    uint64_t result;
>> +    uint64_t temp;
>> +    uint32_t col_0;
>> +    uint32_t col_1;
>> +
>> +    if (enc) {
>> +        temp = AES_SHIFROWS_LO(RS1, RS2);
>
> Ah, those unused macros get used, and with the right type.
>
>> +target_ulong HELPER(aes64ks1i)(target_ulong rs1, target_ulong rnum)
>> +{
>> +    uint64_t RS1 = rs1;
>> +    uint8_t round_consts[10] = {
>> +        0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80, 0x1b, 0x36
>> +    };
>
> static const.
>
>> +        temp = (temp >> 8) | (temp << 24); /* Rotate right by 8 */
>
> rol32
>
>> +DEF_HELPER_2(aes64esm, tl, tl, tl)
>> +DEF_HELPER_2(aes64es, tl, tl, tl)
>> +DEF_HELPER_2(aes64ds, tl, tl, tl)
>> +DEF_HELPER_2(aes64dsm, tl, tl, tl)
>> +DEF_HELPER_2(aes64ks2, tl, tl, tl)
>> +DEF_HELPER_2(aes64ks1i, tl, tl, tl)
>> +DEF_HELPER_1(aes64im, tl, tl)
>
> DEF_HELPER_FLAGS.
>
>> +%rnum      20:4
> ...
>> +aes64ks1i   00 11000 1.... ..... 001 ..... 0010011 %rnum %rs1 %rd
>
> It is much better to put the field where it belongs,
> especially for a one-off like this.
>
> aes64ks1i   00 11000 1 rnum:4 rs1:5 001 rd:5 0010011
>
> The whole of riscv needs a cleanup on this point.
>
>
>> +static bool trans_aes64esm(DisasContext *ctx, arg_aes64esm *a)
>> +{
>> +    REQUIRE_ZKNE(ctx);
>> +
>> +    TCGv dest = dest_gpr(ctx, a->rd);
>> +    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
>> +    TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
>> +
>> +    gen_helper_aes64esm(dest, src1, src2);
>> +    gen_set_gpr(ctx, a->rd, dest);
>> +
>> +    return true;
>> +}
> ...
>> +static bool trans_aes64es(DisasContext *ctx, arg_aes64es *a)
>> +{
>> +    REQUIRE_ZKNE(ctx);
>> +
>> +    TCGv dest = dest_gpr(ctx, a->rd);
>> +    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
>> +    TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
>> +
>> +    gen_helper_aes64es(dest, src1, src2);
>> +    gen_set_gpr(ctx, a->rd, dest);
>> +
>> +    return true;
>> +}
>
> gen_arith.
>
>> +static bool trans_aes64dsm(DisasContext *ctx, arg_aes64dsm *a)
>> +static bool trans_aes64ks2(DisasContext *ctx, arg_aes64ks2 *a)
>> +static bool trans_aes64ds(DisasContext *ctx, arg_aes64ds *a)
>
> Likewise.
>
>> +static bool trans_aes64ks1i(DisasContext *ctx, arg_aes64ks1i *a)
>> +{
>> +    REQUIRE_EITHER_EXT(ctx, zknd, zkne);
>> +
>> +    if (a->rnum > 0xA) {
>> +        return false;
>> +    }
>> +
>> +    TCGv rnum = tcg_const_tl(a->rnum);
>> +    TCGv dest = dest_gpr(ctx, a->rd);
>> +    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
>> +
>> +    gen_helper_aes64ks1i(dest, src1, rnum);
>> +    gen_set_gpr(ctx, a->rd, dest);
>> +
>> +    tcg_temp_free(rnum);
>> +    return true;
>> +}
>
> tcg_constant_tl.
>
>> +
>> +static bool trans_aes64im(DisasContext *ctx, arg_aes64im *a)
>> +{
>> +    REQUIRE_ZKND(ctx);
>> +
>> +    TCGv dest = dest_gpr(ctx, a->rd);
>> +    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
>> +
>> +    gen_helper_aes64im(dest, src1);
>> +    gen_set_gpr(ctx, a->rd, dest);
>> +
>> +    return true;
>> +}
>
> gen_unary.
>
OK. I'll fix them. Thanks a lot.

Regards,

Weiwei Li

>
> r~


