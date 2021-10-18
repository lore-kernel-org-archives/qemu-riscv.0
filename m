Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcOge-0005Vz-Ol
	for mharc-qemu-riscv@gnu.org; Mon, 18 Oct 2021 05:12:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mcOga-0005Ul-Qc
 for qemu-riscv@nongnu.org; Mon, 18 Oct 2021 05:12:01 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:43563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mcOgV-0003gA-EO
 for qemu-riscv@nongnu.org; Mon, 18 Oct 2021 05:11:59 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 e5-20020a17090a804500b001a116ad95caso6497400pjw.2
 for <qemu-riscv@nongnu.org>; Mon, 18 Oct 2021 02:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zQfgb0MeOJMzaPUMOhWBB6SfGww5gTMNQt5y2p/cG0Q=;
 b=FcGAnKSIu2GNL+Kp+I40UPRwt+9kU8MGYkf14ec3GUtfYxwXue6uTat1I/ERyVIZXc
 cn4dBIcn0R3akVe8l6/yYg5YWLftqMuwCfSIESGjRS1vM/qdSvyXiCtrnKjHUHQLyePO
 vfGIEXF0aiWWs7vIX4+YuZvqPlPnpxGfANo+aW9y7sAp/TLg7YUumeDYTJsIyUfYsFM5
 WqLD2cRd1LZQIuVIriTzQYaSM5oOBrn1ragv/IIc9cJPHguhcqOw0Of7CUyrY+Gne948
 UQi4x8a+bl2JvWk4sbFwf4AGTEF8xhpd7ZLsMN0GvaQF/4Afd2hDFOGvNZAC5auPPfP6
 tdig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zQfgb0MeOJMzaPUMOhWBB6SfGww5gTMNQt5y2p/cG0Q=;
 b=3Ff4dMzwaTXJFmmDwwmjzHFN40GmhhZaxlg24VXKzKzjv1kwEfdmfeGZ+hL6ZAAh7d
 xn/9vqdhelCoGBu+68n+804q/7A/N2ji2rQ9Yrk+zADyVwO3nhUo8PnySuNdfSCU/Hsi
 FRtLyuqu+32pBNMcfhzxcCxvgBmSJ0A1xaKeMzsTSRQxYasS6RwyNntEv+luEa7M5En7
 58Oou0KZNu3wBTuCeftvLJ6mKqim2je1znnsNUpKAcqNygdQDWDgsJhiQLA20+xX40kX
 y9iSBV+O0GtIv9QJbosuqIF4tmDNTrXKn/UARDuWokY/OeCaL6GpaVbIurtsCQmviG9D
 U7OA==
X-Gm-Message-State: AOAM533gnOIJ+5peU//sTNV5noqsdxmmJqExayETDAg7r14/Fbzk7Xhr
 ImLp7OkDSPE3P/9tRUf+UKOzzi2HOB3tcQ==
X-Google-Smtp-Source: ABdhPJydIs9sJpy3/h9d2KFNSbRCQYOQUp1WNIcFLA5wpqsm7SALpgztGeG8e6zkTf4NvzwkEJfWvw==
X-Received: by 2002:a17:90b:3a85:: with SMTP id
 om5mr32842803pjb.115.1634548313850; 
 Mon, 18 Oct 2021 02:11:53 -0700 (PDT)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com.
 [209.85.215.172])
 by smtp.gmail.com with ESMTPSA id x20sm12194431pjp.48.2021.10.18.02.11.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 02:11:53 -0700 (PDT)
Received: by mail-pg1-f172.google.com with SMTP id e65so13069535pgc.5;
 Mon, 18 Oct 2021 02:11:53 -0700 (PDT)
X-Received: by 2002:a05:6a00:1592:b0:44d:db91:ff84 with SMTP id
 u18-20020a056a00159200b0044ddb91ff84mr2621100pfk.45.1634548313131; Mon, 18
 Oct 2021 02:11:53 -0700 (PDT)
MIME-Version: 1.0
References: <f4d8a7a035f39c0a35d44c1e371c5c99cc2fa15a.1634531504.git.alistair.francis@wdc.com>
In-Reply-To: <f4d8a7a035f39c0a35d44c1e371c5c99cc2fa15a.1634531504.git.alistair.francis@wdc.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Mon, 18 Oct 2021 17:11:41 +0800
X-Gmail-Original-Message-ID: <CANzO1D3rf3em2RJAb7Q4vO3N5q+eyzxtFM6YmrSo0Pw3w12GBg@mail.gmail.com>
Message-ID: <CANzO1D3rf3em2RJAb7Q4vO3N5q+eyzxtFM6YmrSo0Pw3w12GBg@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] target/riscv: Remove some unused macros
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, bmeng.cn@gmail.com, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Alistair Francis <alistair23@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000092909105ce9ceffb"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 18 Oct 2021 09:12:01 -0000

