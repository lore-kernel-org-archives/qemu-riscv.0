Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50A02EB64DC
	for <qemu-riscv@archiver.kernel.org>; Thu,  6 Jul 2023 13:22:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qHOwW-0003JG-Qb; Thu, 06 Jul 2023 09:22:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1qHOwV-0003IN-7E; Thu, 06 Jul 2023 09:22:43 -0400
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1qHOwS-0008Ej-8e; Thu, 06 Jul 2023 09:22:42 -0400
Received: from [192.168.0.120] (unknown [114.95.176.74])
 by APP-01 (Coremail) with SMTP id qwCowAB3fwsRwKZkROHtCA--.26543S2;
 Thu, 06 Jul 2023 21:22:26 +0800 (CST)
Message-ID: <dfc75d1f-f28d-7d2c-26f9-72086ffb54ca@iscas.ac.cn>
Date: Thu, 6 Jul 2023 21:22:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Cc: liweiwei@iscas.ac.cn, qemu-riscv@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: Re: [PATCH] target/riscv: Fix LMUL check to use minimum SEW
To: Rob Bradford <rbradford@rivosinc.com>, qemu-devel@nongnu.org
References: <20230706104433.16264-1-rbradford@rivosinc.com>
Content-Language: en-US
From: Weiwei Li <liweiwei@iscas.ac.cn>
In-Reply-To: <20230706104433.16264-1-rbradford@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAB3fwsRwKZkROHtCA--.26543S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CrWrXr1DXFyrCFWxGrW7urg_yoW8KFWDpF
 4UCFW29FykXayxu3Z29w4jqw45ZFW8KFWjkwnYv34UA345GryvvFn8K3ZrZF18JFyfAryj
 qa4jv3WfZ398AaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkm14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
 6r4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
 Y487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
 0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y
 0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
 WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
 IxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUoOJ5UUUUU
X-Originating-IP: [114.95.176.74]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.091,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org


On 2023/7/6 18:44, Rob Bradford wrote:
> The previous check was failing with:
>
> ELEN = 64 SEW = 16 and LMUL = 1/8 (encoded as 5) which is a valid
> combination.
>
> Fix the check to correctly match the specification by using minimum SEW
> rather than the active SEW.
>
>  From the specification:
>
> "In general, the requirement is to support LMUL ≥ SEWMIN/ELEN, where
> SEWMIN is the narrowest supported SEW value and ELEN is the widest
> supported SEW value. In the standard extensions, SEWMIN=8. For standard
> vector extensions with ELEN=32, fractional LMULs of 1/2 and 1/4 must be
> supported. For standard vector extensions with ELEN=64, fractional LMULs
> of 1/2, 1/4, and 1/8 must be supported."
>
>  From inspection this new check allows:
>
> ELEN=64 1/2, 1/4, 1/8 (encoded as 7, 6, 5 respectfully)
> ELEN=32 1/2, 1/4 (encoded as 7 and 6 respectfully)

This is a little confusing.  there is  note in spec to explain why  LMUL 
≥ SEW MIN /ELEN:

"When LMUL < SEW MIN /ELEN, there is no guarantee an implementation 
would have enough bits in the fractional vector register to store

Note at least one element, as VLEN=ELEN is a valid implementation 
choice. For example, with VLEN=ELEN=32, and SEW MIN =8, an LMUL of

1/8 would only provide four bits of storage in a vector register."

In this way, when VLEN=ELEN=64,  an LMUL of 1/8 would only provide 8 
bits of storage in a vector register, so it's also not suitable for sew 
= 16.

Maybe we can explain the above description of the spec in another way: 
we must support lmul=1/8 when ELEN=64, but it's only available when sew = 8.

Regards,

Weiwei Li

`

Regards,

Weiwei Li

>
> Fixes: d9b7609a1fb2 ("target/riscv: rvv-1.0: configure instructions")
>
> Signed-off-by: Rob Bradford <rbradford@rivosinc.com>
> ---
>   target/riscv/vector_helper.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 1e06e7447c..8dfd8fe484 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -43,9 +43,9 @@ target_ulong HELPER(vsetvl)(CPURISCVState *env, target_ulong s1,
>                                               xlen - 1 - R_VTYPE_RESERVED_SHIFT);
>   
>       if (lmul & 4) {
> -        /* Fractional LMUL. */
> +        /* Fractional LMUL - check LMUL >= ELEN/SEW_MIN (8) */
>           if (lmul == 4 ||
> -            cpu->cfg.elen >> (8 - lmul) < sew) {
> +            cpu->cfg.elen >> (8 - lmul) < 8) {
>               vill = true;
>           }
>       }


