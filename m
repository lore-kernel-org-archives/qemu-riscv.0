Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pIecH-0003Cv-LM
	for mharc-qemu-riscv@gnu.org; Thu, 19 Jan 2023 18:46:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pIecA-00037A-94; Thu, 19 Jan 2023 18:46:41 -0500
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pIec6-0002NA-0h; Thu, 19 Jan 2023 18:46:35 -0500
Received: by mail-ua1-x935.google.com with SMTP id u3so991214uae.0;
 Thu, 19 Jan 2023 15:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KPqJVJp80N/DeT38pRVWoUhAfRHJVaCGxreCuk0z0lQ=;
 b=L1Wa+IhLlyW6uZQjQEganUvpaCWpvURHGyHXP/hvz7QjzHmmC/Y7sBp1otKN/UZguM
 Om12yWN9TTQRytnGqvErPn7lVAh8bFJiC8wKQDI6ALcRPdJRa+AlM7qNFUmsnF7pUSsS
 ZBsIozRh1OmTS0F7j0oLMExg0juSTHgeo6X14x2d/GhizXv2xVP3COLVuuzbJVLAl7wF
 r+IvHheOGT2IVXuA0u7fpZCX3YPddn+ILJrGF6kOoOf9Xfe0gRgSovjsqQMUpl7CFASb
 SMGOEzZEzCRGM5wgbOBxuNWoTUvvD0qBQhAJiFX079Dqtg67r2zgpadPzERTwW9u2eAv
 5nSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KPqJVJp80N/DeT38pRVWoUhAfRHJVaCGxreCuk0z0lQ=;
 b=uUI8PxNwLYQ3kgmx3sUEwMEnX8pFIxEmGEj43bO7Tzr3Jbsc9HDhYS5Nt+e9cHoEbB
 j1jM29Gv1udgGz6BtnZzdpBK6/uwCPPZLrJnsvIYwMUjkknX/P91UcOpuAPcj2FwaNWb
 LBiWHasXgMVyUX5WXqFQJeKLbplGWMM7r0Dv90y9WSeErjifr11poq69CyDCz0oRsQTf
 Q1zHJSwCUusTVYUOc7cg5KgrQTTlN7bS0j54Gd9GkcsIsfWjFgtYuJqikNtBBjN5vCY0
 ncDT/QNCLj3ZEueXG8g1n412vL3QHZJ24rN5Z1I6gKyqlduShnRW+UPevEA+d2+31WtK
 suZA==
X-Gm-Message-State: AFqh2kqZJQBJBm7tHyMHbCT0WzfkqY1PBTJSZLquT4oyD02qeqbLCWr7
 PNsQ2HaZnALJa1q0QO91maYpA17dXXuqQ0FCUFg=
X-Google-Smtp-Source: AMrXdXumeFp70WmynUNpbw4r3HyocN0em/Mt78DcvpI/jdNUgdZAU9rfcKmdnZKjPtthcOUvjratqDEP88Uu6WfWjKY=
X-Received: by 2002:ab0:3b8d:0:b0:419:2865:3ae7 with SMTP id
 p13-20020ab03b8d000000b0041928653ae7mr1567838uaw.70.1674171991715; Thu, 19
 Jan 2023 15:46:31 -0800 (PST)
MIME-Version: 1.0
References: <20230113103453.42776-1-alexghiti@rivosinc.com>
 <20230113103453.42776-3-alexghiti@rivosinc.com>
 <20230117163138.jze47hjeeuwu2k4j@orel>
 <CAKmqyKNFX_ovg4Bp_30o0g4Jd5XJ98i9LdFgejsDmGW4iL2+OA@mail.gmail.com>
 <20230118121916.6aqj57leen72z5tz@orel>
 <CAKmqyKNcd3JOZgPb23idrzVjxHj+HHwPz6f6xPEp2oVGJEZKpg@mail.gmail.com>
 <CAHVXubiW2OaMhe3STLLMz=wDPJeY8hvPHbuBJgL7KZyw4=pRpw@mail.gmail.com>
In-Reply-To: <CAHVXubiW2OaMhe3STLLMz=wDPJeY8hvPHbuBJgL7KZyw4=pRpw@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 20 Jan 2023 09:46:05 +1000
Message-ID: <CAKmqyKNNocLxKJtBtFnZkbTdCwC=TKaHpm4Sunut49nxQyw8yA@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] riscv: Allow user to set the satp mode
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Ludovic Henry <ludovic@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::935;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x935.google.com
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
X-List-Received-Date: Thu, 19 Jan 2023 23:46:42 -0000

On Thu, Jan 19, 2023 at 11:00 PM Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
>
> Hi Alistair, Andrew,
>
> On Thu, Jan 19, 2023 at 1:25 AM Alistair Francis <alistair23@gmail.com> wrote:
> >
> > On Wed, Jan 18, 2023 at 10:19 PM Andrew Jones <ajones@ventanamicro.com> wrote:
> > >
> > > On Wed, Jan 18, 2023 at 10:28:46AM +1000, Alistair Francis wrote:
> > > > On Wed, Jan 18, 2023 at 2:32 AM Andrew Jones <ajones@ventanamicro.com> wrote:
> > > > >
> > > > > On Fri, Jan 13, 2023 at 11:34:53AM +0100, Alexandre Ghiti wrote:
> > > ...
> > > > > > +
> > > > > > +    /* Get rid of 32-bit/64-bit incompatibility */
> > > > > > +    for (int i = 0; i < 16; ++i) {
> > > > > > +        if ((cpu->cfg.satp_mode.map & (1 << i)) && !valid_vm[i]) {
> > > > >
> > > > > If we ever define mode=1 for rv64, then 'sv32=on' will be incorrectly
> > > > > accepted as an alias. I think we should simply not define the sv32
> > > > > property for rv64 nor the rv64-only modes for rv32. So, down in
> > > > > riscv_add_satp_mode_properties() we can add some
> > > > >
> > > > >   #if defined(TARGET_RISCV32)
> > > > >   ...
> > > > >   #elif defined(TARGET_RISCV64)
> > > > >   ...
> > > > >   #endif
> > > >
> > > > Do not add any #if defined(TARGET_RISCV32) to QEMU.
> > > >
> > > > We are aiming for the riscv64-softmmu to be able to emulate 32-bit
> > > > CPUs and compile time macros are the wrong solution here. Instead you
> > > > can get the xlen of the hart and use that.
> > > >
> > >
> > > Does this mean we want to be able to do the following?
> > >
> > >   qemu-system-riscv64 -cpu rv32,sv32=on ...
> >
> > That's the plan
> >
> > >
> > > If so, then can we move the object_property_add() for sv32 to
> > > rv32_base_cpu_init() and the rest to rv64_base_cpu_init()?

Wait! Sorry I didn't read this carefully enough. No, that is not what
we want to do. That then won't support the vendor CPUs.

We just want to add the properties to all CPUs. Then if an invalid
option is set we should return an error.

Note that the 64-bit only configs can be hidden behind a #if
defined(TARGET_RISCV64).

Alistair

> > > Currently, that would be doing the same thing as proposed above,
> > > since those functions are under TARGET_RISCV* defines, but I guess
> > > the object_property_add()'s would then be in more or less the right
> > > places for when the 32-bit emulation support work is started.
> >
> > Sounds like a good idea :)
>
> What about riscv_any_cpu_init and riscv_host_cpu_init?
>
> >
> > Alistair
> >
> > >
> > > Thanks,
> > > drew

