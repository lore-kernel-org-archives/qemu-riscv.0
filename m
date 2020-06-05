Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jh2Wz-00037e-Jz
	for mharc-qemu-riscv@gnu.org; Thu, 04 Jun 2020 22:56:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jh2Wy-00037S-0Z; Thu, 04 Jun 2020 22:56:28 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:54710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jh2Wx-00028I-3U; Thu, 04 Jun 2020 22:56:27 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.08851187|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_enroll_verification|0.0108073-0.000526368-0.988666;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03267; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=7; RT=7; SR=0; TI=SMTPD_---.HiLnHZs_1591325782; 
Received: from 30.225.208.46(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.HiLnHZs_1591325782) by smtp.aliyun-inc.com(10.147.40.2);
 Fri, 05 Jun 2020 10:56:22 +0800
Subject: Re: [PATCH v8 40/62] target/riscv: vector floating-point compare
 instructions
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, palmer@dabbelt.com, wenmeng_zhang@c-sky.com,
 wxy194768@alibaba-inc.com
References: <20200521094413.10425-1-zhiwei_liu@c-sky.com>
 <20200521094413.10425-41-zhiwei_liu@c-sky.com>
 <ae22d15e-9899-e2e7-ee91-9ea445e7a40f@linaro.org>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <2139f4a1-2270-634b-5aef-242ea2c50934@c-sky.com>
Date: Fri, 5 Jun 2020 10:56:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <ae22d15e-9899-e2e7-ee91-9ea445e7a40f@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: none client-ip=121.197.200.217;
 envelope-from=zhiwei_liu@c-sky.com; helo=smtp2200-217.mail.aliyun.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/04 22:19:39
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
X-List-Received-Date: Fri, 05 Jun 2020 02:56:28 -0000



On 2020/6/5 4:51, Richard Henderson wrote:
> On 5/21/20 2:43 AM, LIU Zhiwei wrote:
>> +static uint8_t float16_eq_quiet(uint16_t a, uint16_t b, float_status *s)
> Return bool, better than uint8_t.
Yes.
>
>> +{
>> +    int compare = float16_compare_quiet(a, b, s);
> New since your last revision is that compare should be type FloatRelation.
>
> And similarly for the other 13 comparison helpers.
OK. I will use the FloatRelation in next patch set.
>> +        vext_set_elem_mask(vd, mlen, i, DO_OP(s2, (ETYPE)s1,        \
>> +                           &env->fp_status));                       \
> Indentation is off.  env->fp_status should align with DO_OP.
Yes. Thanks.

Zhiwei
>
> With that,
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
> r~


