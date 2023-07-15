Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5A6CEB64DC
	for <qemu-riscv@archiver.kernel.org>; Sat, 15 Jul 2023 02:18:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qKUrM-00070b-0Y; Fri, 14 Jul 2023 22:18:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1qKUrK-00070N-Ua; Fri, 14 Jul 2023 22:18:10 -0400
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1qKUr7-0006dK-OL; Fri, 14 Jul 2023 22:18:10 -0400
Received: from [192.168.0.120] (unknown [180.175.26.191])
 by APP-01 (Coremail) with SMTP id qwCowABHT4fDAbJkMiMpCw--.25657S2;
 Sat, 15 Jul 2023 10:17:39 +0800 (CST)
Message-ID: <10bfd3f9-956a-d84f-88ea-d58bfc639f22@iscas.ac.cn>
Date: Sat, 15 Jul 2023 10:17:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Cc: liweiwei@iscas.ac.cn, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org
Subject: Re: [PATCH for-8.2 v3 5/8] target/riscv/cpu.c: add a
 ADD_CPU_PROPERTIES_ARRAY() macro
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
References: <20230714174311.672359-1-dbarboza@ventanamicro.com>
 <20230714174311.672359-6-dbarboza@ventanamicro.com>
Content-Language: en-US
From: Weiwei Li <liweiwei@iscas.ac.cn>
In-Reply-To: <20230714174311.672359-6-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: qwCowABHT4fDAbJkMiMpCw--.25657S2
X-Coremail-Antispam: 1UD129KBjvJXoW7AF48ur47ZF43urW8ZF4rGrg_yoW8AF47pr
 W5CF4jva4rJF97J347XF4xCw1Utr1DGFWfKw4xKw1xZF45JrZ09r18Ka1aywnruFy09345
 uw1UuFnIyF47trJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
X-Originating-IP: [180.175.26.191]
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


On 2023/7/15 01:43, Daniel Henrique Barboza wrote:
> The code inside riscv_cpu_add_user_properties() became quite repetitive
> after recent changes. Add a macro to hide the repetition away.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---

Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Weiwei Li

>   target/riscv/cpu.c | 21 ++++++++++-----------
>   1 file changed, 10 insertions(+), 11 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 5689368f02..f7083b2d5c 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1875,6 +1875,13 @@ static void cpu_set_cfg_unavailable(Object *obj, Visitor *v,
>   }
>   #endif
>   
> +#define ADD_CPU_PROPERTIES_ARRAY(_dev, _array) \
> +    do { \
> +        for (int i = 0; i < ARRAY_SIZE(_array); i++) { \
> +            qdev_property_add_static(_dev, &_array[i]); \
> +        } \
> +    } while (0)
> +
>   /*
>    * Add CPU properties with user-facing flags.
>    *
> @@ -1918,17 +1925,9 @@ static void riscv_cpu_add_user_properties(Object *obj)
>           qdev_property_add_static(dev, prop);
>       }
>   
> -    for (int i = 0; i < ARRAY_SIZE(riscv_cpu_options); i++) {
> -        qdev_property_add_static(dev, &riscv_cpu_options[i]);
> -    }
> -
> -    for (int i = 0; i < ARRAY_SIZE(riscv_cpu_vendor_exts); i++) {
> -        qdev_property_add_static(dev, &riscv_cpu_vendor_exts[i]);
> -    }
> -
> -    for (int i = 0; i < ARRAY_SIZE(riscv_cpu_experimental_exts); i++) {
> -        qdev_property_add_static(dev, &riscv_cpu_experimental_exts[i]);
> -    }
> +    ADD_CPU_PROPERTIES_ARRAY(dev, riscv_cpu_options);
> +    ADD_CPU_PROPERTIES_ARRAY(dev, riscv_cpu_vendor_exts);
> +    ADD_CPU_PROPERTIES_ARRAY(dev, riscv_cpu_experimental_exts);
>   }
>   
>   static Property riscv_cpu_properties[] = {


