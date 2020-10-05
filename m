Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kPKIX-0003Rv-8p
	for mharc-qemu-riscv@gnu.org; Mon, 05 Oct 2020 02:48:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1kPKIW-0003RW-2S
 for qemu-riscv@nongnu.org; Mon, 05 Oct 2020 02:48:36 -0400
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130]:35502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1kPKIT-0003jR-WC
 for qemu-riscv@nongnu.org; Mon, 05 Oct 2020 02:48:35 -0400
Received: by mail-lf1-x130.google.com with SMTP id w11so9523643lfn.2
 for <qemu-riscv@nongnu.org>; Sun, 04 Oct 2020 23:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JXx4lQIaQN1zToyMqEYn4G74G8IoPb6iINn/8TE0qwI=;
 b=bq3RbbvzmkSSbeKL2+W1oT429pLRXLWvVvXzNMgOBTva8lv96c/dr4vElbLEHm3+V2
 EJ6BWaQ/6T6moL3iyfA4iCH/nladVLtxXTuSpXwZgku47v7qnoxG3jxywSoeEQ7tJME4
 AnotInZ3EWWyWnQZ3W+P/X4LIvsf0jf0GYQJl5toVdt5Y2aEHgczJXX2vEWYRJuKAsIq
 dbPi5lKrwICh/253ZYKIm9Ss6ACbKAZw8CnzlanVLch28VJZMWhoBdqLNmAOkVAGs5mY
 8pEGOZQUBwuyASaBW+QirjwBULAkgXFq1rsSFSbEaRqdtowwfkxTC9MsnN8jCmf5lVPS
 EcvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JXx4lQIaQN1zToyMqEYn4G74G8IoPb6iINn/8TE0qwI=;
 b=eHtdbsSJLKmNGccoJZgVVaXQg2k5JIyFjsZUnUzSwBB3dVqSC8oOFuvPmMyvi8cKpv
 7stqPQe/544f8nIyZfM0k5Z7s6vF6xfF50MeyxZ33WgewV/Up9JBTlkiDYoj5rfeZBDx
 JJnUNHVEluYviS6/BYB65aNTvnxX4i/P464LAWQj1MW7NOkN2t7hxM8NS3yOZEk0rNlj
 AHXFsZNDRX3j4qkz/UeT1sOMPwj0w+7dR0Xb8mrq6OYXVENlT+gpUKx5kdw8iltqE7nY
 I2hICO4XOmcbhuiRVwurSQWLoiyq6vCjgSY2r9UFcOWhK7I95eQBZbzTJWTgBF9V34TT
 KVKA==
X-Gm-Message-State: AOAM530RvmPC1CRuEzC4L+LpU8l+sDwE7qQrgU7KazsM6VywgtEh5iyi
 SzsPgwxtPUd6aJImmP6NaCcclt5NOJGJ80RkAhE=
X-Google-Smtp-Source: ABdhPJx6Wb0ZprZjzEt+J9I6KxIXapMEslh4Vu3/GMiR6jv2dKrEEhKq5o0id7fGpGIGr34TL5WgjBNQO72RjOtters=
X-Received: by 2002:a19:cb52:: with SMTP id b79mr1469183lfg.34.1601880511924; 
 Sun, 04 Oct 2020 23:48:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAFukJ-Cra_MELxo6Xr=g2S90UvpNg=m6XLjNWQs1hF4iK3mmYA@mail.gmail.com>
 <a4b32e0e-04d5-58fa-3afc-b429b2b3f3dd@linaro.org>
In-Reply-To: <a4b32e0e-04d5-58fa-3afc-b429b2b3f3dd@linaro.org>
From: Alexey Baturo <baturo.alexey@gmail.com>
Date: Mon, 5 Oct 2020 09:48:21 +0300
Message-ID: <CAFukJ-ALCqCon3=EhDec2SX_sGVCeLSMz6+fgYheC-v4V6Jt=Q@mail.gmail.com>
Subject: Re: Pointer Masking prototype for RISC-V QEMU
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-riscv@nongnu.org, Dave Smith <kupokupokupopo@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000e2cc0a05b0e6de78"
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=baturo.alexey@gmail.com; helo=mail-lf1-x130.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 05 Oct 2020 06:48:36 -0000

--000000000000e2cc0a05b0e6de78
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Richard, thank you for the reply!

>See https://wiki.qemu.org/Contribute/SubmitAPatch
>Experimental features (i.e. non-ratified isa extensions) are acceptable,
but they need to be off by default
So, if I got you right, I could put my changes under an experimental
extension knob and submit a patch into the mailing list, and it could be
accepted, while the extension itself is under development?

>But for acceptance of experimental features, a small "smoke test" is
sufficient.
Thanks, I do have such kind of simple tests to ensure the feature works.

Thanks

=D0=BF=D0=BD, 5 =D0=BE=D0=BA=D1=82. 2020 =D0=B3. =D0=B2 06:52, Richard Hend=
erson <richard.henderson@linaro.org
>:

