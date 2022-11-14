Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ouO84-0007pT-3Z
	for mharc-qemu-riscv@gnu.org; Sun, 13 Nov 2022 20:19:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ouO82-0007pB-JC; Sun, 13 Nov 2022 20:19:14 -0500
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ouO80-0004zP-G7; Sun, 13 Nov 2022 20:19:14 -0500
Received: by mail-vs1-xe36.google.com with SMTP id d185so10143386vsd.0;
 Sun, 13 Nov 2022 17:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ms2A5ZgoU6HBQMxpJjTZDXlrQMLiMlo7hi3HMn4tt1c=;
 b=IrFOnD0f27H+3Mjn77TLjPyJgbTCEWurmbFyeIHuKAOyRCKDUHzcfRa43UpANhiUTu
 3eloodUEr7z2lyHB2SqrOk8PfrV8BvHb5nAyIS8h85cy9b1hJaMRicTUqJvcS93ptlf5
 vTsnJnUZIse8QTf1QtwmskV5z/3PkFTr1bL7gZALiJxpu3eEAlfLAyucSXaorAlh67nr
 1A/Zpod7xPH0IsMMHFJ7uABMkFqvgU7ITaDgEYmzKQrnK/d1U2nn/JaZ064Sw5kP6aBR
 PpfRV0ahMlUfwwVuAjSjhq6xJQZf23PWARZ0y6VpgTZIErIvu6s9AOEtbUm/JGT/jWla
 T7kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ms2A5ZgoU6HBQMxpJjTZDXlrQMLiMlo7hi3HMn4tt1c=;
 b=R6nq/4aRK7FY1G8f9BqfRMPmkSAJ6HtCQveYsDGewQP+6+0ax1lm6jvMKvZ4ENI59b
 UtonXtkgg8V1LR2kMknw6YBWRe1Rcn0P+tRE9GhKK9llkFpAvw4f7TD29ygXVzJlG8jk
 4Jy8sS4VVNazGT4cm+Bj/jcKlpcIYJisVs6rRHaPjq0WyXA+DRXFO6q3aNG8uQJFUnNj
 Xj1X0D6dIAVNzqv08oasgbx34RxTKAo2woDc7YBtBJ7mmEVEpuym8AtVYZASXLcKz/Kt
 y07W7djxj5mB9sfdsb+R2qTYhG4fHYx1HG7beFCyBzjDk+sMQijz4h3l+oqC4TWgn0Hm
 p4Hw==
X-Gm-Message-State: ANoB5pnEURuccYDHIFRAC3rd+3L7YkdrRx6wJKyFWkhg9p+zmyQGjmfp
 71Jd/2VB4WP+VOx0Sc6YNArLPE9TTOPqQh4sfA8=
X-Google-Smtp-Source: AA0mqf5uv8GWAAZlpiW+2ExSi0q2XH6Bz8fTQoSsucmsTUoZom9pibEMTHhnqfAC+KbDyh6I0H1W7YUEvHCSnB3oQQs=
X-Received: by 2002:a67:fb19:0:b0:3a6:fde0:cf74 with SMTP id
 d25-20020a67fb19000000b003a6fde0cf74mr4644732vsr.73.1668388750642; Sun, 13
 Nov 2022 17:19:10 -0800 (PST)
MIME-Version: 1.0
References: <20221111121913.1531030-1-frederic.petrot@univ-grenoble-alpes.fr>
In-Reply-To: <20221111121913.1531030-1-frederic.petrot@univ-grenoble-alpes.fr>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 14 Nov 2022 11:18:44 +1000
Message-ID: <CAKmqyKODzdSWPn8O7i1meVDdjKEQ-5G427a2nX-BdT4aK4U1fg@mail.gmail.com>
Subject: Re: [PATCH] hw/intc: sifive_plic: Renumber the S irqs for numa support
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Cc: Alistair.Francis@wdc.com, bin.meng@windriver.com, palmer@dabbelt.com, 
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e36;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe36.google.com
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
X-List-Received-Date: Mon, 14 Nov 2022 01:19:14 -0000

On Fri, Nov 11, 2022 at 10:20 PM Fr=C3=A9d=C3=A9ric P=C3=A9trot
<frederic.petrot@univ-grenoble-alpes.fr> wrote:
>
> Commit 40244040 changed the way the S irqs are numbered. This breaks when
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
> Signed-off-by: Fr=C3=A9d=C3=A9ric P=C3=A9trot <frederic.petrot@univ-greno=
ble-alpes.fr>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/intc/sifive_plic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
> index c2dfacf028..89d2122742 100644
> --- a/hw/intc/sifive_plic.c
> +++ b/hw/intc/sifive_plic.c
> @@ -480,7 +480,7 @@ DeviceState *sifive_plic_create(hwaddr addr, char *ha=
rt_config,
>                                    qdev_get_gpio_in(DEVICE(cpu), IRQ_M_EX=
T));
>          }
>          if (plic->addr_config[i].mode =3D=3D PLICMode_S) {
> -            qdev_connect_gpio_out(dev, cpu_num,
> +            qdev_connect_gpio_out(dev, cpu_num - plic->hartid_base,
>                                    qdev_get_gpio_in(DEVICE(cpu), IRQ_S_EX=
T));
>          }
>      }
> --
> 2.37.2
>
>

