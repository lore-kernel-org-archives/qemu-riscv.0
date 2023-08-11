Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C89AEB64DD
	for <qemu-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 15:05:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qUThS-0006Ii-5G; Fri, 11 Aug 2023 11:05:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qUThP-000694-Ka; Fri, 11 Aug 2023 11:05:11 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qUThM-0005M2-S5; Fri, 11 Aug 2023 11:05:11 -0400
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-6bd04558784so1990425a34.3; 
 Fri, 11 Aug 2023 08:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691766306; x=1692371106;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z2EbjJc+YnTnjgh1jHU6d45VESS5TDp+uOoS2J3cUo4=;
 b=ZgJeEnFj5ElN6TkPmfpvXakXkDjTtXWvl+1Gqlq+Ht1JLTXt+h34OzsLUANY9Btpli
 tPmGvV1voy2CK8thCnSYUarZudUWtWLO6Hzu9cML/sgOvlb6mulzXTCzn8sPvfF28Jvh
 7htXRo9AR72YV79WH793U0I1fJeC4TqxgKayEvpCJ0psoXI1R31ICEM0rkttEahMuo7W
 8Lmb/R29d+LW3BIVvj/2FHBv1vqBzeZnuIrWIBptREDKf3ukYE5ejnp3NObMm3x5Zwd2
 ObhkAaJOiEVvD9bx6yvALhYz2Me9SLBRuouO7kjn4/aD4paA9s3EvH6oLZ6DX/+5tbJU
 Tmhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691766306; x=1692371106;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z2EbjJc+YnTnjgh1jHU6d45VESS5TDp+uOoS2J3cUo4=;
 b=N7+b3l8ljmIe7zF2swY3mb89b3kRWKo2TRzKPkhIiif6JPT8212fzqjQPWJTAWe3Zp
 uZ3Vg/n0UmqTVw+aOgbGgSOpVIPhfFxs8YZqzCKjTQDQ3lSVyrzT6VgcBv8jz/UCmhWa
 BKkypMI4ThSEGagtd8hK2d8ocfkVq0nboBkMD8zQdgGdW9AjpQ/cjMe0sJLA3GpR0MY7
 qXkSmpldpvSK5OoUOZwL8XUYmT4toc0I2Q9OHS7r28uf8LdgI2mW1FdPzvXtcK2WUcYW
 lQUr7lwwEhFfI+R7VPXpVgITnVr77r9vn4+8qCfcSi1LA22DNBaxz+ux35H+Ej5+BYYz
 /Xvw==
X-Gm-Message-State: AOJu0Yx31FGMFj8fHv7moydlb631To7RJNe6SVIGmblUosw7ozjxhV33
 yJRPKh4hfBCN57greMdfCdCQXgNvJ6NWAaGpM1KZgbG6hQtb1A==
X-Google-Smtp-Source: AGHT+IGs5AtkWXXh/ZgQmQpJK66oxDAMZnipUkxD5k/m2nPk/bbAHTk/SEIr/S83ZEbhh6eLiWyaPOUWKb2UgCFRP2U=
X-Received: by 2002:a05:6358:78a:b0:139:5a46:ea7e with SMTP id
 n10-20020a056358078a00b001395a46ea7emr2337968rwj.28.1691766305223; Fri, 11
 Aug 2023 08:05:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230728131520.110394-1-dbarboza@ventanamicro.com>
 <20230728131520.110394-8-dbarboza@ventanamicro.com>
In-Reply-To: <20230728131520.110394-8-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 11 Aug 2023 11:04:39 -0400
Message-ID: <CAKmqyKMQOhrj-G48usr8MHjURGhxxFC84J41Zu-yo6bpNecBhQ@mail.gmail.com>
Subject: Re: [PATCH 7/8] target/riscv/cpu.c: honor user choice in
 cpu_cfg_ext_auto_update()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=alistair23@gmail.com; helo=mail-ot1-x335.google.com
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

On Fri, Jul 28, 2023 at 10:32=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Add a new cpu_cfg_ext_is_user_set() helper to check if an extension was
> set by the user in the command line. Use it inside
> cpu_cfg_ext_auto_update() to verify if the user set a certain extension
> and, if that's the case, do not change its value.
>
> This will make us honor user choice instead of overwriting the values.
> Users will then be informed whether they're using an incompatible set of
> extensions instead of QEMU setting a magic value that works.
>
> For example, we'll now error out if the user explictly set 'zce' to true
> and 'zca' to false:
>
> $ ./build/qemu-system-riscv64 -M virt -cpu rv64,zce=3Dtrue,zca=3Dfalse -n=
ographic
> qemu-system-riscv64: Zcf/Zcd/Zcb/Zcmp/Zcmt extensions require Zca extensi=
on
>
> This didn't happen before because we were enabling 'zca' if 'zce' was ena=
bled
> regardless if the user explictly set 'zca' to false.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index a40dc865a0..644d0fdad2 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -187,6 +187,12 @@ static int cpu_cfg_ext_get_min_version(uint32_t ext_=
offset)
>      return PRIV_VERSION_1_10_0;
>  }
>
> +static bool cpu_cfg_ext_is_user_set(uint32_t ext_offset)
> +{
> +    return g_hash_table_contains(multi_ext_user_opts,
> +                                 GUINT_TO_POINTER(ext_offset));
> +}
> +
>  static void cpu_cfg_ext_auto_update(RISCVCPU *cpu, uint32_t ext_offset,
>                                      bool value)
>  {
> @@ -198,6 +204,10 @@ static void cpu_cfg_ext_auto_update(RISCVCPU *cpu, u=
int32_t ext_offset,
>          return;
>      }
>
> +    if (cpu_cfg_ext_is_user_set(ext_offset)) {
> +        return;
> +    }
> +
>      if (value && env->priv_ver !=3D PRIV_VERSION_LATEST) {
>          /* Do not enable it if priv_ver is older than min_version */
>          min_version =3D cpu_cfg_ext_get_min_version(ext_offset);
> --
> 2.41.0
>
>

