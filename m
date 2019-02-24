Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gxop3-0004Ow-BW
	for mharc-qemu-riscv@gnu.org; Sun, 24 Feb 2019 03:07:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44080)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <amagdy.afifi@gmail.com>) id 1gxop1-0004Nd-6f
	for qemu-riscv@nongnu.org; Sun, 24 Feb 2019 03:07:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <amagdy.afifi@gmail.com>) id 1gxop0-0002CT-3N
	for qemu-riscv@nongnu.org; Sun, 24 Feb 2019 03:07:39 -0500
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842]:43958)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <amagdy.afifi@gmail.com>)
	id 1gxoox-0002BE-I1; Sun, 24 Feb 2019 03:07:35 -0500
Received: by mail-qt1-x842.google.com with SMTP id y4so7221164qtc.10;
	Sun, 24 Feb 2019 00:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=srFTdNiyGPKWfBDNPD+WDa/CScOk8LMx3LPF0RWBIs4=;
	b=inuBIV47XU98LDtiHVNoytiy2kDz2O7vnGMN2xHm7Ef6y6XKsEzWxD8HsL0CqMxesO
	PyPyx1DIuWF8eZe2Zlig8MteBl+XeKxTuVGvGnFmiOd80IC+DF6ss6DWHW5uudgflus8
	VFX+qiZjbNYXhUO12z77PUopb7f8MJKBG8tBBNJ7mQwERFsbU1ThgVVgq8b7kdnk9r4/
	3u7CGytWrT11QrBQ2aQdVFJldsa2eC20QPYKfWbOBU2FjC8XQRCrYIAebDSMbx2gOS3M
	ldz+4M5zM8Ab2zCZVhgv3MOaGI5ZfEk+U1vYngruKwdCdzUhwJZGuZ9gdyQAb9+aNVls
	mjuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=srFTdNiyGPKWfBDNPD+WDa/CScOk8LMx3LPF0RWBIs4=;
	b=RycRWgHWNvAlxyRFf3fY2ED4c1YHJ2uOfjCADSO4gGdCvB4qL6U/29zU/7qdOuWsBs
	iUBDTJA/0e/ophEzjAeDfVi6wy2QlVTEYueVq0hPz7sEIs4LcAS8gqDnBOfogYAjH2Ba
	Z/vpvwXIHnhjU8vHiwG0yztYwu1ZiPzkFXagZOZ6x8Dp/2jy1/qgQD7e+drIjUISbzoX
	0dG5n6iV1Q31mexNXxhVCBNTNcPdZTtAuLqYCUix6jGHfb0MH1XQORQrNkozI4Wac4r6
	g7xd/F35M+3ZgdV1x5tHjLWI3UwSC4crw0pySLfY1luF2t1HBM4637vGM236TUm6SOq6
	dBTQ==
X-Gm-Message-State: AHQUAuZuMWewCxspjZhUhvv9cr6i43BF+vCFUMomC7kXGYZTKyndTkhC
	YYOQ+7qFDJ0HjzxHeio8/58Or9wGcO6C88D54Fs=
X-Google-Smtp-Source: AHgI3IY3L1NwiJCVGZ7iHWqd6Mf4jFBBUK14V08hvwhEAzdSVGHEWuo8FMa/Z5S10gV1NW8vg6AwfBPHj9XhBbksR+M=
X-Received: by 2002:ac8:2827:: with SMTP id 36mr9419718qtq.359.1550995654759; 
	Sun, 24 Feb 2019 00:07:34 -0800 (PST)
MIME-Version: 1.0
References: <20190222162555.13764-1-amagdy.afifi@gmail.com>
	<20190222162555.13764-2-amagdy.afifi@gmail.com>
	<8f36a26e-7e20-1b9c-18bd-a5ce4b3d9c14@redhat.com>
In-Reply-To: <8f36a26e-7e20-1b9c-18bd-a5ce4b3d9c14@redhat.com>
From: Amed Magdy <amagdy.afifi@gmail.com>
Date: Sun, 24 Feb 2019 10:07:23 +0200
Message-ID: <CAKV=O7=JK4t7VxQ74LvjVpM9+TQ6MJ0hA9_XX40ud7OEsh30hQ@mail.gmail.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, sagark@eecs.berkeley.edu, 
	kbastian@mail.uni-paderborn.de, palmer@sifive.com, mjc@sifive.com, 
	Alistair.Francis@wdc.com
Content-Type: multipart/alternative; boundary="0000000000000cdf3605829f513a"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::842
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] riscv: Add proper alignment
 check and pending 'C' extension upon misa writes
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 24 Feb 2019 08:07:40 -0000

--0000000000000cdf3605829f513a
Content-Type: text/plain; charset="UTF-8"

Thank you so much, Eric.

Sorry about this unclear description.
I forgot to fix user name in git configuration before submitting the patch.

Sorry about any inconvenience.
Thanks,
Ahmed

On Sat, 23 Feb 2019 at 23:46, Eric Blake <eblake@redhat.com> wrote:

