Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7309DEB64D7
	for <qemu-riscv@archiver.kernel.org>; Thu, 22 Jun 2023 02:31:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qCA6V-0004fM-LN; Wed, 21 Jun 2023 22:31:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qCA6T-0004eW-BJ; Wed, 21 Jun 2023 22:31:21 -0400
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qCA6R-0005nz-PO; Wed, 21 Jun 2023 22:31:21 -0400
Received: by mail-vk1-xa2b.google.com with SMTP id
 71dfb90a1353d-4718bc88afdso137863e0c.0; 
 Wed, 21 Jun 2023 19:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687401078; x=1689993078;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iJIBVtz65dTcztWlQG+ldPtBFsQy64k73NwZLQlOEhw=;
 b=cUlSLAlzdCIEyYP0nl1FIaTAO03DuqMl+032wwZEjYwcbvWABLcQ4/4zR+iT6q83pE
 1FCwHF7xlsoBm9lKshEtkX+JsGf5511oUnWQVVeYT5jvO/itZROCAW5e9z867CK4clmM
 7G4YecCtxZ9hNBA2otZOUqmrA/SKLOeqZ6PpONnR7uEF/NETWABJuBvdTnTEqxd11XGk
 Czr+ZDRhyK1b2J8FAgs96H7Zp2TUpICCbpBtJ70aGPoWu0Zb42G/h9kMXYaMUXxATxtU
 Cd+gREcWe3FZtzWE97RziFfe0ilvncL+BcDlZiMqAbqbmnNjIzMZdclGS0FpQ/EMFXZl
 Mqow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687401078; x=1689993078;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iJIBVtz65dTcztWlQG+ldPtBFsQy64k73NwZLQlOEhw=;
 b=F93Ts1hEZjB/KhBrCvJuHDOVDA/nd4SIq8x6x0YqtuYcJ5voVFYGbcZpPegnGS37+V
 hAPhKnoM8Fmp27TwuCrPL9jIJP83blY2ZDzJnGn9NXD5mFJRxE1PF75N0mAfXVqnKzA0
 g7s+G/wl8c9OLhi2KJBEX7sBtSqhG2Xj7uoPnrSRnrzHdKOvUBQUralZV7Z2kbS1YUel
 /+Aowihz5iUqLGinJmcAXr8cAvss0LvWASKykP98sHqJ0QBdYMlES0OlpXfb53pcXWiT
 pPpN4YKgELPZIwnacXOThY5dxLLQN2mZNvIJYKcaAavGnBsbA2A/wbiO3TOGp2sFZzK/
 Skxg==
X-Gm-Message-State: AC+VfDzBSpm2vT8skxFQ8aXNEB6xihvCWIW4l3MUqvpyjsqX6vI7ABQk
 xtit0RQhmR3VF8HH8AqeISYHLwm+JEF4LsyBht4=
X-Google-Smtp-Source: ACHHUZ4mNlWHs8sTmjap5bX4Mq1R/EfL2/vfhwz7FHw3v5UX6HnFfg/mjzZhVmR4p9LCHNYW9I0W8D20XGgzGPMdHXY=
X-Received: by 2002:a05:6122:a08:b0:466:3bd9:778 with SMTP id
 8-20020a0561220a0800b004663bd90778mr5456683vkn.6.1687401078339; Wed, 21 Jun
 2023 19:31:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230620152443.137079-1-dbarboza@ventanamicro.com>
In-Reply-To: <20230620152443.137079-1-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 22 Jun 2023 12:30:52 +1000
Message-ID: <CAKmqyKNYdL6ftV-5OYRzTKfHm4ehYrA+kCuJwzdpsko9Bc0B4Q@mail.gmail.com>
Subject: Re: [PATCH] target/riscv/cpu.c: fix veyron-v1 CPU properties
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2b;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2b.google.com
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

On Wed, Jun 21, 2023 at 1:25=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Commit 7f0bdfb5bfc2 ("target/riscv/cpu.c: remove cfg setup from
> riscv_cpu_init()") removed code that was enabling mmu, pmp, ext_ifencei
> and ext_icsr from riscv_cpu_init(), the init() function of
> TYPE_RISCV_CPU, parent type of all RISC-V CPUss. This was done to force
> CPUs to explictly enable all extensions and features it requires,
> without any 'magic values' that were inherited by the parent type.
>
> This commit failed to make appropriate changes in the 'veyron-v1' CPU,
> added earlier by commit e1d084a8524a. The result is that the veyron-v1
> CPU has ext_ifencei, ext_icsr and pmp set to 'false', which is not the
> case.
>
> The reason why it took this long to notice (thanks LIU Zhiwei for
> reporting it) is because Linux doesn't mind 'ifencei' and 'icsr' being
> absent in the 'riscv,isa' DT, implying that they're both present if the
> 'i' extension is enabled. OpenSBI also doesn't error out or warns about
> the lack of 'pmp', it'll just not protect memory pages.
>
> Fix it by setting them to 'true' in rv64_veyron_v1_cpu_init() like
> 7f0bdfb5bfc2 already did with other CPUs.
>
> Reported-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Fixes: 7f0bdfb5bfc2 ("target/riscv/cpu.c: remove cfg setup from riscv_cpu=
_init()")
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/cpu.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 881bddf393..707f62b592 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -444,6 +444,9 @@ static void rv64_veyron_v1_cpu_init(Object *obj)
>
>      /* Enable ISA extensions */
>      cpu->cfg.mmu =3D true;
> +    cpu->cfg.ext_ifencei =3D true;
> +    cpu->cfg.ext_icsr =3D true;
> +    cpu->cfg.pmp =3D true;
>      cpu->cfg.ext_icbom =3D true;
>      cpu->cfg.cbom_blocksize =3D 64;
>      cpu->cfg.cboz_blocksize =3D 64;
> --
> 2.41.0
>
>

