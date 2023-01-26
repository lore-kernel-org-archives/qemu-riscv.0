Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pKyg0-0006Kx-VD
	for mharc-qemu-riscv@gnu.org; Thu, 26 Jan 2023 04:36:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1pKyfq-0006D7-At
 for qemu-riscv@nongnu.org; Thu, 26 Jan 2023 04:36:04 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1pKyfj-0000HA-IS
 for qemu-riscv@nongnu.org; Thu, 26 Jan 2023 04:35:59 -0500
Received: by mail-ej1-x633.google.com with SMTP id me3so3488028ejb.7
 for <qemu-riscv@nongnu.org>; Thu, 26 Jan 2023 01:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DT0Lu1S7bVZWSJ/5KBhAOZTAy5/bIBsgUk28kymJUw4=;
 b=sb+UdAvKJWjfVzhyZl5yV7hTO0JFMMhtb5a7x8dTqWV2/lT+CEtMFw5YVva/45BzVK
 F/tVlsryDH9PpY70gohDVM7QG+0TrUVf+UuDkP0odQOz7nLHFDPZvQX+TwgLg1PJD7Ua
 Bu2/oBX7E12T72StK7L77RL6OMGqYgyv4yLAR+CNgj35jp7ucn5z27r9R6Cc7gz9k3Ob
 boU/Hcf1HSv+4AcklCTn7S1UizecblG++85Dzsj8sFO+SbD03s8b6Vl2VLHo/JRLXgTL
 PPF5YjN2aNKF2SQRfDG+J2dfhXSf5OzZ37QuYJQo+xnLlM9ACSDJ+HX/s5pEqwTxIzLG
 IP/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DT0Lu1S7bVZWSJ/5KBhAOZTAy5/bIBsgUk28kymJUw4=;
 b=Fu3KsOpV7hxJgvvVcTd/Ik34NyOZk89M8HixUQ3zeXcmObujnO0aDvN8xyY+8dmNTE
 Nz+7bdXP1LrQHq5Ww0/kKifOGZHAC5yq8vIwETLSchujUR9P89bo+qwtvKmk8pjHzGq1
 AuICl6s4DY0b7hnaisnL1kyCpeZqB5/Mnbc65F4Hbs1k4/Ot6JL/464MiAjBUYq/sbb9
 +mUAk2/Qcxr2b0x+B8rppispSmGAu8838g7GnVQrGxrVM2q8KkZy/THHkUs4cXPK01Bt
 XsziL526GkwOBVK6Ts4OrJ9Q16/bx15k6V1dCA9XhARQwCaTjYmyCpZRJsL/LQU78VEu
 5F9w==
X-Gm-Message-State: AFqh2kqHUYcIv8ksrj+9321PfPNoDJwYRAE0PxeAGULgOFq6v/Q8C/rx
 U8JU0TP7U6qW6w4Xfymd/BlZkDYaAM6LpVVCeP9AEw==
X-Google-Smtp-Source: AMrXdXsscODI8IrXD1LeP41GmLRUpd22QIcs84drJwKJ3t1ISnggbG38fGMBrlgSNvlGJpdHxxvf8lhEP2SjemjowBY=
X-Received: by 2002:a17:906:9c50:b0:86a:12b:d096 with SMTP id
 fg16-20020a1709069c5000b0086a012bd096mr4288572ejc.70.1674725747678; Thu, 26
 Jan 2023 01:35:47 -0800 (PST)
MIME-Version: 1.0
References: <20230119143528.1290950-1-lawrence.hunter@codethink.co.uk>
 <380600FF-17AC-4134-85C7-CBDF6E34F0E2@getmailspring.com>
In-Reply-To: <380600FF-17AC-4134-85C7-CBDF6E34F0E2@getmailspring.com>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Thu, 26 Jan 2023 10:35:36 +0100
Message-ID: <CAAeLtUDcaezCHcoCEZ5XA=DNkX_cYXMYx56sYzpzYCih5iY0=Q@mail.gmail.com>
Subject: Re: [RFC PATCH 00/39] Add RISC-V cryptography extensions
 standardisation
