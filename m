Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o3gZY-000457-4C
	for mharc-qemu-riscv@gnu.org; Tue, 21 Jun 2022 12:17:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daolu@rivosinc.com>)
 id 1o3gZW-00042j-GK
 for qemu-riscv@nongnu.org; Tue, 21 Jun 2022 12:17:46 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:52026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <daolu@rivosinc.com>)
 id 1o3gZU-00076f-LY
 for qemu-riscv@nongnu.org; Tue, 21 Jun 2022 12:17:46 -0400
Received: by mail-pj1-x1030.google.com with SMTP id f16so12136052pjj.1
 for <qemu-riscv@nongnu.org>; Tue, 21 Jun 2022 09:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jCHjf0Z9HZzvuMC8EAHt8obZsThk71RaV0jpCUS52wA=;
 b=FCnJr4Azv7IYo1iOPJh8Ek3ckNF64DyM3xMy86YuCpsDkzVCbt5X2sTMm4a8BSEDo4
 q91pl358KbA097OZb63ZyqNBDrHEd+nl2i+/VnS78X1e1CsxyYpnLwhvcpDCcAAO+2IV
 bRa7zEA4Dtr66sQWA1xGauQu8VVdJCem6T3qcbwZIgDqylZ2mGPxBaG639N1vyxkdeMz
 JTj0l7F5vWe1iNF/3OneiZiQ90t+CiLztAsOlqNBQMeUaEQG9iJd6sMm12XYBEAuQI2o
 Mj6OM5708zIWMvwiKXbg+nIqJHsZsrG6olfPppM57XGsmD7rjTANrvyDK/za+lWK7hzs
 v4JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jCHjf0Z9HZzvuMC8EAHt8obZsThk71RaV0jpCUS52wA=;
 b=bRnq/OIZyzCswtC6E1OApL4AoJQAz1NI6zvDIacT3uaucFJP4E3eRBkibh1SlIRCc3
 ka9CccJz0c7w4PWNRq+8g5iggoT7wVwwcg3C25VCx13D1yySwIDJmIQCaZIaDHTSS/KZ
 OR+AP5wNCjKwfi571m6DCKo9XOfkcei3ym4SXmEZTjD3wFnqH4Vry1ogzaNVTTMzjSxG
 3mOUO29/ALl8tLggNn4I2sK069uQcn7CgPA137sQ3A8BxkjCfTZzDBlWPBWr5BA80RG6
 KlQLnN1ATdiE4/OI1eD2Z6yFxLLqj2w+ASs6ER7ONnzwdAEXzIU9pAHpi0jvOBXrsQsu
 yjpQ==
X-Gm-Message-State: AJIora/cP0OewtXQJq7dl9NiIekTNDd4hUfp8jfkL8Q0UXlgvO+bIAt5
 AuKiEaD82F5kX2nSxg59JcqjaCregCm9YM39Bg6AYw==
X-Google-Smtp-Source: AGRyM1tw6j36jPoLKplz8Kx6GT/Vpc60y3g64UWNjwWMCBzkVNjBk+ED3DQBI6iEIbpXwnpDhTFJz9oaJazkZwY6tRM=
X-Received: by 2002:a17:902:b407:b0:168:e554:33be with SMTP id
 x7-20020a170902b40700b00168e55433bemr29669206plr.130.1655828261981; Tue, 21
 Jun 2022 09:17:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220609044046.1903865-1-daolu@rivosinc.com>
 <20220609044046.1903865-2-daolu@rivosinc.com>
 <CAKmqyKN91QyYdhse0jUTGCX1i31tPuKpxBk46qJQVur4+50_tA@mail.gmail.com>
In-Reply-To: <CAKmqyKN91QyYdhse0jUTGCX1i31tPuKpxBk46qJQVur4+50_tA@mail.gmail.com>
From: Dao Lu <daolu@rivosinc.com>
Date: Tue, 21 Jun 2022 09:17:31 -0700
Message-ID: <CAKh7v-THr8vn0WXnYEDuR3fCGjOmFLYMG1pkj6ar++51G0DuUw@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] target/riscv: Add Zihintpause support
To: Alistair Francis <alistair23@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Heiko Stuebner <heiko@sntech.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=daolu@rivosinc.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 21 Jun 2022 16:17:46 -0000

From what I know that's generally the way reservations are handled:
if the forward progress requirements aren't met then the implementation
is free to break any outstanding reservations (the hardware is always
free to do that to a degree, but once forward progress is gone it can
always do that).  So this is legal, as would be not breaking the reservation.

I don't have a strong opinion on this and am fine about changing it if
anyone does.

