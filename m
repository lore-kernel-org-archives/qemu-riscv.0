Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A7EACE7AA8
	for <qemu-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 17:18:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qkpDq-0000V9-PB; Mon, 25 Sep 2023 13:18:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1qkpDo-0000Tu-8k; Mon, 25 Sep 2023 13:18:12 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1qkpDm-0003dK-9z; Mon, 25 Sep 2023 13:18:12 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-533c5d10dc7so4666931a12.3; 
 Mon, 25 Sep 2023 10:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695662287; x=1696267087; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=J7i4KFEZ3VCP5ao6donJP8NRNxv/HImiLAsDiEO+CNs=;
 b=ejyfV+J4lexhaOdsynJ1EAVU8xl0Xs/gAegWTcFye5z2LsFVJh498rPPVGDcNtVy0W
 iomGvz+ilhKKXyRtxRTEY6Gpw3rlGsqYaMfOoM1wncEiqXMHdHLh1bdM4Vf/1ySMOlXM
 F+OB57hthwbw2yom7TfuRIxG1MYkmY11x/lKJITw/DXl7JJUDY2TJ4ynBKUUIyzyiG1n
 8a220yk6YT7vKu/BoEsbgZydkeezMBpMqvkCk2CUgrQOGt7HVmc0WpWmyTmP8ZV8fU9T
 DHs1rMqPeb7GNyPPQxYWFsKTkgHY2nB4wJHhsbw0vKaNe/kA7eiSt+MdM3th9VLg4SyI
 2a8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695662287; x=1696267087;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J7i4KFEZ3VCP5ao6donJP8NRNxv/HImiLAsDiEO+CNs=;
 b=FuEpM9aPZe9lG5435Ie7CSk06+4afIAu0itizwrfK9V9e8sUoGM/oXXo44z9vFw9bJ
 EMKw2MrXq/65OszVh5t4Q6mDy4LD2q/qscsypzqOeRBiDCG01+YOxCAgS2YMsbMpa/x1
 0Cawf9f8m+/eNHL6RnTSGbbD4ekokwFtAE4aQm3/peo2CbpoDw2/VPiRYNZc/MlIR+bb
 MmI/r967mT5Gr3CQbk6eQ8qAdgZLQq4odpiKRcv2wslh3k0gwiMgKkd3kIRbbkkRTXtW
 TATh0b//1QrnfvbK+s+iCIuiLw4sL1WRv6oDXbHx8ylaCLMW9V4+9atEKFgSLzsZFiLO
 lNbQ==
X-Gm-Message-State: AOJu0YxTWL8JQqetQL9+u/CXLVQkEFapp0XgRAt4bTGbj7uh2OCz92Vp
 yjvuU6BC93faPFGfzHYkjD3JZ2qnuquq6OzmT18=
X-Google-Smtp-Source: AGHT+IHId3K4ZlyRzAJu2r7w01srVv7LxA32JQH7GqoUjVrYfGGNqXF3V8Fv4352u0A+BA+WTOGy9U10f/cQsC6uWqo=
X-Received: by 2002:a05:6402:b5b:b0:533:d1cd:62c5 with SMTP id
 bx27-20020a0564020b5b00b00533d1cd62c5mr4789176edb.17.1695662286812; Mon, 25
 Sep 2023 10:18:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230925144854.1872513-1-alex.bennee@linaro.org>
 <20230925144854.1872513-5-alex.bennee@linaro.org>
 <ZRG1g/2hWi8+AzNn@redhat.com> <878r8urxxc.fsf@linaro.org>
