Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pIWiV-0001nP-Fv
	for mharc-qemu-riscv@gnu.org; Thu, 19 Jan 2023 10:20:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1pIWiO-0001hY-Rp
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 10:20:32 -0500
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1pIWiM-0000Fa-AN
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 10:20:32 -0500
Received: by mail-lf1-x133.google.com with SMTP id w11so32208lfu.11
 for <qemu-riscv@nongnu.org>; Thu, 19 Jan 2023 07:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4/O3l+sBJW08aJiEsrf0f1ZF2F6SvvSdtr+nMVIpF4Y=;
 b=eIXMOXyBL2ZxAEr4kf4TcUON9LWDqDKX0zUpRI2wJ3G8CTdcLxlCWalF4mKnzWq8EL
 7shKHU6bVUXywRQtDS47zCB5hzNTC+FXmI+CWUvK2EZ4kSiIUca1UHDdHaLh1x2SVZ1o
 APYOyuhHgeRewEKgfgoJHkdPp4sFSmCfOftdu+ORBiGtk14Js6ZmLP66mw5FHFzae65y
 SM9L9xbnBmK6S1lS4/4RZ0nQU+sYhvnostjHJNSrZjf0WUmW0yUqZmZNMMTb2TF1EoEL
 NvjEiD1OR4Amw8c8LusyEJRxp3zVZVwQyOilFXAPdORgbJfl3AoqC97eucWIcx9jei3a
 B1hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4/O3l+sBJW08aJiEsrf0f1ZF2F6SvvSdtr+nMVIpF4Y=;
 b=hG9qsambWK7diyTk3Ko8kmd9YUSpw35w/6rQEdM5ui+QbzCnxkIXkGuf2QFyL98pzM
 o3N6/KdPRU02ZUMahryUqGKugJFK1eCerTaWIdBFcLiTjonh3K/wFT7Mns4bMcOIPNoz
 +0qAb5Tr9rbu4KBc7MzMWjqD8swPHFGgONfR97gKB6LpOmdF8FgEh5XI9hsbDYYsx5ir
 m4nFjJmjeRVr7pH/KnZsrOD6Flv74tCXVA0rYK0kFEwtAX6jCOLxirHxv4+T/HW4IFkc
 ItgrzztBW/KpPVONsz6QguIZjcfQkn+H4ZxFm55SD/7F+9s5Gq4u6DF06FXRLagoefKS
 4I7g==
X-Gm-Message-State: AFqh2ko+WtVwJ+Uw6rzaZlct0EVhGguFMtbwLjL9g6LYSq12DPcipEPG
 29efevCprpHQMhZs4/Gy1bQYbpuwgS/wgAo1O1qsdL37DIbfQnG+5s9IUUKW5Rs64OYSiinrk4o
 9NchsDU+CQivPvSR2ilIMNM2liPEqwy9WIi5q1QSUtTMaOkqLyWPsyaoTvgXyvxX2opOJB8kW90
 4=
X-Google-Smtp-Source: AMrXdXuq9hd6dZuCLLfHWOJHGMisCrXhhOJe5uilUV9/AmY2Btt/6Pv6bs9fkrjtndk/GH+RTck/+g==
X-Received: by 2002:ac2:5299:0:b0:4b0:6023:6f6f with SMTP id
 q25-20020ac25299000000b004b060236f6fmr2952955lfm.57.1674141627733; 
 Thu, 19 Jan 2023 07:20:27 -0800 (PST)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com.
 [209.85.167.51]) by smtp.gmail.com with ESMTPSA id
 bp22-20020a056512159600b004cc800b1f2csm5144524lfb.238.2023.01.19.07.20.27
 for <qemu-riscv@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 07:20:27 -0800 (PST)
Received: by mail-lf1-f51.google.com with SMTP id y25so3685215lfa.9
 for <qemu-riscv@nongnu.org>; Thu, 19 Jan 2023 07:20:27 -0800 (PST)
X-Received: by 2002:ac2:46e3:0:b0:4b6:e80b:7e44 with SMTP id
 q3-20020ac246e3000000b004b6e80b7e44mr522698lfo.508.1674141626713; Thu, 19 Jan
 2023 07:20:26 -0800 (PST)
