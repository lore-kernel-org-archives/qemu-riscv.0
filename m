Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mhZfY-0003s1-Ba
	for mharc-qemu-riscv@gnu.org; Mon, 01 Nov 2021 11:56:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mhZfW-0003pu-Ny; Mon, 01 Nov 2021 11:56:18 -0400
Received: from out28-194.mail.aliyun.com ([115.124.28.194]:58659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mhZfR-0008WU-RY; Mon, 01 Nov 2021 11:56:18 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436328|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.0275667-7.30455e-05-0.97236;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047193; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.LlmYnNe_1635782162; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.LlmYnNe_1635782162)
 by smtp.aliyun-inc.com(10.147.41.158);
 Mon, 01 Nov 2021 23:56:02 +0800
Subject: Re: [PATCH 05/13] target/riscv: Calculate address according to ol
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com
References: <20211101100143.44356-1-zhiwei_liu@c-sky.com>
 <20211101100143.44356-6-zhiwei_liu@c-sky.com>
 <a6ceb4fb-6a29-066b-23dd-114494d19e59@linaro.org>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <a9b16bdb-a998-1a81-26c1-b3411b988f01@c-sky.com>
Date: Mon, 1 Nov 2021 23:56:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <a6ceb4fb-6a29-066b-23dd-114494d19e59@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.194; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-194.mail.aliyun.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.14,
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
X-List-Received-Date: Mon, 01 Nov 2021 15:56:19 -0000


On 2021/11/1 下午6:46, Richard Henderson wrote:
> On 11/1/21 6:01 AM, LIU Zhiwei wrote:
>>   static bool trans_fld(DisasContext *ctx, arg_fld *a)
>>   {
>> -    TCGv addr;
>> +    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
>> +    TCGv addr = temp_new(ctx);
>>         REQUIRE_FPU;
>>       REQUIRE_EXT(ctx, RVD);
>>   -    addr = get_gpr(ctx, a->rs1, EXT_NONE);
>> -    if (a->imm) {
>> -        TCGv temp = temp_new(ctx);
>> -        tcg_gen_addi_tl(temp, addr, a->imm);
>> -        addr = temp;
>> -    }
>> +    tcg_gen_addi_tl(addr, src1, a->imm);
>>       addr = gen_pm_adjust_address(ctx, addr);
>
> No change here,
Oops, an error here.
>
>>   static bool trans_fsd(DisasContext *ctx, arg_fsd *a)
>>   {
>> -    TCGv addr;
>> +    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
>> +    TCGv addr = temp_new(ctx);
>>         REQUIRE_FPU;
>>       REQUIRE_EXT(ctx, RVD);
>>   -    addr = get_gpr(ctx, a->rs1, EXT_NONE);
>> -    if (a->imm) {
>> -        TCGv temp = temp_new(ctx);
>> -        tcg_gen_addi_tl(temp, addr, a->imm);
>> -        addr = temp;
>> -    }
>> +    tcg_gen_addi_tl(addr, src1, a->imm);
>>       addr = gen_pm_adjust_address(ctx, addr);
>
> Or here.
The same error.
>
>>   static bool trans_flw(DisasContext *ctx, arg_flw *a)
>>   {
>>       TCGv_i64 dest;
>> -    TCGv addr;
>> +    TCGv src1 = get_gpr(ctx, a->rs1, EXT_NONE);
>> +    TCGv addr = temp_new(ctx);
>>         REQUIRE_FPU;
>>       REQUIRE_EXT(ctx, RVF);
>>   -    addr = get_gpr(ctx, a->rs1, EXT_NONE);
>> -    if (a->imm) {
>> -        TCGv temp = temp_new(ctx);
>> -        tcg_gen_addi_tl(temp, addr, a->imm);
>> -        addr = temp;
>> +    tcg_gen_addi_tl(addr, src1, a->imm);
>> +    if (ctx->ol == MXL_RV32) {
>> +        tcg_gen_ext32u_tl(addr, addr);
>>       }
>>       addr = gen_pm_adjust_address(ctx, addr);
>
> But you did here.
That's what I want to.
>
> (1) OL is wrong, use XL.
OK.
>
> (2) The address adjustment should be done in some common routine.
>     Probably rename gen_pm_adjust_address to make it more generic,
>     then add the XL truncation there.

Yes,  the XL truncation should be placed after gen_pm_adjust_address.
Maybe we can define a common routine to get address, and in the common 
routine
we calculate the address and adjust it with pointer mask and xl.

Thanks,
Zhiwei

>
>
> r~

