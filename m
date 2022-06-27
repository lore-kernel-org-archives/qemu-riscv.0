Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o5r61-0000D2-Om
	for mharc-qemu-riscv@gnu.org; Mon, 27 Jun 2022 11:56:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daolu@rivosinc.com>)
 id 1o5r5y-0000Ba-ED
 for qemu-riscv@nongnu.org; Mon, 27 Jun 2022 11:56:14 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:45892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <daolu@rivosinc.com>)
 id 1o5r5v-0006n3-2f
 for qemu-riscv@nongnu.org; Mon, 27 Jun 2022 11:56:14 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 g20-20020a17090a579400b001ed52939d72so4406784pji.4
 for <qemu-riscv@nongnu.org>; Mon, 27 Jun 2022 08:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cgeVtywCH5D/+AO6r4BW6XFyszAlGpb4Kiy7BQ1egnM=;
 b=cmt+PHlVlKD+gAHAjJ/1gmZejCKtzRMNFNAJDJBZYALpJX2R8GKqSFNBBhvvO6f6Cp
 DBb0TyuHkXaiCB4V6p8dezYFUALGmxXKY7YNpTEtGTFOuDG7Sbo6NKZvYYnyA+QmmbYv
 1jckwlwUTbrt/qaXNTQ6Uls8M9mQMuowVvpoQW32JCwa95dQuEpeJNasM1bml6pEpbTT
 M5/pYARep7QwEi1kKOO7AsM1Z09PBc+8dSDyUo/wQs/jlvzddSEZeHR0OBGUJrUgZJrq
 lJuI/StEZMPLwueA9G8kA9pzhRNnwlAspL/Ce7U/dN3Bqu6kZMwq30kyd0CLNXb15hSr
 UmvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cgeVtywCH5D/+AO6r4BW6XFyszAlGpb4Kiy7BQ1egnM=;
 b=ryCXy9drfUYE7eRzwIM7oH2C5wiZV73XGESUHayR7fBPeQ51i/58zkiWinwgDYFPNV
 kadRA/NoczeHk6FgAESU+0fgfI+j5SKs/ZbVDEmqdnGggIuFsTkYiaQCvISyLgRQ9VTM
 vpFmBIdnaz7Oe5qMRWEGhFWh8RKT0AwokHgLHU+6hVsRJw6EwPZakP3Gqml46B10WlE4
 1U/BurQivLly+QyTPENsHoHsfZtDn0bm5mzq/hNuufoQUyeuUPtfJyabk+kcEHL4V3e5
 IMReftdLbydzhS6sQn0LDY/TBEpOrBs9SliqZqMN+IIZZkPwq5vBC/gk5ZjTUaWbZfj/
 J1cQ==
X-Gm-Message-State: AJIora8UgYi5+nQXwWIBYZLLKAET3gFHntwWlXkCnF439ePDiQ2VMyJU
 ItUYawf5vg9uF/qqd/b7j2cmb4z1p6LWdMYSZDxfhA==
X-Google-Smtp-Source: AGRyM1td33fHJCKA9nKRgj/FFaNQ98eNkSsFwKvK9ePsDJ+t3TtyY+t6wWkLqIYqt+af6Sjjj6kQIx12jKJKbTMI7Y4=
X-Received: by 2002:a17:90b:4382:b0:1ea:f4b6:1e29 with SMTP id
 in2-20020a17090b438200b001eaf4b61e29mr16330300pjb.159.1656345368924; Mon, 27
 Jun 2022 08:56:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220609044046.1903865-1-daolu@rivosinc.com>
 <20220609044046.1903865-2-daolu@rivosinc.com>
 <CAKmqyKN91QyYdhse0jUTGCX1i31tPuKpxBk46qJQVur4+50_tA@mail.gmail.com>
 <CAKh7v-THr8vn0WXnYEDuR3fCGjOmFLYMG1pkj6ar++51G0DuUw@mail.gmail.com>
 <CAKmqyKOQk=ZADkZ=t+scMXPrBAvDjvC_EiUpmESNsY=-48w=2Q@mail.gmail.com>
In-Reply-To: <CAKmqyKOQk=ZADkZ=t+scMXPrBAvDjvC_EiUpmESNsY=-48w=2Q@mail.gmail.com>
From: Dao Lu <daolu@rivosinc.com>
Date: Mon, 27 Jun 2022 08:55:58 -0700
Message-ID: <CAKh7v-TBACbpNxdhWY2sTkB_4O2K_5xf9P3d9Lz_2-AoupBb2A@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] target/riscv: Add Zihintpause support
To: Alistair Francis <alistair23@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Heiko Stuebner <heiko@sntech.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=daolu@rivosinc.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 27 Jun 2022 15:56:15 -0000

That sounds reasonable to me. Will change in the next version.

Thanks,
Dao


