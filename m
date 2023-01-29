Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pMFv9-0002UU-FQ
	for mharc-qemu-riscv@gnu.org; Sun, 29 Jan 2023 17:13:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1pMFv4-0002UD-EX
 for qemu-riscv@nongnu.org; Sun, 29 Jan 2023 17:13:03 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1pMFui-0003U9-39
 for qemu-riscv@nongnu.org; Sun, 29 Jan 2023 17:12:43 -0500
Received: by mail-ej1-x62c.google.com with SMTP id me3so27023998ejb.7
 for <qemu-riscv@nongnu.org>; Sun, 29 Jan 2023 14:12:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IY1ly92OaKf+JUH6IyrFxai1RJxkNTTaNS1/mQaG25g=;
 b=Wq/QqiXhdubz4Ax901DMXOQa3uM7vzAFP3bDLZ3l5NZdTeZzC5ZpVxx6EGeaThn6VA
 IoliGYGU8ffLmKi1N6JP2IozPuHBanL4qCvA3eoHVNKrCZknB6eBvgWGBGh5/OT5qzdY
 tepnGiNLNgJ0pArMTpHiOQOPa6OZF6nQDD3DnxICOELFD8j7dH9rzcy8nSki2AAjeCeC
 0uwkvHhwcXB/ZeFORqjaCkTX5+pxLqkUmsS+KaNU59R5C8bTeOg2VbE2bKwzcnaFfPBB
 K6g1A5IV1v3nHnx5UeqLoFD50wqDIV/2eASMl8W1dusZvpXibT8eG/6/bF1Up8j8Q5+C
 lMFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IY1ly92OaKf+JUH6IyrFxai1RJxkNTTaNS1/mQaG25g=;
 b=mV3b2wMjEg4Gf4hY8jBoDOljxOqUFRA+yTrSI5lVIzSFHWI63ijS4vINiwEIKd0+Xd
 V0Vfc72E5q0h4KwMnBBsj0aKO0XCPunjtYNHUMgfxbaKkWpJaVJteDUoC/oycx1UFnTB
 OpIrwHzJerI6A/vkXDy6Q1vSd9RDpKqdmzQwh0OrQN1w3G3wONZDRotZg7GkiUhI55GC
 9zU9rPI/Al9r1PM5BzX74MxCd041A+8dSR5nAgXXlgaiyF5EDkzYcZO5E8epxiW5lOkq
 oudrLqD0LboKbtJUJn4y9TZZ883nFhrEjcUPQWxfQ6rRf9qk5Mxo71rIjr20Db0quqoo
 pYUg==
X-Gm-Message-State: AO0yUKVdwT3Xcl+5J1hjCVeiJGjCN9my7DdjnHVFlVrc+uqFxQ8WTpl1
 Cs2DozjVyiHabJpt6SrG89kgdAlDevMIb8BJPvp7rQ==
X-Google-Smtp-Source: AK7set95KqiIxZb3MBE6rGJj9NJKeD/lz4Yr4TGEoX0jEkI4+r5vvZc4ZeWonYHXzG+CuaN0eS6epQpO5L3n05if8Yo=
X-Received: by 2002:a17:906:1106:b0:883:5f37:5aea with SMTP id
 h6-20020a170906110600b008835f375aeamr1186377eja.10.1675030356992; Sun, 29 Jan
 2023 14:12:36 -0800 (PST)
MIME-Version: 1.0
References: <20230119143528.1290950-1-lawrence.hunter@codethink.co.uk>
 <380600FF-17AC-4134-85C7-CBDF6E34F0E2@getmailspring.com>
 <ad8d999b4e972aa0ea4a276b3d4d8dc355c2d435.camel@wdc.com>
