Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10076C7EE23
	for <qemu-riscv@archiver.kernel.org>; Fri,  2 Jun 2023 03:11:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q4vC3-0001oo-GP; Thu, 01 Jun 2023 23:11:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q4vC1-0001oU-8F; Thu, 01 Jun 2023 23:11:10 -0400
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q4vBy-0007cn-VS; Thu, 01 Jun 2023 23:11:09 -0400
Received: by mail-vs1-xe2b.google.com with SMTP id
 ada2fe7eead31-437daacde18so438555137.1; 
 Thu, 01 Jun 2023 20:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685675465; x=1688267465;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b/8R4PyRwTgAonXNwkjhqKdhCP1yaztTNtLxCPnmzZE=;
 b=GRbGZfO5jqK4rEPsaGyG35Ybw6JSY7dLJnwkXWkI4jeAz90SA/gk8uZl0WnQJSANmG
 mpPAb4QIPNp5IGtrU4EiUI63ZxAy006RhskuTbls8lHv88C4caHHkfuxUKLIH5H2322m
 1wKshnKH/1jl9bhbhGJR3+bxRmRpD6a37vL3HPt/CLWrkqLOj9goeCz8Apt+OWXFuSsr
 e8J9dytNOAcTLxcW1PK/iMas+UdfIVqrhC5YQM9MHtcOhSGY80zywCjx7faSCoZRI/Xv
 KXvAdnWlA2onLKwcZiTvrp3gMWBTGRA751YiPu88drFNVW7n+oT/ejGc7krfbO1AXElO
 /ugw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685675465; x=1688267465;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b/8R4PyRwTgAonXNwkjhqKdhCP1yaztTNtLxCPnmzZE=;
 b=PQ9aDNP1I1p1INetjg6Kgh5tZ4A4zg4DqYljejmlBC8qjd/0ov6AUif0YwVlbBxYXx
 6/O/zgK3tHKiPDByK7zzRX40D8mhaZja+SI+YjvZMAL9aIDMf3VcbGE/TZCXaQKk8/1U
 nws+RKyOU53e258RNKrY9D9iZqi8LRohAoe18a4b9Vssee24KPZAnEvKxDdc2uFPTq3d
 4IKQhuAjhAEH1Sm/SUvJjNAhNqqPaFTRicSPcZuhl/kY6BnsYtbpDPDCFq6B9j+Bu1Ut
 +w7OV4RkLT88hp9vlqTlvPAaP3TID3vxDMJ8M3t7WKlqGuPgb7kNxlVHCqJA2Ysc6ZYV
 FQ/w==
X-Gm-Message-State: AC+VfDwI3B9A3yhIEaUmyGu0u5nO6rJMXYwMGKQGopIpCl/x/nkqA6NC
 AvQG129MJzTwS6CUd6ct3moGA1nW8HGJ4JX6hntO9eeYLDkmZg==
X-Google-Smtp-Source: ACHHUZ4iQsJJ3LHCc+4qkv3l2TyGyySFjet9/5sPxmdLsJ6a1yj2x2gzx4NX0Kf5SyQNrHNLTQpKIO2WFpVhrUz1VnI=
X-Received: by 2002:a67:bd05:0:b0:436:2210:9499 with SMTP id
 y5-20020a67bd05000000b0043622109499mr5478659vsq.19.1685675465428; Thu, 01 Jun
 2023 20:11:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230526162308.22892-1-rkanwal@rivosinc.com>
 <20230526162308.22892-2-rkanwal@rivosinc.com>
In-Reply-To: <20230526162308.22892-2-rkanwal@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 2 Jun 2023 13:10:39 +1000
Message-ID: <CAKmqyKPD9B-dPFGaJX6vd7=pPwkeEN=OiKn3y0j+fbfB7DGcpw@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] target/riscv: Without H-mode mask all HS mode
 inturrupts in mie.
To: Rajnesh Kanwal <rkanwal@rivosinc.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn, 
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, atishp@rivosinc.com, 
 apatel@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2b;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2b.google.com
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

On Sat, May 27, 2023 at 2:25=E2=80=AFAM Rajnesh Kanwal <rkanwal@rivosinc.co=
m> wrote:
>
> Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/csr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 4451bd1263..041f0b3e2e 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1522,7 +1522,7 @@ static RISCVException rmw_mie64(CPURISCVState *env,=
 int csrno,
>      env->mie =3D (env->mie & ~mask) | (new_val & mask);
>
>      if (!riscv_has_ext(env, RVH)) {
> -        env->mie &=3D ~((uint64_t)MIP_SGEIP);
> +        env->mie &=3D ~((uint64_t)HS_MODE_INTERRUPTS);
>      }
>
>      return RISCV_EXCP_NONE;
> --
> 2.25.1
>
>

