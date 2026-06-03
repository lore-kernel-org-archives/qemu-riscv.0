Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E986DCD6E57
	for <qemu-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 00:43:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wUZhr-0000bX-NC; Tue, 02 Jun 2026 20:43:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wUZho-0000ay-PF
 for qemu-riscv@nongnu.org; Tue, 02 Jun 2026 20:43:36 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wUZhn-0003io-6q
 for qemu-riscv@nongnu.org; Tue, 02 Jun 2026 20:43:36 -0400
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-bec4639953dso563410766b.1
 for <qemu-riscv@nongnu.org>; Tue, 02 Jun 2026 17:43:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780447412; cv=none;
 d=google.com; s=arc-20240605;
 b=N15gxF1VKqXuOiLVH9X1HltLbGD/0LQfgY1Psi5uzYEchDWD+eS7tZlivshfClAV64
 cwruvSpNGUD9RsrZFBGSBpY6UIxn35MQ5V7CgNz96Lojb20XuVJGVHf7NcSphIaFdqkT
 I4jW2DDtiTVVzgiM3zYBGKR2PeEz5CcFd5K3PQ7Ig7MdjcM8w6BUregZDSyjLkFtmlcO
 KyETHhaJBBQpJX/0HYJUxTMVzjD2Qlt9okScjZkk40tQQmWeyrgxwy0PvVTTyiOBebYG
 eYn1xGKnkaYew35kumVBxJh2dj1C9f7c1bY11sLg8GJCVHRCGWw5RymfMk4SbTkHUFeC
 uOdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=34HVZbjV4xGIsTW3/VVhwRHkAaNJIlIs2vBfAIsqaHc=;
 fh=b0wtvXkziF5nqAi6b2f3GN/9kdr5gf0wSXPVtF0mHw8=;
 b=Hc7JT5FuW28aJzA2SVUW48B+M8HnwnxXNQ70C58J6RSb/mAYxDvpDGP22XS/gdIr7y
 lo4Q+d7yeDIMujFo7N9/D0uPujRmEMJeZd8fm7fYSdyWGHZNukp6nvnOPLrd//2/MOVj
 bkLx52h1BPie7oqjSFYceSW0rDVoakva0+8QCgJR2V5p1zRIS+iMd8Y1cgLM+tPS8DhU
 czoJj8WbIy+UDLPdq1LS+uC4kQ9w9DluXUPec2A1dhkZOSOCpiBMtlA4CdzJSfHVBCmb
 V0sfayR0rW4Vt4FmivwknEVwmZCPIfTIyPXKyS1vNi7vM/Hc7Es4x1Rr5ceB1Z24CiFc
 w5Ew==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780447412; x=1781052212; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=34HVZbjV4xGIsTW3/VVhwRHkAaNJIlIs2vBfAIsqaHc=;
 b=UbySrFOnLA9UmcitJD0TNfIVKoK2Gstrkt6mBR9b1e0K6TFi+pIoMcQVKlgJuZJn4v
 W7yOuYmOo5TBe0bRdw6wAkM21/Xh4IXTRP+p4ocWlHplBUK79UuZ30ByGux5JlMAjbYL
 jT8Z3UB+VJZzr7N3ftSTDhNjd4/ozARSPenN+1BTq7v8FVbnoJGsPRaN+4o0WxD4Xr16
 U0veKxI3wfZEz/R8XDhNCz7yZBuKQJi26FejhQD9tyxL41fMf8BW1EwZLbc9BMGcW+g6
 oB0NEu7Wme/0zXWUfN93osZYqtTJmKGkgHOHsXTpzU7vp/gpV8MqjJX+IcuS3eEekJE3
 6AYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780447412; x=1781052212;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=34HVZbjV4xGIsTW3/VVhwRHkAaNJIlIs2vBfAIsqaHc=;
 b=iQPBI2yAStO+u8Rj10wH4L/MdbDJOgMT6J8Aym79IJ0IDowAihYTM7C8P2w/krqdkK
 K9RvBP7IObHivjKsbSoVxmUf5LNByemOduu+6Vn4MbiXrV/wdTBy+mgrEjY1i6P3yWbc
 4lM+ooiRTyxCvkRDckulLXooHr2RnF+OZ2nDgI0ve9dK1BS1M8FtRgFOUrBCDrtIgMtI
 inljxyqHUt+DnTywwv6OF0cvDTyyYAMcNq5l7cy7gDxsGuJeTJV3lwtSYY2UStloYhhY
 oTAO4m3RJ7Mr7i4NV8yjyjxAMM0Pto/fYyJ8xzdOvE0X9AFFpAR3CbsTjY92GUucAYhE
 c/NQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/Aog5iB+hS7uzuoHXy5gBc1iVskY7A7uQYDAAOFGejW3OK1hf2ghV1M1FGAj9zeaWBnwDedy6PCK5E@nongnu.org
