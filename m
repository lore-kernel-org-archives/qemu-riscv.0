Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E3F2C4725D
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 05:43:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rRn4z-0005po-Gu; Mon, 22 Jan 2024 00:42:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rRn4x-0005nl-VT; Mon, 22 Jan 2024 00:42:40 -0500
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rRn4v-0004PJ-Ot; Mon, 22 Jan 2024 00:42:39 -0500
Received: by mail-vs1-xe31.google.com with SMTP id
 ada2fe7eead31-4678c4e51a5so507401137.0; 
 Sun, 21 Jan 2024 21:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705902156; x=1706506956; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vLzvH9+EWWPFcMB1uYeI4Z7U8DACRKEK9LgMsQ3CEFU=;
 b=eNbgFDNi5ZhMCejJxCEYpC+MK0Ju1l1MjpWLeXOgVrI0RWr13IKRCBZp8FrK/bS1zs
 gvGcF7+VHuICYpo0mIRcGn1Ej4vwMP0VMIE5ycU2Y8z+cNno1g5cU1LrLH3+DnUgma9B
 nQTymAXWuNOTyIqe0To7K9mRZAq5kdh9GHalmJK0XswODql26qF9MfFNCRrMvcY0PhsK
 Uphy0sCK04ZqhN8x1WfvRirWufyMmRbWT/v+LKsOKYw4o4Wf3yQHVfYm0kf3SswTOAH8
 3wnQklfzAISE4mk7ryZ1e6O9GuJK3lXhWreaeVGGun3CwpN783AELKo2U+tom/9ZDNVA
 5vYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705902156; x=1706506956;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vLzvH9+EWWPFcMB1uYeI4Z7U8DACRKEK9LgMsQ3CEFU=;
 b=Dj0/CzL4X3orJ4Cp3N7Lw8xz23w5Gw4LdK2BCheCt7y74WEs1XIeui+F6ceU3wsyHo
 g53mPIP4mHplt2SwS6VsefKzLG5LZOq3wdGokHX9AvbfPql0G+mudJ1ngG/DyypBMc9W
 A3lj2LuJvGZfo7yIN+S/8/T/R0rgAqsBATH1/DFoCtH+nzjc3mfPv84HxFwjurB/uTJI
 ddqdsJUP7ZGDR3NhXoTb+dSYcePtyUEZJm9Gt85zQZmH6mSMXaAkXmFBkvyp/50OS0PB
 8TmgK+V7v5EmbEjVB9q+QEPFBWDwTCJo7/6kcfAXCFwd0hBWqcAPp+NhNB8MSxbJTf/d
 bb3Q==
X-Gm-Message-State: AOJu0Yydg4ftzieXfhDjyhQm+KdPd7TUbLqi7n5LE9iNJhAcbdMyHVr0
 z/5CMt7ONG3s2Klio9l5BJkUKBWlT4Mo/u+hHrYZ7TFZY/irK9ei0lrUhCeIRxJc3nhCsYYfuQs
 KDCedpXGcjWUDTyWEKgRbxlxAS1M=
X-Google-Smtp-Source: AGHT+IGRKb3KRFtugadkX0+TccGbYTq5FrxKvAMkRYPLWe4PQI9ULXlFFJff6tq21+UNnwXBI8otQpKAOVyum2hCO1E=
X-Received: by 2002:a05:6102:160a:b0:469:b07e:9e38 with SMTP id
 cu10-20020a056102160a00b00469b07e9e38mr573575vsb.21.1705902156228; Sun, 21
 Jan 2024 21:42:36 -0800 (PST)
MIME-Version: 1.0
References: <20240110040203.1920924-1-hchauhan@ventanamicro.com>
 <e2763db2-fade-482d-b433-1bfce6acf7d3@ventanamicro.com>
 <CAKmqyKOA6OtixYoMJ_qtXj_u0t6rMdHawg0VEvq3-=mK4q6_XQ@mail.gmail.com>
 <3c091744cd4bafeb7c1d177455fa9789822e7209.camel@rivosinc.com>
In-Reply-To: <3c091744cd4bafeb7c1d177455fa9789822e7209.camel@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Jan 2024 15:42:10 +1000
Message-ID: <CAKmqyKPkjBBo-2EAL25-3qACSv4c4naGT8V-F5e5as4D=WVa9g@mail.gmail.com>
Subject: Re: [PATCH 0/2] Export debug triggers as an extension
To: Rob Bradford <rbradford@rivosinc.com>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Himanshu Chauhan <hchauhan@ventanamicro.com>, 
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Alvin Chang <alvinga@andestech.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e31;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe31.google.com
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

