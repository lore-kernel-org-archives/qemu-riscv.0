Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nOWSB-0002GL-FL
	for mharc-qemu-riscv@gnu.org; Sun, 27 Feb 2022 22:12:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nOWS9-0002G3-QL; Sun, 27 Feb 2022 22:12:01 -0500
Received: from smtp84.cstnet.cn ([159.226.251.84]:36748 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nOWS7-0008Kf-H2; Sun, 27 Feb 2022 22:12:01 -0500
Received: from [192.168.0.104] (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowAD3_kJ6PRxiucm5AQ--.33748S2;
 Mon, 28 Feb 2022 11:11:55 +0800 (CST)
Subject: Re: [PATCH v6 08/14] target/riscv: rvk: add support for sha256
 related instructions in zknh extension
To: Richard Henderson <richard.henderson@linaro.org>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, lustrew@foxmail.com,
 luruibo2000@163.com
References: <20220227142553.25815-1-liweiwei@iscas.ac.cn>
 <20220227142553.25815-9-liweiwei@iscas.ac.cn>
 <91b397ee-7b68-653c-8b73-4b0a91b057e0@linaro.org>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <c59c7852-46d0-9750-0b31-c024f8393015@iscas.ac.cn>
Date: Mon, 28 Feb 2022 11:11:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <91b397ee-7b68-653c-8b73-4b0a91b057e0@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: zQCowAD3_kJ6PRxiucm5AQ--.33748S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCr13AFWfuFy5Gr1UXF47urg_yoW5XrWfpF
 1kGrWrJrWUXrZ3t3W3Ka1UXr9xAr1xCw1jyws7ta43J3yUArsa9r17ZwsIgr1UAF4fur1Y
 kFyq9r1a9F4DXFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBq14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxV
 WxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
 Yx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbV
 WUJVW8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
 Y2ka0xkIwI1lc7I2V7IY0VAS07AlzVAYIcxG8wCY1x0264kExVAvwVAq07x20xyl42xK82
 IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC2
 0s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMI
 IF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF
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
X-List-Received-Date: Mon, 28 Feb 2022 03:12:02 -0000


在 2022/2/28 上午3:21, Richard Henderson 写道:
> On 2/27/22 04:25, Weiwei Li wrote:
>>   - add sha256sig0, sha256sig1, sha256sum0 and sha256sum1 instructions
>>
>> Co-authored-by: Zewen Ye <lustrew@foxmail.com>
>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
>> ---
>>   target/riscv/crypto_helper.c            | 31 +++++++++++++
>>   target/riscv/helper.h                   |  5 +++
>>   target/riscv/insn32.decode              |  5 +++
>>   target/riscv/insn_trans/trans_rvk.c.inc | 58 +++++++++++++++++++++++++
>>   4 files changed, 99 insertions(+)
>>
>> diff --git a/target/riscv/crypto_helper.c b/target/riscv/crypto_helper.c
>> index 9e56668627..f5ffc262f2 100644
>> --- a/target/riscv/crypto_helper.c
>> +++ b/target/riscv/crypto_helper.c
>> @@ -272,4 +272,35 @@ target_ulong HELPER(aes64im)(target_ulong rs1)
>>         return result;
>>   }
>> +
>> +#define ROR32(a, amt) ((a << (-amt & 31)) | (a >> (amt & 31)))
>
> We already have a ror32 function.  However...
OK. I'll change to use it.
>
>> +target_ulong HELPER(sha256sig0)(target_ulong rs1)
>> +{
>> +    uint32_t a = rs1;
>> +
>> +    return sext_xlen(ROR32(a, 7) ^ ROR32(a, 18) ^ (a >> 3));
>> +}
>> +
>> +target_ulong HELPER(sha256sig1)(target_ulong rs1)
>> +{
>> +    uint32_t a = rs1;
>> +
>> +    return sext_xlen(ROR32(a, 17) ^ ROR32(a, 19) ^ (a >> 10));
>> +}
>> +
>> +target_ulong HELPER(sha256sum0)(target_ulong rs1)
>> +{
>> +    uint32_t a = rs1;
>> +
>> +    return sext_xlen(ROR32(a, 2) ^ ROR32(a, 13) ^ ROR32(a, 22));
>> +}
>> +
>> +target_ulong HELPER(sha256sum1)(target_ulong rs1)
>> +{
>> +    uint32_t a = rs1;
>> +
>> +    return sext_xlen(ROR32(a, 6) ^ ROR32(a, 11) ^ ROR32(a, 25));
>> +}
>
> All of these functions are quite small, and could easily be generated 
> inline.
>
>     tcg_gen_trunc_tl_i32(a, reg);
>     tcg_gen_rotri_i32(t1, a, 7);
>     tcg_gen_rotri_i32(t2, a, 18);
>     tcg_gen_xor_i32(t1, t1, t2);
>     tcg_gen_shri_i32(t2, a, 3);
>     tcg_gen_xor_i32(t1, t1, t2);
>     tcg_gen_ext_i32_tl(reg, t1);
OK. I'll change to this.
>
>> +static bool trans_sha256sig0(DisasContext *ctx, arg_sha256sig0 *a)
>> +{
>> +    REQUIRE_ZKNH(ctx);
>> +
>> +    TCGv dest = dest_gpr(ctx, a->rd);
>> +    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
>> +
>> +    gen_helper_sha256sig0(dest, src1);
>> +    gen_set_gpr(ctx, a->rd, dest);
>> +
>> +    return true;
>> +}
>
> gen_unary, etc.

OK. I'll fix it.

Regards,

Weiwei Li

>
>
> r~


