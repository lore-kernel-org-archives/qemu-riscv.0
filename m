Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j1mH6-00070H-2F
	for mharc-qemu-riscv@gnu.org; Wed, 12 Feb 2020 02:17:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54107)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1j1mH1-0006yy-Lp
 for qemu-riscv@nongnu.org; Wed, 12 Feb 2020 02:17:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1j1mH0-0005nk-Qt
 for qemu-riscv@nongnu.org; Wed, 12 Feb 2020 02:17:27 -0500
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:56729)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1j1mGw-0005iU-GK; Wed, 12 Feb 2020 02:17:23 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.2234684|-1; CH=green;
 DM=CONTINUE|CONTINUE|true|0.323115-0.0237869-0.653098;
 DS=CONTINUE|ham_regular_dialog|0.0296133-0.00190767-0.968479;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03301; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=8; RT=8; SR=0; TI=SMTPD_---.GnBjSQy_1581491829; 
Received: from 192.168.3.18(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.GnBjSQy_1581491829)
 by smtp.aliyun-inc.com(10.147.42.198);
 Wed, 12 Feb 2020 15:17:10 +0800
Subject: Re: [PATCH v4 1/4] target/riscv: add vector extension field in
 CPURISCVState
To: Richard Henderson <richard.henderson@linaro.org>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200210081240.11481-1-zhiwei_liu@c-sky.com>
 <20200210081240.11481-2-zhiwei_liu@c-sky.com>
 <cc4d0b93-013f-5cf5-4ff4-248ab99eec70@linaro.org>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <04a3b70a-a28b-c2d8-89aa-1882cd5186a8@c-sky.com>
Date: Wed, 12 Feb 2020 15:17:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <cc4d0b93-013f-5cf5-4ff4-248ab99eec70@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 121.197.200.217
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
X-List-Received-Date: Wed, 12 Feb 2020 07:17:28 -0000



On 2020/2/11 23:53, Richard Henderson wrote:
> On 2/10/20 8:12 AM, LIU Zhiwei wrote:
>> The 32 vector registers will be viewed as a continuous memory block.
>> It avoids the convension between element index and (regno,offset).
>> Thus elements can be directly accessed by offset from the first vector
>> base address.
>>
>> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
>> ---
>>   target/riscv/cpu.h | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
> I still don't think you need to put stuff into a sub-structure.  These register
> names are unique in the manual, and not subdivided there.
OK. I will scatter these registers next patch.
>
> r~


