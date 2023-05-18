Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED098C77B7D
	for <qemu-riscv@archiver.kernel.org>; Thu, 18 May 2023 09:46:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pzaD7-0004QG-Vi; Thu, 18 May 2023 05:46:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pzaD6-0004P3-Tr; Thu, 18 May 2023 05:46:12 -0400
Received: from mail-vk1-xa32.google.com ([2607:f8b0:4864:20::a32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pzaD5-0007bS-6N; Thu, 18 May 2023 05:46:12 -0400
Received: by mail-vk1-xa32.google.com with SMTP id
 71dfb90a1353d-4520083548dso712467e0c.0; 
 Thu, 18 May 2023 02:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684403168; x=1686995168;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wCjEZVTDQVLTyV4eK9PvqzImghfpUvGn0OH5PBCXWIY=;
 b=k7SZeWkNPtuuJBGpemWr1y/8IDAd9aqIMYSXC/B35NCep/s4JORbjJuA611jDvpVY3
 epUuFhbzqLOR9OysLeXW3i7FSoHjzC8+3+ZUx833D9ECGeLj98TQfDCA2/VlHKkHVAJU
 vFJc/PmN4aU1ybi8HBcm06RN8neH0uRh9Z+EFRkxMFcKQKv8Tgg2FYDS6w2yEOnS0kY6
 FeZ3Hmx6oSJkUOI1dDJKvvS79y2FKnBfvSx+D6b7AdYEieSj0LQmzP+LPr4VgesYM+J8
 XDln7W9GEI3aAo2rAvaLw6L3cHOQ+/0uZr0NjROiITSunEgbmgkpY8vrNhXwixoBZ7Ox
 RJNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684403168; x=1686995168;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wCjEZVTDQVLTyV4eK9PvqzImghfpUvGn0OH5PBCXWIY=;
 b=HjGhVb7T2h6z5UX8HlA9I3iknfCJjqwRd69qb6cAkD3yI0LiUKO2+Anl1Czb+iR1jY
 lSHACek+jkRz2ZVeuA/RIOalhPxkiw3iz21MFz+pAfcYZaO+B0JostKq+CAzLFggsF+i
 d8ERhdmM0BHAUP1eK4v3qNXgS4yYCUGRbE3JFmoh86Ew2ft0pEXMXHN3GZpVuNhAecyK
 xCAXZVgiyn/F7no+JWOZ7CFsosuCIelwPRapGR1/gju1LfcwjD2A8qZi8ZfQ9C1y9qU0
 Swt51DgO0o0UDTyoBJRERLYkBDS2WNeasoDuzE2v+itLqWOVG7NTm0KoxnOUV0/17W6I
 QK+g==
X-Gm-Message-State: AC+VfDwL/lf3tAP0jsZ4zSBOK5kd2XT+COD/3RZpDtwBNGD+FRZgCtcA
 nh/1Enp0rpa4ArfB9TSpnPmo2wXOOeO7SizCulY=
X-Google-Smtp-Source: ACHHUZ6K4Mw30GXHQdixfcdULkOoIm08k8KOaAg7qJ8kexUUdIc15MK+IMGvXsHNqsd5w9wNbAVnX5KhaLGQmwC2yDA=
X-Received: by 2002:a1f:3f48:0:b0:43f:e623:952 with SMTP id
 m69-20020a1f3f48000000b0043fe6230952mr348006vka.2.1684403168081; Thu, 18 May
 2023 02:46:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230517135714.211809-1-dbarboza@ventanamicro.com>
In-Reply-To: <20230517135714.211809-1-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 18 May 2023 19:45:42 +1000
Message-ID: <CAKmqyKM6iiwSUvGRctpNCdZEcDVDqg1qaszn903UTkJ8fgY9WA@mail.gmail.com>
Subject: Re: [PATCH v9 00/11] target/riscv: rework CPU extension validation
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a32;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa32.google.com
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

On Wed, May 17, 2023 at 11:59=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Hi,
>
> In this version we have a change in patch 11. We're now firing a
> GUEST_ERROR if write_misa() fails and we need to rollback (i.e. not
> change MISA ext).
>
> No other changes made.
>
> Changes from v8:
> - patch 11:
>   - log a GUEST_ERROR if we decided to keep the current env->misa_ext
>     value because the user value failed our validation
> - v8 link: https://lists.gnu.org/archive/html/qemu-devel/2023-04/msg03584=
.html
>
>
> Daniel Henrique Barboza (9):
>   target/riscv/cpu.c: add riscv_cpu_validate_v()
>   target/riscv/cpu.c: remove set_vext_version()
>   target/riscv/cpu.c: remove set_priv_version()
>   target/riscv: add PRIV_VERSION_LATEST
>   target/riscv/cpu.c: add priv_spec validate/disable_exts helpers
>   target/riscv/cpu.c: add riscv_cpu_validate_misa_mxl()
>   target/riscv/cpu.c: validate extensions before riscv_timer_init()
>   target/riscv/cpu.c: remove cfg setup from riscv_cpu_init()
>   target/riscv: rework write_misa()

Thanks!

Applied to riscv-to-apply.next

Alistair

>
> Weiwei Li (2):
>   target/riscv: Mask the implicitly enabled extensions in isa_string
>     based on priv version
>   target/riscv: Update check for Zca/Zcf/Zcd
>
>  target/riscv/cpu.c                      | 333 ++++++++++++++----------
>  target/riscv/cpu.h                      |   3 +
>  target/riscv/csr.c                      |  51 ++--
>  target/riscv/insn_trans/trans_rvd.c.inc |  12 +-
>  target/riscv/insn_trans/trans_rvf.c.inc |  14 +-
>  target/riscv/insn_trans/trans_rvi.c.inc |   5 +-
>  target/riscv/translate.c                |   5 +-
>  7 files changed, 248 insertions(+), 175 deletions(-)
>
> --
> 2.40.1
>
>