> On 10/4/20 12:50 PM, Alexey Baturo wrote:
> > Hi folks,
> >
> > I've implemented support for RISC-V Pointer Masking proposal developed
> by J-ext
> > workgroup. The initial prototype was for QEMU 4.1 and later I moved it
> to the
> > current vesrsion(5.1).
> > Could you please help me to clarify some things:
> > - I'd like to commit this functionality to the QEMU(mainline or separat=
e
> > branch), do you think it's possible at this stage?
> > - Could you please describe the proper process of commiting such new
> > functionality to QEMU?
>
> See https://wiki.qemu.org/Contribute/SubmitAPatch
>
> > - What are the requirements for test coverage of this new functionality
> and
> > what test infra should be used to measure it?
>
> It can be tricky for these kind, because often "proper" use of the
> functionality is quite a lot of code going into another project, e.g. asa=
n.
>
> But for acceptance of experimental features, a small "smoke test" is
> sufficient.  Leastwise, that's all I've written for ARMv8.5-MTE. ;-)
>
> > - If this functionality is deemed to be acceptable for QEMU, how does t=
he
> > review process looks like?
>
> Well, hopefully the risc-v maintainers will have a look.  I will often
> look at
> stuff based on TCG maintainership.
>
> > - Also it's possible to implement Memory Tagging extension similarly as
> ARMv8.5
> > has: it would reuse a lot of part from Pointer Masking. I've done initi=
al
> > prototype of such extension, does it make sence to try to push such
> experimetal
> > features to qemu? If yes, what are the prerequisites?
>
> Experimental features (i.e. non-ratified isa extensions) are acceptable,
> but
> they need to be off by default, and enabled by a cpu property that begins
> with
> "x-", so that it's clear to users that it's experimental.  So, currently,
> the
> vector extension is enabled via "-cpu max,x-v=3Don".
>
>
> r~
>

--000000000000e2cc0a05b0e6de78
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Richard, thank you for the reply!<br><br>&gt;See <a href=
=3D"https://wiki.qemu.org/Contribute/SubmitAPatch">https://wiki.qemu.org/Co=
ntribute/SubmitAPatch</a><br>&gt;Experimental features (i.e. non-ratified i=
sa extensions) are acceptable, but they need to be off by default<br>So, if=
 I got you right, I could put my changes under an experimental extension kn=
ob and submit a patch into the mailing list, and it could be accepted, whil=
e the extension itself is under development?<br><br>&gt;But for acceptance =
of experimental features, a small &quot;smoke test&quot; is sufficient.<br>=
Thanks, I do have such kind of simple tests to ensure the feature works.<br=
><br>Thanks<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">=D0=BF=D0=BD, 5 =D0=BE=D0=BA=D1=82. 2020 =D0=B3. =D0=B2 06:=
52, Richard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">r=
ichard.henderson@linaro.org</a>&gt;:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">On 10/4/20 12:50 PM, Alexey Baturo wrote:<br>
&gt; Hi folks,<br>
&gt; <br>
&gt; I&#39;ve implemented support for RISC-V Pointer Masking proposal devel=
oped by J-ext<br>
&gt; workgroup. The initial prototype was for QEMU 4.1 and later I moved it=
 to the<br>
&gt; current vesrsion(5.1).<br>
&gt; Could you please help me to clarify some things:<br>
&gt; - I&#39;d like to commit this functionality to the QEMU(mainline or se=
parate<br>
&gt; branch), do you think it&#39;s possible at this stage?<br>
&gt; - Could you please describe the proper process of commiting such new<b=
r>
&gt; functionality to QEMU?<br>
<br>
See <a href=3D"https://wiki.qemu.org/Contribute/SubmitAPatch" rel=3D"norefe=
rrer" target=3D"_blank">https://wiki.qemu.org/Contribute/SubmitAPatch</a><b=
r>
<br>
&gt; - What are the requirements for test coverage of this new functionalit=
y and<br>
&gt; what test infra should be used to measure it?<br>
<br>
It can be tricky for these kind, because often &quot;proper&quot; use of th=
e<br>
functionality is quite a lot of code going into another project, e.g. asan.=
<br>
<br>
But for acceptance of experimental features, a small &quot;smoke test&quot;=
 is<br>
sufficient.=C2=A0 Leastwise, that&#39;s all I&#39;ve written for ARMv8.5-MT=
E. ;-)<br>
<br>
&gt; - If this functionality is deemed to be acceptable for QEMU, how does =
the<br>
&gt; review process looks like?<br>
<br>
Well, hopefully the risc-v maintainers will have a look.=C2=A0 I will often=
 look at<br>
stuff based on TCG maintainership.<br>
<br>
&gt; - Also it&#39;s possible to implement Memory Tagging extension similar=
ly as ARMv8.5<br>
&gt; has: it would reuse a lot of part from Pointer Masking. I&#39;ve done =
initial<br>
&gt; prototype of such extension, does it make sence to try to push such ex=
perimetal<br>
&gt; features to qemu? If yes, what are the prerequisites?<br>
<br>
Experimental features (i.e. non-ratified isa extensions) are acceptable, bu=
t<br>
they need to be off by default, and enabled by a cpu property that begins w=
ith<br>
&quot;x-&quot;, so that it&#39;s clear to users that it&#39;s experimental.=
=C2=A0 So, currently, the<br>
vector extension is enabled via &quot;-cpu max,x-v=3Don&quot;.<br>
<br>
<br>
r~<br>
</blockquote></div>

--000000000000e2cc0a05b0e6de78--

