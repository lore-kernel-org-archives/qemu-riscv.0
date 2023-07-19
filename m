Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66EDBEB64DC
	for <qemu-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 01:18:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qLvpb-0001Qa-2D; Tue, 18 Jul 2023 21:18:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1qLvpY-0001Oy-8y; Tue, 18 Jul 2023 21:18:16 -0400
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1qLvpV-0007wI-Lq; Tue, 18 Jul 2023 21:18:16 -0400
Received: from [192.168.0.120] (unknown [180.175.26.191])
 by APP-03 (Coremail) with SMTP id rQCowADn7mbGObdkxnRdDA--.201S2;
 Wed, 19 Jul 2023 09:17:59 +0800 (CST)
Message-ID: <6637f196-5771-6df1-9297-f872460ad60c@iscas.ac.cn>
Date: Wed, 19 Jul 2023 09:17:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Cc: liweiwei@iscas.ac.cn, qemu-riscv@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: Re: [PATCH v2] target/riscv: Fix LMUL check to use VLEN
To: Rob Bradford <rbradford@rivosinc.com>, qemu-devel@nongnu.org
References: <20230718131316.12283-2-rbradford@rivosinc.com>
Content-Language: en-US
From: Weiwei Li <liweiwei@iscas.ac.cn>
In-Reply-To: <20230718131316.12283-2-rbradford@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowADn7mbGObdkxnRdDA--.201S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJryktFWrJFWrAFyUXr1rCrg_yoW8AF4DpF
 W8CrW29aykJFZ7u3W2q3WYvw4ruFWrKrWUCwn3A34UC3s8Gr4vvF1kKanruF48ArWfCr42
 ga4j9a1fZ3yYyaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkm14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
 4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
 Y487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
 0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y
 0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
 WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
 IxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUoOJ5UUUUU
X-Originating-IP: [180.175.26.191]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.81; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.095,
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


On 2023/7/18 21:11, Rob Bradford wrote:
> The previous check was failing with:
>
> VLEN=128 ELEN = 64 SEW = 16 and LMUL = 1/8 which is a
> valid combination.
>
> Fix the check to allow valid combinations when VLEN is a multiple of
> ELEN.
>
>  From the specification:
>
> "In general, the requirement is to support LMUL ≥ SEWMIN/ELEN, where
> SEWMIN is the narrowest supported SEW value and ELEN is the widest
> supported SEW value. In the standard extensions, SEWMIN=8. For standard
> vector extensions with ELEN=32, fractional LMULs of 1/2 and 1/4 must be
> supported. For standard vector extensions with ELEN=64, fractional LMULs
> of 1/2, 1/4, and 1/8 must be supported." Elsewhere in the specification
> it makes clear that VLEN>=ELEN.
>
>  From inspection this new check allows:
>
> VLEN=ELEN=64 1/2, 1/4, 1/8 for SEW >=8
> VLEN=ELEN=32 1/2, 1/4 for SEW >=8
>
> Fixes: d9b7609a1fb2 ("target/riscv: rvv-1.0: configure instructions")
>
> Signed-off-by: Rob Bradford <rbradford@rivosinc.com>
> ---
> V2: Switch check to use VLEN and active SEW vs ELEN and minimum SEW
> ---

Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Weiwei Li

>   target/riscv/vector_helper.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index cfacf2ebba..4d06754826 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -43,9 +43,9 @@ target_ulong HELPER(vsetvl)(CPURISCVState *env, target_ulong s1,
>                                               xlen - 1 - R_VTYPE_RESERVED_SHIFT);
>   
>       if (lmul & 4) {
> -        /* Fractional LMUL. */
> +        /* Fractional LMUL - check LMUL * VLEN >= SEW */
>           if (lmul == 4 ||
> -            cpu->cfg.elen >> (8 - lmul) < sew) {
> +            cpu->cfg.vlen >> (8 - lmul) < sew) {
>               vill = true;
>           }
>       }


