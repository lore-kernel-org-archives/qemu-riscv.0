Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l6ETe-0005h7-Fd
	for mharc-qemu-riscv@gnu.org; Sun, 31 Jan 2021 10:17:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <a.tarasenko@gmail.com>)
 id 1l6B5W-0006Ng-KR; Sun, 31 Jan 2021 06:40:18 -0500
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:44175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <a.tarasenko@gmail.com>)
 id 1l6B5T-0000ci-LV; Sun, 31 Jan 2021 06:40:18 -0500
Received: by mail-qk1-x736.google.com with SMTP id v126so13431410qkd.11;
 Sun, 31 Jan 2021 03:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+3Nd22psx3BA6b2UgCxA5Llk29z9FeosWF7EXjokeME=;
 b=k/haY7GsU5j42ryhXQcedbNZgdeFh6h0CxAR/pQclLCL/RwnH9yKpVMKPUmOYtiA4z
 6CQBERdiG2VRcPOMjERIvNaAI6h5K25aB4q6LMkvLjsHzynLvlz4a3GU1hcsQJfPW40k
 DIGGN2WDhgMBAVu94O0yQU6sK4P+u1wgiDzhMiouKPx2tyD3KkBztPAbQyv5gXvT7A8s
 99p/XDDvhLiZ1PLUWqsIOlpaoXrq7ym1CBFB1O55nRRO/A9FCKDBk65gupikUWBcF4ye
 8Q400z7UnaQLTxQuBuf8UrIr9mkJo0EfT7v8H4Ior+30/TAG0prDhAGiE5Jas87SD1OZ
 eysw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+3Nd22psx3BA6b2UgCxA5Llk29z9FeosWF7EXjokeME=;
 b=YKVrA50q+farFoKwOrteszy6/QZrqvgrCOOFG/vbZFq9UJ9Phmkk87tNmuxPrqa/w1
 ioGJMf0R0NYU3i+d5dum+gfE1+3cIOkTBz//Adrf3zi1tAJqIhP/vqbDdW6XuuzIn5AI
 GPdNz7Ef6thRuOKQgzAs93DOSxSXY/MTEzTBtoFswDMuKW+FwiKoRtnJk5ekFnusPLMD
 +rbHuIMctWTtPmlccY1c85y//DPsi4Wj5RapOIQ2b5At5XR2ckrHB4jXkOXOLbwG01Bb
 10Y580OPG/zbid+gET43wkDdD5TeQ3krANYCvnpgjQqHd8GVGTZyMyEDnk9kJ7E/hDmZ
 0/GA==
X-Gm-Message-State: AOAM530BycKj0TTiyC1HP0zdNejavaTUoIamhXOP5BFixEA4fpdupR2m
 yLrDOPP4GYhqZZgC12FMhB9vdX86APkydvD9GNQ=
X-Google-Smtp-Source: ABdhPJyF+o+xmbWvH1gmE2N3KoqkYGCiOmOr5dAulcgi+Ufvs+lEN+ucEyAq4g2U5u8da2YaTyZDsk6uoxnGxD5U/fo=
X-Received: by 2002:a37:e10b:: with SMTP id c11mr11551105qkm.176.1612093212344; 
 Sun, 31 Jan 2021 03:40:12 -0800 (PST)
MIME-Version: 1.0
References: <20210131111316.232778-1-f4bug@amsat.org>
 <20210131111316.232778-6-f4bug@amsat.org>
In-Reply-To: <20210131111316.232778-6-f4bug@amsat.org>
From: Artyom Tarasenko <atar4qemu@gmail.com>
Date: Sun, 31 Jan 2021 12:40:00 +0100
Message-ID: <CAAM0arO-h__GZq_esjTUAgOKb5LLJVD-BKACho5P35zPOqLTtg@mail.gmail.com>
Subject: Re: [PATCH 05/10] meson: Introduce target-specific Kconfig
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Sarah Harris <S.E.Harris@kent.ac.uk>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-block@nongnu.org, 
 "Michael S. Tsirkin" <mst@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-s390x@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>,
 Anthony Green <green@moxielogic.com>, 
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Chris Wulff <crwulff@gmail.com>, 
 Guan Xuetao <gxt@mprc.pku.edu.cn>, qemu-riscv@nongnu.org, 
 David Hildenbrand <david@redhat.com>, qemu-arm@nongnu.org, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Michael Walle <michael@walle.cc>, 
 Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>, Stafford Horne <shorne@gmail.com>, 
 Cornelia Huck <cohuck@redhat.com>, Marek Vasut <marex@denx.de>, 
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Michael Rolnik <mrolnik@gmail.com>, 
 Aurelien Jarno <aurelien@aurel32.net>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 David Gibson <david@gibson.dropbear.id.au>
