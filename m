Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD795EB64DD
	for <qemu-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 17:32:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qUVzX-0001iB-5M; Fri, 11 Aug 2023 13:32:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qUVzV-0001af-Pp
 for qemu-riscv@nongnu.org; Fri, 11 Aug 2023 13:32:01 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qUVzU-0001iE-5s
 for qemu-riscv@nongnu.org; Fri, 11 Aug 2023 13:32:01 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3fe5c0e587eso21017385e9.0
 for <qemu-riscv@nongnu.org>; Fri, 11 Aug 2023 10:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691775119; x=1692379919;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tJ6wze5Ev7qTzP0XKtMqLGV98LSKnRojGydpd0O6zb8=;
 b=Qw6PVzbbUJqRsZXceRfgBHn1DWTotp/SMo7BuzHVYo7/Ysbmk7CpdddiqRfs9dEsOv
 o01PlJu0k71lxCxIB8fmWmGf0mnS7F+ZUmXm846xVm2m8DE3Ny9jVsMAimNWxYxK3DHx
 dYzSlX9sUHGhNu85hVZM/UdzqVNP+J8Q30eKTofFVzHuYLszesyLOsp6iWyqKcJkJdM3
 YsQAsiyLZOVzs4cQr6oxrb6G3T7w5njr+IbLk6lg/0ZRHTGVvr8raE4ctl7hm17PF6PC
 Y/g4BJFelgQUZ6iwWdWSx4WsMQIeLC1IBLsymT29ScZhlEAg1kLaT1nolY33Kaxu0Kbx
 RcVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691775119; x=1692379919;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tJ6wze5Ev7qTzP0XKtMqLGV98LSKnRojGydpd0O6zb8=;
 b=NvTOl46JsHNixjeryp/TJvzEMkEoKI+1sjZj18jmaLTOgxcRWyF+EPgwmvHxeS6dff
 37GBwZhpyyxEtH2qKkk3vF8bwttZYhmPADrOBPV1nq3/EgIuFWk8jbUb7MNMEUbTGxBB
 MZk1tvB06DYcHXdlS0f/igppSiKzUpK9c1mtxp3xOAzOUlRP8mFxrADGalRd4iYo6HmA
 XRYAhFq2AdFe+rL8p2b6wX5VNCoUX5rBh2t5IjaaY4dWnHKRjFsIPcz/YdibEYLtP/P8
 UEEyUTxXkxvEpSlVEJZndN1Uc369PHlTgENiVLZiwo8TBFrHbBKTLo4jK8bBqjZoRYrJ
 sXIQ==
X-Gm-Message-State: AOJu0YzAWvBZoJna5oDC4jyJZ7OscTeK3Dl/mrU3tOiIZw3yRq2NPiTQ
 GcZeVmBLTTYn1vlgn7UQ+zrcwA==
X-Google-Smtp-Source: AGHT+IGLPrmdIXp5cBMFt9sAzZnGPmv4USbL8SyEvFr9D7j/x+QDOFXESEPMtASVD+gJjRuwOGruaw==
X-Received: by 2002:a5d:4451:0:b0:315:a1d5:a3d5 with SMTP id
 x17-20020a5d4451000000b00315a1d5a3d5mr2166331wrr.22.1691775118501; 
 Fri, 11 Aug 2023 10:31:58 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.219.164])
 by smtp.gmail.com with ESMTPSA id
 v2-20020adfe282000000b00317ab75748bsm5962331wri.49.2023.08.11.10.31.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Aug 2023 10:31:57 -0700 (PDT)
Message-ID: <62f89b23-720b-2a04-8bbc-ea969a32c435@linaro.org>
Date: Fri, 11 Aug 2023 19:31:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH for-8.1 1/1] hw/riscv/virt.c: change 'aclint' TCG check
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org
References: <20230811160224.440697-1-dbarboza@ventanamicro.com>
 <20230811160224.440697-2-dbarboza@ventanamicro.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230811160224.440697-2-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.972,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 11/8/23 18:02, Daniel Henrique Barboza wrote:
> The 'aclint' property is being conditioned with tcg acceleration in
> virt_machine_class_init(). But acceleration code starts later than the
> class init of the board, meaning that tcg_enabled() will be always be
> false during class_init(), and the option is never being declared even
> when declaring TCG accel:
> 
> $ ./build/qemu-system-riscv64 -M virt,accel=tcg,aclint=on
> qemu-system-riscv64: Property 'virt-machine.aclint' not found
> 
> Fix it by moving the check from class_init() to machine_init(). Tune the
> description to mention that the option is TCG only.
> 
> Cc: Philippe Mathieu-Daudé <philmd@linaro.org>
> Fixes: c0716c81b ("hw/riscv/virt: Restrict ACLINT to TCG")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1823
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   hw/riscv/virt.c | 20 +++++++++++++-------
>   1 file changed, 13 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


