Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3355C001DB
	for <qemu-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 14:45:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qUTOM-0004LP-IX; Fri, 11 Aug 2023 10:45:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qUTO5-0004Ir-RJ; Fri, 11 Aug 2023 10:45:19 -0400
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qUTO4-0000BG-0n; Fri, 11 Aug 2023 10:45:13 -0400
Received: by mail-vs1-xe2e.google.com with SMTP id
 ada2fe7eead31-44757af136cso901081137.3; 
 Fri, 11 Aug 2023 07:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691765110; x=1692369910;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X6T1SOl1IfZ8wDw78HyUfaG3CNvePKuFXv9k1AVxFjE=;
 b=okD6YhyXRb3PN5AS5xqifny0EfJDmcLKZajyCPb3/Dga+cxOiKfoVC/bVbJ68uduHP
 Ildk7+mU9lMtQlF3LfEikU9Vl3PIIqObWGACppQrOim+Oz2ThMmzihuC0mD0yXjDRYKK
 7P4qQu0vIvzCn/krxCe4l4kRAXrtiSrd7W+3toinpxvNRefYGJEDDMMhgv1i1sG2t9pX
 p8w/XM6vkKf5FhdcuLi2e7EN8btQoWtz6cTuBbeWyIGT0Zs3SQCn3Su4RCpctHNuapSh
 2lrdsmAkxmT17BNu1uD9SI3wbwui9XveGdg9GU5PK/CPBU4Rdx4/qNtyCCubMksPzJfO
 WAfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691765110; x=1692369910;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X6T1SOl1IfZ8wDw78HyUfaG3CNvePKuFXv9k1AVxFjE=;
 b=dQQkBbXjois8jJEHjn+nqKt1lsT5djwrF6qusABBoZ8O6OG25GViDeCSfe0obQE3rl
 d0EgdJw929crrXhIL1bOv1Ye0N6wXa3/RVvSrTRNcCfM+DW7QupRa81G0Iz2EYFKi2B2
 ja61oEijgIWjuHTngYGKVgCd/AsF0/893TDgJ7CdOsIKP79KxsEFFfyiUaWmcrCBRzet
 TrRby/1+pjKb641wwNWGPg1Cen0ULJVp4Akrvbta4ho66CBUN4WFUgZ9uzhWPyNz51+b
 S9VnIJfib5H+hP+LegDGPfX9ZAdMcEsTJfUvPY5u70R5jVSz2qGzMNCzB+OWYjbm/Axi
 qqww==
X-Gm-Message-State: AOJu0Yyij7yHva9HfyR5HS+vg5rhMsqCOxRGd6JiJyfXjgVyUAFlaAv7
 iRzrQRqS2BOzA4L4OSHWNhnIfVhmJNmBhPYTT9w=
X-Google-Smtp-Source: AGHT+IEXHFQrvsQE9XyfRkVoISWKpAtfmNSHQSfmtluGBWj0RrtcjuzgmejAMNMS5M6Bt5ceWR1TmCqhVJxTGl78hig=
X-Received: by 2002:a67:e882:0:b0:447:4fbe:1802 with SMTP id
 x2-20020a67e882000000b004474fbe1802mr1714136vsn.17.1691765110277; Fri, 11 Aug
 2023 07:45:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230727-groom-decline-2c57ce42841c@spud>
In-Reply-To: <20230727-groom-decline-2c57ce42841c@spud>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 11 Aug 2023 10:44:44 -0400
Message-ID: <CAKmqyKP-h=1s7tV_2vkGET8xwfmeqPsFh=+TmBWPHFVMkNYWLQ@mail.gmail.com>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2e;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2e.google.com
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

Acked-by: Alistair Francis <alistair.francis@wdc.com>

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

