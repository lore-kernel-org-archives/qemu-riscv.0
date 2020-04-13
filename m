Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jO7Pf-0003HJ-1B
	for mharc-qemu-riscv@gnu.org; Mon, 13 Apr 2020 18:18:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45716)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jO7Pb-0003F5-Aw
 for qemu-riscv@nongnu.org; Mon, 13 Apr 2020 18:18:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1jO7Pa-0005Ly-46
 for qemu-riscv@nongnu.org; Mon, 13 Apr 2020 18:18:39 -0400
Received: from mail-vk1-xa43.google.com ([2607:f8b0:4864:20::a43]:35058)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1jO7PS-0005L9-0M; Mon, 13 Apr 2020 18:18:30 -0400
Received: by mail-vk1-xa43.google.com with SMTP id u8so2333827vkl.2;
 Mon, 13 Apr 2020 15:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Xqfg2UOfrtjX2QlezANpKbA9eU75rpqm2Ozq/7avSc0=;
 b=Vs//LplSMj0jTGSs5BBPfQYKXoe29gtamnOyzQ4O/v6WMfhH697NVZas1W6B7Bn9ty
 jpuGSfa2f/RoEUv/DB/BZtqU3RszXNBuQ5elO4bjkiUiJWaYQp4eoPKuLFM0IyRcTZLW
 5SENLTIgkOq3ISDdw7Iw5Gf/wo9XHz2x7aIOZEPUZm7BWpRud5nRgrwoCEjIbHVyTn/S
 K8d+ONFaKXvTpgOW/t92TM1A0q31JNhkMAKzbkmUt6UChB1jGRNZNC/9Htx1FCgb4C2G
 9+L/QdbjHZQxNOAAR3n+I75wQ+u+QTRUyJpEm7Iu9PI38FHalHlWgNsXHORsL3IxggVu
 o1gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Xqfg2UOfrtjX2QlezANpKbA9eU75rpqm2Ozq/7avSc0=;
 b=ljDH6ZR5ECjFn28Lz/xIXEtsfwrGkd0NhhUL9IaXsK40vJF5jSUxg/mcpVdXqCPYAx
 tEl6UHGx/FoabaUqbW3bUhgfx47l3/a+YbllJqHkWbV/H0sRn4w8bzdudddCIauzgVxP
 en0fSOwY6Lf23Vknl8EhCLYolFI7cXZJ3M+J+x3X0454+GL60utc6etGew0dgoWM6Fb2
 aGjQBmyBqE5TSdedXptZ4wibsvysxVXw3JSqkkV1btzdci3kCCpb4ywJfXL/lF1prclI
 XxMGTimqRLbGpwakVyt7S2dPbd9H429kmYPTPWtqEhyK7cFXV2mWrjc98l/QVpVXtwAp
 32Hw==
X-Gm-Message-State: AGi0PuZrvT4TyzjNo9ATCkUyhCvSwHhkK8fTpGMnjXg0FsOw8VYHjmsh
 kWb4kdH2SszMDUZG7EHyjkh85gtnJ+L1jXnBuDA=
X-Google-Smtp-Source: APiQypLzyDOBZozL608qupMxkepFwn/QSjcZy6zpv0qEom/nVYwT8W3kwfR2k1SkAxdgL4UMznqQlNQeIEYH1doqnpc=
X-Received: by 2002:a1f:2e8c:: with SMTP id u134mr13016321vku.16.1586816309527; 
 Mon, 13 Apr 2020 15:18:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200412223619.11284-1-f4bug@amsat.org>
 <20200412223619.11284-21-f4bug@amsat.org>
In-Reply-To: <20200412223619.11284-21-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 13 Apr 2020 15:10:13 -0700
Message-ID: <CAKmqyKN6uKZkkutqeeMGQBgCq8sg_wfRjOM3RvMfDi13b7RbvA@mail.gmail.com>
Subject: Re: [PATCH-for-5.1 v3 20/24] hw/riscv/sifive_u: Use single type_init()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 Jason Wang <jasowang@redhat.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Qemu-block <qemu-block@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Joel Stanley <joel@jms.id.au>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 Eduardo Habkost <ehabkost@redhat.com>, Xie Changlong <xiechanglong.d@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>, 
 qemu-arm <qemu-arm@nongnu.org>, Peter Chubb <peter.chubb@nicta.com.au>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Andrew Jeffery <andrew@aj.id.au>, Wen Congyang <wencongyang2@huawei.com>, 
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 "open list:New World" <qemu-ppc@nongnu.org>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::a43
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
X-List-Received-Date: Mon, 13 Apr 2020 22:18:41 -0000

On Sun, Apr 12, 2020 at 3:48 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> We can use a single type_init() to call multiple type_register*().
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/sifive_u.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
>
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 998666c91f..9c90c94c33 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -601,13 +601,6 @@ static const TypeInfo riscv_sifive_u_soc_type_info =
=3D {
>      .class_init =3D riscv_sifive_u_soc_class_init,
>  };
>
> -static void riscv_sifive_u_soc_register_types(void)
> -{
> -    type_register_static(&riscv_sifive_u_soc_type_info);
> -}
> -
> -type_init(riscv_sifive_u_soc_register_types)
> -
>  static void riscv_sifive_u_machine_class_init(ObjectClass *oc, void *dat=
a)
>  {
>      MachineClass *mc =3D MACHINE_CLASS(oc);
> @@ -627,9 +620,10 @@ static const TypeInfo riscv_sifive_u_machine_typeinf=
o =3D {
>      .instance_size =3D sizeof(SiFiveUState),
>  };
>
> -static void riscv_sifive_u_machine_init_register_types(void)
> +static void riscv_sifive_u_register_types(void)
>  {
> +    type_register_static(&riscv_sifive_u_soc_type_info);
>      type_register_static(&riscv_sifive_u_machine_typeinfo);
>  }
>
> -type_init(riscv_sifive_u_machine_init_register_types)
> +type_init(riscv_sifive_u_register_types)
> --
> 2.21.1
>
>

