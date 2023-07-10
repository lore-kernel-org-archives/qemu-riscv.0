Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABAD5EB64DC
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Jul 2023 02:31:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qIgg3-0003H3-SY; Sun, 09 Jul 2023 22:31:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qIgfd-0003Eg-Us; Sun, 09 Jul 2023 22:30:47 -0400
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qIgfW-0000un-4B; Sun, 09 Jul 2023 22:30:33 -0400
Received: by mail-ua1-x92b.google.com with SMTP id
 a1e0cc1a2514c-79492b8f4bbso1111103241.2; 
 Sun, 09 Jul 2023 19:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688956227; x=1691548227;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cXb8heU9wQScvM3rAgNWTDq36mzaA01ZYW/y/RD2x9w=;
 b=He6tcggUEHPo4C3BVdmbZE+eDu1p/16mrRBrVmw9IgPk4SRDCtYaEn+gq0Hmb1H6k/
 8oqNeubBzQIjncVboq8k9gPDSql4LJoZxDJXM4/KJWpLu0nWQGtcA7463Zu8FDA5j55F
 a7C2wg7Wq9yJIqxQwQolOVyC1wdpei4nbq0+XD9W5hYNsa2z/FiwZZ3MpbnZP/yWB/qm
 WdZu55KQrFPLGfx8RZr4bW9cDMQ0TvKYMWnOvkoeLgBoKqXgjVDb5MSgVYGJhQabv2VS
 ryjMlvUPBjEh9f3ktuUIY4/+qtp+9nhJVJYiz8T4CIvPb/vkNOlENuh77XJFo6OuTGsp
 pkEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688956227; x=1691548227;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cXb8heU9wQScvM3rAgNWTDq36mzaA01ZYW/y/RD2x9w=;
 b=lZp5TkodCybl7QG2pGX+4EU45l+b7vAfyKhx4xEGUSjJ0qGOKAOPyR/93QYXeLMZ19
 o+tpg6C7TNddGLp/hm03F+IACxw/vMAD2IkNU8OrbOvPVCfS663QKLMDQrh5WGYU4jlw
 lZsnhPTLm0GS2jd2r/gxj0wkJ1H1wiRoX/rs5hDPZ2MJFn+DKMvJI/BFIKoMqrqafDgj
 ivj8D8uIZWKKjBcE+MyL7XlofcZZc9PjAthDGUlof9WCv4ZPcQX1IjiFBjUmuTAfVDLK
 E63hVCnAmjYEvmXoIGNSxsB40eQJY9gsYfwhngJRsNOqOgLvjfoWe+ttJOIYrtshRGh6
 0Uaw==
X-Gm-Message-State: ABy/qLahmVUUWLiwLDU75SMC0CtvojXnCTmpvOtHyPgJOjFmH5xEE2BL
 QJUxjiM1sN4PZT7b+2BUxe1nlT8SFP/CRG1S1eE=
X-Google-Smtp-Source: APBJJlEI1MSbqw/B60lUoX8SWcenPMY04gVcqeXIRVtpPr7pEaYvrYoR7csfqj8A8bSzvfKlIvS5YMM0tbIwMnloZsQ=
X-Received: by 2002:a67:fa10:0:b0:443:7516:450b with SMTP id
 i16-20020a67fa10000000b004437516450bmr4020183vsq.35.1688956227255; Sun, 09
 Jul 2023 19:30:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230706101738.460804-1-dbarboza@ventanamicro.com>
 <20230706101738.460804-18-dbarboza@ventanamicro.com>
In-Reply-To: <20230706101738.460804-18-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 10 Jul 2023 12:30:01 +1000
Message-ID: <CAKmqyKPPfqpP6LD77Sv5JdpxnBsxSZKX1ub1ezBt3Tngy_wxSg@mail.gmail.com>
Subject: Re: [PATCH v9 17/20] target/riscv/cpu.c: create KVM mock properties
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92b;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92b.google.com
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

On Thu, Jul 6, 2023 at 8:19=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> KVM-specific properties are being created inside target/riscv/kvm.c. But
> at this moment we're gathering all the remaining properties from TCG and
> adding them as is when running KVM. This creates a situation where
> non-KVM properties are setting flags to 'true' due to its default
> settings (e.g.  Zawrs). Users can also freely enable them via command
> line.
>
> This doesn't impact runtime per se because KVM doesn't care about these
> flags, but code such as riscv_isa_string_ext() take those flags into
> account. The result is that, for a KVM guest, setting non-KVM properties
> will make them appear in the riscv,isa DT.
>
> We want to keep the same API for both TCG and KVM and at the same time,
> when running KVM, forbid non-KVM extensions to be enabled internally. We
> accomplish both by changing riscv_cpu_add_user_properties() to add a
> mock boolean property for every non-KVM extension in
> riscv_cpu_extensions[]. Then, when running KVM, users are still free to
> set extensions at will, but we'll error out if a non-KVM extension is
> enabled. Setting such extension to 'false' will be ignored.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 36 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 2acf77949f..b2883ca533 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1840,6 +1840,26 @@ static Property riscv_cpu_extensions[] =3D {
>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> +
> +#ifndef CONFIG_USER_ONLY
> +static void cpu_set_cfg_unavailable(Object *obj, Visitor *v,
> +                                    const char *name,
> +                                    void *opaque, Error **errp)
> +{
> +    const char *propname =3D opaque;
> +    bool value;
> +
> +    if (!visit_type_bool(v, name, &value, errp)) {
> +        return;
> +    }
> +
> +    if (value) {
> +        error_setg(errp, "extension %s is not available with KVM",
> +                   propname);
> +    }
> +}
> +#endif
> +
>  /*
>   * Add CPU properties with user-facing flags.
>   *
> @@ -1868,6 +1888,22 @@ static void riscv_cpu_add_user_properties(Object *=
obj)
>              if (object_property_find(obj, prop->name)) {
>                  continue;
>              }
> +
> +            /*
> +             * Set the default to disabled for every extension
> +             * unknown to KVM and error out if the user attempts
> +             * to enable any of them.
> +             *
> +             * We're giving a pass for non-bool properties since they're
> +             * not related to the availability of extensions and can be
> +             * safely ignored as is.
> +             */
> +            if (prop->info =3D=3D &qdev_prop_bool) {
> +                object_property_add(obj, prop->name, "bool",
> +                                    NULL, cpu_set_cfg_unavailable,
> +                                    NULL, (void *)prop->name);
> +                continue;
> +            }
>          }
>  #endif
>          qdev_property_add_static(dev, prop);
> --
> 2.41.0
>
>

