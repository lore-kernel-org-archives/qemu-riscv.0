Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62619EE14A9
	for <qemu-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 03:12:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qe5RE-0005H7-I2; Wed, 06 Sep 2023 23:12:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qe5RC-0005GM-Sr; Wed, 06 Sep 2023 23:12:10 -0400
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qe5RA-0000FQ-CP; Wed, 06 Sep 2023 23:12:10 -0400
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2bcb0b973a5so8681881fa.3; 
 Wed, 06 Sep 2023 20:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694056326; x=1694661126; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=34vUCi94QBWcecwf+4IRKNKa804Cm0RS/PsizmwHbo8=;
 b=O/WKgcmli8rSdAaaj/ASJQ0lj2IscMcuqadtF1rDVvm57ewU4Te5Jk1ewEIQ93OtIf
 QS7xYxhceO32DYkqWVw5dTliiKbWOBJ3kiFAS0+2gPuhGc08MTvuXLUg9lsYYvo5dEay
 eThhIhGNreIU2TTMnmQMuSYGZFERIN2OEi0biecEYxawb42TmHzl7DijWaVmpvyc2wEO
 Aho0sx1KgvMkLAh1/uYlzzBHDUQVtDCWpyEVBaKxtayTIk39155A7nEGArSqmtRMxf8y
 nejkIoapT/epbtqv/T2pdZ4ur27tX8udhO4yseUj5hoeaNXC1F89WzOaOfKwPTMR1wyp
 Tnug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694056326; x=1694661126;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=34vUCi94QBWcecwf+4IRKNKa804Cm0RS/PsizmwHbo8=;
 b=CXtug0KI4+jROumwI8YebaKZ4C7EUjQEzqxpD36VfojwRHlTrG2pzCOmf65IecAT7E
 7TXFQjJFn3l+zXCe6yXEWB5wLAuIUnoHma3QR2S8y8sFOdVz8rHakCF4F+W1dqCeZpYo
 zdUB1Ajq1ofY+p4UuETPf6kJXzdSh5LCtN7IWXhVuFnvMqYfcKxdDdp+U5oABH0Tnx4g
 bFiiKXMn3bIi03HZ1ref/ADncmhPJYsQt5hRXanXr//A7Gx7/lUdj2EFmgs5h/2z9GWI
 NevbGaV+pvUfuWibL2sCpBIzoBfvjaC2gGwDgZRD+eRuh0CLccV+hPdY/jsiXsKz9mjo
 Cy4w==
X-Gm-Message-State: AOJu0Yxpl1bNuZouv6RNwZ6FJTozySi1EmYAMsoLACkzuLh69fUOhKVA
 bLIGJu5ZQT0CWmy6c6P2OtA/gARXbVOgDKOJ7SVJlakkH9SWIQ==
X-Google-Smtp-Source: AGHT+IHp7IOAUU2uQO7RLpddEGGiJHV9Zzt7cGClE0qfK7+8VWQeRTFFULeH6MjuiOw9mmCLFGcjFMeeG0LJn40CZ3s=
X-Received: by 2002:a19:8c16:0:b0:500:a08e:2fcf with SMTP id
 o22-20020a198c16000000b00500a08e2fcfmr3405346lfd.47.1694056325990; Wed, 06
 Sep 2023 20:12:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230904161959.1766-1-alvinga@andestech.com>
In-Reply-To: <20230904161959.1766-1-alvinga@andestech.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 7 Sep 2023 13:11:36 +1000
Message-ID: <CAKmqyKOXNLUfE_13FH+faq5sDbjxDCFO-7dwKJwfyckC5b13ew@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: update checks on writing pmpcfg for ePMP to
 version 1.0
To: Alvin Chang <vivahavey@gmail.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, alistair.francis@wdc.com, 
 Alvin Chang <alvinga@andestech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::232;
 envelope-from=alistair23@gmail.com; helo=mail-lj1-x232.google.com
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

