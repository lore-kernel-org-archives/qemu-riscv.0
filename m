Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9BE1C43458
	for <qemu-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 00:43:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wgXQi-0005mN-Q2; Sun, 05 Jul 2026 20:43:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wgXQc-0005lx-Sd
 for qemu-riscv@nongnu.org; Sun, 05 Jul 2026 20:43:19 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wgXQb-0004kx-BM
 for qemu-riscv@nongnu.org; Sun, 05 Jul 2026 20:43:18 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-698aa7ba320so4285088a12.1
 for <qemu-riscv@nongnu.org>; Sun, 05 Jul 2026 17:43:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783298595; cv=none;
 d=google.com; s=arc-20260327;
 b=eMVjZyeXWLOdJSdAFcPcnV/J4xGuKOopBP7OAQx8PMGD3VG35oBb1KnSXzJpmTRo44
 0ctYmtKyccNcyGG5boX3JL2ORS0AcNrqOM0eR0uP/qpILYsGC84gUrtT32+Iy+42Xflu
 vEqT7ypdOcLdfMJFkdJ68NXeCLM8i6zSAoIQQ+qjsiTgWswZTXzjkXDSxn4kggkRcgf1
 xrGUJz1N3Xaau9n8/26e68GOEFxKWdrkPEWGzGjy+TdPJeJFbxQvMU65Iqc1IH+HhVv8
 GRa1BWxfkhzmjD4hQ82NR26P9hGd8dzTRWZkd0LAsy6uz4KZaZsI00gqWAKNzc09ytl1
 41ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Vip14HjtKGQOtuQkxEUIST0A0gAK0vfI2mPhzNy0LQA=;
 fh=xi/8HoIi9fSkxL3CqrqWmjHi56479GDbeRpcUfeZkkQ=;
 b=ruKimKyE6RE/hZ7ewcSiXW5aTgV6ZY5t8InRCtpS7rbLkqJG2Mj1GAOFDeKBCMNDID
 GSZzmgySc1yPikJhCosyYKGMJrihrGgdiskl4HOqxQ6XtUYdjLMpI5QCtmJdjd/kFtE0
 uAk0/LwKnE6Zhe200wb37HnKg2kUw7gDnUG2QpJI+aJw5ivQUnL7bCljTd1GwUvO50Jk
 HopgRUnbhNPl6BbIciUieACdg7fTiVLo2NxKdYBNXQ3tPhGzcOejsloMT+XW+Vnv6Ot9
 McoOZeFUATzwEA6FD4/+1oITKxzujCmRQ8umnDg6T16WkrPcCqZpPnJQzn2GYrOhkwSG
 WRQw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783298595; x=1783903395; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vip14HjtKGQOtuQkxEUIST0A0gAK0vfI2mPhzNy0LQA=;
 b=IxwU3+SyUWhl5xe8jFRfcdcbvye5NbkD8trsvgZ8zNZWZWApQ58AvDmWEKLOaepCph
 P+6OcDHicZ+7VZ4xDbRHacvhkESPfNt1d9rMJDjKD4NGNpTvkfkmKDNDugj98gJyb2eO
 2ZpMaSwKl/6+PaRqB6XSFlW3cwH3ogUwqvhSpz29GHR6LCH+IurE7xMG024BxZuBFDK6
 PQJoMqDpte5eiHm3rqJ9E2bat5s5xZv6sykWC/+f0EOP/W/fEWAmFa7izyGjo25WafLQ
 aGcHlrHFSzcv6DdfqwLzGQ7+HkwH/Kk+KOmwF57iQE1q8UD0lIvFfI92+/3ze/O2YW0i
 Ca7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783298595; x=1783903395;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Vip14HjtKGQOtuQkxEUIST0A0gAK0vfI2mPhzNy0LQA=;
 b=LEgHZjodiJX3I+KWK1qvNpB9diR9DVudn+zvNmIOO/Z4bUyflfg6Ww3DErvVBFpTsX
 xDRdmYQDGliR8Sq70+vE1XS0JkKhltb6h2ZiExO74qH27g+V+UryAugPZRsw8erRIKhQ
 MvIHIgpHND9orLDOIHC6FbKSCQjkt9rAtoyBGXxK4I9GD9SqH/WQ+vOpnkRHSpZA3MJb
 cx18JDANVgzbmaIL5vaYmX7aZ9zd66nihfuke0F3FS0TAmQCj/nf17X4h6JQhsryMrnV
 csaoekIUiO6gbvYde1m3qPd6Wsf5IDcSsj4am9B3mFcaCtW32wHfpCk80GyK3MhFsMEv
 xQcQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr0+Nbz7CyrdhQrNRu/b5SQXppVBS6rEh7MRasggh6KfwYIS/K0dbTrSUCFE1l7f309BvPEalmZbdcm@nongnu.org
