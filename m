Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jbDoH-0004o1-IB
	for mharc-qemu-riscv@gnu.org; Tue, 19 May 2020 21:46:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jbDoF-0004nZ-0Y; Tue, 19 May 2020 21:46:15 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:37254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jbDoC-0000V7-Oh; Tue, 19 May 2020 21:46:14 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1275078|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.0184575-0.00084914-0.980693;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03267; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=9; RT=9; SR=0; TI=SMTPD_---.HawMO8X_1589939155; 
Received: from 30.225.208.54(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.HawMO8X_1589939155)
 by smtp.aliyun-inc.com(10.147.43.95); Wed, 20 May 2020 09:45:57 +0800
Subject: Re: [RFC PATCH 6/8] riscv: Add configure script
To: Richard Henderson <richard.henderson@linaro.org>, peter.maydell@linaro.org
Cc: alistair23@gmail.com, palmer@dabbelt.com, wenmeng_zhang@c-sky.com,
 wxy194768@alibaba-inc.com, qemu-devel@nongnu.org, alex.bennee@linaro.org,
 qemu-riscv@nongnu.org
References: <20200430072139.4602-1-zhiwei_liu@c-sky.com>
 <20200430072139.4602-7-zhiwei_liu@c-sky.com>
 <a434ed23-5102-b39b-8fff-0f60e493e488@linaro.org>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <6aa1a054-4ce9-2794-7a52-236f4a38df2d@c-sky.com>
Date: Wed, 20 May 2020 09:45:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <a434ed23-5102-b39b-8fff-0f60e493e488@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: none client-ip=121.197.200.217;
 envelope-from=zhiwei_liu@c-sky.com; helo=smtp2200-217.mail.aliyun.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/19 21:46:04
X-ACL-Warn: Detected OS   = Linux 3.x [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 UNPARSEABLE_RELAY=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Wed, 20 May 2020 01:46:15 -0000


On 2020/5/12 2:06, Richard Henderson wrote:
> On 4/30/20 12:21 AM, LIU Zhiwei wrote:
>> +++ b/configure
>> @@ -58,6 +58,8 @@ guess_arch() {
>>           ARCH="m68k"
>>       elif check_define __powerpc64__ ; then
>>           ARCH="ppc64"
>> +    elif check_define __riscv ; then
>> +        ARCH="riscv64"
>>       else
>>           echo "This cpu is not supported by risu. Try -h. " >&2
>>           exit 1
> Why "riscv64" and not "riscv"?
>
> You can't really say more without checking __riscv_xlen.
Thanks for point it out. I will add support for RV32 next patch set.

Zhiwei
>
> r~


