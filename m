Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C19CAC5BB
	for <qemu-riscv@archiver.kernel.org>; Wed,  1 Oct 2025 03:56:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v3nwP-0003ff-J4; Tue, 30 Sep 2025 23:55:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1v3nwN-0003fL-CL
 for qemu-riscv@nongnu.org; Tue, 30 Sep 2025 23:55:43 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1v3nwH-0005xD-8v
 for qemu-riscv@nongnu.org; Tue, 30 Sep 2025 23:55:42 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-33274fcf5c1so6459071a91.1
 for <qemu-riscv@nongnu.org>; Tue, 30 Sep 2025 20:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1759290931; x=1759895731; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pRb/EQVVAt4Z9iqVWo64yM7U3qF/C6UR3l1d5tHGQFo=;
 b=FwmpM2D1+faeJKHSMejXaYVeF9TDhqnE+4tSfCsQ0iYnZ+8YC2l9o0L88Ll3YYzJEb
 pM5rckBK2gl/7qnuDRo4k4JdPnSEXrbzBRocigUq/JtsonswOTrT8xJdo7rosNZe+NHW
 PeJDr/aK7GiCg55Y0uEQwnYB/5Q57/j6V+yWHHpT/4AM2Csq+bqzCY5oZUn9nq1emuCu
 DUNxka8Mhx9/JZMdaSVI74nIs8hd2TlBdXuy1CopjFcmrhpddU1DJwXF7uV2bLupnEub
 zwen5ZfsE08l35yX4opU8UttvSTVgnSN3/R7Cot0gIqwy4128C4XAPNESZebdrCWDKPd
 5QPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759290931; x=1759895731;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pRb/EQVVAt4Z9iqVWo64yM7U3qF/C6UR3l1d5tHGQFo=;
 b=KbgE9KkSPVbNovmZYx90Z6EC7j/PX4pU92+1IFZO9J3Kljs+xQWl2jwbXI2RpxnGPm
 qFQa7EuiJSpx2E9ReRJppYG8CNya9oD9ym/tuh+x5arPd4CgShtOsmvUXy0qr5BfBAMu
 r4CIDxXnr4zeQuU85eqpflqqg1QRyVIRoo4fuHZA1jKSA2phcpMK9ltVXmISRoMwa8AT
 zRkd2+ALaafAmpTrktHMa4bqlCZR1ZENM9zlcA8pVv5OEoi+5HXMZKEw7gsFHTnuTjMs
 QakhI98GSJTrmD6cNKFCMyOkduV5vQpU2f6sIky9urDP0Xfgj47fLQAreaMqeoMBRws8
 2CFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4Q1cLFTfXLXkdluU4EzRJ9/VdjfgXrjUHgbLTQ1mYisyoof/XAKyoK/P4WiWi0zaa8vai1ffppGav@nongnu.org
X-Gm-Message-State: AOJu0Yzk7h6iEPXEU6EjrATdgfSoSHlt3ogh28V9umZQeDkUxNyNWtR6
 2bqlTnfm8+7yLp23JIh7dUaUm8MpZUuuSanZPkdijz0pXbFyVQ30oDxIEuo5pNMRM8ipAhefZrg
 cYIesk1E6sZ/MgI21x+HnQ5UON7lvSVHh+LZcBurcIVT9eTUyyJ+SBQK9NGx3MpBLRlzH1oAd96
 vrOagevlGKkiRsxFUSLr6UjiIIPwkPfxHo+1OM/6D9D7h+Bw==
X-Gm-Gg: ASbGnctE9Ui98RTqS9ONcuFWvy74lFuqPg1zKYIHhltWply5pXY1esC811INBYPtQmx
 SbDYCosKCNXx0tLdf7Jqn0ljuzUhvrThto/dDCHOep2kqHOPQAwX1JitcPs8gxQlkyx2V+FROhg
 c/YT6+Q6LfzGl9RYIbwqD92O1YOr0Ngzqxi2s+jO+GvyBE3kYzXUHNPDEI206ug4Ek4+QCZ0iCX
 4fc+huoOGQUxFncWm3jHi41NkyAgHheYsdj86rxgTHK7VVhOmZwI+2RKPQNFekXh1y84kTi1qo6
 OWs7lYq9VXf1zAZuroy/1qdnhl+qpqZrhJ/WoDP8ulnPIJKDvxybYAOGFkpWhTtZNe+9UJieOAh
 jcek5rHGHXrPHzn3fMsY78Gc0UI1dAllXTHt+lBHqxDJDbHlfr6DDpQQ6oScl3I5y3JYvZUZ5Yh
 uDG3P08e3KKFKJfy0=
