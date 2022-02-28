Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nOWJS-0005W0-Jt
	for mharc-qemu-riscv@gnu.org; Sun, 27 Feb 2022 22:03:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nOWJQ-0005VU-0J; Sun, 27 Feb 2022 22:03:00 -0500
Received: from smtp84.cstnet.cn ([159.226.251.84]:33682 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nOWJM-0003jA-IK; Sun, 27 Feb 2022 22:02:59 -0500
Received: from [192.168.0.104] (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowAAX+fFXOxxiMKS5AQ--.40662S2;
 Mon, 28 Feb 2022 11:02:48 +0800 (CST)
Subject: Re: [PATCH v6 02/14] target/riscv: rvk: add support for zbkb extension
To: Richard Henderson <richard.henderson@linaro.org>,
 Weiwei Li <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, luruibo2000@163.com,
 lustrew@foxmail.com
References: <20220227142553.25815-1-liweiwei@iscas.ac.cn>
 <20220227142553.25815-3-liweiwei@iscas.ac.cn>
 <e6a2401d-5ce2-c2cb-7ee2-fefe99818533@linaro.org>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <68883535-a085-169a-044f-04349ad4cc9f@iscas.ac.cn>
Date: Mon, 28 Feb 2022 11:02:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <e6a2401d-5ce2-c2cb-7ee2-fefe99818533@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: zQCowAAX+fFXOxxiMKS5AQ--.40662S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CrW3AryDWry8Ar13GF13CFg_yoW8CFy7pF
 1kJrW8JayUJF95Aw1UZr4UuF9xAFn3ta1qq3saq3WYyanFkr109r15ursIgr1rArZ5X3y5
 Ar15urnrZw43Ja7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9I14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F
 4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
 7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
 1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
 n2kIc2xKxwCYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFV
 Cjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWl
 x4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r
 1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_WFyU
 JVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJb
 IYCTnIWIevJa73UjIFyTuYvjfUF9a9DUUUU
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
X-List-Received-Date: Mon, 28 Feb 2022 03:03:00 -0000

Thanks for your comments.

在 2022/2/28 上午2:47, Richard Henderson 写道:
> On 2/27/22 04:25, Weiwei Li wrote:
>> +static void gen_packh(TCGv ret, TCGv src1, TCGv src2)
>> +{
>> +    TCGv t = tcg_temp_new();
>> +
>> +    tcg_gen_ext8u_tl(t, src2);
>> +    tcg_gen_deposit_tl(ret, src1, t, 8, TARGET_LONG_BITS - 8);
>> +    tcg_temp_free(t);
>> +}
>> +
>> +static void gen_packw(TCGv ret, TCGv src1, TCGv src2)
>> +{
>> +    TCGv t = tcg_temp_new();
>> +
>> +    tcg_gen_ext16s_tl(t, src2);
>> +    tcg_gen_deposit_tl(ret, src1, t, 16, 48);
>> +    tcg_temp_free(t);
>> +}
>
> Missing TARGET_LONG_BITS here; would break on RV32.
packw is RV64-only instruction. Is it necessary to use TARGET_LONG_BITS 
here?
>
>>
>> +static bool trans_brev8(DisasContext *ctx, arg_brev8 *a)
>> +{
>> +    REQUIRE_ZBKB(ctx);
>> +
>> +    TCGv dest = dest_gpr(ctx, a->rd);
>> +    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
>> +
>> +    gen_helper_brev8(dest, src1);
>> +    gen_set_gpr(ctx, a->rd, dest);
>> +
>> +    return true;
>> +}
> ...
>>
>> +static bool trans_unzip(DisasContext *ctx, arg_unzip *a)
>> +{
>> +    REQUIRE_ZBKB(ctx);
>> +    REQUIRE_32BIT(ctx);
>> +
>> +    TCGv dest = dest_gpr(ctx, a->rd);
>> +    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
>> +
>> +    gen_helper_unzip(dest, src1);
>> +    gen_set_gpr(ctx, a->rd, dest);
>> +
>> +    return true;
>> +}
>> +
>> +static bool trans_zip(DisasContext *ctx, arg_zip *a)
>> +{
>> +    REQUIRE_ZBKB(ctx);
>> +    REQUIRE_32BIT(ctx);
>> +
>> +    TCGv dest = dest_gpr(ctx, a->rd);
>> +    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
>> +
>> +    gen_helper_zip(dest, src1);
>> +    gen_set_gpr(ctx, a->rd, dest);
>> +
>> +    return true;
>> +}
>
> Use gen_unary.

OK. I'll fix it.

Regards,

Weiwei Li

>
> r~