Thanks,
Dao

On Mon, Jun 20, 2022 at 4:39 PM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Thu, Jun 9, 2022 at 2:42 PM Dao Lu <daolu@rivosinc.com> wrote:
> >
> > Added support for RISC-V PAUSE instruction from Zihintpause extension,
> > enabled by default.
> >
> > Tested-by: Heiko Stuebner <heiko@sntech.de>
> > Signed-off-by: Dao Lu <daolu@rivosinc.com>
> > ---
> >  target/riscv/cpu.c                      |  2 ++
> >  target/riscv/cpu.h                      |  1 +
> >  target/riscv/insn32.decode              |  7 ++++++-
> >  target/riscv/insn_trans/trans_rvi.c.inc | 18 ++++++++++++++++++
> >  4 files changed, 27 insertions(+), 1 deletion(-)
> >
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index ccacdee215..183fb37fdf 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -825,6 +825,7 @@ static Property riscv_cpu_properties[] = {
> >      DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
> >      DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
> >      DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
> > +    DEFINE_PROP_BOOL("Zihintpause", RISCVCPU, cfg.ext_zihintpause, true),
> >      DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
> >      DEFINE_PROP_BOOL("Zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
> >      DEFINE_PROP_BOOL("Zve32f", RISCVCPU, cfg.ext_zve32f, false),
> > @@ -996,6 +997,7 @@ static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
> >       *    extensions by an underscore.
> >       */
> >      struct isa_ext_data isa_edata_arr[] = {
> > +        ISA_EDATA_ENTRY(zihintpause, ext_zihintpause),
> >          ISA_EDATA_ENTRY(zfh, ext_zfh),
> >          ISA_EDATA_ENTRY(zfhmin, ext_zfhmin),
> >          ISA_EDATA_ENTRY(zfinx, ext_zfinx),
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index fe6c9a2c92..e466a04a59 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -394,6 +394,7 @@ struct RISCVCPUConfig {
> >      bool ext_counters;
> >      bool ext_ifencei;
> >      bool ext_icsr;
> > +    bool ext_zihintpause;
> >      bool ext_svinval;
> >      bool ext_svnapot;
> >      bool ext_svpbmt;
> > diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> > index 4033565393..595fdcdad8 100644
> > --- a/target/riscv/insn32.decode
> > +++ b/target/riscv/insn32.decode
> > @@ -149,7 +149,12 @@ srl      0000000 .....    ..... 101 ..... 0110011 @r
> >  sra      0100000 .....    ..... 101 ..... 0110011 @r
> >  or       0000000 .....    ..... 110 ..... 0110011 @r
> >  and      0000000 .....    ..... 111 ..... 0110011 @r
> > -fence    ---- pred:4 succ:4 ----- 000 ----- 0001111
> > +
> > +{
> > +  pause  0000 0001   0000   00000 000 00000 0001111
> > +  fence  ---- pred:4 succ:4 ----- 000 ----- 0001111
> > +}
> > +
> >  fence_i  ---- ----   ----   ----- 001 ----- 0001111
> >  csrrw    ............     ..... 001 ..... 1110011 @csr
> >  csrrs    ............     ..... 010 ..... 1110011 @csr
> > diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
> > index f1342f30f8..ca75e05f4b 100644
> > --- a/target/riscv/insn_trans/trans_rvi.c.inc
> > +++ b/target/riscv/insn_trans/trans_rvi.c.inc
> > @@ -796,6 +796,24 @@ static bool trans_srad(DisasContext *ctx, arg_srad *a)
> >      return gen_shift(ctx, a, EXT_SIGN, tcg_gen_sar_tl, NULL);
> >  }
> >
> > +static bool trans_pause(DisasContext *ctx, arg_pause *a)
> > +{
> > +    if (!ctx->cfg_ptr->ext_zihintpause) {
> > +        return false;
> > +    }
> > +
> > +    /*
> > +     * PAUSE is a no-op in QEMU,
> > +     * however we need to clear the reservation,
> > +     * end the TB and return to main loop
> > +     */
> > +    tcg_gen_movi_tl(load_res, -1);
>
> I'm not clear why we need to clear the load_res? We don't do it for
> fence instruction
>
> Alistair
>
> > +    gen_set_pc_imm(ctx, ctx->pc_succ_insn);
> > +    tcg_gen_exit_tb(NULL, 0);
> > +    ctx->base.is_jmp = DISAS_NORETURN;
> > +
> > +    return true;
> > +}
> >
> >  static bool trans_fence(DisasContext *ctx, arg_fence *a)
> >  {
> > --
> > 2.25.1
> >
> >

