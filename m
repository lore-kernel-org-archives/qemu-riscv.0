Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ov8Xw-00022r-Qp
	for mharc-qemu-riscv@gnu.org; Tue, 15 Nov 2022 21:53:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ov8Xv-00022M-E6; Tue, 15 Nov 2022 21:53:03 -0500
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ov8Xs-0000HK-VT; Tue, 15 Nov 2022 21:53:02 -0500
Received: by mail-vs1-xe29.google.com with SMTP id n68so16684420vsc.3;
 Tue, 15 Nov 2022 18:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Id8SW6ayY9IIaWZn87VC9lEfr7681YG6OGi7GUdNPL0=;
 b=DAgTQ3fwID3DddIeIr4wdCKQ+JFejIAr9m7WpyRv+mUuhW4MZO3YT3YFy/kOL+minS
 85w+gu6kh1loisTbhf/8XQR2BCJr6lT8gKVqHvBGZY3pYn7yVleTYADtOZTukFRoL8U8
 AC85QrssD7A5qpseTGVkDHUi2vKXm87ZkucwwOOf94ijoAEA3Q5Ug7VaRv+ZQOcPqH/w
 e+0r505X38jA3DgsWiqb/qW2SOZCxZRZpLKL9AVhZTnQTDeHoTOgBuvWlMU67YGIGw5C
 1e2PkdlgjaOhXfszNtPnpGu4hGNsjmTkAjL9uLUm27SZ/R/O82eKxHhW6Kf5NfdhSAiL
 GUww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Id8SW6ayY9IIaWZn87VC9lEfr7681YG6OGi7GUdNPL0=;
 b=Sqdc0uJ2C/93uRpJhsq7p6y5dxzrov53em+2FLK4jg+E31HYmsQMDvja6/CokpPxKN
 MhzeqrMomHD8/58S0fogCbjK7dI31prKeTjiqnztabcAGoDyPxIu35hJojfc+b//ofgK
 Egt5gbdbPx3rrTeTp97klhJUKGq/Wm5Y7N4bJkTWxfKiH/SZ8UifSvgYRp0lnX3asrzN
 +YTgWvG6gg6uIWR3hz6KaoxyPn7y2Mknk0dyH9rKWjP0m4gzOVAymz/2ojhgP4RO5xVb
 GSGUGn+AmG1kZivXY+sSbbOoCYeiXj2O33xvdHEL5aRdjRG6f4ua/kMYbVvOjqsaj62l
 kHxg==
X-Gm-Message-State: ANoB5pnqvdJJUV0fPxSCnNEP2OfmxvPkyHTSrZMjRrR5sVhFhWRI4WaI
 TXQshkz6Z2d7qQrpweZcL9ci/yvER0yda4RTJvs=
X-Google-Smtp-Source: AA0mqf5LViJtnPz4GrQsxOxeCYSi26gbbd3/rK8xvXwjrDiEkMjZ7OVb7mIZW28BqSyy83Xc7nmPC11ZyqKbc6CJ/zE=
X-Received: by 2002:a67:d60d:0:b0:3a6:eec3:b246 with SMTP id
 n13-20020a67d60d000000b003a6eec3b246mr9729384vsj.64.1668567179326; Tue, 15
 Nov 2022 18:52:59 -0800 (PST)
MIME-Version: 1.0
References: <20221114135122.1668703-1-frederic.petrot@univ-grenoble-alpes.fr>
In-Reply-To: <20221114135122.1668703-1-frederic.petrot@univ-grenoble-alpes.fr>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 16 Nov 2022 12:52:33 +1000
Message-ID: <CAKmqyKM1a5f5nwyMH9ga0SeskbZ46i5VNEEq5920sQK6Zx5syA@mail.gmail.com>
Subject: Re: [PATCH v2] hw/intc: sifive_plic: Renumber the S irqs for numa
 support
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Cc: Alistair.Francis@wdc.com, bin.meng@windriver.com, palmer@dabbelt.com, 
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e29;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe29.google.com
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
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Nov 2022 02:53:03 -0000

On Tue, Nov 15, 2022 at 10:12 AM Fr=C3=A9d=C3=A9ric P=C3=A9trot
<frederic.petrot@univ-grenoble-alpes.fr> wrote:
>
> Commit 40244040a7a changed the way the S irqs are numbered. This breaks w=
hen
> using numa configuration, e.g.:
> ./qemu-system-riscv64 -nographic -machine virt,dumpdtb=3Dnuma-tree.dtb \
>                       -m 2G -smp cpus=3D16 \
>                       -object memory-backend-ram,id=3Dmem0,size=3D512M \
>                       -object memory-backend-ram,id=3Dmem1,size=3D512M \
>                       -object memory-backend-ram,id=3Dmem2,size=3D512M \
>                       -object memory-backend-ram,id=3Dmem3,size=3D512M \
>                       -numa node,cpus=3D0-3,memdev=3Dmem0,nodeid=3D0 \
>                       -numa node,cpus=3D4-7,memdev=3Dmem1,nodeid=3D1 \
>                       -numa node,cpus=3D8-11,memdev=3Dmem2,nodeid=3D2 \
>                       -numa node,cpus=3D12-15,memdev=3Dmem3,nodeid=3D3
> leads to:
> Unexpected error in object_property_find_err() at ../qom/object.c:1304:
> qemu-system-riscv64: Property 'riscv.sifive.plic.unnamed-gpio-out[8]' not
> found
>
> This patch makes the nubering of the S irqs identical to what it was befo=
re.
>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Fr=C3=A9d=C3=A9ric P=C3=A9trot <frederic.petrot@univ-greno=
ble-alpes.fr>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  hw/intc/sifive_plic.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
> index c2dfacf028..b4949bef97 100644
> --- a/hw/intc/sifive_plic.c
> +++ b/hw/intc/sifive_plic.c
> @@ -476,11 +476,11 @@ DeviceState *sifive_plic_create(hwaddr addr, char *=
hart_config,
>          CPUState *cpu =3D qemu_get_cpu(cpu_num);
>
>          if (plic->addr_config[i].mode =3D=3D PLICMode_M) {
> -            qdev_connect_gpio_out(dev, num_harts - plic->hartid_base + c=
pu_num,
> +            qdev_connect_gpio_out(dev, cpu_num - hartid_base + num_harts=
,
>                                    qdev_get_gpio_in(DEVICE(cpu), IRQ_M_EX=
T));
>          }
>          if (plic->addr_config[i].mode =3D=3D PLICMode_S) {
> -            qdev_connect_gpio_out(dev, cpu_num,
> +            qdev_connect_gpio_out(dev, cpu_num - hartid_base,
>                                    qdev_get_gpio_in(DEVICE(cpu), IRQ_S_EX=
T));
>          }
>      }
> --
> 2.37.2
>
>

