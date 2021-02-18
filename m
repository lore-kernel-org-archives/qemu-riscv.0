Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lCeqd-0001r5-0f
	for mharc-qemu-riscv@gnu.org; Thu, 18 Feb 2021 03:39:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lCeqa-0001qh-W7; Thu, 18 Feb 2021 03:39:41 -0500
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:34408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lCeqT-0007wr-W1; Thu, 18 Feb 2021 03:39:39 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1301226|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.00959936-0.00175322-0.988647;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047211; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=5; RT=5; SR=0; TI=SMTPD_---.Ja7B.r-_1613637558; 
Received: from 30.225.208.61(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.Ja7B.r-_1613637558)
 by smtp.aliyun-inc.com(10.147.41.178);
 Thu, 18 Feb 2021 16:39:18 +0800
Subject: Re: [PATCH 04/38] target/riscv: 16-bit Addition & Subtraction
 Instructions
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair23@gmail.com, palmer@dabbelt.com
References: <20210212150256.885-1-zhiwei_liu@c-sky.com>
 <20210212150256.885-5-zhiwei_liu@c-sky.com>
 <d9715335-51a3-eb08-c04f-7a7ce6858ac7@linaro.org>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <2144374b-8101-f307-6109-3775378226de@c-sky.com>
Date: Thu, 18 Feb 2021 16:39:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <d9715335-51a3-eb08-c04f-7a7ce6858ac7@linaro.org>
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
X-List-Received-Date: Thu, 18 Feb 2021 08:39:41 -0000

On 2021/2/13 2:03, Richard Henderson wrote:
> On 2/12/21 7:02 AM, LIU Zhiwei wrote:
>> +    if (a->rd && a->rs1 && a->rs2) {
>> +#ifdef TARGET_RISCV64
>> +        f64(vece, offsetof(CPURISCVState, gpr[a->rd]),
>> +            offsetof(CPURISCVState, gpr[a->rs1]),
>> +            offsetof(CPURISCVState, gpr[a->rs2]),
>> +            8, 8);
>> +#else
> This is not legal tcg.
>
> You cannot reference as memory anything which has an associated tcg_global_mem.
Thanks.

Do you mean referring  a global TCGTemp as memory will cause not 
consistent between TCGContext::temps and
CPUArchState field?

Zhiwei
>   Which is true for all of the gprs -- see riscv_translate_init.
>
>
> r~


