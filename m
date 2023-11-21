Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE257C5ACB3
	for <qemu-riscv@archiver.kernel.org>; Tue, 21 Nov 2023 05:29:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r5JJV-0000oS-4L; Tue, 21 Nov 2023 00:28:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1r5JJT-0000nb-Aw; Tue, 21 Nov 2023 00:28:43 -0500
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1r5JJR-0001GU-Lz; Tue, 21 Nov 2023 00:28:43 -0500
Received: by mail-vs1-xe35.google.com with SMTP id
 ada2fe7eead31-45faf180a15so1373164137.3; 
 Mon, 20 Nov 2023 21:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700544520; x=1701149320; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L6o+tZJd65hGwbQ+ffyQrRoNWrKVaDFwtkjNVUd5Skk=;
 b=epnjRVS872Z6v7hQvkNXgptV0A+Cfqz9qPLypAkVEV2mY3uauv7b0a9GOvcdY9UFVd
 9Fpc1kk63emZ2oyYv4N2FmFRaDPOjE7j2JnkHO3Gy1x92npPbAaS7zVOoNmO+QXyarBb
 V1DQyMkT6eDbOcqydkmYUd6Wl1dNMfHonebOAI8twsItLpc5SyK7ZbgfEhLVS1W7YlZz
 NnrDtKvKSs0vtR/qFb4DaWbQWJZnl3WVIbPvcXCvdV7+NFaFF5VFgk8afxEqZBdkrc1B
 Qx8bSK2QZxE4h02aKBSaaMwAZ/Y93Wm/YW9ac2BzU4kQv8a7YfP6fBERvBo/eGOkcB1n
 qQRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700544520; x=1701149320;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L6o+tZJd65hGwbQ+ffyQrRoNWrKVaDFwtkjNVUd5Skk=;
 b=V95m+ulSapaGJQijrH/aGkAlgdsWxZP34Zf6GwZyqk4hlK3+R6slcasfMbMnLDtUTH
 Eb4LUXzk2/qht2t6VB29jZ5ZkLc5HujqlUR90X0btWhTzLT5+4qWVbKpm9HBy/YtCEdH
 5hrDwU+N4zoorBzCP97OceSfkoWTzzQvtyXnOESLhvGy3s8IFXXDiuV+8safxxviSV51
 HVPoRf3VdmnaYoA6QZRNhoxhMe0EFZiyIDpohAbpFNYROQbdvpp1Los9EgsbctkQuV+w
 4rU+Pb4335ysmsFtsvAq1ZZa1faNtM4fyxNZlB1Tg5OwUd4oZcWjiMWdy3XAJe6Br9Dc
 dddQ==
X-Gm-Message-State: AOJu0YysAw1l4fUlGZDnk7Epwim9umBrGDGpfhIHgBqr/SOl2v4jriUm
 utdNy7pkOP4wpboxEb1m+luISARNxbHvOP+Knno=
X-Google-Smtp-Source: AGHT+IHyoL+xyRBJk44/WyC3sEKoea/CYpkL/wRk6bvURwXpqrMZ8/EvsLS10TVT4iz3UEAa1wbmydBsschdf8ZD8LY=
X-Received: by 2002:a67:e306:0:b0:462:8aa1:3620 with SMTP id
 j6-20020a67e306000000b004628aa13620mr5137725vsf.6.1700544520278; Mon, 20 Nov
 2023 21:28:40 -0800 (PST)
MIME-Version: 1.0
References: <20231114094705.109146-1-ethan84@andestech.com>
 <20231114094705.109146-2-ethan84@andestech.com>
 <CAKmqyKOVpATp-pjkvqZtJHF3B0M5NpUJqDeyin8rVG8gpbtj4w@mail.gmail.com>
In-Reply-To: <CAKmqyKOVpATp-pjkvqZtJHF3B0M5NpUJqDeyin8rVG8gpbtj4w@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 21 Nov 2023 15:28:13 +1000
Message-ID: <CAKmqyKNF199hEJ_tuHwj361b38RvOivyszVWDtCLUAbNSaQh9Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] hw/core: Add config stream
To: Ethan Chen <ethan84@andestech.com>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, edgar.iglesias@gmail.com, 
 richard.henderson@linaro.org, pbonzini@redhat.com, palmer@dabbelt.com, 
 alistair.francis@wdc.com, in.meng@windriver.com, liweiwei@iscas.ac.cn, 
 dbarboza@ventanamicro.com, hiwei_liu@linux.alibaba.com, qemu-riscv@nongnu.org, 
 peterx@redhat.com, david@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e35;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe35.google.com
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

On Tue, Nov 21, 2023 at 3:24=E2=80=AFPM Alistair Francis <alistair23@gmail.=
com> wrote:
>
> On Tue, Nov 14, 2023 at 7:49=E2=80=AFPM Ethan Chen via <qemu-devel@nongnu=
.org> wrote:
> >
> > Make other device can use /hw/core/stream.c by select this config.
> >
> > Signed-off-by: Ethan Chen <ethan84@andestech.com>
> > ---
> >  hw/core/Kconfig     | 3 +++
> >  hw/core/meson.build | 1 +
> >  2 files changed, 4 insertions(+)
> >
> > diff --git a/hw/core/Kconfig b/hw/core/Kconfig
> > index 9397503656..628dc3d883 100644
> > --- a/hw/core/Kconfig
> > +++ b/hw/core/Kconfig
> > @@ -27,3 +27,6 @@ config REGISTER
> >
> >  config SPLIT_IRQ
> >      bool
> > +
> > +config STREAM
> > +    bool
> > \ No newline at end of file
>
> You are missing a newline here. I think checkpatch should catch this,
> make sure you run it on all of your patches
>
> > diff --git a/hw/core/meson.build b/hw/core/meson.build
> > index 67dad04de5..d6ce14d5ce 100644
> > --- a/hw/core/meson.build
> > +++ b/hw/core/meson.build
> > @@ -34,6 +34,7 @@ system_ss.add(when: 'CONFIG_REGISTER', if_true: files=
('register.c'))
> >  system_ss.add(when: 'CONFIG_SPLIT_IRQ', if_true: files('split-irq.c'))
> >  system_ss.add(when: 'CONFIG_XILINX_AXI', if_true: files('stream.c'))
> >  system_ss.add(when: 'CONFIG_PLATFORM_BUS', if_true: files('sysbus-fdt.=
c'))
> > +system_ss.add(when: 'CONFIG_STREAM', if_true: files('stream.c'))
>
> You have added the build but not the file. This will fail to compile.
>
> Each patch must compile and run when applied individually in order.
> That way we maintain git bisectability. Can you please make sure that
> the build is not broken as your patches are applied

Whoops! The file already exists.

We should only include the file stream.c once. So we should change the
CONFIG_XILINX_AXI to select CONFIG_STREAM in this patch

Alistair

