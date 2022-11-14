Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ouilu-0006K9-Hx
	for mharc-qemu-riscv@gnu.org; Mon, 14 Nov 2022 18:21:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ouifq-00025D-7A; Mon, 14 Nov 2022 18:15:32 -0500
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ouOwn-00055z-T3; Sun, 13 Nov 2022 21:11:43 -0500
Received: by mail-ua1-x92d.google.com with SMTP id d3so3258102uan.4;
 Sun, 13 Nov 2022 18:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=87K50RB7Km42PyRouFD34QczC0rXy1aMXNKgQm9Birc=;
 b=bp/cAvqoZEgBAAckD4iuNZfNyNYIjUknwe6oMfvwd2TkeXPGW5F3bQhRvtYmPNj8dd
 pjVEnsbImZc+UxJDoIlcwl+1QgnBTElqF20AMabF3t9dUmbXmVCXfBePWa2lrKI6p6te
 2UjUvkwJ01oZOwinxuUyy0TC5zNk1vHBqFB46iESkfgQnx9XIYi5TpAouDqtzjL1z+6o
 arlbkCjWobUntmPy1Y3WfTEp1sPvZIFVPD4EW2cKo56KssQqss/dXFDy1LpN9z6thyA0
 qTH66u6puwji0KarJgfZrc7HIxiFwMQxXwKitKvtLvslOGgwRadgJMTTu8sdtLQ2fc4i
 Fizg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=87K50RB7Km42PyRouFD34QczC0rXy1aMXNKgQm9Birc=;
 b=IZxJky850M4V/uYiSl1Myda6HDARoRxmPz/Im7nsy5ldQomrMZUmL9JRKFgZbOWbav
 8maKVLmoaiQTtpvpmD2sVbklmH4CvIXJaBvaO90vN7+VVDYPbNMA9tv0xwDtcLVCTUYx
 qKiZ3Z4h69Sq+PG0C2uGWEt07N1YILfdLuQ6Y1qEPjyGQsBkqB5jVCSgboldenJP2YCL
 jF7gp/Tsg1JgkqIKhju/NcJXjDgJdsKDyLHFPDTeE91OAnPFxek1RWSupfIPbz3WsPrc
 JpoJhflKJsPlZU0uBvFWxQ+yVzzBwiVb16jXJkV2CzA/KHrFL7+wx3JLcZUFQyHMfcla
 A4LA==
X-Gm-Message-State: ANoB5pl1y+6iQJyjrsSe4T/JMHZhfocNIY5rgMR1PSfgcjo306PvxPH+
 6Wt4JcXTMiDVk1p0y/SPPhz0DLpBvkpgCHzpQ24=
X-Google-Smtp-Source: AA0mqf5RxLFSzmQbQHNnWYH+BvCsCHWwhS9aMJShGEq2T1/U9v4VWH7rzwOXNNVW2SIKC5qWDGmXonqRbJqHwEoP+7c=
X-Received: by 2002:ab0:7047:0:b0:408:fefb:c1a9 with SMTP id
 v7-20020ab07047000000b00408fefbc1a9mr4952880ual.38.1668391899949; Sun, 13 Nov
 2022 18:11:39 -0800 (PST)
MIME-Version: 1.0
References: <20221111121913.1531030-1-frederic.petrot@univ-grenoble-alpes.fr>
In-Reply-To: <20221111121913.1531030-1-frederic.petrot@univ-grenoble-alpes.fr>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 14 Nov 2022 12:11:13 +1000
Message-ID: <CAKmqyKPYKiPK=gKu2gfF=LGeCL2aK7C9Be5rdSjo09WEPeEquA@mail.gmail.com>
Subject: Re: [PATCH] hw/intc: sifive_plic: Renumber the S irqs for numa support
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Cc: Alistair.Francis@wdc.com, bin.meng@windriver.com, palmer@dabbelt.com, 
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92d;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92d.google.com
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
X-List-Received-Date: Mon, 14 Nov 2022 23:15:38 -0000

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

Thanks!

Applied to riscv-to-apply.next

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

