Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD9B5C4707B
	for <qemu-riscv@archiver.kernel.org>; Fri, 12 Jan 2024 01:30:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rO6Mm-0004vR-HY; Thu, 11 Jan 2024 20:29:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rO6Mh-0004uf-01; Thu, 11 Jan 2024 20:29:43 -0500
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rO6Me-0003Rp-UH; Thu, 11 Jan 2024 20:29:42 -0500
Received: by mail-ua1-x935.google.com with SMTP id
 a1e0cc1a2514c-7ce363b3772so1008546241.2; 
 Thu, 11 Jan 2024 17:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705022979; x=1705627779; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IlTvANciJQsObjsXfNMB1FpdL0+Ed0AyxEtkEzpVGmk=;
 b=NTFx8GcqpFZttPz/Op/Sluo0mokaQ0wsikJsQ6BFlXKNjvS5QuRivb6C/Egt6Wjwp6
 q1/tloT+xRXcZTgBjNORSCyXaw6xsfArCVmFyWefMSbNR14JaO0aD/G49G9ur81M9xH3
 /zJMASQb2BkVbuUcsbYedBa+bOXMtd8R4BjJJ6LyEOszBK0R1Yat5DHl3r9oTiFXK6f0
 FIReci4/S5oRD8nrcc7TlIfSsnlxbQnOeSGt3f/Zn5IRfVH7z7fOnq3Cpr31yvNF4k/D
 sINj6uNWVk2eFBDMYvtTjBUzHevw5SzBNv0ckgR1U1IJpWGfTJRk5x/IpXtjQs3MbwyC
 pqig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705022979; x=1705627779;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IlTvANciJQsObjsXfNMB1FpdL0+Ed0AyxEtkEzpVGmk=;
 b=oQPd93hIoAS7jehrPuoWNOinmK1hB/HVRRV+zLsQmc3h7Z9aibN7jIsBurZOqLYw+h
 av58wzO4CQkIxwWIG7MqtHZI15AuarzdYBc6k0WG4lhBWnune5TRCcBLpQAkh+Md1u1J
 oHKYF540/qhIOZWlbPpUgvfHgu2MbM2Msck/Lv+Jgw9llV6ZQrSBMQmy4fD80/Eh2Usp
 hdZHkiXhlIvxHB523X0W7KwuQx5OeToJSOQ2xJHmDeTSCs4DATaU5yBYhKdFqUmEkewM
 iaBNn4S5Q+hf+oGqO6shegiggwuFIx1rwCr7gqmlrAIpbnYa9iSdzy9pwhKyq2YlEdCr
 1K6Q==
X-Gm-Message-State: AOJu0YykbRpuspK3hZ9bKrj85y0XFzDn7rLmpeVNf5XRYt4Wdr9sGWS+
 9GQoAB8xtA6hG2eG4x7mpbYYjEcG9uqbkCtod7w=
X-Google-Smtp-Source: AGHT+IGhbJsXB3Zm9Q2ezqIQXY6+pXBzmp81AEiP0GmWnizrhjinTR97JfWxdWY7Ljp4MKQnrxMa01Axr1zuABe2Ikw=
X-Received: by 2002:a67:fa4a:0:b0:467:c74d:f207 with SMTP id
 j10-20020a67fa4a000000b00467c74df207mr614163vsq.18.1705022979296; Thu, 11 Jan
 2024 17:29:39 -0800 (PST)
MIME-Version: 1.0
References: <20240105230546.265053-1-dbarboza@ventanamicro.com>
 <20240105230546.265053-17-dbarboza@ventanamicro.com>
