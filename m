Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ounAk-0005Ll-8e
	for mharc-qemu-riscv@gnu.org; Mon, 14 Nov 2022 23:03:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ounAi-0005LX-9j; Mon, 14 Nov 2022 23:03:40 -0500
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ounAh-0002G8-0V; Mon, 14 Nov 2022 23:03:40 -0500
Received: by mail-vk1-xa31.google.com with SMTP id g16so5994311vkl.11;
 Mon, 14 Nov 2022 20:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H6nTkbLyaFYTmiH8HhHmv6xAMnUzme0LMawLHlYhgjA=;
 b=p8Y9O4Sm/WsU7AnVTSImq3OYyq0q/XFpGkBbCbZBHQdxW5GSijDCmswaXlFlfOioEj
 4z+mR0SRMB+IH4jLgIGAGq33UZmoQaehuQnosJQGKMd8t7wWFWN7HC50EAV0hEso7Mcn
 gEfb//yOfB1e3q97K6iPmTkLggLc/BU8EOkEobnBUvM8JqdQk8M7mJNpX0daxcumHUQ0
 rUzEjJKYvO3PR+ZFE3t7I7o0x5XPfs8qHbsTAmlxjRpDQRDx6fuQ9163HzU6pTgJJPIx
 OEcjNTx+MEaD+L2LdGqcdXs+ZoeCbT0ajnNfHLePrh1w0qKJebulsLRZMfaUkG/abCQ0
 pejA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H6nTkbLyaFYTmiH8HhHmv6xAMnUzme0LMawLHlYhgjA=;
 b=nVBEf6wjLtQX+RGqC1rccPWdDjDkESpSHEegBzXAX/bGMOvmaGdnoGjbxjwJG1VVO3
 NDdB9wXaOSy1L6trV8in6+gJ7gBk5nSbn5Hh+IsiImXDAzAIhvv3cSLSZBnHVGpRSDkJ
 Cj4KwKKfNzqs/O/Xst90/Qaui7KvHAS2roCZZn5V+iIavguFvUsh/0E2XlOQk8GAYCb6
 IyG3G5kJvk9t32OxtV0OWl6wTbKGOmZP7ZnzGAkdxwVfk9UMmH2gXzmRawkMRdKbJk/S
 MmvhY+A3QEBtvYA6s5oohmp6+pBzN4WFZpbEa5opdaGo67PFqe0I4Y+0lSnTlfxes2P/
 dRHg==
X-Gm-Message-State: ANoB5pljqIbDGaOuolpaZ21KNS5UwrgVa1Q06mTkkKiUeMVnb407fWXx
 IacohQvtETwyIQrazbwBnp2oPFAuM07546AuuXk=
X-Google-Smtp-Source: AA0mqf7E41CgGA8SuiCMEjO7CesLNM0aM/iCXeq0MlTIX2Lz5q+rjW4CAH4/eI7rSZPMNMS/ld9mG8b+YqlcxyHj1Kg=
X-Received: by 2002:a1f:9fcb:0:b0:3bb:eb83:7ab7 with SMTP id
 i194-20020a1f9fcb000000b003bbeb837ab7mr7601996vke.30.1668485017109; Mon, 14
 Nov 2022 20:03:37 -0800 (PST)
MIME-Version: 1.0
References: <20221111121913.1531030-1-frederic.petrot@univ-grenoble-alpes.fr>
 <48729f3f-80eb-8c7b-7bbb-7cd6bfa65a3e@linaro.org>
 <d87890a7-023f-ba7c-4a61-aa085d0134de@univ-grenoble-alpes.fr>
 <ed19482f-e825-ac35-544d-1d2d102d2837@linaro.org>
In-Reply-To: <ed19482f-e825-ac35-544d-1d2d102d2837@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 15 Nov 2022 14:03:10 +1000
Message-ID: <CAKmqyKNiqTfrX_4DkPGTpka3eXgpky6VeW=gKi0iE_3PHgfwWg@mail.gmail.com>
Subject: Re: [PATCH] hw/intc: sifive_plic: Renumber the S irqs for numa support
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, 
 Alistair.Francis@wdc.com, bin.meng@windriver.com, palmer@dabbelt.com, 
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a31;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa31.google.com
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
X-List-Received-Date: Tue, 15 Nov 2022 04:03:40 -0000

On Tue, Nov 15, 2022 at 9:56 AM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> On 14/11/22 11:34, Fr=C3=A9d=C3=A9ric P=C3=A9trot wrote:
> > Le 14/11/2022 =C3=A0 09:40, Philippe Mathieu-Daud=C3=A9 a =C3=A9crit :
> >> On 11/11/22 13:19, Fr=C3=A9d=C3=A9ric P=C3=A9trot wrote:
>
>
> >> Eventually we could unify the style:
> >>
> >> -- >8 --
> >> @@ -476,11 +476,11 @@ DeviceState *sifive_plic_create(hwaddr addr,
> >> char *hart_config,
> >>           CPUState *cpu =3D qemu_get_cpu(cpu_num);
> >>
> >>           if (plic->addr_config[i].mode =3D=3D PLICMode_M) {
> >> -            qdev_connect_gpio_out(dev, num_harts - plic->hartid_base
> >> + cpu_num,
> >> +            qdev_connect_gpio_out(dev, cpu_num - hartid_base +
> >> num_harts,
> >>                                     qdev_get_gpio_in(DEVICE(cpu),
> >> IRQ_M_EXT));
> >>           }
> >>           if (plic->addr_config[i].mode =3D=3D PLICMode_S) {
> >> -            qdev_connect_gpio_out(dev, cpu_num,
> >> +            qdev_connect_gpio_out(dev, cpu_num - hartid_base,hartid_b=
ase
> >>                                     qdev_get_gpio_in(DEVICE(cpu),
> >> IRQ_S_EXT));
> >>           }
> >>       }
> >> ---
> >
> >    IIUC hartid_base is used to set plic->hartid_base, so agreed, along
> > with the
> >    style unification.
> >    I'll send a v2, then.
> >    Since Alistair already queued the patch, how shall I proceed?
>
> I didn't notice Alistair queued (he usually send a notification by
> responding "queued" to the patches). If it is queued, then too late
> (and not a big deal) -- you can still post the v2 and let him pick
> it :)

Yep! I'll drop it from my queue and take the v2

Alistair

>

