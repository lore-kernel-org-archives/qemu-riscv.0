Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CD99CAC5B9
	for <qemu-riscv@archiver.kernel.org>; Tue, 30 Sep 2025 01:07:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v3Opf-0002St-Kb; Mon, 29 Sep 2025 21:07:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v3Opd-0002SS-VD
 for qemu-riscv@nongnu.org; Mon, 29 Sep 2025 21:07:06 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1v3Opa-0002x6-FS
 for qemu-riscv@nongnu.org; Mon, 29 Sep 2025 21:07:05 -0400
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-b3727611c1bso975912566b.1
 for <qemu-riscv@nongnu.org>; Mon, 29 Sep 2025 18:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759194415; x=1759799215; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K3mG6W244bnzz9EUy52hWRP/ADiTXf4+4aOjIXtXRvA=;
 b=XW6zb6Bj13B8m/UVGW0czv5pSH9rThubusF/mmoQ/llOQ5U/aYR5Awu0SsW6ggN27t
 I75+PXYpzaTbGmn0+oFYXDq38oC+qvpV4P9rja7vDtNDBn1zHRPeiFhsAOLnBZeLIoKh
 ErYEJH9p9tBz4lHbEycJOnk9xNQjuxZ0RSf6OOBlJ4Lyxg4mtg78ajnAPxDY6zA9W0A4
 UgEmMF5gPIBiBNq6w29wQtvfZjPdYjMWtCpsi4iLbCAG2dv3iZyp+bnUQ+ZmaX6m/JwO
 1pdpC//VOZ4p6Cji7j8JzHIrk9kOUTblvyJzAP9mDyGqjPEdtEA+e4QOkmzOv6ZViGD2
 TGwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759194415; x=1759799215;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K3mG6W244bnzz9EUy52hWRP/ADiTXf4+4aOjIXtXRvA=;
 b=UIcXgvv7+w8jBTOUUd9Y/MdBt0cs4VAZjrdCmzZmmyd4bQrmVM54wqClE8dbnj2Xxd
 34gxdC9AukWjjsDoQR+Rwzqv78MIU0k1AXRmDMMMKGsijQBdtSf+f+6V7wZP+B8lfV0n
 DrLSjsl6BnGaxOHA2VFTcXi2o23XzUs4ux0B4iS6Ch11Lgeta/Tk8ds1vxHXNfrPuffE
 fJ9xeiZEP+uSMtXMrP7wKn9hmF6zKjXpd47PpmTAE7+nIbKKPsGhqLo8y2fGmOy8C4xr
 lQPx34fnqaW18MIps0HENUGEIf4hW1SgxSnG2B2zEMH7U7aNugERq6t596ahlXe8qGCt
 SelQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1ObHmvicvTNMn19obP1C0pRkK5nsaw4QE+R0POrXG0P8VIf591Er8odcApLFon+4lizcH2aOqejdi@nongnu.org
X-Gm-Message-State: AOJu0YysIhTbUUl9LhYky19VWJT5Ax1p/GAtC2BnT2N/8tHYBjKM+zG0
 t3EF7z76f/H8kDCCF86WJhsdYPjzIjyPKjg533ggfeRPejo7lETovVcSGeoXtCVyJOkHdzsLJrO
 jcHgmyniuO1oGNKfddU49XjJQ0+WPq/0=
X-Gm-Gg: ASbGncukAURSPwRYneZ5n7QGrjdwhSYYxzJLE+ehvAHPJdcaGtsULcMciKFLD0C7y4Q
 CFGo0VM6A/7ag4tV3ROPsH74X9rCjv3xuewO8xJJkBXQoAnXJM3PFiaoTOQ6Yb4kJaYxbk85rqa
 0gxHTR+ADCnADJmdEA1VNBfuku21hRz9l5MHzdArJIZyeTNQGeuf+1ZwcF9d593wCPvNkJqTDDL
 SEj6cwlUWllWW4CvDBz/zHSvYZ72CaGwN9nfSrVTYulKlNp
