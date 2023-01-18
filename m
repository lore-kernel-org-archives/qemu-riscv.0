Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pICRz-0004yW-5X
	for mharc-qemu-riscv@gnu.org; Wed, 18 Jan 2023 12:42:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pICRx-0004y2-UW
 for qemu-riscv@nongnu.org; Wed, 18 Jan 2023 12:42:14 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pICRO-00038X-VD
 for qemu-riscv@nongnu.org; Wed, 18 Jan 2023 12:41:43 -0500
Received: by mail-ej1-x632.google.com with SMTP id mg12so12731414ejc.5
 for <qemu-riscv@nongnu.org>; Wed, 18 Jan 2023 09:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Z5QJE31641kROvra3WExSxS6lpGGaSkBajcAx4YcGvo=;
 b=Lf+9bDc2F+LQAg4RA5u/0SGsBzq6YcSlEKHWYkCLAyg0v5lA+wUG1htzXAv8w2cKyS
 1WGPGL/2ra0yo6iOVWYPJ0XOFYU2OqRuWodLpd98X3/Mc+4ktXvt7dJzmG9V/YB0aram
 hOft4rtXkQY8S5MiMykwjl90Xlcx04o42Ya+cblhVi5obXq/qqwFMYPuTdiNxZ+a+NEz
 NUDVqEhx2Tk9EYsfXSLPxctVCGREfbv5TwS8UaNmxyYpoPCyzofc2+zdG7JxBvb3g33K
 +T8sQM98W6t9hwshi4llTNc1A1fyW0kMP1E6+1pmFinhQ7pLStBc6wUBGBIylufGuiHx
 bfRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z5QJE31641kROvra3WExSxS6lpGGaSkBajcAx4YcGvo=;
 b=kZGZEpDHqbKMda3ZLl2+ooMRIshnPQUwnvTBs9XuMNoOBTVOgs5FxmvAn9ZEW/KEzm
 jVbuRd7NybrAI3qTlOVdM55C3gJkpMFAVzuXpWJldGl9vK27CL2GpvNEKlLjYo9odjuU
 DbcuvNsSryLYoMAcTcCzAF88B0g74bFc8uHzzubLrNc3lSj5XhKdIFGGbvv3G4a4GxX5
 hkeQtYM4AS6e7+qMKvpgBhbf+RsBIY3AkbzhgEGnb2QyJ/L/yRjYjIQ8KrS50NZry3Um
 lo+RmvgGvMG3Q1sE4JSbT5WX+rxgjkVKkDiEOkDXhzjdJd2WPmSzcr3Et7l1EjxekKhc
 RPew==
X-Gm-Message-State: AFqh2krlCIm7Xyict0c14GEl2swYn1Tdn0E+wdUTj6r5cQTQ5elUJcob
 Jt4pj9Ml0o68reQDGtIT1wlxGw==
X-Google-Smtp-Source: AMrXdXsB472RsXiXUJZ5kiB12NkmZPLo8OlPX2ACDrQrKlgz6c9Sed+OTUwinGe0cTraWhMcQBMTSw==
X-Received: by 2002:a17:907:6745:b0:86c:f7ac:71f7 with SMTP id
 qm5-20020a170907674500b0086cf7ac71f7mr8567457ejc.8.1674063696332; 
 Wed, 18 Jan 2023 09:41:36 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 kr12-20020a1709079a0c00b0084d44553af9sm12880091ejc.215.2023.01.18.09.41.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 09:41:35 -0800 (PST)
Date: Wed, 18 Jan 2023 18:41:34 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Ludovic Henry <ludovic@rivosinc.com>
Subject: Re: [PATCH v5 2/2] riscv: Allow user to set the satp mode
Message-ID: <20230118174134.7zgola3w7tcpxayy@orel>
References: <20230113103453.42776-1-alexghiti@rivosinc.com>
 <20230113103453.42776-3-alexghiti@rivosinc.com>
 <20230117163138.jze47hjeeuwu2k4j@orel>
 <CAHVXubjY6s=gs=J-bby5Hpeb-WXJ+dmRG7dFxr_ihs9Je2DHtw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHVXubjY6s=gs=J-bby5Hpeb-WXJ+dmRG7dFxr_ihs9Je2DHtw@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=ajones@ventanamicro.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Wed, 18 Jan 2023 17:42:14 -0000

