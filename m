Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2961CDB483
	for <qemu-riscv@archiver.kernel.org>; Mon, 16 Oct 2023 04:24:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qsF9H-00019n-UU; Mon, 16 Oct 2023 00:24:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qsF9F-00018q-FR; Mon, 16 Oct 2023 00:24:09 -0400
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qsF9D-0002yM-V6; Mon, 16 Oct 2023 00:24:09 -0400
Received: by mail-vs1-xe2e.google.com with SMTP id
 ada2fe7eead31-457e5dec94dso210507137.3; 
 Sun, 15 Oct 2023 21:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697430246; x=1698035046; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TgcU8kyYdf7bCBDsYScnzaxfUBvgYLfTp2VNuJ0shcY=;
 b=GQAljNt714Eu5jKeCJ5ZeUDeEOq4bpyqAva5x5O6tdT4EnwE5KyVwvEIUEZFVz8ip+
 66zPjixf83zC6smD64dLBCblXyRoPNC1KydYYjdAoxmvj+xUsGgSwxzfXrAr4Np2qNAG
 hPXGJ/MpQvTexKEdlqSQ4vSHh/iztRpjV2htPKz7XH+m57OjNzAHAdHJ7wfKZBGvKIZm
 eGnORFrR8jaE/iL9DaK+MB6SqadlUQPioCqRaXJwvdpoKfbbfVkWaZfQCFcwOq7q0J9N
 s6S0hnVMSoBXmmyGBr0GAQDf3Z4uQB2NY/WFFShP789ZGmvnVnQwF9ChHsvO1zv/YSYa
 a5mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697430246; x=1698035046;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TgcU8kyYdf7bCBDsYScnzaxfUBvgYLfTp2VNuJ0shcY=;
 b=OrFZ1hflJhvrKsN7rckTE4+546NwdhVDDJpMhwBsElPn7UJLLDA3ciq7Jw99h/g9kj
 9AnPIntWeL3fHI7qtmuDUEb6Bi4htrZt+4VmSpbJTr5ZhfVYSAWFuRKzltgYmkqBYTgE
 RWyqeuvNVMv0EU26yc6LIa4SGC5NFhVsQsIMhXVUksBKwaIP+4l8wgEZvDYJgLkmfPtV
 XQzAxpppU3v3/ygiCrhfuNfSvUyJ/AMdyweuA0S2PZIfDYGCak5e8irnzq7AvDk6xxxF
 9n3s7nfJWdTyKo5L7MHBn4FZNW1fHrmMi3G1I4gHb5GneUBYTWN6ICmrEN1R+Xh6xPfn
 d+fA==
X-Gm-Message-State: AOJu0Yw7AeSgmcvbY/WXAC+z9BVsaIz4hbnMMwuVNiA02X21R+Trmhjo
 Vc7vYXzOuVkGPk5DjDrYbHumg+3OSLB0adVxyK4=
X-Google-Smtp-Source: AGHT+IFvJfTl0FRJYSD1PY/HO8/2LqDVnKXg3sYWjhcyxuAcrMHvP5vEAtYhO+328h1gpfvD0UF/SEZM1Mnzp0+Dyug=
X-Received: by 2002:a05:6102:6684:b0:457:5eb4:6966 with SMTP id
 gw4-20020a056102668400b004575eb46966mr23598560vsb.17.1697430246620; Sun, 15
 Oct 2023 21:24:06 -0700 (PDT)
MIME-Version: 1.0
References: <20231013110111.34619-1-rbradford@rivosinc.com>
 <20231013110111.34619-4-rbradford@rivosinc.com>
In-Reply-To: <20231013110111.34619-4-rbradford@rivosinc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 16 Oct 2023 14:23:40 +1000
Message-ID: <CAKmqyKNmXo2FVQ9KTfTB0OQVdr1tC3m9Pzk1ikson5nx4+gM8A@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] target/riscv: Use existing PMU counter mask in FDT
 generation
To: Rob Bradford <rbradford@rivosinc.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, atishp@rivosinc.com, 
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com, 
 liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com
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

On Fri, Oct 13, 2023 at 9:02=E2=80=AFPM Rob Bradford <rbradford@rivosinc.co=
m> wrote:
>
> During the FDT generation use the existing mask containing the enabled
> counters rather then generating a new one. Using the existing mask will
> support the use of discontinuous counters.
>
> Signed-off-by: Rob Bradford <rbradford@rivosinc.com>
> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

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