In-Reply-To: <20240105230546.265053-17-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 12 Jan 2024 11:29:13 +1000
Message-ID: <CAKmqyKO-wTNcO1-_GGNNoc0WNkH+gqcbdRqSv5JH4UA-rPkZVg@mail.gmail.com>
Subject: Re: [PATCH v4 16/17] target/riscv/cpu.c: move 'mimpid' to
 riscv_cpu_properties[]
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::935;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x935.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Sat, Jan 6, 2024 at 9:07=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Keep all class properties in riscv_cpu_properties[].
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 68 ++++++++++++++++++++++++----------------------
>  1 file changed, 36 insertions(+), 32 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index c725a4839d..6149f5960e 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -2009,6 +2009,41 @@ static const PropertyInfo prop_mvendorid =3D {
>      .set =3D prop_mvendorid_set,
>  };
>
> +static void prop_mimpid_set(Object *obj, Visitor *v, const char *name,
> +                            void *opaque, Error **errp)
> +{
> +    bool dynamic_cpu =3D riscv_cpu_is_dynamic(obj);
> +    RISCVCPU *cpu =3D RISCV_CPU(obj);
> +    uint64_t prev_val =3D cpu->cfg.mimpid;
> +    uint64_t value;
> +
> +    if (!visit_type_uint64(v, name, &value, errp)) {
> +        return;
> +    }
> +
> +    if (!dynamic_cpu && prev_val !=3D value) {
> +        error_setg(errp, "Unable to change %s mimpid (0x%" PRIu64 ")",
> +                   object_get_typename(obj), prev_val);
> +        return;
> +    }
> +
> +    cpu->cfg.mimpid =3D value;
> +}
> +
> +static void prop_mimpid_get(Object *obj, Visitor *v, const char *name,
> +                            void *opaque, Error **errp)
> +{
> +    uint64_t value =3D RISCV_CPU(obj)->cfg.mimpid;
> +
> +    visit_type_uint64(v, name, &value, errp);
> +}
> +
> +static const PropertyInfo prop_mimpid =3D {
> +    .name =3D "mimpid",
> +    .get =3D prop_mimpid_get,
> +    .set =3D prop_mimpid_set,
> +};
> +
>  /*
>   * RVA22U64 defines some 'named features' or 'synthetic extensions'
>   * that are cache related: Za64rs, Zic64b, Ziccif, Ziccrse, Ziccamoa
> @@ -2096,6 +2131,7 @@ static Property riscv_cpu_properties[] =3D {
>      {.name =3D "cboz_blocksize", .info =3D &prop_cboz_blksize},
>
>       {.name =3D "mvendorid", .info =3D &prop_mvendorid},
> +     {.name =3D "mimpid", .info =3D &prop_mimpid},
>
>  #ifndef CONFIG_USER_ONLY
>      DEFINE_PROP_UINT64("resetvec", RISCVCPU, env.resetvec, DEFAULT_RSTVE=
C),
> @@ -2177,35 +2213,6 @@ static const struct SysemuCPUOps riscv_sysemu_ops =
=3D {
>  };
>  #endif
>
> -static void cpu_set_mimpid(Object *obj, Visitor *v, const char *name,
> -                           void *opaque, Error **errp)
> -{
> -    bool dynamic_cpu =3D riscv_cpu_is_dynamic(obj);
> -    RISCVCPU *cpu =3D RISCV_CPU(obj);
> -    uint64_t prev_val =3D cpu->cfg.mimpid;
> -    uint64_t value;
> -
> -    if (!visit_type_uint64(v, name, &value, errp)) {
> -        return;
> -    }
> -
> -    if (!dynamic_cpu && prev_val !=3D value) {
> -        error_setg(errp, "Unable to change %s mimpid (0x%" PRIu64 ")",
> -                   object_get_typename(obj), prev_val);
> -        return;
> -    }
> -
> -    cpu->cfg.mimpid =3D value;
> -}
> -
> -static void cpu_get_mimpid(Object *obj, Visitor *v, const char *name,
> -                           void *opaque, Error **errp)
> -{
> -    uint64_t value =3D RISCV_CPU(obj)->cfg.mimpid;
> -
> -    visit_type_uint64(v, name, &value, errp);
> -}
> -
>  static void cpu_set_marchid(Object *obj, Visitor *v, const char *name,
>                              void *opaque, Error **errp)
>  {
> @@ -2286,9 +2293,6 @@ static void riscv_cpu_class_init(ObjectClass *c, vo=
id *data)
>      cc->gdb_arch_name =3D riscv_gdb_arch_name;
>      cc->gdb_get_dynamic_xml =3D riscv_gdb_get_dynamic_xml;
>
> -    object_class_property_add(c, "mimpid", "uint64", cpu_get_mimpid,
> -                              cpu_set_mimpid, NULL, NULL);
> -
>      object_class_property_add(c, "marchid", "uint64", cpu_get_marchid,
>                                cpu_set_marchid, NULL, NULL);
>
> --
> 2.43.0
>
>

