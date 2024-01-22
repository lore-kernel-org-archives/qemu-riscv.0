Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DADC2C47422
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 03:00:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rRkXq-0003YW-Og; Sun, 21 Jan 2024 22:00:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rRkXp-0003YJ-1X; Sun, 21 Jan 2024 22:00:17 -0500
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rRkXm-000486-R8; Sun, 21 Jan 2024 22:00:16 -0500
Received: by mail-vk1-xa2e.google.com with SMTP id
 71dfb90a1353d-4b72e63821eso2173627e0c.1; 
 Sun, 21 Jan 2024 19:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705892413; x=1706497213; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VyZ7ZxsqdDZvk2BAFQ2fu4Bi37G4J/vrzOgfQyFBIc4=;
 b=QLNrycQ9UCCwrOUVCcPMb/xj62YubZXA5hhiLGMVFg/dvtMY9xSljZ3DigtGRGv1fL
 ii0rgk0WcJeSDxqm3+2YXYjhr84ZUz1SPAtHcdkRNBhh/z2LiFQzKtkysYsIkJuALFcp
 Hh5vPcNoQxhjXXqXvCafNHyoJkOgGRbjinsFJuwktTRvki0699hCMuJi3QYS9oCpYMfy
 OKNehom1rH8q5MenAtTlFyj1cKTy/FWlr7TfOUYa9BVSwnO06I6/DsoAR5XZ1pVQH0Wh
 ihf+8lalWcJFasE57psdwaSSVB15aftpAsIUt+qauumgbhzutalZqUTUMtiJbUydVNV2
 nTbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705892413; x=1706497213;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VyZ7ZxsqdDZvk2BAFQ2fu4Bi37G4J/vrzOgfQyFBIc4=;
 b=meocHrkI/07hxwJWoR5oo+JYrlvgERyG1OtginW1VUc8M4vswH3/ARSwxcW7RlgOpx
 6TvTxhuRQkGHNZgrzeFRm/aEsUdcRj+5rLCwMSpxbKaqiFRKl8AA6LFkI15iE2Ew7vzw
 /Vl8S60WSh51quIccpsQtiv9/E6CGZTMBr1tRiZQp+xtSiNRLD0bTcM8NI1SER00MReU
 JWiv4zcBrsOlojW4igpSRxKOGbCzSDvwNcyBg0pW8EW5apGnvxlNl5t0a/Rlk3UnXpdP
 mVfl+pUmjPDHOl4zf8DxJI+Heqrzjc5ZkzAeypee/LQno7FX7K+v4ZjouyTaKzQvZ3PY
 E6vQ==
X-Gm-Message-State: AOJu0Yw/7+LbUuCVmyIkmKHvMsKYWB80evz41NN4yXN4BukmAtm9W2gd
 W5+MEux0f3x+VDSHkWkJDVIAJ5SioFpg7dgS1ZOFE30b89os2k8dmzzaZ60Aedjr5DfZOEAs/7u
 YfxW/UB7PsvZROc7KNqUHB11WoK8=
X-Google-Smtp-Source: AGHT+IHc0RdXXkrSYQ2OcOCHO7k8bY5aeYvVB5WrBf9L/25+1jtik57LTVMc1NGrvYpzMccBAoC7JigD/u966Y9TKIg=
X-Received: by 2002:a05:6122:4203:b0:4b7:3141:ff7f with SMTP id
 cm3-20020a056122420300b004b73141ff7fmr1915437vkb.7.1705892413089; Sun, 21 Jan
 2024 19:00:13 -0800 (PST)
MIME-Version: 1.0
References: <20240116205817.344178-1-dbarboza@ventanamicro.com>
 <20240116205817.344178-8-dbarboza@ventanamicro.com>
In-Reply-To: <20240116205817.344178-8-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Jan 2024 12:59:47 +1000
Message-ID: <CAKmqyKMS59zoyN=QCiKNnkNMxdNn64bvjKqQpvBsJE=5Mpxzug@mail.gmail.com>
Subject: Re: [PATCH v3 07/13] target/riscv/vector_helper.c: use 'vlenb'
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, richard.henderson@linaro.org, max.chou@sifive.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2e;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2e.google.com
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

