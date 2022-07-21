Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oEZq6-0003vG-7D
	for mharc-qemu-riscv@gnu.org; Thu, 21 Jul 2022 13:19:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daolu@rivosinc.com>)
 id 1oEZq4-0003uh-0n
 for qemu-riscv@nongnu.org; Thu, 21 Jul 2022 13:19:52 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:40608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <daolu@rivosinc.com>)
 id 1oEZq2-0006bt-0y
 for qemu-riscv@nongnu.org; Thu, 21 Jul 2022 13:19:51 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 p6-20020a17090a680600b001f2267a1c84so4201532pjj.5
 for <qemu-riscv@nongnu.org>; Thu, 21 Jul 2022 10:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sZVWLF7Sk76WOsTnp8Z6JRoOj4Ti9cXFLWofE/XvfgU=;
 b=zAAaYL7akD/j6Qgi6kPX31DC7A4+QxrEx9PIxEwSWTFEpUMXitluCXdnwoSxj4ceQP
 F8IsRQuET70ex9hMR4xIHogvL03jPESGcgOVRxL/aTcPOJLkBNJvs8Am9b35b9Q5g4KF
 vvyNWws/NIsJZidLdSOlKT2ROKfvpeNjec9yrYPm0M6FNHHdj8G2wElUww3Ug6bLME3o
 xZrSzGTVytC6saiOHNxpHB57Uvv12HaKIWtAZ8uB63xMLO0hCoUOqTl4Jg0/vPooqOzj
 HdmBJgfzrnVrALaapOuD7vexD7VUhNXiLUfU5dVaZ2WbP8ig0Ler/WNzV5q2fUzUqfAH
 UV1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sZVWLF7Sk76WOsTnp8Z6JRoOj4Ti9cXFLWofE/XvfgU=;
 b=VfwtFwOrn8VYcVU79QwVeYowRlpeJLnU+iEZRYNkTVJoos2x66bjKDarG8Ap6MbnUO
 yV7d/8nXwK3aR27Vig3wkvOF4g1BES90LVoJESGJbiOXEF7P/XhdLCTfMt/W5IBqJksG
 B7S2AkJWlFSCFPyvyLaQzR11YzOFUsn7uvxBYgup4cSTkFutQ1JesspHPdFIeLTsF8m0
 ntMdsa013kehYQXoJiwnNcCrawBIoSajr9G29P1pj+1Huezj5jDwpy9iLRrTkz+Jq12P
 sUPXMA+B193ADJcJPnwNX/yO5L70Yk29YU4c1q409VpkkvvMbHPERHBT/QYTTJiHma4r
 OX/A==
X-Gm-Message-State: AJIora+2HSQ13DNB+xYfXf1sFkjPBN9dEnYztgsgA8chFzTkEXVVg/TH
 IqS+siL8ye8IQbokZmTJDR4PyrnfHUSY5PTABrcN5g==
X-Google-Smtp-Source: AGRyM1vPRpOIs5IPcMqfa6lM+eJN/Q0W9oVdPYOeUgIV93ei0zsu42oth9/645ozVKCYThGUnuWFBnEu5cc1CCpw1XI=
X-Received: by 2002:a17:902:6b02:b0:16c:3d67:8a8a with SMTP id
 o2-20020a1709026b0200b0016c3d678a8amr45277345plk.87.1658423987657; Thu, 21
 Jul 2022 10:19:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220705174933.2898412-1-daolu@rivosinc.com>
 <20220705174933.2898412-2-daolu@rivosinc.com>
 <CAKh7v-R_NmGyHXNL3cEvMu8rCHbJ_S9vkLsVRaiMjG6GHxcYbw@mail.gmail.com>
 <CAKmqyKN22PMjDCfOCiYffUXm+7hKn=D=RBm+TUGNNtdWa8pi-w@mail.gmail.com>
In-Reply-To: <CAKmqyKN22PMjDCfOCiYffUXm+7hKn=D=RBm+TUGNNtdWa8pi-w@mail.gmail.com>
From: Dao Lu <daolu@rivosinc.com>
Date: Thu, 21 Jul 2022 10:19:36 -0700
Message-ID: <CAKh7v-QzzEFJ0E5iYd6oxmUkwt56CipTjOEnY8uER2CkcyAqJQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] target/riscv: Add Zihintpause support
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
X-List-Received-Date: Thu, 21 Jul 2022 17:19:52 -0000

Will do, thanks!

Dao

On Wed, Jul 20, 2022 at 10:31 PM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Tue, Jul 19, 2022 at 4:02 AM Dao Lu <daolu@rivosinc.com> wrote:
> >
> > ping
>
> Sorry for the delay.
>
> Do you mind rebasing this on
> https://github.com/alistair23/qemu/tree/riscv-to-apply.next and
> sending a v5
>
> Alistair
>
> >
> > On Tue, Jul 5, 2022 at 10:49 AM Dao Lu <daolu@rivosinc.com> wrote:
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
> > >  target/riscv/insn_trans/trans_rvi.c.inc | 16 ++++++++++++++++
> > >  4 files changed, 25 insertions(+), 1 deletion(-)
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
> > > index f1342f30f8..2fd07bc2e4 100644
> > > --- a/target/riscv/insn_trans/trans_rvi.c.inc
> > > +++ b/target/riscv/insn_trans/trans_rvi.c.inc
> > > @@ -796,6 +796,22 @@ static bool trans_srad(DisasContext *ctx, arg_srad *a)
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
> > > +     * end the TB and return to main loop
> > > +     */
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
> >

