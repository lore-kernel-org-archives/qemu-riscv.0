Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nOWXx-0004Na-KC
	for mharc-qemu-riscv@gnu.org; Sun, 27 Feb 2022 22:18:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nOWXv-0004M9-Vp; Sun, 27 Feb 2022 22:18:00 -0500
Received: from smtp84.cstnet.cn ([159.226.251.84]:38956 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nOWXt-0000iY-UK; Sun, 27 Feb 2022 22:17:59 -0500
Received: from [192.168.0.104] (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowAAX+PDdPhxiFuK5AQ--.25345S2;
 Mon, 28 Feb 2022 11:17:51 +0800 (CST)
Subject: Re: [PATCH v6 09/14] target/riscv: rvk: add support for sha512
 related instructions for RV32 in zknh extension
To: Richard Henderson <richard.henderson@linaro.org>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, lustrew@foxmail.com,
 luruibo2000@163.com
References: <20220227142553.25815-1-liweiwei@iscas.ac.cn>
 <20220227142553.25815-10-liweiwei@iscas.ac.cn>
 <4afce030-a071-c653-9ad4-78d2f2ec1eb5@linaro.org>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <a6d45038-616f-6d91-a624-b6452ce0bab9@iscas.ac.cn>
Date: Mon, 28 Feb 2022 11:17:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <4afce030-a071-c653-9ad4-78d2f2ec1eb5@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: zQCowAAX+PDdPhxiFuK5AQ--.25345S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZFy7Jw4fXry3Ww48tF18Xwb_yoW5Ww43pF
 n5GrWrtFWUJFZ3Aa1fJw4UXry3AF48tw45JrZ7t3WUAay7JrWFqrW7Xr1agr1UJF4xKF1j
 kr1Dur17ur48XrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBv14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
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
 cVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
 A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUx73kUUUUU=
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
X-List-Received-Date: Mon, 28 Feb 2022 03:18:00 -0000


在 2022/2/28 上午3:36, Richard Henderson 写道:
> On 2/27/22 04:25, Weiwei Li wrote:
>>   - add sha512sum0r, sha512sig0l, sha512sum1r, sha512sig1l, 
>> sha512sig0h and sha512sig1h instructions
>>
>> Co-authored-by: Zewen Ye <lustrew@foxmail.com>
>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
>> ---
>>   target/riscv/crypto_helper.c            | 57 ++++++++++++++++
>>   target/riscv/helper.h                   |  7 ++
>>   target/riscv/insn32.decode              |  6 ++
>>   target/riscv/insn_trans/trans_rvk.c.inc | 90 +++++++++++++++++++++++++
>>   4 files changed, 160 insertions(+)
>>
>> diff --git a/target/riscv/crypto_helper.c b/target/riscv/crypto_helper.c
>> index f5ffc262f2..6cd2a92b86 100644
>> --- a/target/riscv/crypto_helper.c
>> +++ b/target/riscv/crypto_helper.c
>> @@ -303,4 +303,61 @@ target_ulong HELPER(sha256sum1)(target_ulong rs1)
>>       return sext_xlen(ROR32(a, 6) ^ ROR32(a, 11) ^ ROR32(a, 25));
>>   }
>>   #undef ROR32
>> +
>> +#define zext32(x) ((uint64_t)(uint32_t)(x))
>> +
>> +target_ulong HELPER(sha512sum0r)(target_ulong rs1, target_ulong rs2)
>> +{
>> +    uint64_t result = (zext32(rs1) << 25) ^ (zext32(rs1) << 30) ^
>> +                      (zext32(rs1) >> 28) ^ (zext32(rs2) >> 7) ^
>> +                      (zext32(rs2) >> 2) ^ (zext32(rs2) << 4);
>> +
>> +    return sext_xlen(result);
>> +}
>
> I'm a little confused as to why you're extending back to uint64_t?  
> Especially since the top 32 are discarded.
>
> Also, I think sext_xlen is a bad name -- sext32_xlen would be better.  
> It confused me here for a bit, and I went off on a bit of an 
> irrelevant tangent.
>
> These could also be implemented inline.  I count 12 instructions. The 
> overhead of a function call is about 7.
Yeah. It's not necessary to extend to uint64_t.  I'll try to change them 
to inline later.
>
>> +DEF_HELPER_2(sha512sum0r, tl, tl, tl)
>> +DEF_HELPER_2(sha512sum1r, tl, tl, tl)
>> +DEF_HELPER_2(sha512sig0l, tl, tl, tl)
>> +DEF_HELPER_2(sha512sig0h, tl, tl, tl)
>> +DEF_HELPER_2(sha512sig1l, tl, tl, tl)
>> +DEF_HELPER_2(sha512sig1h, tl, tl, tl)
>
> DEF_HELPER_FLAGS.
>
>> +static bool trans_sha512sum0r(DisasContext *ctx, arg_sha512sum0r *a)
>> +{
>> +    REQUIRE_32BIT(ctx);
>> +    REQUIRE_ZKNH(ctx);
>> +
>> +    TCGv dest = dest_gpr(ctx, a->rd);
>> +    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
>> +    TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
>> +
>> +    gen_helper_sha512sum0r(dest, src1, src2);
>> +    gen_set_gpr(ctx, a->rd, dest);
>> +
>> +    return true;
>> +}
>
> gen_arith.
>
OK. I'll fix them.

Regards,

Weiwei Li

>
> r~


