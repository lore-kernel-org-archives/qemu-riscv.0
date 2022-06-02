Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nwZTO-0003bI-M9
	for mharc-qemu-riscv@gnu.org; Wed, 01 Jun 2022 21:18:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nwZTJ-0003Xg-0e; Wed, 01 Jun 2022 21:18:00 -0400
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e]:46922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nwZTH-0007l7-7R; Wed, 01 Jun 2022 21:17:56 -0400
Received: by mail-oi1-x22e.google.com with SMTP id m82so4809200oif.13;
 Wed, 01 Jun 2022 18:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=agBzy9oGVqBrNwMTJRPae7+XYvuXgxgNqp4Kr4rZ5/w=;
 b=qp5Xpn3bqaHvllACYJbLAPQk5qLf1LjgG0RGEOMShIMOJZLqr3TQhsh9PxqM+Y7LvJ
 2aStpCpk59JI/rk7SBwgLwKnw47xc3+tTweNhs2lnJtM1p3uhvHpV57tBLPe3xF473KS
 dHQJA8Dz67Ahn0DG9W7m4Td9Y5cicpzC/H95jDfRwHcU/EwdGYfyH88Z7ji3JJiNgQsx
 KJ60EjU1xJ+VjiNp/b552Rsc0PUf+bvTJbCsNslr9xFCcPOh7Rr04I9xjGdAxMj8XxA7
 b6wTLjRmkEruNJ23Nt3LxplQCEtQDBHn2Ix1wGcZ0WtKdbkGbv0rQCU2gK2tfBQxnlvR
 3aUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=agBzy9oGVqBrNwMTJRPae7+XYvuXgxgNqp4Kr4rZ5/w=;
 b=0Vrx3bZDR90i+ZBLY9o0OglcA/0TaGAnuKJD2O8UhCIQvm9P/M1MsYWvpnS485ZhPb
 UbJ+alG18kSNesETCvAZPaBSbJgD34+Omtlam7cc1YsVeFZ/y5GHLk116Zmg4+ZjIetk
 C9rO4LYYnEW7gt2NkUkj366izDJKt4yoU/aQJM5uJfGmG1VZe1YRqWFLLiBkgNZunAgs
 Q+1/mSC7DHvV7MMbz6iMppxkR+NUgRiRioFGmbVhKcDMY0TRt7IV2hWl5Z8XcfTL4IrW
 OdSFXYOum/SPphhMLM/8T+7lqb3CyQgRFlp6O/gK6Vb083IcOstqyjWW9N+BLFMLIsH3
 XSuQ==
X-Gm-Message-State: AOAM533GGUPcMxfgdmI4bf11+0XmhYXVHtQvIn/CsfJF7eqq6m3BQDJ6
 lQD10vIXZMygzjZGfAZvXACZeAXG9HcgJZ0ls4U=
X-Google-Smtp-Source: ABdhPJxcq3v6i7BVQUJh3hVin6Vg5XwSsMr/Cquj0XQqCDM9edw3etyy8pAoysNL47Z8LQHGJn7xbTfRwB8fQUljv2U=
X-Received: by 2002:a05:6808:1817:b0:32b:6b00:e9a8 with SMTP id
 bh23-20020a056808181700b0032b6b00e9a8mr1302103oib.278.1654132672659; Wed, 01
 Jun 2022 18:17:52 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1652435208.git.research_trasio@irq.a4lg.com>
 <cover.1653472385.git.research_trasio@irq.a4lg.com>
 <dd7579a2a8b81632827d42a137c7f7720cc7ab5f.1653472385.git.research_trasio@irq.a4lg.com>
 <95b64f27-25e1-d2ad-f894-c890c3a1ffbb@eldorado.org.br>
 <347a7bef-9545-b715-de77-0bc80823d9cc@irq.a4lg.com>
In-Reply-To: <347a7bef-9545-b715-de77-0bc80823d9cc@irq.a4lg.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 2 Jun 2022 11:17:26 +1000
Message-ID: <CAKmqyKMBDPS+JbFXLf3YxNOUyYBksCn-52c+CZWs6xVJ2nyU6A@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] target/riscv: Make CPU property names lowercase
To: Tsukasa OI <research_trasio@irq.a4lg.com>
Cc: =?UTF-8?Q?V=C3=ADctor_Colombo?= <victor.colombo@eldorado.org.br>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=alistair23@gmail.com; helo=mail-oi1-x22e.google.com
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
X-List-Received-Date: Thu, 02 Jun 2022 01:18:01 -0000

On Thu, May 26, 2022 at 1:27 AM Tsukasa OI <research_trasio@irq.a4lg.com> w=
rote:
>
> On 2022/05/25 21:10, V=C3=ADctor Colombo wrote:
> > On 25/05/2022 06:54, Tsukasa OI wrote:
> >> Many CPU properties for RISC-V are in lowercase except those with
> >> "capitalized" (or CamelCase) names:
> >>
> >> -   Counters
> >> -   Zifencei
> >> -   Zicsr
> >> -   Zfh
> >> -   Zfhmin
> >> -   Zve32f
> >> -   Zve64f
> >>
> >> This commit makes lowercase names primary but keeps capitalized names
> >> as aliases (for backward comatibility, but with deprecated status).
> >
> > 'compatibility'
>
> I think I somehow pressed a backspace while finalizing.
> I submitted v2.1 (PATCH 2/3 only) and that should be fine.
>
> https://lists.gnu.org/archive/html/qemu-riscv/2022-05/msg00417.html

