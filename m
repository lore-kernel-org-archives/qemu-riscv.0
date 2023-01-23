Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pJwvt-0001fD-W2
	for mharc-qemu-riscv@gnu.org; Mon, 23 Jan 2023 08:32:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pJwva-0001bh-7V
 for qemu-riscv@nongnu.org; Mon, 23 Jan 2023 08:32:11 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pJwvN-0001AU-U7
 for qemu-riscv@nongnu.org; Mon, 23 Jan 2023 08:31:55 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 d4-20020a05600c3ac400b003db1de2aef0so8564939wms.2
 for <qemu-riscv@nongnu.org>; Mon, 23 Jan 2023 05:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mBD5y8cfI6GMwahAw4KyuJkxWK4yyvM9tjn4dxB1/vk=;
 b=gKnnmDA7IXowzA524+ovhlLeVCltdsaZnzPaNV+xZPY2Dv+x6Guxo+DQbmQfKTetHS
 0+BahoM/KESIalrOeTLg4TYFigyGMKF/GjFuk6NQwBPsrTU4SNjiUcqxKbJQ9LNhYmlb
 ZqD5FqqAbGtBo6DO3AE6DyM5Bx/9Xbe/gwcXZ8CPhkBd7EK+yKzRQL4Ujrm6IcSYaaPu
 zw8B0RMDkr+sH3HKH+BCVKR7ykiJTTRtxHyRWDwrTg6qesBE+Lpm32Pgx0x1jNOi4f/B
 aKcW3IJyMW+bdXg9oZ4Di0sw1HFudTD5fdisvheelPLYFsfhdP827zAwYA95fT24M8/C
 eh1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mBD5y8cfI6GMwahAw4KyuJkxWK4yyvM9tjn4dxB1/vk=;
 b=UV8tApDpR0Srrfxjd2HmCNEcZppjk6g/AN/qE7sdi9VpXfYI+R1MUJ/g26bp9ed7qY
 AccE3q+yQdpLY4JqJTLitEVqlIkcHRxQxVStVkXvo2PTmtQyxVVNGEK4zfjlkkfQozJm
 OpJOTsnLwyRxSEVCfCAbKBDEaDKrk5fieGqkLYsnxBZBg1Vgd9zLCfShf3V0f4LYQH1/
 4tSDLUtXMACEfRK9CFB5RsFQGZ+4rJdZWX+QF/5v2z/CDih+606VLY0ilsPDVCmk+l7k
 bcHGcqNpMZ8ISfVobTt2IUQazOF0yYVG4Z9LqBa+4QAvn3xCyUsd+Fyzed+ypnTQ1kik
 HshA==
X-Gm-Message-State: AFqh2kpCJOFdLhJTAO9mHg0yPf/K7BElcrAMLePom/JkY8fdoVzeGPFn
 auBo9+xP8guTiGvXYdkc8FxnLw==
X-Google-Smtp-Source: AMrXdXtCJQH+shuT8TM2DWLcDW3vfAmXySSIts6bimE43JL+BXwiojejXuGvVjmMtUyKFdP+LZnqtA==
X-Received: by 2002:a05:600c:a4e:b0:3db:14d0:65be with SMTP id
 c14-20020a05600c0a4e00b003db14d065bemr19426771wmq.34.1674480688621; 
 Mon, 23 Jan 2023 05:31:28 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 17-20020a05600c021100b003dafb0c8dfbsm12169287wmi.14.2023.01.23.05.31.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 05:31:28 -0800 (PST)
Date: Mon, 23 Jan 2023 14:31:27 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v6 5/5] riscv: Introduce satp mode hw capabilities
Message-ID: <20230123133127.7dyqhdryrbp27o46@orel>
References: <20230123090324.732681-1-alexghiti@rivosinc.com>
 <20230123090324.732681-6-alexghiti@rivosinc.com>
 <20230123105112.zidabgiswkpnzo5r@orel>
 <CAHVXubg77ywMLWh=JOmdhWA=pYeQ5nLAif_9VhRmkcpD6wKZng@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHVXubg77ywMLWh=JOmdhWA=pYeQ5nLAif_9VhRmkcpD6wKZng@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x32b.google.com
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
X-List-Received-Date: Mon, 23 Jan 2023 13:32:15 -0000