To: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
Cc: "alistair.francis@wdc.com" <alistair.francis@wdc.com>, 
 "bin.meng@windriver.com" <bin.meng@windriver.com>, 
 "dickon.hood@codethink.co.uk" <dickon.hood@codethink.co.uk>, 
 "frank.chang@sifive.com" <frank.chang@sifive.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, 
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000049800a05f327797f"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-ej1-x633.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URI_NOVOWEL=0.5 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 26 Jan 2023 09:36:06 -0000

--00000000000049800a05f327797f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Lawrence,

we=E2=80=98ll review, as we=E2=80=98ve also been developing a similar serie=
s and have the
know how readily available.  Seems like you beat us to submitting it ;-)

I=E2=80=99ll make sure reviews go up by next week.

Philipp.

On Thu 26. Jan 2023 at 10:21, Lawrence Hunter <
lawrence.hunter@codethink.co.uk> wrote:

> Follow up for add RISC-V vector cryptography extensions standardisation
> RFC: we've not received any comments and would like to move this series
> towards getting merged. Does anyone have time to review it, and should
> we look at resubmitting for merging soon?
>
> ---------- Forwarded Message ---------
>
> From: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
> Subject: [RFC PATCH 00/39] Add RISC-V cryptography extensions
> standardisation
> Date: Jan 19 2023, at 2:34 pm
> To: qemu-riscv@nongnu.org
> Cc: dickon.hood@codethink.co.uk, frank.chang@sifive.com, Lawrence Hunter =
<
> lawrence.hunter@codethink.co.uk>
>
>
> > This RFC introduces an implementation for the six instruction sets
> > of the draft RISC-V cryptography extensions standardisation
> > specification. Once the specification has been ratified we will submit
> > these changes as a pull request email to this mailing list. Would this
> > be prefered by instruction group or unified as in this RFC?
> >
> > This patch set implements the instruction sets as per the 20221202
> > version of the specification (1).
> >
> > Work performed by Dickon, Lawrence, Nazar, Kiran, and William from
> Codethink
> > sponsored by SiFive, and Max Chou from SiFive.
> >
> > 1. https://github.com/riscv/riscv-crypto/releases
> >
> > Dickon Hood (1):
> >  target/riscv: Add vrol.[vv,vx] and vror.[vv,vx,vi] decoding,
> >    translation and execution support
> >
> > Kiran Ostrolenk (4):
> >  target/riscv: Add vsha2ms.vv decoding, translation and execution
> >    support
> >  target/riscv: add zvksh cpu property
> >  target/riscv: Add vsm3c.vi decoding, translation and execution support
> >  target/riscv: expose zvksh cpu property
> >
> > Lawrence Hunter (16):
> >  target/riscv: Add vclmul.vv decoding, translation and execution
> >    support
> >  target/riscv: Add vclmul.vx decoding, translation and execution
> >    support
> >  target/riscv: Add vclmulh.vv decoding, translation and execution
> >    support
> >  target/riscv: Add vclmulh.vx decoding, translation and execution
> >    support
> >  target/riscv: Add vaesef.vv decoding, translation and execution
> >    support
> >  target/riscv: Add vaesef.vs decoding, translation and execution
> >    support
> >  target/riscv: Add vaesdf.vv decoding, translation and execution
> >    support
> >  target/riscv: Add vaesdf.vs decoding, translation and execution
> >    support
> >  target/riscv: Add vaesdm.vv decoding, translation and execution
> >    support
> >  target/riscv: Add vaesdm.vs decoding, translation and execution
> >    support
> >  target/riscv: Add vaesz.vs decoding, translation and execution support
> >  target/riscv: Add vsha2c[hl].vv decoding, translation and execution
> >    support
> >  target/riscv: Add vsm3me.vv decoding, translation and execution
> >    support
> >  target/riscv: add zvkg cpu property
> >  target/riscv: Add vghmac.vv decoding, translation and execution
> >    support
> >  target/riscv: expose zvkg cpu property
> >
> > Max Chou (5):
> >  crypto: Move SM4_SBOXWORD from target/riscv
> >  crypto: Add SM4 constant parameter CK.
> >  target/riscv: Add zvksed cfg property
> >  target/riscv: Add Zvksed support
> >  target/riscv: Expose Zvksed property
> >
> > Nazar Kazakov (10):
> >  target/riscv: add zvkb cpu property
> >  target/riscv: Add vrev8.v decoding, translation and execution support
> >  target/riscv: Add vandn.[vv,vx,vi] decoding, translation and execution
> >    support
> >  target/riscv: expose zvkb cpu property
> >  target/riscv: add zvkns cpu property
> >  target/riscv: Add vaeskf1.vi decoding, translation and execution
> >    support
> >  target/riscv: Add vaeskf2.vi decoding, translation and execution
> >    support
> >  target/riscv: expose zvkns cpu property
> >  target/riscv: add zvknh cpu properties
> >  target/riscv: expose zvknh cpu properties
> >
> > William Salmon (3):
> >  target/riscv: Add vbrev8.v decoding, translation and execution support
> >  target/riscv: Add vaesem.vv decoding, translation and execution
> >    support
> >  target/riscv: Add vaesem.vs decoding, translation and execution
> >    support
> >
> > crypto/sm4.c                                 |   10 +
> > include/crypto/sm4.h                         |    8 +
> > include/qemu/bitops.h                        |   32 +
> > target/arm/crypto_helper.c                   |   10 +-
> > target/riscv/cpu.c                           |   15 +
> > target/riscv/cpu.h                           |    7 +
> > target/riscv/crypto_helper.c                 |    1 +
> > target/riscv/helper.h                        |   69 ++
> > target/riscv/insn32.decode                   |   48 +
> > target/riscv/insn_trans/trans_rvzvkb.c.inc   |  164 +++
> > target/riscv/insn_trans/trans_rvzvkg.c.inc   |    8 +
> > target/riscv/insn_trans/trans_rvzvknh.c.inc  |   47 +
> > target/riscv/insn_trans/trans_rvzvkns.c.inc  |  121 +++
> > target/riscv/insn_trans/trans_rvzvksed.c.inc |   38 +
> > target/riscv/insn_trans/trans_rvzvksh.c.inc  |   20 +
> > target/riscv/meson.build                     |    4 +-
> > target/riscv/translate.c                     |    6 +
> > target/riscv/vcrypto_helper.c                | 1013 ++++++++++++++++++
> > target/riscv/vector_helper.c                 |  242 +----
> > target/riscv/vector_internals.c              |   63 ++
> > target/riscv/vector_internals.h              |  226 ++++
> > 21 files changed, 1902 insertions(+), 250 deletions(-)
> > create mode 100644 target/riscv/insn_trans/trans_rvzvkb.c.inc
> > create mode 100644 target/riscv/insn_trans/trans_rvzvkg.c.inc
> > create mode 100644 target/riscv/insn_trans/trans_rvzvknh.c.inc
> > create mode 100644 target/riscv/insn_trans/trans_rvzvkns.c.inc
> > create mode 100644 target/riscv/insn_trans/trans_rvzvksed.c.inc
> > create mode 100644 target/riscv/insn_trans/trans_rvzvksh.c.inc
> > create mode 100644 target/riscv/vcrypto_helper.c
> > create mode 100644 target/riscv/vector_internals.c
> > create mode 100644 target/riscv/vector_internals.h
> >
> > --
> > 2.39.1
> >
> >
> >
>

