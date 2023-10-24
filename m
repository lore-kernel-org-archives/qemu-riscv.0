Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B183C00A8F
	for <qemu-riscv@archiver.kernel.org>; Tue, 24 Oct 2023 00:06:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qv4wQ-0004I4-4o; Mon, 23 Oct 2023 20:06:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1qv4wO-0004Hg-G6
 for qemu-riscv@nongnu.org; Mon, 23 Oct 2023 20:06:36 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1qv4wM-0006oR-9y
 for qemu-riscv@nongnu.org; Mon, 23 Oct 2023 20:06:36 -0400
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-5079f3f3d7aso6165741e87.1
 for <qemu-riscv@nongnu.org>; Mon, 23 Oct 2023 17:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1698105993; x=1698710793;
 darn=nongnu.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zbzn2nGRWoPBnuRjawoqnGHz4scbW/1LgvosRkDCQzE=;
 b=0jj3C9vMmmWjDQT51ncCcvudS5TJekEQtCL3PcZv7RB0CgLb8xA3Ij4DhKaVuCM15b
 eLZsQsnZSBkRrO16hUJLTsIViLjY3z2v4YCG7mzWtyKXA27l2hx8gK4qXrUS8WO6D/Ld
 Q9SN7nxG5v6biRRVNfkDVPQpQEedvFyUi/Lx9d13wh9NGlnQa+sfVYB9pzemPW4NgXQ5
 XgRa6tnPTIOSQjXz0AMIa0GgLz+iuqLWKoZJ9NkHMlPNpZi2Th01LbCe7sLwgj0oJCfP
 OQ5KmjdtAkcLw9TC5FOVgQu0ypBpIH3VxiR/9JFLlgZvJHRrQVXzDMQg8OfORjdORHwm
 O3qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698105993; x=1698710793;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zbzn2nGRWoPBnuRjawoqnGHz4scbW/1LgvosRkDCQzE=;
 b=b3R3VPhnwMiZUSxx7QGvlRzqLnhnU3nvJC7cm8dzdonG/A/K/4nJmggSZpcKyNjE2g
 M4WiOCa2bpNInR0gFBqboI4XUwjheISuCbnZ7hWZ2ta9VbSRlMutabfVnx674ifVMEg2
 qfJX8CEf87Ne5Ii/QEOZzvM8swZK+Crh3ELYkWczVU5OSmskkLCBSRIXtf3qNmfCTWoU
 UO5vm/NuyuIIVI7XWI50PKR5XadXZrq3bJMwA5fU4u9elFUPNFYyuI5qvcYIAVxhBH17
 U0bS1vaVO0rFIys1qHce1jD1RCzW1aO9Ia3bPr8vOq11GrRggehIYwmZdlmrYjST4Qms
 MoRg==
X-Gm-Message-State: AOJu0YyAyDLmlWViYteh1ftu8tNQOgiavQoiMOhU/X35tZ0LwKSE9OKz
 NA3ZrX5+wexfoALb2jxIuFjoAOj91dd7oF64wNxu8A==
X-Google-Smtp-Source: AGHT+IGJKhSq9Lu/VTikc0eSdA/QB25FJM8w7QHKz7IlGZpZCD1lhUU3wWkkx3XTNXY/nT49oDVhQCkPXprZJEhkeC0=
X-Received: by 2002:a19:4f58:0:b0:503:90d:e0df with SMTP id
 a24-20020a194f58000000b00503090de0dfmr6688017lfk.34.1698105992600; Mon, 23
 Oct 2023 17:06:32 -0700 (PDT)
MIME-Version: 1.0
References: <20231018154434.17367-1-rbradford@rivosinc.com>
 <20231018154434.17367-4-rbradford@rivosinc.com>
In-Reply-To: <20231018154434.17367-4-rbradford@rivosinc.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Mon, 23 Oct 2023 17:06:21 -0700
Message-ID: <CAHBxVyEerGCYYbcvM5tBb34vLjc3pqdnMZVUjnRGgFHeE2nRNg@mail.gmail.com>
Subject: Re: [PATCH v4 3/6] target/riscv: Use existing PMU counter mask in FDT
 generation
To: Rob Bradford <rbradford@rivosinc.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn, 
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=atishp@rivosinc.com; helo=mail-lf1-x129.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Wed, Oct 18, 2023 at 8:44=E2=80=AFAM Rob Bradford <rbradford@rivosinc.co=
m> wrote:
>
> During the FDT generation use the existing mask containing the enabled
> counters rather then generating a new one. Using the existing mask will
> support the use of discontinuous counters.
>
> Signed-off-by: Rob Bradford <rbradford@rivosinc.com>
> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/riscv/virt.c    | 2 +-
>  target/riscv/pmu.c | 6 +-----
>  target/riscv/pmu.h | 2 +-
>  3 files changed, 3 insertions(+), 7 deletions(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 9de578c756..241681f98d 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -722,7 +722,7 @@ static void create_fdt_pmu(RISCVVirtState *s)
>      pmu_name =3D g_strdup_printf("/pmu");
>      qemu_fdt_add_subnode(ms->fdt, pmu_name);
>      qemu_fdt_setprop_string(ms->fdt, pmu_name, "compatible", "riscv,pmu"=
);
> -    riscv_pmu_generate_fdt_node(ms->fdt, hart.cfg.pmu_num, pmu_name);
> +    riscv_pmu_generate_fdt_node(ms->fdt, hart.pmu_avail_ctrs, pmu_name);
>
>      g_free(pmu_name);
>  }
> diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
> index 13801ccb78..7ddf4977b1 100644
> --- a/target/riscv/pmu.c
> +++ b/target/riscv/pmu.c
> @@ -34,13 +34,9 @@
>   * to provide the correct value as well. Heterogeneous PMU per hart is n=
ot
>   * supported yet. Thus, number of counters are same across all harts.
>   */
> -void riscv_pmu_generate_fdt_node(void *fdt, int num_ctrs, char *pmu_name=
)
> +void riscv_pmu_generate_fdt_node(void *fdt, uint32_t cmask, char *pmu_na=
me)
>  {
>      uint32_t fdt_event_ctr_map[15] =3D {};
> -    uint32_t cmask;
> -
> -    /* All the programmable counters can map to any event */
> -    cmask =3D MAKE_32BIT_MASK(3, num_ctrs);
>
>     /*
>      * The event encoding is specified in the SBI specification
> diff --git a/target/riscv/pmu.h b/target/riscv/pmu.h
> index 88e0713296..505fc850d3 100644
> --- a/target/riscv/pmu.h
> +++ b/target/riscv/pmu.h
> @@ -28,6 +28,6 @@ void riscv_pmu_init(RISCVCPU *cpu, Error **errp);
>  int riscv_pmu_update_event_map(CPURISCVState *env, uint64_t value,
>                                 uint32_t ctr_idx);
>  int riscv_pmu_incr_ctr(RISCVCPU *cpu, enum riscv_pmu_event_idx event_idx=
);
> -void riscv_pmu_generate_fdt_node(void *fdt, int num_counters, char *pmu_=
name);
> +void riscv_pmu_generate_fdt_node(void *fdt, uint32_t cmask, char *pmu_na=
me);
>  int riscv_pmu_setup_timer(CPURISCVState *env, uint64_t value,
>                            uint32_t ctr_idx);
> --
> 2.41.0
>

Reviewed-by: Atish Patra <atishp@rivosinc.com>

