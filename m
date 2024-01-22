Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F74FC4725D
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 05:18:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rRmhL-0003IR-UU; Mon, 22 Jan 2024 00:18:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rRmhK-0003IC-0Q; Mon, 22 Jan 2024 00:18:14 -0500
Received: from mail-ua1-x930.google.com ([2607:f8b0:4864:20::930])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rRmhH-0008Mm-N8; Mon, 22 Jan 2024 00:18:13 -0500
Received: by mail-ua1-x930.google.com with SMTP id
 a1e0cc1a2514c-7d2dfbe5363so909783241.2; 
 Sun, 21 Jan 2024 21:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705900690; x=1706505490; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K31+vXg6tAJkdmraN7othkWEo9vZHL2h/IdXiYV9Jy8=;
 b=iJDv7iYsFuXGI8FpV26Gmlrlkd0cGVHk9G6PrqqMyG06uj/3J5D8/bmNtLl4IKNYSu
 fpVZ+sQtCSWYLYOviy+P28B/F5l/bEEICbNeJk8/Q6NmsCc7gCMA9pOJOvqWNtcD8278
 uEKkmWKQf0M8EDkdcZ0JpaecRXXjm+X3+7T6DRqY3FUw0O2ngh0ikLesZkDjDfqUxQgn
 8Aec/o89gVKlBA0Ti1IfcqyPcVIUwdsUS9pV/jZjUoDd/h+Tbl49/tKZ5tbEt/6yXG8y
 DP39VlXj55YBGsAziVylxhOMQ6E4f5zGBrwItN8kRkHSinjv+UXmKWB5ETuSC9ThOYNR
 W53Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705900690; x=1706505490;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K31+vXg6tAJkdmraN7othkWEo9vZHL2h/IdXiYV9Jy8=;
 b=byhA+/XSYWdtfG9CNuBT4rjGP+ilMTsE1p9wKACnBgHws36UdUdTRzu7i5Vr/ZV/mE
 LZ3r/fPvgrBRgWsNGYvWq9xRXrzaOMxf5pPc3CuebdJc5AZb2qGPfyUTAgM55aqSfdKa
 +pJLyEhGTpzZUkryYJ18XOFgi+5lIOzC1C2k5UWA9LvXyuNLCnSXCWIJL9QB7aapM4Jf
 WFSu0DxXICWQeuL49Am3GAVsLllyOsj338YIs6msI1IoEg91PJzI0fxDEP0DB5mzhQPk
 N18h2nR3c1kxokZgh4/+ZNaQb/0fzjs4aF+m/c1d8fNvnaH1o40ES8ZtJOy6FRmrfySn
 ierw==
X-Gm-Message-State: AOJu0YxshKKmMQFO0lrrmmF06GZJAFlwoXjPz/MeIPpIbQTD9Ar2Fcgr
 WjnsKXwyyYHtx7RXsgHol+7Yrm0Ff8/CyQ3WZDjH4bt3Y9Z779iegFROHzMH7qFkOBwxXeUJb/1
 1Yb8NLnn7KPH0o37eDNOOXd+napY=
X-Google-Smtp-Source: AGHT+IFe6EZSPmNxo7RoDUb5qAOSpdg0+EDOGDtBwoHkbM0fTUyjMjqV61v32PYczOTsMhwfJUt4gGWo4x/FqaOh6W0=
X-Received: by 2002:a67:fa45:0:b0:469:8f59:a9c2 with SMTP id
 j5-20020a67fa45000000b004698f59a9c2mr1387023vsq.46.1705900689129; Sun, 21 Jan
 2024 21:18:09 -0800 (PST)
MIME-Version: 1.0
References: <20240110-mold-renovate-256db1b5c70e@spud>
 <20240110-eastward-sulfide-f365c89681e0@spud>
In-Reply-To: <20240110-eastward-sulfide-f365c89681e0@spud>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Jan 2024 15:17:42 +1000
Message-ID: <CAKmqyKNTepmovqV1X=FbGR62Q1b6_F-7xB+5AGNAG3UV3TOXuQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] target/riscv: use misa_mxl_max to populate isa
 string rather than TARGET_LONG_BITS
To: Conor Dooley <conor@kernel.org>
Cc: qemu-riscv@nongnu.org, Conor Dooley <conor.dooley@microchip.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
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

On Wed, Jan 10, 2024 at 9:34=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> From: Conor Dooley <conor.dooley@microchip.com>
>
> A cpu may not have the same xlen as the compile time target, and
> misa_mxl_max is the source of truth for what the hart supports.
>
> Reported-by: Andrew Jones <ajones@ventanamicro.com>
> Link: https://lore.kernel.org/qemu-riscv/20240108-efa3f83dcd3997dc0af458d=
7@orel/
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> Perhaps this misa_mxl_max -> width conversion should exist as a macro?
> There's now 3 individual conversions of this type - two I added and one
> in the gdb code.
> ---
>  target/riscv/cpu.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 8cbfc7e781..5b5da970f2 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1860,7 +1860,9 @@ char *riscv_isa_string(RISCVCPU *cpu)
>      int i;
>      const size_t maxlen =3D sizeof("rv128") + sizeof(riscv_single_letter=
_exts);
>      char *isa_str =3D g_new(char, maxlen);
> -    char *p =3D isa_str + snprintf(isa_str, maxlen, "rv%d", TARGET_LONG_=
BITS);
> +    int xlen =3D 16 << cpu->env.misa_mxl_max;
> +    char *p =3D isa_str + snprintf(isa_str, maxlen, "rv%d", xlen);
> +
>      for (i =3D 0; i < sizeof(riscv_single_letter_exts) - 1; i++) {
>          if (cpu->env.misa_ext & RV(riscv_single_letter_exts[i])) {
>              *p++ =3D qemu_tolower(riscv_single_letter_exts[i]);
> --
> 2.39.2
>
>