On Wed, Jan 17, 2024 at 8:18=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Use 'cpu->cfg.vlenb' instead of 'cpu->cfg.vlen >> 3'.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/vector_helper.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index c1c3a4d1ea..cb944229b0 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -558,7 +558,7 @@ vext_ldst_whole(void *vd, target_ulong base, CPURISCV=
State *env, uint32_t desc,
>  {
>      uint32_t i, k, off, pos;
>      uint32_t nf =3D vext_nf(desc);
> -    uint32_t vlenb =3D riscv_cpu_cfg(env)->vlen >> 3;
> +    uint32_t vlenb =3D riscv_cpu_cfg(env)->vlenb;
>      uint32_t max_elems =3D vlenb >> log2_esz;
>
>      k =3D env->vstart / max_elems;
> @@ -929,7 +929,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void=
 *vs2,   \
>  {                                                             \
>      uint32_t vl =3D env->vl;                                    \
>      uint32_t vm =3D vext_vm(desc);                              \
> -    uint32_t total_elems =3D riscv_cpu_cfg(env)->vlen;          \
> +    uint32_t total_elems =3D riscv_cpu_cfg(env)->vlenb << 3;    \
>      uint32_t vta_all_1s =3D vext_vta_all_1s(desc);              \
>      uint32_t i;                                               \
>                                                                \
> @@ -967,7 +967,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1=
,          \
>  {                                                               \
>      uint32_t vl =3D env->vl;                                      \
>      uint32_t vm =3D vext_vm(desc);                                \
> -    uint32_t total_elems =3D riscv_cpu_cfg(env)->vlen;            \
> +    uint32_t total_elems =3D riscv_cpu_cfg(env)->vlenb << 3;      \
>      uint32_t vta_all_1s =3D vext_vta_all_1s(desc);                \
>      uint32_t i;                                                 \
>                                                                  \
> @@ -1171,7 +1171,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, vo=
id *vs2,   \
>  {                                                             \
>      uint32_t vm =3D vext_vm(desc);                              \
>      uint32_t vl =3D env->vl;                                    \
> -    uint32_t total_elems =3D riscv_cpu_cfg(env)->vlen;          \
> +    uint32_t total_elems =3D riscv_cpu_cfg(env)->vlenb << 3;    \
>      uint32_t vta_all_1s =3D vext_vta_all_1s(desc);              \
>      uint32_t vma =3D vext_vma(desc);                            \
>      uint32_t i;                                               \
> @@ -1236,7 +1236,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong =
s1, void *vs2,   \
>  {                                                                   \
>      uint32_t vm =3D vext_vm(desc);                                    \
>      uint32_t vl =3D env->vl;                                          \
> -    uint32_t total_elems =3D riscv_cpu_cfg(env)->vlen;                \
> +    uint32_t total_elems =3D riscv_cpu_cfg(env)->vlenb << 3;          \
>      uint32_t vta_all_1s =3D vext_vta_all_1s(desc);                    \
>      uint32_t vma =3D vext_vma(desc);                                  \
>      uint32_t i;                                                     \
> @@ -3971,7 +3971,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, vo=
id *vs2,   \
>  {                                                             \
>      uint32_t vm =3D vext_vm(desc);                              \
>      uint32_t vl =3D env->vl;                                    \
> -    uint32_t total_elems =3D riscv_cpu_cfg(env)->vlen;          \
> +    uint32_t total_elems =3D riscv_cpu_cfg(env)->vlenb << 3;    \
>      uint32_t vta_all_1s =3D vext_vta_all_1s(desc);              \
>      uint32_t vma =3D vext_vma(desc);                            \
>      uint32_t i;                                               \
> @@ -4011,7 +4011,7 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1, =
void *vs2,       \
>  {                                                                   \
>      uint32_t vm =3D vext_vm(desc);                                    \
>      uint32_t vl =3D env->vl;                                          \
> -    uint32_t total_elems =3D riscv_cpu_cfg(env)->vlen;                \
> +    uint32_t total_elems =3D riscv_cpu_cfg(env)->vlenb << 3;          \
>      uint32_t vta_all_1s =3D vext_vta_all_1s(desc);                    \
>      uint32_t vma =3D vext_vma(desc);                                  \
>      uint32_t i;                                                     \
> @@ -4528,7 +4528,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,   =
       \
>                    uint32_t desc)                          \
>  {                                                         \
>      uint32_t vl =3D env->vl;                                \
> -    uint32_t total_elems =3D riscv_cpu_cfg(env)->vlen;      \
> +    uint32_t total_elems =3D riscv_cpu_cfg(env)->vlenb << 3;\
>      uint32_t vta_all_1s =3D vext_vta_all_1s(desc);          \
>      uint32_t i;                                           \
>      int a, b;                                             \
> @@ -4615,7 +4615,7 @@ static void vmsetm(void *vd, void *v0, void *vs2, C=
PURISCVState *env,
>  {
>      uint32_t vm =3D vext_vm(desc);
>      uint32_t vl =3D env->vl;
> -    uint32_t total_elems =3D riscv_cpu_cfg(env)->vlen;
> +    uint32_t total_elems =3D riscv_cpu_cfg(env)->vlenb << 3;
>      uint32_t vta_all_1s =3D vext_vta_all_1s(desc);
>      uint32_t vma =3D vext_vma(desc);
>      int i;
> --
> 2.43.0
>
>

