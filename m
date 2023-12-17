Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA23C3DA6E
	for <qemu-riscv@archiver.kernel.org>; Sun, 17 Dec 2023 22:57:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rF04T-0001Ld-3n; Sun, 17 Dec 2023 17:57:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rF04O-0001HQ-Sk; Sun, 17 Dec 2023 17:57:12 -0500
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rF04G-0008Ln-Da; Sun, 17 Dec 2023 17:57:12 -0500
Received: by mail-oo1-xc30.google.com with SMTP id
 006d021491bc7-589d4033e84so1815515eaf.1; 
 Sun, 17 Dec 2023 14:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702853823; x=1703458623; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=no3OST4kml0RbWigchwmxf3Pnq0GT2ZmHOMOPeKy2/w=;
 b=g7+binOAScfb9a+SEAaPeFmO0PMAIcVWSsMVFRogVNSmPhOcX+qUZSHYU7GGbkxa5E
 K9zy0cLPhLHZOWIPRn0/+DpsEY6/ChxBQmUvaOioRnzAaiFI5upJ58F6bjjKqYg6wc6z
 t74zIC6FivMVMYDqdtb8HxA7GL7OkN87aSC5Oeo/GCwUP/EM1G9cbMB7KrvMWfGwX40m
 GLNsGkSaNm6DcDrX69b8Ukp1HKFAHu6U/qUmoct0ohogrVmNOFvve5EAcxKknl0u6/p2
 EvyegnE6TmUuAnsutl+XNyJqfrkAYqmsT5NbLXAiOquvLd3nVQpFZsvgL/9c06ccRsDe
 gK5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702853823; x=1703458623;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=no3OST4kml0RbWigchwmxf3Pnq0GT2ZmHOMOPeKy2/w=;
 b=OcNZYNIKmFNTiko5tmv7jj7Ggb0C9y37n8JQb2QzL8o3O/e91Xzz10JsbZb7Nex78x
 p05DfciGrm9w1rbg3lomBi/wvhs22eGHu2VyrRptrgchtBulkJv77fHNLpkTtgBoqWQy
 eF7N2ESJAKeacEhjs2la+cp5d6TwZUKNmeJ2xS73Zal7dQTMNtmb12OdbbjAPJs6Ba25
 ZrHbFzEsEP0Jpq3JAgC1HlXrq3xR4Thd/mLlIgrhpGlGdlZ7vMtkeeOHsonoT+C/CPaJ
 Eutes0rvzP5o17aWf+p6xkJano/F/hrxjR70L0KoXNDNtTNYBZ8aX8p/IyApAAGoAo1E
 V/Vg==
X-Gm-Message-State: AOJu0YwrIUVfIRkYmiwO1DRIb+4MBr6KVuA80ezcPQBwqsO5HwCy6uhk
 CupshUlvs24WW3hnyoca1k/h+o7J331a1pN/bREsaf4O314=
X-Google-Smtp-Source: AGHT+IEPSImu5QCc62X5zmFzezYenUBRJoJnJIbX73eFaDa5bItDQBRGSHlZKcRp93aeWwUbiytr3FwGLfcOBXMjrvQ=
X-Received: by 2002:aca:210e:0:b0:3b8:b063:a1db with SMTP id
 14-20020aca210e000000b003b8b063a1dbmr16184232oiz.101.1702853822697; Sun, 17
 Dec 2023 14:57:02 -0800 (PST)
MIME-Version: 1.0
References: <20231123091214.20312-1-ivan.klokov@syntacore.com>
In-Reply-To: <20231123091214.20312-1-ivan.klokov@syntacore.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 18 Dec 2023 08:56:36 +1000
Message-ID: <CAKmqyKO1TLcGYRRNstQytaStnJzp10K7oP7mwZ5kBY6r=dUKOQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] target/riscv/pmp: Use hwaddr instead of target_ulong
 for RV32
To: Ivan Klokov <ivan.klokov@syntacore.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com, 
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::c30;
 envelope-from=alistair23@gmail.com; helo=mail-oo1-xc30.google.com
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

