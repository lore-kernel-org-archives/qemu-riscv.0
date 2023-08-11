Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E993C0015E
	for <qemu-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 15:06:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qUTiP-00079o-FI; Fri, 11 Aug 2023 11:06:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qUTiN-00079I-2g; Fri, 11 Aug 2023 11:06:11 -0400
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qUTiE-0005do-BS; Fri, 11 Aug 2023 11:06:08 -0400
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-1a1fa977667so1770095fac.1; 
 Fri, 11 Aug 2023 08:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691766360; x=1692371160;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VTcLEnd/zpGW5dMMhX79pwcx3lsMZ9GVWbofPSJ+FyY=;
 b=qvmOJTe7Kkkw8zPgnra9zIsVhVb7b/0MlWTiuQilW1JBmC+5GKVWMJF1k39Ys8e77P
 Yqexow4gg+Du8EzS+qAv1L1rP1+aIYuEtwyGl2jPJUiiw7VDXXZ5Ie2RZT1G2Kzy5fv/
 2by96/ciltyJeopnOqvnviHqeGutLty7YXA+IvDWvXBYPUDb7jfcOU+qmC25mc1+Bf4s
 zGggmdYoDlyqm7FlJ5Ld2KZH0ryqcX/Kgmuk7ohE6OhBp5ZWeZMncTX4JRs/8pFVRWEf
 Wz3aBqKMvL6fDxPsDx70wxTJ9sm8CUyRZQo2WFhggWG7SU6kJKI9gY0d4EC5SSmCO9po
 dkwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691766360; x=1692371160;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VTcLEnd/zpGW5dMMhX79pwcx3lsMZ9GVWbofPSJ+FyY=;
 b=VvdXPi0+qoI/+fxp8gvCdHL7nvFlMF9fa1DOQmaWN/cvUcYHl4AZqpfctOdSJk5h+B
 4mg6xXNyZJ7Eudkl7Fpuauyi7f22fPWZfZF99TeB6hf8u6LaGGmN/UmZNWk/b+0peHEt
 GvIMRcKe7QF1HbaYa+ajipeTsBtvprtfqXcgBUPAyvqpAuiV4lkC7pPk+TbC9Kn5x4Df
 4TrlMy9Q32ckDcPMVvquuVL/i8QeKCdPIzAJxRqYINdD8C/sPI9/XkESd+BKqI1PMrrz
 zX48VNqigJVj4E9a9AA7AR/Gjd6avKqZl+6y5S+Yw1iknLkNlIEkhg0qa3jMoWbiL6qz
 03fg==
X-Gm-Message-State: AOJu0YzoxbenOZe4jFIRckA5nO2doZ0PzNywImFJzUBn2n96zrZ48gRn
 SuslUspNEVtLQqJEPlxtLv2QhOGbNe5kMj7bhiek6QK0Eg3iQg==
X-Google-Smtp-Source: AGHT+IFTCnRNUy1PTsV+X7BKbJ6Cd38NPD1fOH9utFSTRpq53So4e8vmtRuiCHxOuzZrTGnNxGem8hFYgWuvk+OI+BI=
X-Received: by 2002:a05:6358:8a3:b0:133:a55:7e26 with SMTP id
 m35-20020a05635808a300b001330a557e26mr2629253rwj.7.1691766358183; Fri, 11 Aug
 2023 08:05:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230728131520.110394-1-dbarboza@ventanamicro.com>
 <20230728131520.110394-9-dbarboza@ventanamicro.com>
In-Reply-To: <20230728131520.110394-9-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 11 Aug 2023 11:05:32 -0400
Message-ID: <CAKmqyKO+MtFfZiCFofH8=vfvWmk62hdiia9xovM+3AdbWPFMcQ@mail.gmail.com>
Subject: Re: [PATCH 8/8] target/riscv/cpu.c: consider user option with RVG
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=alistair23@gmail.com; helo=mail-oa1-x35.google.com
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

On Fri, Jul 28, 2023 at 9:39=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Enabling RVG will enable a set of extensions that we're not checking if
> the user was okay enabling or not. And in this case we want to error
> out, instead of ignoring, otherwise we will be inconsistent enabling RVG
> without all its extensions.
>
> After this patch, disabling ifencei or icsr while enabling RVG will
> result in error:
>
> $ ./build/qemu-system-riscv64 -M virt -cpu rv64,g=3Dtrue,Zifencei=3Dfalse=
 --nographic
> qemu-system-riscv64: warning: Setting G will also set IMAFD_Zicsr_Zifence=
i
> qemu-system-riscv64: RVG requires Zifencei but user set Zifencei to false
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 644d0fdad2..72a36b47ed 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1135,8 +1135,22 @@ void riscv_cpu_validate_set_extensions(RISCVCPU *c=
pu, Error **errp)
>            riscv_has_ext(env, RVD) &&
>            cpu->cfg.ext_icsr && cpu->cfg.ext_ifencei)) {
>          warn_report("Setting G will also set IMAFD_Zicsr_Zifencei");
> -        cpu->cfg.ext_icsr =3D true;
> -        cpu->cfg.ext_ifencei =3D true;
> +
> +        if (cpu_cfg_ext_is_user_set(CPU_CFG_OFFSET(ext_icsr)) &&
> +            !cpu->cfg.ext_icsr) {
> +            error_setg(errp, "RVG requires Zicsr but user set Zicsr to f=
alse");
> +            return;
> +        }
> +
> +        if (cpu_cfg_ext_is_user_set(CPU_CFG_OFFSET(ext_ifencei)) &&
> +            !cpu->cfg.ext_ifencei) {
> +            error_setg(errp, "RVG requires Zifencei but user set "
> +                       "Zifencei to false");
> +            return;
> +        }
> +
> +        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_icsr), true);
> +        cpu_cfg_ext_auto_update(cpu, CPU_CFG_OFFSET(ext_ifencei), true);
>
>          env->misa_ext |=3D RVI | RVM | RVA | RVF | RVD;
>          env->misa_ext_mask |=3D RVI | RVM | RVA | RVF | RVD;
> --
> 2.41.0
>
>

