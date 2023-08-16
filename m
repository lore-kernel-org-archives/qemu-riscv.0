Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE53CC27C41
	for <qemu-riscv@archiver.kernel.org>; Wed, 16 Aug 2023 21:21:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qWNxO-00079S-Oq; Wed, 16 Aug 2023 17:21:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qWNxM-000765-PV
 for qemu-riscv@nongnu.org; Wed, 16 Aug 2023 17:21:32 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qWNxI-0001zU-Jo
 for qemu-riscv@nongnu.org; Wed, 16 Aug 2023 17:21:32 -0400
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-99de884ad25so177390566b.3
 for <qemu-riscv@nongnu.org>; Wed, 16 Aug 2023 14:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692220886; x=1692825686;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dI8M8E50TucM0b5tzWL6D3S9g3Wk9MstbRQeMn3cl68=;
 b=RaB+zezOxNTwNzKhL5EAY0JREIjwsN6yR3xkFkP08hd7VdeRwryAD4EcqqDl4FydB1
 RGbXBEt8eaVU+KpSsyhgSh9lWTyZbmA25oFzdn1h1GxrkzVkrIWiM17WcmzzxKEmSUHK
 gfe09Sxzd5THsdpMJiX+rOVa/7H6A6Ex+S7O7TRujUM4Qg3lQe8ICusX0TrFdd8qUG+3
 PdjTxwFZZbfvsF2HD2/I7uEA3PdCCBnHsMklQT0VaZTvJB8BoEdgh9Gg0JlEenDleUOO
 nt4Pmo45l/fUy9T9pqbsK2b+KEa1y4h4EebnhdLSuX/LQkVlf4kPpxgPCnwroDw315XP
 RNKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692220886; x=1692825686;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dI8M8E50TucM0b5tzWL6D3S9g3Wk9MstbRQeMn3cl68=;
 b=MNSk80LlT6p4JBg7WM30cJcZfQTB0JVdjVgOLsrFCiJRM67RDjr5fohzfGS8jWHtxo
 e8j7a0fB+O613bLMtiJVNysLasnLImSpVT49FhzKuJ9VwcZ2zpaRx98YY/ziEMgJer+d
 VRoUru2Rms9us0StQYwr8DDPX91gyBp7MQnDWqahoX8y5h9So5za3TutWcE/Y2suoxBA
 Y930u1Wu/ZRGLeRNwKbDFC6nqlr/MqXKVI6dxTOkq5CYS5RhoTCUoIxpl/JJyZCmVytm
 Cn3FdUsEXrC70Ev6gBwlCb8K3VWihxbMma1hS3SZPn7A9IzzxnWl5lIteEfh5R7BEKHu
 XUag==
X-Gm-Message-State: AOJu0YxImKXtS0r8Ju+o5AsSPZe9jpUSOEpzPrV88VGgjF/2sTnk4xl7
 o0gzqnXvIcY3rmYNDWjGrF/VNg==
X-Google-Smtp-Source: AGHT+IGXGP2m19K7mN8WpgQNso5tORSuuB7qioOoVefvc2qq+96Qbu0vwjUGfja84+L+PF5w4VfW4g==
X-Received: by 2002:a17:907:7845:b0:99c:b0c9:4ec0 with SMTP id
 lb5-20020a170907784500b0099cb0c94ec0mr2336542ejc.30.1692220886084; 
 Wed, 16 Aug 2023 14:21:26 -0700 (PDT)
Received: from [192.168.69.115] (mna75-h02-176-184-40-35.dsl.sta.abo.bbox.fr.
 [176.184.40.35]) by smtp.gmail.com with ESMTPSA id
 v26-20020a1709060b5a00b00985bdb7dd5fsm8931446ejg.201.2023.08.16.14.21.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Aug 2023 14:21:25 -0700 (PDT)
Message-ID: <037612bf-3773-d522-712d-d3cf50d946e0@linaro.org>
Date: Wed, 16 Aug 2023 23:21:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH] target/riscv: Allocate itrigger timers only once
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <20230816162717.44125-1-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230816162717.44125-1-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.165,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 16/8/23 18:27, Akihiko Odaki wrote:
> riscv_trigger_init() had been called on reset events that can happen
> several times for a CPU and it allocated timers for itrigger. If old
> timers were present, they were simply overwritten by the new timers,
> resulting in a memory leak.
> 
> Divide riscv_trigger_init() into two functions, namely
> riscv_trigger_realize() and riscv_trigger_reset() and call them in
> appropriate timing. The timer allocation will happen only once for a
> CPU in riscv_trigger_realize().
> 
> Fixes: 5a4ae64cac ("target/riscv: Add itrigger support when icount is enabled")
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   target/riscv/debug.h |  3 ++-
>   target/riscv/cpu.c   |  8 +++++++-
>   target/riscv/debug.c | 15 ++++++++++++---
>   3 files changed, 21 insertions(+), 5 deletions(-)
> 
> diff --git a/target/riscv/debug.h b/target/riscv/debug.h
> index c471748d5a..7edc31e7cc 100644
> --- a/target/riscv/debug.h
> +++ b/target/riscv/debug.h
> @@ -143,7 +143,8 @@ void riscv_cpu_debug_excp_handler(CPUState *cs);
>   bool riscv_cpu_debug_check_breakpoint(CPUState *cs);
>   bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp);
>   
> -void riscv_trigger_init(CPURISCVState *env);
> +void riscv_trigger_realize(CPURISCVState *env);
> +void riscv_trigger_reset(CPURISCVState *env);
>   
>   bool riscv_itrigger_enabled(CPURISCVState *env);
>   void riscv_itrigger_update_priv(CPURISCVState *env);
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index e12b6ef7f6..3bc3f96a58 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -904,7 +904,7 @@ static void riscv_cpu_reset_hold(Object *obj)
>   
>   #ifndef CONFIG_USER_ONLY
>       if (cpu->cfg.debug) {
> -        riscv_trigger_init(env);
> +        riscv_trigger_reset(env);

Maybe name _reset_hold()? Otherwise:

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

>       }


