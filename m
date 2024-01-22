Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 417A6C47DAF
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 07:02:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rRoKD-00057s-Hl; Mon, 22 Jan 2024 02:02:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rRoKB-00057f-DH; Mon, 22 Jan 2024 02:02:27 -0500
Received: from mail-vk1-xa2a.google.com ([2607:f8b0:4864:20::a2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rRoK9-0002nc-TA; Mon, 22 Jan 2024 02:02:27 -0500
Received: by mail-vk1-xa2a.google.com with SMTP id
 71dfb90a1353d-4bb193ac0f8so490651e0c.2; 
 Sun, 21 Jan 2024 23:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705906944; x=1706511744; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K3HUfNs+2LsPV7TM+lAebAkVXeDABFRjVnNsw9F5Bmo=;
 b=UrQOAZYfX5scuXatnQ5ca52hU4c5o+/he4SHFVepn9Btn7GI5oLopDfBG0RSatKvps
 rKlgy98ExxnqpR01tpHmRsG+XR298xr8XVtdzhgMFs3vDhfLSONb4neMZBg+ziF4ZK+o
 TngCxva0cvcxEMA3HdbggZCpgKlxTWc2GT1vVfjJKSfzLwPAHjCqw1Pfg8iXXxVl4u+z
 tIOR6a8W8000xN/iCNZAaORsQHHrArx6D+4y7SP9UjGiZKi1eZ0b0U6joRfmqwMKhY/9
 +Y18jb4rzTkQFAICd2075uvj50eJSLXxYf6WjC8bMapuRgjrJaEtXXWALVam7FI72fFN
 h8wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705906944; x=1706511744;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K3HUfNs+2LsPV7TM+lAebAkVXeDABFRjVnNsw9F5Bmo=;
 b=Sr3gn8KCrFB7qQ7j3JNfR0UGrE8PmSd0VSnOr1+4OeSPmRFKUYDp2zz9xpt8eybPV3
 MRyQP+3hQvK/w5hFluhItBSRQ7lGoQrxOyCwN8f5q62Zq+8hh0a02tGRZ2E482r6UK6a
 EWyrYAjPVv2RSgnyCqmmpfQXHRhOCFUfjs6+KvH+a3zR6Ae158KKzYuTvHn4EPIgKRVB
 n32Y6Z+3VaXWnNwh3rnSyGYVYoLO1X8ot5eiH74NYhHY/JfcJl1LFCo3NXT6hC9zv5Jo
 Lt1i5dTENeNOU4NnK9s/avB0M16mPuaWqP6WL2v6oZ0fltAtT53B0TCeoKO/nrxQ8QtC
 qHxQ==
X-Gm-Message-State: AOJu0YxA4hIw44ueaOa16IqohWo9xmQUnVg4090IveE5RgR5on2Rfjj1
 vykq0jiBonZEGQIrGm23cZ3Z26HXo2TJ0LY2Naks7eMrD8jcFx5h27HGxfrRLcTBYbiUOnc9SL1
 T9pt+zjEpImFkwNHFP4r579EKdVg=
X-Google-Smtp-Source: AGHT+IHVjh9aWB8MpCH+z8GExsTX0c+seS9fHmjgat+jX4+EGOmT0tFjiLcvfcR1PJ/XHYgkAbQM+T3lDPzggEyQBng=
X-Received: by 2002:a05:6122:30ab:b0:4b6:c771:47e8 with SMTP id
 cd43-20020a05612230ab00b004b6c77147e8mr746398vkb.20.1705906944526; Sun, 21
 Jan 2024 23:02:24 -0800 (PST)
MIME-Version: 1.0
References: <20240109102930.405323-1-me@deliversmonkey.space>
 <20240109102930.405323-5-me@deliversmonkey.space>
In-Reply-To: <20240109102930.405323-5-me@deliversmonkey.space>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Jan 2024 17:01:58 +1000
Message-ID: <CAKmqyKM5biG5CbBF4OeB6TcXmaxmwpAQFOu_ak=jLgz9e4s5gw@mail.gmail.com>
Subject: Re: [PATCH v4 4/6] target/riscv: Add pointer masking tb flags
To: Alexey Baturo <baturo.alexey@gmail.com>
Cc: richard.henderson@linaro.org, zhiwei_liu@linux.alibaba.com, 
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu, 
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2a;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2a.google.com
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

On Tue, Jan 9, 2024 at 8:31=E2=80=AFPM Alexey Baturo <baturo.alexey@gmail.c=
om> wrote:
>
> From: Alexey Baturo <baturo.alexey@gmail.com>
>
> Signed-off-by: Alexey Baturo <baturo.alexey@gmail.com>
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.h        | 3 +++
>  target/riscv/cpu_helper.c | 3 +++
>  target/riscv/translate.c  | 5 +++++
>  3 files changed, 11 insertions(+)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 1c8979c1c8..0284ea418f 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -545,6 +545,9 @@ FIELD(TB_FLAGS, ITRIGGER, 20, 1)
>  FIELD(TB_FLAGS, VIRT_ENABLED, 21, 1)
>  FIELD(TB_FLAGS, PRIV, 22, 2)
>  FIELD(TB_FLAGS, AXL, 24, 2)
> +/* If pointer masking should be applied and address sign extended */
> +FIELD(TB_FLAGS, PM_PMM, 26, 2)
> +FIELD(TB_FLAGS, PM_SIGNEXTEND, 28, 1)
>
>  #ifdef TARGET_RISCV32
>  #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 9640e4c2c5..67bc51e510 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -68,6 +68,7 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, vaddr *pc=
,
>      RISCVCPU *cpu =3D env_archcpu(env);
>      RISCVExtStatus fs, vs;
>      uint32_t flags =3D 0;
> +    bool pm_signext =3D riscv_cpu_virt_mem_enabled(env);
>
>      *pc =3D env->xl =3D=3D MXL_RV32 ? env->pc & UINT32_MAX : env->pc;
>      *cs_base =3D 0;
> @@ -135,6 +136,8 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, vaddr *=
pc,
>      flags =3D FIELD_DP32(flags, TB_FLAGS, VS, vs);
>      flags =3D FIELD_DP32(flags, TB_FLAGS, XL, env->xl);
>      flags =3D FIELD_DP32(flags, TB_FLAGS, AXL, cpu_address_xl(env));
> +    flags =3D FIELD_DP32(flags, TB_FLAGS, PM_PMM, riscv_pm_get_pmm(env))=
;
> +    flags =3D FIELD_DP32(flags, TB_FLAGS, PM_SIGNEXTEND, pm_signext);
>
>      *pflags =3D flags;
>  }
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 6b4b9a671c..2c89d749c0 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -103,6 +103,9 @@ typedef struct DisasContext {
>      bool vl_eq_vlmax;
>      CPUState *cs;
>      TCGv zero;
> +    /* actual address width */
> +    uint8_t addr_width;
> +    bool addr_signed;
>      /* Use icount trigger for native debug */
>      bool itrigger;
>      /* FRM is known to contain a valid value. */
> @@ -1176,6 +1179,8 @@ static void riscv_tr_init_disas_context(DisasContex=
tBase *dcbase, CPUState *cs)
>      ctx->xl =3D FIELD_EX32(tb_flags, TB_FLAGS, XL);
>      ctx->address_xl =3D FIELD_EX32(tb_flags, TB_FLAGS, AXL);
>      ctx->cs =3D cs;
> +    ctx->addr_width =3D 0;
> +    ctx->addr_signed =3D false;
>      ctx->itrigger =3D FIELD_EX32(tb_flags, TB_FLAGS, ITRIGGER);
>      ctx->zero =3D tcg_constant_tl(0);
>      ctx->virt_inst_excp =3D false;
> --
> 2.34.1
>
>

