Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B46C0C4332F
	for <qemu-riscv@archiver.kernel.org>; Thu,  9 Nov 2023 02:42:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r0uzw-0004ki-Qq; Wed, 08 Nov 2023 21:42:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elta.era@gmail.com>)
 id 1r0uzu-0004kI-RG; Wed, 08 Nov 2023 21:42:22 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <elta.era@gmail.com>)
 id 1r0uzs-00048J-W2; Wed, 08 Nov 2023 21:42:22 -0500
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1cc3542e328so2958165ad.1; 
 Wed, 08 Nov 2023 18:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699497739; x=1700102539; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gdP6D3W2wTsoSET+2u+akA8ceDXa4pgEnK0pVfYlAXU=;
 b=h+EzQJL530g5RFbJqAiiopZwXDharxIcMg5Sg3014EKctEd05hjGrkezhxH1LWCr52
 F/cnphhxv7VDBi5BfKOtp3ye/a3heZT37quu12uRPdTxvkg6O1Iuqw6beLad8lP5/B6K
 3NaStKh2uLiuSgcxfVM/AvawgoD+Cl+6Asqvzbci2cHOq7liZapEyT7058VlZtg8TsFd
 wekOBi2CcO8w5JHvTw+9gDf9rjrIFP/apBUCE1YCn3iScpl0cGS5R194mVsBKjT2n1bF
 GWmS9r6xMmFd4JGMQTJQCXkGpl1Qn8jWXFd26eYgtrDlF0aacAzbMZ+vIoqbJcQ53/QY
 Z7lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699497739; x=1700102539;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gdP6D3W2wTsoSET+2u+akA8ceDXa4pgEnK0pVfYlAXU=;
 b=m57RaEcfzJldtkWooQg89HmG/l0YuVixxnvQjxN75kgHo80ShN3cCOVFtdRzvNERJW
 rOwRzdI+m5wVsXQPfUiFe5mvwDhQJC06YhItaRWSR6L4c58cQzyyEqnvEuo8gLZlmmt3
 0TyP6KxGwAR08EGh0tMm1tDeE/AN7tP99TxAVUPUzgnGsE/KoV6uQbCYUx29kypHTjsf
 9wPda9RXWAQ708W4u/38F8QoAlg11eGHijHY9gZOJ3pmCCw2Imio2nwbCZ6J39G4kmW0
 0Z9uTZVaIvCQAx7zMQb8H3+cs95+JE2DqHNkcxdJtQ66hx+QA0gF6lZqwVi04bWpMCgq
 6WuQ==
X-Gm-Message-State: AOJu0YyN9RvqzrYYe0o4nLsBTFfOh/8Nf3CI0dtTrrHVwfabbwvHyzOw
 RapnEbRiInezfhGB2XoLs/5VUpLZrqRSYNR/QX4=
X-Google-Smtp-Source: AGHT+IGGGxWO17q/ItU4n2yA3oJeIJZ90SlZ8DqU3qy0+yxP0zl6Dfh2+x5LpVH9gS88RdZDovLKpbARKbvRVs8tRPQ=
X-Received: by 2002:a05:6a20:439f:b0:172:6771:d766 with SMTP id
 i31-20020a056a20439f00b001726771d766mr4034765pzl.51.1699497739037; Wed, 08
 Nov 2023 18:42:19 -0800 (PST)
MIME-Version: 1.0
References: <cover.1699496263.git.houyingle@canaan-creative.com>
 <6d1d8cc8c2b37b145e4a826095619097fa4a34d5.1699496263.git.houyingle@canaan-creative.com>
In-Reply-To: <6d1d8cc8c2b37b145e4a826095619097fa4a34d5.1699496263.git.houyingle@canaan-creative.com>
From: Dongxue Zhang <elta.era@gmail.com>
Date: Thu, 9 Nov 2023 10:41:58 +0800
Message-ID: <CAEomy4TmM0ShGkuV2mprB8Xm0Kn62ZWZA7Gnfvt07pioY9fCCA@mail.gmail.com>
Subject: Re: [PATCH 1/1] hw/intc/riscv_aclint:Change the way to get CPUState
 from hard-base to pu_index
To: Leo Hou <LeoHou@canaan-creative.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Anup Patel <apatel@ventanamicro.com>, Bin Meng <bin.meng@windriver.com>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Leo Hou <houyingle@canaan-creative.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Mayuresh Chitale <mchitale@ventanamicro.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
 Weiwei Li <liweiwei@iscas.ac.cn>, QEMU Developers <qemu-devel@nongnu.org>, 
 qemu-riscv <qemu-riscv@nongnu.org>, Elta Era <elta.era@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=elta.era@gmail.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Reviewed-by: Dongxue Zhang <zhangdongxue@canaan-creative.com>


On Thu, Nov 9, 2023 at 10:22=E2=80=AFAM Leo Hou <LeoHou@canaan-creative.com=
> wrote:
>
> From: Leo Hou <houyingle@canaan-creative.com>
>
> cpu_by_arch_id() uses hartid-base as the index to obtain the correspondin=
g CPUState structure variable.
> qemu_get_cpu() uses cpu_index as the index to obtain the corresponding CP=
UState structure variable.
>
> In heterogeneous CPU or multi-socket scenarios, multiple aclint needs to =
be instantiated,
> and the hartid-base of each cpu bound by aclint can start from 0. If cpu_=
by_arch_id() is still used
> in this case, all aclint will bind to the earliest initialized hart with =
hartid-base 0 and cause conflicts.
>
> So with cpu_index as the index, use qemu_get_cpu() to get the CPUState st=
ruct variable,
> and connect the aclint interrupt line to the hart of the CPU indexed with=
 cpu_index