In-Reply-To: <878r8urxxc.fsf@linaro.org>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Mon, 25 Sep 2023 19:17:55 +0200
Message-ID: <CAJy5ezoucKM=VvYsHeFep7r0i1PV_JUCgq6gs4JJQVHqq3Yz3Q@mail.gmail.com>
Subject: Re: [PATCH 04/31] docs: mark CRIS support as deprecated
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 John Snow <jsnow@redhat.com>, libvir-list@redhat.com, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 qemu-s390x@nongnu.org, Song Gao <gaosong@loongson.cn>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Weiwei Li <liweiwei@iscas.ac.cn>, Nicholas Piggin <npiggin@gmail.com>, 
 Radoslaw Biernacki <rad@semihalf.com>, Eduardo Habkost <eduardo@habkost.net>,
 Cleber Rosa <crosa@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bin.meng@windriver.com>, 
 Alexandre Iooss <erdnaxe@crans.org>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 qemu-ppc@nongnu.org, 
 David Hildenbrand <david@redhat.com>, Yanan Wang <wangyanan55@huawei.com>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>, Ilya Leoshkevich <iii@linux.ibm.com>, 
 Laurent Vivier <lvivier@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, 
 Leif Lindholm <quic_llindhol@quicinc.com>, Beraldo Leal <bleal@redhat.com>, 
 Rabin Vincent <rabinv@axis.com>
Content-Type: multipart/alternative; boundary="00000000000043bf2a060632243a"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

--00000000000043bf2a060632243a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 25, 2023 at 7:00=E2=80=AFPM Alex Benn=C3=A9e <alex.bennee@linar=
o.org> wrote:

