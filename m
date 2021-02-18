Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lCeye-0003Vq-IS
	for mharc-qemu-riscv@gnu.org; Thu, 18 Feb 2021 03:48:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lCeyc-0003VB-OK; Thu, 18 Feb 2021 03:47:58 -0500
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:43507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lCeyY-0003Vr-Q5; Thu, 18 Feb 2021 03:47:58 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1164967|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_news_journal|0.00841209-0.00110434-0.990484;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047209; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=5; RT=5; SR=0; TI=SMTPD_---.Ja7EViq_1613638063; 
Received: from 30.225.208.61(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.Ja7EViq_1613638063)
 by smtp.aliyun-inc.com(10.147.42.135);
 Thu, 18 Feb 2021 16:47:43 +0800
Subject: Re: [PATCH 04/38] target/riscv: 16-bit Addition & Subtraction
 Instructions
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair23@gmail.com, palmer@dabbelt.com
References: <20210212150256.885-1-zhiwei_liu@c-sky.com>
 <20210212150256.885-5-zhiwei_liu@c-sky.com>
 <7e459e06-7405-e01c-02c7-79dabf4ceb70@linaro.org>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <7d1489ee-1be5-08d7-4708-7ef22e49ce64@c-sky.com>
Date: Thu, 18 Feb 2021 16:47:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <7e459e06-7405-e01c-02c7-79dabf4ceb70@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=121.197.200.217;
 envelope-from=zhiwei_liu@c-sky.com; helo=smtp2200-217.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
X-List-Received-Date: Thu, 18 Feb 2021 08:47:59 -0000



On 2021/2/13 3:02, Richard Henderson wrote:
> On 2/12/21 7:02 AM, LIU Zhiwei wrote:
>> +static void tcg_gen_simd_add16(TCGv d, TCGv a, TCGv b)
>> +{
>> +    TCGv t1 = tcg_temp_new();
>> +    TCGv t2 = tcg_temp_new();
>> +
>> +    tcg_gen_andi_tl(t1, a, ~0xffff);
>> +    tcg_gen_add_tl(t2, a, b);
>> +    tcg_gen_add_tl(t1, t1, b);
>> +    tcg_gen_deposit_tl(d, t1, t2, 0, 16);
>> +
>> +    tcg_temp_free(t1);
>> +    tcg_temp_free(t2);
>> +}
> I will note that there are some helper functions, e.g. tcg_gen_vec_add16_i64
> (see the end of include/tcg/tcg-op-gvec.h), but those are explicitly i64, and
> you'll still need these for rv32.
Hi Richard,

Yes, that's really what I need.
Do you mind  continue to review the other patches in v1? Or should I 
send a v2 to fix current error at first?

Zhiwei
>
> r~


