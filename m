Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B9FED690F9
	for <qemu-riscv@archiver.kernel.org>; Thu, 28 Nov 2024 11:25:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1tGce3-00080r-QG; Thu, 28 Nov 2024 06:25:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tGce0-000805-Po
 for qemu-riscv@nongnu.org; Thu, 28 Nov 2024 06:25:12 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tGcdy-0006XQ-CQ
 for qemu-riscv@nongnu.org; Thu, 28 Nov 2024 06:25:12 -0500
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5cfcd99846fso833217a12.1
 for <qemu-riscv@nongnu.org>; Thu, 28 Nov 2024 03:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732793107; x=1733397907; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Id04DDYQrbVcxK7yxXmFJWG9GzF9KP9d9fAiWOrDvhU=;
 b=cRAdCbAaPhKaffKPoo2cjR/EQ/wy43Ty9xh8Stoa7eHDiWYlnMyXQPfQLt5PPVNQc8
 +UMP2WIYINUxBWvQedpBKp9JXJhSVPe85n9YD7AQ5IIIjmOqNyRbiYs+wbSMQ1Ho3VGh
 RBkJLKoN3m5ewrLsnitRv7NBC6R4VpxSLC/m+4WVMm3w5JkSB1zJg/gc8KktjZxAoN2A
 Z7zVqTZbQ2/L9Sjh5un4v6u6Qrvl9ClawCHneXQOz+dk2U5Ufo2xXfVG/EtpU96K+DsT
 xNbl72SqVG1Haft4/wfzC/6vAw/Srp2SOQ4iW3RlvT04iDBHG3a1N6AeL0wxb1vSXRX7
 KS5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732793107; x=1733397907;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Id04DDYQrbVcxK7yxXmFJWG9GzF9KP9d9fAiWOrDvhU=;
 b=kFCSJi4V/ojNrRF+bfmPG7c7h4P3m1EuaOFj65YdWke7l79E1Zkg9R2n9uNctgoO7z
 55X2TkGZjbVI5Z/8ofQvonegvojXcIwD3TKgO9eDsAp+BI6uGLhZFqczs60vKULi/vxf
 NtSa5U/a+X3PELusPNgFX3lXn0oceizeNHnPXOFF4k0/A7vKJmuoz2QBNHJ+L6OPKH91
 B0QBhRSSZo7lVMcODms9iZqHW0c23V+fEeVVEYMQzPexWE9C8U9UZv0DK2+3ZPAiDHh+
 2TvkDcZQEjrNKCZ5363WmsmDzJ7p/fi6iiUWCr9ppfDxxGeiHpj+6llgWkM1t94jOF4i
 YlCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEmMz+QKWZvTOnf/Hs7HY+aRicsKM+c2YBkSengIwrokYisyFndL9i5C/v6krWI0z64kLlS6ry/qtT@nongnu.org
X-Gm-Message-State: AOJu0YzHH0+q2+Sz6alWfKs4VHLjwaKjKHR+6nymKj9j8ze0hnzSvAOM
 PaDZE+/wrGZmbbkpE45kUimdIrMvjgKhL8eLPcAw3PSOOacsDhdDECZ7V/PEjuMO/C2xu9KvMbE
 4pVsmlLDynXGINS1kP/qrwEADPujpc9EOpuUriw==
X-Gm-Gg: ASbGncuztigKI5ehZpXOXoIrdlo2Cq3Dtb/8JHxERVizEieyM9enrHyuJrOWAzD2Hlt
 gNGzgQWj3dfcjWJPDR5bIbg0J8GyEfa9O
X-Google-Smtp-Source: AGHT+IGVn+KpOZeyWvqlk02CB7utVocyssM19dgUeM7t5G3zEp1kcmi5UoMCPA1RXbOreMigPrVS/J7gWR+nkfGtTvg=
X-Received: by 2002:a05:6402:510a:b0:5cf:b860:349f with SMTP id
 4fb4d7f45d1cf-5d080b82344mr5807517a12.1.1732793107400; Thu, 28 Nov 2024
 03:25:07 -0800 (PST)
MIME-Version: 1.0
References: <20241128103831.3452572-1-peter.maydell@linaro.org>
 <2355b5f7-ea66-443b-9cab-24bbe1a18849@ventanamicro.com>
In-Reply-To: <2355b5f7-ea66-443b-9cab-24bbe1a18849@ventanamicro.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Nov 2024 11:24:56 +0000
Message-ID: <CAFEAcA8vVnMSmEmyR5=x=A91PF2guBbht+aXMOitz4pP+hWNcQ@mail.gmail.com>
Subject: Re: [PATCH for-9.2] target/riscv: Avoid bad shift in
 riscv_cpu_do_interrupt()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>, 
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Thu, 28 Nov 2024 at 11:20, Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
>
>
> On 11/28/24 7:38 AM, Peter Maydell wrote:
> > In riscv_cpu_do_interrupt() we use the 'cause' value we got out of
> > cs->exception as a shift value.  However this value can be larger
> > than 31, which means that "1 << cause" is undefined behaviour,
> > because we do the shift on an 'int' type.
> >
> > This causes the undefined behaviour sanitizer to complain
> > on one of the check-tcg tests:
> >
> > $ UBSAN_OPTIONS=print_stacktrace=1:abort_on_error=1:halt_on_error=1 ./build/clang/qemu-system-riscv64 -M virt -semihosting -display none -device loader,file=build/clang/tests/tcg/riscv64-softmmu/issue1060
> > ../../target/riscv/cpu_helper.c:1805:38: runtime error: shift exponent 63 is too large for 32-bit type 'int'
> >      #0 0x55f2dc026703 in riscv_cpu_do_interrupt /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/clang/../../target/riscv/cpu_helper.c:1805:38
> >      #1 0x55f2dc3d170e in cpu_handle_exception /mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/clang/../../accel/tcg/cpu-exec.c:752:9
> >
> > In this case cause is RISCV_EXCP_SEMIHOST, which is 0x3f.
> >
> > Use 1ULL instead to ensure that the shift is in range.
>
>
>
> I believe we can add:
>
> Fixes: 1697837ed9 ("target/riscv: Add M-mode virtual interrupt and IRQ filtering support.")
> Fixes: 40336d5b1d ("target/riscv: Add HS-mode virtual interrupt and IRQ filtering support.")
>
>
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
>
>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Thanks. Probably also reasonable to Cc: qemu-stable@nongnu.org,
which I forgot.

-- PMM