Do you mind re-sending the series, it's difficult to keep track of
single patch increments like this

>
> Thanks!
> Tsukasa
>
> >
> >>
> >> Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
> >
> > Tested-by: V=C3=ADctor Colombo <victor.colombo@eldorado.org.br>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> >
> >> ---
> >>   target/riscv/cpu.c | 27 ++++++++++++++++++++-------
> >>   1 file changed, 20 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> >> index 3f21563f2d..83262586e4 100644
> >> --- a/target/riscv/cpu.c
> >> +++ b/target/riscv/cpu.c
> >> @@ -840,6 +840,10 @@ static void riscv_cpu_init(Object *obj)
> >>   }
> >>
> >>   static Property riscv_cpu_properties[] =3D {
> >> +    /*
> >> +     * Names for ISA extensions and features should be in lowercase.
> >> +     */
> >> +
> >>       /* Base ISA and single-letter standard extensions */
> >>       DEFINE_PROP_BOOL("i", RISCVCPU, cfg.ext_i, true),
> >>       DEFINE_PROP_BOOL("e", RISCVCPU, cfg.ext_e, false),
> >> @@ -855,11 +859,11 @@ static Property riscv_cpu_properties[] =3D {
> >>       DEFINE_PROP_BOOL("h", RISCVCPU, cfg.ext_h, true),
> >>
> >>       /* Standard unprivileged extensions */
> >> -    DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
> >> -    DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
> >> +    DEFINE_PROP_BOOL("zicsr", RISCVCPU, cfg.ext_icsr, true),
> >> +    DEFINE_PROP_BOOL("zifencei", RISCVCPU, cfg.ext_ifencei, true),
> >>
> >> -    DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
> >> -    DEFINE_PROP_BOOL("Zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
> >> +    DEFINE_PROP_BOOL("zfh", RISCVCPU, cfg.ext_zfh, false),
> >> +    DEFINE_PROP_BOOL("zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
> >>       DEFINE_PROP_BOOL("zfinx", RISCVCPU, cfg.ext_zfinx, false),
> >>       DEFINE_PROP_BOOL("zdinx", RISCVCPU, cfg.ext_zdinx, false),
> >>       DEFINE_PROP_BOOL("zhinx", RISCVCPU, cfg.ext_zhinx, false),
> >> @@ -884,8 +888,8 @@ static Property riscv_cpu_properties[] =3D {
> >>       DEFINE_PROP_BOOL("zksh", RISCVCPU, cfg.ext_zksh, false),
> >>       DEFINE_PROP_BOOL("zkt", RISCVCPU, cfg.ext_zkt, false),
> >>
> >> -    DEFINE_PROP_BOOL("Zve32f", RISCVCPU, cfg.ext_zve32f, false),
> >> -    DEFINE_PROP_BOOL("Zve64f", RISCVCPU, cfg.ext_zve64f, false),
> >> +    DEFINE_PROP_BOOL("zve32f", RISCVCPU, cfg.ext_zve32f, false),
> >> +    DEFINE_PROP_BOOL("zve64f", RISCVCPU, cfg.ext_zve64f, false),
> >>
> >>       /* Standard supervisor-level extensions */
> >>       DEFINE_PROP_BOOL("svinval", RISCVCPU, cfg.ext_svinval, false),
> >> @@ -893,7 +897,7 @@ static Property riscv_cpu_properties[] =3D {
> >>       DEFINE_PROP_BOOL("svpbmt", RISCVCPU, cfg.ext_svpbmt, false),
> >>
> >>       /* Base features */
> >> -    DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
> >> +    DEFINE_PROP_BOOL("counters", RISCVCPU, cfg.ext_counters, true),
> >>       DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
> >>       DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
> >>       DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
> >> @@ -922,6 +926,15 @@ static Property riscv_cpu_properties[] =3D {
> >>       /* Other options */
> >>       DEFINE_PROP_BOOL("short-isa-string", RISCVCPU,
> >> cfg.short_isa_string, false),
> >>
> >> +    /* Capitalized aliases (deprecated and will be removed) */
> >> +    DEFINE_PROP("Counters", RISCVCPU, cfg.ext_counters,
> >> qdev_prop_bool, bool),
> >> +    DEFINE_PROP("Zifencei", RISCVCPU, cfg.ext_ifencei,
> >> qdev_prop_bool, bool),
> >> +    DEFINE_PROP("Zicsr", RISCVCPU, cfg.ext_icsr, qdev_prop_bool, bool=
),
> >> +    DEFINE_PROP("Zfh", RISCVCPU, cfg.ext_zfh, qdev_prop_bool, bool),
> >> +    DEFINE_PROP("Zfhmin", RISCVCPU, cfg.ext_zfhmin, qdev_prop_bool,
> >> bool),
> >> +    DEFINE_PROP("Zve32f", RISCVCPU, cfg.ext_zve32f, qdev_prop_bool,
> >> bool),
> >> +    DEFINE_PROP("Zve64f", RISCVCPU, cfg.ext_zve64f, qdev_prop_bool,
> >> bool),
> >> +
> >>       DEFINE_PROP_END_OF_LIST(),
> >>   };
> >>
> >> --
> >> 2.34.1
> >>
> >>
> >
> > Best regards,
> >
>

