Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1onDy5-0006pU-Qc
	for mharc-qemu-riscv@gnu.org; Tue, 25 Oct 2022 03:03:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1onDy3-0006XH-5n; Tue, 25 Oct 2022 03:03:19 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1onDy0-0006jM-5x; Tue, 25 Oct 2022 03:03:18 -0400
Received: from [192.168.124.8] (unknown [139.227.114.201])
 by APP-01 (Coremail) with SMTP id qwCowABnbHQnildjLZ7pBg--.14035S2;
 Tue, 25 Oct 2022 15:03:05 +0800 (CST)
Message-ID: <42442ea9-fa08-a79b-c8d9-b1641fae3c76@iscas.ac.cn>
Date: Tue, 25 Oct 2022 15:03:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Cc: liweiwei@iscas.ac.cn, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Subject: Re: [RFC 6/8] target/riscv: delete redundant check for zcd
 instructions in decode_opc
To: Alistair Francis <alistair23@gmail.com>
References: <20220930012345.5248-1-liweiwei@iscas.ac.cn>
 <20220930012345.5248-7-liweiwei@iscas.ac.cn>
 <CAKmqyKORk8eDQz-GU0CR9Ch9wmtdB9Fc6EGmPHcgSp9Dsr7bWQ@mail.gmail.com>
Content-Language: en-US
From: weiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <CAKmqyKORk8eDQz-GU0CR9Ch9wmtdB9Fc6EGmPHcgSp9Dsr7bWQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowABnbHQnildjLZ7pBg--.14035S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KFyrZF43CF1fuw15Cry5twb_yoW8Xr4kpr
 W8CF47CrZ8Ja4jkas7GF4Yqr4UWws8Kr1kGryv9wnavrZrWrs8ZFWDKaySkF4jyFs2gw10
 vFsIyr98Cr4xZaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkK14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxV
 WxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
 Yx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbV
 WUJVW8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07Al
 zVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
 0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFyl
 IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxV
 AFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j
 6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUbXdbU
 UUUUU==
X-Originating-IP: [139.227.114.201]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.21; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Tue, 25 Oct 2022 07:03:20 -0000


On 2022/10/25 11:39, Alistair Francis wrote:
> On Fri, Sep 30, 2022 at 11:28 AM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>> All the check for Zcd instructions have been done in their trans function
>>
>> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
>> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
>> ---
>>   target/riscv/translate.c | 7 -------
>>   1 file changed, 7 deletions(-)
>>
>> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
>> index 347bc913eb..a55b4a7849 100644
>> --- a/target/riscv/translate.c
>> +++ b/target/riscv/translate.c
>> @@ -1087,13 +1087,6 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
>>                ((opcode & 0xe003) == 0xe000) ||
>>                ((opcode & 0xe003) == 0xe002))) {
>>               gen_exception_illegal(ctx);
>> -        } else if (!(has_ext(ctx, RVC) || ctx->cfg_ptr->ext_zcd ||
>> -                     ctx->cfg_ptr->ext_zcmp || ctx->cfg_ptr->ext_zcmt) &&
>> -                   (((opcode & 0xe003) == 0x2000) ||
>> -                    ((opcode & 0xe003) == 0x2002) ||
>> -                    ((opcode & 0xe003) == 0xa000) ||
>> -                    ((opcode & 0xe003) == 0xa002))) {
>> -            gen_exception_illegal(ctx);
> It's probably best to never add this in the first place.
>
> Remember that the extension can't be enabled until the last patch, so
> it's ok if we don't support it all in one go
>
> Alistair

OK.  I'll update it in next version.

Regards,

Weiwei Li

>
>>           } else {
>>               ctx->opcode = opcode;
>>               ctx->pc_succ_insn = ctx->base.pc_next + 2;
>> --
>> 2.25.1
>>
>>


