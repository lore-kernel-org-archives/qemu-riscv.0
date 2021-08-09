Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mCuTL-0003H0-U2
	for mharc-qemu-riscv@gnu.org; Sun, 08 Aug 2021 21:52:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mCuTJ-0003G8-Jc; Sun, 08 Aug 2021 21:52:57 -0400
Received: from out28-3.mail.aliyun.com ([115.124.28.3]:57638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mCuTH-0004l6-AI; Sun, 08 Aug 2021 21:52:57 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07913799|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.0394509-0.000129423-0.96042;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047204; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.KxCMXBW_1628473964; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KxCMXBW_1628473964)
 by smtp.aliyun-inc.com(10.147.44.145);
 Mon, 09 Aug 2021 09:52:44 +0800
Subject: Re: [RFC PATCH 03/13] target/riscv: Support UXL32 on 64-bit cpu for
 load/store
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com
References: <20210805025312.15720-1-zhiwei_liu@c-sky.com>
 <20210805025312.15720-4-zhiwei_liu@c-sky.com>
 <0f456a97-89b5-3a62-f9c8-7719bda9d2cc@linaro.org>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <3f2f03d2-03dc-db71-8dcf-8c79d63b9cd2@c-sky.com>
Date: Mon, 9 Aug 2021 09:50:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <0f456a97-89b5-3a62-f9c8-7719bda9d2cc@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.3; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-3.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 09 Aug 2021 01:52:57 -0000


On 2021/8/6 上午3:08, Richard Henderson wrote:
> On 8/4/21 4:53 PM, LIU Zhiwei wrote:
>> Get the LSB 32 bits and zero-extend as the base address.
>>
>> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
>> ---
>>   target/riscv/insn_trans/trans_rvi.c.inc | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/target/riscv/insn_trans/trans_rvi.c.inc 
>> b/target/riscv/insn_trans/trans_rvi.c.inc
>> index ea41d1de2d..6823a6b3e0 100644
>> --- a/target/riscv/insn_trans/trans_rvi.c.inc
>> +++ b/target/riscv/insn_trans/trans_rvi.c.inc
>> @@ -163,7 +163,7 @@ static bool trans_bgeu(DisasContext *ctx, 
>> arg_bgeu *a)
>>   static bool gen_load(DisasContext *ctx, arg_lb *a, MemOp memop)
>>   {
>>       TCGv dest = gpr_dst(ctx, a->rd);
>> -    TCGv addr = gpr_src(ctx, a->rs1);
>> +    TCGv addr = gpr_src_u(ctx, a->rs1);
>>       TCGv temp = NULL;
>>         if (a->imm) {
>> @@ -207,7 +207,7 @@ static bool trans_lhu(DisasContext *ctx, arg_lhu *a)
>>     static bool gen_store(DisasContext *ctx, arg_sb *a, MemOp memop)
>>   {
>> -    TCGv addr = gpr_src(ctx, a->rs1);
>> +    TCGv addr = gpr_src_u(ctx, a->rs1);
>>       TCGv data = gpr_src(ctx, a->rs2);
>>       TCGv temp = NULL;
>
> This is incorrect.  The zero-extension should happen after the 
> addition of the immediate offset.

Thanks. I think you are right. I mistook the immediate will be signed to 
target_ulong.

Zhiwei

>
> r~

