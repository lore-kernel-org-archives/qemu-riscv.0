Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B368EB64D7
	for <qemu-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 12:15:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qFD2B-0007rd-11; Fri, 30 Jun 2023 08:15:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qFD23-0007op-Eq
 for qemu-riscv@nongnu.org; Fri, 30 Jun 2023 08:15:23 -0400
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1qFD21-00029C-Pc
 for qemu-riscv@nongnu.org; Fri, 30 Jun 2023 08:15:23 -0400
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-6b711c3ad1fso1563180a34.0
 for <qemu-riscv@nongnu.org>; Fri, 30 Jun 2023 05:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1688127320; x=1690719320;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3mrWc1UDCe7NjSf+MTUZdbDVBfERdRM6jD4tVPHD3cE=;
 b=ho1vbHWGR9FBhI5fARX/bzKsAZDSYIepJ8Z6lUmKtVgZcTtp9MpVuLRyDQOBOPiVlq
 KI4BMMBgKWay/lrL6DaFV8oNwRdUyLSX/r05UEmOEVv3Bef7n2taNb8cE5XAqdI1fj6C
 +6WOTJItueoZ6j+hCa2DUgpjPVEIYRTkcRgNxzTCYi5WdNJPJlBvE0ftCQ2K54N16JkZ
 XeHR8QpD88wkmjp+w0c5h5XxFFm/bxzRQbbrSIDU+SMQV6X22EygfvPJCtQosaGQydFb
 0zVp8ORV9g7X5jo0ky7suyrEmAxsi+9Fv8i88C6bhOaQA3PomrPfgjZtl0pG1RPMR0f/
 z+3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688127320; x=1690719320;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3mrWc1UDCe7NjSf+MTUZdbDVBfERdRM6jD4tVPHD3cE=;
 b=eAgQ482FvUm5cmFu3MRjJZPS69gOvYXh7VKKTVGY6pBtv1U93mYLD01DHs2ZUytaYn
 BNy81N9FADu1gFIH6DtFAcEOza0wjExkV7wELxjsTlGcDavAn1t3+3LJ1JAXalCvWxIz
 90Qd1seGVS2H1vk8U5OZ4PSOOugVAwXTM2ZfvPsHnmswfIyCQ/tb1Ke+SCk6pvjvVH5f
 +3cXeLGO9OyPqjAtfyjXPpbRiU3aPiuY4BoxPJTyUQCYPIV4UYhZdLGKqG8lzBm9gq9/
 069uhjw5he+u3XyzAm5f9Cv+ezLX5WEeUReSiy8RLhyeGrm+6bKJ6jIy72LlOMqv55tL
 34sw==
X-Gm-Message-State: AC+VfDyus/VQZfAsh/t1IwwNyjqxyv/38h1JEvqbL5BYk9RWFSM4wpTp
 KfMk2FQ/4KcuOW5HauOufqxH5g==
X-Google-Smtp-Source: ACHHUZ4jwtmV08SmvRg4jN1BeTrP1Ki7L1RFrNO2D0n9iKCd3s3vDHvt0C84ZFRCr05PEC87HQvm5A==
X-Received: by 2002:a05:6830:1ce:b0:6b8:79e6:a2bd with SMTP id
 r14-20020a05683001ce00b006b879e6a2bdmr2722367ota.37.1688127320717; 
 Fri, 30 Jun 2023 05:15:20 -0700 (PDT)
Received: from ?IPV6:2804:7f0:bcc0:bdf2:b7ba:a476:c0e3:fb59?
 ([2804:7f0:bcc0:bdf2:b7ba:a476:c0e3:fb59])
 by smtp.gmail.com with ESMTPSA id
 v5-20020a9d5a05000000b006b5f08ddaffsm6393836oth.52.2023.06.30.05.15.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jun 2023 05:15:20 -0700 (PDT)
Message-ID: <3a6a30d0-f361-6b83-8d53-dfa95a678614@ventanamicro.com>
Date: Fri, 30 Jun 2023 09:15:16 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 3/4] target/riscv: Restrict 'rv128' machine to TCG
 accelerator
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>
References: <20230628063234.32544-1-philmd@linaro.org>
 <20230628063234.32544-4-philmd@linaro.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230628063234.32544-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
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



On 6/28/23 03:32, Philippe Mathieu-Daudé wrote:
> We only build for 32/64-bit hosts, so TCG is required for
> 128-bit targets.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/cpu.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index d9a3684b3e..5762ff68b4 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -476,6 +476,7 @@ static void rv64_veyron_v1_cpu_init(Object *obj)
>   #endif
>   }
>   
> +#ifdef CONFIG_TCG
>   static void rv128_base_cpu_init(Object *obj)
>   {
>       if (qemu_tcg_mttcg_enabled()) {
> @@ -494,7 +495,10 @@ static void rv128_base_cpu_init(Object *obj)
>       set_satp_mode_max_supported(RISCV_CPU(obj), VM_1_10_SV57);
>   #endif
>   }
> -#else
> +#endif
> +
> +#else /* !TARGET_RISCV64 */
> +
>   static void rv32_base_cpu_init(Object *obj)
>   {
>       CPURISCVState *env = &RISCV_CPU(obj)->env;
> @@ -576,7 +580,7 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
>       cpu->cfg.ext_icsr = true;
>       cpu->cfg.pmp = true;
>   }
> -#endif
> +#endif /* !TARGET_RISCV64 */
>   
>   #if defined(CONFIG_KVM)
>   static void riscv_host_cpu_init(Object *obj)
> @@ -1951,8 +1955,10 @@ static const TypeInfo riscv_cpu_type_infos[] = {
>       DEFINE_CPU(TYPE_RISCV_CPU_SHAKTI_C,         rv64_sifive_u_cpu_init),
>       DEFINE_CPU(TYPE_RISCV_CPU_THEAD_C906,       rv64_thead_c906_cpu_init),
>       DEFINE_CPU(TYPE_RISCV_CPU_VEYRON_V1,        rv64_veyron_v1_cpu_init),
> +#ifdef CONFIG_TCG
>       DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_BASE128,  rv128_base_cpu_init),
> -#endif
> +#endif /* CONFIG_TCG */
> +#endif /* TARGET_RISCV64 */
>   };
>   
>   DEFINE_TYPES(riscv_cpu_type_infos)

