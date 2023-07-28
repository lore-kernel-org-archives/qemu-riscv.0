Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 904D0C0015E
	for <qemu-riscv@archiver.kernel.org>; Fri, 28 Jul 2023 01:06:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qPBsD-0007nm-2A; Thu, 27 Jul 2023 21:02:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1qPBsA-0007nX-IW; Thu, 27 Jul 2023 21:02:27 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1qPBs5-0006i0-SD; Thu, 27 Jul 2023 21:02:24 -0400
Received: from [192.168.0.120] (unknown [180.165.241.20])
 by APP-05 (Coremail) with SMTP id zQCowABHTxeYE8NkrY41Dw--.13401S2;
 Fri, 28 Jul 2023 09:02:16 +0800 (CST)
Message-ID: <1738f65f-8c6c-da9f-a073-60114d641045@iscas.ac.cn>
Date: Fri, 28 Jul 2023 09:02:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Cc: liweiwei@iscas.ac.cn, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
Subject: Re: [PATCH v6 09/12] target/riscv/cpu.c: limit cfg->vext_spec log
 message
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
References: <20230727220927.62950-1-dbarboza@ventanamicro.com>
 <20230727220927.62950-10-dbarboza@ventanamicro.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
In-Reply-To: <20230727220927.62950-10-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: zQCowABHTxeYE8NkrY41Dw--.13401S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KrWruw17Cw15Wr4kZFWfAFb_yoW8uFWrp3
 yUKrZF9Fn8tFnrZayftw1UJF4UGws8KF4kGw4rA3s8CF4ftFZrWryDtw12kFWxJFZ3CrWY
 k340gry3Zr4DtaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkl14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
 4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
 Y487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
 0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y
 0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
 W8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
 IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VU1a9aPUUUU
 U==
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


On 2023/7/28 06:09, Daniel Henrique Barboza wrote:
> Inside riscv_cpu_validate_v() we're always throwing a log message if the
> user didn't set a vector version via 'vext_spec'.
>
> We're going to include one case with the 'max' CPU where env->vext_ver
> will be set in the cpu_init(). But that alone will not stop the "vector
> version is not specified" message from appearing. The usefulness of this
> log message is debatable for the generic CPUs, but for a 'max' CPU type,
> where we are supposed to deliver a CPU model with all features possible,
> it's strange to force users to set 'vext_spec' to get rid of this
> message.
>
> Change riscv_cpu_validate_v() to not throw this log message if
> env->vext_ver is already set.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---

Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Weiwei Li

>   target/riscv/cpu.c | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 08f61ed051..01b0d228f5 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -939,8 +939,6 @@ static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
>   static void riscv_cpu_validate_v(CPURISCVState *env, RISCVCPUConfig *cfg,
>                                    Error **errp)
>   {
> -    int vext_version = VEXT_VERSION_1_00_0;
> -
>       if (!is_power_of_2(cfg->vlen)) {
>           error_setg(errp, "Vector extension VLEN must be power of 2");
>           return;
> @@ -963,17 +961,18 @@ static void riscv_cpu_validate_v(CPURISCVState *env, RISCVCPUConfig *cfg,
>       }
>       if (cfg->vext_spec) {
>           if (!g_strcmp0(cfg->vext_spec, "v1.0")) {
> -            vext_version = VEXT_VERSION_1_00_0;
> +            env->vext_ver = VEXT_VERSION_1_00_0;
>           } else {
>               error_setg(errp, "Unsupported vector spec version '%s'",
>                          cfg->vext_spec);
>               return;
>           }
> -    } else {
> +    } else if (env->vext_ver == 0) {
>           qemu_log("vector version is not specified, "
>                    "use the default value v1.0\n");
> +
> +        env->vext_ver = VEXT_VERSION_1_00_0;
>       }
> -    env->vext_ver = vext_version;
>   }
>   
>   static void riscv_cpu_validate_priv_spec(RISCVCPU *cpu, Error **errp)


