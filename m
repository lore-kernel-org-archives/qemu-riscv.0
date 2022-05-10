Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1noTsW-0005ni-MI
	for mharc-qemu-riscv@gnu.org; Tue, 10 May 2022 13:42:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daolu@rivosinc.com>)
 id 1noTsP-0005ld-CD
 for qemu-riscv@nongnu.org; Tue, 10 May 2022 13:42:26 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:39572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <daolu@rivosinc.com>)
 id 1noTsC-0005bA-TN
 for qemu-riscv@nongnu.org; Tue, 10 May 2022 13:42:17 -0400
Received: by mail-pg1-x52c.google.com with SMTP id r192so11036500pgr.6
 for <qemu-riscv@nongnu.org>; Tue, 10 May 2022 10:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jLo1odo1nlis5qYHeLw0d3bpXDR71zsO7FQwD9J9Ol0=;
 b=z9QoR/xVwFwcCpg93GNeTm2PA3xqIjF6DW9xCJ57bPnxDQFlGFg0vu+ryeJi115GHk
 SevFXaBxcjSn6/mM7i+ha4VXvM+umnpBbBScsumPoPT7LtN4g+jlcfNqUmtEi8eY/Eqj
 NzMxzp9r7Mn1vb8guaKwFI/7rvQWKFqnb7oLVTvaat8EpjdibMaQa5tR/iUh/VJOxncE
 g1PQa69kVtyEr3cIZJcC9Lu/qZUWe8M/veWidwCgNSUIJr5ERtBmnnWOzim9LLruPkkW
 RzKIjqOD725K8tE8rXoF2vxP5Etz/S03zXBDlFC9AICkaRK2oxfVndB8I2T5izunbPUj
 NZXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jLo1odo1nlis5qYHeLw0d3bpXDR71zsO7FQwD9J9Ol0=;
 b=P8ARiUAfq+ZAngAwpQfrXD78ntOPt0b+ZoJMTBjDMjOUOnm58AwSsKKOSEKxh4XZFo
 XVJI3YvXA8wsOCgHKk8K83/OSbwZIzANsq66TL/TT60ib/IQM3RYWLubAiIeVPlovGlK
 0Vi0UlC/pReCjYJJCPzFciOqSMLAoBFIfU39iV/nQFuzohp0KPezVKxCWWT5z1ewHiuz
 0qsHZcG32aIxcsWfTTe2aHOPUelcrccyRQEGmYxxtdOUQBcDVoxCEwS8TOeKM+TM6abZ
 r6fkV8RpetJezRNo63IqU15tiaAIsG3Xmj6dn6tJzRdAE1IKc+XjzKnlsq8EucJfD83f
 hsVA==
X-Gm-Message-State: AOAM530NkcxqVrWQmjyRxBmAk/GSp4zqXMYHDpAHyoOqNoM+U6d5ehKC
 DK4DJ54CTU5LeK4Fqcm5JQbaor4XCW4OOtHxxt+I+w==
X-Google-Smtp-Source: ABdhPJyZOwy/LDVZ/9KucdkDbc2n+b6334cqaXJnsuoOdsMb4a+ohtX0rUwxxG9GwcukaEwJCNk+OMBlnlIYN0TGNcA=
X-Received: by 2002:a63:5564:0:b0:3ab:9d95:7a21 with SMTP id
 f36-20020a635564000000b003ab9d957a21mr17950039pgm.542.1652204530890; Tue, 10
 May 2022 10:42:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220510064231.1384670-1-daolu@rivosinc.com>
 <20220510064231.1384670-2-daolu@rivosinc.com>
 <f9f7804f-76e1-da5c-600a-47b6df780e15@linaro.org>
In-Reply-To: <f9f7804f-76e1-da5c-600a-47b6df780e15@linaro.org>
From: Dao Lu <daolu@rivosinc.com>
Date: Tue, 10 May 2022 10:42:00 -0700
Message-ID: <CAKh7v-Qz3S1z-MKYctAOf9VwxWL6i_nH-pPehxh2FdxAMHMQug@mail.gmail.com>
Subject: Re: [PATCH 1/1] Add Zihintpause support
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000029152d05deabd8b8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=daolu@rivosinc.com; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Tue, 10 May 2022 17:42:26 -0000

