Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kPKg0-0007QO-Pz
	for mharc-qemu-riscv@gnu.org; Mon, 05 Oct 2020 03:12:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kPKfy-0007Oq-S4
 for qemu-riscv@nongnu.org; Mon, 05 Oct 2020 03:12:50 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231]:38044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kPKfw-0006mr-Rb
 for qemu-riscv@nongnu.org; Mon, 05 Oct 2020 03:12:50 -0400
Received: by mail-oi1-x231.google.com with SMTP id 26so7826673ois.5
 for <qemu-riscv@nongnu.org>; Mon, 05 Oct 2020 00:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HNhFOPee1qdLsUwmeYn5TzRfIXGll/raMnqLJU5GQTs=;
 b=PbqI9ClZ4CboBdna3GV5QordQxJ2K+rkQvupnIXrkS14GhTZwl3YO5aCugIRSdIQcZ
 DMKB5CKAPrOIeolGrux2o2MEGm+sKS+d0mtIbMhzrllfyg8XI3IP3KxgDai99l6sCCR8
 FlvMKxXsIiCost6gAGkoUYIz88Skz82s4lLu6TxKfD3WvfRlObZQjxX9xy3LeNlzww6a
 sm72o2VOY3HRarif3AKE37rqgB2bqN4zHuMN2jXw3cO3X20+h4hAtihT336FXJlGKe/8
 0UVwQjRyI+LBlYvyiSm/W4nH1eEnCNGr3B2RTllmRHX3vsYW77kkS7J4loiHaKAlyXhC
 eeng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HNhFOPee1qdLsUwmeYn5TzRfIXGll/raMnqLJU5GQTs=;
 b=RJJd1EfwmOesUuZkYspxkfDrbZ6JBdxMF2mj9ACIRenvl2/J1x0CpA1xnmfmnQh4jZ
 Vlp75ku/3rb3CLrwbhUFQ51kO6eIe4dDMterqqdHqgNOBWcDpwiE9B00PgGiHRIYnokJ
 mgWvMb8rC+z81ErsuDel+Megp19pbJlqYub09ogbAJn+lKrvKnmoHfXtvI0LceSUYc+C
 OgFGXXj6cqng1sHHM9jLk3CSjgzLgLuEt2unK6gDuyQxdNHj5B2EVMPrG6nSvwE1AJk1
 F5gbuA0R8E73S8Zv8YsSV/Jic3rQrgNv/z//tfsMLgWA9HP+y/ZPWhjE9Dlq2AnUBHsH
 l/ig==
X-Gm-Message-State: AOAM533d9wmEzYcSgXRmY8ULI3i3ZdSGls/pyHGjAYYbtUjJ1WVVfmwM
 UMsnN2t+layjKCLzCDNPcnygk5rN5x0l40CfzrXBZQ==
X-Google-Smtp-Source: ABdhPJye1MaHqOqi/jZpWMoL6w0d+7jn8v2DvmuCpZjx2//U4aqGhoaOCpwtyHC4b5kel7bNtmh3cahtkddt/9dt+Uo=
X-Received: by 2002:aca:51d1:: with SMTP id f200mr7379910oib.122.1601881967182; 
 Mon, 05 Oct 2020 00:12:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200929190448.31116-1-frank.chang@sifive.com>
 <20200929190448.31116-7-frank.chang@sifive.com>
 <ad28385b-3e36-e33a-03c2-dabaaaea80bc@linaro.org>
In-Reply-To: <ad28385b-3e36-e33a-03c2-dabaaaea80bc@linaro.org>
From: Frank Chang <frank.chang@sifive.com>
Date: Mon, 5 Oct 2020 15:12:36 +0800
Message-ID: <CAE_xrPgK0ROiWo+Evan9uGFoBo8t0hV8vt0A2DxDb_Sws55-Ng@mail.gmail.com>
Subject: Re: [RFC v5 06/68] target/riscv: rvv-1.0: add translation-time vector
 context status
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 LIU Zhiwei <zhiwei_liu@c-sky.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Content-Type: multipart/alternative; boundary="000000000000a05e5105b0e73500"
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=frank.chang@sifive.com; helo=mail-oi1-x231.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 05 Oct 2020 07:12:51 -0000

--000000000000a05e5105b0e73500
Content-Type: text/plain; charset="UTF-8"

