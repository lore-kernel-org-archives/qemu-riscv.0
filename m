Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nMGVe-0006wQ-33
	for mharc-qemu-riscv@gnu.org; Mon, 21 Feb 2022 16:46:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nMGVa-0006un-8d; Mon, 21 Feb 2022 16:46:15 -0500
Received: from [2607:f8b0:4864:20::12e] (port=41750
 helo=mail-il1-x12e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nMGVY-0001Jm-Ds; Mon, 21 Feb 2022 16:46:13 -0500
Received: by mail-il1-x12e.google.com with SMTP id d7so11070175ilf.8;
 Mon, 21 Feb 2022 13:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EfGe20YoNZZyqS3mWhvOHP8r+8i/gwoGir8idGOPOSc=;
 b=Lp++EeEMjjmDYehgxvNYeftnF8TCVCdhU75LFsKYYV298zFZ04tURWRhGvIclEBddR
 Ef6OozpC13wsCMRvNsDdU+49X4D7N2mDWFHmVdNLPLwhovW7NM6darnaBm8fq0ZmXQC9
 PG+1v6rUoJxCeKyew6Rokn+1EL7tjVZg27P/Pk/R3ESqQhbaLBaLNGt/6QV3Xy8QAOAQ
 3flYCyM2clbJhJxkN01UiSEL6u0vJP/e4StWwh4J6Bb27NmXuNXAXsolLYnLnGlIYgfn
 +ynSqeDqgcfmKw7GEugDBvLzSjji+nMVYjHgIWsjJ3oKT194MJzVwgB55zlhYkM5GiP7
 OQ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EfGe20YoNZZyqS3mWhvOHP8r+8i/gwoGir8idGOPOSc=;
 b=0js18UDcioGhhrBOWX7o41ekEyPO0QO8Rjjwpw2eASFV2zkbMPUm0rE9u1wlUig1rk
 CvNptq9wQpK7yL73x9NZt6oV1351BulA6CUFbdk5RmGHkyulgk8h1OuZoT5NSVYuEkCl
 wO402LisuiNbuyrQm08RsqtrZlKhCZ23o0cLz9reIvDp3ZHk2vq4b6u5uecWPpfAImWG
 3Rm4Uu3y30g9V5ZG7n74bRXRTDmWlg+e2qUf3Y4frSq2GqT3UYkzVBIAc+Z+zl+1FT4w
 lql8VG0QSKY8UPO5TmhnltZSucPVoHzEahq53tdIfPTa5JjWnYOaghZeh6RqalXVkQVR
 Yuyw==
X-Gm-Message-State: AOAM533nz67ts/7VN7aWyaem51ukbc8VCyGsni9xFw41CmLk3sLt+j06
 9NNvxx96o6OAHTI2QmaUSyN9BsM9prCX46lMtDw=
X-Google-Smtp-Source: ABdhPJx14r4X1WInlaCR6cB4ikJs0lvNHYwGL33Bcht4dQnZ40uJsAGJmYEeoI5N2slL3WMutjPrlqzBZklHwpgXhtA=
X-Received: by 2002:a05:6e02:1e0b:b0:2be:e272:e5b9 with SMTP id
 g11-20020a056e021e0b00b002bee272e5b9mr17235747ila.310.1645479961140; Mon, 21
 Feb 2022 13:46:01 -0800 (PST)
MIME-Version: 1.0
References: <20220217225351.140095-1-shentey@gmail.com>
 <20220217225351.140095-4-shentey@gmail.com>
In-Reply-To: <20220217225351.140095-4-shentey@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 22 Feb 2022 07:45:35 +1000
Message-ID: <CAKmqyKN73Oh40Fyh9QMadS1WC1TEud5yn+L9KJ=sYqDDmrvFvg@mail.gmail.com>
Subject: Re: [PATCH 2/2] hw/riscv/sifive_u: Resolve redundant property
 accessors
To: Bernhard Beschow <shentey@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 "open list:SiFive Machines" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::12e;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12e.google.com
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
X-List-Received-Date: Mon, 21 Feb 2022 21:46:16 -0000

On Fri, Feb 18, 2022 at 8:54 AM Bernhard Beschow <shentey@gmail.com> wrote:
>
> The QOM API already provides accessors for uint32 values, so reuse them.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>

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
> @@ -713,36 +713,20 @@ static void sifive_u_machine_set_start_in_flash(Object *obj, bool value, Error *
>      s->start_in_flash = value;
>  }
>
> -static void sifive_u_machine_get_uint32_prop(Object *obj, Visitor *v,
> -                                             const char *name, void *opaque,
> -                                             Error **errp)
> -{
> -    visit_type_uint32(v, name, (uint32_t *)opaque, errp);
> -}
> -
> -static void sifive_u_machine_set_uint32_prop(Object *obj, Visitor *v,
> -                                             const char *name, void *opaque,
> -                                             Error **errp)
> -{
> -    visit_type_uint32(v, name, (uint32_t *)opaque, errp);
> -}
> -
>  static void sifive_u_machine_instance_init(Object *obj)
>  {
>      SiFiveUState *s = RISCV_U_MACHINE(obj);
>
>      s->start_in_flash = false;
>      s->msel = 0;
> -    object_property_add(obj, "msel", "uint32",
> -                        sifive_u_machine_get_uint32_prop,
> -                        sifive_u_machine_set_uint32_prop, NULL, &s->msel);
> +    object_property_add_uint32_ptr(obj, "msel", &s->msel,
> +                                   OBJ_PROP_FLAG_READWRITE);
>      object_property_set_description(obj, "msel",
>                                      "Mode Select (MSEL[3:0]) pin state");
>
>      s->serial = OTP_SERIAL;
> -    object_property_add(obj, "serial", "uint32",
> -                        sifive_u_machine_get_uint32_prop,
> -                        sifive_u_machine_set_uint32_prop, NULL, &s->serial);
> +    object_property_add_uint32_ptr(obj, "serial", &s->serial,
> +                                   OBJ_PROP_FLAG_READWRITE);
>      object_property_set_description(obj, "serial", "Board serial number");
>  }
>
> --
> 2.35.1
>
>

