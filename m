Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcIBp-0005Hu-J4
	for mharc-qemu-riscv@gnu.org; Sun, 17 Oct 2021 22:15:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mcIBl-0005Gy-Nx
 for qemu-riscv@nongnu.org; Sun, 17 Oct 2021 22:15:45 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:36722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mcIBh-0006kE-SE
 for qemu-riscv@nongnu.org; Sun, 17 Oct 2021 22:15:45 -0400
Received: by mail-io1-xd2e.google.com with SMTP id e144so14481164iof.3
 for <qemu-riscv@nongnu.org>; Sun, 17 Oct 2021 19:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iagfxw+uXtMapGF/L16+awhdqtKbQm3X0oJRPbPiaTY=;
 b=cvRdyIpSmBZiW1pv/J2vUmKSIVZJAOkbgd6Xb0ElffrThbInfYD3FZrHYi07w5qkNH
 RVUgt/z54bBwuPuFL8VcbQREl9r8mz1ZW+/yw3k/hGErVoBpeQ6YGUiWDMnS22u2skXD
 MZPbcEHJCqgMZq0qBFkpyBpCcsfH0kCtx+E0PJFhJYuJaGGFYO5PrhNK86vm+RzmWAiW
 aqY1uZPVZPC22tPssvw+w5G+U/ctTwYQ6Es9BUpLJFSN8JJ5cBJ03bq/kC+f0jitEHPj
 jfXlBIq3dJSVudcALfw8n0s+ObWMHJ1Y1SM/+bHiObjy42TrclU0qZbi/du3OPRNOFGf
 z7tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iagfxw+uXtMapGF/L16+awhdqtKbQm3X0oJRPbPiaTY=;
 b=C213mEwsoOsemzOqAH+OhDLd7X99TUpU6iMb7D/+iJOoLIFu9Ty530O7SqXeRz6kAT
 3OrlBwZTTGxsttBR0fQRXHJoTUFY3HXxnf6yJbZ3WOpVQA6MXi/PzS8nJT8qi+nL05ah
 5Da07OotOEkoDMhyHn+ueI1fGz00+AKz3OsmWA2LKA8hL3EvG/HMFMAYSs2OKuse3pcj
 8kaJ4H55BfeDxs4GAA2coBLa7lsM4bSWo751UNK5obSa2uIKpT8GfoOswontXW3gPo4P
 b6HxxdVqbwzya1mRtC7LSndUR/QHC8m+8Dkb6JOU3R8AcTVFNvEdklZKDJB4Nvk8SNb2
 bH2A==
X-Gm-Message-State: AOAM532G3UffboRgJPesgPT6KFfKcVkszM/4KR5Cuuh8l3x1OAHOqDFj
 eQOnSSPUddjKUSA3SFWj8372SpL+xYUxYcQapNlWQw==
X-Google-Smtp-Source: ABdhPJwvmsonnhN8TTgOoNJiZQKYQCMZl8ykXwo7eyeEO2X8zB0phNz8bQMC3Bsu2BTs6IoEZhQXMEqa33ro8gtuomw=
X-Received: by 2002:a5d:9256:: with SMTP id e22mr12488602iol.152.1634523339758; 
 Sun, 17 Oct 2021 19:15:39 -0700 (PDT)
MIME-Version: 1.0
References: <20211016090742.3034669-1-frank.chang@sifive.com>
 <20211016090742.3034669-2-frank.chang@sifive.com>
 <CAKmqyKNoHJj=W8L-KP+MohddNmzj1qquiEJ6bTQG4GwCSoa1xg@mail.gmail.com>
In-Reply-To: <CAKmqyKNoHJj=W8L-KP+MohddNmzj1qquiEJ6bTQG4GwCSoa1xg@mail.gmail.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Mon, 18 Oct 2021 10:15:30 +0800
Message-ID: <CAE_xrPigcg96SvHdnSRSL+EU+USVtkv+pbfOVj1Spg7K2eXFPA@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] target/riscv: zfh: half-precision load and store
To: Alistair Francis <alistair23@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Chih-Min Chao <chihmin.chao@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Kito Cheng <kito.cheng@sifive.com>
Content-Type: multipart/alternative; boundary="0000000000000b384305ce971f87"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=frank.chang@sifive.com; helo=mail-io1-xd2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Oct 2021 02:15:45 -0000