On Sat, Oct 3, 2020 at 12:19 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 9/29/20 2:03 PM, frank.chang@sifive.com wrote:
> > +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> > @@ -41,6 +41,7 @@ static bool trans_vsetvl(DisasContext *ctx, arg_vsetvl
> *a)
> >      gen_get_gpr(s2, a->rs2);
> >      gen_helper_vsetvl(dst, cpu_env, s1, s2);
> >      gen_set_gpr(a->rd, dst);
> > +    mark_vs_dirty(ctx);
> >      tcg_gen_movi_tl(cpu_pc, ctx->pc_succ_insn);
> >      lookup_and_goto_ptr(ctx);
> >      ctx->base.is_jmp = DISAS_NORETURN;
> > @@ -72,7 +73,7 @@ static bool trans_vsetvli(DisasContext *ctx,
> arg_vsetvli *a)
> >      }
> >      gen_helper_vsetvl(dst, cpu_env, s1, s2);
> >      gen_set_gpr(a->rd, dst);
> > -    gen_goto_tb(ctx, 0, ctx->pc_succ_insn);
> > +    mark_vs_dirty(ctx);
>
> Removing the gen_goto_tb can't be right all by itself.
>

Oops, I think I somehow mess up the commits.
This commit should only contain: + mark_vs_dirty(ctx); change.
The - gen_goto_tb(ctx, 0, ctx->pc_succ_insn); should be included and
replaced by:
+ tcg_gen_movi_tl(cpu_pc, ctx->pc_succ_insn);
+ lookup_and_goto_ptr(ctx);
in later commit: target/riscv: rvv-1.0: update check functions.


> I think you want to be sharing the code between vsetvl and vsetvli now.
> Just
> pass in a TCGv value to a common helper.
>

The only difference now between vsetvl and vsetvli is the format of zimm
and s2 fields.
But they have different formats and are queried by different functions,
i.e. s2 = tcg_const_tl(a->zimm); and gen_get_gpr(s2, a->rs2);

Is there any elegant way to retrieve the values of zimm and s2 by shared
common codes?


>
> r~
>

Thanks,
Frank Chang

--000000000000a05e5105b0e73500
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sat, Oct 3, 2020 at 12:19 AM Richard H=
enderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.hender=
son@linaro.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">On 9/29/20 2:03 PM, <a href=3D"mai=
lto:frank.chang@sifive.com" target=3D"_blank">frank.chang@sifive.com</a> wr=
ote:<br>
&gt; +++ b/target/riscv/insn_trans/trans_rvv.c.inc<br>
&gt; @@ -41,6 +41,7 @@ static bool trans_vsetvl(DisasContext *ctx, arg_vset=
vl *a)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 gen_get_gpr(s2, a-&gt;rs2);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 gen_helper_vsetvl(dst, cpu_env, s1, s2);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 gen_set_gpr(a-&gt;rd, dst);<br>
&gt; +=C2=A0 =C2=A0 mark_vs_dirty(ctx);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 tcg_gen_movi_tl(cpu_pc, ctx-&gt;pc_succ_insn);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 lookup_and_goto_ptr(ctx);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ctx-&gt;base.is_jmp =3D DISAS_NORETURN;<br>
&gt; @@ -72,7 +73,7 @@ static bool trans_vsetvli(DisasContext *ctx, arg_vse=
tvli *a)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 gen_helper_vsetvl(dst, cpu_env, s1, s2);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 gen_set_gpr(a-&gt;rd, dst);<br>
&gt; -=C2=A0 =C2=A0 gen_goto_tb(ctx, 0, ctx-&gt;pc_succ_insn);<br>
&gt; +=C2=A0 =C2=A0 mark_vs_dirty(ctx);<br>
<br>
Removing the gen_goto_tb can&#39;t be right all by itself.<br></blockquote>=
<div><br></div><div>Oops, I think I somehow mess up the commits.</div><div>=
This commit should only contain: + mark_vs_dirty(ctx); change.</div><div>Th=
e - gen_goto_tb(ctx, 0, ctx-&gt;pc_succ_insn); should be included=C2=A0and =
replaced by:</div><div>+ tcg_gen_movi_tl(cpu_pc, ctx-&gt;pc_succ_insn);<br>=
+ lookup_and_goto_ptr(ctx);<br></div><div>in later commit: target/riscv: rv=
v-1.0: update check functions.</div><div><br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
<br>
I think you want to be sharing the code between vsetvl and vsetvli now.=C2=
=A0 Just<br>
pass in a TCGv value to a common helper.<br></blockquote><div><br></div><di=
v>The only difference now between vsetvl=C2=A0and vsetvli is the format of =
zimm and s2 fields.</div><div>But they have different formats and are queri=
ed by different functions,</div><div>i.e. s2 =3D tcg_const_tl(a-&gt;zimm); =
and gen_get_gpr(s2, a-&gt;rs2);</div><div><br></div><div>Is there any elega=
nt way to retrieve the values of zimm and s2 by shared common codes?<br></d=
iv><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
r~<br></blockquote><div><br></div><div>Thanks,</div><div>Frank Chang=C2=A0=
=C2=A0</div><div><br></div></div></div>

--000000000000a05e5105b0e73500--

