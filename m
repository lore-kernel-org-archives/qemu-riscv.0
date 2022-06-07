Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nyiFC-0004De-BT
	for mharc-qemu-riscv@gnu.org; Tue, 07 Jun 2022 19:04:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nyiF5-00049Z-01; Tue, 07 Jun 2022 19:04:08 -0400
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32]:38526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nyiF3-0004i9-9r; Tue, 07 Jun 2022 19:04:06 -0400
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-e5e433d66dso25078678fac.5; 
 Tue, 07 Jun 2022 16:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kLo6YzjgL4mOmXe7YUkciqe4z9g0NbE1vNPDcQWH2ow=;
 b=DU8hetmnhzGKv9bDHw95Ky+b6GixiIcpwmoVOx8Xb4/6yH66iCxbt9/EbIc4myQYwC
 THYQkkxo6o1ytbZBD363BjDtMlO4aNixFZS6hyQuPY/nad2LSsMqHkvjRXZajjgbtYy0
 QYdZV6eMAqetI4DcsW75B7I2AlPjNURmXCN7WhEdx+3oi/TuC77m/kBrlJ/QGhdefuht
 nUxkWx44+fbZ4p2mxTVSu8WPln4IXhPzp4FY112Vr+gdcWB3HQAHpxjIlXEmvZUdwVhR
 vxqvl8Egdj8mETZZLJ5AaxjMDD18xww1vximsadHaYn9OF5ZLMqCQ4VSjCzTgR6O/qDx
 2dUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kLo6YzjgL4mOmXe7YUkciqe4z9g0NbE1vNPDcQWH2ow=;
 b=OD14ZEmjfljbXZvLX5pYncCx6HuV0LrDSCJql3+dQIJZsaO149DIM7TfIFIYsZls3T
 ahY0iVn3ZofOJeX8OhXTdfVdvzIUnMTFv88U0i1wz1uOlg0N/W7BbP4jo2aeuCtkq/hm
 Eud9r7YcOTRpDidI+ZtYg5zaMseY8mf1gb1QJv5HRHXk2rDPvXxfygRJfXw2IIX2yE69
 6b/gGyaQ0CygPf3R7zEOQkm7ix+JaPbTJ8G+fIqOegHbDY+ErPk4kcLCnCFpwyn8gA2w
 6V23ozIOp3G/Y5OOYff9bdJsLA3lvcqNBVOwGRLZt/uA0pgm2UpimI2ZsGE0USZ6rrHM
 yutQ==
X-Gm-Message-State: AOAM530mdsAgIZShG5FbNG8qehQKcCJyBOWww+4BOpvw8JudWbW8Vqi7
 764THH3L/hmPVRJiBThlpG7qNU408bOwLQ1VJUI=
X-Google-Smtp-Source: ABdhPJwbzqzuOWJBLvScn02ct6wxhPeV5yeQrtCPEU53SZM/Adg1AKyoo7VRTh7hh/plHe8OOV2jaiykAd1wlmHTbqo=
X-Received: by 2002:a05:6870:458e:b0:fb:39b1:1afc with SMTP id
 y14-20020a056870458e00b000fb39b11afcmr833258oao.64.1654643043804; Tue, 07 Jun
 2022 16:04:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220524203647.31435-1-daolu@rivosinc.com>
 <20220524203647.31435-2-daolu@rivosinc.com>
 <CAKh7v-Se705qE16UgV92UsrfhkcJCUtKByOt6Hs80MhV1Wh88w@mail.gmail.com>
In-Reply-To: <CAKh7v-Se705qE16UgV92UsrfhkcJCUtKByOt6Hs80MhV1Wh88w@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 8 Jun 2022 09:03:37 +1000
Message-ID: <CAKmqyKPHjHR0xsJq6-A3b28LZuRCWNT8UyMKqgmnST4mJF7fWA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] target/riscv: Add Zihintpause support
To: Dao Lu <daolu@rivosinc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Heiko Stuebner <heiko@sntech.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=alistair23@gmail.com; helo=mail-oa1-x32.google.com
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
X-List-Received-Date: Tue, 07 Jun 2022 23:04:10 -0000

On Wed, Jun 8, 2022 at 8:59 AM Dao Lu <daolu@rivosinc.com> wrote:
>
> Ping

The latest version of this patch on the mailing list has comments that
need to be addressed

Alistair

>
> On Tue, May 24, 2022 at 1:36 PM Dao Lu <daolu@rivosinc.com> wrote:
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
> > 2.30.1 (Apple Git-130)
> >
>

