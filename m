Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 099FCEB64DD
	for <qemu-riscv@archiver.kernel.org>; Fri, 14 Jul 2023 03:15:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qK9HL-0006m6-8j; Thu, 13 Jul 2023 23:15:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qK9HJ-0006lr-6q; Thu, 13 Jul 2023 23:15:33 -0400
Received: from mail-vk1-xa2a.google.com ([2607:f8b0:4864:20::a2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qK9HG-00060V-Og; Thu, 13 Jul 2023 23:15:32 -0400
Received: by mail-vk1-xa2a.google.com with SMTP id
 71dfb90a1353d-460eb67244eso566346e0c.1; 
 Thu, 13 Jul 2023 20:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689304529; x=1691896529;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=puxQWApwOCyGtowf9bFt1bOtkb8WKfrbCEz9PygV47Y=;
 b=OM4h7j0xArxcMeK6TYYyiBna+7dGHB5JRm/O6iy6boodrHbTwE4jIYsBY6TXjCD1WV
 b2OwPG98Vr8j5qH8AmDcgEe7qPlvSF/a2fV+TmIoLF79waifDGMpl8Dra1GZ6GM9UaPP
 iw7DLB4b7WBMOP4ocUV0tjraY0lSSNyrs4jkZ//83WlwTXdHKDCGwV1na4QDwfTcVS5H
 j3p39OYuKyzMW+9ntUdaDMuYgcl2QLKG1DHYjK7+51H4+An/JQRtx0ibYesHiYrtYXAr
 OA8WooXdf0vh7YtxGd7QvAA4cMvMhkKSUU0HNcFJwhAPaGDDMmvQZ0e+WQPg3AV9XEGI
 oDUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689304529; x=1691896529;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=puxQWApwOCyGtowf9bFt1bOtkb8WKfrbCEz9PygV47Y=;
 b=edxVlmiSA30vmsaWPMXN9nayCDJJmWcwjQmnpuneWwns+xozU763VYmS8QAKQ3PHk+
 hJsSlGYKwYy9TVrxt+M4eQf1Sm5z6ZFsyMHqh6OQRLkCUhaTHaE3v+5DCo6UHxLSLDiz
 y5K6Ned5h2E8UoXDs5dbgZeKZ9oYC+1KCYbEg9aBzqmFwQsZGAjRlxOxJC5WQrWym+t0
 ziGu3axGJ7jM1XCOtYUrCkfVuHeGz6oyH1vz2NqwrqgQnP2+NmhuUcC5gfXJdcGKlk/6
 5JcVfeDtgn7eGeHFVLjz63uwiiAxZ/Iz8oxh1AIcqek8CJO4MQM1HBf5G0OmWQ1Xutrg
 RY9g==
X-Gm-Message-State: ABy/qLZ6LhbM2ybaG2hxaDqKXywyt07rsRsHmn0w6ybRcRdofe5Fv+MG
 wH4U+6Ez3OKA0cHAshww4+iamtLuH/x+QoeCddQ=
X-Google-Smtp-Source: APBJJlGaTYBxuHvEmR99pixNSPQI4VY6kAZq73txGtG9+jfBK6PohnX1s9lBl9Upmxnia+o+DlJzyvLdJiewo1bxeEQ=
X-Received: by 2002:a1f:3fd1:0:b0:481:4531:3381 with SMTP id
 m200-20020a1f3fd1000000b0048145313381mr1842779vka.16.1689304528753; Thu, 13
 Jul 2023 20:15:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230712205748.446931-1-dbarboza@ventanamicro.com>
 <20230712205748.446931-3-dbarboza@ventanamicro.com>
In-Reply-To: <20230712205748.446931-3-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 14 Jul 2023 13:15:02 +1000
Message-ID: <CAKmqyKOSTVBytPq_pux1zT5xY8vbByB+XU6vtBMZUKrA3=pzEA@mail.gmail.com>
Subject: Re: [PATCH for-8.2 v2 2/7] target/riscv/cpu.c: skip 'bool' check when
 filtering KVM props
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2a;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2a.google.com
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

On Thu, Jul 13, 2023 at 6:59=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> After the introduction of riscv_cpu_options[] all properties in
> riscv_cpu_extensions[] are booleans. This check is now obsolete.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 14 ++++----------
>  1 file changed, 4 insertions(+), 10 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index cdf9eeeb6b..735e0ed793 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1907,17 +1907,11 @@ static void riscv_cpu_add_user_properties(Object =
*obj)
>               * Set the default to disabled for every extension
>               * unknown to KVM and error out if the user attempts
>               * to enable any of them.
> -             *
> -             * We're giving a pass for non-bool properties since they're
> -             * not related to the availability of extensions and can be
> -             * safely ignored as is.
>               */
> -            if (prop->info =3D=3D &qdev_prop_bool) {
> -                object_property_add(obj, prop->name, "bool",
> -                                    NULL, cpu_set_cfg_unavailable,
> -                                    NULL, (void *)prop->name);
> -                continue;
> -            }
> +            object_property_add(obj, prop->name, "bool",
> +                                NULL, cpu_set_cfg_unavailable,
> +                                NULL, (void *)prop->name);
> +            continue;
>          }
>  #endif
>          qdev_property_add_static(dev, prop);
> --
> 2.41.0
>
>

