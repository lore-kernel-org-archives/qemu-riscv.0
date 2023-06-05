Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CECE3C77B73
	for <qemu-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 12:18:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q69AD-0000GO-Vl; Mon, 05 Jun 2023 08:18:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1q699t-0000Dc-Gr; Mon, 05 Jun 2023 08:18:09 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1q699q-0000KH-RA; Mon, 05 Jun 2023 08:18:01 -0400
Received: from [192.168.100.156] (unknown [117.61.108.62])
 by APP-05 (Coremail) with SMTP id zQCowABHTopr0n1kGBm5Cw--.10453S2;
 Mon, 05 Jun 2023 20:17:48 +0800 (CST)
Message-ID: <f5ca60ac-cff4-ee9b-f845-af8188b9d041@iscas.ac.cn>
Date: Mon, 5 Jun 2023 20:17:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] target/riscv: Smepmp: Return error when access
 permission not allowed in PMP
Content-Language: en-US
To: Himanshu Chauhan <hchauhan@ventanamicro.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20230605075150.367555-1-hchauhan@ventanamicro.com>
 <20230605114934.2649023-1-hchauhan@ventanamicro.com>
Cc: liweiwei@iscas.ac.cn
From: Weiwei Li <liweiwei@iscas.ac.cn>
In-Reply-To: <20230605114934.2649023-1-hchauhan@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowABHTopr0n1kGBm5Cw--.10453S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cw47XF1rAw47uF45tw4DCFg_yoW8Ar1fpr
 1rAryxCFZ7trZ7X3WfCr1UGFWUArnxGa1Uua97Ja4qka13ArZY9r1qgw4a9F1DJayfuwn0
 9F4jkF47Zr4jqFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkm14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
 6r4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
 Y487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
 0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y
 0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
 WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
 IxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfU5WlkUUUUU
X-Originating-IP: [117.61.108.62]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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


On 2023/6/5 19:49, Himanshu Chauhan wrote:
> On an address match, skip checking for default permissions and return error
> based on access defined in PMP configuration.
>
> v2 Changes:
> o Removed goto to return in place when address matches
> o Call pmp_hart_has_privs_default at the end of the loop
>
> Fixes: 90b1fafce06 ("target/riscv: Smepmp: Skip applying default rules when address matches")
> Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
> ---
>   target/riscv/pmp.c | 10 ++--------
>   1 file changed, 2 insertions(+), 8 deletions(-)
>
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index 418738afd8..976b199156 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -291,7 +291,6 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
>                           pmp_priv_t *allowed_privs, target_ulong mode)
>   {
>       int i = 0;
> -    bool ret = false;
>       int pmp_size = 0;
>       target_ulong s = 0;
>       target_ulong e = 0;
> @@ -435,17 +434,12 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
>                * defined with PMP must be used. We shouldn't fallback on
>                * finding default privileges.
>                */
> -            ret = true;
> -            break;
> +            return (privs & *allowed_privs) == privs ? true : false;

This conditional assignment is unnecessary.

+                                  return  (privs & *allowed_privs) == 
privs;

Otherwise, Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Weiwei Li

>           }
>       }
>   
>       /* No rule matched */
> -    if (!ret) {
> -        ret = pmp_hart_has_privs_default(env, privs, allowed_privs, mode);
> -    }
> -
> -    return ret;
> +    return pmp_hart_has_privs_default(env, privs, allowed_privs, mode);
>   }
>   
>   /*


