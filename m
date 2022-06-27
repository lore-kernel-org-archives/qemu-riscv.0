Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o5h3o-0006Ka-Gg
	for mharc-qemu-riscv@gnu.org; Mon, 27 Jun 2022 01:13:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o5h3m-0006Hi-Ib; Mon, 27 Jun 2022 01:13:18 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:44830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o5h3k-0005T7-Or; Mon, 27 Jun 2022 01:13:18 -0400
Received: by mail-pl1-x630.google.com with SMTP id l6so7133445plg.11;
 Sun, 26 Jun 2022 22:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a68BPhoA1A5/sytnQGPWhGsGiN9xQWtdpJ+HlRjJx6M=;
 b=l96MAOSdbNwpjM+UHKrjoyH8UAQr33VDzVy1BQDDwa06VG1fIB2tlaHevdrTDhxXx0
 U81fhnEkJx752CGbLWFxo8f0R3rDHcZ0ptzA2CZxLNe+phgeSFdHX1mKgoEjyhJXOPJ4
 BIFNnYYLV0RGNiLVjlz2y7VJmp89EHSnwpo8Etnn4+ROQS34zeOYIRyXOaf4aKfDuKH+
 FB8/jxvivDInb7wpNfR3vAfSY2NtYT1bxHS4gJMh27oDaMs1kKkrkfa6LGDJ1DEy51xD
 Vg5MScrnHFqUlQjq/nvPlO7JwFzTpky6P0HOoS9AiOAL1cF5xjRXy/ialmIDMHdfjrWN
 r/lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a68BPhoA1A5/sytnQGPWhGsGiN9xQWtdpJ+HlRjJx6M=;
 b=zEIVx82pspVorGCl2G33y17qAvzhM2r1ULxXiRs+tfrPucYTqeqEq1BTP0dOfJVjww
 f98kAbQ+ihP0fP47Lqf1Ef3GKruw8KX4ICZA7Gv0NysbRsD71k9DrHt7ds0Z9DFWNrWV
 9tWycdWq1nG4FUmyKgMGbOk3S6/Y3b7gBfYCFjgN5VUstFr+S6JQls1LXq/yO5a0mnZ+
 httnek58U0OgbnrBrqLbY3etBWM4OI9iKrGYZmSVwz+i3EX5et6yALjRrh+HSfVrgN3I
 L7Hv3hQhORQ1zmyu93rI+c7XX+uSc/Vqt3e0OR5rzfGVp1x0H7HbM0f1pAUCcKDn/UzS
 QOaw==
X-Gm-Message-State: AJIora8weCazDy6fxhJqirs3sPOMXj9KgHFietA1StENVq3FIzONACBB
 MjnlROQ9Xiy2Eg18a7HQS6EZA7PaJFYLQdvicHY=
X-Google-Smtp-Source: AGRyM1uqAyNJkbvU3Izi3yNyPq/wigylq0759P8iCRrq+jjs4GVux5VHdqFuVRGaNF06XdWw2SAIrVq5tE/aiR1+N54=
X-Received: by 2002:a17:90a:7e82:b0:1ec:9d45:7759 with SMTP id
 j2-20020a17090a7e8200b001ec9d457759mr18515509pjl.166.1656306794896; Sun, 26
 Jun 2022 22:13:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220609044046.1903865-1-daolu@rivosinc.com>
 <20220609044046.1903865-2-daolu@rivosinc.com>
 <CAKmqyKN91QyYdhse0jUTGCX1i31tPuKpxBk46qJQVur4+50_tA@mail.gmail.com>
 <CAKh7v-THr8vn0WXnYEDuR3fCGjOmFLYMG1pkj6ar++51G0DuUw@mail.gmail.com>
In-Reply-To: <CAKh7v-THr8vn0WXnYEDuR3fCGjOmFLYMG1pkj6ar++51G0DuUw@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 27 Jun 2022 15:12:48 +1000
Message-ID: <CAKmqyKOQk=ZADkZ=t+scMXPrBAvDjvC_EiUpmESNsY=-48w=2Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] target/riscv: Add Zihintpause support
To: Dao Lu <daolu@rivosinc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Heiko Stuebner <heiko@sntech.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x630.google.com
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
X-List-Received-Date: Mon, 27 Jun 2022 05:13:19 -0000

On Wed, Jun 22, 2022 at 2:17 AM Dao Lu <daolu@rivosinc.com> wrote:
>
> From what I know that's generally the way reservations are handled:
> if the forward progress requirements aren't met then the implementation
> is free to break any outstanding reservations (the hardware is always
> free to do that to a degree, but once forward progress is gone it can
> always do that).  So this is legal, as would be not breaking the reservation.

I'm thinking let's not break the reservation. That way we are
consistent with the fence instruction. If we do want to clear the
reservation then we should do it for fence as well.

Alistair

