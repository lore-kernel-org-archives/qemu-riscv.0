Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oliEF-00072Y-RS
	for mharc-qemu-riscv@gnu.org; Thu, 20 Oct 2022 22:57:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1oliEA-0006yP-4j; Thu, 20 Oct 2022 22:57:42 -0400
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1oliE7-0006dJ-QB; Thu, 20 Oct 2022 22:57:41 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R761e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045176;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=7; SR=0;
 TI=SMTPD_---0VShPJix_1666321049; 
Received: from 30.221.97.175(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VShPJix_1666321049) by smtp.aliyun-inc.com;
 Fri, 21 Oct 2022 10:57:30 +0800
Message-ID: <0cd94ce7-eeb8-c175-cfb1-c584f494bc57@linux.alibaba.com>
Date: Fri, 21 Oct 2022 10:57:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [RFC PATCH 2/3] tcg/riscv: Fix tcg_out_opc_imm when imm exceeds
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 lzw194868@alibaba-inc.com
References: <20221020104154.4276-1-zhiwei_liu@linux.alibaba.com>
 <20221020104154.4276-3-zhiwei_liu@linux.alibaba.com>
 <49246207-2202-0239-65f5-1f0b44d8bd64@linaro.org>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <49246207-2202-0239-65f5-1f0b44d8bd64@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.131;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-131.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 21 Oct 2022 02:57:42 -0000


On 2022/10/20 19:22, Richard Henderson wrote:
> On 10/20/22 20:41, LIU Zhiwei wrote:
>> TYPE-I immediate can only represent a signed 12-bit value. If immediate
>> exceed, mov it to an register.
>>
>> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
>> ---
>>   tcg/riscv/tcg-target.c.inc | 28 +++++++++++++++++++++++-----
>>   1 file changed, 23 insertions(+), 5 deletions(-)
>>
>> diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
>> index 32f4bc7bfc..bfdf2bea69 100644
>> --- a/tcg/riscv/tcg-target.c.inc
>> +++ b/tcg/riscv/tcg-target.c.inc
>> @@ -668,7 +668,12 @@ static void tcg_out_addsub2(TCGContext *s,
>>       if (!cbh) {
>>           tcg_out_opc_reg(s, (is_sub ? opc_sub : opc_add), th, ah, bh);
>>       } else if (bh != 0 || ah == rl) {
>> -        tcg_out_opc_imm(s, opc_addi, th, ah, (is_sub ? -bh : bh));
>> +        if (bh == sextract(bh, 0, 12)) {
>> +            tcg_out_opc_imm(s, opc_addi, th, ah, (is_sub ? -bh : bh));
>> +        } else {
>> +            tcg_out_movi(s, TCG_TYPE_TL, th, (is_sub ? -bh : bh));
>> +            tcg_out_opc_reg(s, opc_add, th, ah, th);
>> +        }
>
> This value is currently constrained by 'M': +/- 0xfff.

I don't know why we need 'M'. Can I just use the constraint

C_O2_I4(r, r, rZ, rZ, rS, rS);

If we don't need ‘M’ constraint, I want to remove it in next version patch.

Thanks,
Zhiwei

> You're suggesting that the fix should be to use 'I', which is signed 
> 12-bit.
>
> But this fix is definitely in the wrong place.
>
>
> r~