On Wed, Jan 18, 2023 at 05:29:43PM +0100, Alexandre Ghiti wrote:
> Hey Andrew,
> 
> On Tue, Jan 17, 2023 at 5:31 PM Andrew Jones <ajones@ventanamicro.com> wrote:
> >
> > On Fri, Jan 13, 2023 at 11:34:53AM +0100, Alexandre Ghiti wrote:
> > > RISC-V specifies multiple sizes for addressable memory and Linux probes for
> > > the machine's support at startup via the satp CSR register (done in
> > > csr.c:validate_vm).
> > >
> > > As per the specification, sv64 must support sv57, which in turn must
> > > support sv48...etc. So we can restrict machine support by simply setting the
> > > "highest" supported mode and the bare mode is always supported.
> > >
> > > You can set the satp mode using the new properties "sv32", "sv39", "sv48",
> > > "sv57" and "sv64" as follows:
> > > -cpu rv64,sv57=on  # Linux will boot using sv57 scheme
> > > -cpu rv64,sv39=on  # Linux will boot using sv39 scheme
> > > -cpu rv64,sv57=off # Linux will boot using sv48 scheme
> > > -cpu rv64          # Linux will boot using sv57 scheme by default
> > >
> > > We take the highest level set by the user:
> > > -cpu rv64,sv48=on,sv57=on # Linux will boot using sv57 scheme
> > >
> > > We make sure that invalid configurations are rejected:
> > > -cpu rv64,sv32=on # Can't enable 32-bit satp mode in 64-bit
> > > -cpu rv64,sv39=off,sv48=on # sv39 must be supported if higher modes are
> > >                            # enabled
> > >
> > > We accept "redundant" configurations:
> > > -cpu rv64,sv48=on,sv57=off # Linux will boot using sv48 scheme
> > > -cpu rv64,sv32=on,sv32=off # Linux will boot using sv57 scheme (the default)
> > >
> > > In addition, we now correctly set the device-tree entry 'mmu-type' using
> > > those new properties.
> > >
> > > Co-Developed-by: Ludovic Henry <ludovic@rivosinc.com>
> > > Signed-off-by: Ludovic Henry <ludovic@rivosinc.com>
> > > Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> > > ---
> > >  hw/riscv/virt.c    |  19 ++--
> > >  target/riscv/cpu.c | 221 +++++++++++++++++++++++++++++++++++++++++++++
> > >  target/riscv/cpu.h |  19 ++++
> > >  target/riscv/csr.c |  17 +++-
> > >  4 files changed, 262 insertions(+), 14 deletions(-)
> > >
> > > diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> > > index 94ff2a1584..48d034a5f7 100644
> > > --- a/hw/riscv/virt.c
> > > +++ b/hw/riscv/virt.c
> > > @@ -228,7 +228,8 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
> > >      int cpu;
> > >      uint32_t cpu_phandle;
> > >      MachineState *mc = MACHINE(s);
> > > -    char *name, *cpu_name, *core_name, *intc_name;
> > > +    uint8_t satp_mode_max;
> > > +    char *name, *cpu_name, *core_name, *intc_name, *sv_name;
> > >
> > >      for (cpu = s->soc[socket].num_harts - 1; cpu >= 0; cpu--) {
> > >          cpu_phandle = (*phandle)++;
> > > @@ -236,14 +237,14 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
> > >          cpu_name = g_strdup_printf("/cpus/cpu@%d",
> > >              s->soc[socket].hartid_base + cpu);
> > >          qemu_fdt_add_subnode(mc->fdt, cpu_name);
> > > -        if (riscv_feature(&s->soc[socket].harts[cpu].env,
> > > -                          RISCV_FEATURE_MMU)) {
> > > -            qemu_fdt_setprop_string(mc->fdt, cpu_name, "mmu-type",
> > > -                                    (is_32_bit) ? "riscv,sv32" : "riscv,sv48");
> >
> > I just noticed that for the virt machine type, when the user doesn't
> > provide a satp mode cpu property on the command line, and hence gets
> > the default mode, they'll be silently changed from sv48 to sv57. That
> > default change should be a separate patch which comes after this one.
> > BTW, why sv57 and not sv48 or sv64?
> 
> The device tree entry should match the max available satp mode even
> though it makes little sense to have this entry in the first place:
> the max satp mode is easily discoverable at runtime (the kernel does
> that and does not care about the device tree entry).
> 
> But yes, this fix was mentioned at the very end of the commit log,
> which was weird anyway, so I'll move that to its own patch.

Ah, I interpreted that part of the commit message as simply pointing
out that the mmu-type is getting set per the user's input. Thanks for
moving this change to another patch.

...
> > > +
> > > +    if (riscv_feature(&cpu->env, RISCV_FEATURE_MMU)) {
> > > +        set_satp_mode(cpu, is_32_bit ? "sv32" : "sv57");
> > > +    } else {
> > > +        set_satp_mode(cpu, "mbare");
> >
> > nit: Could probably integrate set_satp_mode() into this function since
> > this function is the only place it's used.
> 
> At the moment yes, but this was a request from Frank to have a helper
> set the default satp mode in the cpu init functions, which I did not
> do here because I was unsure: @Frank Chang What should I use for
> sifive_e and sifive_u? rv64 will use the default mode.

The sifive stuff should probably be a separate patch. If that patch will
be part of this series then the proactive refactoring makes sense as we
can immediately see the users.

...
> > Why isn't all this 'if (cpu->cfg.satp_mode.map == 0)' block above at the
> > top of riscv_cpu_satp_mode_finalize() instead of here?
> >
> 
> Because the realize function seemed to do the properties processing
> and I thought the finalize one was meant to check the consistency of
> the configuration that resulted: I can change that if you don't agree.

finalize should do all the processing and checking, basically everything
not done in the property's set function. realize should call
finalize_features, which then calls each feature's finalize. Take a look
at arm's call chain, for example

 arm_cpu_realizefn
   arm_cpu_finalize_features
     arm_cpu_sve_finalize

Thanks,
drew

