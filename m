Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pMQ8W-0008OW-F4
	for mharc-qemu-riscv@gnu.org; Mon, 30 Jan 2023 04:07:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pMQ7p-0008Hj-4D; Mon, 30 Jan 2023 04:06:53 -0500
Received: from out30-6.freemail.mail.aliyun.com ([115.124.30.6])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pMQ7m-0002XS-2t; Mon, 30 Jan 2023 04:06:51 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R161e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046056;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=14; SR=0;
 TI=SMTPD_---0VaRafXj_1675069602; 
Received: from 30.221.97.63(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VaRafXj_1675069602) by smtp.aliyun-inc.com;
 Mon, 30 Jan 2023 17:06:43 +0800
Message-ID: <9d672153-609e-a8f5-31b6-218f2398f10b@linux.alibaba.com>
Date: Mon, 30 Jan 2023 17:06:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 12/14] RISC-V: Add initial support for T-Head C906
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Christoph Muellner <christoph.muellner@vrull.eu>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Philipp Tomsich
 <philipp.tomsich@vrull.eu>, =?UTF-8?Q?Heiko_St=c3=bcbner?=
 <heiko.stuebner@vrull.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Nelson Chu <nelson@rivosinc.com>, Kito Cheng <kito.cheng@sifive.com>,
 Cooper Qu <cooper.qu@linux.alibaba.com>,
 Lifang Xia <lifang_xia@linux.alibaba.com>,
 Yunhai Shang <yunhai@linux.alibaba.com>
References: <20230124195945.181842-1-christoph.muellner@vrull.eu>
 <20230124195945.181842-13-christoph.muellner@vrull.eu>
 <64af1437-b910-e5b3-c462-0ef0c416ba39@linaro.org>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <64af1437-b910-e5b3-c462-0ef0c416ba39@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.6;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-6.freemail.mail.aliyun.com
X-Spam_score_int: -99
X-Spam_score: -10.0
X-Spam_bar: ----------
X-Spam_report: (-10.0 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.092, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 30 Jan 2023 09:07:13 -0000


On 2023/1/25 5:26, Richard Henderson wrote:
> On 1/24/23 09:59, Christoph Muellner wrote:
>> +++ b/target/riscv/cpu.h
>> @@ -27,6 +27,7 @@
>>   #include "qom/object.h"
>>   #include "qemu/int128.h"
>>   #include "cpu_bits.h"
>> +#include "cpu_vendorid.h"
>
> I don't see that this ID is required for all users of riscv/cpu.h.
> This include should be limited to cpu.c.
>
OK. We can move it to cpu.c

Best Regards,
Zhiwei

>
> r~

