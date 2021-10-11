Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ma4eH-0004Ew-3L
	for mharc-qemu-riscv@gnu.org; Mon, 11 Oct 2021 19:24:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ma4eB-0004EI-J4; Mon, 11 Oct 2021 19:23:55 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:34635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ma4e9-0006v1-5N; Mon, 11 Oct 2021 19:23:55 -0400
Received: by mail-io1-xd32.google.com with SMTP id i189so13931573ioa.1;
 Mon, 11 Oct 2021 16:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Dt8na1SBz2hW55Dmw3HjoF4MOcC7R10fP7OAGxOig3Y=;
 b=OhRG4Ea/QkhYlruUUnxFWuynxZQE4Tnt+7QmZObdJeN6MFmC+UX/sXAr8X0wncghZF
 Wav5BYRItlp2/nG97egX6o+EeMxAQO/kucvjSbx6+SWYB1fGkG92CVYYI0PnZsak456x
 Pm40tXJhHBjkbkYG5BoLD4UV9Q80lexdIlkO5ai3fZVcGYaKcbmareRXZWa84OUVoDE8
 PgtnTCGrDuk1eKH0oFXps2jPgd2q1FAsLNLqRxjMKalcW/RGx/+r/zFQ4WUfgVKOOIrQ
 NpKYIOhgX/2L/48CLUZq1tmm/RVyt7q4/AU0E8g3os/GDb3OiQC+RO+kpezdZeeoHTMO
 RuRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Dt8na1SBz2hW55Dmw3HjoF4MOcC7R10fP7OAGxOig3Y=;
 b=7KT5cR/dFMyYa6ZBXQ2v5nEq4pbjrJlDFPWiNFj+oo7EZOv1j50aJl9T+6p+1he1eA
 s3kbBEJULGAz1IA8DbE/hRDeNwFlSv/8z99+twHgAwC91HlW6T13+53/VYxElrQzlK2P
 nart+phRYOKMGiurH3VwDSUKLQ+e9Y/D6yEL82fTY37x12pMosEFD+/8ruzmSSS85Iv3
 HDFJt69oTZH0w60RxWIahR5xp+MxRo4frJPduo8bEd4NmygQAlk75locIYdGXhHuGQbc
 8T4de4lzL9OtxhTEkm0CTWDgztUsFPgFZb6tQBTHDKnz32uk9mejA9GALUwXhnsbim6J
 tCcA==
X-Gm-Message-State: AOAM532OD8R2Z6tpr4j9VG/5lHLsFQwlHRNWIQYReWY1ys1IdGyDTxFL
 qlnSYaRk+1wKskPT3nECYT1aCalBlKMyOpu/GQ6A4P6yp18=
X-Google-Smtp-Source: ABdhPJwqJB2lpbC1byKaTrK+ffnMYuYp+RXc/NrpMywWjmdSkc1DleAoulprScaHJBHfmVTAh9IsbZtfXX7oNmJtNVg=
X-Received: by 2002:a6b:8d4a:: with SMTP id p71mr21416663iod.16.1633994631537; 
 Mon, 11 Oct 2021 16:23:51 -0700 (PDT)
MIME-Version: 1.0
References: <20211009055019.545153-1-travisg@gmail.com>
In-Reply-To: <20211009055019.545153-1-travisg@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 12 Oct 2021 09:23:25 +1000
Message-ID: <CAKmqyKNNxxML9Z4aqBaiZwafBrvZvnSQR=pCSnaTukjFZ0f12Q@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: line up all of the registers in the info
 register dump
To: Travis Geiselbrecht <travisg@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d32;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd32.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Mon, 11 Oct 2021 23:23:57 -0000

On Sat, Oct 9, 2021 at 3:51 PM Travis Geiselbrecht <travisg@gmail.com> wrote:
>
> Ensure the columns for all of the register names and values line up.
> No functional change, just a minor tweak to the output.
>
> Signed-off-by: Travis Geiselbrecht <travisg@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 1d69d1887e..660f9ce131 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -258,7 +258,7 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>      }
>      if (riscv_has_ext(env, RVH)) {
>          qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "hstatus ", env->hstatus);
> -        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "vsstatus ",
> +        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "vsstatus",
>                       (target_ulong)env->vsstatus);
>      }
>      qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mip     ", env->mip);
> @@ -289,8 +289,8 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>      qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mtval   ", env->mtval);
>      qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "stval   ", env->stval);
>      if (riscv_has_ext(env, RVH)) {
> -        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "htval ", env->htval);
> -        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mtval2 ", env->mtval2);
> +        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "htval   ", env->htval);
> +        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mtval2  ", env->mtval2);
>      }
>      qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mscratch", env->mscratch);
>      qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "sscratch", env->sscratch);
> @@ -298,7 +298,7 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>  #endif
>
>      for (i = 0; i < 32; i++) {
> -        qemu_fprintf(f, " %s " TARGET_FMT_lx,
> +        qemu_fprintf(f, " %-8s " TARGET_FMT_lx,
>                       riscv_int_regnames[i], env->gpr[i]);
>          if ((i & 3) == 3) {
>              qemu_fprintf(f, "\n");
> @@ -306,7 +306,7 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>      }
>      if (flags & CPU_DUMP_FPU) {
>          for (i = 0; i < 32; i++) {
> -            qemu_fprintf(f, " %s %016" PRIx64,
> +            qemu_fprintf(f, " %-8s %016" PRIx64,
>                           riscv_fpr_regnames[i], env->fpr[i]);
>              if ((i & 3) == 3) {
>                  qemu_fprintf(f, "\n");
> --
> 2.25.1
>
>

