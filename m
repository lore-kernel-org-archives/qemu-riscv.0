Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51BE4C4725D
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 07:05:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rRoN0-0007OB-Jb; Mon, 22 Jan 2024 02:05:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rRoMx-0007MH-2b; Mon, 22 Jan 2024 02:05:19 -0500
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rRoMv-0003Km-8R; Mon, 22 Jan 2024 02:05:18 -0500
Received: by mail-vs1-xe34.google.com with SMTP id
 ada2fe7eead31-469b79d0efdso54151137.3; 
 Sun, 21 Jan 2024 23:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705907115; x=1706511915; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WZUclu2M2bkOpiKwNIhRIt21C90dQM6h2dS5CyYkPA4=;
 b=TzJ8/6FJktC/bd3UR+yj0KzFUKBwPoaiKWqBy474tbPqtWfuBxWJ8tyPPIbLZDo/Dg
 OjFErUspzMwwPX5eZ5Bluj9i5tor53pxX8lR1T/skmYwlv3FynJzP7bhlOa5h8IVnGn8
 nNNp1hxbSsgk5l2kEI/guY49eRxp25eJNXJUi6NYlw3uSKrIkUmlGmXrK8pqanS1BkQn
 dDjuVsz5cmCFHeRpRtI7+Mt/MxrXbx7hm3HE7M+6Aljv3uYjzgUIkkhaCZw5ReyCYw2B
 Tqe/HGqDdT9gNI1GgglnUqQG7B2wY/vPjrNOPHzCBckyDp/oroint7qGtcu5HH1akNYt
 7E4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705907115; x=1706511915;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WZUclu2M2bkOpiKwNIhRIt21C90dQM6h2dS5CyYkPA4=;
 b=T2YATdToxU/WY/fRSl2VK8zO5FldvxqzvpgaXUEatALnhaSxQeDSTdVTZwSzC3ef2e
 lj2SlfmMkvMSL87esrhRV5ngrerA8IEr2GWGVPy+JNdQHOsCAgjrFqtrqgX7ItIjeImM
 CLFxWHEqa/GSY+C0gVh4LxjthdSnwbsptqq/f4M/wTjCyGQep8+ODj7VIdK+X6reWrup
 qJ7QERUEBDNiyCgLAwBKnHWzkYBGmCBRWn2C8QTjEBvYH3iNgg+3VF7FbGarCbGfG9xq
 lC+URJ64H/rgoo9wzRTiCYyBA3iigJrXJSf10egi95m7y7/Uu5nPI3kCBB+IZEl1V+bb
 Z1eg==
X-Gm-Message-State: AOJu0YyiKZLlXXJZfOB7tSLhF+v0sa/HbMT3WWuEWLzBMCfTSoz6/wOq
 IeuMRkVwWd12NToiDrlnrymXNgM2FJh0IggAN2gDMX0aEuZMZJ3TmgJib+uXOHpOr73NJNlt8uK
 cAw4POKi2hX3eW4PjzJlg/mTr2wU=
X-Google-Smtp-Source: AGHT+IGYm3qDcA8p6Rn/3Fos//8J2tIDfyqw01d4kJrLc82NWrR3YSto0pqbauBZWlweQWLz8ZlycjSaIixqQjN5zdc=
X-Received: by 2002:a05:6102:357a:b0:469:5655:153e with SMTP id
 bh26-20020a056102357a00b004695655153emr1486111vsb.29.1705907115428; Sun, 21
 Jan 2024 23:05:15 -0800 (PST)
MIME-Version: 1.0
References: <20240109102930.405323-1-me@deliversmonkey.space>
 <20240109102930.405323-3-me@deliversmonkey.space>
In-Reply-To: <20240109102930.405323-3-me@deliversmonkey.space>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Jan 2024 17:04:49 +1000
Message-ID: <CAKmqyKNRk_on+ZqKBGGhmXnwLNdmHhXoXK+yTr5p3FEhezOJxg@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] target/riscv: Add new CSR fields for S{sn, mn,
 m}pm extensions as part of Zjpm v0.8
To: Alexey Baturo <baturo.alexey@gmail.com>
Cc: richard.henderson@linaro.org, zhiwei_liu@linux.alibaba.com, 
 palmer@dabbelt.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu, 
 kbastian@mail.uni-paderborn.de, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e34;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe34.google.com
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