> (the corresponding hartid-base can start at 0). It's more reasonable.
>
> Signed-off-by: Leo Hou <houyingle@canaan-creative.com>
> ---
>  hw/intc/riscv_aclint.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
> index ab1a0b4b3a..be8f539fcb 100644
> --- a/hw/intc/riscv_aclint.c
> +++ b/hw/intc/riscv_aclint.c
> @@ -130,7 +130,7 @@ static uint64_t riscv_aclint_mtimer_read(void *opaque=
, hwaddr addr,
>          addr < (mtimer->timecmp_base + (mtimer->num_harts << 3))) {
>          size_t hartid =3D mtimer->hartid_base +
>                          ((addr - mtimer->timecmp_base) >> 3);
> -        CPUState *cpu =3D cpu_by_arch_id(hartid);
> +        CPUState *cpu =3D qemu_get_cpu(hartid);
>          CPURISCVState *env =3D cpu ? cpu_env(cpu) : NULL;
>          if (!env) {
>              qemu_log_mask(LOG_GUEST_ERROR,
> @@ -173,7 +173,7 @@ static void riscv_aclint_mtimer_write(void *opaque, h=
waddr addr,
>          addr < (mtimer->timecmp_base + (mtimer->num_harts << 3))) {
>          size_t hartid =3D mtimer->hartid_base +
>                          ((addr - mtimer->timecmp_base) >> 3);
> -        CPUState *cpu =3D cpu_by_arch_id(hartid);
> +        CPUState *cpu =3D qemu_get_cpu(hartid);
>          CPURISCVState *env =3D cpu ? cpu_env(cpu) : NULL;
>          if (!env) {
>              qemu_log_mask(LOG_GUEST_ERROR,
> @@ -232,7 +232,7 @@ static void riscv_aclint_mtimer_write(void *opaque, h=
waddr addr,
>
>          /* Check if timer interrupt is triggered for each hart. */
>          for (i =3D 0; i < mtimer->num_harts; i++) {
> -            CPUState *cpu =3D cpu_by_arch_id(mtimer->hartid_base + i);
> +            CPUState *cpu =3D qemu_get_cpu(mtimer->hartid_base + i);
>              CPURISCVState *env =3D cpu ? cpu_env(cpu) : NULL;
>              if (!env) {
>                  continue;
> @@ -293,7 +293,7 @@ static void riscv_aclint_mtimer_realize(DeviceState *=
dev, Error **errp)
>      s->timecmp =3D g_new0(uint64_t, s->num_harts);
>      /* Claim timer interrupt bits */
>      for (i =3D 0; i < s->num_harts; i++) {
> -        RISCVCPU *cpu =3D RISCV_CPU(cpu_by_arch_id(s->hartid_base + i));
> +        RISCVCPU *cpu =3D RISCV_CPU(qemu_get_cpu(s->hartid_base + i));
>          if (riscv_cpu_claim_interrupts(cpu, MIP_MTIP) < 0) {
>              error_report("MTIP already claimed");
>              exit(1);
> @@ -373,7 +373,7 @@ DeviceState *riscv_aclint_mtimer_create(hwaddr addr, =
hwaddr size,
>      sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
>
>      for (i =3D 0; i < num_harts; i++) {
> -        CPUState *cpu =3D cpu_by_arch_id(hartid_base + i);
> +        CPUState *cpu =3D qemu_get_cpu(hartid_base + i);
>          RISCVCPU *rvcpu =3D RISCV_CPU(cpu);
>          CPURISCVState *env =3D cpu ? cpu_env(cpu) : NULL;
>          riscv_aclint_mtimer_callback *cb =3D
> @@ -408,7 +408,7 @@ static uint64_t riscv_aclint_swi_read(void *opaque, h=
waddr addr,
>
>      if (addr < (swi->num_harts << 2)) {
>          size_t hartid =3D swi->hartid_base + (addr >> 2);
> -        CPUState *cpu =3D cpu_by_arch_id(hartid);
> +        CPUState *cpu =3D qemu_get_cpu(hartid);
>          CPURISCVState *env =3D cpu ? cpu_env(cpu) : NULL;
>          if (!env) {
>              qemu_log_mask(LOG_GUEST_ERROR,
> @@ -431,7 +431,7 @@ static void riscv_aclint_swi_write(void *opaque, hwad=
dr addr, uint64_t value,
>
>      if (addr < (swi->num_harts << 2)) {
>          size_t hartid =3D swi->hartid_base + (addr >> 2);
> -        CPUState *cpu =3D cpu_by_arch_id(hartid);
> +        CPUState *cpu =3D qemu_get_cpu(hartid);
>          CPURISCVState *env =3D cpu ? cpu_env(cpu) : NULL;
>          if (!env) {
>              qemu_log_mask(LOG_GUEST_ERROR,
> @@ -546,7 +546,7 @@ DeviceState *riscv_aclint_swi_create(hwaddr addr, uin=
t32_t hartid_base,
>      sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, addr);
>
>      for (i =3D 0; i < num_harts; i++) {
> -        CPUState *cpu =3D cpu_by_arch_id(hartid_base + i);
> +        CPUState *cpu =3D qemu_get_cpu(hartid_base + i);
>          RISCVCPU *rvcpu =3D RISCV_CPU(cpu);
>
>          qdev_connect_gpio_out(dev, i,
> --
> 2.34.1
>

