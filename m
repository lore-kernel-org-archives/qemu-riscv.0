Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nOWOW-0007P7-Tg
	for mharc-qemu-riscv@gnu.org; Sun, 27 Feb 2022 22:08:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nOWOV-0007Oe-0L; Sun, 27 Feb 2022 22:08:15 -0500
Received: from smtp84.cstnet.cn ([159.226.251.84]:35448 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nOWOS-0007hV-Ed; Sun, 27 Feb 2022 22:08:14 -0500
Received: from [192.168.0.104] (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowACnh_CSPBxi2ri5AQ--.34173S2;
 Mon, 28 Feb 2022 11:08:03 +0800 (CST)
Subject: Re: [PATCH v6 06/14] target/riscv: rvk: add support for zknd/zkne
 extension in RV32
To: Richard Henderson <richard.henderson@linaro.org>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, lustrew@foxmail.com,
 luruibo2000@163.com
References: <20220227142553.25815-1-liweiwei@iscas.ac.cn>
 <20220227142553.25815-7-liweiwei@iscas.ac.cn>
 <71666709-7115-81ec-2db0-bd0db525796b@linaro.org>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <27c8b2c3-33f0-8e6f-f651-b3121dffe42b@iscas.ac.cn>
Date: Mon, 28 Feb 2022 11:08:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <71666709-7115-81ec-2db0-bd0db525796b@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: zQCowACnh_CSPBxi2ri5AQ--.34173S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WFy5ZFWfWr4fur4Dur1fXrb_yoW5Jr48pr
 1kJr4DtFyUXFySgr1DAw1UXr97Zw17t3WDuFyrWF15GFsFvr4Igr15uwsI9r1kXrs7Jr15
 Ars8ZrnxZw17JFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
X-List-Received-Date: Mon, 28 Feb 2022 03:08:15 -0000


在 2022/2/28 上午3:05, Richard Henderson 写道:
> On 2/27/22 04:25, Weiwei Li wrote:
>> +#define AES_SHIFROWS_LO(RS1, RS2) ( \
>> +    (((RS1 >> 24) & 0xFF) << 56) | (((RS2 >> 48) & 0xFF) << 48) | \
>> +    (((RS2 >> 8) & 0xFF) << 40) | (((RS1 >> 32) & 0xFF) << 32) | \
>> +    (((RS2 >> 56) & 0xFF) << 24) | (((RS2 >> 16) & 0xFF) << 16) | \
>> +    (((RS1 >> 40) & 0xFF) << 8) | (((RS1 >> 0) & 0xFF) << 0))
>> +
>> +#define AES_INVSHIFROWS_LO(RS1, RS2) ( \
>> +    (((RS2 >> 24) & 0xFF) << 56) | (((RS2 >> 48) & 0xFF) << 48) | \
>> +    (((RS1 >> 8) & 0xFF) << 40) | (((RS1 >> 32) & 0xFF) << 32) | \
>> +    (((RS1 >> 56) & 0xFF) << 24) | (((RS2 >> 16) & 0xFF) << 16) | \
>> +    (((RS2 >> 40) & 0xFF) << 8) | (((RS1 >> 0) & 0xFF) << 0))
>
> Unused.  Whcih is good, because it shifts an unknown type by 56.
It's used by aes64 operation. I'll move them to next patch.
>
>
>> +DEF_HELPER_3(aes32esmi, tl, tl, tl, tl)
>> +DEF_HELPER_3(aes32esi, tl, tl, tl, tl)
>> +DEF_HELPER_3(aes32dsmi, tl, tl, tl, tl)
>> +DEF_HELPER_3(aes32dsi, tl, tl, tl, tl)
>
> DEF_HELPER_FLAGS_3, with TCG_CALL_NO_RWG_SE.
OK. I'll fix it.
>
>> +static inline target_ulong aes32_operation(target_ulong bs, 
>> target_ulong rs1,
>> +                                           target_ulong rs2, bool enc,
>> +                                           bool mix)
>> +{
>> +    uint8_t shamt = bs << 3;
>
> Just thinking it would be better to pass in shamt, since bs is 
> otherwise unused.
OK. I'll fix it.
>
>> +    mixed = (mixed << shamt) | (mixed >> (32 - shamt));
>
> This is broken for shamt == 0.  This is intending a rol32(), I assume?
OK. I'll fix it.
>
>
>> +static bool trans_aes32esmi(DisasContext *ctx, arg_aes32esmi *a)
>> +{
>> +    REQUIRE_ZKNE(ctx);
>> +
>> +    TCGv bs = tcg_const_tl(a->bs);
>> +    TCGv dest = dest_gpr(ctx, a->rd);
>> +    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
>> +    TCGv src2 = get_gpr(ctx, a->rs2, EXT_NONE);
>> +
>> +    gen_helper_aes32esmi(dest, src1, src2, bs);
>> +    gen_set_gpr(ctx, a->rd, dest);
>> +
>> +    tcg_temp_free(bs);
>> +    return true;
>> +}
>> +
>
> tcg_constant_tl, which then need not be freed.
> You should create a common helper for these 4 functions, so that you 
> do not replicate so much code between them.
>
OK. I'll fix them.

Regards,

Weiwei Li

>
> r~


