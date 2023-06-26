Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA344EB64D7
	for <qemu-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 10:56:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qDjtU-0002Lj-3q; Mon, 26 Jun 2023 06:56:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qDjtS-0002L7-KV
 for qemu-riscv@nongnu.org; Mon, 26 Jun 2023 06:56:26 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qDjtP-0004As-QZ
 for qemu-riscv@nongnu.org; Mon, 26 Jun 2023 06:56:25 -0400
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-991b7a4d2e8so111721666b.1
 for <qemu-riscv@nongnu.org>; Mon, 26 Jun 2023 03:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687776982; x=1690368982;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ugqaVUWQ0M6SGSx4L3QeyrCYFr2TicKUl0DpzKlFJbg=;
 b=JtdSyD52jNlx2YK997Vf13PMtyq0JZF4UIF7rXHWOyiWEwCGwWaN176Rw0ZBkrRxBl
 DcRRdQ6rNzM02gvfj4RRdxP5/Doek1ELF+IlPFqxDjF2wWYeWAucp+kERFJXGQfo7mMj
 MIzbWmbeoy6MMx/qZCuv3dWBxOnrCqCkyjHC2kXR57J9NUnTfvbTjKP9cGHNVYk1cnIf
 f3tNkTs2nFxWdfiqZmXwPgzu1l+zuADH1GHCsk+IaMTyfBSiL0dHIBJbVPEyMIqOCwzz
 BEWwAiUKJDlcxVFlJJeGpP+ZJHjvPzMIvI/Pva4xAvwC6scXPN+3wCwaiq63Lc5LZLFc
 wqxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687776982; x=1690368982;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ugqaVUWQ0M6SGSx4L3QeyrCYFr2TicKUl0DpzKlFJbg=;
 b=a6Xv38YbbHLB+FNBWVocZxpQ6m9oXUkQQ5VyjeJzKZWizSbWr3GUrS62Ne2Ag40x1u
 drQCYQbbA7guwksaAmomA+FX2KInzoJh82X1FxUoT7sPYQv3g4dI0q/Zv9PY8tn1K4zv
 zp7mFO9iiUrvKD3cBGCivOsF0xgCsffoA9WBSPvS3txZI6j5oKPrlQOHe9LGvDufdTFM
 ZZl2JVG2j7VJDeouarLYqgk9WsnbB/lR5UbsKe8uUPiIggP+PUvwEP1R5tcE5bG6bXYT
 /ebTFuMdu9c8Kopvk6hwTsG7pVbSLcujX3qWKLh0LRZN6p4t8BN4G9sVKWlGmWFs68rQ
 h14w==
X-Gm-Message-State: AC+VfDzVzjd7emjc9HNG4TZacBNeK+v0zYH5ZS0ubrT4cZbr6s73PAVY
 fNNivsYEpH24MTVB6APfbXL0rQ==
X-Google-Smtp-Source: ACHHUZ72uK3Kel5Q48ZdM2B2/cp61EeeZ7NoW1iGeGFBZtRQiDdRrmFqSC7nzvaIj/3ncGFg4txNUw==
X-Received: by 2002:a17:907:983:b0:96f:a935:8997 with SMTP id
 bf3-20020a170907098300b0096fa9358997mr25290280ejc.12.1687776982135; 
 Mon, 26 Jun 2023 03:56:22 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.199.226])
 by smtp.gmail.com with ESMTPSA id
 x6-20020a170906710600b0098e48ad11f2sm1691357ejj.93.2023.06.26.03.56.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jun 2023 03:56:21 -0700 (PDT)
Message-ID: <8b66e890-3ad7-2f36-ab61-d80b11cfeaf0@linaro.org>
Date: Mon, 26 Jun 2023 12:56:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v2] target/riscv: Restrict KVM-specific fields from ArchCPU
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Weiwei Li <liweiwei@iscas.ac.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>
References: <20230624192957.14067-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230624192957.14067-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 24/6/23 21:29, Philippe Mathieu-Daudé wrote:
> These fields shouldn't be accessed when KVM is not available.
> 
> Restrict the KVM timer migration state. Rename the KVM timer
> post_load() handler accordingly, because cpu_post_load() is
> too generic.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> Since v1 https://lore.kernel.org/qemu-devel/20230405160454.97436-10-philmd@linaro.org/:
> - Restrict whole vmstate_kvmtimer (thus drop Daniel's R-b)
> ---
>   target/riscv/cpu.h     | 2 ++
>   target/riscv/machine.c | 8 ++++++--
>   2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index e3e08d315f..b1b56aa29e 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -363,12 +363,14 @@ struct CPUArchState {
>       hwaddr kernel_addr;
>       hwaddr fdt_addr;
>   
> +#ifdef CONFIG_KVM
>       /* kvm timer */
>       bool kvm_timer_dirty;
>       uint64_t kvm_timer_time;
>       uint64_t kvm_timer_compare;
>       uint64_t kvm_timer_state;
>       uint64_t kvm_timer_frequency;
> +#endif /* CONFIG_KVM */
>   };
>   
>   /*
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index 3ce2970785..d27f8a2a3a 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c

Oops, here goes ...

> @@ -199,7 +199,8 @@ static bool kvmtimer_needed(void *opaque)
>       return kvm_enabled();
>   }
>   
> -static int cpu_post_load(void *opaque, int version_id)
> +#ifdef CONFIG_KVM

... this ^^^ line.

> +static int cpu_kvmtimer_post_load(void *opaque, int version_id)
>   {
>       RISCVCPU *cpu = opaque;
>       CPURISCVState *env = &cpu->env;
> @@ -213,7 +214,7 @@ static const VMStateDescription vmstate_kvmtimer = {
>       .version_id = 1,
>       .minimum_version_id = 1,
>       .needed = kvmtimer_needed,
> -    .post_load = cpu_post_load,
> +    .post_load = cpu_kvmtimer_post_load,
>       .fields = (VMStateField[]) {
>           VMSTATE_UINT64(env.kvm_timer_time, RISCVCPU),
>           VMSTATE_UINT64(env.kvm_timer_compare, RISCVCPU),
> @@ -221,6 +222,7 @@ static const VMStateDescription vmstate_kvmtimer = {
>           VMSTATE_END_OF_LIST()
>       }
>   };
> +#endif
>   
>   static bool debug_needed(void *opaque)
>   {
> @@ -409,7 +411,9 @@ const VMStateDescription vmstate_riscv_cpu = {
>           &vmstate_vector,
>           &vmstate_pointermasking,
>           &vmstate_rv128,
> +#ifdef CONFIG_KVM
>           &vmstate_kvmtimer,
> +#endif
>           &vmstate_envcfg,
>           &vmstate_debug,
>           &vmstate_smstateen,


