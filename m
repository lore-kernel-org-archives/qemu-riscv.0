Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lYNyu-0003bC-6q
	for mharc-qemu-riscv@gnu.org; Mon, 19 Apr 2021 03:06:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lYNys-0003aR-Ig; Mon, 19 Apr 2021 03:06:02 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:44941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lYNyq-0000xH-RS; Mon, 19 Apr 2021 03:06:02 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id v72so16827046ybe.11;
 Mon, 19 Apr 2021 00:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IvVm0n/cRnATjd07kY2L9vTcCjtvxeLIC2DYlMsqMYA=;
 b=LknTDXtnUAHJA0KnZirkqJx7NC9TB+kiZsKABENO4ySvy0FcDr5bLOZdZ//AfZvWpx
 x7V91CbrGgA+aQ/67geZxr81+l4tfU9Dhk/5UZ0MvbFc6ZLBiYf3n0ov05OH+IOBNAbJ
 RASjL9OHGRsXNLgTHsMNYLHQSDXZKjrpTr03gd5pYw2WJY3y1r6YMlJk6w6Kade7jsF/
 RDoAQiuN9LhSWVARKa5EE5MYT//e3/OYIeuZPHS4ZI6wfkUh4+vpaV1aWhy0frdzSY7W
 uOXS2+snXh9N+9ZY9XAFQAiYgkpaT/8xwX3bBW68w888+tUvGUQoMcQKfCZOwUNadjr0
 dbjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IvVm0n/cRnATjd07kY2L9vTcCjtvxeLIC2DYlMsqMYA=;
 b=I+TsMMFPfu6I7Nv6KaKMC583OrBgqCh57ek1ZtuWvSVi4dQaWVR/foH66lDf3jQ12H
 u6GA4k12kZizzpO67bHX7hhNeNKcvO0Ke1LcmvZWa4FwdoUkXrxxf+hcMgnGieFS88Uh
 Rm632K/CM+mdLWkUWciszXoRI7Qr59VFZVzUMyoQSi3p0LLYRJh4Td5L54BDKtSCI40Z
 uWMGAaELs61f4eCwy5WwIIc3AQVO9kpYd+WtlL6QxqMuDFrMavuUQyb2nksfGcxn5TI0
 yqRXKocx0ykTOxUnyca6mOIrqXphseF02dunUBQMUQgFzO2lqlMDLvB+5jfKEPFzf4OR
 KETg==
X-Gm-Message-State: AOAM531oy58OKiMRHok6U0hjRTHtaUU0M9XrFkweaHiKpv9o2pA5ly4w
 60lEOggyX6tjW5AeZ8LOt4CIAYiHpjMRO6jlp6o=
X-Google-Smtp-Source: ABdhPJwK9wWrsjBN6LwO41aq8JgIO6Q1jV+aPfVHi31qPhUwebev2LWgUp1LpQkbNDJS49cs542kHthGSmBzHDjauCE=
X-Received: by 2002:a25:bd03:: with SMTP id f3mr15335448ybk.152.1618815958907; 
 Mon, 19 Apr 2021 00:05:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1618812899.git.alistair.francis@wdc.com>
 <fef23b885f9649a4d54e7c98b168bdec5d297bb1.1618812899.git.alistair.francis@wdc.com>
In-Reply-To: <fef23b885f9649a4d54e7c98b168bdec5d297bb1.1618812899.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 19 Apr 2021 15:05:47 +0800
Message-ID: <CAEUhbmXb1dYso8weAcydB=+v5BpXfyhY+v2r88_71hNiPQDNAQ@mail.gmail.com>
Subject: Re: [PATCH v4 5/8] target/riscv: Implementation of enhanced PMP (ePMP)
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Apr 2021 07:06:02 -0000

On Mon, Apr 19, 2021 at 2:17 PM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> From: Hou Weiying <weiying_hou@outlook.com>
>
> This commit adds support for ePMP v0.9.1.
>
> The ePMP spec can be found in:
> https://docs.google.com/document/d/1Mh_aiHYxemL0umN3GTTw8vsbmzHZ_nxZXgjgOUzbvc8
>
> Signed-off-by: Hongzheng-Li <Ethan.Lee.QNL@gmail.com>
> Signed-off-by: Hou Weiying <weiying_hou@outlook.com>
> Signed-off-by: Myriad-Dreamin <camiyoru@gmail.com>
> Message-Id: <SG2PR02MB263462CCDBCBBAD36983C2CD93450@SG2PR02MB2634.apcprd02.prod.outlook.com>
> [ Changes by AF:
>  - Rebase on master
>  - Update to latest spec
>  - Use a switch case to handle ePMP MML permissions
>  - Fix a few bugs
> ]
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/pmp.c | 154 ++++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 146 insertions(+), 8 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