On Tue, Sep 5, 2023 at 2:30=E2=80=AFAM Alvin Chang <vivahavey@gmail.com> wr=
ote:
>
> Current checks on writing pmpcfg for ePMP follows ePMP version 0.9.1.
> However, ePMP specification has already been ratified, and there are
> some differences between version 0.9.1 and 1.0. In this commit we update
> the checks of writing pmpcfg to follow ePMP version 1.0.
>
> When mseccfg.MML is set, the constraints to modify PMP rules are:
> 1. Locked rules cannot be removed or modified until a PMP reset, unless
>    mseccfg.RLB is set.
> 2. From Smepmp specification version 1.0, chapter 2 section 4b:
>    Adding a rule with executable privileges that either is M-mode-only
>    or a locked Shared-Region is not possible and such pmpcfg writes are
>    ignored, leaving pmpcfg unchanged.
>
> The commit transfers the value of pmpcfg into the index of the ePMP
> truth table, and checks the rules by aforementioned specification
> changes.
>
> Signed-off-by: Alvin Chang <alvinga@andestech.com>

Thanks for the patch!

As part of this change we should convert ePMP over to Smepmp and drop
the experimental status

Alistair

> ---
>  target/riscv/pmp.c | 51 ++++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 42 insertions(+), 9 deletions(-)
>
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index a08cd95658..c036ca3e70 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -99,16 +99,49 @@ static void pmp_write_cfg(CPURISCVState *env, uint32_=
t pmp_index, uint8_t val)
>                  locked =3D false;
>              }
>
> -            /* mseccfg.MML is set */
> -            if (MSECCFG_MML_ISSET(env)) {
> -                /* not adding execute bit */
> -                if ((val & PMP_LOCK) !=3D 0 && (val & PMP_EXEC) !=3D PMP=
_EXEC) {
> -                    locked =3D false;
> -                }
> -                /* shared region and not adding X bit */
> -                if ((val & PMP_LOCK) !=3D PMP_LOCK &&
> -                    (val & 0x7) !=3D (PMP_WRITE | PMP_EXEC)) {
> +            /*
> +             * mseccfg.MML is set. Locked rules cannot be removed or mod=
ified
> +             * until a PMP reset. Besides, from Smepmp specification ver=
sion 1.0
> +             * , chapter 2 section 4b says:
> +             * Adding a rule with executable privileges that either is
> +             * M-mode-only or a locked Shared-Region is not possible and=
 such
> +             * pmpcfg writes are ignored, leaving pmpcfg unchanged.
> +             */
> +            if (MSECCFG_MML_ISSET(env) && !pmp_is_locked(env, pmp_index)=
) {
> +                /*
> +                 * Convert the PMP permissions to match the truth table =
in the
> +                 * ePMP spec.
> +                 */
> +                const uint8_t epmp_operation =3D
> +                    ((val & PMP_LOCK) >> 4) | ((val & PMP_READ) << 2) |
> +                    (val & PMP_WRITE) | ((val & PMP_EXEC) >> 2);
> +
> +                switch (epmp_operation) {
> +                /* pmpcfg.L =3D 0. Neither M-mode-only nor locked Shared=
-Region */
> +                case 0:
> +                case 1:
> +                case 2:
> +                case 3:
> +                case 4:
> +                case 5:
> +                case 6:
> +                case 7:
> +                /* pmpcfg.L =3D 1 and pmpcfg.X =3D 0 (but case 10 is not=
 allowed) */
> +                case 8:
> +                case 12:
> +                case 14:
> +                /* pmpcfg.LRWX =3D 1111 */
> +                case 15:  /* Read-only locked Shared-Region on all modes=
 */
>                      locked =3D false;
> +                    break;
> +                /* Other rules which add new code regions are not allowe=
d */
> +                case 9:
> +                case 10:  /* Execute-only locked Shared-Region on all mo=
des */
> +                case 11:
> +                case 13:
> +                    break;
> +                default:
> +                    g_assert_not_reached();
>                  }
>              }
>          } else {
> --
> 2.34.1
>
>

