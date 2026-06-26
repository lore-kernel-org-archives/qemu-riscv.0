Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 066D8CDE00B
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 00:55:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wcuqq-0007Dx-Vx; Thu, 25 Jun 2026 20:55:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wcuqp-0007DZ-RY
 for qemu-riscv@nongnu.org; Thu, 25 Jun 2026 20:55:23 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wcuqm-0008H5-4c
 for qemu-riscv@nongnu.org; Thu, 25 Jun 2026 20:55:23 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-6978f1eeb87so672028a12.0
 for <qemu-riscv@nongnu.org>; Thu, 25 Jun 2026 17:55:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782435318; cv=none;
 d=google.com; s=arc-20260327;
 b=fLef2UWQrEbHEE0sT+7ym7I48N2xra0+gTViYVSNoJvRr6FLjg/9agbKeiEPhh1NmB
 sEFrcnb/SFql+T5ftlGaMb08mee+dRnmy5zGc8lI6QVOnKa4DDxotqc/TDLvaxsewSrZ
 hOX4OgWCPJnGaKlzr25ATZVIO7J28PizkxZABT9dhW7n2028i+M+2/gkHksFUmzP0R6a
 AbrY/CFlV5nou4ntAx1hJej98m2urHplmx5x9rs/jEyAEGWn6K1jhm4Y6k9K5jF/wmuM
 MD9bLlzwJT8kNU7VWnv+wbM7cIdG/fnqee4lVGGQYZgdlKpuQHTI8N6OL7/tT2kXmuXD
 QEhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=gV2A7wi6u7yKWq4sqT/fmmtK7jhIrvVIPKAWCcV+j6Q=;
 fh=TsWHRkdyDQCl4vQZ03X1PeeWCdbLXdS20H7rqMMaFvM=;
 b=gMbt92Q2J/HBL2rJxauOskPzuRmdiQanT8G2xtzwebSAaT+uYPa0ouch96th3jyo8k
 hzOFOlGQZP2R06wAuBAZ0qiFCDk8B70uA7IRYPkRACDF3owbeQvoS3MV+rzqONxDgvhw
 bH3hM4YaXJMbmli9KN63uaRasL3sVxSAsf5K8CFRCNDgPOeCgFFrbYe/EsQdzfLi9XCm
 zRMw01bsms8P3Rf5vWcfB9WNEIU2WGBxWTM6B+xUylupVlKIqOWa/mUvEgNBQ/eHh/B8
 9bdnssHv6BqaYnfWd7ZHuTk+t2L7njb20Q7NxG2Op54KdNC3wBnMUp+c1XxrM6mCqURT
 uK7w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782435318; x=1783040118; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gV2A7wi6u7yKWq4sqT/fmmtK7jhIrvVIPKAWCcV+j6Q=;
 b=WhR2XcAW5oe5geeUiPBwhk8LB6o7fsg4cJQqzF//K5VmRV7UjWpmtGZBgD0r07vxKa
 CsyrkRBwnRkzqDDhtfxZY9PREYGUxH7l/dtwTbNy9veuL3opKLXvOw6CSJP0AcUT+YuA
 qVA/C6R+TGE23oI7Our7ITrBFG0YAuRbD4XNTmzRK5MjP7orqrM4xJR1MUbYkQap9CEH
 LYJSOAQ0UWZSzZ0fZcZOdxBwf9nqPo8RMJrdjC63yn0SukUeAh+UyRpKhJRXKkS6nJOv
 3IN54nY0ZbDxsZcaQeTo3gxrOScvKokPH558TaaKJYzT94mriS+AydgTcP6nj6x77BED
 Vn0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782435318; x=1783040118;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gV2A7wi6u7yKWq4sqT/fmmtK7jhIrvVIPKAWCcV+j6Q=;
 b=kFe76dKGM6sf6nYc6fwBQf+rQCKEfvQ1EX89POc/29ar2PG/spFWWI6NKT5GlzL8SD
 hY+E+GijM3VAW0y2EEUzxZYneqo6TeTmsci9Qs3VmchHaE83gVEZusdTAb2tTIrWo7cq
 6IScvfC2lIUoTN0WKB5FkjLMWwn0yVKcjwqNivAGMH8XXd3ZOE6nu09bHU1IYtt/XGXD
 GwpbSgHx3q4gYCo7IKSJKShn8phT1CzPFSaUZX/NijfcfOb04zs1MZvA4LQ2rrjW6CwR
 dfvXt4mZAt9zb3XJf3CIcguT72wHgrN1XnAz3atKlpP+otMBEjGgblS1P3Uv9N0erIuT
 696Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RpJUJEc2V26Z1BHBk8fipEIkfP9X1bS+03ub5Siy66Oy8Eui76/SpAGbFT/1CNNNV5H4RURGnEhJpbI@nongnu.org
