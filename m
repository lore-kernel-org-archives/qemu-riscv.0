Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB221C4167D
	for <qemu-riscv@archiver.kernel.org>; Mon, 11 Dec 2023 21:27:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rCnoL-0005Rx-SU; Mon, 11 Dec 2023 16:27:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rCnoA-0005AA-1Z
 for qemu-riscv@nongnu.org; Mon, 11 Dec 2023 16:27:24 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rCno6-0006um-KD
 for qemu-riscv@nongnu.org; Mon, 11 Dec 2023 16:27:21 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40c48d7a7a7so11500175e9.3
 for <qemu-riscv@nongnu.org>; Mon, 11 Dec 2023 13:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702330034; x=1702934834; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=x0MABy7f6s6nfkg9tx/E5imRi0RrJ+X+xKuN/pb7boE=;
 b=GgKdLLT8EWGTdGbXi9JYV/kSmE1lwh6HEQL+sYsdYJ7cymW2pFN3Xv3r4Dym4yrglR
 M625BjTnkhQCjJw+cJOur3FlqCHD1jpCx1GvQC3L2lYuZW7PmcLvOitoEILmdukXPUgc
 lpJLpSwn+Yyl4jWDLjDmFeoI8mrqi5ys+XJA77wlooM5xg0ZhXPGfH8i8ttcc9dxFuT+
 ioTc8jF39hTiPh7AOxR7o98TBUTtm5/knUDRsBzacWvhxZPX16E0ALGgMX7IZvBVgzDS
 PNOQnICmNJ/8q18aIYlZSTu95U781QdIpq6GZ96pvaEdE+2lQZe8fojekmhNLaYZPhn6
 4wDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702330034; x=1702934834;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=x0MABy7f6s6nfkg9tx/E5imRi0RrJ+X+xKuN/pb7boE=;
 b=qP0sRVM8Ak0UvgkzseuKg/LWZfnzC7QJK0UZX0e+sVuEhysSmK6BBp+V0i6rqQVweY
 RIxShwmFzj3aksoxMd+VEIX4hoAiynQifDLFItXBeLkQp1NrD3TiyUNnFeZ/mZVLKeY6
 Rh7f9lZxpJSo/mlBX4ahR5f7HGlGct0JGWudLt8w/zduEWL391T4ttOEXYhWTK+LhSj4
 oK1KHgTn9FpU7AMNYa+Rv8AE2+MH3mLykfDRuHmqWvmROFJJoV7VnVeIftf9gPx8zivR
 RuR0bhBJ7znOvbABptoRM257iOlQsVpnUQPceUJu/ZP7Gx+hT57tpBe7nfFEKqzn+1U0
 EyBQ==
X-Gm-Message-State: AOJu0YzTZYYjYlWueVABTJ0BGx5txqBU0YgS1pl+BBLIe5JTMRWKTa9Z
 WM2BtvQG5XFNtrvSqtJhRxRCNw==
X-Google-Smtp-Source: AGHT+IF2RUm4rR1J5p0UherjELD2fueA9qp0RQ2IsLv7CBC0irs91kbyCCWuAYYmAEyFqTewaqk4gA==
X-Received: by 2002:a5d:568e:0:b0:333:1a05:31d6 with SMTP id
 f14-20020a5d568e000000b003331a0531d6mr2749627wrv.44.1702330034421; 
 Mon, 11 Dec 2023 13:27:14 -0800 (PST)
Received: from [192.168.69.100] ([176.176.175.193])
 by smtp.gmail.com with ESMTPSA id
 d15-20020a056000114f00b0033359ae2d52sm9380197wrx.17.2023.12.11.13.27.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Dec 2023 13:27:14 -0800 (PST)
Message-ID: <7d8579fa-7796-438d-9bbb-439e06df7550@linaro.org>
Date: Mon, 11 Dec 2023 22:27:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/24] target: Define TCG_GUEST_DEFAULT_MO in 'cpu-param.h'
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, Peter Xu <peterx@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Claudio Fontana <cfontana@suse.de>, Brian Cain <bcain@quicinc.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Michael Rolnik <mrolnik@gmail.com>,
 Song Gao <gaosong@loongson.cn>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Stafford Horne <shorne@gmail.com>, Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>
References: <20231211212003.21686-1-philmd@linaro.org>
 <20231211212003.21686-4-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231211212003.21686-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 11/12/23 22:19, Philippe Mathieu-Daudé wrote:
