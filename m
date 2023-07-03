Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05EAEEB64DA
	for <qemu-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 01:39:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qG8Wt-0000s9-D6; Sun, 02 Jul 2023 21:39:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qG8Wr-0000rm-KF; Sun, 02 Jul 2023 21:39:01 -0400
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qG8Wq-0007Ol-32; Sun, 02 Jul 2023 21:39:01 -0400
Received: by mail-vs1-xe2b.google.com with SMTP id
 ada2fe7eead31-44350ef5831so1359608137.2; 
 Sun, 02 Jul 2023 18:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688348338; x=1690940338;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kJwLjR30s2qVyS3MNTUdLl2HhrQMf6th/T6GeFpN5ss=;
 b=lPWbZtFY3tnb66kBB2o/vjtuJ04i6+1iqUFplmR79M/Hs+vg0uxw2JA6T3quLRlUYU
 Ssc/3Jijt7ekQkiPLtH7ekqbGiilD+nO1TUI0Ku7ZEgrsJyQyquh3j+Kakk5o7qkY6+E
 p1hATMkcRWBkNXfKLvfrACEjLI4Y3Q6raRXZo+qsK1BoZtv4CSYEYjg9/Ax0KO+69v5l
 xOK/DPC5IkAjrV92iMTXnJ/D6mZxrQmsA0vXKSUB2ncbnMlLIvGbZyHA0i/jIvieolFE
 4dpoMgKyuxPAvzHKLKG9LGjIvHDf692C4IGFBbqXKtPb+hZPcMAg9krVFWkJ74KXWXZt
 ob1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688348338; x=1690940338;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kJwLjR30s2qVyS3MNTUdLl2HhrQMf6th/T6GeFpN5ss=;
 b=X9v9DuZ+tLV38jHyqfWq7vfdxnnxhkRaSqtXT5ohiRe0wU18rHiiP33IpoB5imeCt/
 0MD6vyL3rv1cvei6KhAZEzJmOt9fp2RqUnUc0FcqpLKEuxumm1URrmNWHHSwvEBs4ZlK
 OBXZwGvZZ9UBx82rBVmrPA99ObBqaqFU9oIjcA1Ku6Bn2bIBffUeU9Q7zEtuOBZLDKX1
 zd03auIOaVleDgC3JSkxtCluzoSZ1Xm7/0IdpFhhmllrJR0iS7HLD8TWjvyw6f9wIyEe
 Li5W8asmmb89YZJxC3qQywWzDIEt4btWDZBsnWpHiKcv3qGC9nEWYujv/FhGpEafux83
 FIrw==
X-Gm-Message-State: ABy/qLaSirJTO/JIMNVAOYH6qvm+aRCaIbjQc88Nps0v1ptAvlZCxTO6
 biu6bi5ON21M3g7v1uRyRniQv7kqAvBF8BUy41Q=
X-Google-Smtp-Source: APBJJlFa+BUl3FVJ9+JHLrBoGD5DCLaaxH2KR1uZu+HkjVz8LsDd4rfNnf/rTbM9dKaqpNyFHBODj8vHs7c44IIBogA=
X-Received: by 2002:a1f:ddc4:0:b0:47e:28ee:9d1d with SMTP id
 u187-20020a1fddc4000000b0047e28ee9d1dmr2252399vkg.4.1688348338510; Sun, 02
 Jul 2023 18:38:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230627141216.3962299-1-tommy.wu@sifive.com>
In-Reply-To: <20230627141216.3962299-1-tommy.wu@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 3 Jul 2023 11:38:32 +1000
Message-ID: <CAKmqyKO9AyMzgTgbOdsKy1vigh-YSO7Gfaoyxdo4kDJey=bVeQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] Implement the watchdog timer of HiFive 1 rev b.
To: Tommy Wu <tommy.wu@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 palmer@dabbelt.com, bin.meng@windriver.com, jim.shu@sifive.com, 
 frank.chang@sifive.com, liweiwei@iscas.ac.cn, philmd@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2b;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2b.google.com
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

On Wed, Jun 28, 2023 at 12:13=E2=80=AFAM Tommy Wu <tommy.wu@sifive.com> wro=
te:
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
> Changes since v5 ( Thank Alistair for the feedback ):
> - Rebase to the riscv-to-apply.next branch.
>
> Tommy Wu (3):
>   hw/misc: sifive_e_aon: Support the watchdog timer of HiFive 1 rev b.
>   hw/riscv: sifive_e: Support the watchdog timer of HiFive 1 rev b.
>   tests/qtest: sifive-e-aon-watchdog-test.c: Add QTest of watchdog of
>     sifive_e

Thanks!

Applied to riscv-to-apply.next

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
> 2.31.1
>
>

