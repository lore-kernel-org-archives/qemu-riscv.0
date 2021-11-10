Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mkds0-0000ru-EA
	for mharc-qemu-riscv@gnu.org; Tue, 09 Nov 2021 22:01:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mkdry-0000rZ-Is; Tue, 09 Nov 2021 22:01:50 -0500
Received: from out28-173.mail.aliyun.com ([115.124.28.173]:52097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mkdrv-0004Yq-Pt; Tue, 09 Nov 2021 22:01:50 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.133789|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.0168099-0.000877232-0.982313;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047202; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.LqMLrQu_1636513298; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.LqMLrQu_1636513298)
 by smtp.aliyun-inc.com(10.147.40.26); Wed, 10 Nov 2021 11:01:38 +0800
Subject: Re: [PATCH 13/13] target/riscv: Enable uxl field write
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com
References: <20211101100143.44356-1-zhiwei_liu@c-sky.com>
 <20211101100143.44356-14-zhiwei_liu@c-sky.com>
 <869f1399-0158-e609-1e68-57d7a9896e3d@linaro.org>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <b77a35f8-a414-762f-734f-1a019e658a03@c-sky.com>
Date: Wed, 10 Nov 2021 11:01:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <869f1399-0158-e609-1e68-57d7a9896e3d@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.173; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-173.mail.aliyun.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.364,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 10 Nov 2021 03:01:50 -0000


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

Is there some benefits to use mask?
I see there is still a do_csrw, and we can't give it a mask at 
translation time.

Thanks,
Zhiwei

>
>
> r~

