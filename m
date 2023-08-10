Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6701C001E0
	for <qemu-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 17:45:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qU9gq-0004vN-GU; Thu, 10 Aug 2023 13:43:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qU9go-0004lp-Tq; Thu, 10 Aug 2023 13:43:14 -0400
Received: from mail-vk1-xa29.google.com ([2607:f8b0:4864:20::a29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qU9gn-00056S-5K; Thu, 10 Aug 2023 13:43:14 -0400
Received: by mail-vk1-xa29.google.com with SMTP id
 71dfb90a1353d-487359fa94eso345742e0c.1; 
 Thu, 10 Aug 2023 10:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691689391; x=1692294191;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LB+aVHj0tVb/+i3ZaY26GQreUrjdW7QfX5oNkoGEzow=;
 b=rk7mtzsq5YgqQmvpQ21IGv9ewGRuj8yuT1nEuIVuSUs2A/NyjkMNiIq10YUq7MhPYE
 zqiiK+OwA7+R2mY6VuJZTLW5wHYjZm+0bLUrEYmNSqwIiDMnCuMoTFOCf6Vh1+HLIF+0
 RwtDju3ST6DHCoW+JgWlXboWsmm2xN1mXBX0fsm9amg4YGZVWb/h8V7D5/iox4XAteLb
 /RR+KLUxI/RLw4h4yYbSmJOlxZ3Sc7mFh5zSUWDlbFllI+ApcJJszJ50+AfPAkW056lI
 DnNDzDBNrCgSRzHHzJ1N9q1kQ64tjkDnwfoEUSq11sKQljSPIGVj/6XBrTjPG0kNNA6H
 n92Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691689391; x=1692294191;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LB+aVHj0tVb/+i3ZaY26GQreUrjdW7QfX5oNkoGEzow=;
 b=MputPKnxRFntghvOEOxGg0wLNy8vH7Zasv/PTw+01TkxuTre2ffzIHaj3vopcm0pql
 9BOvwLXdWCqkaoB92By/BGUK6SBBg40U4udmgIEtOsJxYwoaD9eXrHNJbgkQDdvpGgrI
 YZvPKo+6u2lIht9gcKmf08zh53grGqNOchyrQ8eOziyirSqW444xlSwEaKH83KyyRM6y
 qokioSZjgyP6RB7P53zOpsJNIMq85PU0r0Oqu5T6F4GxqqkmCDUQt5pKv51PI6/tMxcv
 J2U45D9jpPbnH+AOb9s253Jme5FOp7zk3VhiqTzokxm6s/sQjHfA5Loo77R9e69GLna3
 IxKA==
X-Gm-Message-State: AOJu0YyUu5S+xIOqyIQYV9HGuswibOGdAR/8HPYuY8R7u+O+pQ5LK2YX
 oDF1CFzX+rJmppLkZ8BhfbnClUQoeYYhJGptnlc=
X-Google-Smtp-Source: AGHT+IEm96+7h0NS9AYghC5T6CRt7IipjmPGdI8oOFLl2W0inEyd7MOx3D9/fJhPhaRGHZYp2p2T+eZHOAHyjto8TgA=
X-Received: by 2002:a67:ee53:0:b0:443:6c48:4d49 with SMTP id
 g19-20020a67ee53000000b004436c484d49mr1714663vsp.10.1691689391617; Thu, 10
 Aug 2023 10:43:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230727220927.62950-1-dbarboza@ventanamicro.com>
 <20230727220927.62950-4-dbarboza@ventanamicro.com>
In-Reply-To: <20230727220927.62950-4-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 10 Aug 2023 13:42:45 -0400
Message-ID: <CAKmqyKOPXV=AfaW_Ot2TpBR8L5_GXb_H1LS5RuOkPore8FbD3Q@mail.gmail.com>
Subject: Re: [PATCH v6 03/12] target/riscv/cpu.c: split kvm prop handling to
 its own helper
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a29;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa29.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Thu, Jul 27, 2023 at 6:39=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Future patches will split the existing Property arrays even further, and
> the existing code in riscv_cpu_add_user_properties() will start to scale
> bad with it because it's dealing with KVM constraints mixed in with TCG
> constraints. We're going to pay a high price to share a couple of common
> lines of code between the two.
>
> Create a new riscv_cpu_add_kvm_properties() that will be forked from
> riscv_cpu_add_user_properties() if we're running KVM. The helper
> includes all properties that a KVM CPU will add. The rest of
> riscv_cpu_add_user_properties() body will then be relieved from having
> to deal with KVM constraints.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 65 ++++++++++++++++++++++++++++++----------------
>  1 file changed, 42 insertions(+), 23 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 2fa2581742..f1a292d967 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1881,6 +1881,46 @@ static void cpu_set_cfg_unavailable(Object *obj, V=
isitor *v,
>  }
>  #endif
>
> +#ifndef CONFIG_USER_ONLY
> +static void riscv_cpu_add_kvm_unavail_prop(Object *obj, const char *prop=
_name)
> +{
> +    /* Check if KVM created the property already */
> +    if (object_property_find(obj, prop_name)) {
> +        return;
> +    }
> +
> +    /*
> +     * Set the default to disabled for every extension
> +     * unknown to KVM and error out if the user attempts
> +     * to enable any of them.
> +     */
> +    object_property_add(obj, prop_name, "bool",
> +                        NULL, cpu_set_cfg_unavailable,
> +                        NULL, (void *)prop_name);
> +}
> +
> +static void riscv_cpu_add_kvm_properties(Object *obj)
> +{
> +    Property *prop;
> +    DeviceState *dev =3D DEVICE(obj);
> +
> +    kvm_riscv_init_user_properties(obj);
> +    riscv_cpu_add_misa_properties(obj);
> +
> +    for (prop =3D riscv_cpu_extensions; prop && prop->name; prop++) {
> +        riscv_cpu_add_kvm_unavail_prop(obj, prop->name);
> +    }
> +
> +    for (int i =3D 0; i < ARRAY_SIZE(riscv_cpu_options); i++) {
> +        /* Check if KVM created the property already */
> +        if (object_property_find(obj, riscv_cpu_options[i].name)) {
> +            continue;
> +        }
> +        qdev_property_add_static(dev, &riscv_cpu_options[i]);
> +    }
> +}
> +#endif
> +
>  /*
>   * Add CPU properties with user-facing flags.
>   *
> @@ -1896,39 +1936,18 @@ static void riscv_cpu_add_user_properties(Object =
*obj)
>      riscv_add_satp_mode_properties(obj);
>
>      if (kvm_enabled()) {
> -        kvm_riscv_init_user_properties(obj);
> +        riscv_cpu_add_kvm_properties(obj);
> +        return;
>      }
>  #endif
>
>      riscv_cpu_add_misa_properties(obj);
>
>      for (prop =3D riscv_cpu_extensions; prop && prop->name; prop++) {
> -#ifndef CONFIG_USER_ONLY
> -        if (kvm_enabled()) {
> -            /* Check if KVM created the property already */
> -            if (object_property_find(obj, prop->name)) {
> -                continue;
> -            }
> -
> -            /*
> -             * Set the default to disabled for every extension
> -             * unknown to KVM and error out if the user attempts
> -             * to enable any of them.
> -             */
> -            object_property_add(obj, prop->name, "bool",
> -                                NULL, cpu_set_cfg_unavailable,
> -                                NULL, (void *)prop->name);
> -            continue;
> -        }
> -#endif
>          qdev_property_add_static(dev, prop);
>      }
>
>      for (int i =3D 0; i < ARRAY_SIZE(riscv_cpu_options); i++) {
> -        /* Check if KVM created the property already */
> -        if (object_property_find(obj, riscv_cpu_options[i].name)) {
> -            continue;
> -        }
>          qdev_property_add_static(dev, &riscv_cpu_options[i]);
>      }
>  }
> --
> 2.41.0
>
>

