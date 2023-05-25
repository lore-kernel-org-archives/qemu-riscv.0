Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93E75C77B7A
	for <qemu-riscv@archiver.kernel.org>; Thu, 25 May 2023 02:25:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q20eu-0004vQ-CR; Wed, 24 May 2023 22:24:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q20et-0004vD-6e; Wed, 24 May 2023 22:24:55 -0400
Received: from mail-ua1-x930.google.com ([2607:f8b0:4864:20::930])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q20er-0001jZ-MW; Wed, 24 May 2023 22:24:54 -0400
Received: by mail-ua1-x930.google.com with SMTP id
 a1e0cc1a2514c-78412128326so327477241.1; 
 Wed, 24 May 2023 19:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684981492; x=1687573492;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jCtFZnvx1qWlxTGkVgOWwspZc2m1HIv/OKvz8Slc7cM=;
 b=WRTabr6PtVwxG7yZ95XkhNSObMlFRZgV/gHohNTelUMoIyqRZ9qLajfAkcWbzgPL2L
 B1B242emfYEgiesv0yysBpiJCsFsKIyL3vie80k1MHPxQjdKAjDRXXkf2Stfd65XB35F
 BRg2Shx91LHjPmUY5gpor4H6/EwEKbt/46p/IeU/Jx23wnZeVPo2DuYeVksUomM2TPyH
 oMoxKCkPzALL7UJwJ0yEcNwns/n/RxXkJgg634ikOdv0Z8iNYG2ZW6Y0d0huhVmsZB0r
 temm53C/01GAGFwTRo8qFb8W3J0musll5J397OaDkEZaSBzp6aHFfl+nt6LPNzO/NyRr
 Z0vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684981492; x=1687573492;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jCtFZnvx1qWlxTGkVgOWwspZc2m1HIv/OKvz8Slc7cM=;
 b=J5I11GEQtynGi82RjQJifJ8/B9QclezTdLTGswcP/iBFym+kigTcI4MLXcB5/hvkBQ
 utisWdaH2dSJwgIi6TMWuSillXGIDHWxfLNPGnexp17tgk+C6QSile4mSuaq22RGS/Ga
 suXLw9B4dF/GQ3U90gCBusvA2MhbKA/FAtpeJEzYLOHxZ6rePuc7H68wjJvQo99zVdGq
 omtpzh1np8vb81M2pZhTOAP3aqU5GLxRb5c7yB7UIDJA6OmpbgLScTPrKAPtWO8g7HTV
 IM/vUAnWISEq8G1QP3kUvRfY5ShWRg4n8D1EFuWeVsqcfGQdH57iaJK23W0CNkt4yRD2
 qkpA==
X-Gm-Message-State: AC+VfDz6eT7usjB4SvjZhBVzA6uWVbgLl+cqggoFZ6Jdupa31SO1+h+a
 1fag7+QlVyZQqrhpreUovnZAfto15P0fsd1db+A=
X-Google-Smtp-Source: ACHHUZ6EKWYrv0PyC2gibzp0pb/uIDqfCI6bmRmJHX9gll/F3UXp7sSEr0qTJIvAFuKglOzJDAt02p6yORn+HHhsQSo=
X-Received: by 2002:a67:f502:0:b0:434:5839:bdc4 with SMTP id
 u2-20020a67f502000000b004345839bdc4mr6659868vsn.25.1684981492373; Wed, 24 May
 2023 19:24:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230519023758.1759434-1-yin.wang@intel.com>
In-Reply-To: <20230519023758.1759434-1-yin.wang@intel.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 25 May 2023 12:24:26 +1000
Message-ID: <CAKmqyKO1fkvSKLP6Ji2aE_jB3x65P=pqA22EsNSXy0aAFwuZJQ@mail.gmail.com>
Subject: Re: [PATCH v5] hw/riscv: qemu crash when NUMA nodes exceed available
 CPUs
To: Yin Wang <yin.wang@intel.com>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Weiwei Li <liweiwei@iscas.ac.cn>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Bin Meng <bin.meng@windriver.com>, 
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
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

On Fri, May 19, 2023 at 12:38=E2=80=AFPM Yin Wang <yin.wang@intel.com> wrot=
e:
>
> Command "qemu-system-riscv64 -machine virt
> -m 2G -smp 1 -numa node,mem=3D1G -numa node,mem=3D1G"
> would trigger this problem.Backtrace with:
>  #0  0x0000555555b5b1a4 in riscv_numa_get_default_cpu_node_id  at ../hw/r=
iscv/numa.c:211
>  #1  0x00005555558ce510 in machine_numa_finish_cpu_init  at ../hw/core/ma=
chine.c:1230
>  #2  0x00005555558ce9d3 in machine_run_board_init  at ../hw/core/machine.=
c:1346
>  #3  0x0000555555aaedc3 in qemu_init_board  at ../softmmu/vl.c:2513
>  #4  0x0000555555aaf064 in qmp_x_exit_preconfig  at ../softmmu/vl.c:2609
>  #5  0x0000555555ab1916 in qemu_init  at ../softmmu/vl.c:3617
>  #6  0x000055555585463b in main  at ../softmmu/main.c:47
> This commit fixes the issue by adding parameter checks.
>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Yin Wang <yin.wang@intel.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  hw/riscv/numa.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/hw/riscv/numa.c b/hw/riscv/numa.c
> index 4720102561..e0414d5b1b 100644
> --- a/hw/riscv/numa.c
> +++ b/hw/riscv/numa.c
> @@ -207,6 +207,12 @@ int64_t riscv_numa_get_default_cpu_node_id(const Mac=
hineState *ms, int idx)
>  {
>      int64_t nidx =3D 0;
>
> +    if (ms->numa_state->num_nodes > ms->smp.cpus) {
> +        error_report("Number of NUMA nodes (%d)"
> +                     " cannot exceed the number of available CPUs (%d)."=
,
> +                     ms->numa_state->num_nodes, ms->smp.max_cpus);
> +        exit(EXIT_FAILURE);
> +    }
>      if (ms->numa_state->num_nodes) {
>          nidx =3D idx / (ms->smp.cpus / ms->numa_state->num_nodes);
>          if (ms->numa_state->num_nodes <=3D nidx) {
> --
> 2.34.1
>
>

