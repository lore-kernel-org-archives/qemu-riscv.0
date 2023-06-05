Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2FD0C77B73
	for <qemu-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 09:17:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q66KS-0001ug-IT; Mon, 05 Jun 2023 05:16:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1q66KP-0001u2-In; Mon, 05 Jun 2023 05:16:41 -0400
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1q66KM-0000Og-H7; Mon, 05 Jun 2023 05:16:41 -0400
Received: from [192.168.100.156] (unknown [117.61.117.136])
 by APP-01 (Coremail) with SMTP id qwCowAD3_fHnp31k3wWyCw--.18998S2;
 Mon, 05 Jun 2023 17:16:24 +0800 (CST)
Message-ID: <74719362-f97b-a32e-45bc-ef9eddfd721b@iscas.ac.cn>
Date: Mon, 5 Jun 2023 17:16:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] target/riscv: Smepmp: Return error when access permission
 not allowed in PMP
To: Himanshu Chauhan <hchauhan@ventanamicro.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20230605075150.367555-1-hchauhan@ventanamicro.com>
Content-Language: en-US
Cc: liweiwei@iscas.ac.cn
From: Weiwei Li <liweiwei@iscas.ac.cn>
In-Reply-To: <20230605075150.367555-1-hchauhan@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: qwCowAD3_fHnp31k3wWyCw--.18998S2
X-Coremail-Antispam: 1UD129KBjvJXoW7AFyktF4xCw4kKw17AryfCrg_yoW8Jw4fpr
 4rCryIkrZrtrZrXwn3tw1UWF13Ars3GFW7Wan7tryjka13ArWvkr1DKw429F1UJa4a9wn0
 9F4akF45AFWjqFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkm14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
 Y487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
 0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y
 0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
 WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
 IxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfU5WlkUUUUU
X-Originating-IP: [117.61.117.136]
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


On 2023/6/5 15:51, Himanshu Chauhan wrote:
> On an address match, skip checking for default permissions and return error
> based on access defined in PMP configuration.
>
> Fixes: 90b1fafce06 ("target/riscv: Smepmp: Skip applying default rules when address matches")
> Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
> ---
>   target/riscv/pmp.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index 418738afd8..6238528282 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -435,8 +435,8 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
>                * defined with PMP must be used. We shouldn't fallback on
>                * finding default privileges.
>                */
> -            ret = true;
> -            break;
> +            ret = ((privs & *allowed_privs) == privs ? true : false);
> +            goto _address_matched;

goto seems unnecessary. We can directly return (privs & *allowed_privs) 
== privs here.

And then we can directly return pmp_hart_has_privs_default(env, privs, 
allowed_privs, mode) after this loop.

Regards,

Weiwei Li

>           }
>       }
>   
> @@ -445,6 +445,7 @@ bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
>           ret = pmp_hart_has_privs_default(env, privs, allowed_privs, mode);

>       }
>   
> + _address_matched:
>       return ret;
>   }
>   


