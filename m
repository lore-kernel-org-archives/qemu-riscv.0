Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lrWzS-0006Xt-Pd
	for mharc-qemu-riscv@gnu.org; Thu, 10 Jun 2021 22:33:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lrWzR-0006Wp-5f; Thu, 10 Jun 2021 22:33:45 -0400
Received: from out28-1.mail.aliyun.com ([115.124.28.1]:47533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lrWzN-0001fD-BB; Thu, 10 Jun 2021 22:33:44 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07796431|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.0845167-0.00297521-0.912508;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047198; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.KQmAr0O_1623378811; 
Received: from 172.27.117.59(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KQmAr0O_1623378811)
 by smtp.aliyun-inc.com(10.147.41.138);
 Fri, 11 Jun 2021 10:33:31 +0800
Subject: Re: TCG op for 32 bit only cpu on qemu-riscv64
To: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>
References: <97935519-42c8-71c8-3d87-30aa4cafc909@c-sky.com>
 <618e9348-c420-b560-1f67-3608023985a7@linaro.org>
 <7ac5990e-5f87-3d96-d8b5-bd7997fac0ee@c-sky.com>
 <eb54d2d9-db15-e2d7-e245-f61587b0ca4e@linaro.org>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <980660a9-0c4b-bd37-e47b-9b5e1d128aef@c-sky.com>
Date: Fri, 11 Jun 2021 10:33:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <eb54d2d9-db15-e2d7-e245-f61587b0ca4e@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.1; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-1.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Jun 2021 02:33:45 -0000


On 6/10/21 9:29 PM, Richard Henderson wrote:
> On 6/9/21 6:43 PM, LIU Zhiwei wrote:
>> 1)First a multiply instruction, if the source value big enough, it 
>> will return a result with some bits not zero in MSW 32-bit.
>
> Multiply is fine.  Input bits outside the low 32 cannot appear in the 
> low 32 of the output.  Multiply-high-part on the other hand will 
> require sign- or zero-extension of inputs.
>
>> 2)If next instruction is a divide instruction,  the MSW 32-bit will 
>> influence the divide instruction result.
>
> Yes, division requires extension too.
>
>> So I think use *_tl can't satisfy the need to run 32-bit program on 
>> qemu-riscv64.
>
> I said some operations will require extra work -- I gave right-shift 
> as an example.
>
> You just have to be careful about deciding what extra work to do. I am 
> suggesting that truncation to *_i32 is almost always not the correct 
> answer.
>
> Perhaps make it easier by changing gen_get_gpr and gen_set_gpr:
>
> /* Return sign-extended version of gpr. */
> static void get_gpr_s(DisasContext *ctx, TCGv t, int reg_num)
> {
>     if (reg_num == 0) {
>         tcg_gen_movi_tl(t, 0);
>     } else if (is_32bit(ctx)) {
>         tcg_gen_ext32s_tl(t, cpu_gpr[reg_num]);
>     } else {
>         tcg_gen_mov_tl(t, cpu_gpr[reg_num]);
>     }
> }
>
> /* Return zero-extended version of gpr. */
> static void get_gpr_u(DisasContext *ctx, TCGv t, int reg_num);
> {
>     if (reg_num == 0) {
>         tcg_gen_movi_tl(t, 0);
>     } else if (is_32bit(ctx)) {
>         tcg_gen_ext32u_tl(t, cpu_gpr[reg_num]);
>     } else {
>         tcg_gen_mov_tl(t, cpu_gpr[reg_num]);
>     }
> }
>
> /* Return gpr with undefined high bits (which will be ignored). */
> static void get_gpr_x(TCGv t, int reg_num);
> {
>     if (reg_num == 0) {
>         tcg_gen_movi_tl(t, 0);
>     } else {
>         tcg_gen_mov_tl(t, cpu_gpr[reg_num]);
>     }
> }
>
> And similarly for set.
>
It's very instructive. Thanks.

I once thought we have to split the registers in CPURISCVSTATE into two 
parts, gpr32 or gpr64.
Now I think we can still use most currently work with  a small 
cost(tcg_gen_ext32s_i64 has more cost than tcg_gen_mov_i32)

I will have a try later. Thanks again.

Best Regards,
Zhiwei

>
> r~