On Thu, Nov 23, 2023 at 7:13=E2=80=AFPM Ivan Klokov <ivan.klokov@syntacore.=
com> wrote:
>
> The Sv32 page-based virtual-memory scheme described in RISCV privileged
> spec Section 5.3 supports 34-bit physical addresses for RV32, so the
> PMP scheme must support addresses wider than XLEN for RV32. However,
> PMP address register format is still 32 bit wide.
>
> Signed-off-by: Ivan Klokov <ivan.klokov@syntacore.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/pmp.c | 26 ++++++++++++--------------
>  target/riscv/pmp.h |  8 ++++----
>  2 files changed, 16 insertions(+), 18 deletions(-)
>
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index 162e88a90a..dff9512c3f 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -150,8 +150,7 @@ void pmp_unlock_entries(CPURISCVState *env)
>      }
>  }
>
> -static void pmp_decode_napot(target_ulong a, target_ulong *sa,
> -                             target_ulong *ea)
> +static void pmp_decode_napot(hwaddr a, hwaddr *sa, hwaddr *ea)
>  {
>      /*
>       * aaaa...aaa0   8-byte NAPOT range
> @@ -173,8 +172,8 @@ void pmp_update_rule_addr(CPURISCVState *env, uint32_=
t pmp_index)
>      uint8_t this_cfg =3D env->pmp_state.pmp[pmp_index].cfg_reg;
>      target_ulong this_addr =3D env->pmp_state.pmp[pmp_index].addr_reg;
>      target_ulong prev_addr =3D 0u;
> -    target_ulong sa =3D 0u;
> -    target_ulong ea =3D 0u;
> +    hwaddr sa =3D 0u;
> +    hwaddr ea =3D 0u;
>
>      if (pmp_index >=3D 1u) {
>          prev_addr =3D env->pmp_state.pmp[pmp_index - 1].addr_reg;
> @@ -227,8 +226,7 @@ void pmp_update_rule_nums(CPURISCVState *env)
>      }
>  }
>
> -static int pmp_is_in_range(CPURISCVState *env, int pmp_index,
> -                           target_ulong addr)
> +static int pmp_is_in_range(CPURISCVState *env, int pmp_index, hwaddr add=
r)
>  {
>      int result =3D 0;
>
> @@ -305,14 +303,14 @@ static bool pmp_hart_has_privs_default(CPURISCVStat=
e *env, pmp_priv_t privs,
>   * Return true if a pmp rule match or default match
>   * Return false if no match
>   */
> -bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
> +bool pmp_hart_has_privs(CPURISCVState *env, hwaddr addr,
>                          target_ulong size, pmp_priv_t privs,
>                          pmp_priv_t *allowed_privs, target_ulong mode)
>  {
>      int i =3D 0;
>      int pmp_size =3D 0;
> -    target_ulong s =3D 0;
> -    target_ulong e =3D 0;
> +    hwaddr s =3D 0;
> +    hwaddr e =3D 0;
>
>      /* Short cut if no rules */
>      if (0 =3D=3D pmp_get_num_rules(env)) {
> @@ -624,12 +622,12 @@ target_ulong mseccfg_csr_read(CPURISCVState *env)
>   * To avoid this we return a size of 1 (which means no caching) if the P=
MP
>   * region only covers partial of the TLB page.
>   */
> -target_ulong pmp_get_tlb_size(CPURISCVState *env, target_ulong addr)
> +target_ulong pmp_get_tlb_size(CPURISCVState *env, hwaddr addr)
>  {
> -    target_ulong pmp_sa;
> -    target_ulong pmp_ea;
> -    target_ulong tlb_sa =3D addr & ~(TARGET_PAGE_SIZE - 1);
> -    target_ulong tlb_ea =3D tlb_sa + TARGET_PAGE_SIZE - 1;
> +    hwaddr pmp_sa;
> +    hwaddr pmp_ea;
> +    hwaddr tlb_sa =3D addr & ~(TARGET_PAGE_SIZE - 1);
> +    hwaddr tlb_ea =3D tlb_sa + TARGET_PAGE_SIZE - 1;
>      int i;
>
>      /*
> diff --git a/target/riscv/pmp.h b/target/riscv/pmp.h
> index 9af8614cd4..f5c10ce85c 100644
> --- a/target/riscv/pmp.h
> +++ b/target/riscv/pmp.h
> @@ -53,8 +53,8 @@ typedef struct {
>  } pmp_entry_t;
>
>  typedef struct {
> -    target_ulong sa;
> -    target_ulong ea;
> +    hwaddr sa;
> +    hwaddr ea;
>  } pmp_addr_t;
>
>  typedef struct {
> @@ -73,11 +73,11 @@ target_ulong mseccfg_csr_read(CPURISCVState *env);
>  void pmpaddr_csr_write(CPURISCVState *env, uint32_t addr_index,
>                         target_ulong val);
>  target_ulong pmpaddr_csr_read(CPURISCVState *env, uint32_t addr_index);
> -bool pmp_hart_has_privs(CPURISCVState *env, target_ulong addr,
> +bool pmp_hart_has_privs(CPURISCVState *env, hwaddr addr,
>                          target_ulong size, pmp_priv_t privs,
>                          pmp_priv_t *allowed_privs,
>                          target_ulong mode);
> -target_ulong pmp_get_tlb_size(CPURISCVState *env, target_ulong addr);
> +target_ulong pmp_get_tlb_size(CPURISCVState *env, hwaddr addr);
>  void pmp_update_rule_addr(CPURISCVState *env, uint32_t pmp_index);
>  void pmp_update_rule_nums(CPURISCVState *env);
>  uint32_t pmp_get_num_rules(CPURISCVState *env);
> --
> 2.34.1
>
>

