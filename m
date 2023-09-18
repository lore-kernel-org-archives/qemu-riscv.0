Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA42CD37B4
	for <qemu-riscv@archiver.kernel.org>; Mon, 18 Sep 2023 01:54:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qi3Sj-0006Nb-7f; Sun, 17 Sep 2023 21:54:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qi3Si-0006NN-HX; Sun, 17 Sep 2023 21:54:08 -0400
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qi3Sh-0003Im-2X; Sun, 17 Sep 2023 21:54:08 -0400
Received: by mail-vk1-xa2c.google.com with SMTP id
 71dfb90a1353d-48faba23f51so1799205e0c.1; 
 Sun, 17 Sep 2023 18:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695002046; x=1695606846; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7weY9BQaRXXSZfj0ATidS0rvWFuBo2tnwUK+9qpQbQE=;
 b=TOVcN/KGvqrifPINfxdeJ3J7CmpiD7+F8mdty/jl5hcFboaZ0VHWvwSVFRkfXtJ/U4
 8sobYzVB2z/cpvkolhAS9DOL21Xdl4G6GqxnmzrklbQTswzGKhu3z6XPLhjXbGVlUuFK
 nOn5daY+1iIaVdXuW394FeYrCrswez598kRMLtwiHldAmrTZwd17PJagZqUykZeJpYIu
 fdx/wWFZ0725DYGAzJuBnqoRXah3D+IlEH56VIIUFAUl3sHqrPh74LpF6Tgv/NqyS0Tw
 c7FIM0bgv6XUL7UVVc4vTwYogF6fz0MPW582HXzbyDKfjuFErRi4I4imwXXvT285M5fP
 0sNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695002046; x=1695606846;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7weY9BQaRXXSZfj0ATidS0rvWFuBo2tnwUK+9qpQbQE=;
 b=Jec9V4QersZui1yYbSWaIkdOK1dnFhYZ2YOoI79iDZZq9ZW01cO/zETJF0UTh6OAXp
 b29aUrP1zQwOw3Y0PZMbMJFs1o8zXV+vlnyv4iiaS2EMv6xeWtNg+6uLZcfWotsQWxeb
 YkFuSkBW5f04Cz3wh3KzHHgluYX4KJbynvlgoqAcfD/5gCNIvSOh+YOsBvS1MWGj+IAE
 0DlduAhxcmPR/hao2grC4Lkj5Uz+cAICENtdH3xMhXMk58OWkpHpP0lpM+2qJVw04zE2
 Rnwo79yCS+ZQyQUiyF2id7gmPORbniKOecZwDPQfNJO5XIIjkel3GfR/W8EOg2JAFGah
 70Cw==
X-Gm-Message-State: AOJu0YxRzIVrjxqPbN/ZlQWq6jKhEivN2BOf/Jg23tX4dcbqUSy0VTtM
 ZriYAw5cXn0tU3hBHkG1OGsPL7mRVVoSdPsqmVQip3aD/Jo=
X-Google-Smtp-Source: AGHT+IHsyLo+6wSLdtUHXiAz59f5JbdzajdeTQ/wWUq3hpZo5ObvueJRfgh8BoTJ9uq49QeTnqr2q4z94+tNu8Oj2eQ=
X-Received: by 2002:a1f:da03:0:b0:48f:e2eb:6dd2 with SMTP id
 r3-20020a1fda03000000b0048fe2eb6dd2mr6102028vkg.9.1695002045716; Sun, 17 Sep
 2023 18:54:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230914080740.7561-1-nikita.shubin@maquefel.me>
 <20230914080740.7561-3-nikita.shubin@maquefel.me>
In-Reply-To: <20230914080740.7561-3-nikita.shubin@maquefel.me>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 18 Sep 2023 11:53:39 +1000
Message-ID: <CAKmqyKNqthCXdD+6GyaBVmniGr64KFH+e2TJTnHCkmxG=bbX4w@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/2] hw/riscv: hart: allow other cpu instance
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Sunil V L <sunilvl@ventanamicro.com>, Nikita Shubin <n.shubin@yadro.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2c;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2c.google.com
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

