Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mi4Zk-0001eO-GT
	for mharc-qemu-riscv@gnu.org; Tue, 02 Nov 2021 20:56:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1mi4Zi-0001dr-Ky; Tue, 02 Nov 2021 20:56:22 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25]:52714 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1mi4Zb-0007uO-Sc; Tue, 02 Nov 2021 20:56:18 -0400
Received: from [192.168.0.103] (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowACnrqoj3oFhmYAnBg--.40289S2;
 Wed, 03 Nov 2021 08:56:04 +0800 (CST)
Subject: Re: [RFC 2/6] target/riscv: rvk: add implementation of instructions
 for Zbk* - reuse partial instructions of Zbb/Zbc extensions - add brev8
 packh, unzip, zip, etc.
To: Richard Henderson <richard.henderson@linaro.org>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, lustrew@foxmail.com,
 luruibo2000@163.com
References: <20211102031128.17296-1-liweiwei@iscas.ac.cn>
 <20211102031128.17296-3-liweiwei@iscas.ac.cn>
 <5523b929-316e-a119-af1a-2a4aba4ee86d@linaro.org>
From: liweiwei <liweiwei@iscas.ac.cn>
Message-ID: <1be2c279-2d6b-1acb-c216-a598f02d43e1@iscas.ac.cn>
Date: Wed, 3 Nov 2021 08:56:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <5523b929-316e-a119-af1a-2a4aba4ee86d@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: zQCowACnrqoj3oFhmYAnBg--.40289S2
X-Coremail-Antispam: 1UD129KBjvJXoW3WF1rtry5Ww1UCr1xAr4xZwb_yoW7uFy8pF
 1kJrWUXFWUJr95Jr1UCr4UZFy7Ar18J3WDJryFq3Wjya17Ar10gr1Y9wsIgr1UArs5Xr45
 Ar1UurnrZr47Xa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBa14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8JV
 W8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
 0xkIwI1lc7I2V7IY0VAS07AlzVAYIcxG8wCY1x0264kExVAvwVAq07x20xyl42xK82IYc2
 Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
 6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
 vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
 42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2js
 IEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JU2fOwUUUUU=
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.549,
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
X-List-Received-Date: Wed, 03 Nov 2021 00:56:23 -0000

Thanks for your suggestions.

在 2021/11/2 下午11:44, Richard Henderson 写道:
> On 11/1/21 11:11 PM, liweiwei wrote:
>> Signed-off-by: liweiwei <liweiwei@iscas.ac.cn>
>> Signed-off-by: wangjunqiang <wangjunqiang@iscas.ac.cn>
>
> You managed to get the whole patch description into the subject line.
> Please break it up.
>
OK.
>> +target_ulong HELPER(grev)(target_ulong rs1, target_ulong rs2)
>> +{
>> +    return do_grev(rs1, rs2, TARGET_LONG_BITS);
>> +}
>
> Are we expecting to see the full grev instruction at any point? If 
> not, we can certainly implement Zbk with a simpler implementation.
The main idea that I add this helper is that  grev may be added to 
B-extension later and it can be reused. However, it have no effect 
currently.  I'll replace this with a simpler implementation.
>
>> +target_ulong HELPER(xperm)(target_ulong rs1, target_ulong rs2, 
>> uint32_t sz_log2)
>> +{
>> +    target_ulong r = 0;
>> +    target_ulong sz = 1LL << sz_log2;
>> +    target_ulong mask = (1LL << sz) - 1;
>> +    for (int i = 0; i < TARGET_LONG_BITS; i += sz) {
>> +        target_ulong pos = ((rs2 >> i) & mask) << sz_log2;
>> +        if (pos < sizeof(target_ulong) * 8) {
>> +            r |= ((rs1 >> pos) & mask) << i;
>> +        }
>> +    }
>> +    return r;
>> +}
>
> This could become a static inline do_xperm, and provide two specific 
> xperm4 and xperm8 helpers; the compiler would fold all of the sz_log2 
> stuff into a more efficient implementation.
OK.
>
>> +target_ulong HELPER(unshfl)(target_ulong rs1,
>> +                            target_ulong rs2)
>> +{
>> +    target_ulong x = rs1;
>> +    int i, shift;
>> +    int bits = TARGET_LONG_BITS >> 1;
>> +    for (i = 0, shift = 1; shift < bits; i++, shift <<= 1) {
>> +        if (rs2 & shift) {
>> +            x = do_shuf_stage(x, shuf_masks[i], shuf_masks[i] >> 
>> shift, shift);
>> +        }
>> +    }
>> +    return x;
>> +}
>> +
>> +target_ulong HELPER(shfl)(target_ulong rs1,
>> +                          target_ulong rs2)
>> +{
>> +    target_ulong x = rs1;
>> +    int i, shift;
>> +    shift = TARGET_LONG_BITS >> 2;
>> +    i = (shift == 8) ? 3 : 4;
>> +    for (; i >= 0; i--, shift >>= 1) {
>> +        if (rs2 & shift) {
>> +            x = do_shuf_stage(x, shuf_masks[i], shuf_masks[i] >> 
>> shift, shift);
>> +        }
>> +    }
>> +    return x;
>> +}
>
> Similar comment as for grev.
>
>> +# The encoding for zext.h differs between RV32 and RV64.
>> +# zext_h_32 denotes the RV32 variant.
>> +{
>> +  zext_h_32  0000100 00000 ..... 100 ..... 0110011 @r2
>> +  pack       0000100 ..... ..... 100 ..... 0110011 @r
>> +}
>
> Note to self: improve tcg_gen_deposit to notice zeros, so that the 
> more general pack compiles to zero-extension.
>
>> @@ -556,6 +563,81 @@ static bool gen_unary_per_ol(DisasContext *ctx, 
>> arg_r2 *a, DisasExtend ext,
>>       return gen_unary(ctx, a, ext, f_tl);
>>   }
>>   +static bool gen_xperm(DisasContext *ctx, arg_r *a, int32_t size)
>> +{
>> +    TCGv dest = dest_gpr(ctx, a->rd);
>> +    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
>> +    TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
>> +
>> +    TCGv_i32 sz = tcg_const_i32(size);
>> +    gen_helper_xperm(dest, src1, src2, sz);
>> +
>> +    gen_set_gpr(ctx, a->rd, dest);
>> +    tcg_temp_free_i32(sz);
>> +    return true;
>> +}
>> +
>> +static bool gen_grevi(DisasContext *ctx, arg_r2 *a, int shamt)
>> +{
>> +    TCGv dest = dest_gpr(ctx, a->rd);
>> +    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
>> +
>> +    if (shamt == (TARGET_LONG_BITS - 8)) {
>> +        /* rev8, byte swaps */
>> +        tcg_gen_bswap_tl(dest, src1);
>> +    } else {
>> +        TCGv src2 = tcg_temp_new();
>> +        tcg_gen_movi_tl(src2, shamt);
>> +        gen_helper_grev(dest, src1, src2);
>> +        tcg_temp_free(src2);
>> +    }
>> +
>> +    gen_set_gpr(ctx, a->rd, dest);
>> +    return true;
>> +}
>> +
>> +static void gen_pack(TCGv ret, TCGv src1, TCGv src2)
>> +{
>> +    tcg_gen_deposit_tl(ret, src1, src2,
>> +                       TARGET_LONG_BITS / 2,
>> +                       TARGET_LONG_BITS / 2);
>> +}
>> +
>> +static void gen_packh(TCGv ret, TCGv src1, TCGv src2)
>> +{
>> +    TCGv t = tcg_temp_new();
>> +    tcg_gen_ext8u_tl(t, src2);
>> +    tcg_gen_deposit_tl(ret, src1, t, 8, TARGET_LONG_BITS - 8);
>> +    tcg_temp_free(t);
>> +}
>> +
>> +static void gen_packw(TCGv ret, TCGv src1, TCGv src2)
>> +{
>> +    TCGv t = tcg_temp_new();
>> +    tcg_gen_ext16s_tl(t, src2);
>> +    tcg_gen_deposit_tl(ret, src1, t, 16, 48);
>> +    tcg_temp_free(t);
>> +}
>> +
>> +static bool gen_shufi(DisasContext *ctx, arg_r2 *a, int shamt,
>> +                       void(*func)(TCGv, TCGv, TCGv))
>> +{
>> +    if (shamt >= TARGET_LONG_BITS / 2) {
>> +        return false;
>> +    }
>> +
>> +    TCGv dest = dest_gpr(ctx, a->rd);
>> +    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
>> +    TCGv src2 = tcg_temp_new();
>> +
>> +    tcg_gen_movi_tl(src2, shamt);
>> +    (*func)(dest, src1, src2);
>> +
>> +    gen_set_gpr(ctx, a->rd, dest);
>> +    tcg_temp_free(src2);
>> +    return true;
>> +}
>
> All of the gen functions belong in insn_trans/trans_rvb.c.inc.
OK. I'll move them to insn_trans/trans_rvb.c.inc.
>
>
> r~


