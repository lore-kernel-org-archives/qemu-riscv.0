Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l6XKq-0001tw-Kp
	for mharc-qemu-riscv@gnu.org; Mon, 01 Feb 2021 06:25:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6XKm-0001s8-8B
 for qemu-riscv@nongnu.org; Mon, 01 Feb 2021 06:25:33 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:36829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6XKa-0006TP-U6
 for qemu-riscv@nongnu.org; Mon, 01 Feb 2021 06:25:29 -0500
Received: by mail-wr1-x42e.google.com with SMTP id 6so16151552wri.3
 for <qemu-riscv@nongnu.org>; Mon, 01 Feb 2021 03:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=BtYlKfrsnNh4hA+DQEQGv1AEXM0dtm5RI6/19VXNZfk=;
 b=NCZmpZtzkdgT3hqCmEnNflNxRjsAkAGZ9NlV1ndwuK0Ds0oZ242H6k4EsX71MF9zxf
 bectxeI/IkIoBcD3pB+pP1CmVMETrxBqAqawuGeWc9AVt72JjgDHsHqqxqUnJx6NXoRf
 P8WRgV+pGPqyCWwvHnE6yz5+D8CSIfeo0Qkg4LJzu5njpTz3/rjKUghi3ax5FKyxUeSl
 qwnIgOGIhfg3AWon6QbTF+gcxNxTiaMEDKObhqNZPNxNzZXnxA8K691RtMpRgRXB5pzu
 8wgqDPm28tvp5f2zM1PVvJNd6WS0GJnJpiFyB7Rgwr0/Li+WhhQFmsT71l5OMX3N9x/1
 /phw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=BtYlKfrsnNh4hA+DQEQGv1AEXM0dtm5RI6/19VXNZfk=;
 b=TIA7RRk54Cz63Lr/bt76mZSXAmilb73H4HJJslz4YVrRhMDMl0IVvm68W2NR3l9xrZ
 ENjzfxgSIzbfK+sHT0QtzSfMVB30tHuKO+h/fZDuSaaMaci9PI/wn28AYHHtTWt5WZqL
 SbVaSt9gnb+ZKD2c/SIfBut4PAoMyXtO1NYqOq/C3wfrOv48f+PWb8SoWRC95Vqd2z55
 5yjeLpXOt2p76YkrMYNRHr/0e73/L+ig/VDj0b0STno4Utv6DpVJm6xQdmpZnDBCB497
 /nl/bJCLaMoE3M7GEvImLjpU0XTwQw3DU1I1aHvro2Acxr3SS5YZYN218EdYKINERdEv
 y1rQ==
X-Gm-Message-State: AOAM531o+jS/KLdT/OBRRx9nq2cqXYad3xi+Bf+zZ4p/k4kqwpp2NYtZ
 QiDWC+uXjmkhIlAUDf5KlVXsbQ==
X-Google-Smtp-Source: ABdhPJwoNmldgZ3etMdsuCVDuUa+fJJbBj9/KHdcOjhUPn6hQsxG2eCVLKW3yfs+w2fSKKOYdMcMzg==
X-Received: by 2002:adf:fd52:: with SMTP id h18mr17784295wrs.295.1612178718699; 
 Mon, 01 Feb 2021 03:25:18 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r11sm2365110wmh.9.2021.02.01.03.25.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 03:25:17 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6AFF81FF7E;
 Mon,  1 Feb 2021 11:25:16 +0000 (GMT)
References: <20210131111316.232778-1-f4bug@amsat.org>
 <20210131111316.232778-6-f4bug@amsat.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Sarah Harris
 <S.E.Harris@kent.ac.uk>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, Eduardo
 Habkost <ehabkost@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, Anthony Green
 <green@moxielogic.com>, Kevin Wolf <kwolf@redhat.com>, Max Reitz
 <mreitz@redhat.com>, Chris Wulff <crwulff@gmail.com>, Guan Xuetao
 <gxt@mprc.pku.edu.cn>, qemu-riscv@nongnu.org, David Hildenbrand
 <david@redhat.com>, qemu-arm@nongnu.org, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, Michael Walle <michael@walle.cc>, Greg
 Kurz <groug@kaod.org>, qemu-ppc@nongnu.org, Peter Maydell
 <peter.maydell@linaro.org>, Stafford Horne <shorne@gmail.com>, Cornelia
 Huck <cohuck@redhat.com>, Marek Vasut <marex@denx.de>, Aleksandar Rikalo
 <aleksandar.rikalo@syrmia.com>, Sagar Karandikar
 <sagark@eecs.berkeley.edu>, Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Thomas Huth
 <thuth@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>, =?utf-8?Q?Mar?=
 =?utf-8?Q?c-Andr=C3=A9?=
 Lureau <marcandre.lureau@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Michael Rolnik <mrolnik@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Alistair Francis <Alistair.Francis@wdc.com>, David Gibson
 <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 05/10] meson: Introduce target-specific Kconfig
Date: Mon, 01 Feb 2021 11:23:55 +0000
In-reply-to: <20210131111316.232778-6-f4bug@amsat.org>
Message-ID: <87eei0vxlv.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 01 Feb 2021 11:25:33 -0000


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> Add a target-specific Kconfig.
>
> Target foo now has CONFIG_FOO defined.
>
> Two architecture have a particularity, ARM and MIPS:
> their 64-bit version include the 32-bit subset.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> I suppose X86_64 should also select I386?
> No clue about PPC/RISCV.
> ---
>  meson.build               |  3 ++-
>  Kconfig                   |  1 +
>  target/Kconfig            | 23 +++++++++++++++++++++++
>  target/alpha/Kconfig      |  2 ++

Repeating myself through the magic of copy and paste:

In docs/devel/kconfig.rst we make the distinction between:

  **subsystems**, of which **buses** are a special case
  **devices**
  **device groups**
  **boards**
  **internal elements**

I think we need to document the target/* Kconfigs in kconfig.rst at the
same time as adding all of these.

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
>                  get_option('default_devices') ? '--defconfig' : '--allno=
config',
>                  config_devices_mak, '@DEPFILE@', '@INPUT@',
> -                host_kconfig, accel_kconfig])
> +                host_kconfig, accel_kconfig,
> +                'CONFIG_' + config_target['TARGET_ARCH'].to_upper() + '=
=3Dy'])
>=20=20
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


--=20
Alex Benn=C3=A9e

