Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1olTxL-0000HO-1m
	for mharc-qemu-riscv@gnu.org; Thu, 20 Oct 2022 07:43:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1olTwr-0008E8-JO; Thu, 20 Oct 2022 07:43:06 -0400
Received: from out30-44.freemail.mail.aliyun.com ([115.124.30.44]:55121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1olTwp-0004Ur-69; Thu, 20 Oct 2022 07:42:53 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R291e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046059;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=7; SR=0;
 TI=SMTPD_---0VSf18.m_1666266159; 
Received: from 30.221.96.197(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VSf18.m_1666266159) by smtp.aliyun-inc.com;
 Thu, 20 Oct 2022 19:42:40 +0800
Message-ID: <6c468fb2-c41e-a7dc-8fef-10185dffeca9@linux.alibaba.com>
Date: Thu, 20 Oct 2022 19:42:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [RFC PATCH 1/3] tcg/riscv: Fix base regsiter for qemu_ld/st
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 lzw194868@alibaba-inc.com
References: <20221020104154.4276-1-zhiwei_liu@linux.alibaba.com>
 <20221020104154.4276-2-zhiwei_liu@linux.alibaba.com>
 <4373f964-3336-d076-5284-d5a2983ddd88@linaro.org>
Content-Language: en-US
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <4373f964-3336-d076-5284-d5a2983ddd88@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.44;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-44.freemail.mail.aliyun.com
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
X-List-Received-Date: Thu, 20 Oct 2022 11:43:17 -0000


On 2022/10/20 19:18, Richard Henderson wrote:
> On 10/20/22 20:41, LIU Zhiwei wrote:
>> When guest base is zero, we should use addr_regl as base regiser 
>> instead of
>> the initial register TCG_REG_TMP0.
>>
>> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
>> ---
>>   tcg/riscv/tcg-target.c.inc | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
>> index 81a83e45b1..32f4bc7bfc 100644
>> --- a/tcg/riscv/tcg-target.c.inc
>> +++ b/tcg/riscv/tcg-target.c.inc
>> @@ -1185,6 +1185,8 @@ static void tcg_out_qemu_ld(TCGContext *s, 
>> const TCGArg *args, bool is_64)
>>       }
>>       if (guest_base != 0) {
>>           tcg_out_opc_reg(s, OPC_ADD, base, TCG_GUEST_BASE_REG, 
>> addr_regl);
>> +    } else {
>> +        base = addr_regl;
>>       }
>
> You're right that there's a bug here, where TMP0 remains 
> uninitialized.  I think it would be better to reorg the other 
> direction: begin with initializeing base = addr_regl, 

Do you mean only in user mode? I see TCG_REG_TMP0 has been used in 
tcg_out_tlb_load when  system mode.

Best Regards,
Zhiwei

> and then change it away only when we make modifications.
>
> r~