MIME-Version: 1.0
References: <20230119143528.1290950-1-lawrence.hunter@codethink.co.uk>
In-Reply-To: <20230119143528.1290950-1-lawrence.hunter@codethink.co.uk>
From: Frank Chang <frank.chang@sifive.com>
Date: Thu, 19 Jan 2023 23:20:15 +0800
X-Gmail-Original-Message-ID: <CANzO1D3c_aBYufoBQObJyVgGpiQs97XzHv3xyOWhEdO241NjfQ@mail.gmail.com>
Message-ID: <CANzO1D3c_aBYufoBQObJyVgGpiQs97XzHv3xyOWhEdO241NjfQ@mail.gmail.com>
Subject: Re: [RFC PATCH 00/39] Add RISC-V cryptography extensions
 standardisation
To: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
Cc: qemu-riscv@nongnu.org, dickon.hood@codethink.co.uk, frank.chang@sifive.com
Content-Type: multipart/alternative; boundary="000000000000f6cba305f29f782c"
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=frank.chang@sifive.com; helo=mail-lf1-x133.google.com
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
X-List-Received-Date: Thu, 19 Jan 2023 15:20:33 -0000

--000000000000f6cba305f29f782c
Content-Type: text/plain; charset="UTF-8"

Hi Lawrence,

The spec says that:

"With the exception of Zvknhb, each of these Vector Crypto Extensions can
be build on any base
Vector Extension, embedded (Zve*) or application ("V"). Zvknhb requires
ELEN=64 and therefore
cannot be implemented on a Zve32* base.
While the Zvkb extension can be built on an Zve32* base, the vclmul[h]
instructions will not be
supported in such a case as they require SEW=64."

So I guess we also need to add the checks for each Vector Crypto CPU
property in riscv_cpu_realize()
to check whether either "V" or "Zve*" extension is enabled or disabled,
based on the restrictions defined in the spec.

Regards,
Frank Chang


On Thu, Jan 19, 2023 at 10:39 PM Lawrence Hunter <
lawrence.hunter@codethink.co.uk> wrote:

> This RFC introduces an implementation for the six instruction sets
> of the draft RISC-V cryptography extensions standardisation
> specification. Once the specification has been ratified we will submit
> these changes as a pull request email to this mailing list. Would this
> be prefered by instruction group or unified as in this RFC?
>
> This patch set implements the instruction sets as per the 20221202
> version of the specification (1).
>
> Work performed by Dickon, Lawrence, Nazar, Kiran, and William from
> Codethink
> sponsored by SiFive, and Max Chou from SiFive.
>
> 1. https://github.com/riscv/riscv-crypto/releases
>
> Dickon Hood (1):
>   target/riscv: Add vrol.[vv,vx] and vror.[vv,vx,vi] decoding,
>     translation and execution support
>
> Kiran Ostrolenk (4):
>   target/riscv: Add vsha2ms.vv decoding, translation and execution
>     support
>   target/riscv: add zvksh cpu property
>   target/riscv: Add vsm3c.vi decoding, translation and execution support
>   target/riscv: expose zvksh cpu property
>
> Lawrence Hunter (16):
>   target/riscv: Add vclmul.vv decoding, translation and execution
>     support
>   target/riscv: Add vclmul.vx decoding, translation and execution
>     support
>   target/riscv: Add vclmulh.vv decoding, translation and execution
>     support
>   target/riscv: Add vclmulh.vx decoding, translation and execution
>     support
>   target/riscv: Add vaesef.vv decoding, translation and execution
>     support
>   target/riscv: Add vaesef.vs decoding, translation and execution
>     support
>   target/riscv: Add vaesdf.vv decoding, translation and execution
>     support
>   target/riscv: Add vaesdf.vs decoding, translation and execution
>     support
>   target/riscv: Add vaesdm.vv decoding, translation and execution
>     support
>   target/riscv: Add vaesdm.vs decoding, translation and execution
>     support
>   target/riscv: Add vaesz.vs decoding, translation and execution support
>   target/riscv: Add vsha2c[hl].vv decoding, translation and execution
>     support
>   target/riscv: Add vsm3me.vv decoding, translation and execution
>     support
>   target/riscv: add zvkg cpu property
>   target/riscv: Add vghmac.vv decoding, translation and execution
>     support
>   target/riscv: expose zvkg cpu property
>
> Max Chou (5):
>   crypto: Move SM4_SBOXWORD from target/riscv
>   crypto: Add SM4 constant parameter CK.
>   target/riscv: Add zvksed cfg property
>   target/riscv: Add Zvksed support
>   target/riscv: Expose Zvksed property
>
> Nazar Kazakov (10):
>   target/riscv: add zvkb cpu property
>   target/riscv: Add vrev8.v decoding, translation and execution support
>   target/riscv: Add vandn.[vv,vx,vi] decoding, translation and execution
>     support
>   target/riscv: expose zvkb cpu property
>   target/riscv: add zvkns cpu property
>   target/riscv: Add vaeskf1.vi decoding, translation and execution
>     support
>   target/riscv: Add vaeskf2.vi decoding, translation and execution
>     support
>   target/riscv: expose zvkns cpu property
>   target/riscv: add zvknh cpu properties
>   target/riscv: expose zvknh cpu properties
>
> William Salmon (3):
>   target/riscv: Add vbrev8.v decoding, translation and execution support
>   target/riscv: Add vaesem.vv decoding, translation and execution
>     support
>   target/riscv: Add vaesem.vs decoding, translation and execution
>     support
>
>  crypto/sm4.c                                 |   10 +
>  include/crypto/sm4.h                         |    8 +
>  include/qemu/bitops.h                        |   32 +
>  target/arm/crypto_helper.c                   |   10 +-
>  target/riscv/cpu.c                           |   15 +
>  target/riscv/cpu.h                           |    7 +
>  target/riscv/crypto_helper.c                 |    1 +
>  target/riscv/helper.h                        |   69 ++
>  target/riscv/insn32.decode                   |   48 +
>  target/riscv/insn_trans/trans_rvzvkb.c.inc   |  164 +++
>  target/riscv/insn_trans/trans_rvzvkg.c.inc   |    8 +
>  target/riscv/insn_trans/trans_rvzvknh.c.inc  |   47 +
>  target/riscv/insn_trans/trans_rvzvkns.c.inc  |  121 +++
>  target/riscv/insn_trans/trans_rvzvksed.c.inc |   38 +
>  target/riscv/insn_trans/trans_rvzvksh.c.inc  |   20 +
>  target/riscv/meson.build                     |    4 +-
>  target/riscv/translate.c                     |    6 +
>  target/riscv/vcrypto_helper.c                | 1013 ++++++++++++++++++
>  target/riscv/vector_helper.c                 |  242 +----
>  target/riscv/vector_internals.c              |   63 ++
>  target/riscv/vector_internals.h              |  226 ++++
>  21 files changed, 1902 insertions(+), 250 deletions(-)
>  create mode 100644 target/riscv/insn_trans/trans_rvzvkb.c.inc
>  create mode 100644 target/riscv/insn_trans/trans_rvzvkg.c.inc
>  create mode 100644 target/riscv/insn_trans/trans_rvzvknh.c.inc
>  create mode 100644 target/riscv/insn_trans/trans_rvzvkns.c.inc
>  create mode 100644 target/riscv/insn_trans/trans_rvzvksed.c.inc
>  create mode 100644 target/riscv/insn_trans/trans_rvzvksh.c.inc
>  create mode 100644 target/riscv/vcrypto_helper.c
>  create mode 100644 target/riscv/vector_internals.c
>  create mode 100644 target/riscv/vector_internals.h
>
> --
> 2.39.1
>
>
>

--000000000000f6cba305f29f782c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Lawrence,</div><div><br></div>The spec says that:<=
br><br><div>&quot;With the exception of Zvknhb, each of these Vector Crypto=
 Extensions can be build on any base</div>Vector Extension, embedded (Zve*)=
 or application (&quot;V&quot;). Zvknhb requires ELEN=3D64 and therefore<br=
>cannot be implemented on a Zve32* base.<br>While the Zvkb extension can be=
 built on an Zve32* base, the vclmul[h] instructions will not be<br>support=
ed in such a case as they require SEW=3D64.&quot;<div><br></div><div>So I g=
uess we also need to add the checks for each Vector Crypto CPU property in=
=C2=A0riscv_cpu_realize()</div><div>to check whether either &quot;V&quot; o=
r &quot;Zve*&quot; extension is enabled or disabled,</div><div>based on the=
 restrictions defined in the spec.</div><div><br></div><div>Regards,</div><=