--0000000000000b384305ce971f87
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 18, 2021 at 8:03 AM Alistair Francis <alistair23@gmail.com>
wrote:

> On Sat, Oct 16, 2021 at 7:08 PM <frank.chang@sifive.com> wrote:
> >
> > From: Kito Cheng <kito.cheng@sifive.com>
> >
> > Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
> > Signed-off-by: Chih-Min Chao <chihmin.chao@sifive.com>
> > Signed-off-by: Frank Chang <frank.chang@sifive.com>
> > Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> > ---
> >  target/riscv/cpu.c                        |  1 +
> >  target/riscv/cpu.h                        |  1 +
> >  target/riscv/insn32.decode                |  4 ++
> >  target/riscv/insn_trans/trans_rvzfh.c.inc | 65 +++++++++++++++++++++++
> >  target/riscv/translate.c                  |  8 +++
> >  5 files changed, 79 insertions(+)
> >  create mode 100644 target/riscv/insn_trans/trans_rvzfh.c.inc
> >
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index 1d69d1887e6..8c579dc297b 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -601,6 +601,7 @@ static Property riscv_cpu_properties[] = {
> >      DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
> >      DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
> >      DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
> > +    DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
>
> This change should be after patch 5. The idea is that we add the
> functionality and then allow users to enable it.
>
> Otherwise:
>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>
> Alistair
>

The reason why I put here is because REQUIRE_ZFH() uses ctx->zfh.
I can separate ext_zfh field in DisasContext into this patch,
and add cfg.ext_zfh in RISCVCPU after patch 5 in my next patchset.

Thanks,
Frank Chang


>
> >      DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
> >      DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
> >      DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index 9e55b2f5b17..88684e72be1 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -297,6 +297,7 @@ struct RISCVCPU {
> >          bool ext_counters;
> >          bool ext_ifencei;
> >          bool ext_icsr;
> > +        bool ext_zfh;
> >
> >          char *priv_spec;
> >          char *user_spec;
> > diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> > index 2f251dac1bb..b36a3d8dbf8 100644
> > --- a/target/riscv/insn32.decode
> > +++ b/target/riscv/insn32.decode
> > @@ -726,3 +726,7 @@ binv       0110100 .......... 001 ..... 0110011 @r
> >  binvi      01101. ........... 001 ..... 0010011 @sh
> >  bset       0010100 .......... 001 ..... 0110011 @r
> >  bseti      00101. ........... 001 ..... 0010011 @sh
> > +
> > +# *** RV32 Zfh Extension ***
> > +flh        ............   ..... 001 ..... 0000111 @i
> > +fsh        .......  ..... ..... 001 ..... 0100111 @s
> > diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc
> b/target/riscv/insn_trans/trans_rvzfh.c.inc
> > new file mode 100644
> > index 00000000000..dad1d703d72
> > --- /dev/null
> > +++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
> > @@ -0,0 +1,65 @@
> > +/*
> > + * RISC-V translation routines for the RV64Zfh Standard Extension.
> > + *
> > + * Copyright (c) 2020 Chih-Min Chao, chihmin.chao@sifive.com
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> it
> > + * under the terms and conditions of the GNU General Public License,
> > + * version 2 or later, as published by the Free Software Foundation.
> > + *
> > + * This program is distributed in the hope it will be useful, but
> WITHOUT
> > + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> > + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public
> License for
> > + * more details.
> > + *
> > + * You should have received a copy of the GNU General Public License
> along with
> > + * this program.  If not, see <http://www.gnu.org/licenses/>.
> > + */
> > +
> > +#define REQUIRE_ZFH(ctx) do { \
> > +    if (!ctx->ext_zfh) {      \
> > +        return false;         \
> > +    }                         \
> > +} while (0)
> > +
> > +static bool trans_flh(DisasContext *ctx, arg_flh *a)
> > +{
> > +    TCGv_i64 dest;
> > +    TCGv t0;
> > +
> > +    REQUIRE_FPU;
> > +    REQUIRE_ZFH(ctx);
> > +
> > +    t0 = get_gpr(ctx, a->rs1, EXT_NONE);
> > +    if (a->imm) {
> > +        TCGv temp = temp_new(ctx);
> > +        tcg_gen_addi_tl(temp, t0, a->imm);
> > +        t0 = temp;
> > +    }
> > +
> > +    dest = cpu_fpr[a->rd];
> > +    tcg_gen_qemu_ld_i64(dest, t0, ctx->mem_idx, MO_TEUW);
> > +    gen_nanbox_h(dest, dest);
> > +
> > +    mark_fs_dirty(ctx);
> > +    return true;
> > +}
> > +
> > +static bool trans_fsh(DisasContext *ctx, arg_fsh *a)
> > +{
> > +    TCGv t0;
> > +
> > +    REQUIRE_FPU;
> > +    REQUIRE_ZFH(ctx);
> > +
> > +    t0 = get_gpr(ctx, a->rs1, EXT_NONE);
> > +    if (a->imm) {
> > +        TCGv temp = tcg_temp_new();
> > +        tcg_gen_addi_tl(temp, t0, a->imm);
> > +        t0 = temp;
> > +    }
> > +
> > +    tcg_gen_qemu_st_i64(cpu_fpr[a->rs2], t0, ctx->mem_idx, MO_TEUW);
> > +
> > +    return true;
> > +}
> > diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> > index d2442f0cf5d..75048149f5a 100644
> > --- a/target/riscv/translate.c
> > +++ b/target/riscv/translate.c
> > @@ -69,6 +69,7 @@ typedef struct DisasContext {
> >      bool w;
> >      bool virt_enabled;
> >      bool ext_ifencei;
> > +    bool ext_zfh;
> >      bool hlsx;
> >      /* vector extension */
> >      bool vill;
> > @@ -118,6 +119,11 @@ static void gen_nanbox_s(TCGv_i64 out, TCGv_i64 in)
> >      tcg_gen_ori_i64(out, in, MAKE_64BIT_MASK(32, 32));
> >  }
> >
> > +static void gen_nanbox_h(TCGv_i64 out, TCGv_i64 in)
> > +{
> > +    tcg_gen_ori_i64(out, in, MAKE_64BIT_MASK(16, 48));
> > +}
> > +
> >  /*
> >   * A narrow n-bit operation, where n < FLEN, checks that input operands
> >   * are correctly Nan-boxed, i.e., all upper FLEN - n bits are 1.
> > @@ -489,6 +495,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase,
> target_ulong pc)
> >  #include "insn_trans/trans_rvh.c.inc"
> >  #include "insn_trans/trans_rvv.c.inc"
> >  #include "insn_trans/trans_rvb.c.inc"
> > +#include "insn_trans/trans_rvzfh.c.inc"
> >  #include "insn_trans/trans_privileged.c.inc"
> >
> >  /* Include the auto-generated decoder for 16 bit insn */
> > @@ -541,6 +548,7 @@ static void
> riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
> >      ctx->misa = env->misa;
> >      ctx->frm = -1;  /* unknown rounding mode */
> >      ctx->ext_ifencei = cpu->cfg.ext_ifencei;
> > +    ctx->ext_zfh = cpu->cfg.ext_zfh;
> >      ctx->vlen = cpu->cfg.vlen;
> >      ctx->mstatus_hs_fs = FIELD_EX32(tb_flags, TB_FLAGS, MSTATUS_HS_FS);
> >      ctx->hlsx = FIELD_EX32(tb_flags, TB_FLAGS, HLSX);
> > --
> > 2.25.1
> >
> >
>

--0000000000000b384305ce971f87
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, Oct 18, 2021 at 8:03 AM Alistair =
Francis &lt;<a href=3D"mailto:alistair23@gmail.com">alistair23@gmail.com</a=
>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">On Sat, Oct 16, 2021 at 7:08 PM &lt;<a href=3D"mail=
to:frank.chang@sifive.com" target=3D"_blank">frank.chang@sifive.com</a>&gt;=
 wrote:<br>
&gt;<br>
&gt; From: Kito Cheng &lt;<a href=3D"mailto:kito.cheng@sifive.com" target=
=3D"_blank">kito.cheng@sifive.com</a>&gt;<br>
&gt;<br>
&gt; Signed-off-by: Kito Cheng &lt;<a href=3D"mailto:kito.cheng@sifive.com"=
 target=3D"_blank">kito.cheng@sifive.com</a>&gt;<br>
&gt; Signed-off-by: Chih-Min Chao &lt;<a href=3D"mailto:chihmin.chao@sifive=
.com" target=3D"_blank">chihmin.chao@sifive.com</a>&gt;<br>
&gt; Signed-off-by: Frank Chang &lt;<a href=3D"mailto:frank.chang@sifive.co=
m" target=3D"_blank">frank.chang@sifive.com</a>&gt;<br>
&gt; Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson=
@linaro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 target/riscv/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt;=C2=A0 target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt;=C2=A0 target/riscv/insn32.decode=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 4 ++<br>
&gt;=C2=A0 target/riscv/insn_trans/trans_rvzfh.c.inc | 65 +++++++++++++++++=
++++++<br>
&gt;=C2=A0 target/riscv/translate.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 8 +++<br>
&gt;=C2=A0 5 files changed, 79 insertions(+)<br>
&gt;=C2=A0 create mode 100644 target/riscv/insn_trans/trans_rvzfh.c.inc<br>
&gt;<br>
&gt; diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c<br>
&gt; index 1d69d1887e6..8c579dc297b 100644<br>
&gt; --- a/target/riscv/cpu.c<br>
&gt; +++ b/target/riscv/cpu.c<br>
&gt; @@ -601,6 +601,7 @@ static Property riscv_cpu_properties[] =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;Counters&quot;, RISCVCPU, c=
fg.ext_counters, true),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;Zifencei&quot;, RISCVCPU, c=
fg.ext_ifencei, true),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;Zicsr&quot;, RISCVCPU, cfg.=
ext_icsr, true),<br>
&gt; +=C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;Zfh&quot;, RISCVCPU, cfg.ext_zfh=
, false),<br>
<br>
This change should be after patch 5. The idea is that we add the<br>
functionality and then allow users to enable it.<br>
<br>
Otherwise:<br>
<br>
Reviewed-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.co=
m" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
<br>
Alistair<br></blockquote><div><br></div><div>The reason why I put here is b=
ecause=C2=A0REQUIRE_ZFH() uses ctx-&gt;zfh.</div><div>I can separate ext_zf=
h field in DisasContext into this patch,</div><div>and add cfg.ext_zfh in R=
ISCVCPU after patch 5 in my next patchset.</div><div><br></div><div>Thanks,=
</div><div>Frank Chang</div><div>=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 DEFINE_PROP_STRING(&quot;priv_spec&quot;, RISCVCPU=
, cfg.priv_spec),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 DEFINE_PROP_STRING(&quot;vext_spec&quot;, RISCVCPU=
, cfg.vext_spec),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 DEFINE_PROP_UINT16(&quot;vlen&quot;, RISCVCPU, cfg=
.vlen, 128),<br>
&gt; diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
&gt; index 9e55b2f5b17..88684e72be1 100644<br>
&gt; --- a/target/riscv/cpu.h<br>
&gt; +++ b/target/riscv/cpu.h<br>
&gt; @@ -297,6 +297,7 @@ struct RISCVCPU {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bool ext_counters;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bool ext_ifencei;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bool ext_icsr;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool ext_zfh;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char *priv_spec;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char *user_spec;<br>
&gt; diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode<b=
r>
&gt; index 2f251dac1bb..b36a3d8dbf8 100644<br>
&gt; --- a/target/riscv/insn32.decode<br>
&gt; +++ b/target/riscv/insn32.decode<br>
&gt; @@ -726,3 +726,7 @@ binv=C2=A0 =C2=A0 =C2=A0 =C2=A00110100 .......... =
001 ..... 0110011 @r<br>
&gt;=C2=A0 binvi=C2=A0 =C2=A0 =C2=A0 01101. ........... 001 ..... 0010011 @=
sh<br>
&gt;=C2=A0 bset=C2=A0 =C2=A0 =C2=A0 =C2=A00010100 .......... 001 ..... 0110=
011 @r<br>
&gt;=C2=A0 bseti=C2=A0 =C2=A0 =C2=A0 00101. ........... 001 ..... 0010011 @=
sh<br>
&gt; +<br>
&gt; +# *** RV32 Zfh Extension ***<br>
&gt; +flh=C2=A0 =C2=A0 =C2=A0 =C2=A0 ............=C2=A0 =C2=A0..... 001 ...=
.. 0000111 @i<br>
&gt; +fsh=C2=A0 =C2=A0 =C2=A0 =C2=A0 .......=C2=A0 ..... ..... 001 ..... 01=
00111 @s<br>
&gt; diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc b/target/riscv/=
insn_trans/trans_rvzfh.c.inc<br>
&gt; new file mode 100644<br>
&gt; index 00000000000..dad1d703d72<br>
&gt; --- /dev/null<br>
&gt; +++ b/target/riscv/insn_trans/trans_rvzfh.c.inc<br>
&gt; @@ -0,0 +1,65 @@<br>
&gt; +/*<br>
&gt; + * RISC-V translation routines for the RV64Zfh Standard Extension.<br=
>
&gt; + *<br>
&gt; + * Copyright (c) 2020 Chih-Min Chao, <a href=3D"mailto:chihmin.chao@s=
ifive.com" target=3D"_blank">chihmin.chao@sifive.com</a><br>
&gt; + *<br>
&gt; + * This program is free software; you can redistribute it and/or modi=
fy it<br>
&gt; + * under the terms and conditions of the GNU General Public License,<=
br>
&gt; + * version 2 or later, as published by the Free Software Foundation.<=
br>
&gt; + *<br>
&gt; + * This program is distributed in the hope it will be useful, but WIT=
HOUT<br>
&gt; + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY=
 or<br>
&gt; + * FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the GNU General Public=
 License for<br>
&gt; + * more details.<br>
&gt; + *<br>
&gt; + * You should have received a copy of the GNU General Public License =
along with<br>
&gt; + * this program.=C2=A0 If not, see &lt;<a href=3D"http://www.gnu.org/=
licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.org/licenses=
/</a>&gt;.<br>
&gt; + */<br>
&gt; +<br>
&gt; +#define REQUIRE_ZFH(ctx) do { \<br>
&gt; +=C2=A0 =C2=A0 if (!ctx-&gt;ext_zfh) {=C2=A0 =C2=A0 =C2=A0 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0\<br>
&gt; +=C2=A0 =C2=A0 }=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; +} while (0)<br>
&gt; +<br>
&gt; +static bool trans_flh(DisasContext *ctx, arg_flh *a)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 TCGv_i64 dest;<br>
&gt; +=C2=A0 =C2=A0 TCGv t0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 REQUIRE_FPU;<br>
&gt; +=C2=A0 =C2=A0 REQUIRE_ZFH(ctx);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 t0 =3D get_gpr(ctx, a-&gt;rs1, EXT_NONE);<br>
&gt; +=C2=A0 =C2=A0 if (a-&gt;imm) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 TCGv temp =3D temp_new(ctx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_addi_tl(temp, t0, a-&gt;imm);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 t0 =3D temp;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 dest =3D cpu_fpr[a-&gt;rd];<br>
&gt; +=C2=A0 =C2=A0 tcg_gen_qemu_ld_i64(dest, t0, ctx-&gt;mem_idx, MO_TEUW)=
;<br>
&gt; +=C2=A0 =C2=A0 gen_nanbox_h(dest, dest);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 mark_fs_dirty(ctx);<br>
&gt; +=C2=A0 =C2=A0 return true;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static bool trans_fsh(DisasContext *ctx, arg_fsh *a)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 TCGv t0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 REQUIRE_FPU;<br>
&gt; +=C2=A0 =C2=A0 REQUIRE_ZFH(ctx);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 t0 =3D get_gpr(ctx, a-&gt;rs1, EXT_NONE);<br>
&gt; +=C2=A0 =C2=A0 if (a-&gt;imm) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 TCGv temp =3D tcg_temp_new();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_addi_tl(temp, t0, a-&gt;imm);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 t0 =3D temp;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 tcg_gen_qemu_st_i64(cpu_fpr[a-&gt;rs2], t0, ctx-&gt;mem=
_idx, MO_TEUW);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return true;<br>
&gt; +}<br>
&gt; diff --git a/target/riscv/translate.c b/target/riscv/translate.c<br>
&gt; index d2442f0cf5d..75048149f5a 100644<br>
&gt; --- a/target/riscv/translate.c<br>
&gt; +++ b/target/riscv/translate.c<br>
&gt; @@ -69,6 +69,7 @@ typedef struct DisasContext {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 bool w;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 bool virt_enabled;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 bool ext_ifencei;<br>
&gt; +=C2=A0 =C2=A0 bool ext_zfh;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 bool hlsx;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* vector extension */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 bool vill;<br>
&gt; @@ -118,6 +119,11 @@ static void gen_nanbox_s(TCGv_i64 out, TCGv_i64 i=
n)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tcg_gen_ori_i64(out, in, MAKE_64BIT_MASK(32, 32));=
<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; +static void gen_nanbox_h(TCGv_i64 out, TCGv_i64 in)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 tcg_gen_ori_i64(out, in, MAKE_64BIT_MASK(16, 48));<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 /*<br>
&gt;=C2=A0 =C2=A0* A narrow n-bit operation, where n &lt; FLEN, checks that=
 input operands<br>
&gt;=C2=A0 =C2=A0* are correctly Nan-boxed, i.e., all upper FLEN - n bits a=
re 1.<br>
&gt; @@ -489,6 +495,7 @@ static uint32_t opcode_at(DisasContextBase *dcbase=
, target_ulong pc)<br>
&gt;=C2=A0 #include &quot;insn_trans/trans_rvh.c.inc&quot;<br>
&gt;=C2=A0 #include &quot;insn_trans/trans_rvv.c.inc&quot;<br>
&gt;=C2=A0 #include &quot;insn_trans/trans_rvb.c.inc&quot;<br>
&gt; +#include &quot;insn_trans/trans_rvzfh.c.inc&quot;<br>
&gt;=C2=A0 #include &quot;insn_trans/trans_privileged.c.inc&quot;<br>
&gt;<br>
&gt;=C2=A0 /* Include the auto-generated decoder for 16 bit insn */<br>
&gt; @@ -541,6 +548,7 @@ static void riscv_tr_init_disas_context(DisasConte=
xtBase *dcbase, CPUState *cs)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ctx-&gt;misa =3D env-&gt;misa;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ctx-&gt;frm =3D -1;=C2=A0 /* unknown rounding mode=
 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ctx-&gt;ext_ifencei =3D cpu-&gt;cfg.ext_ifencei;<b=
r>
&gt; +=C2=A0 =C2=A0 ctx-&gt;ext_zfh =3D cpu-&gt;cfg.ext_zfh;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ctx-&gt;vlen =3D cpu-&gt;cfg.vlen;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ctx-&gt;mstatus_hs_fs =3D FIELD_EX32(tb_flags, TB_=
FLAGS, MSTATUS_HS_FS);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ctx-&gt;hlsx =3D FIELD_EX32(tb_flags, TB_FLAGS, HL=
SX);<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
&gt;<br>
</blockquote></div></div>

--0000000000000b384305ce971f87--

