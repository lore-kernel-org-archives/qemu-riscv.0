Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nyjBW-0001GY-11
	for mharc-qemu-riscv@gnu.org; Tue, 07 Jun 2022 20:04:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nyjBT-0001GL-6B; Tue, 07 Jun 2022 20:04:28 -0400
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35]:33962)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nyjBR-0006OM-5C; Tue, 07 Jun 2022 20:04:26 -0400
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-fdfe64231dso2812714fac.1; 
 Tue, 07 Jun 2022 17:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wdJw1nIGlf+mbWo3v8gwMMUAYv1xFfFcRQg3eSYnTA0=;
 b=UnvROgsFcaipQpifWJWZBm/Tr4UJSJ3xcGomGrFoEnORpuzVSBXJo0HUBMRSgGNo8L
 8IIXlKC51OvTDbCjbBLTsdXXVZAdRZrLfLwNT6HpDJhkajzHk+zAKCtIr2jI6uNkkdt2
 xSd2vZaWZaP4kpe/hDBH3lZ0EzkT3piQmFkuBT56cpXktHIVrd4Pv+R+B5sGbC8Br1jF
 0iaeq9bLuaEOraH9FZdRgZsmlw2VGD0f37GHA7l5jQunKkaAuqrHhatlKsUmBQiIsKfO
 OJxFoh4PeT2BUGkx5obPaBQhvSJx4SWdRoJxrWFPQMwldm6NQh3QTJ9Y/ncsEwFUaZIy
 WmJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wdJw1nIGlf+mbWo3v8gwMMUAYv1xFfFcRQg3eSYnTA0=;
 b=Q3dUK60pdXpmWI3ZiPlulkS3Z0ZJR75iRp+teHBUUvbhBAHEBpCGhN6CW71MV55VeZ
 5td0US7VIJivSMcgN1CLiBBz/aHerrdrW9GhapTn8Q81PrHfp4aWfz13S50+LwoKELI7
 ttKvkHzzSt2FKrwy7UaBcHQX7E1MYZX2Eg+ZkdQe15F2zD+scZ1M5/nE/QgoGiUT0YiX
 /koenZXocpZD2Qwmd4MbgIb9RS+eF255Vkcw8jxvkW2smm1sEqa9yPLyfRCa2c5aZu2i
 2urUcJL02Wh4VYFBTM82+SO6AQ/Unc1GIK5FHo/V6GKL+E0+YcLl3BbSt/2u8eZpvdE9
 PW0A==
X-Gm-Message-State: AOAM531r3PRPFafRLFlTKzI3MJeo7Sj/jLT4210ibulvn6GKHB0Qon2F
 gdaD+Ybvf7c4ETMC7hqC+eiqYJn8UT1s5Qj8iS4=
X-Google-Smtp-Source: ABdhPJxk7WGcQn9goBrgYw6jDiIrJ3pzKaB7ZfACilWmij722bt/Qd/bWEON/U9Qgr7JaMalTxgJW4teq2sR+dvJzdI=
X-Received: by 2002:a05:6870:b00a:b0:f1:7f07:8c36 with SMTP id
 y10-20020a056870b00a00b000f17f078c36mr883217oae.278.1654646663048; Tue, 07
 Jun 2022 17:04:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220524203647.31435-1-daolu@rivosinc.com>
 <20220524203647.31435-2-daolu@rivosinc.com>
 <CAKh7v-Se705qE16UgV92UsrfhkcJCUtKByOt6Hs80MhV1Wh88w@mail.gmail.com>
 <CAKmqyKPHjHR0xsJq6-A3b28LZuRCWNT8UyMKqgmnST4mJF7fWA@mail.gmail.com>
 <CAKh7v-S4n=pP53Bzo1=4Jg6wSn3wSjQdxkpWLDa9368jOF0g8w@mail.gmail.com>
In-Reply-To: <CAKh7v-S4n=pP53Bzo1=4Jg6wSn3wSjQdxkpWLDa9368jOF0g8w@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 8 Jun 2022 10:03:56 +1000
Message-ID: <CAKmqyKM2Q-htphk_56ZRbBzAJT1wnm43tViriamj42C-6CX_Uw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] target/riscv: Add Zihintpause support
To: Dao Lu <daolu@rivosinc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Heiko Stuebner <heiko@sntech.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=alistair23@gmail.com; helo=mail-oa1-x35.google.com
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
X-List-Received-Date: Wed, 08 Jun 2022 00:04:29 -0000

On Wed, Jun 8, 2022 at 9:20 AM Dao Lu <daolu@rivosinc.com> wrote:
>
> Hi Alistair,
>
> Thanks for the response. I don't think I can find any comments
> on this patch though, could you help point me to them?

I see a PATCH v1 with comments and then your ping to PATCH v2, but I
don't see the original PATCH v2. It might not have made it to the
list, or maybe I just can't find it. Maybe send a v3 and we can go
from there

Alistair

>
> Thanks,
> Dao
>
> On Tue, Jun 7, 2022 at 4:04 PM Alistair Francis <alistair23@gmail.com> wrote:
> >
> > On Wed, Jun 8, 2022 at 8:59 AM Dao Lu <daolu@rivosinc.com> wrote:
> > >
> > > Ping
> >
> > The latest version of this patch on the mailing list has comments that
> > need to be addressed
> >
> > Alistair
> >
> > >
> > > On Tue, May 24, 2022 at 1:36 PM Dao Lu <daolu@rivosinc.com> wrote:
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
> > > > 2.30.1 (Apple Git-130)
> > > >
> > >