On Thu, Sep 14, 2023 at 6:09=E2=80=AFPM Nikita Shubin <nikita.shubin@maquef=
el.me> wrote:
>
> From: Nikita Shubin <n.shubin@yadro.com>
>
> Allow using instances derivative from RISCVCPU
>
> Signed-off-by: Nikita Shubin <n.shubin@yadro.com>
> ---
>  hw/riscv/riscv_hart.c         | 20 ++++++++++++--------
>  include/hw/riscv/riscv_hart.h |  2 +-
>  2 files changed, 13 insertions(+), 9 deletions(-)
>
> diff --git a/hw/riscv/riscv_hart.c b/hw/riscv/riscv_hart.c
> index 613ea2aaa0..020ba18e8b 100644
> --- a/hw/riscv/riscv_hart.c
> +++ b/hw/riscv/riscv_hart.c
> @@ -43,24 +43,28 @@ static void riscv_harts_cpu_reset(void *opaque)
>  }
>
>  static bool riscv_hart_realize(RISCVHartArrayState *s, int idx,
> -                               char *cpu_type, Error **errp)
> +                               char *cpu_type, size_t size, Error **errp=
)
>  {
> -    object_initialize_child(OBJECT(s), "harts[*]", &s->harts[idx], cpu_t=
ype);
> -    qdev_prop_set_uint64(DEVICE(&s->harts[idx]), "resetvec", s->resetvec=
);
> -    s->harts[idx].env.mhartid =3D s->hartid_base + idx;
> -    qemu_register_reset(riscv_harts_cpu_reset, &s->harts[idx]);
> -    return qdev_realize(DEVICE(&s->harts[idx]), NULL, errp);
> +    RISCVCPU *hart =3D s->harts[idx];
> +    object_initialize_child_internal(OBJECT(s), "harts[*]",
> +                                    hart, size, cpu_type);
> +    qdev_prop_set_uint64(DEVICE(hart), "resetvec", s->resetvec);
> +    hart->env.mhartid =3D s->hartid_base + idx;
> +    qemu_register_reset(riscv_harts_cpu_reset, hart);
> +    return qdev_realize(DEVICE(hart), NULL, errp);
>  }
>
>  static void riscv_harts_realize(DeviceState *dev, Error **errp)
>  {
>      RISCVHartArrayState *s =3D RISCV_HART_ARRAY(dev);
> +    size_t size =3D object_type_get_instance_size(s->cpu_type);
>      int n;
>
> -    s->harts =3D g_new0(RISCVCPU, s->num_harts);
> +    s->harts =3D g_new0(RISCVCPU *, s->num_harts);

We don't use this allocated memory, this line should be dropped

Alistair

>
>      for (n =3D 0; n < s->num_harts; n++) {
> -        if (!riscv_hart_realize(s, n, s->cpu_type, errp)) {
> +        s->harts[n] =3D RISCV_CPU(object_new(s->cpu_type));
> +        if (!riscv_hart_realize(s, n, s->cpu_type, size, errp)) {
>              return;
>          }
>      }
> diff --git a/include/hw/riscv/riscv_hart.h b/include/hw/riscv/riscv_hart.=
h
> index 912b4a2682..5f6ef06411 100644
> --- a/include/hw/riscv/riscv_hart.h
> +++ b/include/hw/riscv/riscv_hart.h
> @@ -38,7 +38,7 @@ struct RISCVHartArrayState {
>      uint32_t hartid_base;
>      char *cpu_type;
>      uint64_t resetvec;
> -    RISCVCPU *harts;
> +    RISCVCPU **harts;
>  };
>
>  #endif
> --
> 2.39.2
>
>

