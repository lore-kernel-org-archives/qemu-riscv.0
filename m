Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD31CE7A8B
	for <qemu-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 01:38:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qkaYJ-0008SF-Ae; Sun, 24 Sep 2023 21:38:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qkaYG-0008Rv-JA; Sun, 24 Sep 2023 21:38:21 -0400
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qkaYE-000590-5f; Sun, 24 Sep 2023 21:38:20 -0400
Received: by mail-ua1-x92d.google.com with SMTP id
 a1e0cc1a2514c-7a7e11a53c3so4645204241.1; 
 Sun, 24 Sep 2023 18:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695605896; x=1696210696; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WLl+ksHGoiEIrdf6SLv9WiDZpgheUU1vc2LZXOFxb4o=;
 b=Jk8+LYNSNFFqdxfjp/5eg+RNMpw47L+Eu6xcwWyhFPs3XFTXrUfNO48w54xRjUeZZ2
 82X1fjTDXr7yBrxHedXXO/q5Q6KkdCEVYk9JMaFLBGXIulLGt4u7Y3UxZa9gK+HGXzPr
 VKQ0YGyyESV5lDb7+5a1sVaQS2ZTsGUqPANRcU6iKoP+pUdkqWenUAVNWrJFVqX2ahFm
 8NW+5lPXiJyqHEjCkZxhmQ08ap9IeTv8dW2SZIKLWn3yc3TVsOJE4oVZIL/gp+xQWEfi
 fpM2HL3Jy31+d3wF6YiwwNv1CagA8SZfaUKVw7WoPY7ffh3KWwbLINjxnwuuqgxhNqdX
 fThQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695605896; x=1696210696;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WLl+ksHGoiEIrdf6SLv9WiDZpgheUU1vc2LZXOFxb4o=;
 b=eeegJTwFp0HHShzO0UJ7NzD+CGSxAgPci8sWscPaoW4xxo8P2/PuoObCyvWaKef0WS
 9ruAIBw8jQHbzk0CBUHLZEcoe9eQXX4IBVu/j6JmL1Crb8s8GB45dO7ZjaVkfPhSuyzC
 hqp61MC/3Z0hSjhH4rU5IEmJ3orLRh6ZeMQ3iitd44dm2o9bhzu7MIrwiTYcRzg6ko49
 9tcIaTtFtwMag0in2qjEKQ9NhLQHlx/xMri/psl9kughBHyDTcutfoWzkIBp94eJ05zU
 NdtKTVg3SVwtjr9NiZkmSarccqLqvlqfbGOhVe2XiSCnH77iCD05gjS0Hh6uiC3NiuPQ
 Wprw==
X-Gm-Message-State: AOJu0Yz4XbJFKLBk25EzI/fQJF+fwxqxS+6a+ht/u91yp5TyhbOT+wu/
 9H0rpsbZvIObD01x1GkMp+Or4pbh7cyCUSr++0g=
X-Google-Smtp-Source: AGHT+IGaEbBqq6AK97kQQzCi8y1jVD+wPmS+7pxiK4bgeMi7MhQBu1KtQ1WHvZV3CJP+yHP6pqPC6RAwUxNgMz2JmNM=
X-Received: by 2002:a05:6102:2c8:b0:452:74b1:63e0 with SMTP id
 h8-20020a05610202c800b0045274b163e0mr2177367vsh.17.1695605896517; Sun, 24 Sep
 2023 18:38:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230920112020.651006-1-dbarboza@ventanamicro.com>
 <20230920112020.651006-17-dbarboza@ventanamicro.com>
In-Reply-To: <20230920112020.651006-17-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 25 Sep 2023 11:37:48 +1000
Message-ID: <CAKmqyKMPKQJnzftD9xRrL-b+O7unJkJtyr8VAZLZ93RBnDa9_w@mail.gmail.com>
Subject: Re: [PATCH v3 16/19] target/riscv/cpu.c: make misa_ext_cfgs[] 'const'
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, philmd@linaro.org, ajones@ventanamicro.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Wed, Sep 20, 2023 at 10:46=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> The array isn't marked as 'const' because we're initializing their
> elements in riscv_cpu_add_misa_properties(), 'name' and 'description'
> fields.
>
> In a closer look we can see that we're not using these 2 fields after
> creating the MISA properties. And we can create the properties by using
> riscv_get_misa_ext_name() and riscv_get_misa_ext_description()
> directly.
>
> Remove the 'name' and 'description' fields from RISCVCPUMisaExtConfig
> and make misa_ext_cfgs[] a const array.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 21 ++++++++-------------
>  1 file changed, 8 insertions(+), 13 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 8616c9e2f5..4875feded7 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1212,8 +1212,6 @@ static void riscv_cpu_init(Object *obj)
>  }
>
>  typedef struct RISCVCPUMisaExtConfig {
> -    const char *name;
> -    const char *description;
>      target_ulong misa_bit;
>      bool enabled;
>  } RISCVCPUMisaExtConfig;
> @@ -1317,7 +1315,7 @@ const char *riscv_get_misa_ext_description(uint32_t=
 bit)
>  #define MISA_CFG(_bit, _enabled) \
>      {.misa_bit =3D _bit, .enabled =3D _enabled}
>
> -static RISCVCPUMisaExtConfig misa_ext_cfgs[] =3D {
> +static const RISCVCPUMisaExtConfig misa_ext_cfgs[] =3D {
>      MISA_CFG(RVA, true),
>      MISA_CFG(RVC, true),
>      MISA_CFG(RVD, true),
> @@ -1344,25 +1342,22 @@ void riscv_cpu_add_misa_properties(Object *cpu_ob=
j)
>      int i;
>
>      for (i =3D 0; i < ARRAY_SIZE(misa_ext_cfgs); i++) {
> -        RISCVCPUMisaExtConfig *misa_cfg =3D &misa_ext_cfgs[i];
> +        const RISCVCPUMisaExtConfig *misa_cfg =3D &misa_ext_cfgs[i];
>          int bit =3D misa_cfg->misa_bit;
> -
> -        misa_cfg->name =3D riscv_get_misa_ext_name(bit);
> -        misa_cfg->description =3D riscv_get_misa_ext_description(bit);
> +        const char *name =3D riscv_get_misa_ext_name(bit);
> +        const char *desc =3D riscv_get_misa_ext_description(bit);
>
>          /* Check if KVM already created the property */
> -        if (object_property_find(cpu_obj, misa_cfg->name)) {
> +        if (object_property_find(cpu_obj, name)) {
>              continue;
>          }
>
> -        object_property_add(cpu_obj, misa_cfg->name, "bool",
> +        object_property_add(cpu_obj, name, "bool",
>                              cpu_get_misa_ext_cfg,
>                              cpu_set_misa_ext_cfg,
>                              NULL, (void *)misa_cfg);
> -        object_property_set_description(cpu_obj, misa_cfg->name,
> -                                        misa_cfg->description);
> -        object_property_set_bool(cpu_obj, misa_cfg->name,
> -                                 misa_cfg->enabled, NULL);
> +        object_property_set_description(cpu_obj, name, desc);
> +        object_property_set_bool(cpu_obj, name, misa_cfg->enabled, NULL)=
;
>      }
>  }
>
> --
> 2.41.0
>
>

