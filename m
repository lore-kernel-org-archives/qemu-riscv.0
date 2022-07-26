Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oG9Fk-0000zO-Nd
	for mharc-qemu-riscv@gnu.org; Mon, 25 Jul 2022 21:20:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oG9Ff-0000xV-0U; Mon, 25 Jul 2022 21:20:47 -0400
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836]:37748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oG9Fc-0006dj-S3; Mon, 25 Jul 2022 21:20:46 -0400
Received: by mail-qt1-x836.google.com with SMTP id l14so9543454qtv.4;
 Mon, 25 Jul 2022 18:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UKkB3HULRj3pUMmgT7OAFIB5pdUVGm/GcYLhlJ2fbiM=;
 b=ZOPuhM7S6MsLqjdVjiwtnjsXjl6yFboh+slRXuHNgPB//aoSd0w/GAXGC2AYR7E6Ww
 KZbRpBwMS8hOOUPcRAHwax4aiQOqgSq5TyOjDlx72wnBdsbpVJU7ShDIyE0ky6LDWKm8
 a2ebzRMMAXZRf6f1GG8ZH/BchCamLL0Fl7Tvd8AnuNLoyyzSE37PwNn4POWee0MeOeF3
 BUlSOHoWwtqHlZxRodeb+1WR5R2jl9Kus9PvQ1Dv0S5uzOFf9MdIH+5ph6vhADxxjH/R
 uROg486VwASsvEs/jABOqwC3t2SY3WpVAHBBkTPw3r/wK/YzYuE3oL9/wuzhUPBnQ5Mi
 ZbLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UKkB3HULRj3pUMmgT7OAFIB5pdUVGm/GcYLhlJ2fbiM=;
 b=jJwYwkmFjTxlKs8ascJNQI6aSdP0CZsk6JZONPsxQ6wKuTQtWp8nCxXtgmuTt0+YsF
 WWoat0Ww6JNlaEcqNhaODfY7G0GI+PgKkZPeYm80fkuEFLhSgaadMzfO2DGEg/n2p1R7
 Wfu6k7/e2vuE8Vef6QnV1k6GJ153iZXpEJSZ/F1dt9oSLGxpKJiKS/QL61PdhtlA4Qs5
 WxXZ45cd0VXR1w2d6tWZuK7aCPhk0+HV55RSV+QqK73D5UMkwm1XwMo0FzTWOtEz4MlZ
 hhC0a2Dgl4RipVVkU0ef0ZbTHt5u4yxnd5hvKAsLg/KLpOPcWeKZBduZ8ZHPfBrj1/DF
 /c9w==
X-Gm-Message-State: AJIora9hsTqXPAQaexO5OSF3qf9aNGBqZtRariEQFKfm/U87PCQXWd0o
 stbAZxTstg87wq4VfoqGzMr5Xv4pvzSKHIGQ7AE=
X-Google-Smtp-Source: AGRyM1v5Oq6ibNjY9kTVwavxnUasb0PXWn+YuJfZrK5IuhnUR92S0axYiZC5m9zj1RGDh4KvocBDxTsoK75D2XGMhhA=
X-Received: by 2002:a05:622a:100d:b0:31f:25e3:7a45 with SMTP id
 d13-20020a05622a100d00b0031f25e37a45mr12446508qte.365.1658798443069; Mon, 25
 Jul 2022 18:20:43 -0700 (PDT)
MIME-Version: 1.0
References: <CADmoyEiUoULvn76UXcS0DaF2-Us4CTL=SyXf7PWYqfPTF3PTtQ@mail.gmail.com>
In-Reply-To: <CADmoyEiUoULvn76UXcS0DaF2-Us4CTL=SyXf7PWYqfPTF3PTtQ@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 26 Jul 2022 09:20:29 +0800
Message-ID: <CAEUhbmXSUJNxTtjA5W5x_EtnOHERhMvj6ZZVrT-qx-k9_gHB_w@mail.gmail.com>
Subject: Re: How to read RISC-V mcycle CSR from Linux userspace app?
To: Maxim Blinov <maxim.blinov@embecosm.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qt1-x836.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Tue, 26 Jul 2022 01:20:47 -0000

On Tue, Jul 26, 2022 at 12:58 AM Maxim Blinov <maxim.blinov@embecosm.com> wrote:
>
> Hi all, stupid question but I can't for the life of me figure this out
> even with all the docs open.
>
> I need to get an estimate figure for the cyclecount of a busy loop in
> one of my small Linux userspace apps. The app in question is running
> in qemu-system-riscv64. I've compiled QEMU myself, and the full code
> is like this:
>
> #include <unistd.h>
> #include <stdint.h>
> #include <stdlib.h>
> #include <stdio.h>
>
> uint64_t get_mcycle() {
>   uint64_t mcycle = 0;
>
>   asm volatile ("csrr %0,mcycle"   : "=r" (mcycle)  );

Change this to "csrr %0,cycle" and you should be able to run your program.

>
>   return mcycle;
> }
>
> int main(int argc, char **argv) {
>   printf("Hello\n");
>   printf("mcycle is %lu\n", get_mcycle());
>
>   return 0;
> }
>
> Now I get SIGILL when I hit the `csrr` insn, which makes sense.
> According to the "Privileged Architecture Version 1.10", page 32, [1]
> we need to set mcounteren, hcounteren, and scounteren low bits to 1 in
> order to get the mcycle csr to become available in userspace. So I add
> the following function:
>
> void enable_mcount() {
>   /* Enable IR, TM, CY */
>   uint64_t mcounteren = 0x5;
>   asm volatile ("csrw mcounteren,%0" : "=r" (mcounteren));
>   asm volatile ("csrw hcounteren,%0" : "=r" (mcounteren));
>   asm volatile ("csrw scounteren,%0" : "=r" (mcounteren));
> }
>
> And call it before I call get_mcycle(), but this triggers SIGILL
> (unsurprisingly) also, since these CSRs are also privileged. So
> there's a bit of a chicken and egg problem.
>
> Could someone more knowledgeable please suggest what the course of
> action here is? I've got QEMU revision f45fd24c90 checked out, and I'm
> staring at qemu/target/riscv/csr.c:71, which seems to deal with
> whether or not to raise a SIGILL upon access. I can see a condition
> for when we're in 'S' mode, but nothing for 'U' mode. Does that mean
> there is fundamentally no access to these CSR's from 'U' mode? Is it
> possible to just hack it in?

In the user space, you can only read the U-mode CSRs like cycle, but NOT mcycle.

>
> Maxim
>
> [1]: https://riscv.org/wp-content/uploads/2017/05/riscv-privileged-v1.10.pdf
>

Regards,
Bin