X-Gm-Message-State: AOJu0YzNTATaLmQbpSfLPDw3n/SZWJi2UHnld1kl/mqzCSfk9XNy0yeZ
 hy2XQRugJO+YB53K3GrZ+EanaxwqFsklTFb3K7t9nBB1SmdlX5hi2CbV6mGVhRJO7m4WRMNqaOi
 +2HYXyRhsHQ9YKkY4aD+JWTQetgqJd40=
X-Gm-Gg: AfdE7cnr+lCsGkaRegK+Vio41aEuQkDDfGl1PDkJJJ0sBtTB+VyqWZGJVUG7lyo5qNS
 G3dHwEBV+7RdysvlNB50yf93qddhsYS4a55092S/jlL16TF/TnCezsKRR83DYuvBfJTcfg8IsSp
 nv46ahgbm/I8zEYSpk8qjR568Hmc9R+CWxKD7r/unZHNFDTM9RP2I0BzwwNWNaBKZOZw+gBa2sP
 xaN8GSGlmlD0At4OMbIIv1X3WCcGf/ujOE6wB7bCXWeYFo3ClSWPiAxqNKeoS6DAll+l3RWxI/i
 aRlHg3A7ZPqVrDwAU4vxGi8qWuQ=
X-Received: by 2002:a05:6402:3219:b0:697:ea41:97af with SMTP id
 4fb4d7f45d1cf-69810b85640mr868698a12.28.1782435318230; Thu, 25 Jun 2026
 17:55:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260624000632.2149359-1-daniel.barboza@oss.qualcomm.com>
 <20260624000632.2149359-7-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260624000632.2149359-7-daniel.barboza@oss.qualcomm.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 26 Jun 2026 10:54:51 +1000
X-Gm-Features: AVVi8Cf7ZCfvWgyCT6tpuhT3h1cSZYCbIcFuYUMCHH_RrZTJYIWa4B78wKykU7s
Message-ID: <CAKmqyKPKdEmpsacvbybB3iKhEVjfAsuuo87QHGFOtYSfeWgNoQ@mail.gmail.com>
Subject: Re: [PATCH v2 06/24] target/riscv: move pmu.h to tcg subdir
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com, 
 pierrick.bouvier@oss.qualcomm.com, philmd@oss.qualcomm.com, 
 fritchleybohrer@gmail.com, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x535.google.com
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