Content-Type: multipart/alternative; boundary="00000000000044447605ba30b361"
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=a.tarasenko@gmail.com; helo=mail-qk1-x736.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 31 Jan 2021 10:17:25 -0500
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
X-List-Received-Date: Sun, 31 Jan 2021 11:40:32 -0000

--00000000000044447605ba30b361
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=81, 31 =D1=8F=D0=BD=D0=B2. 2021 =D0=B3., 12:13 Philippe Mathieu-D=
aud=C3=A9 <f4bug@amsat.org>:

> Add a target-specific Kconfig.
>
> Target foo now has CONFIG_FOO defined.
>
> Two architecture have a particularity, ARM and MIPS:
> their 64-bit version include the 32-bit subset.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>

For SPARC part:
Acked-by: Artyom Tarasenko <atar4qemu@gmail.com>

---
> I suppose X86_64 should also select I386?
> No clue about PPC/RISCV.
> ---
>  meson.build               |  3 ++-
>  Kconfig                   |  1 +
>  target/Kconfig            | 23 +++++++++++++++++++++++
>  target/alpha/Kconfig      |  2 ++
>  target/arm/Kconfig        |  6 ++++++
>  target/avr/Kconfig        |  2 ++
>  target/cris/Kconfig       |  2 ++
>  target/hppa/Kconfig       |  2 ++
>  target/i386/Kconfig       |  5 +++++
>  target/lm32/Kconfig       |  2 ++
>  target/m68k/Kconfig       |  2 ++
>  target/microblaze/Kconfig |  2 ++
>  target/mips/Kconfig       |  6 ++++++
>  target/moxie/Kconfig      |  2 ++
>  target/nios2/Kconfig      |  2 ++
>  target/openrisc/Kconfig   |  2 ++
>  target/ppc/Kconfig        |  5 +++++
>  target/riscv/Kconfig      |  5 +++++
>  target/rx/Kconfig         |  2 ++
>  target/s390x/Kconfig      |  2 ++
>  target/sh4/Kconfig        |  2 ++
>  target/sparc/Kconfig      |  5 +++++
>  target/tilegx/Kconfig     |  2 ++
>  target/tricore/Kconfig    |  2 ++
>  target/unicore32/Kconfig  |  2 ++
>  target/xtensa/Kconfig     |  2 ++
>  26 files changed, 92 insertions(+), 1 deletion(-)
>  create mode 100644 target/Kconfig
>  create mode 100644 target/alpha/Kconfig
>  create mode 100644 target/arm/Kconfig
>  create mode 100644 target/avr/Kconfig
>  create mode 100644 target/cris/Kconfig
>  create mode 100644 target/hppa/Kconfig
>  create mode 100644 target/i386/Kconfig
>  create mode 100644 target/lm32/Kconfig
>  create mode 100644 target/m68k/Kconfig
>  create mode 100644 target/microblaze/Kconfig
>  create mode 100644 target/mips/Kconfig
>  create mode 100644 target/moxie/Kconfig
>  create mode 100644 target/nios2/Kconfig
>  create mode 100644 target/openrisc/Kconfig
>  create mode 100644 target/ppc/Kconfig
>  create mode 100644 target/riscv/Kconfig
>  create mode 100644 target/rx/Kconfig
>  create mode 100644 target/s390x/Kconfig
>  create mode 100644 target/sh4/Kconfig
>  create mode 100644 target/sparc/Kconfig
>  create mode 100644 target/tilegx/Kconfig
>  create mode 100644 target/tricore/Kconfig
>  create mode 100644 target/unicore32/Kconfig
>  create mode 100644 target/xtensa/Kconfig
>
> diff --git a/meson.build b/meson.build
> index f00b7754fd4..a2dda0ce95e 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1322,7 +1322,8 @@
>        command: [minikconf,
>                  get_option('default_devices') ? '--defconfig' :
> '--allnoconfig',
>                  config_devices_mak, '@DEPFILE@', '@INPUT@',
> -                host_kconfig, accel_kconfig])
> +                host_kconfig, accel_kconfig,
> +                'CONFIG_' + config_target['TARGET_ARCH'].to_upper() +
> '=3Dy'])
>
>      config_devices_data =3D configuration_data()
>      config_devices =3D keyval.load(config_devices_mak)
> diff --git a/Kconfig b/Kconfig
> index bf694c42afe..c01e261e4e9 100644
> --- a/Kconfig
> +++ b/Kconfig
> @@ -1,4 +1,5 @@
>  source Kconfig.host
>  source backends/Kconfig
>  source accel/Kconfig
> +source target/Kconfig
>  source hw/Kconfig
> diff --git a/target/Kconfig b/target/Kconfig
> new file mode 100644
> index 00000000000..a6f719f223a
> --- /dev/null
> +++ b/target/Kconfig
> @@ -0,0 +1,23 @@
> +source alpha/Kconfig
> +source arm/Kconfig
> +source avr/Kconfig
> +source cris/Kconfig
> +source hppa/Kconfig
> +source i386/Kconfig
> +source lm32/Kconfig
> +source m68k/Kconfig
> +source microblaze/Kconfig
> +source mips/Kconfig
> +source moxie/Kconfig
> +source nios2/Kconfig
> +source openrisc/Kconfig
> +source ppc/Kconfig
> +source riscv/Kconfig
> +source rx/Kconfig
> +source s390x/Kconfig
> +source sh4/Kconfig
> +source sparc/Kconfig
> +source tilegx/Kconfig
> +source tricore/Kconfig
> +source unicore32/Kconfig
> +source xtensa/Kconfig
> diff --git a/target/alpha/Kconfig b/target/alpha/Kconfig
> new file mode 100644
> index 00000000000..267222c05b8
> --- /dev/null
> +++ b/target/alpha/Kconfig
> @@ -0,0 +1,2 @@
> +config ALPHA
> +    bool
> diff --git a/target/arm/Kconfig b/target/arm/Kconfig
> new file mode 100644
> index 00000000000..3f3394a22b2
> --- /dev/null
> +++ b/target/arm/Kconfig
> @@ -0,0 +1,6 @@
> +config ARM
> +    bool
> +
> +config AARCH64
> +    bool
> +    select ARM
> diff --git a/target/avr/Kconfig b/target/avr/Kconfig
> new file mode 100644
> index 00000000000..155592d3537
> --- /dev/null
> +++ b/target/avr/Kconfig
> @@ -0,0 +1,2 @@
> +config AVR
> +    bool
> diff --git a/target/cris/Kconfig b/target/cris/Kconfig
> new file mode 100644
> index 00000000000..3fdc309fbbd
> --- /dev/null
> +++ b/target/cris/Kconfig
> @@ -0,0 +1,2 @@
> +config CRIS
> +    bool
> diff --git a/target/hppa/Kconfig b/target/hppa/Kconfig
> new file mode 100644
> index 00000000000..395a35d799c
> --- /dev/null
> +++ b/target/hppa/Kconfig
> @@ -0,0 +1,2 @@
> +config HPPA
> +    bool
> diff --git a/target/i386/Kconfig b/target/i386/Kconfig
> new file mode 100644
> index 00000000000..ce6968906ee
> --- /dev/null
> +++ b/target/i386/Kconfig
> @@ -0,0 +1,5 @@
> +config I386
> +    bool
> +
> +config X86_64
> +    bool
> diff --git a/target/lm32/Kconfig b/target/lm32/Kconfig
> new file mode 100644
> index 00000000000..09de5b703a3
> --- /dev/null
> +++ b/target/lm32/Kconfig
> @@ -0,0 +1,2 @@
> +config LM32
> +    bool
> diff --git a/target/m68k/Kconfig b/target/m68k/Kconfig
> new file mode 100644
> index 00000000000..23debad519a
> --- /dev/null
> +++ b/target/m68k/Kconfig
> @@ -0,0 +1,2 @@
> +config M68K
> +    bool
> diff --git a/target/microblaze/Kconfig b/target/microblaze/Kconfig
> new file mode 100644
> index 00000000000..a5410d9218d
> --- /dev/null
> +++ b/target/microblaze/Kconfig
> @@ -0,0 +1,2 @@
> +config MICROBLAZE
> +    bool
> diff --git a/target/mips/Kconfig b/target/mips/Kconfig
> new file mode 100644
> index 00000000000..6adf1453548
> --- /dev/null
> +++ b/target/mips/Kconfig
> @@ -0,0 +1,6 @@
> +config MIPS
> +    bool
> +
> +config MIPS64
> +    bool
> +    select MIPS
> diff --git a/target/moxie/Kconfig b/target/moxie/Kconfig
> new file mode 100644
> index 00000000000..52391bbd289
> --- /dev/null
> +++ b/target/moxie/Kconfig
> @@ -0,0 +1,2 @@
> +config MOXIE
> +    bool
> diff --git a/target/nios2/Kconfig b/target/nios2/Kconfig
> new file mode 100644
> index 00000000000..1529ab8950d
> --- /dev/null
> +++ b/target/nios2/Kconfig
> @@ -0,0 +1,2 @@
> +config NIOS2
> +    bool
> diff --git a/target/openrisc/Kconfig b/target/openrisc/Kconfig
> new file mode 100644
> index 00000000000..e0da4ac1dfc
> --- /dev/null
> +++ b/target/openrisc/Kconfig
> @@ -0,0 +1,2 @@
> +config OPENRISC
> +    bool
> diff --git a/target/ppc/Kconfig b/target/ppc/Kconfig
> new file mode 100644
> index 00000000000..3ff152051a3
> --- /dev/null
> +++ b/target/ppc/Kconfig
> @@ -0,0 +1,5 @@
> +config PPC
> +    bool
> +
> +config PPC64
> +    bool
> diff --git a/target/riscv/Kconfig b/target/riscv/Kconfig
> new file mode 100644
> index 00000000000..b9e5932f13f
> --- /dev/null
> +++ b/target/riscv/Kconfig
> @@ -0,0 +1,5 @@
> +config RISCV32
> +    bool
> +
> +config RISCV64
> +    bool
> diff --git a/target/rx/Kconfig b/target/rx/Kconfig
> new file mode 100644
> index 00000000000..aceb5ed28fe
> --- /dev/null
> +++ b/target/rx/Kconfig
> @@ -0,0 +1,2 @@
> +config RX
> +    bool
> diff --git a/target/s390x/Kconfig b/target/s390x/Kconfig
> new file mode 100644
> index 00000000000..72da48136c6
> --- /dev/null
> +++ b/target/s390x/Kconfig
> @@ -0,0 +1,2 @@
> +config S390X
> +    bool
> diff --git a/target/sh4/Kconfig b/target/sh4/Kconfig
> new file mode 100644
> index 00000000000..2397c860280
> --- /dev/null
> +++ b/target/sh4/Kconfig
> @@ -0,0 +1,2 @@
> +config SH4
> +    bool
> diff --git a/target/sparc/Kconfig b/target/sparc/Kconfig
> new file mode 100644
> index 00000000000..70cc0f3a210
> --- /dev/null
> +++ b/target/sparc/Kconfig
> @@ -0,0 +1,5 @@
> +config SPARC
> +    bool
> +
> +config SPARC64
> +    bool
> diff --git a/target/tilegx/Kconfig b/target/tilegx/Kconfig
> new file mode 100644
> index 00000000000..aad882826ab
> --- /dev/null
> +++ b/target/tilegx/Kconfig
> @@ -0,0 +1,2 @@
> +config TILEGX
> +    bool
> diff --git a/target/tricore/Kconfig b/target/tricore/Kconfig
> new file mode 100644
> index 00000000000..93134093093
> --- /dev/null
> +++ b/target/tricore/Kconfig
> @@ -0,0 +1,2 @@
> +config TRICORE
> +    bool
> diff --git a/target/unicore32/Kconfig b/target/unicore32/Kconfig
> new file mode 100644
> index 00000000000..62c9d10b38f
> --- /dev/null
> +++ b/target/unicore32/Kconfig
> @@ -0,0 +1,2 @@
> +config UNICORE32
> +    bool
> diff --git a/target/xtensa/Kconfig b/target/xtensa/Kconfig
> new file mode 100644
> index 00000000000..a3c8dc7f6d7
> --- /dev/null
> +++ b/target/xtensa/Kconfig
> @@ -0,0 +1,2 @@
> +config XTENSA
> +    bool
> --
> 2.26.2
>
>

