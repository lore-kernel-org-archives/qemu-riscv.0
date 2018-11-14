Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gMpXT-0004Df-1f
	for mharc-qemu-riscv@gnu.org; Wed, 14 Nov 2018 02:24:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53435)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjc@sifive.com>) id 1gMkyf-0001zJ-DT
	for qemu-riscv@nongnu.org; Tue, 13 Nov 2018 21:32:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjc@sifive.com>) id 1gMkyd-0000On-Lv
	for qemu-riscv@nongnu.org; Tue, 13 Nov 2018 21:32:25 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:45532)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mjc@sifive.com>) id 1gMkyd-0000Ld-2u
	for qemu-riscv@nongnu.org; Tue, 13 Nov 2018 21:32:23 -0500
Received: by mail-oi1-x243.google.com with SMTP id b141so3296305oii.12
	for <qemu-riscv@nongnu.org>; Tue, 13 Nov 2018 18:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=/OhNFuxFKhsWuYIkImyoz2Q7AyrmC8gjBuOAAsh4ECk=;
	b=K9da+/Lfj9EUm4DJWcxTzpM6npf69YhMGFL6HldHjyunzFKL9ifAT4spWMDUXT2OTW
	TChZrP41OUO2lk+hQ5CWTmJjD9NHayQTsisOOCGpG5YnqW3C5vU8NiBmkRTt/6mG1/Xg
	n0By4I0vdv3vWBL2l+CH4Oum4SlfDHXjDFct5lGvftCPMB0P6O7zxUlWta/ppF54JAjp
	fole6i6N886Umbhq7so0r5UCW0wKE0KmHig4WVdh3tRd9JjffrPWAKMfMaZU6cnRlt6a
	/5FAlgNpkjA1if7PNunTyITcOziZVrjbEkAW6yb1mH2GO89/p7RRC/WQgXdWjsnRay0w
	zXZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/OhNFuxFKhsWuYIkImyoz2Q7AyrmC8gjBuOAAsh4ECk=;
	b=fb4JWQv4t7cvVAldj3sIpUd58x1v4nTUi0nsES1OoBjuZT7AnlJ1ywV5uotHYuQYIc
	XWGv4lwnuBx/6j6wHENBrOvLJsabftxCxChTDMWFZPY6AFDsnlpcb9qGQ9t0BhNqKipa
	h1PwrcWsRLpXsYy1X7BtWqRmP3tD9iOoa0MJMYDeskETtewItCdDdyNAaWeu0uECFcby
	Z4rMPh3x46/HbGUNU73+bos09HajJXGPA8dHiHzn9YEVit1es81biPhjgJugN7wcJ/kt
	tE8HSVMHoE+LrV5mZ/kbStaDMAHJubA/c5mxsGlDAVnrM8EQrHaJ2xCF4HtJG5Qy62dU
	+Zcw==
X-Gm-Message-State: AGRZ1gKtX4V5kPYRKWkT97BmfThfQU9wmlSJ579bQNqgq0bKzKOTN+b1
	lL7j4xfhH0VuIm+TrmsjM2fhATYmoRaRhLtp4A331w==
X-Google-Smtp-Source: AJdET5ccGqDGG4EVvPI2+RsDnYuBVhGzTp1IXRAluGgHcUnxY2KRBldSloaOeAwpOGyuNiF9P7s1LuE3M5NMF8M5ndM=
X-Received: by 2002:aca:b954:: with SMTP id j81-v6mr47785oif.182.1542162739654;
	Tue, 13 Nov 2018 18:32:19 -0800 (PST)
MIME-Version: 1.0
References: <20181113235045.14155-1-palmer@sifive.com>
	<20181113235045.14155-5-palmer@sifive.com>
In-Reply-To: <20181113235045.14155-5-palmer@sifive.com>
From: Michael Clark <mjc@sifive.com>
Date: Wed, 14 Nov 2018 15:32:08 +1300
Message-ID: <CAHNT7Nu7NAc-=7DEQggnWXq-v-5xAwfrB4yrvWVCJp6S6T5=0w@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: qemu-riscv@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000004887db057a96be3b"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::243
X-Mailman-Approved-At: Wed, 14 Nov 2018 02:24:37 -0500
Subject: Re: [Qemu-riscv] [Qemu-devel] [PULL 4/4] RISC-V: Respect fences for
 user-only emulators
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
X-List-Received-Date: Wed, 14 Nov 2018 02:32:27 -0000

--0000000000004887db057a96be3b
Content-Type: text/plain; charset="UTF-8"

Nits. Please improve your commit message to make them more impersonal...

On Wed, Nov 14, 2018 at 12:52 PM Palmer Dabbelt <palmer@sifive.com> wrote:

> Our current fence implementation ignores fences for the user-only
> configurations.  This is incorrect but unlikely to manifest: it requires
> multi-threaded user-only code that takes advantage of the weakness in
> the host's memory model and can be inlined by TCG.
>

The RISC-V fence implementation...


> This patch simply treats fences the same way for all our emulators.
> I've given it to testing as I don't want to construct a test that would
> actually trigger the failure.
>

Testing has been limited to... ? Reproducer?