> On 2/22/19 10:25 AM, amagdy.afifi@gmail.com wrote:
> > From: ahmed_magdy <amagdy.afifi@gmail.com>
> >
> > Signed-off-by: ahmed_magdy <amagdy.afifi@gmail.com>
>
> This appears to be your first contribution to qemu. Welcome to the
> community!
>
> Typically, a Signed-off-by designation should be a proper name (what you
> would sign a legal document with, as it has a legal significance on your
> right to contribute the code).  Using all lowercase and _ instead of
> space looks like a username, and while I am not one to tell you it can't
> be a legal name, it is unusual enough to at least raise my suspicions.
>
> Furthermore, your commit message doesn't give any details beyond the
> "what" in the subject line. The body of the commit message should
> explain the "why" (what bug are you fixing, how to reproduce it), so
> that a reviewer stands a chance of determining if the code matches the
> description you gave, and if the issue you describe really does warrant
> the inclusion of your patch.  You gave a brief "why" in your cover letter:
>
> "I'm submiting this patch to properly check the next instruction
> alignment and scheduale compression extenstion enable upon 'MISA'
> register writes to later aligned instruction through exporting next
> instruction 'pc' to riscv cpu state"
>
> where it would be wise to include an improved version of that text with
> this commit proper (since the cover letter does not get applied to git).
>  For that matter, when sending a single patch, a cover letter is
> optional (it is only mandatory when sending a multi-patch series).
>
> For more patch submission hints, see:
> https://wiki.qemu.org/Contribute/SubmitAPatch
>
> --
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.           +1-919-301-3226
> Virtualization:  qemu.org | libvirt.org
>

--0000000000000cdf3605829f513a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank you so much, Eric.<div><br></div><div>Sorry about th=
is unclear description. <br>I forgot to fix user name in git configuration =
before submitting the patch.</div><div><br></div><div>Sorry about any incon=
venience.</div><div>Thanks,</div><div>Ahmed=C2=A0</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, 23 Feb 2019 =
at 23:46, Eric Blake &lt;<a href=3D"mailto:eblake@redhat.com" target=3D"_bl=
ank">eblake@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">On 2/22/19 10:25 AM, <a href=3D"mailto:amagdy.afifi@g=
mail.com" target=3D"_blank">amagdy.afifi@gmail.com</a> wrote:<br>
&gt; From: ahmed_magdy &lt;<a href=3D"mailto:amagdy.afifi@gmail.com" target=
=3D"_blank">amagdy.afifi@gmail.com</a>&gt;<br>
&gt; <br>
&gt; Signed-off-by: ahmed_magdy &lt;<a href=3D"mailto:amagdy.afifi@gmail.co=
m" target=3D"_blank">amagdy.afifi@gmail.com</a>&gt;<br>
<br>
This appears to be your first contribution to qemu. Welcome to the<br>
community!<br>
<br>
Typically, a Signed-off-by designation should be a proper name (what you<br=
>
would sign a legal document with, as it has a legal significance on your<br=
>
right to contribute the code).=C2=A0 Using all lowercase and _ instead of<b=
r>
space looks like a username, and while I am not one to tell you it can&#39;=
t<br>
be a legal name, it is unusual enough to at least raise my suspicions.<br>
<br>
Furthermore, your commit message doesn&#39;t give any details beyond the<br=
>
&quot;what&quot; in the subject line. The body of the commit message should=
<br>
explain the &quot;why&quot; (what bug are you fixing, how to reproduce it),=
 so<br>
that a reviewer stands a chance of determining if the code matches the<br>
description you gave, and if the issue you describe really does warrant<br>
the inclusion of your patch.=C2=A0 You gave a brief &quot;why&quot; in your=
 cover letter:<br>
<br>
&quot;I&#39;m submiting this patch to properly check the next instruction<b=
r>
alignment and scheduale compression extenstion enable upon &#39;MISA&#39;<b=
r>
register writes to later aligned instruction through exporting next<br>
instruction &#39;pc&#39; to riscv cpu state&quot;<br>
<br>
where it would be wise to include an improved version of that text with<br>
this commit proper (since the cover letter does not get applied to git).<br=
>
=C2=A0For that matter, when sending a single patch, a cover letter is<br>
optional (it is only mandatory when sending a multi-patch series).<br>
<br>
For more patch submission hints, see:<br>
<a href=3D"https://wiki.qemu.org/Contribute/SubmitAPatch" rel=3D"noreferrer=
" target=3D"_blank">https://wiki.qemu.org/Contribute/SubmitAPatch</a><br>
<br>
-- <br>
Eric Blake, Principal Software Engineer<br>
Red Hat, Inc.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+1-919-301-3226<br>
Virtualization:=C2=A0 <a href=3D"http://qemu.org" rel=3D"noreferrer" target=
=3D"_blank">qemu.org</a> | <a href=3D"http://libvirt.org" rel=3D"noreferrer=
" target=3D"_blank">libvirt.org</a><br>
</blockquote></div>

--0000000000000cdf3605829f513a--