--00000000000092909105ce9ceffb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Alistair Francis <alistair.francis@opensource.wdc.com> =E6=96=BC 2021=E5=B9=
=B410=E6=9C=8818=E6=97=A5 =E9=80=B1=E4=B8=80
=E4=B8=8B=E5=8D=8812:38=E5=AF=AB=E9=81=93=EF=BC=9A

> From: Alistair Francis <alistair.francis@wdc.com>
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu_bits.h | 8 --------
>  1 file changed, 8 deletions(-)
>
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 999187a9ee..3aa2512d13 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -427,14 +427,6 @@
>  #define SATP64_ASID         0x0FFFF00000000000ULL
>  #define SATP64_PPN          0x00000FFFFFFFFFFFULL
>
> -/* VM modes (mstatus.vm) privileged ISA 1.9.1 */
> -#define VM_1_09_MBARE       0
> -#define VM_1_09_MBB         1
> -#define VM_1_09_MBBID       2
> -#define VM_1_09_SV32        8
> -#define VM_1_09_SV39        9
> -#define VM_1_09_SV48        10
> -
>  /* VM modes (satp.mode) privileged ISA 1.10 */
>  #define VM_1_10_MBARE       0
>  #define VM_1_10_SV32        1
> --
> 2.31.1
>
>
>
Reviewed-by: Frank Chang <frank.chang@sifive.com>

--00000000000092909105ce9ceffb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Alistair Francis &lt;<a href=3D"mailto:al=
istair.francis@opensource.wdc.com">alistair.francis@opensource.wdc.com</a>&=
gt; =E6=96=BC 2021=E5=B9=B410=E6=9C=8818=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=
=8B=E5=8D=8812:38=E5=AF=AB=E9=81=93=EF=BC=9A<br></div><div class=3D"gmail_q=
uote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">From: Alistair Fran=
cis &lt;<a href=3D"mailto:alistair.francis@wdc.com" target=3D"_blank">alist=
air.francis@wdc.com</a>&gt;<br>
<br>
Signed-off-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.=
com" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
---<br>
=C2=A0target/riscv/cpu_bits.h | 8 --------<br>
=C2=A01 file changed, 8 deletions(-)<br>
<br>
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h<br>
index 999187a9ee..3aa2512d13 100644<br>
--- a/target/riscv/cpu_bits.h<br>
+++ b/target/riscv/cpu_bits.h<br>
@@ -427,14 +427,6 @@<br>
=C2=A0#define SATP64_ASID=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0FFFF000000000=
00ULL<br>
=C2=A0#define SATP64_PPN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x00000FFFFFFFFF=
FFULL<br>
<br>
-/* VM modes (mstatus.vm) privileged ISA 1.9.1 */<br>
-#define VM_1_09_MBARE=C2=A0 =C2=A0 =C2=A0 =C2=A00<br>
-#define VM_1_09_MBB=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01<br>
-#define VM_1_09_MBBID=C2=A0 =C2=A0 =C2=A0 =C2=A02<br>
-#define VM_1_09_SV32=C2=A0 =C2=A0 =C2=A0 =C2=A0 8<br>
-#define VM_1_09_SV39=C2=A0 =C2=A0 =C2=A0 =C2=A0 9<br>
-#define VM_1_09_SV48=C2=A0 =C2=A0 =C2=A0 =C2=A0 10<br>
-<br>
=C2=A0/* VM modes (satp.mode) privileged ISA 1.10 */<br>
=C2=A0#define VM_1_10_MBARE=C2=A0 =C2=A0 =C2=A0 =C2=A00<br>
=C2=A0#define VM_1_10_SV32=C2=A0 =C2=A0 =C2=A0 =C2=A0 1<br>
-- <br>
2.31.1<br>
<br>
<br></blockquote><div><br></div><div>Reviewed-by: Frank Chang &lt;<a href=
=3D"mailto:frank.chang@sifive.com">frank.chang@sifive.com</a>&gt;</div></di=
v></div>

--00000000000092909105ce9ceffb--

