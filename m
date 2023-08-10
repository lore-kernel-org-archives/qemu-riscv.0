Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C62EFC001DE
	for <qemu-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 17:52:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qU9pS-000358-LT; Thu, 10 Aug 2023 13:52:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qU9pN-000346-69; Thu, 10 Aug 2023 13:52:08 -0400
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qU9pL-0006Sj-0E; Thu, 10 Aug 2023 13:52:04 -0400
Received: by mail-vs1-xe2f.google.com with SMTP id
 ada2fe7eead31-4476a50c64bso512222137.3; 
 Thu, 10 Aug 2023 10:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691689921; x=1692294721;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7liM4bAskK9vbRLyXQCQYVppIO1n1eZ5Lif1+PyvVZQ=;
 b=dNpnD0/6byYM4AFG3CwaimKndLnPyenlA0gDIzza1CPkFQS0UwO7SlRhg14Rdu9/2a
 YWPD+XL6ifmhpUHH1sA/cPKysc5OfjuHQnicFjMSnqdI3tu6OyBJFkOgCQtBFt4WSx02
 8/09g1Q/hSoIxa4lSiQ6MDsSDSOlAcXfIzRnPBqr7N/LDb47CzS3J2aOPUAbd52SBpd5
 zEz/x1KnVmlsfCI01KT1WY6LiOplyxL5mj509g09VwxljNxjYcaNr6wr5dsEiWGNKVoL
 xbqNt3iXalbOGD3F5hhZYMLVnMHA3ib/kYEEyJWl1Ie+/r/j4QyM1if2RcPHTBSPzVwI
 q+oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691689921; x=1692294721;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7liM4bAskK9vbRLyXQCQYVppIO1n1eZ5Lif1+PyvVZQ=;
 b=Bp/wSu5Uzg3ddtnXEO6DmHDg3HwzChMxNqmAYHS5Xd2E+izHNU7zIRcbS7sX9+zutb
 9Q3l0lvkQitOa3px1XxXk6SQh/DKu14DKVSsC+ISnv0NTiggpSjxr/F9A/QZW3R+bG9R
 ++nCin2KBNSYnKQRMnOMYgDOO67SPyy+S0BqHPXqb2ENWAAI77zB3iSiLtogVnqAX6UF
 JtMBH9eA+bF7dDuewl+E62c2XGgtB+uRH5Nkq3MLVI8aNWD82J8XGQHsIDCCicseHAdB
 wahAWJJ4M6gj6GLuUbqDfy8hoNXGvLv6qTwBOxkKAQblbzYvCK7MXUdLZMfvquJmZW44
 6rwA==
X-Gm-Message-State: AOJu0YxXABj9a65tNOti4NEVo/XXnWYAEG/RxhdYGVkmqAwL5ClMVgRT
 KVMr/bN3zRUUoB23aGmIkAHVu/83WWPhuhLJ2b0=
X-Google-Smtp-Source: AGHT+IHkFmKpiKkfQsRgF3qLqS7lxyOrYsbSZfCeA6iOb0KpZKLL1TOR0pEbn7qD6apZWDP6/ZYCFXj15hNuG4eGyXo=
X-Received: by 2002:a67:e8da:0:b0:447:6901:a090 with SMTP id
 y26-20020a67e8da000000b004476901a090mr2223115vsn.35.1691689921331; Thu, 10
 Aug 2023 10:52:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230727220927.62950-1-dbarboza@ventanamicro.com>
 <20230727220927.62950-13-dbarboza@ventanamicro.com>
In-Reply-To: <20230727220927.62950-13-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 10 Aug 2023 13:51:35 -0400
Message-ID: <CAKmqyKNFkeXdwTiszmXrzX3cYvYVNn8AfrDX7Vrsg1+=Va2ofg@mail.gmail.com>
Subject: Re: [PATCH v6 12/12] target/riscv: deprecate the 'any' CPU type
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2f;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2f.google.com
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

On Thu, Jul 27, 2023 at 6:39=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> The 'any' CPU type was introduced in commit dc5bd18fa5725 ("RISC-V CPU
> Core Definition"), being around since the beginning. It's not an easy
> CPU to use: it's undocumented and its name doesn't tell users much about
> what the CPU is supposed to bring. 'git log' doesn't help us either in
> knowing what was the original design of this CPU type.
>
> The closest we have is a comment from Alistair [1] where he recalls from
> memory that the 'any' CPU is supposed to behave like the newly added
> 'max' CPU. He also suggested that the 'any' CPU should be removed.
>
> The default CPUs are rv32 and rv64, so removing the 'any' CPU will have
> impact only on users that might have a script that uses '-cpu any'.
> And those users are better off using the default CPUs or the new 'max'
> CPU.
>
> We would love to just remove the code and be done with it, but one does
> not simply remove a feature in QEMU. We'll put the CPU in quarantine
> first, letting users know that we have the intent of removing it in the
> future.
>
> [1] https://lists.gnu.org/archive/html/qemu-devel/2023-07/msg02891.html
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  docs/about/deprecated.rst | 12 ++++++++++++
>  target/riscv/cpu.c        |  5 +++++
>  2 files changed, 17 insertions(+)
>
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index 02ea5a839f..68afa43fd0 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -371,6 +371,18 @@ QEMU's ``vhost`` feature, which would eliminate the =
high latency costs under
>  which the 9p ``proxy`` backend currently suffers. However as of to date =
nobody
>  has indicated plans for such kind of reimplemention unfortunately.
>
> +RISC-V 'any' CPU type ``-cpu any`` (since 8.2)
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +The 'any' CPU type was introduced back in 2018 and has been around since=
 the
> +initial RISC-V QEMU port. Its usage has always been unclear: users don't=
 know
> +what to expect from a CPU called 'any', and in fact the CPU does not do =
anything
> +special that aren't already done by the default CPUs rv32/rv64.
> +
> +After the introduction of the 'max' CPU type RISC-V now has a good cover=
age
> +of generic CPUs: rv32 and rv64 as default CPUs and 'max' as a feature co=
mplete
> +CPU for both 32 and 64 bit builds. Users are then discouraged to use the=
 'any'
> +CPU type starting in 8.2.
>
>  Block device options
>  ''''''''''''''''''''
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 3e840f1a20..b5a2266eef 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1477,6 +1477,11 @@ static void riscv_cpu_realize(DeviceState *dev, Er=
ror **errp)
>      RISCVCPUClass *mcc =3D RISCV_CPU_GET_CLASS(dev);
>      Error *local_err =3D NULL;
>
> +    if (object_dynamic_cast(OBJECT(dev), TYPE_RISCV_CPU_ANY) !=3D NULL) =
{
> +        warn_report("The 'any' CPU is deprecated and will be "
> +                    "removed in the future.");
> +    }
> +
>      cpu_exec_realizefn(cs, &local_err);
>      if (local_err !=3D NULL) {
>          error_propagate(errp, local_err);
> --
> 2.41.0
>
>