On Sun, Jun 26, 2022 at 10:13 PM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Wed, Jun 22, 2022 at 2:17 AM Dao Lu <daolu@rivosinc.com> wrote:
> >
> > From what I know that's generally the way reservations are handled:
> > if the forward progress requirements aren't met then the implementation
> > is free to break any outstanding reservations (the hardware is always
> > free to do that to a degree, but once forward progress is gone it can
> > always do that).  So this is legal, as would be not breaking the reservation.
>
> I'm thinking let's not break the reservation. That way we are
> consistent with the fence instruction. If we do want to clear the
> reservation then we should do it for fence as well.
>
> Alistair
>
> >
> > I don't have a strong opinion on this and am fine about changing it if
> > anyone does.
> >
> > Thanks,
> > Dao
> >
> > On Mon, Jun 20, 2022 at 4:39 PM Alistair Francis <alistair23@gmail.com> wrote:
> > >
> > > On Thu, Jun 9, 2022 at 2:42 PM Dao Lu <daolu@rivosinc.com> wrote:
> > > >
> > > > Added support for RISC-V PAUSE instruction from Zihintpause extension,
> > > > enabled by default.
> > > >
> > > > Tested-by: Heiko Stuebner <heiko@sntech.de>
> > > > Signed-off-by: Dao Lu <daolu@rivosinc.com>
> > > > ---
> > > >  target/riscv/cpu.c                      |  2 ++
> > > >  target/riscv/cpu.h                      |  1 +
> > > >  target/riscv/insn32.decode              |  7 ++++++-
> > > >  target/riscv/insn_trans/trans_rvi.c.inc | 18 ++++++++++++++++++
> > > >  4 files changed, 27 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > > > index ccacdee215..183fb37fdf 100644
> > > > --- a/target/riscv/cpu.c
> > > > +++ b/target/riscv/cpu.c
> > > > @@ -825,6 +825,7 @@ static Property riscv_cpu_properties[] = {
> > > >      DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
> > > >      DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
> > > >      DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
> > > > +    DEFINE_PROP_BOOL("Zihintpause", RISCVCPU, cfg.ext_zihintpause, true),
> > > >      DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
> > > >      DEFINE_PROP_BOOL("Zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
> > > >      DEFINE_PROP_BOOL("Zve32f", RISCVCPU, cfg.ext_zve32f, false),
> > > > @@ -996,6 +997,7 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
> > > >       *    extensions by an underscore.
> > > >       */
> > > >      struct isa_ext_data isa_edata_arr[] = {
> > > > +        ISA_EDATA_ENTRY(zihintpause, ext_zihintpause),
> > > >          ISA_EDATA_ENTRY(zfh, ext_zfh),
> > > >          ISA_EDATA_ENTRY(zfhmin, ext_zfhmin),
> > > >          ISA_EDATA_ENTRY(zfinx, ext_zfinx),
> > > > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > > > index fe6c9a2c92..e466a04a59 100644
> > > > --- a/target/riscv/cpu.h
> > > > +++ b/target/riscv/cpu.h
> > > > @@ -394,6 +394,7 @@ struct RISCVCPUConfig {
> > > >      bool ext_counters;
> > > >      bool ext_ifencei;
> > > >      bool ext_icsr;
> > > > +    bool ext_zihintpause;
> > > >      bool ext_svinval;
> > > >      bool ext_svnapot;
> > > >      bool ext_svpbmt;
> > > > diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> > > > index 4033565393..595fdcdad8 100644
> > > > --- a/target/riscv/insn32.decode
> > > > +++ b/target/riscv/insn32.decode
> > > > @@ -149,7 +149,12 @@ srl      0000000 .....    ..... 101 ..... 0110011 @r
> > > >  sra      0100000 .....    ..... 101 ..... 0110011 @r
> > > >  or       0000000 .....    ..... 110 ..... 0110011 @r
> > > >  and      0000000 .....    ..... 111 ..... 0110011 @r
> > > > -fence    ---- pred:4 succ:4 ----- 000 ----- 0001111
> > > > +
> > > > +{
> > > > +  pause  0000 0001   0000   00000 000 00000 0001111
> > > > +  fence  ---- pred:4 succ:4 ----- 000 ----- 0001111
> > > > +}
> > > > +
> > > >  fence_i  ---- ----   ----   ----- 001 ----- 0001111
> > > >  csrrw    ............     ..... 001 ..... 1110011 @csr
> > > >  csrrs    ............     ..... 010 ..... 1110011 @csr
> > > > diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
> > > > index f1342f30f8..ca75e05f4b 100644
> > > > --- a/target/riscv/insn_trans/trans_rvi.c.inc
> > > > +++ b/target/riscv/insn_trans/trans_rvi.c.inc
> > > > @@ -796,6 +796,24 @@ static bool trans_srad(DisasContext *ctx, arg_srad *a)
> > > >      return gen_shift(ctx, a, EXT_SIGN, tcg_gen_sar_tl, NULL);
> > > >  }
> > > >
> > > > +static bool trans_pause(DisasContext *ctx, arg_pause *a)
> > > > +{
> > > > +    if (!ctx->cfg_ptr->ext_zihintpause) {
> > > > +        return false;
> > > > +    }
> > > > +
> > > > +    /*
> > > > +     * PAUSE is a no-op in QEMU,
> > > > +     * however we need to clear the reservation,
> > > > +     * end the TB and return to main loop
> > > > +     */
> > > > +    tcg_gen_movi_tl(load_res, -1);
> > >
> > > I'm not clear why we need to clear the load_res? We don't do it for
> > > fence instruction
> > >
> > > Alistair
> > >
> > > > +    gen_set_pc_imm(ctx, ctx->pc_succ_insn);
> > > > +    tcg_gen_exit_tb(NULL, 0);
> > > > +    ctx->base.is_jmp = DISAS_NORETURN;
> > > > +
> > > > +    return true;
> > > > +}
> > > >
> > > >  static bool trans_fence(DisasContext *ctx, arg_fence *a)
> > > >  {
> > > > --
> > > > 2.25.1
> > > >
> > > >

