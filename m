Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B07B5C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Mon,  8 Jan 2024 16:29:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rMsUd-0000YQ-K7; Mon, 08 Jan 2024 11:28:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rMsUb-0000WU-4x
 for qemu-riscv@nongnu.org; Mon, 08 Jan 2024 11:28:49 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1rMsUZ-0005mW-Da
 for qemu-riscv@nongnu.org; Mon, 08 Jan 2024 11:28:48 -0500
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-5ca1b4809b5so510390a12.3
 for <qemu-riscv@nongnu.org>; Mon, 08 Jan 2024 08:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1704731325; x=1705336125; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tXul46WtKDOSWPsmkZgriKXr7Q6UqNXr1BVWvzd7dyY=;
 b=SxQlcwFJSJc8D3Cey5F9s8PcWo7Q8fkZDvnvNxnM1s7YY1U+whJHImE9VZTXHjxHmk
 McjTnEW5X9QMUbtWicMXLN3S90PaYaNut6694NkNY71/Bs2c4GiolevDbkt4o9rJOh9M
 cUwLMg4GB6SI1AP18cxnXS184vVFWtMT5NjsCdGittr89K96dClWJE41+GG485LVSmjr
 U/ksdJVnRuuSlRFHvGq702G/UGwjnlM/wZDt6SZhB2Hq6FDlnYV99sL8p0tkRA7CLiny
 vaUmvdd99bNRqzIgQBeCqfZuVH4nhE17ZrQJpivVLaxevPEM51XXr21B+RksawwX2QyG
 GVzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704731325; x=1705336125;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tXul46WtKDOSWPsmkZgriKXr7Q6UqNXr1BVWvzd7dyY=;
 b=JgALKsf+v7yJOS46oTWilKE6KMaELVE7QcNGeTioleAf9oG79iRBdBNeNQNIyVsOK7
 t/lwjYx41SojKDcO8IwZaPB8sPIk+fSkaweby48/vZjJiYWgf499XRPnf4WAhIC/X/3F
 bePxRj84y65BjFbvGOybSts/f1dw/pucnv0HprmUajxy8/0MLPygOCEKmjr40uFhY/3z
 n9Y2+WcuOPRGdMm6ViRiMTyjUAzzTUIUQCSgX5W0OMHgReHCZBUX78K/9c95O0tAboqq
 HVs7HiUw6+q6iagTsphuV6TK+mq3o6BDNxfIPK08FHBseBoL5St/ov9LXi8OFgGe0LaO
 yB4w==
X-Gm-Message-State: AOJu0YxcjZHfozJH5TzzsxOwfKLYAiO4MIOzRUwusF20qm03f/cuZQ5y
 C77ng+wXq2gVpiP8RnceNxUN92QvCHbceQ==
X-Google-Smtp-Source: AGHT+IFLwVymKekefT38f+hjt1sH4pOLf/Pam2OGferd4mUaIyBBggBDd1m1f3WsX9Lf9a845zN0og==
X-Received: by 2002:a17:90a:4583:b0:28c:f163:4884 with SMTP id
 v3-20020a17090a458300b0028cf1634884mr1255350pjg.50.1704731324855; 
 Mon, 08 Jan 2024 08:28:44 -0800 (PST)
Received: from [192.168.68.110] ([189.79.22.11])
 by smtp.gmail.com with ESMTPSA id
 j5-20020a17090a318500b00286f2b39a95sm190927pjb.31.2024.01.08.08.28.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jan 2024 08:28:44 -0800 (PST)
Message-ID: <d6ee98fa-dcb0-4c98-8e83-46ccfdd47799@ventanamicro.com>
Date: Mon, 8 Jan 2024 13:28:40 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] target/riscv: Don't adjust vscause for exceptions
To: Alistair Francis <alistair23@gmail.com>, zhiwei_liu@linux.alibaba.com,
 qemu-riscv@nongnu.org, palmer@dabbelt.com, bin.meng@windriver.com,
 qemu-devel@nongnu.org, liwei1518@gmail.com
Cc: Alistair Francis <alistair.francis@wdc.com>
References: <20240108001328.280222-1-alistair.francis@wdc.com>
 <20240108001328.280222-3-alistair.francis@wdc.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20240108001328.280222-3-alistair.francis@wdc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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



On 1/7/24 21:13, Alistair Francis wrote:
> We have been incorrectly adjusting both the interrupt and exception
> cause when using the hypervisor extension and trapping to VS-mode. This
> patch changes the conditional to ensure we only adjust the cause for
> interrupts and not exceptions.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1708
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/cpu_helper.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index e7e23b34f4..886a558a42 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -1749,8 +1749,8 @@ void riscv_cpu_do_interrupt(CPUState *cs)
>                    * See if we need to adjust cause. Yes if its VS mode interrupt
>                    * no if hypervisor has delegated one of hs mode's interrupt
>                    */
> -                if (cause == IRQ_VS_TIMER || cause == IRQ_VS_SOFT ||
> -                    cause == IRQ_VS_EXT) {
> +                if (async && (cause == IRQ_VS_TIMER || cause == IRQ_VS_SOFT ||
> +                              cause == IRQ_VS_EXT)) {
>                       cause = cause - 1;
>                   }
>                   write_gva = false;

