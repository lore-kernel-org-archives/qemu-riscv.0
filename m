Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD7DEEB64D9
	for <qemu-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 14:14:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qE9Sp-0001rK-A0; Tue, 27 Jun 2023 10:14:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1qE9Sm-0001q8-Ob
 for qemu-riscv@nongnu.org; Tue, 27 Jun 2023 10:14:36 -0400
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tommy.wu@sifive.com>)
 id 1qE9Sk-0007sX-O1
 for qemu-riscv@nongnu.org; Tue, 27 Jun 2023 10:14:36 -0400
Received: by mail-ua1-x929.google.com with SMTP id
 a1e0cc1a2514c-78cdb90aa66so1420206241.3
 for <qemu-riscv@nongnu.org>; Tue, 27 Jun 2023 07:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1687875273; x=1690467273;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TGn1co+5gjEkoV6mjWMcrEZWQMIJS6X7hIs85QmOjtA=;
 b=mrkOxV2AmZF4IXzSYUSrRJA8tBc0OfWId4wP7DUAIbP+YJrc6lUAAwSWf9Yz9zL2Op
 GX6kXrVJX8w/b2EobvcqayypxCGpCHnFMDfGDUSm+j7cOJaA5WmDKDxtDGriIQC1b1F3
 Lap1S8In133dpRSt/Om6+6A1quDauYEw13qoY2UJF5XFBseXiKoOOeFsWPBAbKz2urKI
 LQwflmQrDJM852i2mvQUJETN59wpRnF06/sCUYasZWzPVQu/FXYsRJGYVcQxMWbKKfEx
 wl/KiTXvoEesM9JdR49PoN8hOdYx8+qaa2ci1DVI3XbIRmK8344gbpSma1Ix9NTazpEI
 ypjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687875273; x=1690467273;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TGn1co+5gjEkoV6mjWMcrEZWQMIJS6X7hIs85QmOjtA=;
 b=XY/I9dmpZmvvomqG/64todVkW9v/mgYxsTllwv+vl8mFfV+EULChtuvG6cG4eNn7+H
 0Ae20lsffeg0/BtF3ncM17RU+kcxa4UHLdrpGXYFJdtPyqWv4Mds4J8ab80i9DApqM1L
 IqsGvNaYz8q+OR6YDVLvVY4CNzvzUKxOCo3xDXTOid+uyiAtogwhQePbd7VrqHP7TP88
 9/Df1bGfZYS0AmligFzm3MT0J7qTM4GOLXE9lPLY6UykWsH0tUlOchmBuvGbi6D+S7dm
 5GDXz+oRfIUZqPsEkEkQCkafxcCVAsq984X5UupmYEOcJjb2ZgsBbQVAHOiZVHeqsVl5
 TXyw==
X-Gm-Message-State: AC+VfDx0kPsqM6PhGYeSSRMGo3Um44Yg5kBfq1DXualoDUkVmZPl93Wh
 nlmiXlDaHu6IxgOt9st78kBIDWNx0kbw9kMVFjZ+1g==
X-Google-Smtp-Source: ACHHUZ7vQMzAf3z8bECThlKKqGxP0qHxuMp5HQ+qz7GnUIXSUCdZQ87fsOilQ7DmPdHOKCiwyIq3xQsCAVb4GZz3DVs=
X-Received: by 2002:a67:cd97:0:b0:443:6052:43ae with SMTP id
 r23-20020a67cd97000000b00443605243aemr3733691vsl.24.1687875273374; Tue, 27
 Jun 2023 07:14:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230608164542.3675619-1-tommy.wu@sifive.com>
 <CAKmqyKMKB2c+cfYFdPCwcst10hO7Zn7juB+u5ScV2gBTw=cjbg@mail.gmail.com>
In-Reply-To: <CAKmqyKMKB2c+cfYFdPCwcst10hO7Zn7juB+u5ScV2gBTw=cjbg@mail.gmail.com>
From: Tommy Wu <tommy.wu@sifive.com>
Date: Tue, 27 Jun 2023 22:14:26 +0800
Message-ID: <CANj3q_mvkoGv2UQLdUHw9YLDVEn5_EwWx-=r1ouJqm52XGPRHg@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] Implement the watchdog timer of HiFive 1 rev b.
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 palmer@dabbelt.com, bin.meng@windriver.com, jim.shu@sifive.com, 
 frank.chang@sifive.com, liweiwei@iscas.ac.cn, philmd@linaro.org
