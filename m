Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5642EB64DC
	for <qemu-riscv@archiver.kernel.org>; Mon, 10 Jul 2023 02:24:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qIgZg-0000xh-Fv; Sun, 09 Jul 2023 22:24:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qIgZe-0000xG-0c; Sun, 09 Jul 2023 22:24:26 -0400
Received: from mail-ua1-x930.google.com ([2607:f8b0:4864:20::930])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qIgZb-00075k-J4; Sun, 09 Jul 2023 22:24:24 -0400
Received: by mail-ua1-x930.google.com with SMTP id
 a1e0cc1a2514c-794cddcab71so1110744241.1; 
 Sun, 09 Jul 2023 19:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688955862; x=1691547862;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iYD1pY43efiLMmg/9L3r2dRK6X5EBQvY7uFKRUnuN8c=;
 b=Rhdbe7vITiNmj/z4KCUWTiVYBKMSFRuIRA5HQEd6doef75vkiSkTtE71GLZmkea1nA
 khZbU+iz+LbgS6oNhVctnloFf5iMuua+1G5OsqSZQJzR8GmiITYxb38A3lDeNMcrscLF
 NvWSinVlp8C64MELQjdzrG8mezTq8mLfdMMbH2XsIZovomudd8jLYQ7LZSdzxIwm7/qC
 DuiIA3r51qfTTUgfHtJTtnQedUW+509DA6skcz1yHUMTCfQg0SJCX47V5NqUy0VArQUF
 v3PKpj/djDoKlwHej4c6P0OLNK+erTleLJ83nE1uK6J16uNNyqSJJYQf+peAZUIoNpTt
 onUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688955862; x=1691547862;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iYD1pY43efiLMmg/9L3r2dRK6X5EBQvY7uFKRUnuN8c=;
 b=d72b5w6etYW1UIHT2oe21F+vAdhdPvFkeRIZ/ORjPiELTC6SQQjnxQWDo7Pl2NeTrz
 /VwhcykDDN27TCySpJrFbx1dcSlnyNE6zGEaBs2f243lMl6PWawx74UZpzI3S6BasE3U
 bhiBT+u8W9rje9uR2JkQq19zfN9UOMkIvLRrnHrIvYRogXlI16oCbIGx0Mjw5RUaXHDg
 rS5SX+5ZHLIRtkT/CiHsg7RmqDvbKzO8RVQYlSKDYFDWwGX1Tvt0sC1r5aVSmnQTzYX0
 0GpEyb2Co5SXSaOjPM8heKDx8rvNdlTqWG+LR07ihnktxIlWR3MORadqBKn7czywACBP
 l1nQ==
X-Gm-Message-State: ABy/qLb1WTRg2fwYw2gLhKbu0gTRetqofWLlq0kEi1UU9nMruI7NsK3N
 4TsV13SnVIAFAbASBcW8Afo3PGUgHePUYOl5498=
X-Google-Smtp-Source: APBJJlE3BvO4Dt2aukq7Jn5L/o+JWJGgsnTP0obZEG6kWpltGJPbiF2+ti9fiIvjfJPxj0O1Up6DALd/Ty8xUlxClUQ=
X-Received: by 2002:a1f:5ecb:0:b0:476:36df:dc51 with SMTP id
 s194-20020a1f5ecb000000b0047636dfdc51mr4459163vkb.16.1688955861789; Sun, 09
 Jul 2023 19:24:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230706101738.460804-1-dbarboza@ventanamicro.com>
 <20230706101738.460804-16-dbarboza@ventanamicro.com>
In-Reply-To: <20230706101738.460804-16-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 10 Jul 2023 12:23:55 +1000
Message-ID: <CAKmqyKOJCJEJSMzs0MqJ7mbkKensgbdCFub0Qq6=YPYnv3=GCg@mail.gmail.com>
Subject: Re: [PATCH v9 15/20] target/riscv/cpu.c: add satp_mode properties
 earlier
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::930;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x930.google.com
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

On Thu, Jul 6, 2023 at 8:20=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> riscv_cpu_add_user_properties() ended up with an excess of "#ifndef
> CONFIG_USER_ONLY" blocks after changes that added KVM properties
> handling.
>
> KVM specific properties are required to be created earlier than their
> TCG counterparts, but the remaining props can be created at any order.
> Move riscv_add_satp_mode_properties() to the start of the function,
> inside the !CONFIG_USER_ONLY block already present there, to remove the
> last ifndef block.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 31e591a938..deb3c0f035 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1852,6 +1852,8 @@ static void riscv_cpu_add_user_properties(Object *o=
bj)
>      DeviceState *dev =3D DEVICE(obj);
>
>  #ifndef CONFIG_USER_ONLY
> +    riscv_add_satp_mode_properties(obj);
> +
>      if (kvm_enabled()) {
>          kvm_riscv_init_user_properties(obj);
>      }
> @@ -1870,10 +1872,6 @@ static void riscv_cpu_add_user_properties(Object *=
obj)
>  #endif
>          qdev_property_add_static(dev, prop);
>      }
> -
> -#ifndef CONFIG_USER_ONLY
> -    riscv_add_satp_mode_properties(obj);
> -#endif
>  }
>
>  static Property riscv_cpu_properties[] =3D {
> --
> 2.41.0
>
>

