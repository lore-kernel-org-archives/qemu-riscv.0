Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hgYS3-0002KA-OP
	for mharc-qemu-riscv@gnu.org; Thu, 27 Jun 2019 13:44:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37428)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <fintelia@gmail.com>) id 1hgYS1-0002JE-CD
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 13:44:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <fintelia@gmail.com>) id 1hgYRw-0003Ck-KV
 for qemu-riscv@nongnu.org; Thu, 27 Jun 2019 13:44:46 -0400
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:39891)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <fintelia@gmail.com>)
 id 1hgYRt-00035Y-C2; Thu, 27 Jun 2019 13:44:42 -0400
Received: by mail-lj1-x241.google.com with SMTP id v18so3239990ljh.6;
 Thu, 27 Jun 2019 10:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0qJOU4T9A+Rgo+KUWUOXYaNJYMQ+KH3leoUF1qgEo/8=;
 b=gKCkLQg/+PShoplCFDLy0X9iaLC2OCi3K56QnXinjkOoLFoGJ7K+hptYhrHMLbd9UM
 3euNXo4ZLxzFzvDBZygC9PioJZzs1mBl9Giq+VUeidnYNg/1zaFbMt/JZKar5pqTI0E2
 IH/0kwdU4BTiSZqUzRPexi+UtHOqwMW0bXd3e/L88wMyihPZoo+O51ewgqTkUCEiaFCh
 G2n7Z2j8vzV8pNlIdQIagpCVm4i4VZMRVjuUenmozowig3ohZmrL77QYwy3Q4zqxb0Xb
 ozcAOUejVZUOxFfkY3xAVpeh/c8o8w88kYDNl3WVuP/uJs0//0jJrn8OhOLxAOybwXVY
 wwyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0qJOU4T9A+Rgo+KUWUOXYaNJYMQ+KH3leoUF1qgEo/8=;
 b=F1CtT1X2XZbuiPitx/fAYwKRXbG1bDYyXlvrdkFB02JyDSbEyOuCmpmi6P3pHFv8hy
 xaij321zT2kRIHgwgWlnoHdp3ysVniUfDGgLgMa3dZj+CC8sLIQwSRIvAClS5e58aFX1
 3X/Ii2rzdcfJk19V4gID8ehJUKI6JHuxUr7pvny2VsHXnakbnxHTQpWRkPQKe1F8F0iZ
 j4QRl06gNdizbS2jyKBW72IeSRD70wHoVM9NhgbL5cx5oJbKvmkM51aYaqtRVLOfvNcr
 HbyMYr0Zoss6hFxvEG6rFVw+TExsnOjTmT/nlbLDrzaX1piEhqhiRthRAm5X0vBgLbKh
 bJxw==
X-Gm-Message-State: APjAAAUb7ZMX+2thmtCYstmT6mteijs/Peth82ykD1Wf6OEu8hFT/bLI
 RLs93eg9t9YTSDqpjeLU9bj9O2/yAqgk3CGzJBc=
X-Google-Smtp-Source: APXvYqzVhVvV7KdV7YJydYeWk9vSo1O5VS+ZDj/VodpS1pL3jdugrAefpf4Er2frOLWs5h0ZDsX356z//YDFuEGzMW4=
X-Received: by 2002:a2e:9a82:: with SMTP id p2mr3510779lji.64.1561657477249;
 Thu, 27 Jun 2019 10:44:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190627152011.18686-1-palmer@sifive.com>
 <20190627152011.18686-11-palmer@sifive.com>
In-Reply-To: <20190627152011.18686-11-palmer@sifive.com>
From: Jonathan Behrens <fintelia@gmail.com>
Date: Thu, 27 Jun 2019 13:44:06 -0400
Message-ID: <CANnJOVF3F_k1LpSYp8OdxSx6LtQR5p-XR5fMKCsXg_0pxySg+Q@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Hesham Almatary <Hesham.Almatary@cl.cam.ac.uk>
Content-Type: multipart/alternative; boundary="000000000000313df8058c51b7e6"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::241
Subject: Re: [Qemu-riscv] [PULL 10/34] RISC-V: Fix a PMP check with the
 correct access size
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
X-List-Received-Date: Thu, 27 Jun 2019 17:44:50 -0000

--000000000000313df8058c51b7e6
Content-Type: text/plain; charset="UTF-8"

I think this patch is slightly incorrect. If the PMP region is valid for
the size of the access, but not the rest of the page then a few lines down
in this function the entire page should not be placed into the TLB. Instead
only the portion of the page that passed the access check should be
included. To give an example of where this goes wrong, in the code below
access to address 0x90000008 should always fail due to PMP rules, but if
the TLB has already been primed by loading the (allowed) address 0x90000000
then no fault will be triggered. Notably, this code also executes
improperly without the patch because the first `ld` instruction traps when
it shouldn't.

  li t0, 0x0000000024000000 // region[0]: 0x90000000..0x90000007
  csrw pmpaddr0, t0

  li t0, 0x00000000240001FF // region[1]: 0x90000000..0x90000fff
  csrw pmpaddr1, t0

  li t0, 0x1F0000000000989F // cfg[0] = LXRW, cfg[1] = L
  csrw pmpcfg0, t0

  sfence.vma

  li t0, 0x90000000
  ld s0, 0(t0)
  ld s1, 8(t0) // NO TRAP: address is incorrectly in TLB!

  sfence.vma
  ld s1, 8(t0) // TRAP: TLB has been flushed!

I think that the proper fix would be to first do a PMP check for the full
PAGE_SIZE and execute normally if it passes. Then in the event the full
page fails, there could be a more granular PMP check with only the accessed
region inserted as an entry in the TLB.

