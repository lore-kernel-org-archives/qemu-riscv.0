Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pjvfT-00085b-1y
	for mharc-qemu-riscv@gnu.org; Wed, 05 Apr 2023 01:26:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pjvfL-00084s-UZ; Wed, 05 Apr 2023 01:26:43 -0400
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pjvfJ-0004QS-8r; Wed, 05 Apr 2023 01:26:39 -0400
Received: by mail-vs1-xe36.google.com with SMTP id z17so23827164vsf.4;
 Tue, 04 Apr 2023 22:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680672395;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ptymz97OGOu/aQoIRTraLhImuR3H+u5gqgldDNnrQ2g=;
 b=Y18BM79Az4vBoon6xyXrk/z3nrTP7E/mxepJHrX1VGHVsz0TkD9Fam7viJrtmtShAs
 bC/JzdiYjaPsW12hBG+/73ksgtDEefMiNq5YVYKB0Txu3po/PxKP5PZUMtBN0F4ovP3H
 OyYevxiuv3wLkEYrltF2mbx5FYUawHto5/Yf4aBKRJpH1lfW2cxbY4nxD3/am5CjTamT
 Hs2nJ0bwjrDVvoYDkvklQQpzl/WKzEtXHFCRt8beDG8+BDieVJ2SvOMm5l64TaoNW0/v
 4t6ggz6iccwzx1bIHe1nHgqGbf5rFL5S7lDGmM8TUCCEtoMfa5JbWWOQRHdxSyu8ae3b
 p47w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680672395;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ptymz97OGOu/aQoIRTraLhImuR3H+u5gqgldDNnrQ2g=;
 b=521kEhsEQ9ZnLNy/gIcZtWqh0Fj4+OG2LxVcxQmQg84wGfXnACgekUVm4RA5c0S5T7
 LcWBYbAuic13V3uSygPRvSvZnHz94czx0VHe1iFFdg+LSmTiv6wVCdHWC4OtgzuIWlsp
 OY14QQDD9ynHjH8HmmT/HPJuw2WgeKGqe8VwxSq2Ykhjpr3DsDP0rg0CEIMRsoV1P0Kf
 UI0HLDZU774h3ez16DcZ9doD/FnThWV8qMyizAWbBZMfXnbNs7Pp7qXo2AzL5OEHmtMB
 dNQyJHnHpscsLnVyHwPmiFXx9ZkOurSV/q4iB0TStsjCbimy6Ymy3u+dJodO/F2TFTo9
 jDRQ==
X-Gm-Message-State: AAQBX9dq4Q8GDW0MFcKCM2zlvoikBgozA3GAak+zVL+y/NgwDa5s06sw
 z0yr1bMULQN9YGVMpfrOoKurkPercoCIKwtyD84=
X-Google-Smtp-Source: AKy350ZbKuG5u42tjuvLuCt7yJuAjhvYvnVhMHb/bUYcuKtdmJCqwAotbi6J2ECbwjolqXMjxvxwC+fJxTj9RmJMADU=
X-Received: by 2002:a67:c181:0:b0:42a:eb6:6c51 with SMTP id
 h1-20020a67c181000000b0042a0eb66c51mr3941592vsj.3.1680672395648; Tue, 04 Apr
 2023 22:26:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230327080858.39703-1-liweiwei@iscas.ac.cn>
 <20230327080858.39703-6-liweiwei@iscas.ac.cn>
In-Reply-To: <20230327080858.39703-6-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 5 Apr 2023 15:26:09 +1000
Message-ID: <CAKmqyKNr1UhhuWGSfdOO7Lo7_fXAg56ZU2sM3VQR0E-YQdmsDQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] target/riscv: Convert env->virt to a bool
 env->virt_enabled
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e36;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe36.google.com
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
X-List-Received-Date: Wed, 05 Apr 2023 05:26:43 -0000

