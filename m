Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FB0AC47422
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 03:06:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rRkdm-0006nB-A3; Sun, 21 Jan 2024 22:06:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rRkdi-0006mJ-PM; Sun, 21 Jan 2024 22:06:23 -0500
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rRkdh-0005FK-Dx; Sun, 21 Jan 2024 22:06:22 -0500
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-dc21d7a7042so2009454276.2; 
 Sun, 21 Jan 2024 19:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705892780; x=1706497580; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v5sfcTmiiisyA94Vz4/AIAJs2wwijWs760Hh1Ivsm94=;
 b=dmZIRjqYgwhhpiW5gbR7sCUfuxTb3L1nFEBkL+uzhx3n/jtx4uzbXtgcExA0PjfhjF
 7+16dcq9nhDcDaB1EflbpBtfmOO7Qc3QdderfqOoiQfR4tMr9i8+nSNK4nrQkDDsQ3kX
 1UnT4gqcTiGpb0rXrnybHpoOgGjsbs5RbC2w/9kHWSNHpKpCI6o4TM8GDLGKRnOfTgj6
 7H+lcOqUOzBZ6PFukX4cdu6tO7hzLpB3t7XUNO9Ls4/krYzs7SLM7ShVcH38LXJSvOBq
 an3a08M1CaBKkfjdXRUtEwqgEd9grQRXjjZ8O3WLyX3Jc8nV6Sohfp6ndPaACvhfRdAQ
 NYXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705892780; x=1706497580;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v5sfcTmiiisyA94Vz4/AIAJs2wwijWs760Hh1Ivsm94=;
 b=eJVdcD9PhJaBurXqWBiQMMnh9bjkrFL0yT5SW6VvS3zriAmXUmF4QT8tUnkv6/9qcI
 QdCYtXspU2EbU8nudEzV8grBpZ/ssuyRcGBs5JI8YNHG6P3NoNVlYNUUwhd9PjdQ88v3
 XdgtSA/SlBct+hohnDKswEs2+EwjfLCWpc/FNIdoI+66F24AqAbsdCFmKEcqq+q2Lbi3
 WjIG7PsDSANTqi6pMP4u3W6ioVqrzeESw2YKN6wkDfM8vcTc5dnxVuA5VJpOTfkeT0To
 RM+A5TyGCCGBdAXmBrx2AqFhCH5JZeW0OGbr9d2lYPWswkJ+YXtPQ8yFuIy2H0kRjDjO
 DkJQ==
X-Gm-Message-State: AOJu0YwPGdc0OB1M0s6VgykTfdum4PQDaFP07X3TSqhS14rVx6e9rcBu
 N9fOzFzieaqIrkPRzP0lS5qGJp/tDb0UoJMC4uTE9UH8MtH74dbsj5yhe1eSbCqz5f9asqAB/ST
 XdX2pkDpx/2ONNuGDn0ZQ5doDKe0=
X-Google-Smtp-Source: AGHT+IGTM4naClu8tCO48esjPMNpvTMw+5e2VVeS/iNXzOpYX7KNSGZTrBzxwjFEzTE8IlDMUjrp6W7oeFi9TK3vDp4=
X-Received: by 2002:a25:b1a6:0:b0:dc2:54fc:c581 with SMTP id
 h38-20020a25b1a6000000b00dc254fcc581mr1701555ybj.94.1705892779766; Sun, 21
 Jan 2024 19:06:19 -0800 (PST)
MIME-Version: 1.0
References: <20240116205817.344178-1-dbarboza@ventanamicro.com>
 <20240116205817.344178-11-dbarboza@ventanamicro.com>
In-Reply-To: <20240116205817.344178-11-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Jan 2024 13:05:53 +1000
Message-ID: <CAKmqyKMTdQbhySdY=n4Qs53_17s1BgjDoxocwsLBONbRs=i1ig@mail.gmail.com>
Subject: Re: [PATCH v3 10/13] target/riscv/cpu.h: use 'vlenb' in
 vext_get_vlmax()
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, richard.henderson@linaro.org, max.chou@sifive.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=alistair23@gmail.com; helo=mail-yb1-xb2b.google.com
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

On Wed, Jan 17, 2024 at 7:02=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Rename the existing 'sew' variable to 'vsew' for extra clarity.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.h | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 11df226a00..3af61e0f94 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -690,9 +690,16 @@ static inline RISCVMXL riscv_cpu_sxl(CPURISCVState *=
env)
>   */
>  static inline uint32_t vext_get_vlmax(RISCVCPU *cpu, target_ulong vtype)
>  {
> -    uint8_t sew =3D FIELD_EX64(vtype, VTYPE, VSEW);
> +    uint8_t vsew =3D FIELD_EX64(vtype, VTYPE, VSEW);
>      int8_t lmul =3D sextract32(FIELD_EX64(vtype, VTYPE, VLMUL), 0, 3);
> -    return cpu->cfg.vlen >> (sew + 3 - lmul);
> +    uint32_t vlen =3D cpu->cfg.vlenb << 3;
> +
> +    /*
> +     * We need to use 'vlen' instead of 'vlenb' to
> +     * preserve the '+ 3' in the formula. Otherwise
> +     * we risk a negative shift if vsew < lmul.
> +     */
> +    return vlen >> (vsew + 3 - lmul);
>  }
>
>  void cpu_get_tb_cpu_state(CPURISCVState *env, vaddr *pc,
> --
> 2.43.0
>
>

