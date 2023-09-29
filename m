Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 022A6E71D2A
	for <qemu-riscv@archiver.kernel.org>; Fri, 29 Sep 2023 12:42:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qmCpR-0004Hw-Ar; Fri, 29 Sep 2023 08:42:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1qmCpP-0004Gj-AD
 for qemu-riscv@nongnu.org; Fri, 29 Sep 2023 08:42:43 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1qmCpG-0006Dp-If
 for qemu-riscv@nongnu.org; Fri, 29 Sep 2023 08:42:43 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-279150bad13so1319908a91.3
 for <qemu-riscv@nongnu.org>; Fri, 29 Sep 2023 05:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull.eu; s=google; t=1695991350; x=1696596150; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7sQ0VuR5GrrY/vRYyct7kFEYeRQwG8+9T1cxX80c4Ic=;
 b=e7hVXQiON1h665+ljUC+e3tONWLv63eBoMn8NzGzXaAH8mqCKKhOw8aa543Ak0IqxU
 /oaf6G8321OPKpPYqN4IaTtrQPQ0BV/VSOSSQBXKsCLYxhq/yYvo1+ZGs/kYvpgPH7TM
 oCi0IHChYS0cXDit7rKIqcUb9nw5vBuJa6ZYdPEv4iTnjM1YzrD94w8Ku44oEj8enhE8
 KfhEACGSGnpJz3QOSyEYrX0OzbDrbqTdZesUogqyhedhsaPsSum+JyHIwg2Qc8yHELnd
 n9j+c2Y6+oJp/Eor3yaa1O8+kwnUA0xmPHWpEg0Do2m/nYok+AG/Ovz0VFzBiLws6mYW
 koFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695991350; x=1696596150;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7sQ0VuR5GrrY/vRYyct7kFEYeRQwG8+9T1cxX80c4Ic=;
 b=ZE0asv0HYq+e0mjMdPyHV9cgdwLrh1VD32ulKZ952kK0iYtH3wNH1/q7HcgXulMuzK
 j6YZhuMDDO4f4w6rzJ3ikb+wauF+juqyKy/vazUdHIebFEpYgGoUEa5VKqlEAgtmiydg
 zvPuB2vJ8ZHbpgszh+XdP1MdLGM8R4J8lnfcWSfU0PyVS6TTZqWBtM/41pkQbzESCtU3
 TIsJTr1jVkN22uXuqhkc1bosTIO7+ES6RsXjSQmncyzRI/DY5vsAv00A+4BD7og9T24y
 vzgopl4d2U0m40JkYukmsMriOh6WogWHDoPhEpTonPmCjf1rN9qJWw6R0Ff3WyLoxKgy
 u0lg==
X-Gm-Message-State: AOJu0Yy3UjY/S6Je70RVLvUWkaqjhvibXfbwb0tIhFNs2uYPTAKLeOos
 OqjMPX9MzIULOzXufvjRyEKNzruwEvccIcJ7EfWFAA==
X-Google-Smtp-Source: AGHT+IGPaVBmrojIFfFcJ9acfS75oLOJfAKDNyrvyCbLQKd6nOww67HZRfdJSUES99c8613F5c6HPRyzPIt0ndt1lfc=
X-Received: by 2002:a17:90a:fb51:b0:274:a021:9383 with SMTP id
 iq17-20020a17090afb5100b00274a0219383mr4079886pjb.17.1695991350306; Fri, 29
 Sep 2023 05:42:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230929123727.391346-1-thuth@redhat.com>
In-Reply-To: <20230929123727.391346-1-thuth@redhat.com>
From: =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>
Date: Fri, 29 Sep 2023 14:42:18 +0200
Message-ID: <CAEg0e7gJYL_U=Rn_jzoEXz+zQU81PifxZw8513TAPdZF5h8J2w@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add unowned RISC-V related files to the
 right sections
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Vijai Kumar K <vijai@behindbytes.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, Sep 29, 2023 at 2:37=E2=80=AFPM Thomas Huth <thuth@redhat.com> wrot=
e:
>
> There are a bunch of RISC-V files that are currently not covered
> by the "get_maintainers.pl" script. Add them to the right sections
> in MAINTAINERS to fix this problem.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>


Acked-by: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>

Thanks!

>
> ---
>  MAINTAINERS | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 355b1960ce..1313257180 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -317,8 +317,11 @@ R: Daniel Henrique Barboza <dbarboza@ventanamicro.co=
m>
>  R: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
>  L: qemu-riscv@nongnu.org
>  S: Supported
> +F: configs/targets/riscv*
> +F: docs/system/target-riscv.rst
>  F: target/riscv/
>  F: hw/riscv/
> +F: hw/intc/riscv*
>  F: include/hw/riscv/
>  F: linux-user/host/riscv32/
>  F: linux-user/host/riscv64/
> @@ -330,6 +333,7 @@ L: qemu-riscv@nongnu.org
>  S: Supported
>  F: target/riscv/insn_trans/trans_xthead.c.inc
>  F: target/riscv/xthead*.decode
> +F: disas/riscv-xthead*
>
>  RISC-V XVentanaCondOps extension
>  M: Philipp Tomsich <philipp.tomsich@vrull.eu>
> @@ -337,6 +341,7 @@ L: qemu-riscv@nongnu.org
>  S: Maintained
>  F: target/riscv/XVentanaCondOps.decode
>  F: target/riscv/insn_trans/trans_xventanacondops.c.inc
> +F: disas/riscv-xventana*
>
>  RENESAS RX CPUs
>  R: Yoshinori Sato <ysato@users.sourceforge.jp>
> @@ -1518,6 +1523,7 @@ Microchip PolarFire SoC Icicle Kit
>  M: Bin Meng <bin.meng@windriver.com>
>  L: qemu-riscv@nongnu.org
>  S: Supported
> +F: docs/system/riscv/microchip-icicle-kit.rst
>  F: hw/riscv/microchip_pfsoc.c
>  F: hw/char/mchp_pfsoc_mmuart.c
>  F: hw/misc/mchp_pfsoc_dmc.c
> @@ -1533,6 +1539,7 @@ Shakti C class SoC
>  M: Vijai Kumar K <vijai@behindbytes.com>
>  L: qemu-riscv@nongnu.org
>  S: Supported
> +F: docs/system/riscv/shakti-c.rst
>  F: hw/riscv/shakti_c.c
>  F: hw/char/shakti_uart.c
>  F: include/hw/riscv/shakti_c.h
> @@ -1544,6 +1551,7 @@ M: Bin Meng <bin.meng@windriver.com>
>  M: Palmer Dabbelt <palmer@dabbelt.com>
>  L: qemu-riscv@nongnu.org
>  S: Supported
> +F: docs/system/riscv/sifive_u.rst
>  F: hw/*/*sifive*.c
>  F: include/hw/*/*sifive*.h
>
> @@ -3543,7 +3551,7 @@ M: Alistair Francis <Alistair.Francis@wdc.com>
>  L: qemu-riscv@nongnu.org
>  S: Maintained
>  F: tcg/riscv/
> -F: disas/riscv.c
> +F: disas/riscv.[ch]
>
>  S390 TCG target
>  M: Richard Henderson <richard.henderson@linaro.org>
> --
> 2.41.0
>

