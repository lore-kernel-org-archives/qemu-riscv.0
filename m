Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3E39C52D73
	for <qemu-riscv@archiver.kernel.org>; Wed,  7 Aug 2024 18:46:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sblfH-0004Ob-Bb; Wed, 07 Aug 2024 14:45:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1sblfF-0004Gx-3p
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2024 14:45:37 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1sblfD-0008T7-0o
 for qemu-riscv@nongnu.org; Wed, 07 Aug 2024 14:45:36 -0400
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-7a103ac7be3so111562a12.3
 for <qemu-riscv@nongnu.org>; Wed, 07 Aug 2024 11:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1723056333; x=1723661133;
 darn=nongnu.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=JQHt8vBaHCjFB3wmOnZDxOw4YI5rlAK0kX+WtFhkwxc=;
 b=moUcYQyO5mEhrTXbbovMXgw5sFTV6lZ9Rf4zjxFh/V8pQ4ZGcQlGq02VEP+X6aGPqX
 9XKOorFyxJo16dy+IIKcMW9FvUhvkVrr8CVj++QPZs+TFRopPpw2cFawg7ha9efKaC/4
 pSUgDsfTUY1roTpmrY3+wXC2UH/04G8jx56fG85g4+4BiA9hKJ6Be7MhgDL/IxAYVs50
 VJfbhqPebogMcO+dVPonjM3GxFZl6fmzAsOv74gmVp9Q3JOuCgYAUAQO3BHuRBJam5YY
 JL7e0plh3CPyoF9xsA7BModqgZQp3N0w2ieELcnLIrWsNP2cx8q+Os8UlsXv8D5dTWTA
 onPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723056333; x=1723661133;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JQHt8vBaHCjFB3wmOnZDxOw4YI5rlAK0kX+WtFhkwxc=;
 b=NwIijzSwagm53QrPVRSH7G7nx7Ty7e8ePO2V5Qe6e6fE2D/SKBE1rFjiZlo9O6Zlyj
 rwOVGCZ9pHOMkAQb0kQp6ipgyb5OHvxQY0lHatbJ1mOxDHm4VDVcp2x/CXOuiZl2qobD
 PYH5lNNqVUe8tta8ReCqGfvYMnVvA6/Dc+qxzr/GO0kddcBXuLAceTEZiz3JxVfHvOEe
 6Gdox+Bl/1YyEsX6ePV+olzVrKLcxG1LFrPeWJFFANQbNSXAYJSLcq/afNGSLz6A8AM8
 OY5UTuP2qilh/V9LmLx4LIDCQktJTkvVKJ+YEojRpYZeOuP5XKXoWpkej1ov+1KSAVer
 tJdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5ff5RTwOdPr6GV3b75Xeqfbo04l41t9iu16WhDRVbQBvbcVEXXZg5hN9yOUgKFvZHWAIzh3Hky9G797phMN8jpUK3Wl4=
X-Gm-Message-State: AOJu0YxPMGQBqPrAlH1eGgUl/kWhdlannIKlA3hCCaitKFHHosECRu0r
 iKodXqJrpJTY8A7+kfqarJedt7L+ua35dudtoYxKQLiqbvm8rJHROGjIfxg7XjQ=
X-Google-Smtp-Source: AGHT+IEE+IyfKlluxnSu4GMaNMVRT73wyzPMazN38RzBjPk03AwXJih9dCCsdwAAIifemDItmaVtew==
X-Received: by 2002:a17:90a:2f25:b0:2c9:8189:7b4f with SMTP id
 98e67ed59e1d1-2cff9514703mr18284722a91.32.1723056332629; 
 Wed, 07 Aug 2024 11:45:32 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2d1b3ad01d4sm1926841a91.23.2024.08.07.11.45.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Aug 2024 11:45:32 -0700 (PDT)
Date: Wed, 7 Aug 2024 11:45:29 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com,
 palmer@dabbelt.com, Alistair.Francis@wdc.com, laurent@vivier.eu,
 bmeng.cn@gmail.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com
Subject: Re: [PATCH v3 01/20] accel/tcg: restrict assert on icount_enabled to
 qemu-system
Message-ID: <ZrPAyUJhrHGN56wx@debug.ba.rivosinc.com>
References: <20240807000652.1417776-1-debug@rivosinc.com>
 <20240807000652.1417776-2-debug@rivosinc.com>
 <9c987cbf-f702-4e1f-88d8-82a149c98007@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <9c987cbf-f702-4e1f-88d8-82a149c98007@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=debug@rivosinc.com; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Wed, Aug 07, 2024 at 10:48:56AM +1000, Richard Henderson wrote:
>On 8/7/24 10:06, Deepak Gupta wrote:
>>commit 16ad9788 [1] restricted icount to qemu-system only. Although
>>assert in `cpu_loop_exec_tb` is on `icount_enabled()` which is 0 when
>>its qemu-user and debug build starts asserting.
>>Move assert for qemu-system.
>>
>>[1] - https://lists.gnu.org/archive/html/qemu-riscv/2024-01/msg00608.html
>>
>>Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>>---
>>  accel/tcg/cpu-exec.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>>diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
>>index 245fd6327d..8cc2a6104f 100644
>>--- a/accel/tcg/cpu-exec.c
>>+++ b/accel/tcg/cpu-exec.c
>>@@ -927,9 +927,9 @@ static inline void cpu_loop_exec_tb(CPUState *cpu, TranslationBlock *tb,
>>          return;
>>      }
>>+#ifndef CONFIG_USER_ONLY
>>      /* Instruction counter expired.  */
>>      assert(icount_enabled());
>>-#ifndef CONFIG_USER_ONLY
>>      /* Ensure global icount has gone forward */
>>      icount_update(cpu);
>>      /* Refill decrementer and continue execution.  */
>
>No, this is a real bug.
>
>Just above we handled
>
>  (1) exit for tcg (non-)chaining (!= TB_EXIT_REQUESTED),
>  (2) exit for exception/interrupt (cpu_loop_exit_requested).
>
>The only thing that is left is exit for icount expired.
>And for that we *must* have icount enabled.
>
>How did you encounter this?

hmm I was experimenting with reducing TB flags (i.e. not using two different TB flags
for zicfilp). But I swear, I didn't see it go away (for qemu-user) when I had switched to
two TB flags.

Now that you've pointed it out specifically, I tried again.
Its not asserting at this place anymore for qemu-ser

I'll remove this patch in next version. And if I encounter this again, will dig a little bit
more deep into it and try to get repro steps.

>
>
>r~

