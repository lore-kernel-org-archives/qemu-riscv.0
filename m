Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4FBEC02182
	for <qemu-riscv@archiver.kernel.org>; Tue, 21 Jan 2025 23:14:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1taNRG-0007D8-3O; Tue, 21 Jan 2025 18:13:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1taNRE-0007Ca-Gt
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2025 18:13:40 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1taNRC-0005SU-Al
 for qemu-riscv@nongnu.org; Tue, 21 Jan 2025 18:13:40 -0500
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-21661be2c2dso112660515ad.1
 for <qemu-riscv@nongnu.org>; Tue, 21 Jan 2025 15:13:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737501216; x=1738106016; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AR1Yd8p5mYWR9C9rJiJsxiYOh4BK5zPQ1mb74SRdRuI=;
 b=e+Icfgq1EAEvms57/ZhmF50aGOB/jh5RMo0DlKcrSd9wtADi3m7frAJeUY4hQ5BOQg
 K6e3K/x7Clzct8qiHwIk/qEUiT8wgDCo+QroCqs327u5ck1932JSk1tYqNO7nTZa9aY6
 UW+qs4BuOunSKAgkVTMJ4SeLnnGBKxtMS0CLI2khMRHw/B3plUOvgXCMaAnORC01PtS2
 8RbWMs0ss1maG7F6Nvl4ozeHjBFoSc/qQaz6E/kWHMo+kb2AV/fc0wPrBZ75Ca7s/Tk5
 d0USaU4SAUioWdY3R5Ia1tOBEU9vq5mZl8uyFaVcBj5Lh9gJrw7HHEwTii/v0o6fETxm
 fabg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737501216; x=1738106016;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AR1Yd8p5mYWR9C9rJiJsxiYOh4BK5zPQ1mb74SRdRuI=;
 b=AbgSme/qd17XRgTSa4IKc3bm+UHMAD7BUbdcP9t+VIAFZ7x9ZeArJCvdhS1vDy5NEP
 ucnWsuclGTba26udCg0eTqvlzz6qOKlNNvx1PmZHTUlBkuID5a0y/1+wncoQfml5R2fV
 656+HldVEKCnp3iPj3z7qT1RsDvRtYuy85xGGzZr5AMOe8YkgOIuoztvbcRMECQVKNop
 WHta3iWI6b1hFYoH+xuFoY5zWtQ4Z26CY9w9ZEP8wP9hljBiXm73e2mwiodwD9EEBMA0
 4BkG47WH8Ib1WYfC/Weochax4inG8UVI3I/cvHx/oWXKFWZlBYhrEl0t4ekSauYxl/uZ
 f/KA==
X-Gm-Message-State: AOJu0YxJl21SLYwcWljg8aGc6k6LaH+gnQkTEerEB8olaK4TtNQveeAn
 VG5RkFSeNWh24Xm4E61A3WLPCIhMOAmwlpfXwWWE5/U0PFp37oZXNHLBuDwqFRo=
X-Gm-Gg: ASbGncvIzULNyJzX81EdhfMUMDoN78E5S2AhTE9Nc08U0S9HqMh/Ria/1YsKnwx6sPN
 ukER/j0JY3r+gqW2Lk04bBXvCZeIJmMrlUJvQiZuFj/NDUeDOdU6o2V4U7tngyHiOuRNnOCVOZw
 3SiVD0M/7ycd4RM9qcqc7V64oAx2I5E8rjEja/PtnOvUee72fN86Xy6J5Qxr8OnjVIZJR49j0VN
 31TA4Ur1UW48Ye8e4dnRIh2b1tmcxwmW50ASAAs44bsFFIkS8HvzaRt1wKR+0qx3bSmCg81G04b
 nqBaQ7i3VPhDPnaWPc5LTxPfC8Hsvd9wZwX0
X-Google-Smtp-Source: AGHT+IHXQnuU+/ycq/EyPTYTD8GP97SyYdkty0iH1kd2JLlAXarCpC5rZnnbM2BUNDx92dd71A/q9Q==
X-Received: by 2002:a17:902:f651:b0:215:8d49:e2a7 with SMTP id
 d9443c01a7336-21c3561cb39mr273079065ad.50.1737501216726; 
 Tue, 21 Jan 2025 15:13:36 -0800 (PST)
Received: from [192.168.0.4] (174-21-71-127.tukw.qwest.net. [174.21.71.127])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21c2d3ad20bsm82982245ad.128.2025.01.21.15.13.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jan 2025 15:13:36 -0800 (PST)
Message-ID: <062800d7-10ea-4106-b3a3-7db7acc1b291@linaro.org>
Date: Tue, 21 Jan 2025 15:13:34 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] target/riscv: throw debug exception before page
 fault
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
References: <20250121170626.1992570-1-dbarboza@ventanamicro.com>
 <20250121170626.1992570-3-dbarboza@ventanamicro.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250121170626.1992570-3-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On 1/21/25 09:06, Daniel Henrique Barboza wrote:
> In the RISC-V privileged ISA section 3.1.15 table 15, it is determined
> that a debug exception that is triggered from a load/store has a higher
> priority than a possible fault that this access might trigger.
> 
> This is not the case ATM as shown in [1]. Adding a breakpoint in an
> address that deliberately will fault is causing a load page fault
> instead of a debug exception. The reason is that we're throwing in the
> page fault as soon as the fault occurs (end of riscv_cpu_tlb_fill(),
> raise_mmu_exception()), not allowing the installed watchpoints to
> trigger.
> 
> Call cpu_check_watchpoint() in the page fault path to search and execute
> any watchpoints that might exist for the address, never returning back
> to the fault path. If no watchpoints are found cpu_check_watchpoint()
> will return and we'll fall-through the regular path to
> raise_mmu_exception().
> 
> [1]https://gitlab.com/qemu-project/qemu/-/issues/2627
> 
> Resolves:https://gitlab.com/qemu-project/qemu/-/issues/2627
> Signed-off-by: Daniel Henrique Barboza<dbarboza@ventanamicro.com>
> ---
>   target/riscv/cpu_helper.c | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

