Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3513C7EE23
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 02:23:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q8XDT-0006YD-FI; Sun, 11 Jun 2023 22:23:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q8XDR-0006XU-Mr; Sun, 11 Jun 2023 22:23:33 -0400
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q8XDQ-0002dE-6i; Sun, 11 Jun 2023 22:23:33 -0400
Received: by mail-vs1-xe31.google.com with SMTP id
 ada2fe7eead31-43b2da5b307so1040954137.2; 
 Sun, 11 Jun 2023 19:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686536610; x=1689128610;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PUXAhmwq4mR0wAYaE/0SF/RLJQGEga2fPbUeOmJ7kYM=;
 b=VorLzWUCWVzTCrqxNSSyRwaPvjBVQvfsgodKBMZ4ut+3OHJ8WLxd4aI28nKA0WliXc
 Kmhkv5J2/YBmCac7aTUbrE1PF9BFQP2/7qMfs13syn6XTWpuDyiN0ZhJwjMXLeocvuwI
 o3b9ZpRuE1y/YgG9wn/L+IIJMR3n3wtog3Egru3WAUBCIl55L4xGWruazT9GDjm/W1MV
 vL7slOQdoFYtHHAUfkYnSBMWBRWEjSiBqTSnEMSO/K07C3Oi55YKKoTZBXLLwNdHID+A
 BZbO/0PCpBbtEBiTWt+KR3rDxuJ9nJoI3s4rxtqp3tqgLO6YITrGFJtYnxdxNz1fCAmp
 9z1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686536610; x=1689128610;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PUXAhmwq4mR0wAYaE/0SF/RLJQGEga2fPbUeOmJ7kYM=;
 b=I0M4jODdr0RpB5UN634hmYgVHxbdkNuHKCwN37f5OouvPGQcxtoVLC67ldFdrYfBHH
 PqlzEuxHApj5JO3B9sMprV4P518doAbo/HrBYbCEmWA+IVpNo74e3HIke7cFWL3ObMke
 sbn7GhPedRNzY7g3HRrvUDnMOuUhirZm4AatwPeVgh2ZDbM/nAFbk9Dtsj8Wu3BKj9i3
 zcmdQsbS9mluastq11t5Fnj/rLkXfUx+5s4psNLvJ7n7QIpH2CXLC/Ej3Jx/iyIaRPEY
 4AqgkvzliAwmzpJxtviIfjBHKRBfZ3cKlYJBzzCuAihZFCSCBMggabp167K/yqMGOoIo
 N5NQ==
X-Gm-Message-State: AC+VfDwaetvRUmcxvO4bLgwld1lctO5Hkw+ChvPaW6ha1DVc97u1w/pH
 +7hWl/8ENSmXn/HB8Y/qi7PMF1Gl746zfkXwnHM=
X-Google-Smtp-Source: ACHHUZ7F5WHvzp8NWEEH+7qzAkBk88ZdYqHlUdrhkSoUna+wh2apM720Xo01sOLG7WJytZtIaEmNH+DYLHMHR88kKR4=
X-Received: by 2002:a1f:45d1:0:b0:440:125:7e59 with SMTP id
 s200-20020a1f45d1000000b0044001257e59mr3172322vka.1.1686536610587; Sun, 11
 Jun 2023 19:23:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230608053517.4102648-1-xiao.w.wang@intel.com>
In-Reply-To: <20230608053517.4102648-1-xiao.w.wang@intel.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 12 Jun 2023 12:23:04 +1000
Message-ID: <CAKmqyKOJKrGTnJid4D4R=8aR-Nbv-pptOe_prAA9y_kQ+0svgg@mail.gmail.com>
Subject: Re: [PATCH] target/riscv/vector_helper.c: clean up reference of MTYPE
To: Xiao Wang <xiao.w.wang@intel.com>
Cc: qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e31;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe31.google.com
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

On Thu, Jun 8, 2023 at 3:32=E2=80=AFPM Xiao Wang <xiao.w.wang@intel.com> wr=
ote:
>
> There's no code using MTYPE, which was a concept used in older vector
> implementation.
>
> Signed-off-by: Xiao Wang <xiao.w.wang@intel.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/vector_helper.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index f261e726c2..1e06e7447c 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -378,7 +378,7 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVSta=
te *env, uint32_t desc,
>
>  /*
>   * masked unit-stride load and store operation will be a special case of
> - * stride, stride =3D NF * sizeof (MTYPE)
> + * stride, stride =3D NF * sizeof (ETYPE)
>   */
>
>  #define GEN_VEXT_LD_US(NAME, ETYPE, LOAD_FN)                            =
\
> @@ -650,10 +650,6 @@ GEN_VEXT_LDFF(vle64ff_v, int64_t, lde_d)
>  #define DO_MAX(N, M)  ((N) >=3D (M) ? (N) : (M))
>  #define DO_MIN(N, M)  ((N) >=3D (M) ? (M) : (N))
>
> -/* Unsigned min/max */
> -#define DO_MAXU(N, M) DO_MAX((UMTYPE)N, (UMTYPE)M)
> -#define DO_MINU(N, M) DO_MIN((UMTYPE)N, (UMTYPE)M)
> -
>  /*
>   * load and store whole register instructions
>   */
> --
> 2.25.1
>
>

