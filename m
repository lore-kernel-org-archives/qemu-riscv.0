Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pIqlO-0008M8-IO
	for mharc-qemu-riscv@gnu.org; Fri, 20 Jan 2023 07:44:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pIqlM-0008LS-QK
 for qemu-riscv@nongnu.org; Fri, 20 Jan 2023 07:44:56 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pIqlK-0003DU-Sy
 for qemu-riscv@nongnu.org; Fri, 20 Jan 2023 07:44:56 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 c4-20020a1c3504000000b003d9e2f72093so5764233wma.1
 for <qemu-riscv@nongnu.org>; Fri, 20 Jan 2023 04:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7dKPT7zZeztEVVbtJ/eXlr1NgI/lK4+/GGJyiR1XdRc=;
 b=GmfIlS3okrg4vEVz5uh9RrKJRsNo91feo2kcYs6+tK0NQXs/ysu4+4/qwWLos1h/7s
 4CLIMpr+AStWQEa+3gKYwq3xJXURMsKf4pyv+k2CU2zwYVACaK/8LwB/kyQByqjoW//x
 oyxn+WHYAYcPXGsDhcxtj5NkLA0VKd/d+5ZNChBdsfzbQRSFbMH2GKsIwLbtVKX5JyhG
 0+g6HY7YfpY7u+cTD0fiYg40Jn0UfbYUA0S+U2f6/FvJMCbJ7aNH6ZZJfkDS4k89h3qB
 dMo6HGKhpNFuO4qJ9b/4rBRMu4H/tY+m2mGgP8FrR5sd1mn/OmqE9oFamiziIRHqakun
 tp3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7dKPT7zZeztEVVbtJ/eXlr1NgI/lK4+/GGJyiR1XdRc=;
 b=7yRXSnes5udWNRVBAJMvMFZPBT2Zac3MGvdb7J8CDXrStdTQCizjdFdbh4Icsw7YCP
 4UxCNGZlA/TgAQis1T9Ek7zNj8LaH31Sz9xbP+lk2zB3vZWGiu//qeteZRF/pbx7sOHW
 /v0UXERWNcceEbV1loggqHDzqoA6LJWGVu+Oi14WWJWOvmih2hz6WKDb4zPzMVxXoSz9
 6kLvULHjTWYfGReAZVrMSKp/Z1IuhYR3vXoyutVDIUbJ/T7GcEEjYNq2bwf6QoIwMr+p
 j7X7tvKxJGSLzAV0GHk+wsbtbgLFl+QJymxkgiUWiOTVUS1Wx4Y4Od6f8D+eocwFItBZ
 VplA==
X-Gm-Message-State: AFqh2kp1737FO54Ss9plSnA4LVhA36LH9oYBFi+e6ZQU0MKjz7pHv2z7
 FXf8UHqFyA2qrpLU5iuZbWAsNpRt90jYbz1oqmsHdQ==
X-Google-Smtp-Source: AMrXdXtKGvxbVgintkp4tzFlcw8sMiqTjAo0kr4OoBmIVnicUa1zKfuvN5lT0N7pcThp1Ph4MVaBLc07AlrofzXHMKU=
X-Received: by 2002:a05:600c:35c6:b0:3d1:e710:9905 with SMTP id
 r6-20020a05600c35c600b003d1e7109905mr672093wmq.81.1674218692764; Fri, 20 Jan
 2023 04:44:52 -0800 (PST)
MIME-Version: 1.0
References: <20230113103453.42776-1-alexghiti@rivosinc.com>
 <20230113103453.42776-3-alexghiti@rivosinc.com>
 <20230117163138.jze47hjeeuwu2k4j@orel>
 <CAKmqyKNFX_ovg4Bp_30o0g4Jd5XJ98i9LdFgejsDmGW4iL2+OA@mail.gmail.com>
 <20230118121916.6aqj57leen72z5tz@orel>
 <CAKmqyKNcd3JOZgPb23idrzVjxHj+HHwPz6f6xPEp2oVGJEZKpg@mail.gmail.com>
 <CAHVXubiW2OaMhe3STLLMz=wDPJeY8hvPHbuBJgL7KZyw4=pRpw@mail.gmail.com>
 <CAKmqyKNNocLxKJtBtFnZkbTdCwC=TKaHpm4Sunut49nxQyw8yA@mail.gmail.com>
 <20230120095306.yyqq36dliabni3h3@orel>
In-Reply-To: <20230120095306.yyqq36dliabni3h3@orel>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Fri, 20 Jan 2023 13:44:41 +0100
Message-ID: <CAHVXubhPhNiCHRvpW11NSZx58Eqi56AVgnaDFnJvrN7wQs_5MA@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] riscv: Allow user to set the satp mode
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Alistair Francis <alistair23@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Ludovic Henry <ludovic@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alexghiti@rivosinc.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Fri, 20 Jan 2023 12:44:57 -0000

