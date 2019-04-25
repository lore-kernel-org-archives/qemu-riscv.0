Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hJYJk-0000pQ-Ab
	for mharc-qemu-riscv@gnu.org; Thu, 25 Apr 2019 02:57:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47376)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.m.mail@gmail.com>) id 1hJX3j-00047w-AJ
	for qemu-riscv@nongnu.org; Thu, 25 Apr 2019 01:36:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aleksandar.m.mail@gmail.com>) id 1hJWzF-0006N9-GX
	for qemu-riscv@nongnu.org; Thu, 25 Apr 2019 01:31:58 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:46409)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
	id 1hJWzE-0006Gy-7E; Thu, 25 Apr 2019 01:31:56 -0400
Received: by mail-ot1-x341.google.com with SMTP id s24so18323709otk.13;
	Wed, 24 Apr 2019 22:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4uyZD2f61WGWLfj/eczIBZtflr9JP7bJKe1rH3EAaJ0=;
	b=fz4Lxc1lfE48CZLo0/6/dzA/FnRyaiS0ZP3+EUlxyBxZFmq0lOjAJ8wzFWdSeaKQrF
	5SMquxN6/H2vVLIWdaP5rOh4ORzz+ljPGFSBrDISlthWlCGVnKW7VvBN62lOOBdwBwXI
	yqkohfGUHqq0Stc/x6eB/R2rdiL4Q4PKJ2jUoLnHpllALq9oMCF2ADMsmoltVYhNPQZU
	seOeCndW+eO//Bhv37gRi9H0PySA90p8+GrnS28VvrMNtEhzW6sjk490EFqMk3uCt2eO
	vpJRV68xTxAgjx0z7ZKRLKh8yA0JbTXETGc9Yu2LiuxwwdONWAPs6tVfXZBS3GjaZHob
	mGKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4uyZD2f61WGWLfj/eczIBZtflr9JP7bJKe1rH3EAaJ0=;
	b=La4KQ//8jZfxTk4rDxY0HgQs7mN9g3Hy3HICD5BfSYY5zqUVPBHd2o+755yxgHsWbp
	uY/FySdOzvgUoOjCK5zB6zWtsJRudRTzCbp7f85R0ApD6mgwpY/0Wouzi5/nUNHkmFCv
	+mxsPOkWvDZ18PjS87brheeszR+u9PFHHRqNfXE943Dsbi05ppLKKxW7AYwI1GQWninM
	uFt1mX5NbYC58MdZ9GLCipjQW3Mt6oiuYhcW92hlllW8HTj2r/lIPVauLKxPgEVy+O3c
	drEM3viohEXelXl5csUAGK4iehjW3SSmps9GG6U8bChWqH4cbr+foAnbQAlsFut0vNC4
	3dJg==
X-Gm-Message-State: APjAAAVuHPD575AypeW+OdC66Ob0NMKYF6lZxbBSrzW1AoVRoQdhiSG2
	Ouvk+XIKAjP10bZYYMl2WJrhJj7HiRO29v7XZpo=
X-Google-Smtp-Source: APXvYqy2WgXUnsw+iLHnt+USkfsMLQTOWEhCAgf4Uvc8T7T8TMBbDedO99JIdDhe6VoBRxEtjTyzxwI3nrGJ3iOHo+0=
X-Received: by 2002:a9d:3ba1:: with SMTP id k30mr23665997otc.171.1556170310624;
	Wed, 24 Apr 2019 22:31:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6830:2004:0:0:0:0 with HTTP; Wed, 24 Apr 2019 22:31:49
	-0700 (PDT)
Received: by 2002:a05:6830:2004:0:0:0:0 with HTTP; Wed, 24 Apr 2019 22:31:49
	-0700 (PDT)
In-Reply-To: <73a7ce8a-1d73-95f7-84a6-f0960a397c22@linaro.org>
References: <mhng-4fc40e41-5464-469e-9334-1edc4f8294e3@palmer-si-x1e>
	<73a7ce8a-1d73-95f7-84a6-f0960a397c22@linaro.org>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Thu, 25 Apr 2019 07:31:49 +0200
Message-ID: <CAL1e-=gTwNJ94-ZdhPZR_THAi_TfiToox0KrxLZnhARbjUKLxw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Alistair Francis <Alistair.Francis@wdc.com>, qemu-riscv@nongnu.org, 
	Palmer Dabbelt <palmer@sifive.com>
Content-Type: multipart/alternative; boundary="000000000000932c270587542205"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
X-Mailman-Approved-At: Thu, 25 Apr 2019 02:57:11 -0400
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH for-4.1 1/8] target/riscv:
 Name the argument sets for all of insn32 formats
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
X-List-Received-Date: Thu, 25 Apr 2019 05:36:36 -0000

--000000000000932c270587542205
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Apr 25, 2019 7:17 AM, "Richard Henderson" <richard.henderson@linaro.org>
wrote:
>
> On 4/24/19 8:31 PM, Palmer Dabbelt wrote:
> >>  # Argument sets:
> >> +&empty
> >
> > If I understand decodetree correctly, this isn't used until patch 5.
> > Otherwise,
> >
>
> I think it's used as early as patch 3, but I haven't looked in detail to
be sure.
>
>
> r~
>

I think it is a very bad practice to leave the commit message empty, and,
in my view, the long-time contributor, like you, Richard, have the
obligation to always give examples of commit messages of good quality.
Leaving empty commit messages should not be a =E2=80=9Dprivelage=E2=80=9D t=
hat comes with
seniority, IMHO. On the contrary.

Sincerely,
Aleksandar

--000000000000932c270587542205
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On Apr 25, 2019 7:17 AM, &quot;Richard Henderson&quot; &lt;<a href=3D"mailt=
o:richard.henderson@linaro.org">richard.henderson@linaro.org</a>&gt; wrote:=
<br>
&gt;<br>
&gt; On 4/24/19 8:31 PM, Palmer Dabbelt wrote:<br>
&gt; &gt;&gt; =C2=A0# Argument sets:<br>
&gt; &gt;&gt; +&amp;empty<br>
&gt; &gt; <br>
&gt; &gt; If I understand decodetree correctly, this isn&#39;t used until p=
atch 5.<br>
&gt; &gt; Otherwise,<br>
&gt; &gt; <br>
&gt;<br>
&gt; I think it&#39;s used as early as patch 3, but I haven&#39;t looked in=
 detail to be sure.<br>
&gt;<br>
&gt;<br>
&gt; r~<br>
&gt;</p>
<p dir=3D"ltr">I think it is a very bad practice to leave the commit messag=
e empty, and, in my view, the long-time contributor, like you, Richard, hav=
e the obligation to always give examples of commit messages of good quality=
. Leaving empty commit messages should not be a =E2=80=9Dprivelage=E2=80=9D=
 that comes with seniority, IMHO. On the contrary.</p>
<p dir=3D"ltr">Sincerely,<br>
Aleksandar<br>
</p>

--000000000000932c270587542205--