In-Reply-To: <ad8d999b4e972aa0ea4a276b3d4d8dc355c2d435.camel@wdc.com>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Sun, 29 Jan 2023 23:12:25 +0100
Message-ID: <CAAeLtUC5p=k4XiXoZxEA6qnLHpmjnuKT+6WUaskbt=uYB1XjrA@mail.gmail.com>
Subject: Re: Fwd: [RFC PATCH 00/39] Add RISC-V cryptography extensions
 standardisation
To: Alistair Francis <Alistair.Francis@wdc.com>
Cc: "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>, 
 "lawrence.hunter@codethink.co.uk" <lawrence.hunter@codethink.co.uk>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>, 
 "bin.meng@windriver.com" <bin.meng@windriver.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>, 
 "dickon.hood@codethink.co.uk" <dickon.hood@codethink.co.uk>, 
 "frank.chang@sifive.com" <frank.chang@sifive.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>
Content-Type: multipart/alternative; boundary="0000000000006abee005f36e6580"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-ej1-x62c.google.com
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
X-List-Received-Date: Sun, 29 Jan 2023 22:13:03 -0000

--0000000000006abee005f36e6580
Content-Type: text/plain; charset="UTF-8"

On Sun, 29 Jan 2023 at 23:08, Alistair Francis <Alistair.Francis@wdc.com>
wrote:

> On Thu, 2023-01-26 at 09:21 +0000, Lawrence Hunter wrote:
> > Follow up for add RISC-V vector cryptography extensions
> > standardisation
> > RFC: we've not received any comments and would like to move this
> > series
> > towards getting merged. Does anyone have time to review it, and
> > should
> > we look at resubmitting for merging soon?
>
> Hello,
>
> This series never made it to the QEMU list. It looks like it was never
> sent to the general qemu-devel mailing list.
>

This has so far been more than a little painful for our review, as we can't
just pull the patches down from patchwork to use our regular
test-and-review flow.
Should we wait until the resubmission for our review?

Note that the current series is not in-sync with the latest specification.
We'll try to point out the specific deviations (we have a tree that we've
been keeping in sync with the changes to the spec since mid-December) in
our reviews.

Cheers,
Philipp.


