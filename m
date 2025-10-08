Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C47BCCA472
	for <qemu-riscv@archiver.kernel.org>; Wed,  8 Oct 2025 14:00:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v6UhX-0002IT-N8; Wed, 08 Oct 2025 09:59:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1v6UhS-0002IE-EX
 for qemu-riscv@nongnu.org; Wed, 08 Oct 2025 09:59:26 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1v6UhF-0001mk-Ey
 for qemu-riscv@nongnu.org; Wed, 08 Oct 2025 09:59:26 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-631df7b2dffso2289438a12.1
 for <qemu-riscv@nongnu.org>; Wed, 08 Oct 2025 06:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759931948; x=1760536748; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mKZ2hImwlN1b+rqDZz6p6av73pHb6Oqe7unc9VE/QZc=;
 b=fxZLuzjcAr1WsLrd6BTsuCR3lQSVcz3iZkqpHhZeFuxgDgRwKuQRey+xeDKkjirjUL
 AQwT1TVxPgk5VoAh1wiZ4rxC0Rd9986CnQIY0duHIc7A/5bdX3eLlXiFBqGQn36zJ7N9
 WWwwO4XsXOWpUEgzeRCdyLKzavSJ8Zaejdj0XDv+GKB11lfh5tTp5lUhL1EW0XHXkl/T
 C8Xdg2qlodlKagbiN2oHKCrl+XuckKGKZ4UcKf5iTHfpTEgRTlZtuwbVePKOhPsPOnOf
 5glmTqgBpLX8H523CvaZAYE+BM5eXtupYTuv/pe/6tPsMU4MJe7zJL0x9kZx/WH4woos
 hR6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759931948; x=1760536748;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mKZ2hImwlN1b+rqDZz6p6av73pHb6Oqe7unc9VE/QZc=;
 b=gbyxZF7Hrn0E/h5WoIncldg0hkGK4fCmCYIbMZMdvOEO/sDM03x5Ks7Gx6D4/Z/lxi
 PVAkdmz2lMZOOp93VZNINoJJRJTRURf6LU4G5mDk/eeQnIJoU+CBDIWIq5dotl7q6E4B
 7K3rzf8dR/P2F+R3PWoCyfmE6JtQnCs7EElE0LNJ7qFbJwbC/qO5e1fXa2FKGm5pfASR
 X7PUrEhpU3abWqVEQ2VdJRZHFo8v4zETMWu1uAd6EEVdE3d1vF+PSdtmCFv+e9Hvz5AR
 O/Hw9jVmTD/bhwFPTVSN8RiIAdZFucAz3vaO33lqsGQ2RK7PNEiwdq+AsvwqJZuWkm5W
 BRqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW63M1rrZh98jfcPzbgNcZKL/2IXFvAAh9g1qpnqd8vxlD3rzB8QxsrtPl2YBJDysokSFdR04u2yI2a@nongnu.org
X-Gm-Message-State: AOJu0YyYLT2p/u22Y8GVJNZb6gAkO6oDapw1uf36Mnhgr6JmL6vTWWBh
 YRDV+Me58nHU9LytyRdKqfqtC3S4UmSksolftlx2F7gHQvISpTwGnoLEqwHs90ZUuKm5FhFLClr
 V1/9RgAk5ffeW1WA2OjQinYnqspBOMsDIN8zK6/LzRg==
X-Gm-Gg: ASbGncvN+u+tB8Tmfq2tL/8P6H/R+ueWsC6cnvBOww6hzckaTiWK6g1m5EuVd+ZjO+N
 Ky974AMz8A6wvEBOW7+MSVeqY3IlHwRHSJuZGDxJDou7+FFBt+LoHdwRzdddgp8BVDsi1+GKxe8
 2leix0cCMPnkmf+/yb0iUXSz72bVyQGM0MpDeMC2YIan9iRX1QDtZKI1nYGNbzRooyeScsywDgk
 cBb64bozu9qA1YDytKzYbYz9vvA4/r1
X-Google-Smtp-Source: AGHT+IF4Ag1+92MGiUt9CKwt2oOGl2No9PF3vzFEfX9vnrqJSIyk+IOeXq0IJz2p0unitfFCUOW/Et2DDz7ObCbHuHA=
X-Received: by 2002:a05:6402:354c:b0:61c:db49:aec0 with SMTP id
 4fb4d7f45d1cf-639d5fd60a4mr3556203a12.5.1759931948084; Wed, 08 Oct 2025
 06:59:08 -0700 (PDT)
MIME-Version: 1.0
References: <20251002145742.75624-1-philmd@linaro.org>
 <20251002145742.75624-7-philmd@linaro.org>
In-Reply-To: <20251002145742.75624-7-philmd@linaro.org>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Wed, 8 Oct 2025 16:58:41 +0300
X-Gm-Features: AS18NWBlZBlQ_ooaz6BrC9frnCFGO2qn7kgdxIpU9ZAMjnkM6wf8LcP_f9u6EWw
Message-ID: <CAAjaMXZo4NER2tjOZdZSbH0YfuBuuE8DGsFWm5jUXeP0D25fWw@mail.gmail.com>
Subject: Re: [PATCH 6/6] target/sparc: Reduce inclusions of 'exec/cpu-common.h'
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 qemu-riscv@nongnu.org, 
 Max Filippov <jcmvbkbc@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Weiwei Li <liwei1518@gmail.com>, Zhao Liu <zhao1.liu@intel.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On Thu, Oct 2, 2025 at 6:00=E2=80=AFPM Philippe Mathieu-Daud=C3=A9 <philmd@=
linaro.org> wrote:
>
> Only 2 files require declarations from "exec/cpu-common.h".
> Include it there once, instead than polluting all files
> including "cpu.h".
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

