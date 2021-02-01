Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l6fMe-0005KV-Fw
	for mharc-qemu-riscv@gnu.org; Mon, 01 Feb 2021 15:00:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l6fMc-0005GG-9n; Mon, 01 Feb 2021 14:59:58 -0500
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133]:41337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l6fMa-0006yc-If; Mon, 01 Feb 2021 14:59:58 -0500
Received: by mail-il1-x133.google.com with SMTP id p15so16130573ilq.8;
 Mon, 01 Feb 2021 11:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GDenK5/Y6Tw0AuufIxmVZZ1MA9L3+vzEFpguQA9Cjls=;
 b=niKCoEfugQ5PK78TwJoKKMSo+2T21jM4fPm8pPUGvLZjL82EAWBjwnsKbjY+HYcyU6
 aJjydNfJFTNsN3hsEOI7ubCpVGS74zVa/YExdywLmb9KDyeZIOCDZgomlvyC45q0zK0i
 S2mgH9PWFbGprjrAbzlO5XkiK8k/DK5GVLzsLjpjRYjC1sB/famY9ULIm/snHaGjKccR
 q6EbAIB+5LsPi7hcUqAoH+WmIvBJiWM2R7eNn+T6ft4Lq+qxEsaxMoaqPRBHvjfaVWhS
 yTBIeig1gn//crqBTFH1NcgANVI5Wyvbl1TeY44s0iFiE+Jbp5yDOZFdTVTj6B0FDJ6k
 gA4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GDenK5/Y6Tw0AuufIxmVZZ1MA9L3+vzEFpguQA9Cjls=;
 b=TLZVpfwp1Qn/llozCxUknDDhdW3edA+gLtUz3m8h/lC+wuq6SMzYi5yQu6E9hm/Ml3
 L9A5zMF2GakLZHxdXEA/wSzhtNZ3C6ZnngHP3r/L1hyfVVOq7XsJttzy5bznUsBRslOc
 jWBV+us5/cJTS7UGWoQokWKwDW6lZ10wh/oU/qawW6WPcFbfjlzGM90pWy5C3StKbs0x
 3QZrVe09K+EM7je7KtKc5EU/lgh4Uhfa/IFhBcYEqe8cJsRdhvEmRuJ7TUgdwn7i6bGr
 qUcx1O/i5fz72Zf0RsiKO9aIKKnz/VadgHO/a1BPjBRO6EoMy1rpzh4sFdWmAaStlNnx
 261g==
X-Gm-Message-State: AOAM532bU9PHmLPdQtkcv+GSJC1IMxBsHpZGqxUutNRWoeBTsg9Htt82
 a/VVVj8bCIkR7EzLahVPF1lGVgCiVyLCX+0pskY=
X-Google-Smtp-Source: ABdhPJwzc0t2XzSS0cYo/LZ3JL+MxIgQ8+UL10QgsFRolJRObMtAeWIIajsriOccHiDvNJLQNtaKuaXteSrX7PanraM=
X-Received: by 2002:a92:cda1:: with SMTP id g1mr14217320ild.267.1612209594110; 
 Mon, 01 Feb 2021 11:59:54 -0800 (PST)
MIME-Version: 1.0
References: <20210131111316.232778-1-f4bug@amsat.org>
 <20210131111316.232778-10-f4bug@amsat.org>
In-Reply-To: <20210131111316.232778-10-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 1 Feb 2021 11:59:25 -0800
Message-ID: <CAKmqyKPukRjL9drhUxeVvL04etQ97AWdWH+SAiOyyBUMJs6sLQ@mail.gmail.com>
Subject: Re: [PATCH 09/10] target: Move ARM_COMPATIBLE_SEMIHOSTING feature to
 target Kconfig
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Peter Maydell <peter.maydell@linaro.org>, Sarah Harris <S.E.Harris@kent.ac.uk>,
 Cornelia Huck <cohuck@redhat.com>, Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Anthony Green <green@moxielogic.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Thomas Huth <thuth@redhat.com>, 
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, 
 Marek Vasut <marex@denx.de>, Qemu-block <qemu-block@nongnu.org>, 
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, 
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Greg Kurz <groug@kaod.org>, qemu-s390x <qemu-s390x@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, 
 Michael Rolnik <mrolnik@gmail.com>, Stafford Horne <shorne@gmail.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, 
 Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>,
 Michael Walle <michael@walle.cc>, 
 "open list:New World" <qemu-ppc@nongnu.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::133;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x133.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Mon, 01 Feb 2021 19:59:59 -0000

