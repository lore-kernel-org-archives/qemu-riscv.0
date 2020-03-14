Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jCz1G-0004xg-68
	for mharc-qemu-riscv@gnu.org; Sat, 14 Mar 2020 01:07:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38915)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jCz1C-0004wy-GP
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 01:07:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1jCz1B-0006P7-GO
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 01:07:26 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:44107)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jCz16-0005vt-Ek; Sat, 14 Mar 2020 01:07:20 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.08367646|-1; CH=green; DM=||false|;
 DS=CONTINUE|ham_system_inform|0.0390597-0.00044043-0.9605;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03310; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=9; RT=9; SR=0; TI=SMTPD_---.H.CxW73_1584162424; 
Received: from 192.168.3.18(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.H.CxW73_1584162424)
 by smtp.aliyun-inc.com(10.147.41.199);
 Sat, 14 Mar 2020 13:07:05 +0800
Subject: Re: [PATCH v5 08/60] target/riscv: add vector amo operations
To: Richard Henderson <richard.henderson@linaro.org>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
 <20200312145900.2054-9-zhiwei_liu@c-sky.com>
 <ca349778-4672-6887-15c5-a825702023d9@linaro.org>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <cc9a63ce-01bd-d410-c099-d7aef1384242@c-sky.com>
Date: Sat, 14 Mar 2020 13:07:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <ca349778-4672-6887-15c5-a825702023d9@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Sat, 14 Mar 2020 05:07:27 -0000



On 2020/3/14 12:28, Richard Henderson wrote:
> On 3/12/20 7:58 AM, LIU Zhiwei wrote:
>> +    static gen_helper_amo *const fnsw[9] = {
> ...
>> +    static gen_helper_amo *const fnsd[18] = {
> ...
>> +        fn = fnsw[seq];
>> +#ifdef TARGET_RISCV64
>> +        if (s->sew == 3) {
>> +            fn = fnsd[seq];
>> +
>> +#endif
> This indexing is wrong, since for seq == 11 you index past the end of fnsw[].
Yes, it really a security bug.  Thanks for pointing that.

Zhiwei
> You need something like
>
>      if (s->sew == 3) {
> #ifdef TARGET_RISCV64
>          fn = fnsd[seq];
> #else
>          /* Check done in amo_check(). */
>          g_assert_not_reached();
> #endif
>      } else {
>          fn = fnsw[seq];
>      }
> Otherwise it looks ok.
>
>
> r~