X-Google-Smtp-Source: AGHT+IFwwEB3WbhLWtTAiSUk2AknIGpSHE+Xtitsae+AWHY/mdqy2lz2y0As+IVH1e3DhG9mjCxwig==
X-Received: by 2002:a17:90b:1c86:b0:32e:3c57:8a9e with SMTP id
 98e67ed59e1d1-339a6f89234mr2130342a91.35.1759290930296; 
 Tue, 30 Sep 2025 20:55:30 -0700 (PDT)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com.
 [209.85.214.179]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-339a6ebdac1sm1127284a91.9.2025.09.30.20.55.27
 for <qemu-riscv@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Sep 2025 20:55:28 -0700 (PDT)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-2897522a1dfso32077885ad.1
 for <qemu-riscv@nongnu.org>; Tue, 30 Sep 2025 20:55:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXzzYDR6rMFs0Ded7N4GzByWxsXoKMTtAAV8duH5dfIWD2A1pElgh9nFu0Y0kq7qDrBXdeprjdKymHL@nongnu.org
X-Received: by 2002:a17:903:2ce:b0:275:7ee4:83bc with SMTP id
 d9443c01a7336-28e7f2f5b43mr24870785ad.2.1759290927459; Tue, 30 Sep 2025
 20:55:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250930083359.27637-1-jay.chang@sifive.com>
 <20250930083359.27637-3-jay.chang@sifive.com>
In-Reply-To: <20250930083359.27637-3-jay.chang@sifive.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Wed, 1 Oct 2025 11:55:16 +0800
X-Gmail-Original-Message-ID: <CANzO1D3rQCg-mn2zhjojxkeeAxnqCSvQ0tT-54W9Qhxu7OTy6A@mail.gmail.com>
X-Gm-Features: AS18NWDkalFNRrpVX5IxPzBUCOa5QvWHwaTC0wXasqaE97-K7a8M07RmDxXH_hA
Message-ID: <CANzO1D3rQCg-mn2zhjojxkeeAxnqCSvQ0tT-54W9Qhxu7OTy6A@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/riscv: Make PMP CSRs conform to WARL
 constraints
To: Jay Chang <jay.chang@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Frank Chang <frank.chang@sifive.com>,
 Jim Shu <jim.shu@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Jay Chang <jay.chang@sifive.com> =E6=96=BC 2025=E5=B9=B49=E6=9C=8830=E6=97=
