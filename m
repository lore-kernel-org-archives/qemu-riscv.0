Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jjBlA-0008Pq-1r
	for mharc-qemu-riscv@gnu.org; Wed, 10 Jun 2020 21:12:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jjBl8-0008LS-Md; Wed, 10 Jun 2020 21:11:58 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:49972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jjBl6-0001xq-Jc; Wed, 10 Jun 2020 21:11:58 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1669833|-1; CH=blue; DM=|OVERLOAD|false|;
 DS=CONTINUE|ham_enroll_verification|0.0166422-0.000628622-0.982729;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03296; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=7; RT=7; SR=0; TI=SMTPD_---.HkmndQk_1591837910; 
Received: from 30.225.208.60(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.HkmndQk_1591837910)
 by smtp.aliyun-inc.com(10.147.41.178);
 Thu, 11 Jun 2020 09:11:50 +0800
Subject: Re: [PATCH v9 39/61] target/riscv: vector floating-point compare
 instructions
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, wenmeng_zhang@c-sky.com,
 wxy194768@alibaba-inc.com
References: <20200610113748.4754-1-zhiwei_liu@c-sky.com>
 <20200610113748.4754-40-zhiwei_liu@c-sky.com>
 <e6d05624-8e4d-76d5-d085-a81553773fd7@linaro.org>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <526de5d9-4dcf-2ed1-30c6-4fd55f6c1b8d@c-sky.com>
Date: Thu, 11 Jun 2020 09:11:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <e6d05624-8e4d-76d5-d085-a81553773fd7@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: none client-ip=121.197.200.217;
 envelope-from=zhiwei_liu@c-sky.com; helo=smtp2200-217.mail.aliyun.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/10 21:11:51
X-ACL-Warn: Detected OS   = Linux 3.x [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, UNPARSEABLE_RELAY=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Thu, 11 Jun 2020 01:11:59 -0000



On 2020/6/11 1:33, Richard Henderson wrote:
> On 6/10/20 4:37 AM, LIU Zhiwei wrote:
>> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>> Richard Henderson <richard.henderson@linaro.org>
>> ---
> Missed the actual "Reviewed-by:" :-)
I tried to make a reasonable explanation, but failed:-).

"Reviewed-by: " is really what I mean here.

Zhiwei
>
> r~


