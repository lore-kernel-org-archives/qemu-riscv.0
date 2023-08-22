Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 150D9EE49AE
	for <qemu-riscv@archiver.kernel.org>; Tue, 22 Aug 2023 18:42:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qYWKL-0004D5-JH; Tue, 22 Aug 2023 14:42:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qYWKH-0004CT-N5; Tue, 22 Aug 2023 14:42:01 -0400
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qYWKF-00089E-0D; Tue, 22 Aug 2023 14:42:01 -0400
Received: by mail-vs1-xe30.google.com with SMTP id
 ada2fe7eead31-44d3e4ad403so1163277137.0; 
 Tue, 22 Aug 2023 11:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692729717; x=1693334517;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=24rQxjJugoljmS1Ea4gOyv3d++Q+Q9bMNHmgnVEIkqw=;
 b=dDwTJgqR0Mw6DkA6F7SsOvgtsc3DSASXvzxaXpxpm0q/HqLXCv9kxJ4PMv/An0haaR
 7YBc/Xi3fRz2VZl+LJ5uO+ptGuJcZYr2n6Ui3EKz/lWTqOFAraZLSA5Ytq2cLlIeJUl6
 GsnZX9D9nWT5kJjPBKxsgBj2io79WlFyamcyZhegSOhXsC1eoq0ZDmhaHNuKzjlGQX4A
 90DRWVM/+txCQZdr54lV6ogi40tC/mzRGu2YHpUu0Io+4OqU6C5LeZ+RoPgEHeznEe/g
 ru4/fyFHFlZOH5rnwflggM41Yf7tznYzUEDwFWWyrhehwYdRjrRXXBnaylN70lDb4BTI
 sJ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692729717; x=1693334517;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=24rQxjJugoljmS1Ea4gOyv3d++Q+Q9bMNHmgnVEIkqw=;
 b=ZFWOsJAXAAol0h0xz5tqNryFttV2zJdGVDaHvbGLzJmXjWPmuNGteDX7GBrSvnEFA0
 7FY8zCKrryJzgu21NGOq3RtOpJh0VYyzX74gYtnONM6UsOktGdNQv48el17aOChXsI8l
 5aSzsy8Z26N11V5JVvZUptuigETcaoa2QdnwTpHbYIvdf2F68VIKEj4Rh3iSnsrqt8VE
 QIfKzE5B+Y/h6uA7FuqpMZS/95/ZEBDf5nBRe6CvU+kWF4F/CPSeQ7GvUvb8CsFZb92V
 FaaMllI52HdmhrwxSwXY3xDPov0xTzlBZG9YKBW8jsdUnPbd/5XMV4eUMRs1Ihoi1/At
 jAaw==
X-Gm-Message-State: AOJu0YyZFEKSow9AqqRGpvFZqSemAuvcWab0QegLkiJArQbU5RkzMOmz
 pt0gzmVhMNmOdZZQeaWepT47OtUWpAZ8sbDwjj8=
X-Google-Smtp-Source: AGHT+IGL2xMo0QRk2MAG9DEbjeFpgjMPxioqgra3hTSEtM32guOEgXTfwX2okOQYawKeZgBU/3xFP21XdDRJe04e6y8=
X-Received: by 2002:a67:e20d:0:b0:44d:95d4:9fa1 with SMTP id
 g13-20020a67e20d000000b0044d95d49fa1mr1489690vsa.17.1692729716898; Tue, 22
 Aug 2023 11:41:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230817152903.694926-1-dbarboza@ventanamicro.com>
In-Reply-To: <20230817152903.694926-1-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 22 Aug 2023 14:41:30 -0400
Message-ID: <CAKmqyKPLCuOe-pJiDnbchUS3QMBYHn0wQiGj+F9LT07g2+9v0Q@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: fix satp_mode_finalize() when
 satp_mode.supported = 0
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, Alexandre Ghiti <alexghiti@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e30;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe30.google.com
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

