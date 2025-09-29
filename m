Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF90CAC5B5
	for <qemu-riscv@archiver.kernel.org>; Mon, 29 Sep 2025 00:57:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v32Co-0002FQ-Sm; Sun, 28 Sep 2025 20:57:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v32Cj-0002F2-NG
 for qemu-riscv@nongnu.org; Sun, 28 Sep 2025 20:57:28 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v32CR-0005gB-A3
 for qemu-riscv@nongnu.org; Sun, 28 Sep 2025 20:57:24 -0400
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-b3d196b7eeeso143765066b.0
 for <qemu-riscv@nongnu.org>; Sun, 28 Sep 2025 17:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759107418; x=1759712218; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6oYiUxuZrY/cRMxEZa49T2EtwVNjsg6dbtSfjkUPYkQ=;
 b=aJnoejcDGlqzh2eBMdJo8K77TgkmHNl9hGdRtub1qce9NVbEoAaK8TBglA2phIujb9
 zl6PmMjI+v/KChdbTObB6e2gkw5KSe9PWwx2EcmT/Pv/fvA/ki8n5PL10pXLT1U26m8L
 LQubz126O9g18/srlDkRNHf1E4E1sNeR2mx/bMzGzuldPDIiyFX09121gIK5SeS33TMn
 62qqLErjCGe6hrLg80qdzRtRQjUTWGWghFXuRNvmshXtkC4GyLcgNlbXgmnloIpNsB6R
 fm3cu6MsRcfQPPoENyXzxbVxmjuDxEkHpIXVpYhYDyTBQ2dtPQELMjTr+jmgXRd/y9KB
 VcjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759107418; x=1759712218;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6oYiUxuZrY/cRMxEZa49T2EtwVNjsg6dbtSfjkUPYkQ=;
 b=WLzAkgyCHXHGlvXaeDSVWBbtUmGS9kYSUtbT/dt7G3rOV7bBycVf/x8C76N3OBpDEx
 j7L7dpz75A3FEJnIkx4yUA4PhvzpE4oTqWahe9+6YE0t43mYJz6s9k1sTh9ydEn0k8wP
 FrlO/79crxUZAdQGuJHy9UKVk2uPHLYIB0OZ6J/+PH0TZA+6cNF9Oj4H5kmbDuXqTVyp
 Y622pJeUCKtZYMDbaoYz4hqynvY1Uv6q+hXeWD/KwuIWKSAySHfFYZdd0+hn9YyvxtDG
 I6juUxcuxdOg72yg6fw0/c1ygPn2JrDnvN0jTn+AzFrcXowTu3EzQXWXk/QnR1Qc7AeH
 Or1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8+auGtkjjx3hBUMqlrTV4MXveYP3V3FHG/mAznTmFHX6gDYtzlrXP7kFmRnmHCs1AQSRab2BxinXs@nongnu.org
X-Gm-Message-State: AOJu0YzNlI1hEcLW+l5f6XCunsPdev3Q93vqAAIfObO7pS36xW+h/8LS
 3kfruWMSM0XkszALgM/gMIdepuRjnTQXuc+HvUhjnfl9b2qXSyhjZ39EmwwvG6P9AkAxw0VOkEQ
 Pfh/0xz0/pdERDyAnxfYdc0ZcF5kwgJyuSQ==
X-Gm-Gg: ASbGncuqYioL5pX0Km37DaTr5UI1n4CVRYolAT+I1Pp6YJn5+NeA5UFb983LKWNjVf9
 lRVIxqe6poewFihiOGwr411a0WsFj+NTP/hbEXaTsR8eq0/M6VpDEKiglh/4hD3r4GfStVWAJNO
 izEScxc4aBZGayGBnFPMzj+S+l8LNb4HRN5YFRsmndde0JDEbUCLbPkOtBmtbmRK/lUP9o7TMt4
 2zcYV1DyCN0fdKbC4Cj+nU235NpUZMkAIC5Ig==
X-Google-Smtp-Source: AGHT+IG1cK/dspQm0ceqpQJck58zZYXhcEvBP85WP0OJmmMedA3UoDshMW62Z6F+aTJuff7/NVzHaBCIXn048vWnGvk=
X-Received: by 2002:a17:907:1c15:b0:b32:8943:786f with SMTP id
 a640c23a62f3a-b34bd43e835mr1620484866b.58.1759107417782; Sun, 28 Sep 2025
 17:56:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250924074818.230010-1-jim.shu@sifive.com>
In-Reply-To: <20250924074818.230010-1-jim.shu@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 29 Sep 2025 10:56:31 +1000
X-Gm-Features: AS18NWBiy7aGFuB_irdHsOzwD4jfs6u2xCjmzTAOUGlrMuDnei41NSUIkG8ScPQ
Message-ID: <CAKmqyKN9NV8TAXzTyxqKXzX-GM3t01hnAibk=OfP3Uw1Yu380w@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] Minor fixes of RISC-V CFI
To: Jim Shu <jim.shu@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=alistair23@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

On Wed, Sep 24, 2025 at 5:50=E2=80=AFPM Jim Shu <jim.shu@sifive.com> wrote:
>
> This patch series contains several CFI fixes:
>   (1) Fix the mepc in the exception from sspopchk instruction
>   (2) Fix the exception type from SSP CSR and ssamoswap instruction
>
> Jim Shu (3):
>   target/riscv: Fix the mepc when sspopchk triggers the exception
>   target/riscv: Fix SSP CSR error handling in VU/VS mode
>   target/riscv: Fix ssamoswap error handling

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  target/riscv/csr.c                            |  2 +
>  target/riscv/helper.h                         |  5 ++
>  target/riscv/insn_trans/trans_rvzicfiss.c.inc |  9 ++++
>  target/riscv/op_helper.c                      | 49 +++++++++++++++++++
>  4 files changed, 65 insertions(+)
>
> --
> 2.43.0
>
>

