Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gMpXT-0004Dp-6U
	for mharc-qemu-riscv@gnu.org; Wed, 14 Nov 2018 02:24:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59416)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjc@sifive.com>) id 1gMlVf-0007QO-GX
	for qemu-riscv@nongnu.org; Tue, 13 Nov 2018 22:06:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjc@sifive.com>) id 1gMlVd-0001vx-SY
	for qemu-riscv@nongnu.org; Tue, 13 Nov 2018 22:06:31 -0500
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b]:37587)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mjc@sifive.com>) id 1gMlVd-0001tb-JR
	for qemu-riscv@nongnu.org; Tue, 13 Nov 2018 22:06:29 -0500
Received: by mail-ot1-x32b.google.com with SMTP id 40so13458357oth.4
	for <qemu-riscv@nongnu.org>; Tue, 13 Nov 2018 19:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8Z5n3ixt0X27EOOPsaFwn5MbNGzY4fAxZnRnh0hFrNE=;
	b=a/A2ICCTwIR1JnL5krayTYN7e/QwS6P5yqO/RWNrL6J4dGxKeTvBzvHP2avAESyhIQ
	YeUDUiFdkay+n8P+uuhubvipgxg88od/aMNGpVORkeNhfBja/L9OYUW+MEzq37HwFjDZ
	mxnOsu6ZudyhiPhiE1UOLK5AOw/8OScVL5qZcpxuoicLSqsXIkrWUW0QTR4HGUxaxnNe
	rJoj3xlT+2uxKCaQDVa4V/Dv3YDuDafEbVxaudaXyPNy7z/1srNQVntY1frG69UoGoGF
	kGKI94mE+ENex1VKQwJBW8q95FcrXbWiIWwh6Oc8QqKqgV0j+l9ml4GC9SEMT+ExBSvF
	NAAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8Z5n3ixt0X27EOOPsaFwn5MbNGzY4fAxZnRnh0hFrNE=;
	b=DldiQz0qZwgSibM0qXbXWZum/Aiyel57FvoAkfha0oyYv9H8jxXLib00sI+Xxtu3CK
	7OE+85DUGMzY1+1pPy8bu9LSiwpaPikq4ErAPSAQQFHy1+aZMxZT6jTGZKaXd0udcHXu
	9gw1xvit/73ltEraa0NVelEB/3VagLkTkY2bWSZQXY25z5sV6SvEqJKzx+e03YnA8/4Y
	wMCDc7MCUenR96V45Tlt7i1PFlDsxlsViNv8N6G1Nea9+Lrc1gJZcX+aqOtbVZfxxQkV
	euTJc1I3aHPye79+HpyVD3lawxfoeXGqNl3SOlIiNDO78EbNGGe43xcTZc4YZC97TXMH
	7YHA==
X-Gm-Message-State: AGRZ1gJ4igbbtXws5rThvR7FvDVmhd2NRsHB0GKTJYDtq9RCu32Zie63
	K60v5Hs+Bzo8nqW+FyNnUPGk1UX9TvNiGtv8JWqurQ==
X-Google-Smtp-Source: AJdET5c9v/i7UJ0YRdunDSPk3MKJZ7h9NzjQ6Uzi1+17NvR0fCsudj5OsBweERh60ZQOI8q/uD8OPF+kEyNzWnJC1xo=
X-Received: by 2002:a9d:4b15:: with SMTP id q21mr101371otf.30.1542164780203;
	Tue, 13 Nov 2018 19:06:20 -0800 (PST)
MIME-Version: 1.0
References: <20181113235045.14155-1-palmer@sifive.com>
In-Reply-To: <20181113235045.14155-1-palmer@sifive.com>
From: Michael Clark <mjc@sifive.com>
Date: Wed, 14 Nov 2018 16:06:09 +1300
Message-ID: <CAHNT7NsWzvX8k1Ed9Re_vTL-87r2bh4wzjQSLGJ4=fpgDYyhow@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: qemu-riscv@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000e8d84b057a973728"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::32b
X-Mailman-Approved-At: Wed, 14 Nov 2018 02:24:38 -0500
Subject: Re: [Qemu-riscv] [Qemu-devel] [PR RFC] RISC-V Patches for 3.1-rc2
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
X-List-Received-Date: Wed, 14 Nov 2018 03:06:33 -0000