On Mon, Mar 27, 2023 at 6:10=E2=80=AFPM Weiwei Li <liweiwei@iscas.ac.cn> wr=
ote:
>
> From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
>
> Currently we only use the env->virt to encode the virtual mode enabled
> status. Let's make it a bool type.
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Message-ID: <20230325145348.1208-1-zhiwei_liu@linux.alibaba.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.h        | 2 +-
>  target/riscv/cpu_bits.h   | 3 ---
>  target/riscv/cpu_helper.c | 6 +++---
>  target/riscv/machine.c    | 6 +++---
>  target/riscv/translate.c  | 4 ++--
>  5 files changed, 9 insertions(+), 12 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 5adefe4ab5..22dc5ddb95 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -183,7 +183,7 @@ struct CPUArchState {
>  #ifndef CONFIG_USER_ONLY
>      target_ulong priv;
>      /* This contains QEMU specific information about the virt state. */
> -    target_ulong virt;
> +    bool virt_enabled;
>      target_ulong geilen;
>      uint64_t resetvec;
>
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index fca7ef0cef..45ddb00aa5 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -607,9 +607,6 @@ typedef enum {
>  #define PRV_H 2 /* Reserved */
>  #define PRV_M 3
>
> -/* Virtulisation Register Fields */
> -#define VIRT_ONOFF          1
> -
>  /* RV32 satp CSR field masks */
>  #define SATP32_MODE         0x80000000
>  #define SATP32_ASID         0x7fc00000
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index b286118a6b..c7bc3fc553 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -560,18 +560,18 @@ void riscv_cpu_set_geilen(CPURISCVState *env, targe=
t_ulong geilen)
>
>  bool riscv_cpu_virt_enabled(CPURISCVState *env)
>  {
> -    return get_field(env->virt, VIRT_ONOFF);
> +    return env->virt_enabled;
>  }
>
>  /* This function can only be called to set virt when RVH is enabled */
>  void riscv_cpu_set_virt_enabled(CPURISCVState *env, bool enable)
>  {
>      /* Flush the TLB on all virt mode changes. */
> -    if (get_field(env->virt, VIRT_ONOFF) !=3D enable) {
> +    if (env->virt_enabled !=3D enable) {
>          tlb_flush(env_cpu(env));
>      }
>
> -    env->virt =3D set_field(env->virt, VIRT_ONOFF, enable);
> +    env->virt_enabled =3D enable;
>
>      if (enable) {
>          /*
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index 9c455931d8..0fb3ddda06 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -331,8 +331,8 @@ static const VMStateDescription vmstate_pmu_ctr_state=
 =3D {
>
>  const VMStateDescription vmstate_riscv_cpu =3D {
>      .name =3D "cpu",
> -    .version_id =3D 7,
> -    .minimum_version_id =3D 7,
> +    .version_id =3D 8,
> +    .minimum_version_id =3D 8,
>      .post_load =3D riscv_cpu_post_load,
>      .fields =3D (VMStateField[]) {
>          VMSTATE_UINTTL_ARRAY(env.gpr, RISCVCPU, 32),
> @@ -352,7 +352,7 @@ const VMStateDescription vmstate_riscv_cpu =3D {
>          VMSTATE_UINT32(env.misa_mxl_max, RISCVCPU),
>          VMSTATE_UINT32(env.misa_ext_mask, RISCVCPU),
>          VMSTATE_UINTTL(env.priv, RISCVCPU),
> -        VMSTATE_UINTTL(env.virt, RISCVCPU),
> +        VMSTATE_BOOL(env.virt_enabled, RISCVCPU),
>          VMSTATE_UINT64(env.resetvec, RISCVCPU),
>          VMSTATE_UINTTL(env.mhartid, RISCVCPU),
>          VMSTATE_UINT64(env.mstatus, RISCVCPU),
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 0ee8ee147d..c3adf30b54 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -1255,8 +1255,8 @@ static void riscv_tr_disas_log(const DisasContextBa=
se *dcbase,
>
>      fprintf(logfile, "IN: %s\n", lookup_symbol(dcbase->pc_first));
>  #ifndef CONFIG_USER_ONLY
> -    fprintf(logfile, "Priv: "TARGET_FMT_ld"; Virt: "TARGET_FMT_ld"\n",
> -            env->priv, env->virt);
> +    fprintf(logfile, "Priv: "TARGET_FMT_ld"; Virt: %d\n",
> +            env->priv, env->virt_enabled);
>  #endif
>      target_disas(logfile, cpu, dcbase->pc_first, dcbase->tb->size);
>  }
> --
> 2.25.1
>
>

