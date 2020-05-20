Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jbEgA-0006B5-CW
	for mharc-qemu-riscv@gnu.org; Tue, 19 May 2020 22:41:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jbEg8-0006AV-4M; Tue, 19 May 2020 22:41:56 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:42595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jbEg6-0002si-6N; Tue, 19 May 2020 22:41:55 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.08818989|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.0330162-0.000783601-0.9662;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03278; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=9; RT=9; SR=0; TI=SMTPD_---.HaxZbRD_1589942506; 
Received: from 30.225.208.54(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.HaxZbRD_1589942506)
 by smtp.aliyun-inc.com(10.147.41.231);
 Wed, 20 May 2020 10:41:50 +0800
Subject: Re: [RFC PATCH 1/8] riscv: Add RV64I instructions description
To: Richard Henderson <richard.henderson@linaro.org>, peter.maydell@linaro.org
Cc: alistair23@gmail.com, palmer@dabbelt.com, wenmeng_zhang@c-sky.com,
 wxy194768@alibaba-inc.com, qemu-devel@nongnu.org, alex.bennee@linaro.org,
 qemu-riscv@nongnu.org
References: <20200430072139.4602-1-zhiwei_liu@c-sky.com>
 <20200430072139.4602-2-zhiwei_liu@c-sky.com>
 <eb866cde-b8c1-f722-d364-1ae015bb277d@linaro.org>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <c776b7f2-ceda-4ab8-b006-698dd41fcc48@c-sky.com>
Date: Wed, 20 May 2020 10:41:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <eb866cde-b8c1-f722-d364-1ae015bb277d@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=121.197.200.217;
 envelope-from=zhiwei_liu@c-sky.com; helo=smtp2200-217.mail.aliyun.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/19 21:46:04
X-ACL-Warn: Detected OS   = Linux 3.x [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, UNPARSEABLE_RELAY=0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Wed, 20 May 2020 02:41:56 -0000



On 2020/5/12 0:39, Richard Henderson wrote:
> On 4/30/20 12:21 AM, LIU Zhiwei wrote:
>> +LUI RISCV imm:20 rd:5 0110111 \
>> +!constraints { $rd != 2 && $rd != 3 && $rd != 4 }
> I think it would be helpful to add a function for this.  e.g. greg($rd) and
> gbase($rs1) (including $0).  It would keep the constraints smaller, and avoid
> mistakes.
>
> These functions would go into risugen_riscv.pm.
Good idea. I will take it next patch set.
>> +ADDI RISCV imm:12 rs1:5 000 rd:5 0010011 \
>> +!constraints { $rd != 2 && $rd != 3 && $rd != 4 && $rs1 != 2 }
> Since all of sp, gp, tp are not in risu's control, why is rs1 only excluding
> sp, and not gp and tp as well?
When I test the patch set, I find gp and tp will be the same in slave 
and master，
so they can be used as source register.

I will check it again in next patch set test.

Zhiwei
>
> r~