X-Gm-Message-State: AOJu0YyXPMiQbJXtXeIlBJAkwnw3IxJOQLRpsSfIuMx/RILGTD0WaCQ0
 ILeTV7rgGcRZrir+Gjua5NV60bUOurzmI6wpSZttyB+dJyaAZURmhEH87Kn7tIodQHLQpAZ5GSQ
 lmG1IHY0sTbSYh0PPjDIA5r00TOXLt+k=
X-Gm-Gg: Acq92OHq4T1IysAxkFnUQ1kJkdNazmWgAQaNRr1UzwdM7WiHrp8V7zVztOE6jaY4ans
 4dhTsrI+Z0LRjRm9oaHnIYRp2Fk/f+Rn+glmK7JqNt/K1gQQJm0dTMlOCYECvpQh3S07eP/3UEX
 VmvBa/pIEu15xCSG+nVdxU1KNXg7O3P77zSsnk3essE9XnKbNIU4BaejZ2yCxa2A3ZDjApYIMvm
 Bnqv1aQ7i9nhMGYBbgkmTQBo3bs2yPrOI5lABXWQxH7huqJL2lYul91gg5hoS2SSZkBQ7rloqvj
 0Y9KWxZbpJHPtgIwHASJ+/Rony5yuGTEFaFz6AT95CDno2mF
X-Received: by 2002:a17:907:cf87:b0:beb:4674:6a1d with SMTP id
 a640c23a62f3a-bf0b15d8aabmr32478766b.11.1780447412071; Tue, 02 Jun 2026
 17:43:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260529053519.1224019-1-antonb@tenstorrent.com>
In-Reply-To: <20260529053519.1224019-1-antonb@tenstorrent.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 3 Jun 2026 10:43:04 +1000
X-Gm-Features: AVHnY4IFwdF7pq9nDcwdvilMnf7yDm4-l6X86zjwsANhtOoiaZsLI6O92UDppX0
Message-ID: <CAKmqyKPWj5qLUnchuzH4=gyqee9wmwn53FXnsH5dw-kuMvW1bg@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/riscv: Print privilege level and ELP in
 riscv_cpu_dump_state
To: Anton Blanchard <antonb@tenstorrent.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 daniel.barboza@oss.qualcomm.com, palmer@dabbelt.com, liwei1518@gmail.com, 
 zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=alistair23@gmail.com; helo=mail-ej1-x62d.google.com
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

On Fri, May 29, 2026 at 3:37=E2=80=AFPM Anton Blanchard <antonb@tenstorrent=
.com> wrote:
>
> The privilege level and ELP are implicit state (like virt), so print them
> out.
>
> Signed-off-by: Anton Blanchard <antonb@tenstorrent.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 952e34fdf5..b38ddc39ea 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -580,6 +580,22 @@ static void riscv_dump_csr(CPURISCVState *env, int c=
srno, FILE *f)
>      }
>  }
>
> +#if !defined(CONFIG_USER_ONLY)
> +static const char *riscv_priv_str(uint32_t priv)
> +{
> +    switch (priv) {
> +    case PRV_M:
> +        return "M";
> +    case PRV_S:
> +        return "S";
> +    case PRV_U:
> +        return "U";
> +    }
> +
> +    return "?";
> +}
> +#endif
> +
>  static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>  {
>      RISCVCPU *cpu =3D RISCV_CPU(cs);
> @@ -588,9 +604,15 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE =
*f, int flags)
>      uint8_t *p;
>
>  #if !defined(CONFIG_USER_ONLY)
> +    qemu_fprintf(f, " %s %s\n", "priv   =3D  ", riscv_priv_str(env->priv=
));
> +
>      if (riscv_has_ext(env, RVH)) {
>          qemu_fprintf(f, " %s %d\n", "V      =3D  ", env->virt_enabled);
>      }
> +
> +    if (cpu->cfg.ext_zicfilp) {
> +        qemu_fprintf(f, " %s %d\n", "elp    =3D  ", env->elp);
> +    }
>  #endif
>      qemu_fprintf(f, " %s %" PRIx64 "\n", "pc      ", env->pc);
>  #ifndef CONFIG_USER_ONLY
> --
> 2.34.1
>
>