On Tue, Jan 9, 2024 at 8:32=E2=80=AFPM Alexey Baturo <baturo.alexey@gmail.c=
om> wrote:
>
> From: Alexey Baturo <baturo.alexey@gmail.com>
>
> Signed-off-by: Alexey Baturo <baturo.alexey@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.h      |  8 ++++++++
>  target/riscv/cpu_bits.h |  3 +++
>  target/riscv/cpu_cfg.h  |  3 +++
>  target/riscv/csr.c      | 11 +++++++++++
>  target/riscv/machine.c  | 10 +++++++---
>  target/riscv/pmp.c      | 13 ++++++++++---
>  target/riscv/pmp.h      | 11 ++++++-----
>  7 files changed, 48 insertions(+), 11 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index a43c8fba57..c9bed5c9fc 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -101,6 +101,14 @@ typedef enum {
>      EXT_STATUS_DIRTY,
>  } RISCVExtStatus;
>
> +/* Enum holds PMM field values for Zjpm v0.8 extension */
> +typedef enum {
> +    PMM_FIELD_DISABLED =3D 0,
> +    PMM_FIELD_RESERVED =3D 1,
> +    PMM_FIELD_PMLEN7   =3D 2,
> +    PMM_FIELD_PMLEN16  =3D 3,
> +} RISCVPmPmm;
> +
>  #define MMU_USER_IDX 3
>
>  #define MAX_RISCV_PMPS (16)
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 1c92458a01..7cf1049bf4 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -715,6 +715,7 @@ typedef enum RISCVException {
>  #define MENVCFG_CBIE                       (3UL << 4)
>  #define MENVCFG_CBCFE                      BIT(6)
>  #define MENVCFG_CBZE                       BIT(7)
> +#define MENVCFG_PMM                        (3ULL << 32)
>  #define MENVCFG_ADUE                       (1ULL << 61)
>  #define MENVCFG_PBMTE                      (1ULL << 62)
>  #define MENVCFG_STCE                       (1ULL << 63)
> @@ -728,11 +729,13 @@ typedef enum RISCVException {
>  #define SENVCFG_CBIE                       MENVCFG_CBIE
>  #define SENVCFG_CBCFE                      MENVCFG_CBCFE
>  #define SENVCFG_CBZE                       MENVCFG_CBZE
> +#define SENVCFG_PMM                        MENVCFG_PMM
>
>  #define HENVCFG_FIOM                       MENVCFG_FIOM
>  #define HENVCFG_CBIE                       MENVCFG_CBIE
>  #define HENVCFG_CBCFE                      MENVCFG_CBCFE
>  #define HENVCFG_CBZE                       MENVCFG_CBZE
> +#define HENVCFG_PMM                        MENVCFG_PMM
>  #define HENVCFG_ADUE                       MENVCFG_ADUE
>  #define HENVCFG_PBMTE                      MENVCFG_PBMTE
>  #define HENVCFG_STCE                       MENVCFG_STCE
> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> index f4605fb190..201f8af6ae 100644
> --- a/target/riscv/cpu_cfg.h
> +++ b/target/riscv/cpu_cfg.h
> @@ -113,6 +113,9 @@ struct RISCVCPUConfig {
>      bool ext_ssaia;
>      bool ext_sscofpmf;
>      bool ext_smepmp;
> +    bool ext_ssnpm;
> +    bool ext_smnpm;
> +    bool ext_smmpm;
>      bool rvv_ta_all_1s;
>      bool rvv_ma_all_1s;
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index ea4e1ac6ef..a67ba30494 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -527,6 +527,9 @@ static RISCVException have_mseccfg(CPURISCVState *env=
, int csrno)
>      if (riscv_cpu_cfg(env)->ext_zkr) {
>          return RISCV_EXCP_NONE;
>      }
> +    if (riscv_cpu_cfg(env)->ext_smmpm) {
> +        return RISCV_EXCP_NONE;
> +    }
>
>      return RISCV_EXCP_ILLEGAL_INST;
>  }
> @@ -2030,6 +2033,10 @@ static RISCVException write_menvcfg(CPURISCVState =
*env, int csrno,
>                  (cfg->ext_sstc ? MENVCFG_STCE : 0) |
>                  (cfg->ext_svadu ? MENVCFG_ADUE : 0);
>      }
> +    /* Update PMM field only if the value is valid according to Zjpm v0.=
8 */
> +    if (((val & MENVCFG_PMM) >> 32) !=3D PMM_FIELD_RESERVED) {
> +        mask |=3D MENVCFG_PMM;
> +    }
>      env->menvcfg =3D (env->menvcfg & ~mask) | (val & mask);
>
>      return RISCV_EXCP_NONE;
> @@ -2074,6 +2081,10 @@ static RISCVException write_senvcfg(CPURISCVState =
*env, int csrno,
>                                      target_ulong val)
>  {
>      uint64_t mask =3D SENVCFG_FIOM | SENVCFG_CBIE | SENVCFG_CBCFE | SENV=
CFG_CBZE;
> +    /* Update PMM field only if the value is valid according to Zjpm v0.=
8 */
> +    if (((val & SENVCFG_PMM) >> 32) !=3D PMM_FIELD_RESERVED) {
> +        mask |=3D SENVCFG_PMM;
> +    }
>      RISCVException ret;
>
>      ret =3D smstateen_acc_ok(env, 0, SMSTATEEN0_HSENVCFG);
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index 71ee8bab19..0ad593ed5a 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -152,15 +152,19 @@ static const VMStateDescription vmstate_vector =3D =
{
>
>  static bool pointermasking_needed(void *opaque)
>  {
> -    return false;
> +    RISCVCPU *cpu =3D opaque;
> +    return cpu->cfg.ext_ssnpm || cpu->cfg.ext_smnpm || cpu->cfg.ext_smmp=
m;
>  }
>
>  static const VMStateDescription vmstate_pointermasking =3D {
>      .name =3D "cpu/pointer_masking",
> -    .version_id =3D 1,
> -    .minimum_version_id =3D 1,
> +    .version_id =3D 2,
> +    .minimum_version_id =3D 2,
>      .needed =3D pointermasking_needed,
>      .fields =3D (VMStateField[]) {
> +        VMSTATE_UINTTL(env.mseccfg, RISCVCPU),
> +        VMSTATE_UINTTL(env.senvcfg, RISCVCPU),
> +        VMSTATE_UINTTL(env.menvcfg, RISCVCPU),
>          VMSTATE_END_OF_LIST()
>      }
>  };
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index 162e88a90a..893ccd58d8 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -576,6 +576,12 @@ target_ulong pmpaddr_csr_read(CPURISCVState *env, ui=
nt32_t addr_index)
>  void mseccfg_csr_write(CPURISCVState *env, target_ulong val)
>  {
>      int i;
> +    uint64_t mask =3D MSECCFG_MMWP | MSECCFG_MML;
> +
> +    /* Update PMM field only if the value is valid according to Zjpm v0.=
8 */
> +    if (((val & MSECCFG_PMM) >> 32) !=3D PMM_FIELD_RESERVED) {
> +        mask |=3D MSECCFG_PMM;
> +    }
>
>      trace_mseccfg_csr_write(env->mhartid, val);
>
> @@ -591,12 +597,13 @@ void mseccfg_csr_write(CPURISCVState *env, target_u=
long val)
>
>      if (riscv_cpu_cfg(env)->ext_smepmp) {
>          /* Sticky bits */
> -        val |=3D (env->mseccfg & (MSECCFG_MMWP | MSECCFG_MML));
> -        if ((val ^ env->mseccfg) & (MSECCFG_MMWP | MSECCFG_MML)) {
> +        val |=3D (env->mseccfg & mask);
> +        if ((val ^ env->mseccfg) & mask) {
>              tlb_flush(env_cpu(env));
>          }
>      } else {
> -        val &=3D ~(MSECCFG_MMWP | MSECCFG_MML | MSECCFG_RLB);
> +        mask |=3D MSECCFG_RLB;
> +        val &=3D ~(mask);
>      }
>
>      env->mseccfg =3D val;
> diff --git a/target/riscv/pmp.h b/target/riscv/pmp.h
> index 9af8614cd4..b3ca51c26d 100644
> --- a/target/riscv/pmp.h
> +++ b/target/riscv/pmp.h
> @@ -40,11 +40,12 @@ typedef enum {
>  } pmp_am_t;
>
>  typedef enum {
> -    MSECCFG_MML   =3D 1 << 0,
> -    MSECCFG_MMWP  =3D 1 << 1,
> -    MSECCFG_RLB   =3D 1 << 2,
> -    MSECCFG_USEED =3D 1 << 8,
> -    MSECCFG_SSEED =3D 1 << 9
> +    MSECCFG_MML       =3D 1 << 0,
> +    MSECCFG_MMWP      =3D 1 << 1,
> +    MSECCFG_RLB       =3D 1 << 2,
> +    MSECCFG_USEED     =3D 1 << 8,
> +    MSECCFG_SSEED     =3D 1 << 9,
> +    MSECCFG_PMM       =3D 3UL << 32,
>  } mseccfg_field_t;
>
>  typedef struct {
> --
> 2.34.1
>
>

