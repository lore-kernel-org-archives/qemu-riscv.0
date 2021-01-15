Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l0XIR-0001Qn-EI
	for mharc-qemu-riscv@gnu.org; Fri, 15 Jan 2021 17:10:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l0XIM-0001Os-7s; Fri, 15 Jan 2021 17:10:15 -0500
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:34812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l0XIK-0000d7-4m; Fri, 15 Jan 2021 17:10:13 -0500
Received: by mail-io1-xd2b.google.com with SMTP id u17so21133186iow.1;
 Fri, 15 Jan 2021 14:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TwJbMJmswseXbz6CUJUejVnBoB/LEd3uj3DFM7QGhA0=;
 b=YJ5MekLTGR0QHcZLgUMPanyYYr1qBdrpLN+3hDbDMGtamUXV2womAWx9L8J0Hzm8op
 XLJbgQTNPYo+FEkg9LRkUQunKgo+zAvuOD8Kj7PdW6YC4QKk+01i1DJlDUXUhdZYpRxW
 v1Xlhlg/mMmZVDonKAGxZ+u+7OanzAz7CPuzVUI7eb+sTF1F67dlIx5gxhhPXFCpRPA7
 S/y4NL6ev2e52vVIaJ8tMLL8tJKYi/vojj/FjImdkz2cGlqHV3zW8x+TjELjwZAJBJTt
 h+x9aQIIdeRKdhyk2KkvuMkg2DIvQ32ZQJLcztGS2FrWrLvyiWKiNlz0WTcoUd1Xe0wF
 Xw5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TwJbMJmswseXbz6CUJUejVnBoB/LEd3uj3DFM7QGhA0=;
 b=RVBuOD+IyNtBH92ThbKGQ7scdVuGCO5Hf279+Z8XCdcZMFM+5bi7hpet5hBOZ4X2vj
 2rOzD6aL0WQIunPtTgtKEnjeVciZqWFLzTQieKzrnK8LeNqRs/ojx5Ljem7gU5Im2yiy
 ghFo0A0/YELiD9AnUO0l62JoInKghI31ljaBVkesCLIBwsE2x49BEvNfdX7ExVlEM1/A
 YZ+KGuE/cdgM1SVGBawITRp6ztkhnj5aimxFMLay+btutTn2/cY9XDXceIR3VA+YUdOE
 Qm/oM9OAzeg39GIxAk2OeEaw9q9/FS0NpvvwfrjPzZKNKYhfvnhd/Qt8+ouHJ8o8+OTz
 7LzA==
X-Gm-Message-State: AOAM530m/MDGLspS3D1wTNqDerZb/YaLfZUQL2+7nRqCQbFhleYDYoY6
 GKF5Asb6wyUyvwEqu6vwaThd+jlpyyopZwZVV5/AAWre68I=
X-Google-Smtp-Source: ABdhPJw1iw79wVf7y3ORwqVC8jtDSYAl2wa3kMOB8/t2Kb0EUeuU6vMukwqaoQ/JXqhIzOdTLh4AJC/KMtSkTDHZAz0=
X-Received: by 2002:a6b:7d42:: with SMTP id d2mr10031519ioq.176.1610748609356; 
 Fri, 15 Jan 2021 14:10:09 -0800 (PST)
MIME-Version: 1.0
References: <20210110185109.29841-1-space.monkey.delivers@gmail.com>
 <20210110185109.29841-4-space.monkey.delivers@gmail.com>
In-Reply-To: <20210110185109.29841-4-space.monkey.delivers@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 15 Jan 2021 14:09:43 -0800
Message-ID: <CAKmqyKO=s8Y6pkgaHq_oo4B=BiORHud_z8AULTYnAQJYg5f49g@mail.gmail.com>
Subject: Re: [PATCH v7 3/6] [RISCV_PM] Print new PM CSRs in QEMU logs
To: Alexey Baturo <baturo.alexey@gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 space.monkey.delivers@gmail.com, 
 Alistair Francis <Alistair.Francis@wdc.com>, kupokupokupopo@gmail.com, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2b.google.com
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
X-List-Received-Date: Fri, 15 Jan 2021 22:10:15 -0000

On Sun, Jan 10, 2021 at 10:57 AM Alexey Baturo <baturo.alexey@gmail.com> wrote:
>
> Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index d50f09b757..19398977d3 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -287,6 +287,31 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>          qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "htval ", env->htval);
>          qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mtval2 ", env->mtval2);
>      }
> +    if (riscv_has_ext(env, RVJ)) {
> +        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mmte    ", env->mmte);
> +        switch (env->priv) {
> +        case PRV_U:
> +            qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "upmbase ",
> +                         env->upmbase);
> +            qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "upmmask ",
> +                         env->upmmask);
> +            break;
> +        case PRV_S:
> +            qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "spmbase ",
> +                         env->spmbase);
> +            qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "spmmask ",
> +                         env->spmmask);
> +            break;
> +        case PRV_M:
> +            qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mpmbase ",
> +                         env->mpmbase);
> +            qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mpmmask ",
> +                         env->mpmmask);
> +            break;
> +        default:
> +            g_assert_not_reached();
> +        }
> +    }
>  #endif
>
>      for (i = 0; i < 32; i++) {
> --
> 2.20.1
>
>