>
> Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
>
> > On Mon, Sep 25, 2023 at 03:48:27PM +0100, Alex Benn=C3=A9e wrote:
> >> This might be premature but while streamling the avocado tests I
> >> realised the only tests we have are "check-tcg" ones. The aging
> >> fedora-criss-cross image works well enough for developers but can't be
> >> used in CI as we need supported build platforms to build QEMU.
> >>
> >> Does this mean the writing is on the wall for this architecture?
> >>
> >> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> >> Cc: Rabin Vincent <rabinv@axis.com>
> >> Cc: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> >> ---
> >>  docs/about/deprecated.rst | 11 +++++++++++
> >>  1 file changed, 11 insertions(+)
> >>
> >> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> >> index dc4da95329..7cfe313aa6 100644
> >> --- a/docs/about/deprecated.rst
> >> +++ b/docs/about/deprecated.rst
> >> @@ -399,6 +399,17 @@ Specifying the iSCSI password in plain text on th=
e
> command line using the
> >>  used instead, to refer to a ``--object secret...`` instance that
> provides
> >>  a password via a file, or encrypted.
> >>
> >> +TCG CPUs
> >> +--------
> >> +
> >> +CRIS CPU architecture (since 8.1)
> >> +'''''''''''''''''''''''''''''''''
> >> +
> >> +The CRIS architecture was pulled from Linux in 4.17 and the compiler
> >> +is no longer packaged in any distro making it harder to run the
> >> +``check-tcg`` tests. Unless we can improve the testing situation ther=
e
> >> +is a chance the code will bitrot without anyone noticing.
> >
> > Deprecated is generally a warning that we intend to delete the
> > feature.   If we're just going to relegate it to untested
> > status (what I'd call "tier 3" quality), then we should document
> > that elsewhere.  I don't mind which way we go.
>
> We do have reasonably good coverage with tests/tcg/cris but of course
> without a compiler we can't build them.
>
> Both nios2 and microblaze have build-toolchain scripts which can be used
> to re-create containers. However my preference is having pre-built
> toolchains hosted by others like we do for loongarch, hexagon, xtensa
> and tricore. Then the docker image can simply curl them into an image.
>
>
Yeah, I guess it's time to deprecate it...

Cheers,
Edgar


> --
> Alex Benn=C3=A9e
> Virtualisation Tech Lead @ Linaro
>
>

--00000000000043bf2a060632243a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 25, 2023 at 7:00=E2=80=AFPM A=
lex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org">alex.bennee@l=
inaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><br>
Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com" target=
=3D"_blank">berrange@redhat.com</a>&gt; writes:<br>
<br>
&gt; On Mon, Sep 25, 2023 at 03:48:27PM +0100, Alex Benn=C3=A9e wrote:<br>
&gt;&gt; This might be premature but while streamling the avocado tests I<b=
r>
&gt;&gt; realised the only tests we have are &quot;check-tcg&quot; ones. Th=
e aging<br>
&gt;&gt; fedora-criss-cross image works well enough for developers but can&=
#39;t be<br>
&gt;&gt; used in CI as we need supported build platforms to build QEMU.<br>
&gt;&gt; <br>
&gt;&gt; Does this mean the writing is on the wall for this architecture?<b=
r>
&gt;&gt; <br>
&gt;&gt; Signed-off-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@=
linaro.org" target=3D"_blank">alex.bennee@linaro.org</a>&gt;<br>
&gt;&gt; Cc: Rabin Vincent &lt;<a href=3D"mailto:rabinv@axis.com" target=3D=
"_blank">rabinv@axis.com</a>&gt;<br>
&gt;&gt; Cc: Edgar E. Iglesias &lt;<a href=3D"mailto:edgar.iglesias@xilinx.=
com" target=3D"_blank">edgar.iglesias@xilinx.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 docs/about/deprecated.rst | 11 +++++++++++<br>
&gt;&gt;=C2=A0 1 file changed, 11 insertions(+)<br>
&gt;&gt; <br>
&gt;&gt; diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst=
<br>
&gt;&gt; index dc4da95329..7cfe313aa6 100644<br>
&gt;&gt; --- a/docs/about/deprecated.rst<br>
&gt;&gt; +++ b/docs/about/deprecated.rst<br>
&gt;&gt; @@ -399,6 +399,17 @@ Specifying the iSCSI password in plain text o=
n the command line using the<br>
&gt;&gt;=C2=A0 used instead, to refer to a ``--object secret...`` instance =
that provides<br>
&gt;&gt;=C2=A0 a password via a file, or encrypted.<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt; +TCG CPUs<br>
&gt;&gt; +--------<br>
&gt;&gt; +<br>
&gt;&gt; +CRIS CPU architecture (since 8.1)<br>
&gt;&gt; +&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;=
&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;=
&#39;&#39;&#39;&#39;&#39;<br>
&gt;&gt; +<br>
&gt;&gt; +The CRIS architecture was pulled from Linux in 4.17 and the compi=
ler<br>
&gt;&gt; +is no longer packaged in any distro making it harder to run the<b=
r>
&gt;&gt; +``check-tcg`` tests. Unless we can improve the testing situation =
there<br>
&gt;&gt; +is a chance the code will bitrot without anyone noticing.<br>
&gt;<br>
&gt; Deprecated is generally a warning that we intend to delete the<br>
&gt; feature.=C2=A0 =C2=A0If we&#39;re just going to relegate it to unteste=
d<br>
&gt; status (what I&#39;d call &quot;tier 3&quot; quality), then we should =
document<br>
&gt; that elsewhere.=C2=A0 I don&#39;t mind which way we go.<br>
<br>
We do have reasonably good coverage with tests/tcg/cris but of course<br>
without a compiler we can&#39;t build them.<br>
<br>
Both nios2 and microblaze have build-toolchain scripts which can be used<br=
>
to re-create containers. However my preference is having pre-built<br>
toolchains hosted by others like we do for loongarch, hexagon, xtensa<br>
and tricore. Then the docker image can simply curl them into an image.<br>
<br></blockquote><div><br></div><div>Yeah, I guess it&#39;s time to depreca=
te it...</div><div><br></div><div>Cheers,</div><div>Edgar</div><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
-- <br>
Alex Benn=C3=A9e<br>
Virtualisation Tech Lead @ Linaro<br>
<br>
</blockquote></div></div>

--00000000000043bf2a060632243a--

