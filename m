Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nOrK2-0005sA-0q
	for mharc-qemu-riscv@gnu.org; Mon, 28 Feb 2022 20:29:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nOrJn-0005pY-Tz; Mon, 28 Feb 2022 20:28:49 -0500
Received: from smtp84.cstnet.cn ([159.226.251.84]:53380 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nOrJl-0007lF-Ax; Mon, 28 Feb 2022 20:28:47 -0500
Received: from [192.168.0.104] (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowAB3V_DBdh1iU_rPAQ--.16838S2;
 Tue, 01 Mar 2022 09:28:34 +0800 (CST)
Subject: Re: [PATCH v7 09/14] target/riscv: rvk: add support for sha512
 related instructions for RV32 in zknh extension
To: Richard Henderson <richard.henderson@linaro.org>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, lustrew@foxmail.com,
 luruibo2000@163.com
References: <20220228144810.7284-1-liweiwei@iscas.ac.cn>
 <20220228144810.7284-10-liweiwei@iscas.ac.cn>
 <ea054747-9c1b-4e0b-f084-6063d19207ca@linaro.org>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <c12ae766-fd80-241f-899e-5f7e62682450@iscas.ac.cn>
Date: Tue, 1 Mar 2022 09:28:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <ea054747-9c1b-4e0b-f084-6063d19207ca@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: zQCowAB3V_DBdh1iU_rPAQ--.16838S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJrW8Gry3GryDXrWUCw4kZwb_yoW8GrWkpF
 1ktrWvqF4kJFsY9ryjyr1vqryxZ34UA3WYy340q34ftrW5tr10kFW5Wan0gFW7Ca95ur1U
 AF40ga4a93W3AaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBq14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
 1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
 7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
 1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
 n2kIc2xKxwCYjI0SjxkI62AI1cAE67vIY487MxkF7I0Ew4C26cxK6c8Ij28IcwCF04k20x
 vY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I
 3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIx
 AIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAI
 cVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z2
 80aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUj0JPtUUUUU==
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
X-List-Received-Date: Tue, 01 Mar 2022 01:28:51 -0000


在 2022/3/1 上午3:38, Richard Henderson 写道:
> On 2/28/22 04:48, Weiwei Li wrote:
>> +#define GEN_SHA512H_RV32(NAME, OP, NUM1, NUM2, NUM3) \
>> +static void gen_##NAME(TCGv dest, TCGv src1, TCGv src2) \
>> +{ \
>> +    TCGv_i64 t0 = tcg_temp_new_i64(); \
>> +    TCGv_i64 t1 = tcg_temp_new_i64(); \
>> +    TCGv_i64 t2 = tcg_temp_new_i64(); \
>> +    \
>> +    tcg_gen_concat_tl_i64(t0, src1, src2); \
>> +    tcg_gen_##OP##_i64(t1, t0, NUM1); \
>> +    tcg_gen_concat_tl_i64(t2, src1, tcg_const_tl(0)); \
>
> The bug here is tcg_const_tl instead of tcg_constant_tl, which leaks a 
> temporary.
>
> It's not the best option for zero-extension, though, as we don't 
> optimize a deposit of zero like this (we probably should, but, hey).
>
> Better would be
>
>     tcg_gen_extu_tl_i64(t2, src1);
>     tcg_gen_ext32u_i64(t2, t2);
>
> Note that the first operation will *not* extend if TARGET_RISCV64, 
> since it doesn't actually change type.  The second operation will be 
> optimized away if TARGET_RISCV32, since the zero-extend has already 
> happened.
>
OK. I'll update this.

> BTW, it would be better to not use a large macro for this, and in the 
> previous patch. Passing in parameters to a helper function would be 
> easier to read and debug.
>
OK I'll try to replace this as parameters to a function.

Regards,

Weiwei Li

>
> r~