On Mon, Jan 23, 2023 at 12:15:08PM +0100, Alexandre Ghiti wrote:
> On Mon, Jan 23, 2023 at 11:51 AM Andrew Jones <ajones@ventanamicro.com> wrote:
> >
> > On Mon, Jan 23, 2023 at 10:03:24AM +0100, Alexandre Ghiti wrote:
> > > Currently, the max satp mode is set with the only constraint that it must be
> > > implemented in qemu, i.e. set in valid_vm_1_10_[32|64].
> > >
> > > But we actually need to add another level of constraint: what the hw is
> > > actually capable of, because currently, a linux booting on a sifive-u54
> > > boots in sv57 mode which is incompatible with the cpu's sv39 max
> > > capability.
> > >
> > > So add a new bitmap to RISCVSATPMap which contains this capability and
> > > initialize it in every XXX_cpu_init.
> > >
> > > Finally, we have the following chain of constraints:
> > >
> > > Qemu capability > HW capability > User choice > Software capability
> >
> >                                                   ^ What software is this?
> >                          I'd think the user's choice would always be last.
> >
> > >
> > > Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> > > ---
> > >  target/riscv/cpu.c | 78 +++++++++++++++++++++++++++++++---------------
> > >  target/riscv/cpu.h |  8 +++--
> > >  2 files changed, 59 insertions(+), 27 deletions(-)
> > >
> > > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > > index e409e6ab64..19a37fee2b 100644
> > > --- a/target/riscv/cpu.c
> > > +++ b/target/riscv/cpu.c
> > > @@ -292,24 +292,39 @@ const char *satp_mode_str(uint8_t satp_mode, bool is_32_bit)
> > >      g_assert_not_reached();
> > >  }
> > >
> > > -/* Sets the satp mode to the max supported */
> > > -static void set_satp_mode_default(RISCVCPU *cpu, bool is_32_bit)
> > > +static void set_satp_mode_max_supported(RISCVCPU *cpu,
> > > +                                        const char *satp_mode_str,
> > > +                                        bool is_32_bit)
> > >  {
> > > -    if (riscv_feature(&cpu->env, RISCV_FEATURE_MMU)) {
> > > -        cpu->cfg.satp_mode.map |=
> > > -                        (1 << satp_mode_from_str(is_32_bit ? "sv32" : "sv57"));
> > > -    } else {
> > > -        cpu->cfg.satp_mode.map |= (1 << satp_mode_from_str("mbare"));
> > > +    uint8_t satp_mode = satp_mode_from_str(satp_mode_str);
> > > +    const bool *valid_vm = is_32_bit ? valid_vm_1_10_32 : valid_vm_1_10_64;
> > > +
> > > +    for (int i = 0; i <= satp_mode; ++i) {
> > > +        if (valid_vm[i]) {
> > > +            cpu->cfg.satp_mode.supported |= (1 << i);
> >
> > I don't think we need a new 'supported' bitmap, I think each board that
> > needs to further constrain va-bits from what QEMU supports should just set
> > valid_vm_1_10_32/64. I.e. drop const from the arrays and add an init
> > function something like
> 
> This was my first idea too, but those arrays are global and I have to
> admit that I thought it was possible to emulate a cpu with different
> cores. Anyway, isn't it a bit weird to store this into some global
> array whereas it is intimately linked to the CPU? To me, it makes
> sense to keep those variables as a way to know what qemu is able to
> emulate and have a CPU specific map like in this patch for the hw
> capabilities. Does it make sense to you?

Ah, yes, to support heterogeneous configs it's best to keep this
information per-cpu. I'll take another look at the patch.

> 
> >
> >  #define QEMU_SATP_MODE_MAX VM_1_10_SV64
> >
> >  void riscv_cpu_set_satp_mode_max(RISCVCPU *cpu, uint8_t satp_mode_max)
> >  {
> >      bool is_32_bit = cpu->env.misa_mxl == MXL_RV32;
> >      bool *valid_vm = is_32_bit ? valid_vm_1_10_32 : valid_vm_1_10_64;
> >
> >      g_assert(satp_mode_max <= QEMU_SATP_MODE_MAX);
> >      g_assert(!is_32_bit || satp_mode_max < 2);
> >
> >      memset(valid_vm, 0, sizeof(*valid_vm));
> >
> >      for (int i = 0; i <= satp_mode_max; i++) {
> >          valid_vm[i] = true;
> >      }
> >  }
> >
> > The valid_vm[] checks already in finalize should then manage the
> > validation needed to constrain boards. Only boards that care about
> > this need to call this function, otherwise they'll get the default.
> >
> > Also, this patch should come before the patch that changes the default
> > for all boards to sv57 in order to avoid breaking bisection.
> 
> As I explained earlier, I didn't change the default to sv57! Just
> fixed what was passed via the device tree, which should not be used
> anyway :)

OK, I keep misunderstanding how we're "fixing" something which is
is wrong, but apparently doesn't exhibit any symptoms. So, assuming
it doesn't matter, then I guess it can come anywhere in the series.

Thanks,
drew

