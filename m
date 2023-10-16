Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D1A3CDB465
	for <qemu-riscv@archiver.kernel.org>; Mon, 16 Oct 2023 03:45:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qsEXD-00027f-F6; Sun, 15 Oct 2023 23:44:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qsEXC-00027Q-FN; Sun, 15 Oct 2023 23:44:50 -0400
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qsEXB-0004lj-0J; Sun, 15 Oct 2023 23:44:50 -0400
Received: by mail-vs1-xe2d.google.com with SMTP id
 ada2fe7eead31-457bda4cf32so1249397137.3; 
 Sun, 15 Oct 2023 20:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697427887; x=1698032687; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y0z48dY5xbEEQZ/rvKe2udnuhUqsO15Or5PzYDzH7Hg=;
 b=Ikh1Xgd3i+GnS1K/tObGmUsdtFTld1S6XfUtE6/xgNFfBB/tObrvs2QEwTTqwEZH87
 5lvIVP++kFLKwab50OWODjUWrL2vmxTGZyPSZn4Abis3OQXCq+aR0S3Yv0UmrZY2d6NJ
 GAHJsGncqer+DLSWFlRcZOx4XK5eM07y/KhnoYRMakimSuNc2I5mCPxsSuAbvhUVVfJv
 m+bFkzFV6zrNW2AIwuAnybfm+zGewoCBNPefXivLf29S+6f6nzaLymkpw5hkhgcsDznJ
 FKVIqkOJYOal+KH+bxQFNM5q1EjoO9wwJNSZnMLfxhAXtQsVDa509+Fu7avXnc5gzUsm
 4Flg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697427887; x=1698032687;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y0z48dY5xbEEQZ/rvKe2udnuhUqsO15Or5PzYDzH7Hg=;
 b=Q/FwH/5zXpSmIg8p7krdGSPtJa6tP7g0tyAneUqpTtO+h9s3Aese4QYUmxx/MI6eTk
 lWLjcw2/HhBG88XXCLe6ubz1eSUjPz52UrhI8TizzpR86NqAjTiKtOb3iALjd+K89wsX
 QS+79XR5A27/QXxfeWSZzHg4eqISwbxPwE8de4r1VIrtpmMQAbcuHDuypqnZkBsAWVHl
 Fb7kONlRgUcdD/0p7D48zlNV28Cnyy6vcfCt6XjMtAvCE25J37NF0S+kaAdnjP+IioCu
 cGNBWrm/RG7hlVjcl+tSXtksvE4twtJqTjierfapB//+WHLLlNNK5st2SqANT803WC+D
 gHow==
X-Gm-Message-State: AOJu0YwYdH8HfrtwbU1ekH4ikxWzJ5j3BesDdorUhYpZiYaVmf9GW1sE
 xcRMmdgsukjmd1m57IYa0QXqimvg3z7P63L/K3wv2MxfasM=
X-Google-Smtp-Source: AGHT+IHFRYXc4v0mOHm0iQuJYyT/P7hT6BqLs1r5kRwyl7FFlB3eZ6HtEm6+3PN7MyI9V4Z80dUc9sTTrXyZT8Cl3VM=
X-Received: by 2002:a67:e142:0:b0:457:db22:bc58 with SMTP id
 o2-20020a67e142000000b00457db22bc58mr2067011vsl.4.1697427887314; Sun, 15 Oct
 2023 20:44:47 -0700 (PDT)
MIME-Version: 1.0
References: <20231011145032.81509-1-rbradford@rivosinc.com>
 <20231011145032.81509-4-rbradford@rivosinc.com>
In-Reply-To: <20231011145032.81509-4-rbradford@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 16 Oct 2023 13:44:20 +1000
Message-ID: <CAKmqyKPuy_CmDmJDWn1a+Bk0A7Vb0fg3y3GB8t57mp0VEpixqg@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] target/riscv: Use existing PMU counter mask in FDT
 generation
To: Rob Bradford <rbradford@rivosinc.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, atishp@rivosinc.com, 
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com, 
 liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2d;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2d.google.com
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

On Thu, Oct 12, 2023 at 2:37=E2=80=AFAM Rob Bradford <rbradford@rivosinc.co=
m> wrote:
>
> During the FDT generation use the existing mask containing the enabled
> counters rather then generating a new one. Using the existing mask will
> support the use of discontinuous counters.
>
> Signed-off-by: Rob Bradford <rbradford@rivosinc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/virt.c    | 2 +-
>  target/riscv/pmu.c | 6 +-----
>  target/riscv/pmu.h | 2 +-
>  3 files changed, 3 insertions(+), 7 deletions(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 5edc1d98d2..acdbaf9da5 100644
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
>

