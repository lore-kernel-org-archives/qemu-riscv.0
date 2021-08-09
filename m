Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mD07p-0007V6-9T
	for mharc-qemu-riscv@gnu.org; Mon, 09 Aug 2021 03:55:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mD07n-0007UF-J0; Mon, 09 Aug 2021 03:55:07 -0400
Received: from out28-97.mail.aliyun.com ([115.124.28.97]:42787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mD07l-0004mo-EZ; Mon, 09 Aug 2021 03:55:07 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1430742|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.0221932-0.000559685-0.977247;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047188; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.KxMqHUI_1628495699; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KxMqHUI_1628495699)
 by smtp.aliyun-inc.com(10.147.41.158);
 Mon, 09 Aug 2021 15:55:00 +0800
Subject: Re: [RFC PATCH 06/13] target/riscv: Fix div instructions
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com
References: <20210805025312.15720-1-zhiwei_liu@c-sky.com>
 <20210805025312.15720-7-zhiwei_liu@c-sky.com>
 <dd9d55df-523e-2085-c324-e68c54cee403@linaro.org>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <4a8475d3-5534-5ba5-8373-b9afe7b34dc1@c-sky.com>
Date: Mon, 9 Aug 2021 15:53:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <dd9d55df-523e-2085-c324-e68c54cee403@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.97; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-97.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
X-List-Received-Date: Mon, 09 Aug 2021 07:55:07 -0000


On 2021/8/6 上午6:18, Richard Henderson wrote:
> On 8/4/21 4:53 PM, LIU Zhiwei wrote:
>> Don't overwrite global source register after
>> https://lists.gnu.org/archive/html/qemu-riscv/2021-07/msg00058.html.
>>
>> Signed-off-by: LIU Zhiwei<zhiwei_liu@c-sky.com>
>> ---
>>   target/riscv/translate.c | 46 +++++++++++++++++++++++-----------------
>>   1 file changed, 26 insertions(+), 20 deletions(-)
>
> FWIW, I have a cleanup to these routines that does more than add 
> temps.  I've been slow to re-post the series; sorry about that.
>
Look forward to your next patch set. I will send my next patch set based 
on your new post.

Thanks,
Zhiwei

> r~