X-Google-Smtp-Source: AGHT+IGAwiUZ5hlLAGcwEUa5RhAPUgH0XSFEH0AhxlbMgpdmnbDJye1aqfQDFzhVychBVxnuu1uRnNgTxSv1A/rewf4=
X-Received: by 2002:a17:907:6093:b0:b04:6a58:560b with SMTP id
 a640c23a62f3a-b34ba93ce11mr2016409766b.39.1759194415187; Mon, 29 Sep 2025
 18:06:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250924091746.1882125-1-djordje.todorovic@htecgroup.com>
 <20250924091746.1882125-3-djordje.todorovic@htecgroup.com>
In-Reply-To: <20250924091746.1882125-3-djordje.todorovic@htecgroup.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 30 Sep 2025 11:06:29 +1000
X-Gm-Features: AS18NWAJQ30Ys9wPN1UnsUW5EMJwv8AOBLKNvsw3jZwJFsfaVeALwaNPrPfiZQY
Message-ID: <CAKmqyKM+FXe3EVR1Mzpq3pVCEFg_wG7qfgkrjFuQ1HiifdGyvA@mail.gmail.com>
Subject: Re: [PATCH v8 02/14] target/riscv: Add cpu_set_exception_base
To: Djordje Todorovic <Djordje.Todorovic@htecgroup.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>, 
 "cfu@mips.com" <cfu@mips.com>, "mst@redhat.com" <mst@redhat.com>, 
 "marcel.apfelbaum@gmail.com" <marcel.apfelbaum@gmail.com>, 
 "dbarboza@ventanamicro.com" <dbarboza@ventanamicro.com>,
 "philmd@linaro.org" <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=alistair23@gmail.com; helo=mail-ej1-x631.google.com
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

On Wed, Sep 24, 2025 at 7:21=E2=80=AFPM Djordje Todorovic
<Djordje.Todorovic@htecgroup.com> wrote:
>
> Add a new function, so we can change reset vector from platforms
> during runtime.

There is already a "resetvec" property, which hw/riscv/opentitan.c is
using to set a custom resetvec. Why can't you use that?

Alistair

>
> Signed-off-by: Chao-ying Fu <cfu@mips.com>
> Signed-off-by: Djordje Todorovic <djordje.todorovic@htecgroup.com>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu.c | 14 ++++++++++++++
>  target/riscv/cpu.h |  4 ++++
>  2 files changed, 18 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index d055ddf462..74728c5371 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -73,6 +73,20 @@ bool riscv_cpu_option_set(const char *optname)
>      return g_hash_table_contains(general_user_opts, optname);
>  }
>
> +#ifndef CONFIG_USER_ONLY
> +void cpu_set_exception_base(int vp_index, target_ulong address)
> +{
> +    CPUState *cpu_state =3D qemu_get_cpu(vp_index);
> +    if (cpu_state =3D=3D NULL) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "cpu_set_exception_base: invalid vp_index: %u",
> +                      vp_index);
> +    }
> +    RISCVCPU *vp =3D RISCV_CPU(cpu_state);
> +    vp->env.resetvec =3D address;
> +}
> +#endif
> +
>  static void riscv_cpu_cfg_merge(RISCVCPUConfig *dest, const RISCVCPUConf=
ig *src)
>  {
>  #define BOOL_FIELD(x) dest->x |=3D src->x;
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 4a862da615..34751bd414 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -672,6 +672,10 @@ G_NORETURN void riscv_raise_exception(CPURISCVState =
*env,
>  target_ulong riscv_cpu_get_fflags(CPURISCVState *env);
>  void riscv_cpu_set_fflags(CPURISCVState *env, target_ulong);
>
> +#ifndef CONFIG_USER_ONLY
> +void cpu_set_exception_base(int vp_index, target_ulong address);
> +#endif
> +
>  FIELD(TB_FLAGS, MEM_IDX, 0, 3)
>  FIELD(TB_FLAGS, FS, 3, 2)
>  /* Vector flags */
> --
> 2.34.1
>