> accel/tcg/ files requires the following definitions:
> 
>    - TARGET_LONG_BITS
>    - TARGET_PAGE_BITS
>    - TARGET_PHYS_ADDR_SPACE_BITS
>    - TCG_GUEST_DEFAULT_MO
> 
> The first 3 are defined in "cpu-param.h". The last one
> in "cpu.h", with a bunch of definitions irrelevant for
> TCG. By moving the TCG_GUEST_DEFAULT_MO definition to
> "cpu-param.h", we can simplify various accel/tcg includes.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/alpha/cpu-param.h      |  3 +++
>   target/alpha/cpu.h            |  3 ---
>   target/arm/cpu-param.h        |  8 +++++---
>   target/arm/cpu.h              |  3 ---
>   target/avr/cpu-param.h        |  2 ++
>   target/avr/cpu.h              |  2 --
>   target/hppa/cpu-param.h       |  6 ++++++
>   target/hppa/cpu.h             |  6 ------
>   target/i386/cpu-param.h       |  3 +++
>   target/i386/cpu.h             |  3 ---
>   target/loongarch/cpu-param.h  |  2 ++
>   target/loongarch/cpu.h        |  2 --
>   target/microblaze/cpu-param.h |  3 +++
>   target/microblaze/cpu.h       |  3 ---
>   target/mips/cpu-param.h       |  2 ++
>   target/mips/cpu.h             |  2 --
>   target/openrisc/cpu-param.h   |  2 ++
>   target/openrisc/cpu.h         |  2 --
>   target/ppc/cpu-param.h        |  2 ++
>   target/ppc/cpu.h              |  2 --
>   target/riscv/cpu-param.h      |  2 ++
>   target/riscv/cpu.h            |  2 --
>   target/s390x/cpu-param.h      |  6 ++++++
>   target/s390x/cpu.h            |  3 ---
>   target/sparc/cpu-param.h      | 23 +++++++++++++++++++++++
>   target/sparc/cpu.h            | 23 -----------------------
>   target/xtensa/cpu-param.h     |  3 +++
>   target/xtensa/cpu.h           |  3 ---
>   28 files changed, 64 insertions(+), 62 deletions(-)


> diff --git a/target/hppa/cpu-param.h b/target/hppa/cpu-param.h
> index bb3d7ef6f7..4548103a18 100644
> --- a/target/hppa/cpu-param.h
> +++ b/target/hppa/cpu-param.h
> @@ -21,4 +21,10 @@
>   
>   #define TARGET_PAGE_BITS 12
>   
> +/* PA-RISC 1.x processors have a strong memory model.  */
> +/* ??? While we do not yet implement PA-RISC 2.0, those processors have
> +   a weak memory model, but with TLB bits that force ordering on a per-page
> +   basis.  It's probably easier to fall back to a strong memory model.  */

Forgot to squash:

-- >8 --
@@ -24,5 +24,7 @@
  /* PA-RISC 1.x processors have a strong memory model.  */
-/* ??? While we do not yet implement PA-RISC 2.0, those processors have
-   a weak memory model, but with TLB bits that force ordering on a per-page
-   basis.  It's probably easier to fall back to a strong memory model.  */
+/*
+ * ??? While we do not yet implement PA-RISC 2.0, those processors have
+ * a weak memory model, but with TLB bits that force ordering on a per-page
+ * basis.  It's probably easier to fall back to a strong memory model.
+ */
---

> +#define TCG_GUEST_DEFAULT_MO        TCG_MO_ALL
> +
>   #endif
> diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
> index 8be45c69c9..6b10ab20ba 100644
> --- a/target/hppa/cpu.h
> +++ b/target/hppa/cpu.h
> @@ -25,12 +25,6 @@
>   #include "qemu/cpu-float.h"
>   #include "qemu/interval-tree.h"
>   
> -/* PA-RISC 1.x processors have a strong memory model.  */
> -/* ??? While we do not yet implement PA-RISC 2.0, those processors have
> -   a weak memory model, but with TLB bits that force ordering on a per-page
> -   basis.  It's probably easier to fall back to a strong memory model.  */
> -#define TCG_GUEST_DEFAULT_MO        TCG_MO_ALL
> -
>   #define MMU_ABS_W_IDX     6
>   #define MMU_ABS_IDX       7
>   #define MMU_KERNEL_IDX    8