> Our fence implementation has an additional deficiency where we map all
> RISC-V fences to full fences.  Now that we have a formal memory model
> for RISC-V we can start to take advantage of the strength bits on our
> fence instructions.  This requires a bit more though, so I'm going to
> split it out because the implementation is still correct without taking
> advantage of these weaker fences.
>

The fence implementation...

A formal memory model for RISC-V allows...


> Thanks to Richard Henderson for pointing out both of the issues.
>
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


Assuming you fix up the commit message. I am not sure if I am present in
any of the commit messages I wrote, however perhaps thats just a matter
style with respect to writing (or re-writing) history.

Reviewed-by: Michael Clark <mjc@sifive.com>

---
>  target/riscv/translate.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index f44eb9c41b48..312bf298b3c2 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -1776,7 +1776,6 @@ static void decode_RV32_64G(CPURISCVState *env,
> DisasContext *ctx)
>                       GET_RM(ctx->opcode));
>          break;
>      case OPC_RISC_FENCE:
> -#ifndef CONFIG_USER_ONLY
>          if (ctx->opcode & 0x1000) {
>              /* FENCE_I is a no-op in QEMU,
>               * however we need to end the translation block */
> @@ -1787,7 +1786,6 @@ static void decode_RV32_64G(CPURISCVState *env,
> DisasContext *ctx)
>              /* FENCE is a full memory barrier. */
>              tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
>          }
> -#endif
>          break;
>      case OPC_RISC_SYSTEM:
>          gen_system(env, ctx, MASK_OP_SYSTEM(ctx->opcode), rd, rs1,
> --
> 2.18.1
>
>
>

--0000000000004887db057a96be3b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div><div>Nits. Please improve your commit messa=
ge to make them more impersonal...<br><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr">On Wed, Nov 14, 2018 at 12:52 PM Palmer Dabbelt &lt;<a href=3D"m=
ailto:palmer@sifive.com">palmer@sifive.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">Our current fence implementation ignores fences for =
the user-only<br>
configurations.=C2=A0 This is incorrect but unlikely to manifest: it requir=
es<br>
multi-threaded user-only code that takes advantage of the weakness in<br>
the host&#39;s memory model and can be inlined by TCG.<br></blockquote><div=
><br></div><div>The RISC-V fence implementation...</div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">
This patch simply treats fences the same way for all our emulators.<br>
I&#39;ve given it to testing as I don&#39;t want to construct a test that w=
ould<br>
actually trigger the failure.<br></blockquote><div><br></div><div>Testing h=
as been limited to... ? Reproducer?</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
Our fence implementation has an additional deficiency where we map all<br>
RISC-V fences to full fences.=C2=A0 Now that we have a formal memory model<=
br>
for RISC-V we can start to take advantage of the strength bits on our<br>
fence instructions.=C2=A0 This requires a bit more though, so I&#39;m going=
 to<br>
split it out because the implementation is still correct without taking<br>
advantage of these weaker fences.<br></blockquote><div><br></div><div>The f=
ence implementation...</div><div><br></div><div>A formal memory model for R=
ISC-V allows...</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
Thanks to Richard Henderson for pointing out both of the issues.<br>
<br>
Signed-off-by: Palmer Dabbelt &lt;<a href=3D"mailto:palmer@sifive.com" targ=
et=3D"_blank">palmer@sifive.com</a>&gt;<br>
Reviewed-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.co=
m" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@lina=
ro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;</blockquote>=
<div>=C2=A0</div><div>Assuming you fix up the commit message. I am not sure=
 if I am present in any of the commit messages I wrote, however perhaps tha=
ts just a matter style with respect to writing (or re-writing) history.</di=
v><div><br></div>Reviewed-by: Michael Clark &lt;<a href=3D"mailto:mjc@sifiv=
e.com">mjc@sifive.com</a>&gt;<br class=3D"gmail-Apple-interchange-newline">=
<div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">
---<br>
=C2=A0target/riscv/translate.c | 2 --<br>
=C2=A01 file changed, 2 deletions(-)<br>
<br>
diff --git a/target/riscv/translate.c b/target/riscv/translate.c<br>
index f44eb9c41b48..312bf298b3c2 100644<br>
--- a/target/riscv/translate.c<br>
+++ b/target/riscv/translate.c<br>
@@ -1776,7 +1776,6 @@ static void decode_RV32_64G(CPURISCVState *env, Disas=
Context *ctx)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 GET_RM(ctx-&gt;opcode));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0case OPC_RISC_FENCE:<br>
-#ifndef CONFIG_USER_ONLY<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ctx-&gt;opcode &amp; 0x1000) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* FENCE_I is a no-op in QE=
MU,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * however we need to end t=
he translation block */<br>
@@ -1787,7 +1786,6 @@ static void decode_RV32_64G(CPURISCVState *env, Disas=
Context *ctx)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* FENCE is a full memory b=
arrier. */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_gen_mb(TCG_MO_ALL | TCG=
_BAR_SC);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-#endif<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0case OPC_RISC_SYSTEM:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gen_system(env, ctx, MASK_OP_SYSTEM(ctx-&=
gt;opcode), rd, rs1,<br>
-- <br>
2.18.1<br>
<br>
<br>
</blockquote></div></div></div>

--0000000000004887db057a96be3b--