>
> I don't have a strong opinion on this and am fine about changing it if
> anyone does.
>
> Thanks,
> Dao
>
> On Mon, Jun 20, 2022 at 4:39 PM Alistair Francis <alistair23@gmail.com> wrote:
> >
> > On Thu, Jun 9, 2022 at 2:42 PM Dao Lu <daolu@rivosinc.com> wrote:
> > >
> > > Added support for RISC-V PAUSE instruction from Zihintpause extension,
> > > enabled by default.
> > >
> > > Tested-by: Heiko Stuebner <heiko@sntech.de>
> > > Signed-off-by: Dao Lu <daolu@rivosinc.com>
> > > ---
> > >  target/riscv/cpu.c                      |  2 ++
> > >  target/riscv/cpu.h                      |  1 +
> > >  target/riscv/insn32.decode              |  7 ++++++-
> > >  target/riscv/insn_trans/trans_rvi.c.inc | 18 ++++++++++++++++++
> > >  4 files changed, 27 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > > index ccacdee215..183fb37fdf 100644
> > > --- a/target/riscv/cpu.c
> > > +++ b/target/riscv/cpu.c
> > > @@ -825,6 +825,7 @@ static Property riscv_cpu_properties[] = {
> > >      DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
> > >      DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
> > >      DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
> > > +    DEFINE_PROP_BOOL("Zihintpause", RISCVCPU, cfg.ext_zihintpause, true),
> > >      DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
> > >      DEFINE_PROP_BOOL("Zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
> > >      DEFINE_PROP_BOOL("Zve32f", RISCVCPU, cfg.ext_zve32f, false),
> > > @@ -996,6 +997,7 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
> > >       *    extensions by an underscore.
> > >       */
> > >      struct isa_ext_data isa_edata_arr[] = {
> > > +        ISA_EDATA_ENTRY(zihintpause, ext_zihintpause),
> > >          ISA_EDATA_ENTRY(zfh, ext_zfh),
> > >          ISA_EDATA_ENTRY(zfhmin, ext_zfhmin),
> > >          ISA_EDATA_ENTRY(zfinx, ext_zfinx),
> > > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > > index fe6c9a2c92..e466a04a59 100644
> > > --- a/target/riscv/cpu.h
> > > +++ b/target/riscv/cpu.h
> > > @@ -394,6 +394,7 @@ struct RISCVCPUConfig {
> > >      bool ext_counters;
> > >      bool ext_ifencei;
> > >      bool ext_icsr;
> > > +    bool ext_zihintpause;
> > >      bool ext_svinval;
> > >      bool ext_svnapot;
> > >      bool ext_svpbmt;
> > > diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> > > index 4033565393..595fdcdad8 100644
> > > --- a/target/riscv/insn32.decode
> > > +++ b/target/riscv/insn32.decode
> > > @@ -149,7 +149,12 @@ srl      0000000 .....    ..... 101 ..... 0110011 @r
> > >  sra      0100000 .....    ..... 101 ..... 0110011 @r
> > >  or       0000000 .....    ..... 110 ..... 0110011 @r
> > >  and      0000000 .....    ..... 111 ..... 0110011 @r
> > > -fence    ---- pred:4 succ:4 ----- 000 ----- 0001111
> > > +
> > > +{
> > > +  pause  0000 0001   0000   00000 000 00000 0001111
> > > +  fence  ---- pred:4 succ:4 ----- 000 ----- 0001111
> > > +}
> > > +
> > >  fence_i  ---- ----   ----   ----- 001 ----- 0001111
> > >  csrrw    ............     ..... 001 ..... 1110011 @csr
> > >  csrrs    ............     ..... 010 ..... 1110011 @csr
> > > diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
> > > index f1342f30f8..ca75e05f4b 100644
> > > --- a/target/riscv/insn_trans/trans_rvi.c.inc
> > > +++ b/target/riscv/insn_trans/trans_rvi.c.inc
> > > @@ -796,6 +796,24 @@ static bool trans_srad(DisasContext *ctx, arg_srad *a)
> > >      return gen_shift(ctx, a, EXT_SIGN, tcg_gen_sar_tl, NULL);
> > >  }
> > >
> > > +static bool trans_pause(DisasContext *ctx, arg_pause *a)
> > > +{
> > > +    if (!ctx->cfg_ptr->ext_zihintpause) {
> > > +        return false;
> > > +    }
> > > +
> > > +    /*
> > > +     * PAUSE is a no-op in QEMU,
> > > +     * however we need to clear the reservation,
> > > +     * end the TB and return to main loop
> > > +     */
> > > +    tcg_gen_movi_tl(load_res, -1);
> >
> > I'm not clear why we need to clear the load_res? We don't do it for
> > fence instruction
> >
> > Alistair
> >
> > > +    gen_set_pc_imm(ctx, ctx->pc_succ_insn);
> > > +    tcg_gen_exit_tb(NULL, 0);
> > > +    ctx->base.is_jmp = DISAS_NORETURN;
> > > +
> > > +    return true;
> > > +}
> > >
> > >  static bool trans_fence(DisasContext *ctx, arg_fence *a)
> > >  {
> > > --
> > > 2.25.1
> > >
> > >

