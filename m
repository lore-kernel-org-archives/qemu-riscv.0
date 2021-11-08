Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mk3Tg-0005TV-4Y
	for mharc-qemu-riscv@gnu.org; Mon, 08 Nov 2021 07:10:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mk3Te-0005Sw-Km; Mon, 08 Nov 2021 07:10:18 -0500
Received: from out28-194.mail.aliyun.com ([115.124.28.194]:38441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mk3Tb-0000ZR-Kv; Mon, 08 Nov 2021 07:10:18 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1190568|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_news_journal|0.0161763-0.000347131-0.983477;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047213; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.LpT3Ipi_1636373407; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.LpT3Ipi_1636373407)
 by smtp.aliyun-inc.com(10.147.41.158);
 Mon, 08 Nov 2021 20:10:07 +0800
Subject: Re: [PATCH 13/13] target/riscv: Enable uxl field write
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com
References: <20211101100143.44356-1-zhiwei_liu@c-sky.com>
 <20211101100143.44356-14-zhiwei_liu@c-sky.com>
 <869f1399-0158-e609-1e68-57d7a9896e3d@linaro.org>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <199a212f-8df5-9289-c625-8c0e5d4f6c76@c-sky.com>
Date: Mon, 8 Nov 2021 20:10:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <869f1399-0158-e609-1e68-57d7a9896e3d@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.194; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-194.mail.aliyun.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.06,
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
X-List-Received-Date: Mon, 08 Nov 2021 12:10:19 -0000


On 2021/11/2 上午1:01, Richard Henderson wrote:
> On 11/1/21 6:01 AM, LIU Zhiwei wrote:
>>           mask |= MSTATUS_MPV | MSTATUS_GVA;
>> +        if ((val ^ mstatus) & MSTATUS64_UXL) {
>> +            mask |= MSTATUS64_UXL;
>> +        }
>
> Why do you need the conditional here?
> Why is this not just
>
>     mask |= MSTATUS_MPV | MSTATUS_GVA | MSTATUS64_UXL;
OK
>
>
>>  static bool trans_csrrw(DisasContext *ctx, arg_csrrw *a)
>>  {
>> -    TCGv src = get_gpr(ctx, a->rs1, EXT_NONE);
>> +    TCGv src = get_gpr(ctx, a->rs1, EXT_ZERO);
>
> Hmm.  Not sure about this.
>
> It looks like we should in fact change mask, just a few lines down, at 
> which point the extension (or not) for the source would not matter.  
> And likewise in trans_csrrwi.

It's better to use the mask.

Thanks,
Zhiwei

>
>
> r~

