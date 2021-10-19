Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcxK9-00012j-0v
	for mharc-qemu-riscv@gnu.org; Tue, 19 Oct 2021 18:11:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mcxK6-000111-U6; Tue, 19 Oct 2021 18:11:07 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:33667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mcxK5-0000wK-An; Tue, 19 Oct 2021 18:11:06 -0400
Received: by mail-io1-xd2e.google.com with SMTP id n7so22271896iod.0;
 Tue, 19 Oct 2021 15:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G4p0fJVkYd3rpp+zSULv4sRF293nWCI/XGA1PWrbDE0=;
 b=X2X1QOpvM3ax4/jOa9jH2tZzjOhekbNoskDBPc0d5QSRwiyup86bx5wyYFEa1ves/A
 a/L5wlZfpEZHDzidjDHVXvyrcjrytr4RliMFcLR++C7+HsB5YMNb4yvPhKxwQ0UbaFK7
 /rwk2wO5KHHLjGpK3L8pRpIfv1UzxoFdVW2c4aPerN4mILuychl1Cjctl235bHPLjtcU
 9Fxqb1po5wTPXtsHCnaqbBOGvqqkU3S9UlkXNyhyJtOnn7KSvBjNDNmiuQbwlUHZY8gy
 pIAR22Z7DiUCQHy1H3Poym5lYrkY6BgGkWeposMNYxa+QVKvgpZcbgIjwBgrHRsdDqSm
 pjMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G4p0fJVkYd3rpp+zSULv4sRF293nWCI/XGA1PWrbDE0=;
 b=6xIZ7b8wuNWX5xbKdNvVzAXNre4b9xXp/zbTBRtIdPHVDM1MTRsK2OlhTGtKEl1TaZ
 xZ91Vu3BQz5ZRjQ7rxlK0KCJOoHfPDoINHybJI/IwObd0bT5Gx/dvsvVTHLCIPQXlW0e
 fiGvJDoembVGZDwWfOjrJZlP6pcJ8WqETcazRh7MM5QNgmLmiSKgd3Jf8GEFyvFGGgwx
 r2k5VvHYF8ydS9GgPBPf1Pgp1WLdB6oqERGqXpuslrmGMGLe1TwFaiBHu8O2esTaj1oW
 cSek3oWqlLuWuzmKEhR5ICIC6t4dQSLD3NyWVzNbhiQR6znY7G+dWaD49DrEjyceOZJr
 P3+g==
X-Gm-Message-State: AOAM5330YgDO908z2jyQdeTVqPiBQdQjT6WU1uj4k2Hz1P5wpSLHr7LK
 RD/7Y1uNIgFz/XOmLnaK42Q6RfyirRy2wkce3Uc=
X-Google-Smtp-Source: ABdhPJz8PHvWsNbZToacXTfD7y9wHU9x5dTCJtO/mulO9pYL70V8nDtZaLzmJ5eiBJMq8e2R5f3kgiH1JYXxHRE9pHI=
X-Received: by 2002:a05:6602:2e8c:: with SMTP id
 m12mr20124508iow.91.1634681463443; 
 Tue, 19 Oct 2021 15:11:03 -0700 (PDT)
MIME-Version: 1.0
References: <20211019152438.269077-1-richard.henderson@linaro.org>
 <20211019152438.269077-15-richard.henderson@linaro.org>
In-Reply-To: <20211019152438.269077-15-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 20 Oct 2021 08:10:37 +1000
Message-ID: <CAKmqyKPFnJpY8ef2NohQ1ckAJN7o=DXjWQQ2KANp_P5s+507eA@mail.gmail.com>
Subject: Re: [PATCH v5 14/16] target/riscv: Align gprs and fprs in cpu_dump
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, liuzhiwei <zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2e.google.com
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
X-List-Received-Date: Tue, 19 Oct 2021 22:11:07 -0000

On Wed, Oct 20, 2021 at 2:18 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Allocate 8 columns per register name.
>
> Reviewed-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

This probably isn't required though as there is already a similar
patch in my tree:
https://github.com/alistair23/qemu/tree/riscv-to-apply.next

Alistair

> ---
>  target/riscv/cpu.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 4e1920d5f0..f352c2b74c 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -240,7 +240,7 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>          qemu_fprintf(f, " %s %d\n", "V      =  ", riscv_cpu_virt_enabled(env));
>      }
>  #endif
> -    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "pc      ", env->pc);
> +    qemu_fprintf(f, " %-8s " TARGET_FMT_lx "\n", "pc", env->pc);
>  #ifndef CONFIG_USER_ONLY
>      qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mhartid ", env->mhartid);
>      qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mstatus ", (target_ulong)env->mstatus);
> @@ -290,15 +290,16 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>  #endif
>
>      for (i = 0; i < 32; i++) {
> -        qemu_fprintf(f, " %s " TARGET_FMT_lx,
> +        qemu_fprintf(f, " %-8s " TARGET_FMT_lx,
>                       riscv_int_regnames[i], env->gpr[i]);
>          if ((i & 3) == 3) {
>              qemu_fprintf(f, "\n");
>          }
>      }
> +
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