Content-Type: multipart/alternative; boundary="00000000000018522105ff1d16cb"
Received-SPF: pass client-ip=2607:f8b0:4864:20::929;
 envelope-from=tommy.wu@sifive.com; helo=mail-ua1-x929.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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

--00000000000018522105ff1d16cb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alistair,
Thanks for the suggestion! I've rebased and sent patch v6.

Best Regards,
Tommy

On Thu, Jun 22, 2023 at 10:10=E2=80=AFAM Alistair Francis <alistair23@gmail=
.com>
wrote:

> On Fri, Jun 9, 2023 at 2:46=E2=80=AFAM Tommy Wu <tommy.wu@sifive.com> wro=
te:
> >
> > The HiFive 1 rev b includes a watchdog module based on a 32-bit
> > counter. The watchdog timer is in the always-on domain device of
> > HiFive 1 rev b, so this patch added the AON device to the sifive_e
> > machine. This patch only implemented the functionality of the
> > watchdog timer, not all the functionality of the AON device.
> >
> > You can test the patchset by the QTest
> tests/qtest/sifive-e-aon-watchdog-test.c
> >
> > Changes since v1 ( Thank Alistair for the feedback ):
> > - Use the register field macro.
> > - Delete the public create function. The board creates the aon device
> itself.
> > - Keep all variable declarations at the top of the code block.
> >
> > Changes since v2 ( Thank Alistair for the feedback ):
> > - Delete the declaration and definition of the create function.
> >
> > Changes since v3 ( Thank Alistair and Thomas for the feedback ):
> > - Use `device_class_set_props()` for the properties in sifive_e_aon
> device.
> > - Add SPDX identifier in QTEST.
> > - Use libqtest.h in QTEST.
> > - Let the statements on one line as long as they still fit into 80
> columns.
> >
> > Changes since v4 ( Thank Phil for the feedback ):
> > - Improve code style consistency.
> > - Move the timer create function to the sifive_e_aon_init.
> > - Allocate the sifive_e_aon device state in the SoC.
> >
> > Tommy Wu (3):
> >   hw/misc: sifive_e_aon: Support the watchdog timer of HiFive 1 rev b.
> >   hw/riscv: sifive_e: Support the watchdog timer of HiFive 1 rev b.
> >   tests/qtest: sifive-e-aon-watchdog-test.c: Add QTest of watchdog of
> >     sifive_e
>
> Do you mind rebasing this on
> https://github.com/alistair23/qemu/tree/riscv-to-apply.next ? Then I
> will apply it
>
> Alistair
>
> >
> >  hw/misc/Kconfig                          |   3 +
> >  hw/misc/meson.build                      |   1 +
> >  hw/misc/sifive_e_aon.c                   | 319 ++++++++++++++++
> >  hw/riscv/Kconfig                         |   1 +
> >  hw/riscv/sifive_e.c                      |  17 +-
> >  include/hw/misc/sifive_e_aon.h           |  60 +++
> >  include/hw/riscv/sifive_e.h              |   9 +-
> >  tests/qtest/meson.build                  |   3 +
> >  tests/qtest/sifive-e-aon-watchdog-test.c | 450 +++++++++++++++++++++++
> >  9 files changed, 858 insertions(+), 5 deletions(-)
> >  create mode 100644 hw/misc/sifive_e_aon.c
> >  create mode 100644 include/hw/misc/sifive_e_aon.h
> >  create mode 100644 tests/qtest/sifive-e-aon-watchdog-test.c
> >
> > --
> > 2.27.0
> >
> >
>

