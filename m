Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mknuh-0006qA-NC
	for mharc-qemu-riscv@gnu.org; Wed, 10 Nov 2021 08:45:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mknub-0006kK-PD; Wed, 10 Nov 2021 08:45:13 -0500
Received: from out28-221.mail.aliyun.com ([115.124.28.221]:35087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mknuU-0004Px-KG; Wed, 10 Nov 2021 08:45:12 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07503048|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.0312544-0.000152366-0.968593;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047207; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.Lqh7XjY_1636551897; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.Lqh7XjY_1636551897)
 by smtp.aliyun-inc.com(10.147.40.233);
 Wed, 10 Nov 2021 21:44:57 +0800
Subject: Re: [PATCH v2 05/14] target/riscv: Calculate address according to XLEN
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Alexey Baturo <baturo.alexey@gmail.com>
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com
References: <20211110070452.48539-1-zhiwei_liu@c-sky.com>
 <20211110070452.48539-6-zhiwei_liu@c-sky.com>
 <7dace3b5-1320-20b3-703c-bbdf7e745fb9@linaro.org>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <df0a3a5a-7ca5-b2dc-36c0-d802df99b5b0@c-sky.com>
Date: Wed, 10 Nov 2021 21:44:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <7dace3b5-1320-20b3-703c-bbdf7e745fb9@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.221; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-221.mail.aliyun.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.678,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 10 Nov 2021 13:45:16 -0000


On 2021/11/10 下午6:52, Richard Henderson wrote:
> On 11/10/21 8:04 AM, LIU Zhiwei wrote:
>> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
>> ---
>>   target/riscv/insn_trans/trans_rvd.c.inc | 23 ++---------------------
>>   target/riscv/insn_trans/trans_rvf.c.inc | 23 ++---------------------
>>   target/riscv/insn_trans/trans_rvi.c.inc | 18 ++----------------
>>   target/riscv/translate.c                | 13 +++++++++++++
>>   4 files changed, 19 insertions(+), 58 deletions(-)
>>
>> diff --git a/target/riscv/insn_trans/trans_rvd.c.inc 
>> b/target/riscv/insn_trans/trans_rvd.c.inc
>> index 64fb0046f7..29066a8ef3 100644
>> --- a/target/riscv/insn_trans/trans_rvd.c.inc
>> +++ b/target/riscv/insn_trans/trans_rvd.c.inc
>> @@ -20,19 +20,10 @@
>>     static bool trans_fld(DisasContext *ctx, arg_fld *a)
>>   {
>> -    TCGv addr;
>> -
>> +    TCGv addr = get_address(ctx, a->rs1, a->imm);
>>       REQUIRE_FPU;
>>       REQUIRE_EXT(ctx, RVD);
>
> It would be better to leave the address calculation after the REQUIRE 
> checks.
OK.
>
>> +static TCGv get_address(DisasContext *ctx, int rs1, int imm)
>> +{
>> +    TCGv addr = temp_new(ctx);
>> +    TCGv src1 = get_gpr(ctx, rs1, EXT_NONE);
>> +
>> +    tcg_gen_addi_tl(addr, src1, imm);
>> +    addr = gen_pm_adjust_address(ctx, addr);
>> +    if (get_xl(ctx) == MXL_RV32) {
>> +        tcg_gen_ext32u_tl(addr, addr);
>> +    }
>> +    return addr;
>> +}
>
> I suspect the extend should come before the pointer mask and not 
> after, but this is is a weakness in the current RVJ spec that it does 
> not specify how the extension interacts with UXL.  (The reverse 
> ordering would allow a 64-bit os to place a 32-bit application at a 
> base address above 4gb, which could allow address separation without 
> paging enabled.)

Agree. Should we adjust currently, or just add a TODO comment here?

>
> I do think we should merge gen_pm_adjust_address into this function so 
> that we only create one new temporary.

I think custom instructions will be added in the future. And possibly 
there will be  some custom load/store instructions.
If we merge gen_pm_adjust_address,  we may have to split it once again 
at that time.

Thanks,
Zhiwei

>
>
> r~