--00000000000044447605ba30b361
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">=D0=B2=D1=81, 31 =D1=8F=D0=BD=D0=B2. 2021 =D0=B3., 12:=
13 Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug=
@amsat.org</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Add a target-sp=
ecific Kconfig.<br>
<br>
Target foo now has CONFIG_FOO defined.<br>
<br>
Two architecture have a particularity, ARM and MIPS:<br>
their 64-bit version include the 32-bit subset.<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsa=
t.org" target=3D"_blank" rel=3D"noreferrer">f4bug@amsat.org</a>&gt;<br></bl=
ockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto"><div cla=
ss=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"></blockquote></div></div>=
<div dir=3D"auto">For SPARC part:</div><div dir=3D"auto">Acked-by: Artyom T=
arasenko &lt;<a href=3D"mailto:atar4qemu@gmail.com">atar4qemu@gmail.com</a>=
&gt;</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail=
_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">
---<br>
I suppose X86_64 should also select I386?<br>
No clue about PPC/RISCV.<br>
---<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 3 ++-<br>
=C2=A0Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 1 +<br>
=C2=A0target/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 23 ++++++++=
+++++++++++++++<br>
=C2=A0target/alpha/Kconfig=C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 ++<br>
=C2=A0target/arm/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 ++++++<br>
=C2=A0target/avr/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 ++<br>
=C2=A0target/cris/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 ++<br>
=C2=A0target/hppa/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 ++<br>
=C2=A0target/i386/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 5 +++++<br>
=C2=A0target/lm32/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 ++<br>
=C2=A0target/m68k/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 ++<br>
=C2=A0target/microblaze/Kconfig |=C2=A0 2 ++<br>
=C2=A0target/mips/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 ++++++<br>
=C2=A0target/moxie/Kconfig=C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 ++<br>
=C2=A0target/nios2/Kconfig=C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 ++<br>
=C2=A0target/openrisc/Kconfig=C2=A0 =C2=A0|=C2=A0 2 ++<br>
=C2=A0target/ppc/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 5 +++++<br>
=C2=A0target/riscv/Kconfig=C2=A0 =C2=A0 =C2=A0 |=C2=A0 5 +++++<br>
=C2=A0target/rx/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 ++<br>
=C2=A0target/s390x/Kconfig=C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 ++<br>
=C2=A0target/sh4/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 ++<br>
=C2=A0target/sparc/Kconfig=C2=A0 =C2=A0 =C2=A0 |=C2=A0 5 +++++<br>
=C2=A0target/tilegx/Kconfig=C2=A0 =C2=A0 =C2=A0|=C2=A0 2 ++<br>
=C2=A0target/tricore/Kconfig=C2=A0 =C2=A0 |=C2=A0 2 ++<br>
=C2=A0target/unicore32/Kconfig=C2=A0 |=C2=A0 2 ++<br>
=C2=A0target/xtensa/Kconfig=C2=A0 =C2=A0 =C2=A0|=C2=A0 2 ++<br>
=C2=A026 files changed, 92 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 target/Kconfig<br>
=C2=A0create mode 100644 target/alpha/Kconfig<br>
=C2=A0create mode 100644 target/arm/Kconfig<br>
=C2=A0create mode 100644 target/avr/Kconfig<br>
=C2=A0create mode 100644 target/cris/Kconfig<br>
=C2=A0create mode 100644 target/hppa/Kconfig<br>
=C2=A0create mode 100644 target/i386/Kconfig<br>
=C2=A0create mode 100644 target/lm32/Kconfig<br>
=C2=A0create mode 100644 target/m68k/Kconfig<br>
=C2=A0create mode 100644 target/microblaze/Kconfig<br>
=C2=A0create mode 100644 target/mips/Kconfig<br>
=C2=A0create mode 100644 target/moxie/Kconfig<br>
=C2=A0create mode 100644 target/nios2/Kconfig<br>
=C2=A0create mode 100644 target/openrisc/Kconfig<br>
=C2=A0create mode 100644 target/ppc/Kconfig<br>
=C2=A0create mode 100644 target/riscv/Kconfig<br>
=C2=A0create mode 100644 target/rx/Kconfig<br>
=C2=A0create mode 100644 target/s390x/Kconfig<br>
=C2=A0create mode 100644 target/sh4/Kconfig<br>
=C2=A0create mode 100644 target/sparc/Kconfig<br>
=C2=A0create mode 100644 target/tilegx/Kconfig<br>
=C2=A0create mode 100644 target/tricore/Kconfig<br>
=C2=A0create mode 100644 target/unicore32/Kconfig<br>
=C2=A0create mode 100644 target/xtensa/Kconfig<br>
<br>
diff --git a/meson.build b/meson.build<br>
index f00b7754fd4..a2dda0ce95e 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -1322,7 +1322,8 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0command: [minikconf,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0get_option(&#=
39;default_devices&#39;) ? &#39;--defconfig&#39; : &#39;--allnoconfig&#39;,=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0config_device=
s_mak, &#39;@DEPFILE@&#39;, &#39;@INPUT@&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 host_kconfig, acce=
l_kconfig])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 host_kconfig, acce=
l_kconfig,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;CONFIG_&#39; =
+ config_target[&#39;TARGET_ARCH&#39;].to_upper() + &#39;=3Dy&#39;])<br>
<br>
=C2=A0 =C2=A0 =C2=A0config_devices_data =3D configuration_data()<br>
=C2=A0 =C2=A0 =C2=A0config_devices =3D keyval.load(config_devices_mak)<br>
diff --git a/Kconfig b/Kconfig<br>
index bf694c42afe..c01e261e4e9 100644<br>
--- a/Kconfig<br>
+++ b/Kconfig<br>
@@ -1,4 +1,5 @@<br>
=C2=A0source Kconfig.host<br>
=C2=A0source backends/Kconfig<br>
=C2=A0source accel/Kconfig<br>
+source target/Kconfig<br>
=C2=A0source hw/Kconfig<br>
diff --git a/target/Kconfig b/target/Kconfig<br>
new file mode 100644<br>
index 00000000000..a6f719f223a<br>
--- /dev/null<br>
+++ b/target/Kconfig<br>
@@ -0,0 +1,23 @@<br>
+source alpha/Kconfig<br>
+source arm/Kconfig<br>
+source avr/Kconfig<br>
+source cris/Kconfig<br>
+source hppa/Kconfig<br>
+source i386/Kconfig<br>
+source lm32/Kconfig<br>
+source m68k/Kconfig<br>
+source microblaze/Kconfig<br>
+source mips/Kconfig<br>
+source moxie/Kconfig<br>
+source nios2/Kconfig<br>
+source openrisc/Kconfig<br>
+source ppc/Kconfig<br>
+source riscv/Kconfig<br>
+source rx/Kconfig<br>
+source s390x/Kconfig<br>
+source sh4/Kconfig<br>
+source sparc/Kconfig<br>
+source tilegx/Kconfig<br>
+source tricore/Kconfig<br>
+source unicore32/Kconfig<br>
+source xtensa/Kconfig<br>
diff --git a/target/alpha/Kconfig b/target/alpha/Kconfig<br>
new file mode 100644<br>
index 00000000000..267222c05b8<br>
--- /dev/null<br>
+++ b/target/alpha/Kconfig<br>
@@ -0,0 +1,2 @@<br>
+config ALPHA<br>
+=C2=A0 =C2=A0 bool<br>
diff --git a/target/arm/Kconfig b/target/arm/Kconfig<br>
new file mode 100644<br>
index 00000000000..3f3394a22b2<br>
--- /dev/null<br>
+++ b/target/arm/Kconfig<br>
@@ -0,0 +1,6 @@<br>
+config ARM<br>
+=C2=A0 =C2=A0 bool<br>
+<br>
+config AARCH64<br>
+=C2=A0 =C2=A0 bool<br>
+=C2=A0 =C2=A0 select ARM<br>
diff --git a/target/avr/Kconfig b/target/avr/Kconfig<br>
new file mode 100644<br>
index 00000000000..155592d3537<br>
--- /dev/null<br>
+++ b/target/avr/Kconfig<br>
@@ -0,0 +1,2 @@<br>
+config AVR<br>
+=C2=A0 =C2=A0 bool<br>
diff --git a/target/cris/Kconfig b/target/cris/Kconfig<br>
new file mode 100644<br>
index 00000000000..3fdc309fbbd<br>
--- /dev/null<br>
+++ b/target/cris/Kconfig<br>
@@ -0,0 +1,2 @@<br>
+config CRIS<br>
+=C2=A0 =C2=A0 bool<br>
diff --git a/target/hppa/Kconfig b/target/hppa/Kconfig<br>
new file mode 100644<br>
index 00000000000..395a35d799c<br>
--- /dev/null<br>
+++ b/target/hppa/Kconfig<br>
@@ -0,0 +1,2 @@<br>
+config HPPA<br>
+=C2=A0 =C2=A0 bool<br>
diff --git a/target/i386/Kconfig b/target/i386/Kconfig<br>
new file mode 100644<br>
index 00000000000..ce6968906ee<br>
--- /dev/null<br>
+++ b/target/i386/Kconfig<br>
@@ -0,0 +1,5 @@<br>
+config I386<br>
+=C2=A0 =C2=A0 bool<br>
+<br>
+config X86_64<br>
+=C2=A0 =C2=A0 bool<br>
diff --git a/target/lm32/Kconfig b/target/lm32/Kconfig<br>
new file mode 100644<br>
index 00000000000..09de5b703a3<br>
--- /dev/null<br>
+++ b/target/lm32/Kconfig<br>
@@ -0,0 +1,2 @@<br>
+config LM32<br>
+=C2=A0 =C2=A0 bool<br>
diff --git a/target/m68k/Kconfig b/target/m68k/Kconfig<br>
new file mode 100644<br>
index 00000000000..23debad519a<br>
--- /dev/null<br>
+++ b/target/m68k/Kconfig<br>
@@ -0,0 +1,2 @@<br>
+config M68K<br>
+=C2=A0 =C2=A0 bool<br>
diff --git a/target/microblaze/Kconfig b/target/microblaze/Kconfig<br>
new file mode 100644<br>
index 00000000000..a5410d9218d<br>
--- /dev/null<br>
+++ b/target/microblaze/Kconfig<br>
@@ -0,0 +1,2 @@<br>
+config MICROBLAZE<br>
+=C2=A0 =C2=A0 bool<br>
diff --git a/target/mips/Kconfig b/target/mips/Kconfig<br>
new file mode 100644<br>
index 00000000000..6adf1453548<br>
--- /dev/null<br>
+++ b/target/mips/Kconfig<br>
@@ -0,0 +1,6 @@<br>
+config MIPS<br>
+=C2=A0 =C2=A0 bool<br>
+<br>
+config MIPS64<br>
+=C2=A0 =C2=A0 bool<br>
+=C2=A0 =C2=A0 select MIPS<br>
diff --git a/target/moxie/Kconfig b/target/moxie/Kconfig<br>
new file mode 100644<br>
index 00000000000..52391bbd289<br>
--- /dev/null<br>
+++ b/target/moxie/Kconfig<br>
@@ -0,0 +1,2 @@<br>
+config MOXIE<br>
+=C2=A0 =C2=A0 bool<br>
diff --git a/target/nios2/Kconfig b/target/nios2/Kconfig<br>
new file mode 100644<br>
index 00000000000..1529ab8950d<br>
--- /dev/null<br>
+++ b/target/nios2/Kconfig<br>
@@ -0,0 +1,2 @@<br>
+config NIOS2<br>
+=C2=A0 =C2=A0 bool<br>
diff --git a/target/openrisc/Kconfig b/target/openrisc/Kconfig<br>
new file mode 100644<br>
index 00000000000..e0da4ac1dfc<br>
--- /dev/null<br>
+++ b/target/openrisc/Kconfig<br>
@@ -0,0 +1,2 @@<br>
+config OPENRISC<br>
+=C2=A0 =C2=A0 bool<br>
diff --git a/target/ppc/Kconfig b/target/ppc/Kconfig<br>
new file mode 100644<br>
index 00000000000..3ff152051a3<br>
--- /dev/null<br>
+++ b/target/ppc/Kconfig<br>
@@ -0,0 +1,5 @@<br>
+config PPC<br>
+=C2=A0 =C2=A0 bool<br>
+<br>
+config PPC64<br>
+=C2=A0 =C2=A0 bool<br>
diff --git a/target/riscv/Kconfig b/target/riscv/Kconfig<br>
new file mode 100644<br>
index 00000000000..b9e5932f13f<br>
--- /dev/null<br>
+++ b/target/riscv/Kconfig<br>
@@ -0,0 +1,5 @@<br>
+config RISCV32<br>
+=C2=A0 =C2=A0 bool<br>
+<br>
+config RISCV64<br>
+=C2=A0 =C2=A0 bool<br>
diff --git a/target/rx/Kconfig b/target/rx/Kconfig<br>
new file mode 100644<br>
index 00000000000..aceb5ed28fe<br>
--- /dev/null<br>
+++ b/target/rx/Kconfig<br>
@@ -0,0 +1,2 @@<br>
+config RX<br>
+=C2=A0 =C2=A0 bool<br>
diff --git a/target/s390x/Kconfig b/target/s390x/Kconfig<br>
new file mode 100644<br>
index 00000000000..72da48136c6<br>
--- /dev/null<br>
+++ b/target/s390x/Kconfig<br>
@@ -0,0 +1,2 @@<br>
+config S390X<br>
+=C2=A0 =C2=A0 bool<br>
diff --git a/target/sh4/Kconfig b/target/sh4/Kconfig<br>
new file mode 100644<br>
index 00000000000..2397c860280<br>
--- /dev/null<br>
+++ b/target/sh4/Kconfig<br>
@@ -0,0 +1,2 @@<br>
+config SH4<br>
+=C2=A0 =C2=A0 bool<br>
diff --git a/target/sparc/Kconfig b/target/sparc/Kconfig<br>
new file mode 100644<br>
index 00000000000..70cc0f3a210<br>
--- /dev/null<br>
+++ b/target/sparc/Kconfig<br>
@@ -0,0 +1,5 @@<br>
+config SPARC<br>
+=C2=A0 =C2=A0 bool<br>
+<br>
+config SPARC64<br>
+=C2=A0 =C2=A0 bool<br>
diff --git a/target/tilegx/Kconfig b/target/tilegx/Kconfig<br>
new file mode 100644<br>
index 00000000000..aad882826ab<br>
--- /dev/null<br>
+++ b/target/tilegx/Kconfig<br>
@@ -0,0 +1,2 @@<br>
+config TILEGX<br>
+=C2=A0 =C2=A0 bool<br>
diff --git a/target/tricore/Kconfig b/target/tricore/Kconfig<br>
new file mode 100644<br>
index 00000000000..93134093093<br>
--- /dev/null<br>
+++ b/target/tricore/Kconfig<br>
@@ -0,0 +1,2 @@<br>
+config TRICORE<br>
+=C2=A0 =C2=A0 bool<br>
diff --git a/target/unicore32/Kconfig b/target/unicore32/Kconfig<br>
new file mode 100644<br>
index 00000000000..62c9d10b38f<br>
--- /dev/null<br>
+++ b/target/unicore32/Kconfig<br>
@@ -0,0 +1,2 @@<br>
+config UNICORE32<br>
+=C2=A0 =C2=A0 bool<br>
diff --git a/target/xtensa/Kconfig b/target/xtensa/Kconfig<br>
new file mode 100644<br>
index 00000000000..a3c8dc7f6d7<br>
--- /dev/null<br>
+++ b/target/xtensa/Kconfig<br>
@@ -0,0 +1,2 @@<br>
+config XTENSA<br>
+=C2=A0 =C2=A0 bool<br>
-- <br>
2.26.2<br>
<br>
</blockquote></div></div></div>

--00000000000044447605ba30b361--

