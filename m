Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB555C0015E
	for <qemu-riscv@archiver.kernel.org>; Fri, 28 Jul 2023 01:11:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qPBp2-0006yg-7j; Thu, 27 Jul 2023 20:59:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1qPBp0-0006y7-QH; Thu, 27 Jul 2023 20:59:10 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1qPBoy-00068A-0z; Thu, 27 Jul 2023 20:59:10 -0400
Received: from [192.168.0.120] (unknown [180.165.241.20])
 by APP-05 (Coremail) with SMTP id zQCowACHj+vLEsNkUWs1Dw--.8762S2;
 Fri, 28 Jul 2023 08:58:52 +0800 (CST)
Message-ID: <0d4a2904-7187-861a-9a7e-6e4c8b11c1c9@iscas.ac.cn>
Date: Fri, 28 Jul 2023 08:58:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Cc: liweiwei@iscas.ac.cn, Alistair.Francis@wdc.com, palmer@dabbelt.com,
 bin.meng@windriver.com, dbarboza@ventanamicro.com, qemu-riscv@nongnu.org
Subject: Re: [PATCH] target/riscv: Fix zfa fleq.d and fltq.d
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
References: <20230728003906.768-1-zhiwei_liu@linux.alibaba.com>
Content-Language: en-US
From: Weiwei Li <liweiwei@iscas.ac.cn>
In-Reply-To: <20230728003906.768-1-zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: zQCowACHj+vLEsNkUWs1Dw--.8762S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ur43Aw1DJF48tr4xKw1kuFg_yoW8GF4kpF
 s5CFyUKr4rJr93Aa40ya15Xry7Xa1Fgr4rG3sYyw43KF47JrZ8ur43Kr1agryUJrWvgrWF
 ya47A3ZxZ3y7JFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkm14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
 4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
 Y487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
 0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y
 0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
 WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
 IxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUoOJ5UUUUU
X-Originating-IP: [180.165.241.20]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.84; envelope-from=liweiwei@iscas.ac.cn;
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


On 2023/7/28 08:39, LIU Zhiwei wrote:
> Commit a47842d ("riscv: Add support for the Zfa extension") implemented the zfa extension.
> However, it has some typos for fleq.d and fltq.d. Both of them misused the fltq.s
> helper function.
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> ---

Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Weiwei Li

>   target/riscv/insn_trans/trans_rvzfa.c.inc | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvzfa.c.inc b/target/riscv/insn_trans/trans_rvzfa.c.inc
> index 2c715af3e5..0fdd2698f6 100644
> --- a/target/riscv/insn_trans/trans_rvzfa.c.inc
> +++ b/target/riscv/insn_trans/trans_rvzfa.c.inc
> @@ -470,7 +470,7 @@ bool trans_fleq_d(DisasContext *ctx, arg_fleq_d *a)
>       TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
>       TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
>   
> -    gen_helper_fltq_s(dest, cpu_env, src1, src2);
> +    gen_helper_fleq_d(dest, cpu_env, src1, src2);
>       gen_set_gpr(ctx, a->rd, dest);
>       return true;
>   }
> @@ -485,7 +485,7 @@ bool trans_fltq_d(DisasContext *ctx, arg_fltq_d *a)
>       TCGv_i64 src1 = get_fpr_hs(ctx, a->rs1);
>       TCGv_i64 src2 = get_fpr_hs(ctx, a->rs2);
>   
> -    gen_helper_fltq_s(dest, cpu_env, src1, src2);
> +    gen_helper_fltq_d(dest, cpu_env, src1, src2);
>       gen_set_gpr(ctx, a->rd, dest);
>       return true;
>   }