On Fri, Jan 20, 2023 at 10:53 AM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Fri, Jan 20, 2023 at 09:46:05AM +1000, Alistair Francis wrote:
> > On Thu, Jan 19, 2023 at 11:00 PM Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
> > >
> > > Hi Alistair, Andrew,
> > >
> > > On Thu, Jan 19, 2023 at 1:25 AM Alistair Francis <alistair23@gmail.com> wrote:
> > > >
> > > > On Wed, Jan 18, 2023 at 10:19 PM Andrew Jones <ajones@ventanamicro.com> wrote:
> > > > >
> > > > > On Wed, Jan 18, 2023 at 10:28:46AM +1000, Alistair Francis wrote:
> > > > > > On Wed, Jan 18, 2023 at 2:32 AM Andrew Jones <ajones@ventanamicro.com> wrote:
> > > > > > >
> > > > > > > On Fri, Jan 13, 2023 at 11:34:53AM +0100, Alexandre Ghiti wrote:
> > > > > ...
> > > > > > > > +
> > > > > > > > +    /* Get rid of 32-bit/64-bit incompatibility */
> > > > > > > > +    for (int i = 0; i < 16; ++i) {
> > > > > > > > +        if ((cpu->cfg.satp_mode.map & (1 << i)) && !valid_vm[i]) {
> > > > > > >
> > > > > > > If we ever define mode=1 for rv64, then 'sv32=on' will be incorrectly
> > > > > > > accepted as an alias. I think we should simply not define the sv32
> > > > > > > property for rv64 nor the rv64-only modes for rv32. So, down in
> > > > > > > riscv_add_satp_mode_properties() we can add some
> > > > > > >
> > > > > > >   #if defined(TARGET_RISCV32)
> > > > > > >   ...
> > > > > > >   #elif defined(TARGET_RISCV64)
> > > > > > >   ...
> > > > > > >   #endif
> > > > > >
> > > > > > Do not add any #if defined(TARGET_RISCV32) to QEMU.
> > > > > >
> > > > > > We are aiming for the riscv64-softmmu to be able to emulate 32-bit
> > > > > > CPUs and compile time macros are the wrong solution here. Instead you
> > > > > > can get the xlen of the hart and use that.
> > > > > >
> > > > >
> > > > > Does this mean we want to be able to do the following?
> > > > >
> > > > >   qemu-system-riscv64 -cpu rv32,sv32=on ...
> > > >
> > > > That's the plan
> > > >
> > > > >
> > > > > If so, then can we move the object_property_add() for sv32 to
> > > > > rv32_base_cpu_init() and the rest to rv64_base_cpu_init()?
> >
> > Wait! Sorry I didn't read this carefully enough. No, that is not what
> > we want to do. That then won't support the vendor CPUs.
> >
> > We just want to add the properties to all CPUs. Then if an invalid
> > option is set we should return an error.

Maybe I just don't get this part...

> >
> > Note that the 64-bit only configs can be hidden behind a #if
> > defined(TARGET_RISCV64).
>
> OK, so we want the original suggestion of putting an
> 'if defined(TARGET_RISCV64)' in riscv_add_satp_mode_properties(),
> which is called from register_cpu_props(), for the 64-bit only
> configs, but to support emulation we can't put sv32 under an
> 'if defined(TARGET_RISCV32)'. Instead, we need to check the xlen
> supported by the cpu type. That makes sense to me, and I think
> it'd be easiest to do in cpu_riscv_set_satp() with something like
>
>   if (!strncmp(name, "rv32", 4) &&
>       RISCV_CPU(obj)->env.misa_mxl != MXL_RV32) {
>      ... fail with error message ...
>   }
>

...but what about simply using the runtime check when we add the
properties? Like this:

static void riscv_add_satp_mode_properties(Object *obj)
{
    RISCVCPU *cpu = RISCV_CPU(obj);

    if (cpu->env.misa_mxl == MXL_RV32) {
        object_property_add(obj, "sv32", "bool", cpu_riscv_get_satp,
                            cpu_riscv_set_satp, NULL,
&cpu->cfg.satp_mode);
    } else {
        object_property_add(obj, "sv39", "bool", cpu_riscv_get_satp,
                            cpu_riscv_set_satp, NULL,
&cpu->cfg.satp_mode);
        object_property_add(obj, "sv48", "bool", cpu_riscv_get_satp,
                            cpu_riscv_set_satp, NULL,
&cpu->cfg.satp_mode);
        object_property_add(obj, "sv57", "bool", cpu_riscv_get_satp,
                            cpu_riscv_set_satp, NULL,
&cpu->cfg.satp_mode);
        object_property_add(obj, "sv64", "bool", cpu_riscv_get_satp,
                            cpu_riscv_set_satp, NULL,
&cpu->cfg.satp_mode);
    }
}

> Thanks,
> drew