On Thu, Aug 17, 2023 at 11:29=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> In the same emulated RISC-V host, the 'host' KVM CPU takes 4 times
> longer to boot than the 'rv64' KVM CPU.
>
> The reason is an unintended behavior of riscv_cpu_satp_mode_finalize()
> when satp_mode.supported =3D 0, i.e. when cpu_init() does not set
> satp_mode_max_supported(). satp_mode_max_from_map(map) does:
>
> 31 - __builtin_clz(map)
>
> This means that, if satp_mode.supported =3D 0, satp_mode_supported_max
> wil be '31 - 32'. But this is C, so satp_mode_supported_max will gladly
> set it to UINT_MAX (4294967295). After that, if the user didn't set a
> satp_mode, set_satp_mode_default_map(cpu) will make
>
> cfg.satp_mode.map =3D cfg.satp_mode.supported
>
> So satp_mode.map =3D 0. And then satp_mode_map_max will be set to
> satp_mode_max_from_map(cpu->cfg.satp_mode.map), i.e. also UINT_MAX. The
> guard "satp_mode_map_max > satp_mode_supported_max" doesn't protect us
> here since both are UINT_MAX.
>
> And finally we have 2 loops:
>
>         for (int i =3D satp_mode_map_max - 1; i >=3D 0; --i) {
>
> Which are, in fact, 2 loops from UINT_MAX -1 to -1. This is where the
> extra delay when booting the 'host' CPU is coming from.
>
> Commit 43d1de32f8 already set a precedence for satp_mode.supported =3D 0
> in a different manner. We're doing the same here. If supported =3D=3D 0,
> interpret as 'the CPU wants the OS to handle satp mode alone' and skip
> satp_mode_finalize().
>
> We'll also put a guard in satp_mode_max_from_map() to assert out if map
> is 0 since the function is not ready to deal with it.
>
> Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
> Fixes: 6f23aaeb9b ("riscv: Allow user to set the satp mode")
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/cpu.c | 23 ++++++++++++++++++++---
>  1 file changed, 20 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index d608026a28..86da93c7bc 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -349,6 +349,17 @@ static uint8_t satp_mode_from_str(const char *satp_m=
ode_str)
>
>  uint8_t satp_mode_max_from_map(uint32_t map)
>  {
> +    /*
> +     * 'map =3D 0' will make us return (31 - 32), which C will
> +     * happily overflow to UINT_MAX. There's no good result to
> +     * return if 'map =3D 0' (e.g. returning 0 will be ambiguous
> +     * with the result for 'map =3D 1').
> +     *
> +     * Assert out if map =3D 0. Callers will have to deal with
> +     * it outside of this function.
> +     */
> +    g_assert(map > 0);
> +
>      /* map here has at least one bit set, so no problem with clz */
>      return 31 - __builtin_clz(map);
>  }
> @@ -1387,9 +1398,15 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *c=
pu, Error **errp)
>  static void riscv_cpu_satp_mode_finalize(RISCVCPU *cpu, Error **errp)
>  {
>      bool rv32 =3D riscv_cpu_mxl(&cpu->env) =3D=3D MXL_RV32;
> -    uint8_t satp_mode_map_max;
> -    uint8_t satp_mode_supported_max =3D
> -                        satp_mode_max_from_map(cpu->cfg.satp_mode.suppor=
ted);
> +    uint8_t satp_mode_map_max, satp_mode_supported_max;
> +
> +    /* The CPU wants the OS to decide which satp mode to use */
> +    if (cpu->cfg.satp_mode.supported =3D=3D 0) {
> +        return;
> +    }
> +
> +    satp_mode_supported_max =3D
> +                    satp_mode_max_from_map(cpu->cfg.satp_mode.supported)=
;
>
>      if (cpu->cfg.satp_mode.map =3D=3D 0) {
>          if (cpu->cfg.satp_mode.init =3D=3D 0) {
> --
> 2.41.0
>
>