div>Frank Chang</div><div><br></div></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 19, 2023 at 10:39 PM Lawren=
ce Hunter &lt;<a href=3D"mailto:lawrence.hunter@codethink.co.uk">lawrence.h=
unter@codethink.co.uk</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">This RFC introduces an implementation for the six inst=
ruction sets<br>
of the draft RISC-V cryptography extensions standardisation<br>
specification. Once the specification has been ratified we will submit<br>
these changes as a pull request email to this mailing list. Would this<br>
be prefered by instruction group or unified as in this RFC?<br>
<br>
This patch set implements the instruction sets as per the 20221202<br>
version of the specification (1).<br>
<br>
Work performed by Dickon, Lawrence, Nazar, Kiran, and William from Codethin=
k<br>
sponsored by SiFive, and Max Chou from SiFive.<br>
<br>
1. <a href=3D"https://github.com/riscv/riscv-crypto/releases" rel=3D"norefe=
rrer" target=3D"_blank">https://github.com/riscv/riscv-crypto/releases</a><=
br>
<br>
Dickon Hood (1):<br>
=C2=A0 target/riscv: Add vrol.[vv,vx] and vror.[vv,vx,vi] decoding,<br>
=C2=A0 =C2=A0 translation and execution support<br>
<br>
Kiran Ostrolenk (4):<br>
=C2=A0 target/riscv: Add vsha2ms.vv decoding, translation and execution<br>
=C2=A0 =C2=A0 support<br>
=C2=A0 target/riscv: add zvksh cpu property<br>
=C2=A0 target/riscv: Add <a href=3D"http://vsm3c.vi" rel=3D"noreferrer" tar=
get=3D"_blank">vsm3c.vi</a> decoding, translation and execution support<br>
=C2=A0 target/riscv: expose zvksh cpu property<br>
<br>
Lawrence Hunter (16):<br>
=C2=A0 target/riscv: Add vclmul.vv decoding, translation and execution<br>
=C2=A0 =C2=A0 support<br>
=C2=A0 target/riscv: Add vclmul.vx decoding, translation and execution<br>
=C2=A0 =C2=A0 support<br>
=C2=A0 target/riscv: Add vclmulh.vv decoding, translation and execution<br>
=C2=A0 =C2=A0 support<br>
=C2=A0 target/riscv: Add vclmulh.vx decoding, translation and execution<br>
=C2=A0 =C2=A0 support<br>
=C2=A0 target/riscv: Add vaesef.vv decoding, translation and execution<br>
=C2=A0 =C2=A0 support<br>
=C2=A0 target/riscv: Add vaesef.vs decoding, translation and execution<br>
=C2=A0 =C2=A0 support<br>
=C2=A0 target/riscv: Add vaesdf.vv decoding, translation and execution<br>
=C2=A0 =C2=A0 support<br>
=C2=A0 target/riscv: Add vaesdf.vs decoding, translation and execution<br>
=C2=A0 =C2=A0 support<br>
=C2=A0 target/riscv: Add vaesdm.vv decoding, translation and execution<br>
=C2=A0 =C2=A0 support<br>
=C2=A0 target/riscv: Add vaesdm.vs decoding, translation and execution<br>
=C2=A0 =C2=A0 support<br>
=C2=A0 target/riscv: Add vaesz.vs decoding, translation and execution suppo=
rt<br>
=C2=A0 target/riscv: Add vsha2c[hl].vv decoding, translation and execution<=
br>
=C2=A0 =C2=A0 support<br>
=C2=A0 target/riscv: Add vsm3me.vv decoding, translation and execution<br>
=C2=A0 =C2=A0 support<br>
=C2=A0 target/riscv: add zvkg cpu property<br>
=C2=A0 target/riscv: Add vghmac.vv decoding, translation and execution<br>
=C2=A0 =C2=A0 support<br>
=C2=A0 target/riscv: expose zvkg cpu property<br>
<br>
Max Chou (5):<br>
=C2=A0 crypto: Move SM4_SBOXWORD from target/riscv<br>
=C2=A0 crypto: Add SM4 constant parameter CK.<br>
=C2=A0 target/riscv: Add zvksed cfg property<br>
=C2=A0 target/riscv: Add Zvksed support<br>
=C2=A0 target/riscv: Expose Zvksed property<br>
<br>
Nazar Kazakov (10):<br>
=C2=A0 target/riscv: add zvkb cpu property<br>
=C2=A0 target/riscv: Add vrev8.v decoding, translation and execution suppor=
t<br>
=C2=A0 target/riscv: Add vandn.[vv,vx,vi] decoding, translation and executi=
on<br>
=C2=A0 =C2=A0 support<br>
=C2=A0 target/riscv: expose zvkb cpu property<br>
=C2=A0 target/riscv: add zvkns cpu property<br>
=C2=A0 target/riscv: Add <a href=3D"http://vaeskf1.vi" rel=3D"noreferrer" t=
arget=3D"_blank">vaeskf1.vi</a> decoding, translation and execution<br>
=C2=A0 =C2=A0 support<br>
=C2=A0 target/riscv: Add <a href=3D"http://vaeskf2.vi" rel=3D"noreferrer" t=
arget=3D"_blank">vaeskf2.vi</a> decoding, translation and execution<br>
=C2=A0 =C2=A0 support<br>
=C2=A0 target/riscv: expose zvkns cpu property<br>
=C2=A0 target/riscv: add zvknh cpu properties<br>
=C2=A0 target/riscv: expose zvknh cpu properties<br>
<br>
William Salmon (3):<br>
=C2=A0 target/riscv: Add vbrev8.v decoding, translation and execution suppo=
rt<br>
=C2=A0 target/riscv: Add vaesem.vv decoding, translation and execution<br>
=C2=A0 =C2=A0 support<br>
=C2=A0 target/riscv: Add vaesem.vs decoding, translation and execution<br>
=C2=A0 =C2=A0 support<br>
<br>
=C2=A0crypto/sm4.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A010 +<br>
=C2=A0include/crypto/sm4.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 8 +<br>
=C2=A0include/qemu/bitops.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A032 +<br>
=C2=A0target/arm/crypto_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A010 +-<br>
=C2=A0target/riscv/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A015 +<br>
=C2=A0target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 7 +<br>
=C2=A0target/riscv/crypto_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 1 +<br>
=C2=A0target/riscv/helper.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A069 ++<br>
=C2=A0target/riscv/insn32.decode=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A048 +<br>
=C2=A0target/riscv/insn_trans/trans_rvzvkb.c.inc=C2=A0 =C2=A0|=C2=A0 164 ++=
+<br>
=C2=A0target/riscv/insn_trans/trans_rvzvkg.c.inc=C2=A0 =C2=A0|=C2=A0 =C2=A0=
 8 +<br>
