Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jynUg-000803-6R
	for mharc-qemu-riscv@gnu.org; Thu, 23 Jul 2020 22:31:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jynUe-0007zm-I2; Thu, 23 Jul 2020 22:31:28 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:41692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jynUa-0006k7-P8; Thu, 23 Jul 2020 22:31:28 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1524953|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.0206393-0.00202531-0.977335;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03307; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=5; RT=5; SR=0; TI=SMTPD_---.I6ihQM9_1595557871; 
Received: from 30.225.208.37(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.I6ihQM9_1595557871)
 by smtp.aliyun-inc.com(10.147.41.138);
 Fri, 24 Jul 2020 10:31:12 +0800
Subject: Re: [PATCH v2 0/7] target/riscv: NaN-boxing for multiple precison
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: frank.chang@sifive.com, qemu-riscv@nongnu.org, alistair23@gmail.com
References: <20200724002807.441147-1-richard.henderson@linaro.org>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <4c5a8910-f6c1-a29f-b258-a0b83376bcb4@c-sky.com>
Date: Fri, 24 Jul 2020 10:31:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200724002807.441147-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=121.197.200.217;
 envelope-from=zhiwei_liu@c-sky.com; helo=smtp2200-217.mail.aliyun.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/23 22:31:14
X-ACL-Warn: Detected OS   = Linux 3.x [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, UNPARSEABLE_RELAY=0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 24 Jul 2020 02:31:28 -0000



On 2020/7/24 8:28, Richard Henderson wrote:
> This is my take on Liu Zhiwei's patch set:
> https://patchew.org/QEMU/20200626205917.4545-1-zhiwei_liu@c-sky.com
>
> This differs from Zhiwei's v1 in:
>
>   * If a helper is involved, the helper does the boxing and unboxing.
>
>   * Which leaves only LDW and FSGN*.S as the only instructions that
>     are expanded inline which need to handle nanboxing.
>
>   * All mention of RVD is dropped vs boxing.  This means that an
>     RVF-only cpu will still generate and check nanboxes into the
>     64-bit cpu_fpu slots.  There should be no way an RVF-only cpu
>     can generate an unboxed cpu_fpu value.
>
>     This choice is made to speed up the common case: RVF+RVD, so
>     that we do not have to check whether RVD is enabled.
>
>   * The translate.c primitives take TCGv values rather than fpu
>     regno, which will make it possible to use them with RVV,
>     since v0.9 does proper nanboxing.
Agree.

And I think this patch set should be applied  if possible, because it is 
bug fix.
>   * I have adjusted the current naming to be float32 specific ("*_s"),
>     to avoid confusion with the float16 data type supported by RVV.
It's OK.

A more general function with flen is better in my opinion. So that it 
can be used
everywhere, both in scalar and vector instructions, even the future fp16 or
bf16 instructions.

Zhiwei
>
> r~
>
>
> LIU Zhiwei (2):
>    target/riscv: Clean up fmv.w.x
>    target/riscv: check before allocating TCG temps
>
> Richard Henderson (5):
>    target/riscv: Generate nanboxed results from fp helpers
>    target/riscv: Generalize gen_nanbox_fpr to gen_nanbox_s
>    target/riscv: Generate nanboxed results from trans_rvf.inc.c
>    target/riscv: Check nanboxed inputs to fp helpers
>    target/riscv: Check nanboxed inputs in trans_rvf.inc.c
>
>   target/riscv/internals.h                |  16 ++++
>   target/riscv/fpu_helper.c               | 102 ++++++++++++++++--------
>   target/riscv/insn_trans/trans_rvd.inc.c |   8 +-
>   target/riscv/insn_trans/trans_rvf.inc.c |  99 ++++++++++++++---------
>   target/riscv/translate.c                |  29 +++++++
>   5 files changed, 178 insertions(+), 76 deletions(-)
>


