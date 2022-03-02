Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nPGpA-0000Cf-KE
	for mharc-qemu-riscv@gnu.org; Tue, 01 Mar 2022 23:42:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nPGp9-0000Bj-Af; Tue, 01 Mar 2022 23:42:51 -0500
Received: from [2607:f8b0:4864:20::d2b] (port=37834
 helo=mail-io1-xd2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nPGp7-0007p9-MV; Tue, 01 Mar 2022 23:42:50 -0500
Received: by mail-io1-xd2b.google.com with SMTP id c23so585928ioi.4;
 Tue, 01 Mar 2022 20:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Y3ngcrkGTFZru6g+dTbaiNUGQF+v2msRGjtgajmzn5c=;
 b=ol5g3CvFgDEB6czPzmd7KmOPTWiccR3HUpNsuTstiMfuamwKtPM505zUBydmNhi7E3
 OnkG7jvMuyKGvlKsWqLItddhCdBG0nhbxzV9z0ZYUnUzbA2FUwbJUXy+cE0rqDUshb6G
 nknFB5Fg9PMWY7rD8cxsrBL6pbmzRV7FeY8p0wV0yUXDH22XSGarqBig5hKixZK5Hhr9
 H8/BGNoOCqenF9zHy5xv8Xqt6rhbSkMdUgY/9G6wUqy0N9VdW1wZRwyMa0d65SlBeFyo
 o0yM5FU/tKsakfwqk44PbGKdWxXzI6cgF+kVaXywiYeE4Hz0sURNHG3YAJOxyX6UI+aF
 WsIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Y3ngcrkGTFZru6g+dTbaiNUGQF+v2msRGjtgajmzn5c=;
 b=TLvI3ENN/82jGvQLw69dd62by13Anbvv0ETaYKv9vFzEgDhOqfxMPXJZSIWsYfUozo
 TsihwACHogn1NVPZhq6ZCTR1LF4H78YiF8L/OSfJ8o8lXDyU2dIv9oc0nB0pXnkkhFqk
 lm+IpAyHdX5uaqbMmpZqKo+GTM71Zd0xJnFwusRqqsgoGkTsbRNJmcl56O90fydUrjbh
 5x+xb7j4jmapXz0kSpqGpkCQZwsV5vgkf0d7SqHV0CFdMYk702KhvD8qUNqboySU3QEZ
 1FX/eRUCNKnhBTJwya01N6FpDBkIhwhzx8wXDS1cF92/2M/wE7Q7uVJabiQ7+sXFb05B
 jykQ==
X-Gm-Message-State: AOAM530jU2mwqgMB4RSL1UR4YZJAHjg6tfKWkdQ1e2iU2R5aXmUQ3O4V
 47Pw4c+Ec30MzQ1/ENvFlEQP2KRSj2jqMYRb/Zc=
X-Google-Smtp-Source: ABdhPJzfb3VGd6qAzKGzJjPSk5TuHjCuy4J0lQNC+thOqWBwBvefn+DAomdufHuNNvZ5lq5y+VYkImRwcuBisPEp7Zs=
X-Received: by 2002:a05:6638:2388:b0:311:d1bb:ed46 with SMTP id
 q8-20020a056638238800b00311d1bbed46mr23507891jat.212.1646196167962; Tue, 01
 Mar 2022 20:42:47 -0800 (PST)
MIME-Version: 1.0
References: <20220301225220.239065-1-shentey@gmail.com>
 <20220301225220.239065-3-shentey@gmail.com>
In-Reply-To: <20220301225220.239065-3-shentey@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 2 Mar 2022 14:42:21 +1000
Message-ID: <CAKmqyKN+Q_zMbFkvBvc1nBn4e6grd0vYZYe_BpaFpfF6gD63Vg@mail.gmail.com>
Subject: Re: [PATCH RESEND 2/2] hw/riscv/sifive_u: Resolve redundant property
 accessors
To: Bernhard Beschow <shentey@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, 
 "open list:SiFive Machines" <qemu-riscv@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2b.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 02 Mar 2022 04:42:51 -0000

On Wed, Mar 2, 2022 at 8:57 AM Bernhard Beschow <shentey@gmail.com> wrote:
>
> The QOM API already provides accessors for uint32 values, so reuse them.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/sifive_u.c | 24 ++++--------------------
>  1 file changed, 4 insertions(+), 20 deletions(-)
>
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index 7fbc7dea42..747eb4ee89 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -713,36 +713,20 @@ static void sifive_u_machine_set_start_in_flash(Obj=
ect *obj, bool value, Error *
>      s->start_in_flash =3D value;
>  }
>
> -static void sifive_u_machine_get_uint32_prop(Object *obj, Visitor *v,
> -                                             const char *name, void *opa=
que,
> -                                             Error **errp)
> -{
> -    visit_type_uint32(v, name, (uint32_t *)opaque, errp);
> -}
> -
> -static void sifive_u_machine_set_uint32_prop(Object *obj, Visitor *v,
> -                                             const char *name, void *opa=
que,
> -                                             Error **errp)
> -{
> -    visit_type_uint32(v, name, (uint32_t *)opaque, errp);
> -}
> -
>  static void sifive_u_machine_instance_init(Object *obj)
>  {
>      SiFiveUState *s =3D RISCV_U_MACHINE(obj);
>
>      s->start_in_flash =3D false;
>      s->msel =3D 0;
> -    object_property_add(obj, "msel", "uint32",
> -                        sifive_u_machine_get_uint32_prop,
> -                        sifive_u_machine_set_uint32_prop, NULL, &s->msel=
);
> +    object_property_add_uint32_ptr(obj, "msel", &s->msel,
> +                                   OBJ_PROP_FLAG_READWRITE);
>      object_property_set_description(obj, "msel",
>                                      "Mode Select (MSEL[3:0]) pin state")=
;
>
>      s->serial =3D OTP_SERIAL;
> -    object_property_add(obj, "serial", "uint32",
> -                        sifive_u_machine_get_uint32_prop,
> -                        sifive_u_machine_set_uint32_prop, NULL, &s->seri=
al);
> +    object_property_add_uint32_ptr(obj, "serial", &s->serial,
> +                                   OBJ_PROP_FLAG_READWRITE);
>      object_property_set_description(obj, "serial", "Board serial number"=
);
>  }
>
> --
> 2.35.1
>
>

