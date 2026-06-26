Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA97CDE008
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 01:03:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wcuyL-0002Pt-5a; Thu, 25 Jun 2026 21:03:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wcuyJ-0002LP-3a
 for qemu-riscv@nongnu.org; Thu, 25 Jun 2026 21:03:07 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wcuyH-0001dG-Cm
 for qemu-riscv@nongnu.org; Thu, 25 Jun 2026 21:03:06 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-69806f118d1so614429a12.1
 for <qemu-riscv@nongnu.org>; Thu, 25 Jun 2026 18:03:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782435784; cv=none;
 d=google.com; s=arc-20260327;
 b=q+F7c5oXRb5O5kEV/3q0b38VOfob5qOnutbWQXb0yNYurF0jF2nW91Thf+Mf7n9K0o
 0+4eLf5V7pKx2FbCH0rTHT96gWQo+GM1Whl3kKK8xQQyRq6DNek6VH9WOclnwzarEDgV
 quUAHmhdRFmSzsRctoMv1mYDe3bXgLj6XmpgD/RJCXgwNBturzRpHX0oEfXN6mPPnLKd
 q0jxEfA/uPwCzpgUj1o/L0uRfbNQluozdA9c6i4GJWV0L8cELSO6L5xzOHPRn4hnf8O2
 8cKqx0Q/q0H2zHIH5V4St5gdbEaDDJ++WnT9m6Ra79WFaVja0NNjULkSQUTmx90Ui/X6
 tfgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=TfWii4z16A3PbDf4UzlNjQ3WVIEsPEpqvXAlMjsogEk=;
 fh=J/bVdSTvO9t5uT5TJ+v4QoJtn4D/EHn7it4hgZzV+Og=;
 b=ArAmxbeMPUqoyNWJxUb464ySlZteYk9h/qV3pNboTZXrT/5kD9vGW36eoRQcuxvmxY
 FeiqZh56rfwOZhf+61bw4m5MnxV1xIfG7T2ELmPLUsnVayLwnRLWvLFR+lHvwhCp70dJ
 7AQx0UHqg6iww/LE5rF11p/GRxxGYXR4IISL2quAiD6NAEuX6zynqxH7x2Q/36STlA+7
 G+dKhXqjNq2UFaPlaLHzsMr8fD9yzhFO8Bs5QsHOLDNfiPPw6LWb/XGRUnrNIOH6oidL
 qo7MIpfRXZYY1twkxmsxKZTM/xM9KbK5jeh+9nijfZsngcW46xBDq6q0B6wh8EgDAw/r
 Yo0w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782435784; x=1783040584; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TfWii4z16A3PbDf4UzlNjQ3WVIEsPEpqvXAlMjsogEk=;
 b=Q0lbSxfz+GxEf7BnuXyxFrah9/6LLz8mlxXvPLH3OejtGOzGnRXteQ5QuJmADV92m9
 8HH7OSYaT6i0/ocGPq6F7gNlrO1T3tyvSBVhlV/UD9MVCb26ZMEwuu0PeCjpvuh2MSIt
 YYCYsWCanCXeZre6WCRLRb4F9FYgMd4lgBx/p9t29HTMJ42HQiM0W3talzGV4CXeJZQK
 EiNsnGelu+ZLa6/Yx7IDLUcwuw1Kob2D3X3wK7EIgj9xaGjfckqc6T2FBGc3InzSbyUQ
 SVuVhiBsSP6zlHCUm4JDjrg4DZe+vHN7Gdo45QdqbItS8I5GyjvoTiCEnxLbo+jxP3h1
 noAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782435784; x=1783040584;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TfWii4z16A3PbDf4UzlNjQ3WVIEsPEpqvXAlMjsogEk=;
 b=WF4+hy7oq09leI+7ZokWrdjjdnxVo6DIN/74Xn9h9MEad+/H7dMWOqj1I8VKJT2Zme
 49cMWigTJC6kr2dL8rYfSAcT7hvHhZr7RGKna72PeNGfpkSxWjwQkshfu7CqsQnkKWhf
 wVp0NQm4dcTB6c+yg2yeQx2OwY9rAj+1130w924g5lU5qiGX6RPx095YD22Zjm2+t4zP
 3Tqdy2NyjkQU/O+G3XMgMFVUkuXKadIPi7G0e/bwJFcSTkAqjuQXvLeW+tzzgwfqoiEd
 9RaN+eYM2VArZAmZ9RlGU0mEDtRoYsM4M5sL/n4aYsY4BNUouYD6P2EkiUOApXAIIcpi
 p1gQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rogs99ZBH8U/G9XDViHKvGx25IYGvbYLM4aXiUsj1k5yU28Emp069tE9H91ZsFWFv+sMAEjtpV/VGQn@nongnu.org
X-Gm-Message-State: AOJu0YxBs4QQ2D5b8a4770cx05pSWp2OfwWLISquDpbeEynZXU4L22+/
 /HL1+3BXQ3CvbSIB8APj03T1dIOlrMvTUt3MK/YGZpAl2vlZPNjHuHkoLIGgwzlTpW9/N+3uV8k
 LyeoDdaocu2JxT26IORarLGebJEMLQHE=