Unrelated question: should I be sending "Reviewed By" lines if I read
through patches that seem reasonable? Or there some formal process I'd have
to go through first to be approved?

Jonathan

On Thu, Jun 27, 2019 at 11:43 AM Palmer Dabbelt <palmer@sifive.com> wrote:

> From: Hesham Almatary <Hesham.Almatary@cl.cam.ac.uk>
>
> The PMP check should be of the memory access size rather
> than TARGET_PAGE_SIZE.
>
> Signed-off-by: Hesham Almatary <Hesham.Almatary@cl.cam.ac.uk>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> ---
>  target/riscv/cpu_helper.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 66be83210f11..e1b079e69c60 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -452,8 +452,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address,
> int size,
>
>      if (riscv_feature(env, RISCV_FEATURE_PMP) &&
>          (ret == TRANSLATE_SUCCESS) &&
> -        !pmp_hart_has_privs(env, pa, TARGET_PAGE_SIZE, 1 << access_type,
> -        mode)) {
> +        !pmp_hart_has_privs(env, pa, size, 1 << access_type, mode)) {
>          ret = TRANSLATE_PMP_FAIL;
>      }
>      if (ret == TRANSLATE_PMP_FAIL) {
> --
> 2.21.0
>
>
>

--000000000000313df8058c51b7e6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I think this patch is slightly incorrect. If the PMP =
region is valid for the size of the access, but not the rest of the page th=
en a few lines down in this function the entire page should not be placed i=
nto the TLB. Instead only the portion of the page that passed the access ch=
eck should be included. To give an example of where this goes wrong, in the=
 code below access to address 0x90000008 should always fail due to PMP rule=
s, but if the TLB has already been primed by loading the (allowed) address =
0x90000000 then no fault will be triggered. Notably, this code also execute=
s improperly without the patch because the first `ld` instruction traps whe=
n it shouldn&#39;t.<br></div><div><br></div><div><span style=3D"font-family=
:courier new,monospace">=C2=A0 li t0, 0x0000000024000000 // region[0]: 0x90=
000000..0x90000007<br>=C2=A0 csrw pmpaddr0, t0<br><br>=C2=A0 li t0, 0x00000=
000240001FF // region[1]: 0x90000000..0x90000fff<br>=C2=A0 csrw pmpaddr1, t=
0<br><br>=C2=A0 li t0, 0x1F0000000000989F // cfg[0] =3D LXRW, cfg[1] =3D L<=
br>=C2=A0 csrw pmpcfg0, t0<br><br>=C2=A0 sfence.vma<br><br>=C2=A0 li t0, 0x=
90000000<br>=C2=A0 ld s0, 0(t0)<br>=C2=A0 ld s1, 8(t0) // NO TRAP: address =
is incorrectly in TLB!<br><br>=C2=A0 sfence.vma<br>=C2=A0 ld s1, 8(t0) // T=
RAP: TLB has been flushed!<br></span></div><div><br></div><div></div><div>I=
 think that the proper fix would be to first do a PMP check for the full PA=
GE_SIZE and execute normally if it passes. Then in the event the full page =
fails, there could be a more granular PMP check with only the accessed regi=
on inserted as an entry in the TLB.</div><div><br></div><div>Unrelated ques=
tion: should I be sending &quot;Reviewed By&quot; lines if I read through  =
patches that seem reasonable? Or there some formal process I&#39;d have to =
go through first to be approved?<br></div><div><br></div><div>Jonathan<br><=
/div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Thu, Jun 27, 2019 at 11:43 AM Palmer Dabbelt &lt;<a href=3D"mailto:=
palmer@sifive.com" target=3D"_blank">palmer@sifive.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">From: Hesham Almatary=
 &lt;<a href=3D"mailto:Hesham.Almatary@cl.cam.ac.uk" target=3D"_blank">Hesh=
am.Almatary@cl.cam.ac.uk</a>&gt;<br>
<br>
The PMP check should be of the memory access size rather<br>
than TARGET_PAGE_SIZE.<br>
<br>
Signed-off-by: Hesham Almatary &lt;<a href=3D"mailto:Hesham.Almatary@cl.cam=
.ac.uk" target=3D"_blank">Hesham.Almatary@cl.cam.ac.uk</a>&gt;<br>
Reviewed-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.co=
m" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
Signed-off-by: Palmer Dabbelt &lt;<a href=3D"mailto:palmer@sifive.com" targ=
et=3D"_blank">palmer@sifive.com</a>&gt;<br>
---<br>
=C2=A0target/riscv/cpu_helper.c | 3 +--<br>
=C2=A01 file changed, 1 insertion(+), 2 deletions(-)<br>
<br>
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c<br>
index 66be83210f11..e1b079e69c60 100644<br>
--- a/target/riscv/cpu_helper.c<br>
+++ b/target/riscv/cpu_helper.c<br>
@@ -452,8 +452,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, in=
t size,<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (riscv_feature(env, RISCV_FEATURE_PMP) &amp;&amp;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(ret =3D=3D TRANSLATE_SUCCESS) &amp;&amp;=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 !pmp_hart_has_privs(env, pa, TARGET_PAGE_SIZE,=
 1 &lt;&lt; access_type,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 mode)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 !pmp_hart_has_privs(env, pa, size, 1 &lt;&lt; =
access_type, mode)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D TRANSLATE_PMP_FAIL;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0if (ret =3D=3D TRANSLATE_PMP_FAIL) {<br>
-- <br>
2.21.0<br>
<br>
<br>
</blockquote></div>

--000000000000313df8058c51b7e6--

