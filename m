Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65390C4167B
	for <qemu-riscv@archiver.kernel.org>; Wed,  6 Dec 2023 03:46:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rAirH-0007jO-G4; Tue, 05 Dec 2023 22:45:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rAirF-0007is-S2; Tue, 05 Dec 2023 22:45:57 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rAirE-0002JW-38; Tue, 05 Dec 2023 22:45:57 -0500
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-54c9116d05fso4463694a12.3; 
 Tue, 05 Dec 2023 19:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701834353; x=1702439153; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bDWGcCNqZu2whCMyfiClYxaDoTJ/Vo/bcHO8zF5r9qA=;
 b=kFELrhEHjeWo7PijRJFAVLa62jxHjAXf65P8B18JrKf8uOAuF/kXlyIMKIYiUvMjAL
 T1zl5+MRPt/L7fGVqrjlF0cMeEI4PhlNTMg5Km2TMBmKXiiHQP1oM3v3wHcbspW12tJC
 tlaJuFR/NiEgU/dnoScLlCydrJIRROlghfSKIeZeEWkYg17vGpXHllOIETWY6RgbFNJh
 o/tNXknuDu6inrjpG8zmC/yqtkWtxaqFHohA4od6WRSvA05fBfeRbg1SdTpynpn+Fmie
 cBaQWAg2Bl1CMDJdyCg18sKFDbxwrUoCR1c1kH8z9+ORd4tI3fyl6hwbISSMxF3k05ji
 H8MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701834353; x=1702439153;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bDWGcCNqZu2whCMyfiClYxaDoTJ/Vo/bcHO8zF5r9qA=;
 b=MTFOq6lLf6QzDjt33zF2/SyTf6Zdb+PiLduxmhpPXHvFHS/ukW8MeyFUXdIJlcz3aW
 kSqQ7Tszq4gSL/pogtI8I3C0IjZL+vAaV8SsUrOdTR4jHaAUNYiH5MdMJe+GE1MF3RrU
 fQxaazMtYarxqmlvbf1JsLRK7bbZ6HetKu979wJeQMqhsLqpN7PcUwq4izrJ2kpEV0F6
 /rga43KyfVaK7mSymrrURwtBhrFvQHW12dXy0+slBq1Z+azKCPthgFjufLqQEvWjNUlr
 jCwf98ZwDpz0UlzfIu3q5A1QSLNHF+bKI0tQ8xzhvVkX0TlcVIzso4ClSBxjV/N0S0cj
 6ZIQ==
X-Gm-Message-State: AOJu0YzJJlVnwFLxcRyjeO9b+xERRWRpMxQB6iAQj41zBVhn5/VjsZeX
 OeDHtO6oaTVsClBYDLD/TFQScCBBCNuLO6bmZqU=
X-Google-Smtp-Source: AGHT+IGXW2kRm0RR+9VcQmAJVAAz2gLygYxUZUgJjdxysTrHj453Dmce36Wc0yyKotVVjF9xu89TaPTmWPlFvC9bpqs=
X-Received: by 2002:a50:d7ce:0:b0:54c:fc8e:55ef with SMTP id
 m14-20020a50d7ce000000b0054cfc8e55efmr77563edj.167.1701834353036; Tue, 05 Dec
 2023 19:45:53 -0800 (PST)
MIME-Version: 1.0
References: <20231123091214.20312-1-ivan.klokov@syntacore.com>
In-Reply-To: <20231123091214.20312-1-ivan.klokov@syntacore.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 6 Dec 2023 13:45:25 +1000
Message-ID: <CAKmqyKP+iKnLRBce4PDE4-_=SaThVZNBDvn+Vd-ZsGLQ+C8NZw@mail.gmail.com>
Subject: Re: [PATCH 1/1] target/riscv/pmp: Use hwaddr instead of target_ulong
 for RV32
To: Ivan Klokov <ivan.klokov@syntacore.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com, 
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x531.google.com
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

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

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

