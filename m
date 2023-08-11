Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 256E7C0015E
	for <qemu-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 18:08:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qUWYm-0004Sn-78; Fri, 11 Aug 2023 14:08:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qUWYj-0004H1-OQ; Fri, 11 Aug 2023 14:08:25 -0400
Received: from mail-vk1-xa36.google.com ([2607:f8b0:4864:20::a36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qUWYi-0000b2-1J; Fri, 11 Aug 2023 14:08:25 -0400
Received: by mail-vk1-xa36.google.com with SMTP id
 71dfb90a1353d-48746a002f8so821788e0c.1; 
 Fri, 11 Aug 2023 11:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691777302; x=1692382102;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tpVFS1OpnOXblK4IG4g9d4kVteqoIu02bJqWYR0q82Q=;
 b=KYIS5Do2rRIwBrafe1ZQbcsdnGorzZswGQI8dltpHpUlLwuFCI0wJsb/5HlcwkAPLa
 /Y/3jBFgbRRuoJQPpD8gYvRaK7y56HlKK9baGRH33YzXCE3ygEkVUkFwrlbM/lprziTJ
 i7orI1CBOExltcukSbv8CNHlBkO6UDMt5TG9W+CvQJ6Kp3oLCwrNIiRYRCwSsC73z5Uv
 8ZeIhHhjZCM5XctGFMHjwWr31uXtSs+mhxqCAnfFhb3T1na+smGycuPbbw4qEstXH8nk
 YUBJL7f1pRV2pVMBRmj/vlG6GNsrQB+kRIa+j5L0atMTIL7QGIajUM1RCdaD81QmFpAx
 PDmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691777302; x=1692382102;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tpVFS1OpnOXblK4IG4g9d4kVteqoIu02bJqWYR0q82Q=;
 b=BbLSIf9DNB2rxgbD9dARzGDeIH0oZ+LFWk2P4Ctyv1aF+9wBs+xqJDzon5GLJsuTQ6
 zMv/McQSEpEQrLMF0CSswRsELv7pLR8I2V+EC4obvBM0zojyCejGt35+9S2hD+gjXx27
 zFXoHkEBaiwd4nsNVXe9FsuH95lPci/Ly2Cq00DUtumUDv+vJSAGLZ3/sl1MWoHHST9C
 pPyLFCEo2t8PBYlI8dous0Mo0m8jDOevWMafdtoQiRWezc5pOezZNoeHCcI7TLkWnzmn
 Ir9fWHz8bRXkyclkFkDlk6fTMLCK0JaXpGQHkTypt6adQTzMFO4AD2eQ5lF0vc8tJcij
 tz/Q==
X-Gm-Message-State: AOJu0YylRsFfXnWRLblIUU+7/UcCqSXNfCdhVQY62nWUPDmaQgg0suQD
 qK36H+Sso2gYYYMvSNIK/OiPO3Um57BFD5+mwp0=
X-Google-Smtp-Source: AGHT+IHQ6701KJ5L5x4WcusJ0SoZgDlXUM/gl79PDFaNP3sDx6MnpCSi6e+NPSEamMZrT1NCqbtYGeJO1pk3mJpy+qI=
X-Received: by 2002:a1f:3f8a:0:b0:486:484d:3053 with SMTP id
 m132-20020a1f3f8a000000b00486484d3053mr3113433vka.5.1691777302381; Fri, 11
 Aug 2023 11:08:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230811160224.440697-1-dbarboza@ventanamicro.com>
 <20230811160224.440697-2-dbarboza@ventanamicro.com>
In-Reply-To: <20230811160224.440697-2-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 11 Aug 2023 14:07:56 -0400
Message-ID: <CAKmqyKOMLs28sn_kg1ixNuTO0WDWf6R8ur3-n4M+SP1=vU94JQ@mail.gmail.com>
Subject: Re: [PATCH for-8.1 1/1] hw/riscv/virt.c: change 'aclint' TCG check
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, philmd@linaro.org, richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a36;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa36.google.com
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

On Fri, Aug 11, 2023 at 12:03=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> The 'aclint' property is being conditioned with tcg acceleration in
> virt_machine_class_init(). But acceleration code starts later than the
> class init of the board, meaning that tcg_enabled() will be always be
> false during class_init(), and the option is never being declared even
> when declaring TCG accel:
>
> $ ./build/qemu-system-riscv64 -M virt,accel=3Dtcg,aclint=3Don
> qemu-system-riscv64: Property 'virt-machine.aclint' not found
>
> Fix it by moving the check from class_init() to machine_init(). Tune the
> description to mention that the option is TCG only.
>
> Cc: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Fixes: c0716c81b ("hw/riscv/virt: Restrict ACLINT to TCG")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1823
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/virt.c | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index d90286dc46..99c4e6314b 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1350,6 +1350,11 @@ static void virt_machine_init(MachineState *machin=
e)
>          exit(1);
>      }
>
> +    if (!tcg_enabled() && s->have_aclint) {
> +        error_report("'aclint' is only available with TCG acceleration")=
;
> +        exit(1);
> +    }
> +
>      /* Initialize sockets */
>      mmio_irqchip =3D virtio_irqchip =3D pcie_irqchip =3D NULL;
>      for (i =3D 0; i < socket_count; i++) {
> @@ -1683,13 +1688,14 @@ static void virt_machine_class_init(ObjectClass *=
oc, void *data)
>      machine_class_allow_dynamic_sysbus_dev(mc, TYPE_TPM_TIS_SYSBUS);
>  #endif
>
> -    if (tcg_enabled()) {
> -        object_class_property_add_bool(oc, "aclint", virt_get_aclint,
> -                                       virt_set_aclint);
> -        object_class_property_set_description(oc, "aclint",
> -                                              "Set on/off to enable/disa=
ble "
> -                                              "emulating ACLINT devices"=
);
> -    }
> +
> +    object_class_property_add_bool(oc, "aclint", virt_get_aclint,
> +                                   virt_set_aclint);
> +    object_class_property_set_description(oc, "aclint",
> +                                          "(TCG only) Set on/off to "
> +                                          "enable/disable emulating "
> +                                          "ACLINT devices");
> +
>      object_class_property_add_str(oc, "aia", virt_get_aia,
>                                    virt_set_aia);
>      object_class_property_set_description(oc, "aia",
> --
> 2.41.0
>
>