X-Gm-Message-State: AOJu0Yx0b96CSwqO1E96Lcw+s2wd61RqHNFl40joLgc8i9W8kXKHfqks
 hgxP5emWSnO5Ol1bOWWCaVzYOBh40ghb/UylGs4NRG4HokWZIaeVGrQvFyI7ro8riCgBbClKWtZ
 TnmYDPoc/8Bc7eESbvQ49IGINhA+XE+o=
X-Gm-Gg: AfdE7clAB1RGaKcVQL4Lzlu9wF2LfSIQufFFcO8idAaacadsXle4d1a1LE9YXVlXC6r
 0/8K5ZAipzUEE2JRWVic1CydhwPIsAqh8N5U+aoNl9cENu2QW+l9hBbLXB8Nk6+nWU2w7R+vyV8
 /y6vdh7Ax86BYQhlWgHJEZR2+Juv2J3ZgDLQJEl4z50T6mo3DZypPb3RyhP4NrklxnFqioh6zL8
 HZE+BoKjjvlodIZTUifZw58PUk5FGhf9RLmiGIbNVwBASh0qFeIaDkqLP9jQ0SjhxttTQhT6ZRh
 nue6wNVioqphnse7gmAazH4w8g4=
X-Received: by 2002:a05:6402:4345:b0:698:ec2f:d6c9 with SMTP id
 4fb4d7f45d1cf-69a1ab2a74bmr2664158a12.14.1783298594475; Sun, 05 Jul 2026
 17:43:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260702135128.1188021-1-daniel.barboza@oss.qualcomm.com>
 <20260702135128.1188021-18-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260702135128.1188021-18-daniel.barboza@oss.qualcomm.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 6 Jul 2026 10:42:47 +1000
X-Gm-Features: AVVi8Ce3wfHYya6HsvEyV6rXok7TBCKfr_5x-Wdy4fErHydDCSAacTXGzfakX2k
Message-ID: <CAKmqyKPRQVBBwsPX_+m3K4o10UdRYAqv=de_VJAA1_SC4dW8NA@mail.gmail.com>
Subject: Re: [PATCH v3 17/24] target/riscv/cpu.c: filter TCG only bits in
 riscv_cpu_reset_hold()
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, Jul 2, 2026 at 11:53=E2=80=AFPM Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
> We have a lot of TCG only initialization in the common cpu_reset_hold
> callback that prevents --disable-tcg to work.
>
> Put a CONFIG_TCG ifdef around those bits to make the build work.
> Eventually we'll create a TCG specific reset function in tcg-cpu.c but
> for now this suffices.
>
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 6b79dcc5ee..5a82e6563b 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -965,10 +965,6 @@ bool riscv_cpu_has_work(CPUState *cs)
>
>  static void riscv_cpu_reset_hold(Object *obj, ResetType type)
>  {
> -#ifndef CONFIG_USER_ONLY
> -    uint8_t iprio;
> -    int i, irq, rdzero;
> -#endif
>      CPUState *cs =3D CPU(obj);
>      RISCVCPU *cpu =3D RISCV_CPU(cs);
>      RISCVCPUClass *mcc =3D RISCV_CPU_GET_CLASS(obj);
> @@ -1020,6 +1016,10 @@ static void riscv_cpu_reset_hold(Object *obj, Rese=
tType type)
>                      MENVCFG_ADUE : 0);
>      env->henvcfg =3D 0;
>
> +#ifdef CONFIG_TCG
> +    uint8_t iprio;
> +    int i, irq, rdzero;
> +
>      /* Initialized default priorities of local interrupts. */
>      for (i =3D 0; i < ARRAY_SIZE(env->miprio); i++) {
>          iprio =3D riscv_cpu_default_priority(i);
> @@ -1057,11 +1057,12 @@ static void riscv_cpu_reset_hold(Object *obj, Res=
etType type)
>      }
>
>      pmp_unlock_entries(env);
> +#endif /* ifdef CONFIG_TCG */
>  #else
>      env->priv =3D PRV_U;
>      env->senvcfg =3D 0;
>      env->menvcfg =3D 0;
> -#endif
> +#endif /* !CONFIG_USER_ONLY */
>
>      /* on reset elp is clear */
>      env->elp =3D false;
> --
> 2.43.0
>
>