--00000000000029152d05deabd8b8
Content-Type: text/plain; charset="UTF-8"

Thanks Richard! I have fixed it following your advice:

diff --git a/target/riscv/insn_trans/trans_rvi.c.inc
b/target/riscv/insn_trans/trans_rvi.c.inc
index 528c30c9a2..acd2548e9b 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -808,9 +808,13 @@ static bool trans_pause(DisasContext *ctx, arg_pause
*a)

     /*
      * PAUSE is a no-op in QEMU,
-     * however we need to clear the reservation
+     * however we need to clear the reservation,
+     * end the TB and return to main loop
      */
     tcg_gen_movi_tl(load_res, -1);
+    gen_set_pc_imm(ctx, ctx->pc_succ_insn);
+    tcg_gen_exit_tb(NULL, 0);
+    ctx->base.is_jmp = DISAS_NORETURN;

     return true;
 }

I will wait a bit to see if there are any more comments.

On Tue, May 10, 2022 at 8:43 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 5/9/22 23:42, Dao Lu wrote:
> > +static bool trans_pause(DisasContext *ctx, arg_pause *a)
> > +{
> > +    REQUIRE_ZIHINTPAUSE(ctx);
> > +
> > +    /*
> > +     * PAUSE is a no-op in QEMU,
> > +     * however we need to clear the reservation
> > +     */
> > +    tcg_gen_movi_tl(load_res, -1);
>
> I recommend ending the TB and returning to the main loop.  When running in
> round-robin
> mode, this will yield to the next cpu.
>
>
> r~
>

--00000000000029152d05deabd8b8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Richard! I have fixed it following your advice:<div=
><br></div><div>diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/targ=
et/riscv/insn_trans/trans_rvi.c.inc<br>index 528c30c9a2..acd2548e9b 100644<=
br>--- a/target/riscv/insn_trans/trans_rvi.c.inc<br>+++ b/target/riscv/insn=
_trans/trans_rvi.c.inc<br>@@ -808,9 +808,13 @@ static bool trans_pause(Disa=
sContext *ctx, arg_pause *a)<br><br>=C2=A0 =C2=A0 =C2=A0/*<br>=C2=A0 =C2=A0=
 =C2=A0 * PAUSE is a no-op in QEMU,<br>- =C2=A0 =C2=A0 * however we need to=
 clear the reservation<br>+ =C2=A0 =C2=A0 * however we need to clear the re=
servation,<br>+ =C2=A0 =C2=A0 * end the TB and return to main loop<br>=C2=
=A0 =C2=A0 =C2=A0 */<br>=C2=A0 =C2=A0 =C2=A0tcg_gen_movi_tl(load_res, -1);<=
br>+ =C2=A0 =C2=A0gen_set_pc_imm(ctx, ctx-&gt;pc_succ_insn);<br>+ =C2=A0 =
=C2=A0tcg_gen_exit_tb(NULL, 0);<br>+ =C2=A0 =C2=A0ctx-&gt;base.is_jmp =3D D=
ISAS_NORETURN;<br><br>=C2=A0 =C2=A0 =C2=A0return true;<br>=C2=A0}<br></div>=
<div><br></div><div>I will wait a bit to see if there are any more comments=
.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, May 10, 2022 at 8:43 AM Richard Henderson &lt;<a href=3D"mai=
lto:richard.henderson@linaro.org">richard.henderson@linaro.org</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 5/9/22 23:=
42, Dao Lu wrote:<br>
&gt; +static bool trans_pause(DisasContext *ctx, arg_pause *a)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 REQUIRE_ZIHINTPAUSE(ctx);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* PAUSE is a no-op in QEMU,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* however we need to clear the reservation<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 tcg_gen_movi_tl(load_res, -1);<br>
<br>
I recommend ending the TB and returning to the main loop.=C2=A0 When runnin=
g in round-robin <br>
mode, this will yield to the next cpu.<br>
<br>
<br>
r~<br>
</blockquote></div>

--00000000000029152d05deabd8b8--