=C2=A0target/riscv/insn_trans/trans_rvzvknh.c.inc=C2=A0 |=C2=A0 =C2=A047 +<=
br>
=C2=A0target/riscv/insn_trans/trans_rvzvkns.c.inc=C2=A0 |=C2=A0 121 +++<br>
=C2=A0target/riscv/insn_trans/trans_rvzvksed.c.inc |=C2=A0 =C2=A038 +<br>
=C2=A0target/riscv/insn_trans/trans_rvzvksh.c.inc=C2=A0 |=C2=A0 =C2=A020 +<=
br>
=C2=A0target/riscv/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 4 +-<br>
=C2=A0target/riscv/translate.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 6 +<br>
=C2=A0target/riscv/vcrypto_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 1013 ++++++++++++++++++<br>
=C2=A0target/riscv/vector_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 242 +----<br>
=C2=A0target/riscv/vector_internals.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A063 ++<br>
=C2=A0target/riscv/vector_internals.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 226 ++++<br>
=C2=A021 files changed, 1902 insertions(+), 250 deletions(-)<br>
=C2=A0create mode 100644 target/riscv/insn_trans/trans_rvzvkb.c.inc<br>
=C2=A0create mode 100644 target/riscv/insn_trans/trans_rvzvkg.c.inc<br>
=C2=A0create mode 100644 target/riscv/insn_trans/trans_rvzvknh.c.inc<br>
=C2=A0create mode 100644 target/riscv/insn_trans/trans_rvzvkns.c.inc<br>
=C2=A0create mode 100644 target/riscv/insn_trans/trans_rvzvksed.c.inc<br>
=C2=A0create mode 100644 target/riscv/insn_trans/trans_rvzvksh.c.inc<br>
=C2=A0create mode 100644 target/riscv/vcrypto_helper.c<br>
=C2=A0create mode 100644 target/riscv/vector_internals.c<br>
=C2=A0create mode 100644 target/riscv/vector_internals.h<br>
<br>
-- <br>
2.39.1<br>
<br>
<br>
</blockquote></div>

--000000000000f6cba305f29f782c--

