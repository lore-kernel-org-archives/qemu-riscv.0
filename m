Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED4DEEB64D7
	for <qemu-riscv@archiver.kernel.org>; Thu, 22 Jun 2023 02:10:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qC9mI-0004TX-25; Wed, 21 Jun 2023 22:10:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qC9mG-0004TE-Dd; Wed, 21 Jun 2023 22:10:28 -0400
Received: from mail-vk1-xa32.google.com ([2607:f8b0:4864:20::a32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qC9mE-00049r-Oi; Wed, 21 Jun 2023 22:10:28 -0400
Received: by mail-vk1-xa32.google.com with SMTP id
 71dfb90a1353d-471658cc106so2135825e0c.0; 
 Wed, 21 Jun 2023 19:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687399825; x=1689991825;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t3DAefJrGetAhla7isZAFbf9idC3InpyTzUBKTRwoYc=;
 b=GdSrqzFtdPhMftsHK5L0P7KFW7JYxe8/J5DJH0ZQOwzUFxSbLTfWw//zSmtZOGjUbo
 bqrwMivDmI4MCK32oMvFY7ZkijSwp8+5PSjDA6RGbE8RNUeswidgz0vN72hgDMR3WWTJ
 VLvglVEN0CdtFqX/l95S6yEslzbRqYHFmHG196An6nfaSjdlqhx8Qr4bgeEFAFgIgh5J
 lHcE0O2UnHMrlgnSQgtUm7M6lcDnS54rWyNesSZueZDuSo22s/szR1Cm+Z2YWvgqxUOb
 Yb5L459g5NK/kn6ZH37vDKe1C4+3kwa52tVPM3k+VxpHsRKKEkmPSkb6I9yFLm7v7Kji
 1htw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687399825; x=1689991825;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t3DAefJrGetAhla7isZAFbf9idC3InpyTzUBKTRwoYc=;
 b=lOYKi7F2VrjY9+orWp7qEY0lX+ENQRs4meLVmo4Mkrk8LcI/bzNBh3e/j+R+Zu36H+
 9yFsiJbxzp06HjiioJdtXPJK/VJ2bpb5y8oXVJT0YK3Uc2mbykxyGzksp9JzhU+rB3RB
 y89uwbqlP4cvEA4LY9s/gaB7Q9sL5RNnjA12MW8D7o288+PnhyVVh8Lm3ZNzNuls9XVB
 bZH2/QSSUHdfFCGyi+LVEfcZdc0iXuSU3I9rHSRyp3K6KAf0sZM/BzmXezZ6VSW68SSq
 QlI0yBDBve72TOlGEO2gxr8/vjks8v5uk+v7JmlpLQr6yiuFt4x3hCq9QgmZBTeRzvsl
 qgWg==
X-Gm-Message-State: AC+VfDySrDg6hEfvL+qA+CPAEd+Fk1ndAtB8kVcqxkyqJ13Xg8WBxh7U
 T0zLwS5g0uGGnynRgmOxPJf0iDrGCVsAQ50PQMQ=
X-Google-Smtp-Source: ACHHUZ54t0dDHUAHx9qiCmSS3nf2uquvPAj72MJp5fnrwx10qOE3gec9Q/cAB3RkDksJhMLRNUt6BaRwQOTlyA5o5CA=
X-Received: by 2002:a1f:450e:0:b0:471:549e:c1ff with SMTP id
 s14-20020a1f450e000000b00471549ec1ffmr8435069vka.7.1687399824993; Wed, 21 Jun
 2023 19:10:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230608164542.3675619-1-tommy.wu@sifive.com>
In-Reply-To: <20230608164542.3675619-1-tommy.wu@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 22 Jun 2023 12:09:58 +1000
Message-ID: <CAKmqyKMKB2c+cfYFdPCwcst10hO7Zn7juB+u5ScV2gBTw=cjbg@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] Implement the watchdog timer of HiFive 1 rev b.
To: Tommy Wu <tommy.wu@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 palmer@dabbelt.com, bin.meng@windriver.com, jim.shu@sifive.com, 
 frank.chang@sifive.com, liweiwei@iscas.ac.cn, philmd@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a32;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa32.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Fri, Jun 9, 2023 at 2:46=E2=80=AFAM Tommy Wu <tommy.wu@sifive.com> wrote=
:
>
> The HiFive 1 rev b includes a watchdog module based on a 32-bit
> counter. The watchdog timer is in the always-on domain device of
> HiFive 1 rev b, so this patch added the AON device to the sifive_e
> machine. This patch only implemented the functionality of the
> watchdog timer, not all the functionality of the AON device.
>
> You can test the patchset by the QTest tests/qtest/sifive-e-aon-watchdog-=
test.c
>
> Changes since v1 ( Thank Alistair for the feedback ):
> - Use the register field macro.
> - Delete the public create function. The board creates the aon device its=
elf.
> - Keep all variable declarations at the top of the code block.
>
> Changes since v2 ( Thank Alistair for the feedback ):
> - Delete the declaration and definition of the create function.
>
> Changes since v3 ( Thank Alistair and Thomas for the feedback ):
> - Use `device_class_set_props()` for the properties in sifive_e_aon devic=
e.
> - Add SPDX identifier in QTEST.
> - Use libqtest.h in QTEST.
> - Let the statements on one line as long as they still fit into 80 column=
s.
>
> Changes since v4 ( Thank Phil for the feedback ):
> - Improve code style consistency.
> - Move the timer create function to the sifive_e_aon_init.
> - Allocate the sifive_e_aon device state in the SoC.
>
> Tommy Wu (3):
>   hw/misc: sifive_e_aon: Support the watchdog timer of HiFive 1 rev b.
>   hw/riscv: sifive_e: Support the watchdog timer of HiFive 1 rev b.
>   tests/qtest: sifive-e-aon-watchdog-test.c: Add QTest of watchdog of
>     sifive_e

Do you mind rebasing this on
https://github.com/alistair23/qemu/tree/riscv-to-apply.next ? Then I
will apply it

Alistair

>
>  hw/misc/Kconfig                          |   3 +
>  hw/misc/meson.build                      |   1 +
>  hw/misc/sifive_e_aon.c                   | 319 ++++++++++++++++
>  hw/riscv/Kconfig                         |   1 +
>  hw/riscv/sifive_e.c                      |  17 +-
>  include/hw/misc/sifive_e_aon.h           |  60 +++
>  include/hw/riscv/sifive_e.h              |   9 +-
>  tests/qtest/meson.build                  |   3 +
>  tests/qtest/sifive-e-aon-watchdog-test.c | 450 +++++++++++++++++++++++
>  9 files changed, 858 insertions(+), 5 deletions(-)
>  create mode 100644 hw/misc/sifive_e_aon.c
>  create mode 100644 include/hw/misc/sifive_e_aon.h
>  create mode 100644 tests/qtest/sifive-e-aon-watchdog-test.c
>
> --
> 2.27.0
>
>

