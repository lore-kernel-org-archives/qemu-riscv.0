Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36ED2CDB474
	for <qemu-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 02:35:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qukmv-00032G-8Q; Sun, 22 Oct 2023 22:35:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qukmt-00031y-AJ; Sun, 22 Oct 2023 22:35:27 -0400
Received: from mail-vk1-xa32.google.com ([2607:f8b0:4864:20::a32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qukmr-0004j7-Ly; Sun, 22 Oct 2023 22:35:27 -0400
Received: by mail-vk1-xa32.google.com with SMTP id
 71dfb90a1353d-49d6bd3610cso1242595e0c.1; 
 Sun, 22 Oct 2023 19:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698028524; x=1698633324; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DXluwi1vyq0LvLxU+daWwG8i3ejzFLn17omiskpJBzA=;
 b=AtutcUPzQF6jpn5mYuhK6RfocHTAKVi1fRt5xyWOUwKrJLlAYUz+cgt6KaD+DLzXFv
 kNnFiPGiZwztjbatNaTFOPjq9ywTj3OZltrJPYEWixRNoF4sV+It5WcevIhyYgbidW+q
 9jvaxSRNktb2ewcEnlH2lOZ5A0QMs5mRAw1Or1UjvkL/aTEX/+nyqHAqpXHaoJvnb2dY
 Ny1hmm/UjlxcfVSrSiTMWHyzC9fquIf0MGbs6wsoFO/eTCcdtQe1AghM7kQrP/FtRN8z
 DtIwrN91XOYM397Y+HvbMLPeJvnp/Sup1lQUAsoAgPuiPbtjA9LkqUgVoeeyjUG0WDh2
 A7rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698028524; x=1698633324;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DXluwi1vyq0LvLxU+daWwG8i3ejzFLn17omiskpJBzA=;
 b=Xb9JhE30sbPJaMonNlzATeCfSXFeMDUYuwmSilNnz0TN/eclSDSz4SyPfqjYOX1Yg9
 qtLUa/xy1qzkL07Wl9Lnmeyzf7zC+PfFf7v8WGC/GA2B7cqppoVizmMiEzJ+kQbGxBoX
 xBccdpAIMF8Twj4mmiJMFaTLHeGDEzXMMolMWMcP3htxR6RoOPWHw89LnSh+OVMmT/IA
 vgjTtnOAqVg9+uOj576veIL7S12tGfJvPQkweZak7KQJUKgXxk5TTikgLDE4gS1sH5/J
 yQ/1eFGNrGJJOZL2rhskfnL0jAs8NcU04arDw5mN4hN+1mdNBDPbEX1i5WRdJr8SZpmX
 CKPA==
X-Gm-Message-State: AOJu0YzStCthoH6D9XWI1PQ+S28fGetyhsshx3qMNcBJaH8OQXl6CSJo
 NCMuUSaKC3iUZSi3tCjQP7ewmt1ArK2bxnNj5OA=
X-Google-Smtp-Source: AGHT+IEbILoahlp2+BWQWDJdJQyANbtHelRwKSAhDxxlSK42SdeE6ltvrzxm948PfvUr6tSFHr682F5D/WV+Ra8mkkM=
X-Received: by 2002:a05:6122:3c81:b0:49a:9146:ec02 with SMTP id
 fy1-20020a0561223c8100b0049a9146ec02mr8181913vkb.1.1698028524242; Sun, 22 Oct
 2023 19:35:24 -0700 (PDT)
MIME-Version: 1.0
References: <20231019065644.1431798-1-mchitale@ventanamicro.com>
In-Reply-To: <20231019065644.1431798-1-mchitale@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 23 Oct 2023 12:34:57 +1000
Message-ID: <CAKmqyKM-NaWD-_b_V86Np86_j_a+=_221635gFG2shSiV__rhQ@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: pmp: Clear pmp/smepmp bits on reset
To: Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a32;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa32.google.com
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

On Thu, Oct 19, 2023 at 4:57=E2=80=AFPM Mayuresh Chitale
<mchitale@ventanamicro.com> wrote:
>
> As per the Priv and Smepmp specifications, certain bits such as the 'L'
> bit of pmp entries and mseccfg.MML can only be cleared upon reset and it
> is necessary to do so to allow 'M' mode firmware to correctly reinitializ=
e
> the pmp/smpemp state across reboots. As required by the spec, also clear
> the 'A' field of pmp entries.
>
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
> Changes in v2:
> =3D=3D=3D=3D
> - Rebase on latest riscv-to-apply.next
> - Clear 'A' field.
>
>  target/riscv/cpu.c | 11 +++++++++++
>  target/riscv/pmp.c | 10 ++++++++++
>  target/riscv/pmp.h |  2 ++
>  3 files changed, 23 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index dad167833cc..491e0e46e2e 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -883,6 +883,17 @@ static void riscv_cpu_reset_hold(Object *obj)
>      }
>      /* mmte is supposed to have pm.current hardwired to 1 */
>      env->mmte |=3D (EXT_STATUS_INITIAL | MMTE_M_PM_CURRENT);
> +
> +    /*
> +     * Clear mseccfg and unlock all the PMP entries upon reset.
> +     * This is allowed as per the priv and smepmp specifications
> +     * and is needed to clear stale entries across reboots.
> +     */
> +    if (riscv_cpu_cfg(env)->ext_smepmp) {
> +        env->mseccfg =3D 0;
> +    }
> +
> +    pmp_unlock_entries(env);
>  #endif
>      env->xl =3D riscv_cpu_mxl(env);
>      riscv_cpu_update_mask(env);
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index 21d2489e27e..4dfaa28fce2 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -135,6 +135,16 @@ static bool pmp_write_cfg(CPURISCVState *env, uint32=
_t pmp_index, uint8_t val)
>      return false;
>  }
>
> +void pmp_unlock_entries(CPURISCVState *env)
> +{
> +    uint32_t pmp_num =3D pmp_get_num_rules(env);
> +    int i;
> +
> +    for (i =3D 0; i < pmp_num; i++) {
> +        env->pmp_state.pmp[i].cfg_reg &=3D ~(PMP_LOCK | PMP_AMATCH);
> +    }
> +}
> +
>  static void pmp_decode_napot(target_ulong a, target_ulong *sa,
>                               target_ulong *ea)
>  {
> diff --git a/target/riscv/pmp.h b/target/riscv/pmp.h
> index cf5c99f8e68..9af8614cd4f 100644
> --- a/target/riscv/pmp.h
> +++ b/target/riscv/pmp.h
> @@ -28,6 +28,7 @@ typedef enum {
>      PMP_READ  =3D 1 << 0,
>      PMP_WRITE =3D 1 << 1,
>      PMP_EXEC  =3D 1 << 2,
> +    PMP_AMATCH =3D (3 << 3),
>      PMP_LOCK  =3D 1 << 7
>  } pmp_priv_t;
>
> @@ -81,6 +82,7 @@ void pmp_update_rule_addr(CPURISCVState *env, uint32_t =
pmp_index);
>  void pmp_update_rule_nums(CPURISCVState *env);
>  uint32_t pmp_get_num_rules(CPURISCVState *env);
>  int pmp_priv_to_page_prot(pmp_priv_t pmp_priv);
> +void pmp_unlock_entries(CPURISCVState *env);
>
>  #define MSECCFG_MML_ISSET(env) get_field(env->mseccfg, MSECCFG_MML)
>  #define MSECCFG_MMWP_ISSET(env) get_field(env->mseccfg, MSECCFG_MMWP)
> --
> 2.34.1
>
>

