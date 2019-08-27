Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i2dMa-00066e-Qa
	for mharc-qemu-riscv@gnu.org; Tue, 27 Aug 2019 11:26:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51586)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <chihmin.chao@sifive.com>) id 1i2dMX-00061V-7a
 for qemu-riscv@nongnu.org; Tue, 27 Aug 2019 11:26:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <chihmin.chao@sifive.com>) id 1i2dMV-0001ar-Rr
 for qemu-riscv@nongnu.org; Tue, 27 Aug 2019 11:26:25 -0400
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:35221)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <chihmin.chao@sifive.com>)
 id 1i2dMV-0001ZS-Jk
 for qemu-riscv@nongnu.org; Tue, 27 Aug 2019 11:26:23 -0400
Received: by mail-io1-xd44.google.com with SMTP id b10so38197998ioj.2
 for <qemu-riscv@nongnu.org>; Tue, 27 Aug 2019 08:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zV5inUbU33HGE+HXpm/uIphCXvdIrmc/8bmS9Jcq9yg=;
 b=Ivj+tsW2+DcgSLNglj+8V3nPgfXJH7F1EZNmI/D7uJx/JhHZCXGScye3IGSYzuIkXk
 eOGoND+LRP3CmGsKByO/tf9Ha5FdQpfCBE0VUaPFTaxPbhThs2BcNcDUOVozcDq+icO9
 C7p9uHyKssRfaRGtslJ6NIIpVP3h+YBwz8VvgtwHEigTWYlwYyVtz58EfiDxIhd3oG9s
 pz3WULgsdE+eB1ogSlAp4rnHBMf4SmjrGwdzghtz5ow+r1JpUY91qIl6L/UKF+rUfylA
 fGVntlCIp+G077UkcauCbPGn7Z4DGi+IUE/QNZ308VizohlFZT/47QO7FD5G2/dxg48v
 x19Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zV5inUbU33HGE+HXpm/uIphCXvdIrmc/8bmS9Jcq9yg=;
 b=EVWPWNs4aWMIfKZdcw4HS79yJAOhQ4QOsw//xnUKXLpuDHZkOybyPRLQiQYhnUi9DF
 qbRwtTZMgMpxq6XUR0/gausI4/tzqQ+LGedVAcJ7UPwrvwJC6NNfUwiqSCRJMOX3NTyW
 z5Yk+EQ/DSmuwC+DkM58Ah5ViOm647AGmcMunbBZAGSn2y+kX6yPSQV6/rU4rZ7NqdbZ
 Q86mZjHcAAujkIvYyzL2fzRIfPRjRMD4h8Pnsdj5je/UNke5by3kQclBc1aJ60TLacTL
 DmoHP2EiqjBbj81ykb6RCfCB3bOvw4sMlEJl6brLzryHGahk4mceTiquDYeCP4tkmNWN
 zoMg==
X-Gm-Message-State: APjAAAVUrTRmsYPElLFFvRNskP10IoAHNIU6MwzOpnyam42F+SMa2U8w
 rfJdOynCvwZsbhtE0qm7TdOaTH5ia9kjrlJ5+z64jvs3JHmSww==
X-Google-Smtp-Source: APXvYqwUgWARfrXJuuD5WeBhhqjV7tEoACo0pwyoiyXA+6wMWhcZwWg6nCgEJ3oOiWbqczxYo42f/XDimKCiM7ZfNAI=
X-Received: by 2002:a05:6602:228e:: with SMTP id
 d14mr2207927iod.85.1566919582525; 
 Tue, 27 Aug 2019 08:26:22 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1566603412.git.alistair.francis@wdc.com>
 <008eba3fe3b65cc5d37a1ced51d3631b23bef330.1566603412.git.alistair.francis@wdc.com>
In-Reply-To: <008eba3fe3b65cc5d37a1ced51d3631b23bef330.1566603412.git.alistair.francis@wdc.com>
From: Chih-Min Chao <chihmin.chao@sifive.com>
Date: Tue, 27 Aug 2019 23:26:11 +0800
Message-ID: <CAEiOBXUz6Ng-9scF62XsiU-tcA58sj8P=tNwLpiphm+uGARVmA@mail.gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair23@gmail.com>, Anup.Patel@wdc.com, 
 Palmer Dabbelt <palmer@sifive.com>, Atish.Patra@wdc.com
Content-Type: multipart/alternative; boundary="0000000000001bc44f05911ae50f"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d44
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v1 01/28] target/riscv: Add
 the Hypervisor extension
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
X-List-Received-Date: Tue, 27 Aug 2019 15:26:27 -0000

--0000000000001bc44f05911ae50f
Content-Type: text/plain; charset="UTF-8"

On Sat, Aug 24, 2019 at 7:42 AM Alistair Francis <alistair.francis@wdc.com>
wrote:

> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 124ed33ee4..7f54fb8c87 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -67,6 +67,7 @@
>  #define RVC RV('C')
>  #define RVS RV('S')
>  #define RVU RV('U')
> +#define RVH RV('H')
>
>  /* S extension denotes that Supervisor mode exists, however it is possible
>     to have a core that support S mode but does not have an MMU and there
> --
> 2.22.0
>
>
> Reviewed-by: Chih-Min Chao <chihmin.chao@sifive.com>

--0000000000001bc44f05911ae50f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Aug 24, 2019 at 7:42 AM Alist=
air Francis &lt;<a href=3D"mailto:alistair.francis@wdc.com">alistair.franci=
s@wdc.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Signed-off-by: Alistair Francis &lt;<a href=3D"mailto:alistair.f=
rancis@wdc.com" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
---<br>
=C2=A0target/riscv/cpu.h | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
index 124ed33ee4..7f54fb8c87 100644<br>
--- a/target/riscv/cpu.h<br>
+++ b/target/riscv/cpu.h<br>
@@ -67,6 +67,7 @@<br>
=C2=A0#define RVC RV(&#39;C&#39;)<br>
=C2=A0#define RVS RV(&#39;S&#39;)<br>
=C2=A0#define RVU RV(&#39;U&#39;)<br>
+#define RVH RV(&#39;H&#39;)<br>
<br>
=C2=A0/* S extension denotes that Supervisor mode exists, however it is pos=
sible<br>
=C2=A0 =C2=A0 to have a core that support S mode but does not have an MMU a=
nd there<br>
-- <br>
2.22.0<br>
<br>
<br></blockquote><div>Reviewed-by: Chih-Min Chao &lt;<a href=3D"mailto:chih=
min.chao@sifive.com" target=3D"_blank">chihmin.chao@sifive.com</a>&gt;=C2=
=A0=C2=A0=C2=A0</div></div></div>

--0000000000001bc44f05911ae50f--