On Fri, Jan 12, 2024 at 11:34=E2=80=AFPM Rob Bradford <rbradford@rivosinc.c=
om> wrote:
>
> On Fri, 2024-01-12 at 13:52 +1000, Alistair Francis wrote:
> > On Thu, Jan 11, 2024 at 5:20=E2=80=AFAM Daniel Henrique Barboza
> > <dbarboza@ventanamicro.com> wrote:
> > >
> > > Himanshu,
> > >
> > > We spoke offline but let's make everyone aware:
> > >
> > > - 'sdtrig' should be marked with 'x-' and be an experimental
> > > extension since
> > > the spec isn't yet frozen;
> > >
> > > - Alvin sent a patch to the ML adding the 'mcontext' CSR for
> > > 'sdtrig' some time
> > > ago:
> > >
> > > "[PATCH v2] target/riscv: Implement optional CSR mcontext of debug
> > > Sdtrig extension"
> > >
> > > It would be good to put his patch on top of this series to ease the
> > > review for everyone.
> > > The changes done in patch 2 would also be applicable to the
> > > mcontext CSR;
> > >
> > >
> > > - last but probably the most important: the existing 'debug' flag
> > > seems to be acting as
> > > the actual 'sdtrig' extension due to how the flag is gating trigger
> > > code, e.g.:
> > >
> > >    if (cpu->cfg.debug) {
> > >          riscv_trigger_realize(&cpu->env);
> > >      }
> > >
> > > and
> > >
> > >      if (cpu->cfg.debug) {
> > >          riscv_trigger_reset_hold(env);
> > >      }
> > >
> > >
> > > If that's really the case, all the checks with cpu->cfg.debug will
> > > need to also include
> > > cpu->cfg.ext_sdtrig (one or the other). And now we'll have to make
> > > an option: do we leave
> > > the debug triggers (i.e. the 'debug' flag) as always enabled?
> >
> > From memory the "debug" property is for the original debug spec:
> > https://github.com/riscv/riscv-debug-spec/releases/tag/task_group_vote
> >
> > That was ratified and is an official extension. AFAIK this is what is
> > in physical hardware as well.
> >
> > The actual PDF says draft though, I'm not sure what's going on there.
> >
> > The debug spec doesn't have a Z* name, so it's just "debug", at least
> > AFAIK.
> >
> > "sdtrig" seems to be a new backwards-incompatible extension doing
> > basically the same thing. What a mess
> >
> > >
> > > If it's up to me I would make 'debug' as default 'false' and
> > > deprecate it. Users will need
> >
> > I don't think that's the right approach. It's a ratified extension
> > that we are supporting and is in hardware. I think we are stuck
> > supporting it
> >
> >
>
> I've done a bit of digging and I agree things are quite messy. Here are
> my discoveries:
>
> The debug option and the code for triggers was added in these commits:
>
> c9711bd778 target/riscv: cpu: Enable native debug feature
> 38b4e781a4 target/riscv: machine: Add debug state description
> b6092544fc target/riscv: csr: Hook debug CSR read/write
> 1acdb3b013 target/riscv: cpu: Add a config option for native debug
> 95799e36c1 target/riscv: Add initial support for the Sdtrig extension
>
> In March 2022 - since the commit refers to the Sdtrig extension name
> and from the date this was an implementation not of the ratified 0.13
> debug spec (which did not have Sdtrig as a separate extension) but
> rather a version of the in development 1.0 debug spec.

Yeah... We used the "stable" from master. That is our mistake there.

I'm pretty sure we targeted the 0.13. The "Sdtrig" was only added in
the v4 as the changelog says: "mention Sdtrig extension in the commit"

>
> It's not trivial to tell if it's closer to the ratified 0.13 version or
> the (hopefully soon to be frozen) 1.0 version.
>
> As the only part of the debug specification to be implemented is the
> triggers then effectively the debug option is x-sdtrig.
>
> I don't think there is any way for code running on the machine to
> identify what version of the debug is implemented - the appropriate
> register is only available for external debug. Once 1.0 is frozen then
> the presence of Sdtrig isa string would indicate 1.0 trigger support is
> available.
>
> According to JIRA - https://jira.riscv.org/browse/RVS-981 the debug
> specification should freeze this month.
>
> How about considering this as a solution:
>
> - Add a new x-sdtrig option that defaults to false
> - Deprecate debug option - but retain it with default on

We can't deprecate a ratified spec. The 0.13 just seems to call it
"debug" so that's what we are stuck with

> - Add warning if triggers are used and x-sdtrig is not enabled
> - Update the trigger implementation to match frozen spec

We will need to support two versions, as there are two ratified specs.

Alistair

>
> There is potentially a chance that some use cases will be broken but I
> don't think triggers are being widely use - the SBI support only just
> got merged:
> https://github.com/riscv-software-src/opensbi/commit/97f234f15c9657c6ec69=
fa6ed745be8107bf6ae2
>
> Hope this is helpful,
>
> Rob
>