On Sun, Jan 31, 2021 at 3:14 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> ARM_COMPATIBLE_SEMIHOSTING is an architecture feature, move its
> declaration to each target/ARCH/.
>
> Note, we do not modify the linux-user targets, as user-mode builds
> don't use Kconfig.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  default-configs/devices/arm-softmmu.mak     | 1 -
>  default-configs/devices/riscv32-softmmu.mak | 1 -
>  default-configs/devices/riscv64-softmmu.mak | 1 -
>  target/arm/Kconfig                          | 1 +
>  target/riscv/Kconfig                        | 2 ++
>  5 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/default-configs/devices/arm-softmmu.mak b/default-configs/de=
vices/arm-softmmu.mak
> index 341d439de6f..0824e9be795 100644
> --- a/default-configs/devices/arm-softmmu.mak
> +++ b/default-configs/devices/arm-softmmu.mak
> @@ -41,5 +41,4 @@ CONFIG_MICROBIT=3Dy
>  CONFIG_FSL_IMX25=3Dy
>  CONFIG_FSL_IMX7=3Dy
>  CONFIG_FSL_IMX6UL=3Dy
> -CONFIG_ARM_COMPATIBLE_SEMIHOSTING=3Dy
>  CONFIG_ALLWINNER_H3=3Dy
> diff --git a/default-configs/devices/riscv32-softmmu.mak b/default-config=
s/devices/riscv32-softmmu.mak
> index 5c9ad2590ef..94a236c9c25 100644
> --- a/default-configs/devices/riscv32-softmmu.mak
> +++ b/default-configs/devices/riscv32-softmmu.mak
> @@ -3,7 +3,6 @@
>  # Uncomment the following lines to disable these optional devices:
>  #
>  #CONFIG_PCI_DEVICES=3Dn
> -CONFIG_ARM_COMPATIBLE_SEMIHOSTING=3Dy
>
>  # Boards:
>  #
> diff --git a/default-configs/devices/riscv64-softmmu.mak b/default-config=
s/devices/riscv64-softmmu.mak
> index d5b2e25b6df..76b61956489 100644
> --- a/default-configs/devices/riscv64-softmmu.mak
> +++ b/default-configs/devices/riscv64-softmmu.mak
> @@ -3,7 +3,6 @@
>  # Uncomment the following lines to disable these optional devices:
>  #
>  #CONFIG_PCI_DEVICES=3Dn
> -CONFIG_ARM_COMPATIBLE_SEMIHOSTING=3Dy
>
>  # Boards:
>  #
> diff --git a/target/arm/Kconfig b/target/arm/Kconfig
> index 1f05de47ca6..ae89d05c7e5 100644
> --- a/target/arm/Kconfig
> +++ b/target/arm/Kconfig
> @@ -1,5 +1,6 @@
>  config ARM
>      bool
> +    select ARM_COMPATIBLE_SEMIHOSTING
>
>  config AARCH64
>      bool
> diff --git a/target/riscv/Kconfig b/target/riscv/Kconfig
> index b9e5932f13f..c3b9d8a1cf1 100644
> --- a/target/riscv/Kconfig
> +++ b/target/riscv/Kconfig
> @@ -1,5 +1,7 @@
>  config RISCV32
>      bool
> +    select ARM_COMPATIBLE_SEMIHOSTING
>
>  config RISCV64
>      bool
> +    select ARM_COMPATIBLE_SEMIHOSTING
> --
> 2.26.2
>
>