--000000000000e8d84b057a973728
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 14, 2018 at 12:52 PM Palmer Dabbelt <palmer@sifive.com> wrote:

> The following changes since commit
> cb968d275c145467c8b385a3618a207ec111eab1:
>
>   Update version for v3.1.0-rc1 release (2018-11-13 18:16:14 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/riscv/riscv-qemu.git tags/riscv-for-master-3.1-rc2
>
> for you to fetch changes up to 3502dc824a7b0218abb49f4350e80a49829748cf:
>
>   RISC-V: Respect fences for user-only emulators (2018-11-13 15:12:15
> -0800)
>
> ----------------------------------------------------------------
> RISC-V Patches for 3.1-rc2
>
> This pull request contains four patches that aren't really related to
> each other aside from all being bug fixes that I think should go in for
> 3.1.0:
>

Here's I again. I guess its a somewhat arbitrary set of fixes. Although one
could say the same about the set of fixes in the github repo.

At least you don't have review feedback asking you split a patch up to make
it easier to review, after its already been reviewed (what I would call
"make work").

No objections from me. We just have to get these patches into the other
tree which also has RISC-V bug fixes (but I don't have an opinion about
which bugs are more or less critical). There will be some minor merge
conflicts because the RISC-V tree has writable misa suppoer. I'm planning
to rebase at 3.1.0, just so we don't trample on each other. It's probably
going to be quite a lot of work to get the patches in that tree here
because my patches tend to attract a lot of pedantic feedback. i.e. !! to
normalize a scalar into a bool and ~ to broadcast bit 1 e.g. C bitwise
logic that you find frequently in spike; has to be dumbed down into macro
wrappers. Feedback. These changes to keep people happy are the reason why
we broke things for folk like changing gp$ to __globalPointer$ (in
GCC/binutils). Suddendly all earlier asm is broken because someone wants to
give feedback about how RISC-V should be; someone who does not need to bear
the burden of those changes.

Change simply because we can make you change stuff to break things for
RISC-V users because we think those changes are a good idea. Don't get me
wrong. We get good feedback (in QEMU, mostly from RIchard Henderson), but
its not always the case. VSPILL/VFILL and vaddsz sp is a good idea. I need
to find that email of Richard's on the GCC list and forward it to Krste. I
hope the feedback makes it to folk working on the Vector spec because as
far as I can tell it is a good idea.

Apologies for the cynicism. I'll get over it.

* The second half of Alistair's memory leak patch set that I missed last
>   week.
> * A fix to make fclass.d availiable only on RV64IFD systems (without
>   this it's availiable on RV32IFD systems, truncating the result).
> * A fix to make sfence.vm availiable only in priv-1.9.1, and sfence.vma
>   only availiable in priv-1.10.
> * A change to respect fences in user-mode emulators, which were
>   previously treated as NOPs.
>
> As usual, this builds and boot Linux for me.  I don't think I have
> anything else planned for 3.1.0, but I may be wrong as things are a bit
> hectic this week.
>
> ----------------------------------------------------------------
> Alistair Francis (1):
>       hw/riscv/virt: Free the test device tree node name
>
> Bastian Koppelmann (2):
>       target/riscv: Fix FCLASS_D being treated as RV64 only
>       target/riscv: Fix sfence.vm/a both available in any priv version
>
> Palmer Dabbelt (1):
>       RISC-V: Respect fences for user-only emulators
>
>  hw/riscv/virt.c          |  1 +
>  target/riscv/translate.c | 24 ++++++++++++++++--------
>  2 files changed, 17 insertions(+), 8 deletions(-)
>
>
>

--000000000000e8d84b057a973728
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Wed=
, Nov 14, 2018 at 12:52 PM Palmer Dabbelt &lt;<a href=3D"mailto:palmer@sifi=
ve.com">palmer@sifive.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">The following changes since commit cb968d275c145467c8b385a3618a207ec1=
11eab1:<br>
<br>
=C2=A0 Update version for v3.1.0-rc1 release (2018-11-13 18:16:14 +0000)<br=
>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 git://<a href=3D"http://github.com/riscv/riscv-qemu.git" rel=3D"nore=
ferrer" target=3D"_blank">github.com/riscv/riscv-qemu.git</a> tags/riscv-fo=
r-master-3.1-rc2<br>
<br>
for you to fetch changes up to 3502dc824a7b0218abb49f4350e80a49829748cf:<br=
>
<br>
=C2=A0 RISC-V: Respect fences for user-only emulators (2018-11-13 15:12:15 =
-0800)<br>
<br>
----------------------------------------------------------------<br>
RISC-V Patches for 3.1-rc2<br>
<br>
This pull request contains four patches that aren&#39;t really related to<b=
r>
each other aside from all being bug fixes that I think should go in for<br>
3.1.0:<br></blockquote><div><br></div><div>Here&#39;s I again. I guess its =
a somewhat arbitrary set of fixes. Although one could say the same about th=
e set of fixes in the github repo.</div><div><br></div><div>At least you do=
n&#39;t have review feedback asking you split a patch up to make it easier =
to review, after its already been reviewed (what I would call &quot;make wo=
rk&quot;).</div><div><br></div><div>No objections from me. We just have to =
get these patches into the other tree which also has RISC-V=C2=A0bug fixes =
(but I don&#39;t have an opinion about which bugs are more or less critical=
). There will be some minor merge conflicts because the RISC-V tree has wri=
table misa suppoer. I&#39;m planning to rebase at 3.1.0, just so we don&#39=
;t trample on each other. It&#39;s probably going to be quite a lot of work=
 to get the patches in that tree here because my patches tend to attract a =
lot of pedantic feedback. i.e. !! to normalize a scalar into a bool and ~ t=
o broadcast bit 1 e.g. C bitwise logic that you find frequently in spike; h=
as to be dumbed down into macro wrappers. Feedback. These changes to keep p=
eople happy are the reason why we broke things for folk like changing gp$ t=
o __globalPointer$ (in GCC/binutils). Suddendly all earlier asm is broken b=
ecause someone wants to give feedback about how RISC-V should be; someone w=
ho does not need to bear the burden of those changes.</div><div><br></div><=
div>Change simply because we can make you change stuff to break things for =
RISC-V users because we think those changes are a good idea. Don&#39;t get =
me wrong. We get good feedback (in QEMU, mostly from RIchard Henderson), bu=
t its not always the case. VSPILL/VFILL and vaddsz sp is a good idea. I nee=
d to find that email of Richard&#39;s on the GCC list and forward it to Krs=
te. I hope the feedback makes it to folk working on the Vector spec because=
 as far as I can tell it is a good idea.</div><div><br></div><div>Apologies=
 for the cynicism. I&#39;ll get over it.</div><div><br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">
* The second half of Alistair&#39;s memory leak patch set that I missed las=
t<br>
=C2=A0 week.<br>
* A fix to make fclass.d availiable only on RV64IFD systems (without<br>
=C2=A0 this it&#39;s availiable on RV32IFD systems, truncating the result).=
<br>
* A fix to make sfence.vm availiable only in priv-1.9.1, and sfence.vma<br>
=C2=A0 only availiable in priv-1.10.<br>
* A change to respect fences in user-mode emulators, which were<br>
=C2=A0 previously treated as NOPs.<br>
<br>
As usual, this builds and boot Linux for me.=C2=A0 I don&#39;t think I have=
<br>
anything else planned for 3.1.0, but I may be wrong as things are a bit<br>
hectic this week.<br>
<br>
----------------------------------------------------------------<br>
Alistair Francis (1):<br>
=C2=A0 =C2=A0 =C2=A0 hw/riscv/virt: Free the test device tree node name<br>
<br>
Bastian Koppelmann (2):<br>
=C2=A0 =C2=A0 =C2=A0 target/riscv: Fix FCLASS_D being treated as RV64 only<=
br>
=C2=A0 =C2=A0 =C2=A0 target/riscv: Fix sfence.vm/a both available in any pr=
iv version<br>
<br>
Palmer Dabbelt (1):<br>
=C2=A0 =C2=A0 =C2=A0 RISC-V: Respect fences for user-only emulators<br>
<br>
=C2=A0hw/riscv/virt.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A0target/riscv/translate.c | 24 ++++++++++++++++--------<br>
=C2=A02 files changed, 17 insertions(+), 8 deletions(-)<br>
<br>
<br>
</blockquote></div></div>

--000000000000e8d84b057a973728--

