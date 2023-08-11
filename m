Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B84ABC001DB
	for <qemu-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 14:55:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qUTXI-0000CV-5N; Fri, 11 Aug 2023 10:54:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qUTXG-0000Bn-8s; Fri, 11 Aug 2023 10:54:42 -0400
Received: from mail-vk1-xa34.google.com ([2607:f8b0:4864:20::a34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qUTXE-0002a8-Lq; Fri, 11 Aug 2023 10:54:42 -0400
Received: by mail-vk1-xa34.google.com with SMTP id
 71dfb90a1353d-48719981585so747602e0c.2; 
 Fri, 11 Aug 2023 07:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691765679; x=1692370479;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xaw+CGkLrDTbJL+8DS7nKM/nNvQbpXTeAQGJy5NjyHE=;
 b=okAsffy01XeLSx3v6AtSXJ7XnQQ6JOyuoH8FnrnQbJNyqMAgqPQRGCIOHzJtEoBfeV
 DHbGy9f4tSCKMx0Yt6BFgZURLiIBH76Vs5uLGj1LjGTfkWWt39/bsBhbWppVr7GFmAdb
 VsRSrCDSpHGZ99H3303H5bmD1t7ZAI6ZxaMcae0kcCDDjqmEA4GS9kdsblj+LGhajgt/
 Mq+D4NFcku7XEa7gspDRBDLQLVPHVEiBc7PSlHwKx1r2OHIcZWwGFA1l4+t/Gb5qkq7W
 ezg5TB+jTugmKw50jV0UWy7ZEx8EfxE3pLc+Z8Jx4fom1Rne6Ej3u/0EHfrKJvUI98RI
 y9ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691765679; x=1692370479;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xaw+CGkLrDTbJL+8DS7nKM/nNvQbpXTeAQGJy5NjyHE=;
 b=dwkug4cIF6NzmMDUfmsnwhd34aPKixYm3Fx2D7CKKpkAhW5kp0+Sza1I6FfgJbtWnI
 7zlIZbpz/pW8evw3NyOq4ZvJESUv0pqrwTrDqgAsC/TVTUSCUnEINZcU9+uoTqzoWvwE
 A8qiQavNlJSFiGMOP6aUcv6cIOY5Lhrw6gYRKfAT7RQsBfJKRFDUHPkCTerJHLzD2DoU
 rprViz3tm56sCq9zNT52mSasY2p4HjHrcpb+bh9yk1lI00ZMPGFZ+9VKlqJxKO+/Ca0K
 1U8DycslIhekaX2WPiKBkvyP4ywzaAB69wR9BoxOh83Jvd1K3pH+hSnRRMMFfjNvb1Xy
 M8qQ==
X-Gm-Message-State: AOJu0YzjSfuuFWC1HEgnDrpVQg8SYVmvpd6EZQgPUeZI/fq/UMVnalOz
 mF2goZwr2gk9cWGSi13WHRgTu+h2C7ujg71zyXU=
X-Google-Smtp-Source: AGHT+IH6vLpqjZkBWqALdQNdNzIpYN9TDiv+Xr+kgs+0BhNbAWd42Ae5KQlgbREiwqvklhjZc2+M3uaGO5l4pYQ4lTs=
X-Received: by 2002:a1f:3d87:0:b0:486:3e81:9b8a with SMTP id
 k129-20020a1f3d87000000b004863e819b8amr2155090vka.13.1691765679291; Fri, 11
 Aug 2023 07:54:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230727-groom-decline-2c57ce42841c@spud>
In-Reply-To: <20230727-groom-decline-2c57ce42841c@spud>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 11 Aug 2023 10:54:13 -0400
Message-ID: <CAKmqyKOKenm506+xvdLnf_h09k-s4=_UzTJ-sZy5J=rAWztMTg@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: virt: Fix riscv,pmu DT node path
To: Conor Dooley <conor@kernel.org>
Cc: qemu-riscv@nongnu.org, Conor Dooley <conor.dooley@microchip.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a34;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa34.google.com
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

On Thu, Jul 27, 2023 at 10:37=E2=80=AFAM Conor Dooley <conor@kernel.org> wr=
ote:
>
> From: Conor Dooley <conor.dooley@microchip.com>
>
> On a dtb dumped from the virt machine, dt-validate complains:
> soc: pmu: {'riscv,event-to-mhpmcounters': [[1, 1, 524281], [2, 2, 524284]=
, [65561, 65561, 524280], [65563, 65563, 524280], [65569, 65569, 524280]], =
'compatible': ['riscv,pmu']} should not be valid under {'type': 'object'}
>         from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
> That's pretty cryptic, but running the dtb back through dtc produces
> something a lot more reasonable:
> Warning (simple_bus_reg): /soc/pmu: missing or empty reg/ranges property
>
> Moving the riscv,pmu node out of the soc bus solves the problem.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
> CC: Palmer Dabbelt <palmer@dabbelt.com>
> CC: Alistair Francis <alistair.francis@wdc.com>
> CC: Bin Meng <bin.meng@windriver.com>
> CC: Weiwei Li <liweiwei@iscas.ac.cn>
> CC: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> CC: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
> CC: qemu-riscv@nongnu.org
> CC: qemu-devel@nongnu.org
> ---
>  hw/riscv/virt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index d90286dc46..25dcc2616e 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -732,7 +732,7 @@ static void create_fdt_pmu(RISCVVirtState *s)
>      MachineState *ms =3D MACHINE(s);
>      RISCVCPU hart =3D s->soc[0].harts[0];
>
> -    pmu_name =3D g_strdup_printf("/soc/pmu");
> +    pmu_name =3D g_strdup_printf("/pmu");
>      qemu_fdt_add_subnode(ms->fdt, pmu_name);
>      qemu_fdt_setprop_string(ms->fdt, pmu_name, "compatible", "riscv,pmu"=
);
>      riscv_pmu_generate_fdt_node(ms->fdt, hart.cfg.pmu_num, pmu_name);
> --
> 2.39.2
>
>

