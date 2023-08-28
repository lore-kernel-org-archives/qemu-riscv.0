Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C4FC83F11
	for <qemu-riscv@archiver.kernel.org>; Mon, 28 Aug 2023 16:30:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qaf8Q-0008N8-5d; Mon, 28 Aug 2023 12:30:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qaf8L-0008Mj-K0
 for qemu-riscv@nongnu.org; Mon, 28 Aug 2023 12:30:34 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qaf8J-0004Vu-2R
 for qemu-riscv@nongnu.org; Mon, 28 Aug 2023 12:30:33 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-31dd10c2b8bso335043f8f.3
 for <qemu-riscv@nongnu.org>; Mon, 28 Aug 2023 09:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693240229; x=1693845029;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AigT8zQLdaENcBfMSy4ok+bNeKLOWAFsESBP5JSgeT0=;
 b=qyV7BD0Yk+dm45KM947MAXN8xC//nVxwi+oNxS9gChPsRic418yN1AXWiYYgm91aEN
 mJO7UztB3zxrch6nVlkZHNbKD8nAKrAi1AGovDopktLDoxSN1F5LLF6uKycRboSbgjYZ
 w0tsVPONuAqMFmPl3EH7yvt37I97UPSoDOInvB3YxWJN9M4hCdRyCaYoQ4EO/acCFTwV
 bQHZ4UDBURrc1brULkaQDKROPjQ+yUv5bDA2+nwgkVPb8P/xDz8eLolox9NJKRHBjCGK
 lfmvVuW/JH3foythpSrXplywTQGXLdiL84nNSQfvZykw+uHNYcc84boceTAxud+g7+4g
 SqtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693240229; x=1693845029;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AigT8zQLdaENcBfMSy4ok+bNeKLOWAFsESBP5JSgeT0=;
 b=fandZexUdIY+eTYm+8RQlwvjwFarfoZhxEHEsgnMDbjKvnvgSDbynmN1hnFhXGn1HJ
 i6D5EzOXLBCV6/z1kyMC/Pz/DGg09k4jTvC6hA9ikPgPezkNbfNHtrrUJ9PqKSM4MpDv
 W2UM2LHpXIDikhpQzcWNmH9x2vihcgpMxZdOpeHe21yCj18gv8kwhFlQzKoZUT6qZ8cy
 MxVLd9iMabTRbLMd68sqmCxRmsr29CgEeMY94+c1GRSnZoeHGNNSESAKtLa7TWJhZSgo
 fov5rsCj3ZEyjtrc+UByBIzDXbNkHoQuiYS4YOzgWjaUMjIMZDxShoAPNURN7+0znMcG
 cLHA==
X-Gm-Message-State: AOJu0Yy9ONiLbq6ideGuBnu4DrFCtdF3Kvui8zDd8DRzLJY+wbSBk2IG
 7OERb0LeJ5kssZBpUi6qHwVdRQ==
X-Google-Smtp-Source: AGHT+IGsg6hGD/8w+lpB7ZHrjpulaFvaH4X2EdveuD9ZxJ1SyTevxNsIXN1VzbfqMS+99dp5/QG/2w==
X-Received: by 2002:adf:f7c9:0:b0:31a:d2f9:7372 with SMTP id
 a9-20020adff7c9000000b0031ad2f97372mr19561640wrq.29.1693240229249; 
 Mon, 28 Aug 2023 09:30:29 -0700 (PDT)
Received: from [192.168.69.115] ([176.164.201.64])
 by smtp.gmail.com with ESMTPSA id
 b3-20020adfde03000000b0031accc7228asm10941900wrm.34.2023.08.28.09.30.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Aug 2023 09:30:28 -0700 (PDT)
Message-ID: <335b041f-8f7a-a2f3-53e5-234622793459@linaro.org>
Date: Mon, 28 Aug 2023 18:30:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH 04/20] target/riscv: move riscv_tcg_ops to tcg-cpu.c
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
References: <20230825130853.511782-1-dbarboza@ventanamicro.com>
 <20230825130853.511782-5-dbarboza@ventanamicro.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230825130853.511782-5-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.169,
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

On 25/8/23 15:08, Daniel Henrique Barboza wrote:
> Move the remaining of riscv_tcg_ops now that we have a working realize()
> implementation.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   target/riscv/cpu.c         | 58 -------------------------------------
>   target/riscv/cpu.h         |  4 ---
>   target/riscv/tcg/tcg-cpu.c | 59 ++++++++++++++++++++++++++++++++++++++
>   3 files changed, 59 insertions(+), 62 deletions(-)


> +const struct TCGCPUOps riscv_tcg_ops = {
> +    .initialize = riscv_translate_init,
> +    .synchronize_from_tb = riscv_cpu_synchronize_from_tb,
> +    .restore_state_to_opc = riscv_restore_state_to_opc,
> +
> +#ifndef CONFIG_USER_ONLY
> +    .tlb_fill = riscv_cpu_tlb_fill,
> +    .cpu_exec_interrupt = riscv_cpu_exec_interrupt,
> +    .do_interrupt = riscv_cpu_do_interrupt,
> +    .do_transaction_failed = riscv_cpu_do_transaction_failed,
> +    .do_unaligned_access = riscv_cpu_do_unaligned_access,
> +    .debug_excp_handler = riscv_cpu_debug_excp_handler,
> +    .debug_check_breakpoint = riscv_cpu_debug_check_breakpoint,
> +    .debug_check_watchpoint = riscv_cpu_debug_check_watchpoint,
> +#endif /* !CONFIG_USER_ONLY */
> +};

We can remove the "riscv_tcg_ops is being imported from cpu.c for now."
comment in tcg_cpu_init_ops(), otherwise:

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