> When submitting patches can you please follow the steps here:
>
> https://www.qemu.org/docs/master/devel/submitting-a-patch.html#submitting-your-patches
>
> It's important that all patches are sent to the qemu-devel mailing list
> (that's actually much more important then the RISC-V mailing list).
>
> Alistair
>
> >
> > ---------- Forwarded Message ---------
> >
> > From: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
> > Subject: [RFC PATCH 00/39] Add RISC-V cryptography extensions
> > standardisation
> > Date: Jan 19 2023, at 2:34 pm
> > To: qemu-riscv@nongnu.org
> > Cc: dickon.hood@codethink.co.uk, frank.chang@sifive.com, Lawrence
> > Hunter <lawrence.hunter@codethink.co.uk>
> >
> >
> > > This RFC introduces an implementation for the six instruction sets
> > > of the draft RISC-V cryptography extensions standardisation
> > > specification. Once the specification has been ratified we will
> > > submit
> > > these changes as a pull request email to this mailing list. Would
> > > this
> > > be prefered by instruction group or unified as in this RFC?
> > >
> > > This patch set implements the instruction sets as per the 20221202
> > > version of the specification (1).
> > >
> > > Work performed by Dickon, Lawrence, Nazar, Kiran, and William from
> > > Codethink
> > > sponsored by SiFive, and Max Chou from SiFive.
> > >
> > > 1. https://github.com/riscv/riscv-crypto/releases
> > >
> > > Dickon Hood (1):
> > >  target/riscv: Add vrol.[vv,vx] and vror.[vv,vx,vi] decoding,
> > >    translation and execution support
> > >
> > > Kiran Ostrolenk (4):
> > >  target/riscv: Add vsha2ms.vv decoding, translation and execution
> > >    support
> > >  target/riscv: add zvksh cpu property
> > >  target/riscv: Add vsm3c.vi decoding, translation and execution
> > > support
> > >  target/riscv: expose zvksh cpu property
> > >
> > > Lawrence Hunter (16):
> > >  target/riscv: Add vclmul.vv decoding, translation and execution
> > >    support
> > >  target/riscv: Add vclmul.vx decoding, translation and execution
> > >    support
> > >  target/riscv: Add vclmulh.vv decoding, translation and execution
> > >    support
> > >  target/riscv: Add vclmulh.vx decoding, translation and execution
> > >    support
> > >  target/riscv: Add vaesef.vv decoding, translation and execution
> > >    support
> > >  target/riscv: Add vaesef.vs decoding, translation and execution
> > >    support
> > >  target/riscv: Add vaesdf.vv decoding, translation and execution
> > >    support
> > >  target/riscv: Add vaesdf.vs decoding, translation and execution
> > >    support
> > >  target/riscv: Add vaesdm.vv decoding, translation and execution
> > >    support
> > >  target/riscv: Add vaesdm.vs decoding, translation and execution
> > >    support
> > >  target/riscv: Add vaesz.vs decoding, translation and execution
> > > support
> > >  target/riscv: Add vsha2c[hl].vv decoding, translation and
> > > execution
> > >    support
> > >  target/riscv: Add vsm3me.vv decoding, translation and execution
> > >    support
> > >  target/riscv: add zvkg cpu property
> > >  target/riscv: Add vghmac.vv decoding, translation and execution
> > >    support
> > >  target/riscv: expose zvkg cpu property
> > >
> > > Max Chou (5):
> > >  crypto: Move SM4_SBOXWORD from target/riscv
> > >  crypto: Add SM4 constant parameter CK.
> > >  target/riscv: Add zvksed cfg property
> > >  target/riscv: Add Zvksed support
> > >  target/riscv: Expose Zvksed property
> > >
> > > Nazar Kazakov (10):
> > >  target/riscv: add zvkb cpu property
> > >  target/riscv: Add vrev8.v decoding, translation and execution
> > > support
> > >  target/riscv: Add vandn.[vv,vx,vi] decoding, translation and
> > > execution
> > >    support
> > >  target/riscv: expose zvkb cpu property
> > >  target/riscv: add zvkns cpu property
> > >  target/riscv: Add vaeskf1.vi decoding, translation and execution
> > >    support
> > >  target/riscv: Add vaeskf2.vi decoding, translation and execution
> > >    support
> > >  target/riscv: expose zvkns cpu property
> > >  target/riscv: add zvknh cpu properties
> > >  target/riscv: expose zvknh cpu properties
> > >
> > > William Salmon (3):
> > >  target/riscv: Add vbrev8.v decoding, translation and execution
> > > support
> > >  target/riscv: Add vaesem.vv decoding, translation and execution
> > >    support
> > >  target/riscv: Add vaesem.vs decoding, translation and execution
> > >    support
> > >
> > > crypto/sm4.c                                 |   10 +
> > > include/crypto/sm4.h                         |    8 +
> > > include/qemu/bitops.h                        |   32 +
> > > target/arm/crypto_helper.c                   |   10 +-
> > > target/riscv/cpu.c                           |   15 +
> > > target/riscv/cpu.h                           |    7 +
> > > target/riscv/crypto_helper.c                 |    1 +
> > > target/riscv/helper.h                        |   69 ++
> > > target/riscv/insn32.decode                   |   48 +
> > > target/riscv/insn_trans/trans_rvzvkb.c.inc   |  164 +++
> > > target/riscv/insn_trans/trans_rvzvkg.c.inc   |    8 +
> > > target/riscv/insn_trans/trans_rvzvknh.c.inc  |   47 +
> > > target/riscv/insn_trans/trans_rvzvkns.c.inc  |  121 +++
> > > target/riscv/insn_trans/trans_rvzvksed.c.inc |   38 +
> > > target/riscv/insn_trans/trans_rvzvksh.c.inc  |   20 +
> > > target/riscv/meson.build                     |    4 +-
> > > target/riscv/translate.c                     |    6 +
> > > target/riscv/vcrypto_helper.c                | 1013
> > > ++++++++++++++++++
> > > target/riscv/vector_helper.c                 |  242 +----
> > > target/riscv/vector_internals.c              |   63 ++
> > > target/riscv/vector_internals.h              |  226 ++++
> > > 21 files changed, 1902 insertions(+), 250 deletions(-)
> > > create mode 100644 target/riscv/insn_trans/trans_rvzvkb.c.inc
> > > create mode 100644 target/riscv/insn_trans/trans_rvzvkg.c.inc
> > > create mode 100644 target/riscv/insn_trans/trans_rvzvknh.c.inc
> > > create mode 100644 target/riscv/insn_trans/trans_rvzvkns.c.inc
> > > create mode 100644 target/riscv/insn_trans/trans_rvzvksed.c.inc
> > > create mode 100644 target/riscv/insn_trans/trans_rvzvksh.c.inc
> > > create mode 100644 target/riscv/vcrypto_helper.c
> > > create mode 100644 target/riscv/vector_internals.c
> > > create mode 100644 target/riscv/vector_internals.h
> > >
> > > --
> > > 2.39.1
> > >
> > >
> > >
>
>

--0000000000006abee005f36e6580
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, 29 Jan 2023 at 23:08, Alistai=
r Francis &lt;<a href=3D"mailto:Alistair.Francis@wdc.com">Alistair.Francis@=
wdc.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On Thu, 2023-01-26 at 09:21 +0000, Lawrence Hunter wrote:<br>
&gt; Follow up for add RISC-V vector cryptography extensions<br>
&gt; standardisation<br>
&gt; RFC: we&#39;ve not received any comments and would like to move this<b=
r>
&gt; series<br>
&gt; towards getting merged. Does anyone have time to review it, and<br>
&gt; should<br>
&gt; we look at resubmitting for merging soon?<br>
<br>
Hello,<br>
<br>
This series never made it to the QEMU list. It looks like it was never<br>
sent to the general qemu-devel mailing list.<br></blockquote><div><br></div=
><div>This has so far been more than a little painful for our review, as we=
 can&#39;t just pull the patches down from patchwork to use our regular tes=
t-and-review flow.</div><div>Should we wait until the resubmission for our =
review?</div><div><br></div><div>Note that the current series is not in-syn=
c with the latest specification.</div><div>We&#39;ll try to point out the s=
pecific deviations (we have a tree that we&#39;ve been keeping in sync with=
 the changes to the spec since mid-December) in our reviews.</div><div><br>=
</div><div>Cheers,</div><div>Philipp.</div><div>=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
When submitting patches can you please follow the steps here:<br>
<a href=3D"https://www.qemu.org/docs/master/devel/submitting-a-patch.html#s=
ubmitting-your-patches" rel=3D"noreferrer" target=3D"_blank">https://www.qe=
mu.org/docs/master/devel/submitting-a-patch.html#submitting-your-patches</a=
><br>
<br>
It&#39;s important that all patches are sent to the qemu-devel mailing list=
<br>
(that&#39;s actually much more important then the RISC-V mailing list).<br>
<br>
Alistair<br>
<br>
&gt; <br>
&gt; ---------- Forwarded Message ---------<br>
&gt; <br>
&gt; From: Lawrence Hunter &lt;<a href=3D"mailto:lawrence.hunter@codethink.=
co.uk" target=3D"_blank">lawrence.hunter@codethink.co.uk</a>&gt;<br>
&gt; Subject: [RFC PATCH 00/39] Add RISC-V cryptography extensions<br>
&gt; standardisation<br>
&gt; Date: Jan 19 2023, at 2:34 pm<br>
&gt; To: <a href=3D"mailto:qemu-riscv@nongnu.org" target=3D"_blank">qemu-ri=
scv@nongnu.org</a><br>
&gt; Cc: <a href=3D"mailto:dickon.hood@codethink.co.uk" target=3D"_blank">d=
ickon.hood@codethink.co.uk</a>, <a href=3D"mailto:frank.chang@sifive.com" t=
arget=3D"_blank">frank.chang@sifive.com</a>, Lawrence<br>
&gt; Hunter &lt;<a href=3D"mailto:lawrence.hunter@codethink.co.uk" target=
=3D"_blank">lawrence.hunter@codethink.co.uk</a>&gt;<br>
&gt; <br>
&gt; <br>
&gt; &gt; This RFC introduces an implementation for the six instruction set=
s<br>
&gt; &gt; of the draft RISC-V cryptography extensions standardisation<br>
&gt; &gt; specification. Once the specification has been ratified we will<b=
r>
&gt; &gt; submit<br>
&gt; &gt; these changes as a pull request email to this mailing list. Would=
<br>
&gt; &gt; this<br>
&gt; &gt; be prefered by instruction group or unified as in this RFC?<br>
&gt; &gt; <br>
&gt; &gt; This patch set implements the instruction sets as per the 2022120=
2<br>
&gt; &gt; version of the specification (1).<br>
&gt; &gt; <br>
&gt; &gt; Work performed by Dickon, Lawrence, Nazar, Kiran, and William fro=
m<br>
&gt; &gt; Codethink<br>
&gt; &gt; sponsored by SiFive, and Max Chou from SiFive.<br>
&gt; &gt; <br>
&gt; &gt; 1. <a href=3D"https://github.com/riscv/riscv-crypto/releases" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/riscv/riscv-crypto/rel=
eases</a><br>
&gt; &gt; <br>
&gt; &gt; Dickon Hood (1):<br>
&gt; &gt; =C2=A0target/riscv: Add vrol.[vv,vx] and vror.[vv,vx,vi] decoding=
,<br>
&gt; &gt; =C2=A0=C2=A0 translation and execution support<br>
&gt; &gt; <br>
&gt; &gt; Kiran Ostrolenk (4):<br>
&gt; &gt; =C2=A0target/riscv: Add vsha2ms.vv decoding, translation and exec=
ution<br>
&gt; &gt; =C2=A0=C2=A0 support<br>
&gt; &gt; =C2=A0target/riscv: add zvksh cpu property<br>
&gt; &gt; =C2=A0target/riscv: Add <a href=3D"http://vsm3c.vi" rel=3D"norefe=
rrer" target=3D"_blank">vsm3c.vi</a> decoding, translation and execution<br=
>
&gt; &gt; support<br>
&gt; &gt; =C2=A0target/riscv: expose zvksh cpu property<br>
&gt; &gt; <br>
&gt; &gt; Lawrence Hunter (16):<br>
&gt; &gt; =C2=A0target/riscv: Add vclmul.vv decoding, translation and execu=
tion<br>
&gt; &gt; =C2=A0=C2=A0 support<br>
&gt; &gt; =C2=A0target/riscv: Add vclmul.vx decoding, translation and execu=
tion<br>
&gt; &gt; =C2=A0=C2=A0 support<br>
&gt; &gt; =C2=A0target/riscv: Add vclmulh.vv decoding, translation and exec=
ution<br>
&gt; &gt; =C2=A0=C2=A0 support<br>
&gt; &gt; =C2=A0target/riscv: Add vclmulh.vx decoding, translation and exec=
ution<br>
&gt; &gt; =C2=A0=C2=A0 support<br>
&gt; &gt; =C2=A0target/riscv: Add vaesef.vv decoding, translation and execu=
tion<br>
&gt; &gt; =C2=A0=C2=A0 support<br>
&gt; &gt; =C2=A0target/riscv: Add vaesef.vs decoding, translation and execu=
tion<br>
&gt; &gt; =C2=A0=C2=A0 support<br>
&gt; &gt; =C2=A0target/riscv: Add vaesdf.vv decoding, translation and execu=
tion<br>
&gt; &gt; =C2=A0=C2=A0 support<br>
&gt; &gt; =C2=A0target/riscv: Add vaesdf.vs decoding, translation and execu=
tion<br>
&gt; &gt; =C2=A0=C2=A0 support<br>
&gt; &gt; =C2=A0target/riscv: Add vaesdm.vv decoding, translation and execu=
tion<br>
&gt; &gt; =C2=A0=C2=A0 support<br>
&gt; &gt; =C2=A0target/riscv: Add vaesdm.vs decoding, translation and execu=
tion<br>
&gt; &gt; =C2=A0=C2=A0 support<br>
&gt; &gt; =C2=A0target/riscv: Add vaesz.vs decoding, translation and execut=
ion<br>
&gt; &gt; support<br>
&gt; &gt; =C2=A0target/riscv: Add vsha2c[hl].vv decoding, translation and<b=
r>
&gt; &gt; execution<br>
&gt; &gt; =C2=A0=C2=A0 support<br>
&gt; &gt; =C2=A0target/riscv: Add vsm3me.vv decoding, translation and execu=
tion<br>
&gt; &gt; =C2=A0=C2=A0 support<br>
&gt; &gt; =C2=A0target/riscv: add zvkg cpu property<br>
&gt; &gt; =C2=A0target/riscv: Add vghmac.vv decoding, translation and execu=
tion<br>
&gt; &gt; =C2=A0=C2=A0 support<br>
&gt; &gt; =C2=A0target/riscv: expose zvkg cpu property<br>
&gt; &gt; <br>
&gt; &gt; Max Chou (5):<br>
&gt; &gt; =C2=A0crypto: Move SM4_SBOXWORD from target/riscv<br>
&gt; &gt; =C2=A0crypto: Add SM4 constant parameter CK.<br>
&gt; &gt; =C2=A0target/riscv: Add zvksed cfg property<br>
&gt; &gt; =C2=A0target/riscv: Add Zvksed support<br>
&gt; &gt; =C2=A0target/riscv: Expose Zvksed property<br>
&gt; &gt; <br>
&gt; &gt; Nazar Kazakov (10):<br>
&gt; &gt; =C2=A0target/riscv: add zvkb cpu property<br>
&gt; &gt; =C2=A0target/riscv: Add vrev8.v decoding, translation and executi=
on<br>
&gt; &gt; support<br>
&gt; &gt; =C2=A0target/riscv: Add vandn.[vv,vx,vi] decoding, translation an=
d<br>
&gt; &gt; execution<br>
&gt; &gt; =C2=A0=C2=A0 support<br>
&gt; &gt; =C2=A0target/riscv: expose zvkb cpu property<br>
&gt; &gt; =C2=A0target/riscv: add zvkns cpu property<br>
&gt; &gt; =C2=A0target/riscv: Add <a href=3D"http://vaeskf1.vi" rel=3D"nore=
ferrer" target=3D"_blank">vaeskf1.vi</a> decoding, translation and executio=
n<br>
&gt; &gt; =C2=A0=C2=A0 support<br>
&gt; &gt; =C2=A0target/riscv: Add <a href=3D"http://vaeskf2.vi" rel=3D"nore=
ferrer" target=3D"_blank">vaeskf2.vi</a> decoding, translation and executio=
n<br>
&gt; &gt; =C2=A0=C2=A0 support<br>
&gt; &gt; =C2=A0target/riscv: expose zvkns cpu property<br>
&gt; &gt; =C2=A0target/riscv: add zvknh cpu properties<br>
&gt; &gt; =C2=A0target/riscv: expose zvknh cpu properties<br>
&gt; &gt; <br>
&gt; &gt; William Salmon (3):<br>
&gt; &gt; =C2=A0target/riscv: Add vbrev8.v decoding, translation and execut=
ion<br>
&gt; &gt; support<br>
&gt; &gt; =C2=A0target/riscv: Add vaesem.vv decoding, translation and execu=
tion<br>
&gt; &gt; =C2=A0=C2=A0 support<br>
&gt; &gt; =C2=A0target/riscv: Add vaesem.vs decoding, translation and execu=
tion<br>
&gt; &gt; =C2=A0=C2=A0 support<br>
&gt; &gt; <br>
&gt; &gt; crypto/sm4.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0 10 +<br>
&gt; &gt; include/crypto/sm4.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 8 +<br>
&gt; &gt; include/qemu/bitops.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 32 +<br>
&gt; &gt; target/arm/crypto_helper.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 10 +-<br>
&gt; &gt; target/riscv/cpu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 15 +<br>
&gt; &gt; target/riscv/cpu.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 7 +<br>
&gt; &gt; target/riscv/crypto_helper.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=
=C2=A0 1 +<br>
&gt; &gt; target/riscv/helper.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 69 ++<br>
&gt; &gt; target/riscv/insn32.decode=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 48 +<br>
&gt; &gt; target/riscv/insn_trans/trans_rvzvkb.c.inc=C2=A0=C2=A0 |=C2=A0 16=
4 +++<br>
&gt; &gt; target/riscv/insn_trans/trans_rvzvkg.c.inc=C2=A0=C2=A0 |=C2=A0=C2=
=A0=C2=A0 8 +<br>
&gt; &gt; target/riscv/insn_trans/trans_rvzvknh.c.inc=C2=A0 |=C2=A0=C2=A0 4=
7 +<br>
&gt; &gt; target/riscv/insn_trans/trans_rvzvkns.c.inc=C2=A0 |=C2=A0 121 +++=
<br>
&gt; &gt; target/riscv/insn_trans/trans_rvzvksed.c.inc |=C2=A0=C2=A0 38 +<b=
r>
&gt; &gt; target/riscv/insn_trans/trans_rvzvksh.c.inc=C2=A0 |=C2=A0=C2=A0 2=
0 +<br>
&gt; &gt; target/riscv/meson.build=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0=C2=A0 4 +-<br>
&gt; &gt; target/riscv/translate.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0=C2=A0 6 +<br>
&gt; &gt; target/riscv/vcrypto_helper.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1013<br>
&gt; &gt; ++++++++++++++++++<br>
&gt; &gt; target/riscv/vector_helper.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 242 +-=
---<br>
&gt; &gt; target/riscv/vector_internals.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 63 ++<br>
&gt; &gt; target/riscv/vector_internals.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 226 ++++<br>
&gt; &gt; 21 files changed, 1902 insertions(+), 250 deletions(-)<br>
&gt; &gt; create mode 100644 target/riscv/insn_trans/trans_rvzvkb.c.inc<br>
&gt; &gt; create mode 100644 target/riscv/insn_trans/trans_rvzvkg.c.inc<br>
&gt; &gt; create mode 100644 target/riscv/insn_trans/trans_rvzvknh.c.inc<br=
>
&gt; &gt; create mode 100644 target/riscv/insn_trans/trans_rvzvkns.c.inc<br=
>
&gt; &gt; create mode 100644 target/riscv/insn_trans/trans_rvzvksed.c.inc<b=
r>
&gt; &gt; create mode 100644 target/riscv/insn_trans/trans_rvzvksh.c.inc<br=
>
&gt; &gt; create mode 100644 target/riscv/vcrypto_helper.c<br>
&gt; &gt; create mode 100644 target/riscv/vector_internals.c<br>
&gt; &gt; create mode 100644 target/riscv/vector_internals.h<br>
&gt; &gt; <br>
&gt; &gt; -- <br>
&gt; &gt; 2.39.1<br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; <br>
<br>
</blockquote></div></div>

--0000000000006abee005f36e6580--

