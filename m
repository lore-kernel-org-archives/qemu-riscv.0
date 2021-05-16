Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1liPWx-0007UQ-Kl
	for mharc-qemu-riscv@gnu.org; Sun, 16 May 2021 18:46:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1liPWv-0007Ru-Uz; Sun, 16 May 2021 18:46:37 -0400
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:33530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1liPWr-0002eM-Iw; Sun, 16 May 2021 18:46:37 -0400
Received: by mail-io1-xd33.google.com with SMTP id a11so4101290ioo.0;
 Sun, 16 May 2021 15:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SVq7rCX1Nt6I69+YxioxOEgdvhLNMKstfcwXywvERhQ=;
 b=eyS8yGPbWBgkPB6qBsEk0YiDe1M5SwYrfG8BPUw0gPJsT+roxQZCFAMOdeiBYrlqph
 llBfvrNlTgIdmcKD4g3kmllL8/3sFrgz/YX/zmfpZ/GyN1JOjgIK8Xgq5gzUTAVIqLAE
 KIdMLM8sYjGrmfM7YqixuuwqJFDVrwFHztr559kP8NAdKtii23eNjozzx5h1sSUlqn15
 gzTSk5LqMXfGHCuQnTLOWdc55bvYR9xHGLm3ZDs0fnhMhJTJux6DLy9Z+65xjfjZlG+6
 N2nsjHAmqZLuEWxkr2kV1+TMR0gKSJAVOy+V/Ty9jCoAPDYyRr/Vkfk0F7WxDHrwgPhb
 xATw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SVq7rCX1Nt6I69+YxioxOEgdvhLNMKstfcwXywvERhQ=;
 b=K68GDUIlKSK7NVYljpTjks3Bqi6jJCn8+Uk9LqQwpB6L5vCgjcTG/G7f/I/ZoBl7NL
 VREVQYUcR5jeGCI4x3pjvrrO4TnEv7aQ1u1rE03c8E9D2BBgAvPBnPvDHjt4i8jhZfew
 igJLxZ3nhfrEavQ/ZQfOH7/VZAxZLaLll/ZTHI8JqrUaUE3XUrQOniUmLpiJWtllGB6g
 kG7W5qaC0Aw0ZDXGLp69dzqrNuQR//4UgJLhtfYiDG8m9gjk4gzsI2sjm8ilgjRE+KB8
 j4xLMS3s5220d8oxwBQf9QHII5BoGrj4/NJgs69wSahUhIB48XhwN9Rd0cC2Xe8vnn8T
 2k3A==
X-Gm-Message-State: AOAM530o+pTBbkXKwXojk27XXl5NKDj/l7QRqDTtYb78BfiVFEsUsDlD
 0XVa1G93+DCR5/7SwgjwnAHon1kcMqXpkQ46IO0=
X-Google-Smtp-Source: ABdhPJzRCHT99xJ3JizY+y84lhco1PbTCBqNCaGig+GbqL3R/7fzHxKeTbXpJPhQyrVYBfZwtT6wkAsMqgvFVVkL2mo=
X-Received: by 2002:a05:6602:242b:: with SMTP id
 g11mr41580309iob.105.1621205191712; 
 Sun, 16 May 2021 15:46:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210515173716.358295-1-philmd@redhat.com>
 <20210515173716.358295-8-philmd@redhat.com>
In-Reply-To: <20210515173716.358295-8-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 17 May 2021 08:46:05 +1000
Message-ID: <CAKmqyKMJqMsnTt-_zKaZVedtDxxn3WoymvkeTMPdzZo6VzO33Q@mail.gmail.com>
Subject: Re: [PATCH v2 07/12] hw/riscv/Kconfig: Restrict NUMA to Virt & Spike
 machines
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Bin Meng <bin.meng@windriver.com>, 
 qemu-arm <qemu-arm@nongnu.org>, "open list:New World" <qemu-ppc@nongnu.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Bin Meng <bmeng.cn@gmail.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd33.google.com
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
X-List-Received-Date: Sun, 16 May 2021 22:46:38 -0000

On Sun, May 16, 2021 at 3:47 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Only the Virt and Spike machines use NUMA. Add a RISCV_NUMA Kconfig
> symbol and only have these machines select it. Adapt the Meson file
> to only built it if required.
>
> Acked-by: Paolo Bonzini <pbonzini@redhat.com>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/Kconfig     | 5 +++++
>  hw/riscv/meson.build | 2 +-
>  2 files changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/hw/riscv/Kconfig b/hw/riscv/Kconfig
> index 86957ec7b06..0590f443fdf 100644
> --- a/hw/riscv/Kconfig
> +++ b/hw/riscv/Kconfig
> @@ -1,3 +1,6 @@
> +config RISCV_NUMA
> +    bool
> +
>  config IBEX
>      bool
>
> @@ -34,6 +37,7 @@ config RISCV_VIRT
>      imply PCI_DEVICES
>      imply VIRTIO_VGA
>      imply TEST_DEVICES
> +    select RISCV_NUMA
>      select GOLDFISH_RTC
>      select MSI_NONBROKEN
>      select PCI
> @@ -74,6 +78,7 @@ config SIFIVE_U
>
>  config SPIKE
>      bool
> +    select RISCV_NUMA
>      select HTIF
>      select MSI_NONBROKEN
>      select SIFIVE_CLINT
> diff --git a/hw/riscv/meson.build b/hw/riscv/meson.build
> index a97454661c0..ab6cae57eae 100644
> --- a/hw/riscv/meson.build
> +++ b/hw/riscv/meson.build
> @@ -1,6 +1,6 @@
>  riscv_ss =3D ss.source_set()
>  riscv_ss.add(files('boot.c'), fdt)
> -riscv_ss.add(files('numa.c'))
> +riscv_ss.add(when: 'CONFIG_RISCV_NUMA', if_true: files('numa.c'))
>  riscv_ss.add(files('riscv_hart.c'))
>  riscv_ss.add(when: 'CONFIG_OPENTITAN', if_true: files('opentitan.c'))
>  riscv_ss.add(when: 'CONFIG_RISCV_VIRT', if_true: files('virt.c'))
> --
> 2.26.3
>
>

