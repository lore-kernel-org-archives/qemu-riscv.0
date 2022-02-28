Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nOWa2-0006lD-41
	for mharc-qemu-riscv@gnu.org; Sun, 27 Feb 2022 22:20:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nOWZz-0006hy-GQ; Sun, 27 Feb 2022 22:20:07 -0500
Received: from smtp84.cstnet.cn ([159.226.251.84]:39762 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nOWZx-0003ok-1u; Sun, 27 Feb 2022 22:20:07 -0500
Received: from [192.168.0.104] (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowACXePFdPxxi+eq5AQ--.40922S2;
 Mon, 28 Feb 2022 11:19:58 +0800 (CST)
Subject: Re: [PATCH v6 11/14] target/riscv: rvk: add support for zksed/zksh
 extension
To: Richard Henderson <richard.henderson@linaro.org>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, lustrew@foxmail.com,
 luruibo2000@163.com
References: <20220227142553.25815-1-liweiwei@iscas.ac.cn>
 <20220227142553.25815-12-liweiwei@iscas.ac.cn>
 <7ee13327-b442-fca8-5618-6a32492ea027@linaro.org>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <19180bcb-8a0d-285c-9cdc-4b8937f21d65@iscas.ac.cn>
Date: Mon, 28 Feb 2022 11:19:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <7ee13327-b442-fca8-5618-6a32492ea027@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: zQCowACXePFdPxxi+eq5AQ--.40922S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCry8CrWUuryrur1rur1rJFb_yoW5uFWUpr
 n5GrWUJFWUXF93Jw13uF4UX3sxAr1xGw1jga1Iqa4UAa1DAryI9r4j9wsI9r1UAF4rWr1Y
 k3WDurnrur47XFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBq14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F
 4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
 7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
 1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
 n2kIc2xKxwCYjI0SjxkI62AI1cAE67vIY487MxkF7I0Ew4C26cxK6c8Ij28IcwCF04k20x
 vY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I
 3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIx
 AIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF
 0xvE42xK8VAvwI8IcIk0rVW3JVWrJr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z2
 80aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjr-BtUUUUU==
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
X-List-Received-Date: Mon, 28 Feb 2022 03:20:08 -0000


在 2022/2/28 上午3:41, Richard Henderson 写道:
> On 2/27/22 04:25, Weiwei Li wrote:
>>   - add sm3p0, sm3p1, sm4ed and sm4ks instructions
>>
>> Co-authored-by: Ruibo Lu <luruibo2000@163.com>
>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
>> ---
>>   target/riscv/crypto_helper.c            | 49 +++++++++++++++++
>>   target/riscv/helper.h                   |  6 +++
>>   target/riscv/insn32.decode              |  6 +++
>>   target/riscv/insn_trans/trans_rvk.c.inc | 72 +++++++++++++++++++++++++
>>   4 files changed, 133 insertions(+)
>>
>> diff --git a/target/riscv/crypto_helper.c b/target/riscv/crypto_helper.c
>> index fd50a034a3..d712854a9c 100644
>> --- a/target/riscv/crypto_helper.c
>> +++ b/target/riscv/crypto_helper.c
>> @@ -391,4 +391,53 @@ target_ulong HELPER(sha512sum1)(target_ulong rs1)
>>       return ROR64(a, 14) ^ ROR64(a, 18) ^ ROR64(a, 41);
>>   }
>>   #undef ROR64
>> +
>> +#define ROL32(a, amt) ((a >> (-amt & 31)) | (a << (amt & 31)))
>> +
>> +target_ulong HELPER(sm3p0)(target_ulong rs1)
>> +{
>> +    uint32_t src = rs1;
>> +    uint32_t result = src ^ ROL32(src, 9) ^ ROL32(src, 17);
>> +
>> +    return sext_xlen(result);
>> +}
>> +
>> +target_ulong HELPER(sm3p1)(target_ulong rs1)
>> +{
>> +    uint32_t src = rs1;
>> +    uint32_t result = src ^ ROL32(src, 15) ^ ROL32(src, 23);
>> +
>> +    return sext_xlen(result);
>> +}
>> +#undef ROL32
>> +
>
> Same comments as before, with the sticker being that you've defined 
> ROL32 twice.
>
>> +target_ulong HELPER(sm4ed)(target_ulong rs2, target_ulong rt, 
>> target_ulong bs)
>> +{
>> +    uint8_t bs_t = bs;
>
> Why the intermediate?  And again, perhaps better to pass in shamt.
>
>> +
>> +    uint32_t sb_in = (uint8_t)(rs2 >> (8 * bs_t));
>> +    uint32_t sb_out = (uint32_t)sm4_sbox[sb_in];
>> +
>> +    uint32_t linear = sb_out ^ (sb_out << 8) ^ (sb_out << 2) ^ 
>> (sb_out << 18) ^
>> +        ((sb_out & 0x3f) << 26) ^ ((sb_out & 0xC0) << 10);
>> +
>> +    uint32_t rotl = (linear << (8 * bs_t)) | (linear >> (32 - 8 * 
>> bs_t));
>
> Again, broken rotate expression.
>
>> +target_ulong HELPER(sm4ks)(target_ulong rs2, target_ulong rs1, 
>> target_ulong bs)
>
> Same.
>
>> +static bool trans_sm3p0(DisasContext *ctx, arg_sm3p0 *a)
>> +{
>> +    REQUIRE_ZKSH(ctx);
>> +
>> +    TCGv dest = dest_gpr(ctx, a->rd);
>> +    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
>> +
>> +    gen_helper_sm3p0(dest, src1);
>> +    gen_set_gpr(ctx, a->rd, dest);
>> +
>> +    return true;
>> +}
>
> gen_unary, etc.
>
>> +static bool trans_sm4ks(DisasContext *ctx, arg_sm4ks *a)
>> +{
>> +    REQUIRE_ZKSED(ctx);
>> +
>> +    TCGv bs = tcg_const_tl(a->bs);
>> +    TCGv dest = dest_gpr(ctx, a->rd);
>> +    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
>> +    TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
>> +
>> +    gen_helper_sm4ks(dest, src2, src1, bs);
>> +    gen_set_gpr(ctx, a->rd, dest);
>> +
>> +    tcg_temp_free(bs);
>> +    return true;
>> +}
>
> Reuse that helper you created for aes32esmi et al back in patch 6.


OK. I'll try to fix them.

Thanks a lot.

Regards,

Weiwei Li

>
>
> r~