--00000000000049800a05f327797f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Lawrence,</div><div dir=3D"auto"><br></div><div dir=3D"au=
to">we=E2=80=98ll review, as we=E2=80=98ve also been developing a similar s=
eries and have the know how readily available.=C2=A0 Seems like you beat us=
 to submitting it ;-)</div><div dir=3D"auto"><br></div><div dir=3D"auto">I=
=E2=80=99ll make sure reviews go up by next week.</div><div dir=3D"auto"><b=
r></div><div dir=3D"auto">Philipp.</div><div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Thu 26. Jan 2023 at 10:21, Lawren=
ce Hunter &lt;<a href=3D"mailto:lawrence.hunter@codethink.co.uk">lawrence.h=
unter@codethink.co.uk</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">Follow up for add RISC-V vector cryptography extensions standardisation<b=
r>
RFC: we&#39;ve not received any comments and would like to move this series=
<br>
towards getting merged. Does anyone have time to review it, and should<br>
we look at resubmitting for merging soon?<br>
<br>
---------- Forwarded Message ---------<br>
<br>
From: Lawrence Hunter &lt;<a href=3D"mailto:lawrence.hunter@codethink.co.uk=
" target=3D"_blank">lawrence.hunter@codethink.co.uk</a>&gt;<br>
Subject: [RFC PATCH 00/39] Add RISC-V cryptography extensions standardisati=
on<br>
Date: Jan 19 2023, at 2:34 pm<br>
To: <a href=3D"mailto:qemu-riscv@nongnu.org" target=3D"_blank">qemu-riscv@n=
ongnu.org</a><br>
Cc: <a href=3D"mailto:dickon.hood@codethink.co.uk" target=3D"_blank">dickon=
.hood@codethink.co.uk</a>, <a href=3D"mailto:frank.chang@sifive.com" target=
=3D"_blank">frank.chang@sifive.com</a>, Lawrence Hunter &lt;<a href=3D"mail=
to:lawrence.hunter@codethink.co.uk" target=3D"_blank">lawrence.hunter@codet=
hink.co.uk</a>&gt;<br>
<br>
<br>
&gt; This RFC introduces an implementation for the six instruction sets<br>
&gt; of the draft RISC-V cryptography extensions standardisation<br>
&gt; specification. Once the specification has been ratified we will submit=
<br>
&gt; these changes as a pull request email to this mailing list. Would this=
<br>
&gt; be prefered by instruction group or unified as in this RFC?<br>
&gt; <br>
&gt; This patch set implements the instruction sets as per the 20221202<br>
&gt; version of the specification (1).<br>
&gt; <br>
&gt; Work performed by Dickon, Lawrence, Nazar, Kiran, and William from Cod=
ethink<br>
&gt; sponsored by SiFive, and Max Chou from SiFive.<br>
&gt; <br>
&gt; 1. <a href=3D"https://github.com/riscv/riscv-crypto/releases" rel=3D"n=
oreferrer" target=3D"_blank">https://github.com/riscv/riscv-crypto/releases=
</a><br>
&gt; <br>
&gt; Dickon Hood (1):<br>
&gt;=C2=A0 target/riscv: Add vrol.[vv,vx] and vror.[vv,vx,vi] decoding,<br>
&gt;=C2=A0 =C2=A0 translation and execution support<br>
&gt; <br>
&gt; Kiran Ostrolenk (4):<br>
&gt;=C2=A0 target/riscv: Add vsha2ms.vv decoding, translation and execution=
<br>
&gt;=C2=A0 =C2=A0 support<br>
&gt;=C2=A0 target/riscv: add zvksh cpu property<br>
&gt;=C2=A0 target/riscv: Add <a href=3D"http://vsm3c.vi" rel=3D"noreferrer"=
 target=3D"_blank">vsm3c.vi</a> decoding, translation and execution support=
