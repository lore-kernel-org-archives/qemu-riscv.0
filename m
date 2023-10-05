Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AF40E936F1
	for <qemu-riscv@archiver.kernel.org>; Thu,  5 Oct 2023 01:46:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qoDR0-0004UE-Ho; Wed, 04 Oct 2023 21:45:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qoDQv-0004Sn-Cq; Wed, 04 Oct 2023 21:45:47 -0400
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qoDQt-0005hL-9B; Wed, 04 Oct 2023 21:45:45 -0400
Received: by mail-vs1-xe2e.google.com with SMTP id
 ada2fe7eead31-4525dd7f9d0so194961137.3; 
 Wed, 04 Oct 2023 18:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696470341; x=1697075141; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n9d4judrISOnFbc3H46tgC8UqBGA5egJwhcka51ND+o=;
 b=B1KWmraoqMd95QrkC+8sJBhpLP0857eT3HWT7ZZmXV2jEAjTPCghyOgE5gZOlR2A7p
 GNfa6TJj/gpB6m+EpyuKl13N+FhgkBRrdlY5NV9lDXc4jFJTv00T1BnRs9EppQ88ghSC
 HzQvYlFI/3NTl6Yj9nbGHrpxTye3nNn9ZFtko42J/MjbV0NgAzQczC5Xz9Am4d73LXb3
 xbAyN01I61jZ6vfeSttBOQ4QzsFypZWdib8Dv93/FX4oBXUIaajyTMfiARYYYSiCHPxS
 7+JiIpLJyeUq0fwh7fJzTK2hPK+60z5O9SyW1zpe6gijRm+N2lyMk5WCq+gTkzOOIYht
 rInQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696470341; x=1697075141;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n9d4judrISOnFbc3H46tgC8UqBGA5egJwhcka51ND+o=;
 b=JzK+HqCeZoOPArHFkdKKjhxaXKWvADOwtLirI6ofj1C8zdCst/jd7QUflbrNRbehr5
 O3r+9llplaA7GSwxKQrHS9hfaE7pMLYstkgtNtdGocZbrcXT5qajEIxLKM9Q+VL6+LSK
 +o1wyQY1a89CLzJ4XHBO2i7i4lrCX1X76F5ouQh+W6Xw1VlvlzQPmraQs6YhuKwP8/X/
 aHFf8uvecvOyeFQ2pn/oZvHRmp5gA6r59+ucMBwf8Xuf8rF2qK4lVOl9gshyvbFB/1L5
 c9LsWn80D4apTYuzdzKiMxkmGzFprk9+MvuxpjvyrSI3OSHS5n7SOxcmplM3+obXpTYW
 sdFQ==
X-Gm-Message-State: AOJu0Yw2Y07+riSisyvmoS1pp1Qk479G1iBSOOQedfZ1ERaZ9PhxsBZa
 nGZXKNS1J4uKRpQTOQHVIK3JCu3r4tHU+0DYzRWdeTul0x4=
X-Google-Smtp-Source: AGHT+IHgjoBZ7umppmyNahZ1kjvn9/NQrb1WXd4z1azRe8CKcOks5taPP+417tFqNPnetBFgb+lYM8nk7BbPEh+pGoM=
X-Received: by 2002:a67:f701:0:b0:452:81b3:4b07 with SMTP id
 m1-20020a67f701000000b0045281b34b07mr3489179vso.17.1696470341053; Wed, 04 Oct
 2023 18:45:41 -0700 (PDT)
MIME-Version: 1.0
References: <20231003071427.188697-1-chigot@adacore.com>
In-Reply-To: <20231003071427.188697-1-chigot@adacore.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 5 Oct 2023 11:45:14 +1000
Message-ID: <CAKmqyKP6OKbfvg4FCG2m3ORrSXRh-a-tQKR+aZgRUK+bvyX7HA@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] Risc-V/gdb: replace exit calls with proper shutdown
To: =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2e;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2e.google.com
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

On Tue, Oct 3, 2023 at 5:14=E2=80=AFPM Cl=C3=A9ment Chigot <chigot@adacore.=
com> wrote:
>
> This series replaces some of the call to exit in hardware used by
> Risc-V boards. Otherwise, the gdb connection can be abruptly
> disconnected resulting in the last gdb packet "Wxx" being not sent.
>
> For the gdbstub modification, gdb_exit calls ensure that the "Wxx"
> packet is sent before exiting. However, some features (see
> net/vhost-vdpa.c: vhost_vdpa_cleanup for example) are expecting
> that a cleanup is being made before exiting. This, it's probably
> safer to follow the same logic here as well.
>
> Difference with v3:
>  - Rebase on riscv-to-apply
>
> Cl=C3=A9ment Chigot (5):
>   softmmu: add means to pass an exit code when requesting a shutdown
>   softmmu: pass the main loop status to gdb "Wxx" packet
>   hw/misc/sifive_test.c: replace exit calls with proper shutdown
>   hw/char: riscv_htif: replace exit calls with proper shutdown
>   gdbstub: replace exit calls with proper shutdown for softmmu

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  gdbstub/gdbstub.c          |  5 +++--
>  gdbstub/softmmu.c          |  6 ++++++
>  gdbstub/user.c             |  6 ++++++
>  hw/char/riscv_htif.c       |  5 ++++-
>  hw/misc/sifive_test.c      |  9 +++++++--
>  include/gdbstub/syscalls.h |  9 +++++++++
>  include/sysemu/runstate.h  |  2 ++
>  include/sysemu/sysemu.h    |  2 +-
>  softmmu/main.c             |  2 +-
>  softmmu/runstate.c         | 16 +++++++++++++---
>  10 files changed, 52 insertions(+), 10 deletions(-)
>
> --
> 2.25.1
>

