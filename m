Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0668BC77B75
	for <qemu-riscv@archiver.kernel.org>; Tue, 23 May 2023 14:44:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q1TF0-0007a9-MV; Tue, 23 May 2023 10:43:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1q1TEx-0007Xp-Tk; Tue, 23 May 2023 10:43:55 -0400
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1q1TEv-0007xU-8n; Tue, 23 May 2023 10:43:55 -0400
Received: from [192.168.0.120] (unknown [61.165.37.98])
 by APP-01 (Coremail) with SMTP id qwCowAAn36Ie0WxkBGYDBA--.32247S2;
 Tue, 23 May 2023 22:43:42 +0800 (CST)
Message-ID: <a1c36ae3-7875-0178-fcca-33abed1816f2@iscas.ac.cn>
Date: Tue, 23 May 2023 22:43:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Cc: liweiwei@iscas.ac.cn, frank.chang@sifive.com, alistair.francis@wdc.com,
 apatel@ventanamicro.com, palmer@rivosinc.com, dbarboza@ventanamicro.com,
 bin.meng@windriver.com, zhiwei_liu@linux.alibaba.com
Subject: Re: [PATCH 2/2] hw/intc: riscv_imsic: Refresh the CSRs xml after
 updating the state of the cpu.
Content-Language: en-US
To: Tommy Wu <tommy.wu@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20230523114454.717708-1-tommy.wu@sifive.com>
 <20230523114454.717708-3-tommy.wu@sifive.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
In-Reply-To: <20230523114454.717708-3-tommy.wu@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: qwCowAAn36Ie0WxkBGYDBA--.32247S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cw4kZF4xtw1xWr1xtF1UZFb_yoW8JFyDpr
 Z3Ca9Ikw1ktFyxu39ayr18ZF45Zrn8WrWYgF98C3yUX3y5Xa1rtrnFkw18AF1DWa4Fvr1a
 vF1UKFWjkFnrAaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9K14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kI
 c2xKxwCYjI0SjxkI62AI1cAE67vIY487MxkIecxEwVAFwVW5XwCF04k20xvY0x0EwIxGrw
 CFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE
 14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2
 IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxK
 x2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI
 0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjfUrpBTUUUUU
X-Originating-IP: [61.165.37.98]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.089,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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


On 2023/5/23 19:44, Tommy Wu wrote:
> Originally, when we set the ext_smaia to true, we still cannot print the
> AIA CSRs in the remote gdb debugger, because the dynamic CSR xml is
> generated when the cpu is realized.
>
> This patch refreshes the dynamic CSR xml after we update the ext_smaia,
> so that we can print the AIA CSRs in the remote gdb debugger.
>
> Signed-off-by: Tommy Wu <tommy.wu@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> ---
>   hw/intc/riscv_imsic.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/hw/intc/riscv_imsic.c b/hw/intc/riscv_imsic.c
> index fea3385b51..97a51d535b 100644
> --- a/hw/intc/riscv_imsic.c
> +++ b/hw/intc/riscv_imsic.c
> @@ -350,6 +350,10 @@ static void riscv_imsic_realize(DeviceState *dev, Error **errp)
>           } else {
>               rcpu->cfg.ext_smaia = true;
>           }
> +
> +        /* Refresh the dynamic csr xml for the gdbstub. */
> +        riscv_refresh_dynamic_csr_xml(cpu);
> +

There is an assert in riscv_refresh_dynamic_csr_xml():

+    if (!cpu->dyn_csr_xml) {
+        g_assert_not_reached();
+    }

So I think riscv_refresh_dynamic_csr_xml() can only be called when 
cpu->dyn_csr_xml is true here.

Regards,

Weiwei Li

>           riscv_cpu_set_aia_ireg_rmw_fn(env, (imsic->mmode) ? PRV_M : PRV_S,
>                                         riscv_imsic_rmw, imsic);
>       }