<br>
&gt;=C2=A0 target/riscv: expose zvksh cpu property<br>
&gt; <br>
&gt; Lawrence Hunter (16):<br>
&gt;=C2=A0 target/riscv: Add vclmul.vv decoding, translation and execution<=
br>
&gt;=C2=A0 =C2=A0 support<br>
&gt;=C2=A0 target/riscv: Add vclmul.vx decoding, translation and execution<=
br>
&gt;=C2=A0 =C2=A0 support<br>
&gt;=C2=A0 target/riscv: Add vclmulh.vv decoding, translation and execution=
<br>
&gt;=C2=A0 =C2=A0 support<br>
&gt;=C2=A0 target/riscv: Add vclmulh.vx decoding, translation and execution=
<br>
&gt;=C2=A0 =C2=A0 support<br>
&gt;=C2=A0 target/riscv: Add vaesef.vv decoding, translation and execution<=
br>
&gt;=C2=A0 =C2=A0 support<br>
&gt;=C2=A0 target/riscv: Add vaesef.vs decoding, translation and execution<=
br>
&gt;=C2=A0 =C2=A0 support<br>
&gt;=C2=A0 target/riscv: Add vaesdf.vv decoding, translation and execution<=
br>
&gt;=C2=A0 =C2=A0 support<br>
&gt;=C2=A0 target/riscv: Add vaesdf.vs decoding, translation and execution<=
br>
&gt;=C2=A0 =C2=A0 support<br>
&gt;=C2=A0 target/riscv: Add vaesdm.vv decoding, translation and execution<=
br>
&gt;=C2=A0 =C2=A0 support<br>
&gt;=C2=A0 target/riscv: Add vaesdm.vs decoding, translation and execution<=
br>
&gt;=C2=A0 =C2=A0 support<br>
&gt;=C2=A0 target/riscv: Add vaesz.vs decoding, translation and execution s=
upport<br>
&gt;=C2=A0 target/riscv: Add vsha2c[hl].vv decoding, translation and execut=
ion<br>
&gt;=C2=A0 =C2=A0 support<br>
&gt;=C2=A0 target/riscv: Add vsm3me.vv decoding, translation and execution<=
br>
&gt;=C2=A0 =C2=A0 support<br>
&gt;=C2=A0 target/riscv: add zvkg cpu property<br>
&gt;=C2=A0 target/riscv: Add vghmac.vv decoding, translation and execution<=
br>
&gt;=C2=A0 =C2=A0 support<br>
&gt;=C2=A0 target/riscv: expose zvkg cpu property<br>
&gt; <br>
&gt; Max Chou (5):<br>
&gt;=C2=A0 crypto: Move SM4_SBOXWORD from target/riscv<br>
&gt;=C2=A0 crypto: Add SM4 constant parameter CK.<br>
&gt;=C2=A0 target/riscv: Add zvksed cfg property<br>
&gt;=C2=A0 target/riscv: Add Zvksed support<br>
&gt;=C2=A0 target/riscv: Expose Zvksed property<br>
&gt; <br>
&gt; Nazar Kazakov (10):<br>
&gt;=C2=A0 target/riscv: add zvkb cpu property<br>
&gt;=C2=A0 target/riscv: Add vrev8.v decoding, translation and execution su=
pport<br>
&gt;=C2=A0 target/riscv: Add vandn.[vv,vx,vi] decoding, translation and exe=
cution<br>
&gt;=C2=A0 =C2=A0 support<br>
&gt;=C2=A0 target/riscv: expose zvkb cpu property<br>
&gt;=C2=A0 target/riscv: add zvkns cpu property<br>
&gt;=C2=A0 target/riscv: Add <a href=3D"http://vaeskf1.vi" rel=3D"noreferre=
r" target=3D"_blank">vaeskf1.vi</a> decoding, translation and execution<br>
&gt;=C2=A0 =C2=A0 support<br>
&gt;=C2=A0 target/riscv: Add <a href=3D"http://vaeskf2.vi" rel=3D"noreferre=
r" target=3D"_blank">vaeskf2.vi</a> decoding, translation and execution<br>
&gt;=C2=A0 =C2=A0 support<br>
&gt;=C2=A0 target/riscv: expose zvkns cpu property<br>
&gt;=C2=A0 target/riscv: add zvknh cpu properties<br>
&gt;=C2=A0 target/riscv: expose zvknh cpu properties<br>
&gt; <br>
&gt; William Salmon (3):<br>
&gt;=C2=A0 target/riscv: Add vbrev8.v decoding, translation and execution s=
upport<br>
&gt;=C2=A0 target/riscv: Add vaesem.vv decoding, translation and execution<=
br>
&gt;=C2=A0 =C2=A0 support<br>
&gt;=C2=A0 target/riscv: Add vaesem.vs decoding, translation and execution<=
br>
&gt;=C2=A0 =C2=A0 support<br>
&gt; <br>
&gt; crypto/sm4.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A010 +<br>
&gt; include/crypto/sm4.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 8 +<br>
&gt; include/qemu/bitops.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A032 +<br>
&gt; target/arm/crypto_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A010 +-<br>
&gt; target/riscv/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A015 +<br>
&gt; target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 7 +<br>
&gt; target/riscv/crypto_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 1 +<br>
&gt; target/riscv/helper.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A069 ++<br>
&gt; target/riscv/insn32.decode=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A048 +<br>
&gt; target/riscv/insn_trans/trans_rvzvkb.c.inc=C2=A0 =C2=A0|=C2=A0 164 +++=
<br>
&gt; target/riscv/insn_trans/trans_rvzvkg.c.inc=C2=A0 =C2=A0|=C2=A0 =C2=A0 =
8 +<br>
&gt; target/riscv/insn_trans/trans_rvzvknh.c.inc=C2=A0 |=C2=A0 =C2=A047 +<b=
r>
&gt; target/riscv/insn_trans/trans_rvzvkns.c.inc=C2=A0 |=C2=A0 121 +++<br>
&gt; target/riscv/insn_trans/trans_rvzvksed.c.inc |=C2=A0 =C2=A038 +<br>
&gt; target/riscv/insn_trans/trans_rvzvksh.c.inc=C2=A0 |=C2=A0 =C2=A020 +<b=
r>
&gt; target/riscv/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 4 +-<br>
&gt; target/riscv/translate.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 6 +<br>
&gt; target/riscv/vcrypto_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 | 1013 ++++++++++++++++++<br>
&gt; target/riscv/vector_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 242 +----<br>
&gt; target/riscv/vector_internals.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A063 ++<br>
&gt; target/riscv/vector_internals.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 226 ++++<br>
&gt; 21 files changed, 1902 insertions(+), 250 deletions(-)<br>
&gt; create mode 100644 target/riscv/insn_trans/trans_rvzvkb.c.inc<br>
&gt; create mode 100644 target/riscv/insn_trans/trans_rvzvkg.c.inc<br>
&gt; create mode 100644 target/riscv/insn_trans/trans_rvzvknh.c.inc<br>
&gt; create mode 100644 target/riscv/insn_trans/trans_rvzvkns.c.inc<br>
&gt; create mode 100644 target/riscv/insn_trans/trans_rvzvksed.c.inc<br>
&gt; create mode 100644 target/riscv/insn_trans/trans_rvzvksh.c.inc<br>
&gt; create mode 100644 target/riscv/vcrypto_helper.c<br>
&gt; create mode 100644 target/riscv/vector_internals.c<br>
&gt; create mode 100644 target/riscv/vector_internals.h<br>
&gt; <br>
&gt; -- <br>
&gt; 2.39.1<br>
&gt; <br>
&gt; <br>
&gt; <br>
</blockquote></div></div>

--00000000000049800a05f327797f--