X-Gm-Gg: AfdE7cmV99VLaqh5/tflgcPJVHUXgmRs3g2PkJalZtxU4BUubMeyw5ToC7wyKe3J9C9
 jwG/Kp82wSK1Z43vMyBVDSjO/ArxNq3JnIMIZVXJq5o5yFE6UVNojViCTjrcxOIhvBdgevEN2At
 6xp6BIjiX926Yy7gL+ADlOQyvdgMRvEY8hoiYBX3Fc8gkZdUnUvJEpSTAoYbwFLscezQ+GvObsK
 Va2EMxmn9VQ/uTJiIw0/3li5HrKERDmgbUoBPu45qRyuAPCmquOcpUw+sOxGEoE1vaFNLzZZsQ0
 3MYc3hyQwhkw+HQPlf5/mHlmKR8=
X-Received: by 2002:a05:6402:3585:b0:695:9b77:7c3a with SMTP id
 4fb4d7f45d1cf-69810ae8134mr713753a12.24.1782435783871; Thu, 25 Jun 2026
 18:03:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260624000632.2149359-1-daniel.barboza@oss.qualcomm.com>
 <20260624000632.2149359-13-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260624000632.2149359-13-daniel.barboza@oss.qualcomm.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 26 Jun 2026 11:02:37 +1000
X-Gm-Features: AVVi8Cezl-gRZtbTkqXnUhFJe8AtkYb6zEJZAXq73aa1uFWzqUlyTQfW2LtXzyw
Message-ID: <CAKmqyKNzBXZsSGTFfbQue1aegWjt_OpdKmRyVipi=2tSU1Kb=Q@mail.gmail.com>
Subject: Re: [PATCH v2 12/24] target/riscv: move valid_vm_* satp arrays to
 cpu.c
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com, 
 pierrick.bouvier@oss.qualcomm.com, philmd@oss.qualcomm.com, 
 fritchleybohrer@gmail.com, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x532.google.com
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

On Wed, Jun 24, 2026 at 10:08=E2=80=AFAM Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
> These arrays are used internally in tcg/csr.c and in cpu.c in the satp
> options logic, which is common for both KVM and TCG.
>
> Move it to cpu.c to allow KVM to keep using it in --disable-tcg builds.
>
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c     | 13 +++++++++++++
>  target/riscv/cpu.h     |  2 --
>  target/riscv/tcg/csr.c | 12 ------------
>  target/riscv/tcg/csr.h |  3 +++
>  4 files changed, 16 insertions(+), 14 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index cba7d2502e..29af0f2be8 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -59,6 +59,19 @@ const uint32_t misa_bits[] =3D {RVI, RVE, RVM, RVA, RV=
F, RVD, RVV,
>  #define BYTE(x)   (x)
>  #endif
>
> +/* SATP bits that are shared between TCG and KVM */
> +const bool valid_vm_1_10_32[16] =3D {
> +    [VM_1_10_MBARE] =3D true,
> +    [VM_1_10_SV32] =3D true
> +};
> +
> +const bool valid_vm_1_10_64[16] =3D {
> +    [VM_1_10_MBARE] =3D true,
> +    [VM_1_10_SV39] =3D true,
> +    [VM_1_10_SV48] =3D true,
> +    [VM_1_10_SV57] =3D true
> +};
> +
>  bool riscv_cpu_is_32bit(RISCVCPU *cpu)
>  {
>      return riscv_cpu_mxl(&cpu->env) =3D=3D MXL_RV32;
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 34c63a3628..82430ecec6 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -971,8 +971,6 @@ void riscv_cpu_finalize_features(RISCVCPU *cpu, Error=
 **errp);
>  void riscv_add_satp_mode_properties(Object *obj);
>  bool riscv_cpu_accelerator_compatible(RISCVCPU *cpu);
>
> -extern const bool valid_vm_1_10_32[], valid_vm_1_10_64[];
> -
>  void riscv_cpu_register_gdb_regs_for_features(CPUState *cs);
>  target_ulong riscv_new_csr_seed(target_ulong new_value,
>                                  target_ulong write_mask);
> diff --git a/target/riscv/tcg/csr.c b/target/riscv/tcg/csr.c
> index 572a39d660..b17be35e56 100644
> --- a/target/riscv/tcg/csr.c
> +++ b/target/riscv/tcg/csr.c
> @@ -1874,18 +1874,6 @@ static const uint64_t hvien_writable_mask =3D LOCA=
L_INTERRUPTS;
>
>  static const uint64_t vsip_writable_mask =3D MIP_VSSIP | LOCAL_INTERRUPT=
S;
>
> -const bool valid_vm_1_10_32[16] =3D {
> -    [VM_1_10_MBARE] =3D true,
> -    [VM_1_10_SV32] =3D true
> -};
> -
> -const bool valid_vm_1_10_64[16] =3D {
> -    [VM_1_10_MBARE] =3D true,
> -    [VM_1_10_SV39] =3D true,
> -    [VM_1_10_SV48] =3D true,
> -    [VM_1_10_SV57] =3D true
> -};
> -
>  /* Machine Information Registers */
>  static RISCVException read_zero(CPURISCVState *env, int csrno,
>                                  target_ulong *val)
> diff --git a/target/riscv/tcg/csr.h b/target/riscv/tcg/csr.h
> index 73d874ee98..53ba3b4a4d 100644
> --- a/target/riscv/tcg/csr.h
> +++ b/target/riscv/tcg/csr.h
> @@ -69,6 +69,9 @@ enum {
>      CSR_TABLE_SIZE =3D 0x1000
>  };
>
> +/* valid_vm_* arrays are shared with KVM via cpu.c */
> +extern const bool valid_vm_1_10_32[], valid_vm_1_10_64[];
> +
>  /* CSR function table */
>  extern riscv_csr_operations csr_ops[CSR_TABLE_SIZE];
>
> --
> 2.43.0
>
>