=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=884:35=E5=AF=AB=E9=81=93=EF=BC=9A
>
> This patch ensure pmpcfg and pmpaddr comply with WARL constraints.
>
> When the PMP granularity is greater than 4 bytes, NA4 mode is not valid
> per the spec and will be silently ignored.
>
> According to the spec, changing pmpcfg.A only affects the "read" value
> of pmpaddr. When G > 2 and pmpcfg.A is NAPOT, bits pmpaddr[G-2:0] read
> as all ones. When G > 1 and pmpcfg.A is OFF or TOR, bits pmpaddr[G-1:0]
> read as all zeros. This allows software to read back the correct
> granularity value.
>
> In addition, when updating the PMP address rule in TOR mode,
> the start and end addresses of the PMP region should be aligned
> to the PMP granularity. (The current SPEC only state in TOR mode
> that bits pmpaddr[G-1:0] do not affect the TOR address-matching logic.)
>
> Signed-off-by: Jay Chang <jay.chang@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Jim Shu <jim.shu@sifive.com>
> ---
>  target/riscv/pmp.c | 46 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
>
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index 72f1372a49..d5cd76df3a 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -108,6 +108,17 @@ static int pmp_is_invalid_smepmp_cfg(CPURISCVState *=
env, uint8_t val)
>          g_assert_not_reached();
>      }
>  }
> +/*
> + * Calculate PMP granularity value 'g'
> + *
> + * The granularity value 'g' is defined as log2(granularity) - 2, where
> + * granularity is the minimum alignment requirement for PMP regions in b=
ytes.
> + */
> +static inline int pmp_get_granularity_g(CPURISCVState *env)
> +{
> +    return __builtin_ctz(riscv_cpu_cfg(env)->pmp_granularity >> 2);
> +}
> +
>
>  /*
>   * Count the number of active rules.
> @@ -153,6 +164,15 @@ static bool pmp_write_cfg(CPURISCVState *env, uint32=
_t pmp_index, uint8_t val)
>              qemu_log_mask(LOG_GUEST_ERROR,
>                            "ignoring pmpcfg write - invalid\n");
>          } else {
> +            uint8_t a_field =3D pmp_get_a_field(val);
> +            /*
> +             * When granularity g >=3D 1 (i.e., granularity > 4 bytes),
> +             * the NA4 (Naturally Aligned 4-byte) mode is not selectable
> +             */
> +            if ((riscv_cpu_cfg(env)->pmp_granularity >
> +                MIN_RISCV_PMP_GRANULARITY) && (a_field =3D=3D PMP_AMATCH=
_NA4)) {
> +                    return false;
> +            }
>              env->pmp_state.pmp[pmp_index].cfg_reg =3D val;
>              pmp_update_rule_addr(env, pmp_index);
>              return true;
> @@ -199,6 +219,7 @@ void pmp_update_rule_addr(CPURISCVState *env, uint32_=
t pmp_index)
>      target_ulong prev_addr =3D 0u;
>      hwaddr sa =3D 0u;
>      hwaddr ea =3D 0u;
> +    int g =3D pmp_get_granularity_g(env);
>
>      if (pmp_index >=3D 1u) {
>          prev_addr =3D env->pmp_state.pmp[pmp_index - 1].addr_reg;
> @@ -211,6 +232,11 @@ void pmp_update_rule_addr(CPURISCVState *env, uint32=
_t pmp_index)
>          break;
>
>      case PMP_AMATCH_TOR:
> +        /* Bits pmpaddr[G-1:0] do not affect the TOR address-matching lo=
gic. */
> +        if (g >=3D 1) {
> +            prev_addr &=3D ~((1UL << g) - 1UL);
> +            this_addr &=3D ~((1UL << g) - 1UL);
> +        }
>          if (prev_addr >=3D this_addr) {
>              sa =3D ea =3D 0u;
>              break;
> @@ -577,6 +603,7 @@ void pmpaddr_csr_write(CPURISCVState *env, uint32_t a=
ddr_index,
>
>  /*
>   * Handle a read from a pmpaddr CSR
> + * Change A field of pmpcfg affects the read value of pmpaddr
>   */
>  target_ulong pmpaddr_csr_read(CPURISCVState *env, uint32_t addr_index)
>  {
> @@ -585,6 +612,25 @@ target_ulong pmpaddr_csr_read(CPURISCVState *env, ui=
nt32_t addr_index)
>
>      if (addr_index < pmp_regions) {
>          val =3D env->pmp_state.pmp[addr_index].addr_reg;
> +        int g =3D pmp_get_granularity_g(env);
> +        switch (pmp_get_a_field(env->pmp_state.pmp[addr_index].cfg_reg))=
 {
> +        case PMP_AMATCH_OFF:
> +            /* fallthrough */
> +        case PMP_AMATCH_TOR:
> +            /* Bit [g-1:0] read all zero */
> +            if (g >=3D 1) {
> +                val &=3D ~((1 << g) - 1);

You should use 1UL here, too, as val is target_ulong type.

> +            }
> +            break;
> +        case PMP_AMATCH_NAPOT:
> +            /* Bit [g-2:0] read all one */
> +            if (g >=3D 2) {
> +                val |=3D ((1 << (g - 1)) - 1);

Same here.

Regards,
Frank Chang

> +            }
> +            break;
> +        default:
> +            break;
> +        }
>          trace_pmpaddr_csr_read(env->mhartid, addr_index, val);
>      } else {
>          qemu_log_mask(LOG_GUEST_ERROR,
> --
> 2.48.1
>
>

