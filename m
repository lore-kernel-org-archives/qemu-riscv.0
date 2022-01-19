Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nAHBz-0006dN-LX
	for mharc-qemu-riscv@gnu.org; Wed, 19 Jan 2022 15:04:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nAHBy-0006cl-6E
 for qemu-riscv@nongnu.org; Wed, 19 Jan 2022 15:04:26 -0500
Received: from [2a00:1450:4864:20::334] (port=53764
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nAHBv-0003bQ-JQ
 for qemu-riscv@nongnu.org; Wed, 19 Jan 2022 15:04:25 -0500
Received: by mail-wm1-x334.google.com with SMTP id n8so7395413wmk.3
 for <qemu-riscv@nongnu.org>; Wed, 19 Jan 2022 12:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KAuHCVK0L/s4qYVEZgPJWaUAk24hkFooqDWACjnIeg0=;
 b=pyhATFflFmvUm3sp8GxYoob2sCvC9VTe9kw+YgCqmr5td1A/RCHlEjo3DYpTax/n9d
 /AARP0RC40xR6OU6a/fW/Fa+0z6gPpMyqafi9YrrbGlhqWpOewLd7oYq+nuA+nPr8KuS
 8fjhV17V5AmI4Lu95TfiulYkxS+qf9jIq9qO1nHuw4zAqDtwSzZvcNh4iICkUxiE+hoK
 qFYauUSaEsl9N6/7LvK4Ggkd5ZOStmFGiwneatfn/ydU05hUse0WBWe5X4KltP9bO80M
 metOkbmIhNU8IXcsJ1S25XUM+jNjuNz6OOu4ztC3ruZCJOABswXI818Z4TeoQtdD7kZh
 H5XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KAuHCVK0L/s4qYVEZgPJWaUAk24hkFooqDWACjnIeg0=;
 b=GCMMG/6F0jB5y4pv2l5GNNcLRo7mQ+dKMBfj93a39htRnn2nAW1qSIYOb65ZdFrQEm
 wyFaZHTvf6LCsZxRN6plsF6V0riInO30Tefyil847ENk+wLpvZKtpBefZmyVB8f6vZXu
 sga70O1NKX9OwzK9dHU72hRf9awjxy3n4hd57DB4W5OSdUOvOkXL9kvv35rJ/pdrx/gz
 p37F5JLtKwECg3p04SZpAHDSy2OqdgbFonJ5BuW6c8ucY5W1Q7g2aQEY+qR/hJKuP7lY
 zj72T84ZpxJb5ZIVor9UzrDQR2sPnKCD0p5Xi1iuCPuwo54Wb/tztOgfqBdxMOd5J9b4
 ho8g==
X-Gm-Message-State: AOAM5329bkY0GQWNwhZz5/MPBDLx9SBit6DVJpe/VR1HbqnANzmXe4EI
 dVdP1uagNoHllA7YhY1TYVzc+nlro4w9Ts5i5CTfkw==
X-Google-Smtp-Source: ABdhPJxu+51eQNmvJ6/oLxdzT96kcIWSiID6RZ3YcX986iDY14F4Qi6GI99MQtVBCrrbq9JF7xSw1qtjJn8xjXu44Mg=
X-Received: by 2002:a05:600c:1c15:: with SMTP id
 j21mr5150287wms.48.1642622661276; 
 Wed, 19 Jan 2022 12:04:21 -0800 (PST)
MIME-Version: 1.0
References: <20220118163245.2596468-1-cmuellner@linux.com>
In-Reply-To: <20220118163245.2596468-1-cmuellner@linux.com>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Wed, 19 Jan 2022 21:04:09 +0100
Message-ID: <CAAeLtUBj4H=z42DFqQuX43ecFV41HUR0OjdY+t7+XkUD+tYw_w@mail.gmail.com>
Subject: Re: [RESEND] target/riscv: fix RV128 lq encoding
To: Christoph Muellner <cmuellner@linux.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000039cc2605d5f4e424"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-wm1-x334.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 19 Jan 2022 20:04:26 -0000

--00000000000039cc2605d5f4e424
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The cbo.* mnemonics share their opcode space with lq for those cases where
rd =3D=3D 0 ("brownfield" encodings).
"Major opcode" refers to inst[6:0] according to chapter 26.

In overlapping multi-group syntax, this would look like:

> {
>
>   # *** RV32 Zicbom Standard Extension ***
>
>   cbo_clean  0000000 00001 ..... 010 00000 0001111 @sfence_vm
>
>   cbo_flush  0000000 00010 ..... 010 00000 0001111 @sfence_vm
>
>   cbo_inval  0000000 00000 ..... 010 00000 0001111 @sfence_vm
>
>
>   # *** RV32 Zicboz Standard Extension ***
>
>   cbo_zero   0000000 00100 ..... 010 00000 0001111 @sfence_vm
>
>
>   # *** RVI128 lq ***
>
>   lq       ............   ..... 010 ..... 0001111 @i
>
> }
>

Instead of using a multigroup here, I would recommend that you take a look
at https://patchwork.kernel.org/project/qemu-devel/list/?series=3D605340
where we have added a table of optional decoders =E2=80=94 this could be us=
ed to
split these off into separate decoders that are run before the regular
decoder, if & only if Zicboc and/or Zicboz are enabled.

Cheers,
Philipp.


On Tue, 18 Jan 2022 at 17:32, Christoph Muellner <cmuellner@linux.com>
wrote:

> If LQ has func3=3D=3D010 and is located in the MISC-MEM opcodes,
> then it conflicts with the CBO opcode space.
> However, since LQ is specified as: "LQ is added to the MISC-MEM major
> opcode", we have an implementation bug, because 'major opcode'
> refers to func3, which must be 111.
>
> This results in the following instruction encodings:
>
> lq        ........ ........ .111.... .0001111
> cbo_clean 00000000 0001.... .0100000 00001111
> cbo_flush 00000000 0010.... .0100000 00001111
> cbo_inval 00000000 0000.... .0100000 00001111
> cbo_zero  00000000 0100.... .0100000 00001111
>                              ^^^-func3
>                                       ^^^^^^^-opcode
>
> Signed-off-by: Christoph Muellner <cmuellner@linux.com>
> ---
>  target/riscv/insn32.decode | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 5bbedc254c..d3f798ca10 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -168,7 +168,7 @@ sraw     0100000 .....  ..... 101 ..... 0111011 @r
>
>  # *** RV128I Base Instruction Set (in addition to RV64I) ***
>  ldu      ............   ..... 111 ..... 0000011 @i
> -lq       ............   ..... 010 ..... 0001111 @i
> +lq       ............   ..... 111 ..... 0001111 @i
>  sq       ............   ..... 100 ..... 0100011 @s
>  addid    ............  .....  000 ..... 1011011 @i
>  sllid    000000 ......  ..... 001 ..... 1011011 @sh6
> --
> 2.34.1
>
>

--00000000000039cc2605d5f4e424
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The cbo.* mnemonics share their opcode space with lq for t=
hose cases where rd =3D=3D 0 (&quot;brownfield&quot; encodings).<div>&quot;=
Major opcode&quot; refers to inst[6:0] according to chapter 26.<br><div><di=
v><br></div><div>In overlapping multi-group syntax, this would look like:</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">





<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">{</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures"><span class=3D"gmail-Apple-conv=
erted-space">=C2=A0 </span># *** RV32 Zicbom Standard Extension ***</span><=
/p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures"><span class=3D"gmail-Apple-conv=
erted-space">=C2=A0 </span>cbo_clean<span class=3D"gmail-Apple-converted-sp=
ace">=C2=A0 </span>0000000 00001 ..... 010 00000 0001111 @sfence_vm</span><=
/p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures"><span class=3D"gmail-Apple-conv=
erted-space">=C2=A0 </span>cbo_flush<span class=3D"gmail-Apple-converted-sp=
ace">=C2=A0 </span>0000000 00010 ..... 010 00000 0001111 @sfence_vm</span><=
/p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures"><span class=3D"gmail-Apple-conv=
erted-space">=C2=A0 </span>cbo_inval<span class=3D"gmail-Apple-converted-sp=
ace">=C2=A0 </span>0000000 00000 ..... 010 00000 0001111 @sfence_vm</span><=
/p>
<p class=3D"gmail-p2" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0);min-height:13px"><span class=3D"gma=
il-s1" style=3D"font-variant-ligatures:no-common-ligatures"></span><br></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures"><span class=3D"gmail-Apple-conv=
erted-space">=C2=A0 </span># *** RV32 Zicboz Standard Extension ***</span><=
/p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures"><span class=3D"gmail-Apple-conv=
erted-space">=C2=A0 </span>cbo_zero <span class=3D"gmail-Apple-converted-sp=
ace">=C2=A0 </span>0000000 00100 ..... 010 00000 0001111 @sfence_vm</span><=
/p>
<p class=3D"gmail-p2" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0);min-height:13px"><span class=3D"gma=
il-s1" style=3D"font-variant-ligatures:no-common-ligatures"></span><br></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures"><span class=3D"gmail-Apple-conv=
erted-space">=C2=A0 </span># ***<span class=3D"gmail-Apple-tab-span" style=
=3D"white-space:pre">	</span>RVI128 lq ***</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures"><span class=3D"gmail-Apple-conv=
erted-space">=C2=A0 </span>lq <span class=3D"gmail-Apple-converted-space">=
=C2=A0 =C2=A0 =C2=A0 </span>............ <span class=3D"gmail-Apple-convert=
ed-space">=C2=A0 </span>..... 010 ..... 0001111 @i</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:no=
rmal;font-family:Menlo;color:rgb(0,0,0)"><span class=3D"gmail-s1" style=3D"=
font-variant-ligatures:no-common-ligatures">}</span></p></blockquote><div><=
br></div><div>Instead of using a multigroup here, I would recommend that yo=
u take a look at=C2=A0<a href=3D"https://patchwork.kernel.org/project/qemu-=
devel/list/?series=3D605340">https://patchwork.kernel.org/project/qemu-deve=
l/list/?series=3D605340</a> where we have added a table of optional decoder=
s =E2=80=94 this could be used to split these off into separate decoders th=
at are run before the regular decoder, if &amp; only if Zicboc and/or Zicbo=
z are enabled.=C2=A0<br></div><div><br></div><div>Cheers,</div><div>Philipp=
.</div></div></div></div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Tue, 18 Jan 2022 at 17:32, Christoph Muellner &lt=
;<a href=3D"mailto:cmuellner@linux.com">cmuellner@linux.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">If LQ has func3=
=3D=3D010 and is located in the MISC-MEM opcodes,<br>
then it conflicts with the CBO opcode space.<br>
However, since LQ is specified as: &quot;LQ is added to the MISC-MEM major<=
br>
opcode&quot;, we have an implementation bug, because &#39;major opcode&#39;=
<br>
refers to func3, which must be 111.<br>
<br>
This results in the following instruction encodings:<br>
<br>
lq=C2=A0 =C2=A0 =C2=A0 =C2=A0 ........ ........ .111.... .0001111<br>
cbo_clean 00000000 0001.... .0100000 00001111<br>
cbo_flush 00000000 0010.... .0100000 00001111<br>
cbo_inval 00000000 0000.... .0100000 00001111<br>
cbo_zero=C2=A0 00000000 0100.... .0100000 00001111<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^^^-func3<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^^^^^^^-opcode<=
br>
<br>
Signed-off-by: Christoph Muellner &lt;<a href=3D"mailto:cmuellner@linux.com=
" target=3D"_blank">cmuellner@linux.com</a>&gt;<br>
---<br>
=C2=A0target/riscv/insn32.decode | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode<br>
index 5bbedc254c..d3f798ca10 100644<br>
--- a/target/riscv/insn32.decode<br>
+++ b/target/riscv/insn32.decode<br>
@@ -168,7 +168,7 @@ sraw=C2=A0 =C2=A0 =C2=A00100000 .....=C2=A0 ..... 101 .=
.... 0111011 @r<br>
<br>
=C2=A0# *** RV128I Base Instruction Set (in addition to RV64I) ***<br>
=C2=A0ldu=C2=A0 =C2=A0 =C2=A0 ............=C2=A0 =C2=A0..... 111 ..... 0000=
011 @i<br>
-lq=C2=A0 =C2=A0 =C2=A0 =C2=A0............=C2=A0 =C2=A0..... 010 ..... 0001=
111 @i<br>
+lq=C2=A0 =C2=A0 =C2=A0 =C2=A0............=C2=A0 =C2=A0..... 111 ..... 0001=
111 @i<br>
=C2=A0sq=C2=A0 =C2=A0 =C2=A0 =C2=A0............=C2=A0 =C2=A0..... 100 .....=
 0100011 @s<br>
=C2=A0addid=C2=A0 =C2=A0 ............=C2=A0 .....=C2=A0 000 ..... 1011011 @=
i<br>
=C2=A0sllid=C2=A0 =C2=A0 000000 ......=C2=A0 ..... 001 ..... 1011011 @sh6<b=
r>
-- <br>
2.34.1<br>
<br>
</blockquote></div>

--00000000000039cc2605d5f4e424--