--00000000000018522105ff1d16cb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0Alistair,<br>Thanks for the suggestion! I&#39;ve r=
ebased and sent patch v6.<br><br><div>Best Regards,</div><div>Tommy</div></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Thu, Jun 22, 2023 at 10:10=E2=80=AFAM Alistair Francis &lt;<a href=3D"mail=
to:alistair23@gmail.com">alistair23@gmail.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">On Fri, Jun 9, 2023 at 2:46=E2=
=80=AFAM Tommy Wu &lt;<a href=3D"mailto:tommy.wu@sifive.com" target=3D"_bla=
nk">tommy.wu@sifive.com</a>&gt; wrote:<br>
&gt;<br>
&gt; The HiFive 1 rev b includes a watchdog module based on a 32-bit<br>
&gt; counter. The watchdog timer is in the always-on domain device of<br>
&gt; HiFive 1 rev b, so this patch added the AON device to the sifive_e<br>
&gt; machine. This patch only implemented the functionality of the<br>
&gt; watchdog timer, not all the functionality of the AON device.<br>
&gt;<br>
&gt; You can test the patchset by the QTest tests/qtest/sifive-e-aon-watchd=
og-test.c<br>
&gt;<br>
&gt; Changes since v1 ( Thank Alistair for the feedback ):<br>
&gt; - Use the register field macro.<br>
&gt; - Delete the public create function. The board creates the aon device =
itself.<br>
&gt; - Keep all variable declarations at the top of the code block.<br>
&gt;<br>
&gt; Changes since v2 ( Thank Alistair for the feedback ):<br>
&gt; - Delete the declaration and definition of the create function.<br>
&gt;<br>
&gt; Changes since v3 ( Thank Alistair and Thomas for the feedback ):<br>
&gt; - Use `device_class_set_props()` for the properties in sifive_e_aon de=
vice.<br>
&gt; - Add SPDX identifier in QTEST.<br>
&gt; - Use libqtest.h in QTEST.<br>
&gt; - Let the statements on one line as long as they still fit into 80 col=
umns.<br>
&gt;<br>
&gt; Changes since v4 ( Thank Phil for the feedback ):<br>
&gt; - Improve code style consistency.<br>
&gt; - Move the timer create function to the sifive_e_aon_init.<br>
&gt; - Allocate the sifive_e_aon device state in the SoC.<br>
&gt;<br>
&gt; Tommy Wu (3):<br>
&gt;=C2=A0 =C2=A0hw/misc: sifive_e_aon: Support the watchdog timer of HiFiv=
e 1 rev b.<br>
&gt;=C2=A0 =C2=A0hw/riscv: sifive_e: Support the watchdog timer of HiFive 1=
 rev b.<br>
&gt;=C2=A0 =C2=A0tests/qtest: sifive-e-aon-watchdog-test.c: Add QTest of wa=
tchdog of<br>
&gt;=C2=A0 =C2=A0 =C2=A0sifive_e<br>
<br>
Do you mind rebasing this on<br>
<a href=3D"https://github.com/alistair23/qemu/tree/riscv-to-apply.next" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/alistair23/qemu/tree/r=
iscv-to-apply.next</a> ? Then I<br>
will apply it<br>
<br>
Alistair<br>
<br>
&gt;<br>
&gt;=C2=A0 hw/misc/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A03 +<br>
&gt;=C2=A0 hw/misc/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 hw/misc/sifive_e_aon.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 319 ++++++++++++++++<br>
&gt;=C2=A0 hw/riscv/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 hw/riscv/sifive_e.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 17 +-<br>
&gt;=C2=A0 include/hw/misc/sifive_e_aon.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 60 +++<br>
&gt;=C2=A0 include/hw/riscv/sifive_e.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A09 +-<br>
&gt;=C2=A0 tests/qtest/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A03 +<br>
&gt;=C2=A0 tests/qtest/sifive-e-aon-watchdog-test.c | 450 +++++++++++++++++=
++++++<br>
&gt;=C2=A0 9 files changed, 858 insertions(+), 5 deletions(-)<br>
&gt;=C2=A0 create mode 100644 hw/misc/sifive_e_aon.c<br>
&gt;=C2=A0 create mode 100644 include/hw/misc/sifive_e_aon.h<br>
&gt;=C2=A0 create mode 100644 tests/qtest/sifive-e-aon-watchdog-test.c<br>
&gt;<br>
&gt; --<br>
&gt; 2.27.0<br>
&gt;<br>
&gt;<br>
</blockquote></div>

--00000000000018522105ff1d16cb--