On Wed, Jun 24, 2026 at 10:08=E2=80=AFAM Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
> riscv_pmu_generate_fdt_node() can be moved to fdt_common.c since it has
> no PMU TCG internals.
>
> With this change we can remove pmu.h from 'virt.c', which is now
> becoming a tcg header since we're moving it to the tcg subdir.
>
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/fdt-common.c         | 52 +++++++++++++++++++++++++++++++++++
>  hw/riscv/virt.c               |  1 -
>  include/hw/riscv/fdt-common.h |  1 +
>  target/riscv/tcg/pmu.c        | 52 -----------------------------------
>  target/riscv/{ =3D> tcg}/pmu.h  |  1 -
>  5 files changed, 53 insertions(+), 54 deletions(-)
>  rename target/riscv/{ =3D> tcg}/pmu.h (95%)
>
> diff --git a/hw/riscv/fdt-common.c b/hw/riscv/fdt-common.c
> index e0e31af09b..aa143a618b 100644
> --- a/hw/riscv/fdt-common.c
> +++ b/hw/riscv/fdt-common.c
> @@ -230,3 +230,55 @@ void create_fdt_plic(void *fdt, hwaddr addr, uint64_=
t size,
>      }
>      qemu_fdt_setprop_cell(fdt, nodename, "phandle", plic_phandle);
>  }
> +
> +/*
> + * To keep it simple, any event can be mapped to any programmable counte=
rs in
> + * QEMU. The generic cycle & instruction count events can also be monito=
red
> + * using programmable counters. In that case, mcycle & minstret must con=
tinue
> + * to provide the correct value as well. Heterogeneous PMU per hart is n=
ot
> + * supported yet. Thus, number of counters are same across all harts.
> + */
> +void riscv_pmu_generate_fdt_node(void *fdt, uint32_t cmask, char *pmu_na=
me)
> +{
> +    uint32_t fdt_event_ctr_map[15] =3D {};
> +
> +   /*
> +    * The event encoding is specified in the SBI specification
> +    * Event idx is a 20bits wide number encoded as follows:
> +    * event_idx[19:16] =3D type
> +    * event_idx[15:0] =3D code
> +    * The code field in cache events are encoded as follows:
> +    * event_idx.code[15:3] =3D cache_id
> +    * event_idx.code[2:1] =3D op_id
> +    * event_idx.code[0:0] =3D result_id
> +    */
> +
> +   /* SBI_PMU_HW_CPU_CYCLES: 0x01 : type(0x00) */
> +   fdt_event_ctr_map[0] =3D cpu_to_be32(0x00000001);
> +   fdt_event_ctr_map[1] =3D cpu_to_be32(0x00000001);
> +   fdt_event_ctr_map[2] =3D cpu_to_be32(cmask | 1 << 0);
> +
> +   /* SBI_PMU_HW_INSTRUCTIONS: 0x02 : type(0x00) */
> +   fdt_event_ctr_map[3] =3D cpu_to_be32(0x00000002);
> +   fdt_event_ctr_map[4] =3D cpu_to_be32(0x00000002);
> +   fdt_event_ctr_map[5] =3D cpu_to_be32(cmask | 1 << 2);
> +
> +   /* SBI_PMU_HW_CACHE_DTLB : 0x03 READ : 0x00 MISS : 0x00 type(0x01) */
> +   fdt_event_ctr_map[6] =3D cpu_to_be32(0x00010019);
> +   fdt_event_ctr_map[7] =3D cpu_to_be32(0x00010019);
> +   fdt_event_ctr_map[8] =3D cpu_to_be32(cmask);
> +
> +   /* SBI_PMU_HW_CACHE_DTLB : 0x03 WRITE : 0x01 MISS : 0x00 type(0x01) *=
/
> +   fdt_event_ctr_map[9] =3D cpu_to_be32(0x0001001B);
> +   fdt_event_ctr_map[10] =3D cpu_to_be32(0x0001001B);
> +   fdt_event_ctr_map[11] =3D cpu_to_be32(cmask);
> +
> +   /* SBI_PMU_HW_CACHE_ITLB : 0x04 READ : 0x00 MISS : 0x00 type(0x01) */
> +   fdt_event_ctr_map[12] =3D cpu_to_be32(0x00010021);
> +   fdt_event_ctr_map[13] =3D cpu_to_be32(0x00010021);
> +   fdt_event_ctr_map[14] =3D cpu_to_be32(cmask);
> +
> +   /* This a OpenSBI specific DT property documented in OpenSBI docs */
> +   qemu_fdt_setprop(fdt, pmu_name, "riscv,event-to-mhpmcounters",
> +                    fdt_event_ctr_map, sizeof(fdt_event_ctr_map));
> +}
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 92c30a6f4c..a1cf8210be 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -30,7 +30,6 @@
>  #include "hw/char/serial-mm.h"
>  #include "target/riscv/cpu.h"
>  #include "hw/core/sysbus-fdt.h"
> -#include "target/riscv/pmu.h"
>  #include "hw/riscv/riscv_hart.h"
>  #include "hw/riscv/iommu.h"
>  #include "hw/riscv/riscv-iommu-bits.h"
> diff --git a/include/hw/riscv/fdt-common.h b/include/hw/riscv/fdt-common.=
h
> index 017278b611..1729a6abc6 100644
> --- a/include/hw/riscv/fdt-common.h
> +++ b/include/hw/riscv/fdt-common.h
> @@ -35,4 +35,5 @@ void create_fdt_plic(void *fdt, hwaddr addr, uint64_t s=
ize,
>                       uint32_t addr_cells, uint32_t *plic_cells,
>                       uint32_t cells_size, uint32_t ndev_sources,
>                       bool numa_enabled, int socket);
> +void riscv_pmu_generate_fdt_node(void *fdt, uint32_t cmask, char *pmu_na=
me);
>  #endif
> diff --git a/target/riscv/tcg/pmu.c b/target/riscv/tcg/pmu.c
> index 3444400bd2..38ad2737e1 100644
> --- a/target/riscv/tcg/pmu.c
> +++ b/target/riscv/tcg/pmu.c
> @@ -27,58 +27,6 @@
>
>  #define RISCV_TIMEBASE_FREQ 1000000000 /* 1Ghz */
>
> -/*
> - * To keep it simple, any event can be mapped to any programmable counte=
rs in
> - * QEMU. The generic cycle & instruction count events can also be monito=
red
> - * using programmable counters. In that case, mcycle & minstret must con=
tinue
> - * to provide the correct value as well. Heterogeneous PMU per hart is n=
ot
> - * supported yet. Thus, number of counters are same across all harts.
> - */
> -void riscv_pmu_generate_fdt_node(void *fdt, uint32_t cmask, char *pmu_na=
me)
> -{
> -    uint32_t fdt_event_ctr_map[15] =3D {};
> -
> -   /*
> -    * The event encoding is specified in the SBI specification
> -    * Event idx is a 20bits wide number encoded as follows:
> -    * event_idx[19:16] =3D type
> -    * event_idx[15:0] =3D code
> -    * The code field in cache events are encoded as follows:
> -    * event_idx.code[15:3] =3D cache_id
> -    * event_idx.code[2:1] =3D op_id
> -    * event_idx.code[0:0] =3D result_id
> -    */
> -
> -   /* SBI_PMU_HW_CPU_CYCLES: 0x01 : type(0x00) */
> -   fdt_event_ctr_map[0] =3D cpu_to_be32(0x00000001);
> -   fdt_event_ctr_map[1] =3D cpu_to_be32(0x00000001);
> -   fdt_event_ctr_map[2] =3D cpu_to_be32(cmask | 1 << 0);
> -
> -   /* SBI_PMU_HW_INSTRUCTIONS: 0x02 : type(0x00) */
> -   fdt_event_ctr_map[3] =3D cpu_to_be32(0x00000002);
> -   fdt_event_ctr_map[4] =3D cpu_to_be32(0x00000002);
> -   fdt_event_ctr_map[5] =3D cpu_to_be32(cmask | 1 << 2);
> -
> -   /* SBI_PMU_HW_CACHE_DTLB : 0x03 READ : 0x00 MISS : 0x00 type(0x01) */
> -   fdt_event_ctr_map[6] =3D cpu_to_be32(0x00010019);
> -   fdt_event_ctr_map[7] =3D cpu_to_be32(0x00010019);
> -   fdt_event_ctr_map[8] =3D cpu_to_be32(cmask);
> -
> -   /* SBI_PMU_HW_CACHE_DTLB : 0x03 WRITE : 0x01 MISS : 0x00 type(0x01) *=
/
> -   fdt_event_ctr_map[9] =3D cpu_to_be32(0x0001001B);
> -   fdt_event_ctr_map[10] =3D cpu_to_be32(0x0001001B);
> -   fdt_event_ctr_map[11] =3D cpu_to_be32(cmask);
> -
> -   /* SBI_PMU_HW_CACHE_ITLB : 0x04 READ : 0x00 MISS : 0x00 type(0x01) */
> -   fdt_event_ctr_map[12] =3D cpu_to_be32(0x00010021);
> -   fdt_event_ctr_map[13] =3D cpu_to_be32(0x00010021);
> -   fdt_event_ctr_map[14] =3D cpu_to_be32(cmask);
> -
> -   /* This a OpenSBI specific DT property documented in OpenSBI docs */
> -   qemu_fdt_setprop(fdt, pmu_name, "riscv,event-to-mhpmcounters",
> -                    fdt_event_ctr_map, sizeof(fdt_event_ctr_map));
> -}
> -
>  static bool riscv_pmu_counter_valid(RISCVCPU *cpu, uint32_t ctr_idx)
>  {
>      if (ctr_idx < 3 || ctr_idx >=3D RV_MAX_MHPMCOUNTERS ||
> diff --git a/target/riscv/pmu.h b/target/riscv/tcg/pmu.h
> similarity index 95%
> rename from target/riscv/pmu.h
> rename to target/riscv/tcg/pmu.h
> index b4f1e469a2..de2fae1fb4 100644
> --- a/target/riscv/pmu.h
> +++ b/target/riscv/tcg/pmu.h
> @@ -31,7 +31,6 @@ void riscv_pmu_init(RISCVCPU *cpu, Error **errp);
>  int riscv_pmu_update_event_map(CPURISCVState *env, uint64_t value,
>                                 uint32_t ctr_idx);
>  int riscv_pmu_incr_ctr(RISCVCPU *cpu, enum riscv_pmu_event_idx event_idx=
);
> -void riscv_pmu_generate_fdt_node(void *fdt, uint32_t cmask, char *pmu_na=
me);
>  int riscv_pmu_setup_timer(CPURISCVState *env, uint64_t value,
>                            uint32_t ctr_idx);
>  void riscv_pmu_update_fixed_ctrs(CPURISCVState *env, privilege_mode_t ne=
wpriv,
> --
> 2.43.0
>
>

