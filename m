Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C51CC47DD3
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 03:10:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rRkgz-0007g8-GO; Sun, 21 Jan 2024 22:09:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rRkgw-0007fL-CT; Sun, 21 Jan 2024 22:09:42 -0500
Received: from mail-vk1-xa36.google.com ([2607:f8b0:4864:20::a36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1rRkgu-0005c3-PT; Sun, 21 Jan 2024 22:09:42 -0500
Received: by mail-vk1-xa36.google.com with SMTP id
 71dfb90a1353d-4b74a9a9d4cso712116e0c.1; 
 Sun, 21 Jan 2024 19:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705892979; x=1706497779; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8jPFMs5TeiZHVTekx3i4laIvFI6aAQcS69mno/J+pgg=;
 b=cr7rEH5eu4HZMbI8A4lir/jW1TQtdlaDmy1phy8xfqVC/vjdRm2ednP5qm8HqYnRjl
 nBFmuO3tHIJnx2oLvVsQ68Udykjr44oBg2fxR35ty93EM4l+TPKhRuiVPW+ynA++ix0V
 fiuJQeZBiJcIWZM7qr8cC9c7X8MMfZ/QqClwTdATR69/a9xHqb3Xd9Tp5MS3DqlohU9k
 cTSXb0GiAS8xhVIhx9SQnwLJ9czAW2JirGNUvtvfK/pxQX87sV80kfU82ZecfEe7iFVh
 H6FaDi5lpbTRwjq/9iCqImQO/UAIIPwhc9o0ggdOILcMqsq6PQs7YBTRFYZPcT0Ykb/1
 bJ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705892979; x=1706497779;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8jPFMs5TeiZHVTekx3i4laIvFI6aAQcS69mno/J+pgg=;
 b=NDT2R37Bz6MWH0mA7Lx0ezqnjXgZNDJKtg6Anrqw2ebvwZ8VjaC/KWISvUDJslG6H6
 6O2CBPcaZNr0s6h/UWUfwly4Wt4a1oiSLf2RkXPcjDihws/ugHb5UywuIBgpjicxVoV4
 2DsAE2p4KPIERgZshCsgXesZDdP6hq0Xe7mcqHrcOUql07aLaCPmvruR1XvNFGEruNhz
 MEZfQEYjh5O+kdBe4i6dEAzIthzfetTaHDsv8ljxX4sUEMJbqIyQvMqCZN0NI+gefCSQ
 4UY0/A69YjU0W5yRW/uNx/1Uz6xZ3zckJCwTi6PIBWdHzAFOH2bONJDqaQKE+QMFOCDF
 AYbw==
X-Gm-Message-State: AOJu0YxpXxmUgEAE/Z/T7ejStRjRvBXNDiewdfli4BjyWw1cSNZvVV7+
 9CaBtZYZnYYEthrKTbOls81/j33/pXU96frPrxH4kD0AloykPezvK3a0tcPCV3gE2mWT5sFVrt0
 srfN6HETqGl0dK8+eK+8FqrvkXwg=
X-Google-Smtp-Source: AGHT+IFVqPfov64I7gCuQmxe2EHm8CiYQrYz/vdpQBKvwm8nnHqD6tM5UWYDVTlTqT+ZUoY5Can+wQjQ98KvKcWrPr0=
X-Received: by 2002:a1f:4a07:0:b0:4b8:ce85:1e97 with SMTP id
 x7-20020a1f4a07000000b004b8ce851e97mr749703vka.20.1705892978805; Sun, 21 Jan
 2024 19:09:38 -0800 (PST)
MIME-Version: 1.0
References: <20240116205817.344178-1-dbarboza@ventanamicro.com>
 <20240116205817.344178-12-dbarboza@ventanamicro.com>
In-Reply-To: <20240116205817.344178-12-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Jan 2024 13:09:12 +1000
Message-ID: <CAKmqyKOzLLz2YkLritw7GdEmy4kmBX9s0rtmyscq6=tSbFG5VQ@mail.gmail.com>
Subject: Re: [PATCH v3 11/13] target/riscv: change vext_get_vlmax() arguments
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, richard.henderson@linaro.org, max.chou@sifive.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a36;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa36.google.com
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
> We'll re-use the logic froim vext_get_vlmax() in 2 other occurrences in
> the next patch, but first we need to make it independent of both 'cpu'
> and 'vtype'. To do that, add 'vlenb', 'vsew' and 'lmul' as parameters
> instead.
>
> Adapt the two existing callers. In cpu_get_tb_cpu_state(), rename 'sew'
> to 'vsew' to be less ambiguous about what we're encoding into *pflags.
>
> In HELPER(vsetvl) the following changes were made:
>
> - add a 'vsew' var to store vsew. Use it in the shift to get 'sew';
> - the existing 'lmul' var was renamed to 'vlmul';
> - add a new 'lmul' var to store 'lmul' encoded like DisasContext:lmul.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.h           |  7 +++----
>  target/riscv/cpu_helper.c    | 11 +++++++----
>  target/riscv/vector_helper.c | 16 ++++++++++------
>  3 files changed, 20 insertions(+), 14 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 3af61e0f94..9dcbc0649a 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -688,11 +688,10 @@ static inline RISCVMXL riscv_cpu_sxl(CPURISCVState =
*env)
>   *               =3D 256 >> 7
>   *               =3D 2
>   */
> -static inline uint32_t vext_get_vlmax(RISCVCPU *cpu, target_ulong vtype)
> +static inline uint32_t vext_get_vlmax(uint32_t vlenb, uint32_t vsew,
> +                                      int8_t lmul)
>  {
> -    uint8_t vsew =3D FIELD_EX64(vtype, VTYPE, VSEW);
> -    int8_t lmul =3D sextract32(FIELD_EX64(vtype, VTYPE, VLMUL), 0, 3);
> -    uint32_t vlen =3D cpu->cfg.vlenb << 3;
> +    uint32_t vlen =3D vlenb << 3;
>
>      /*
>       * We need to use 'vlen' instead of 'vlenb' to
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index c7cc7eb423..8da9104da4 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -81,13 +81,16 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, vaddr *=
pc,
>           * which is not supported by GVEC. So we set vl_eq_vlmax flag to=
 true
>           * only when maxsz >=3D 8 bytes.
>           */
> -        uint32_t vlmax =3D vext_get_vlmax(cpu, env->vtype);
> -        uint32_t sew =3D FIELD_EX64(env->vtype, VTYPE, VSEW);
> -        uint32_t maxsz =3D vlmax << sew;
> +
> +        /* lmul encoded as in DisasContext::lmul */
> +        int8_t lmul =3D sextract32(FIELD_EX64(env->vtype, VTYPE, VLMUL),=
 0, 3);
> +        uint32_t vsew =3D FIELD_EX64(env->vtype, VTYPE, VSEW);
> +        uint32_t vlmax =3D vext_get_vlmax(cpu->cfg.vlenb, vsew, lmul);
> +        uint32_t maxsz =3D vlmax << vsew;
>          bool vl_eq_vlmax =3D (env->vstart =3D=3D 0) && (vlmax =3D=3D env=
->vl) &&
>                             (maxsz >=3D 8);
>          flags =3D FIELD_DP32(flags, TB_FLAGS, VILL, env->vill);
> -        flags =3D FIELD_DP32(flags, TB_FLAGS, SEW, sew);
> +        flags =3D FIELD_DP32(flags, TB_FLAGS, SEW, vsew);
>          flags =3D FIELD_DP32(flags, TB_FLAGS, LMUL,
>                             FIELD_EX64(env->vtype, VTYPE, VLMUL));
>          flags =3D FIELD_DP32(flags, TB_FLAGS, VL_EQ_VLMAX, vl_eq_vlmax);
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index b13be1541a..718a0c711a 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -35,16 +35,18 @@ target_ulong HELPER(vsetvl)(CPURISCVState *env, targe=
t_ulong s1,
>  {
>      int vlmax, vl;
>      RISCVCPU *cpu =3D env_archcpu(env);
> -    uint64_t lmul =3D FIELD_EX64(s2, VTYPE, VLMUL);
> -    uint16_t sew =3D 8 << FIELD_EX64(s2, VTYPE, VSEW);
> +    uint64_t vlmul =3D FIELD_EX64(s2, VTYPE, VLMUL);
> +    uint8_t vsew =3D FIELD_EX64(s2, VTYPE, VSEW);
> +    uint16_t sew =3D 8 << vsew;
>      uint8_t ediv =3D FIELD_EX64(s2, VTYPE, VEDIV);
>      int xlen =3D riscv_cpu_xlen(env);
>      bool vill =3D (s2 >> (xlen - 1)) & 0x1;
>      target_ulong reserved =3D s2 &
>                              MAKE_64BIT_MASK(R_VTYPE_RESERVED_SHIFT,
>                                              xlen - 1 - R_VTYPE_RESERVED_=
SHIFT);
> +    int8_t lmul;
>
> -    if (lmul & 4) {
> +    if (vlmul & 4) {
>          /*
>           * Fractional LMUL, check:
>           *
> @@ -53,8 +55,8 @@ target_ulong HELPER(vsetvl)(CPURISCVState *env, target_=
ulong s1,
>           * (vlenb << 3) >> (8 - lmul) >=3D sew
>           * vlenb >> (8 - 3 - lmul) >=3D sew
>           */
> -        if (lmul =3D=3D 4 ||
> -            cpu->cfg.vlenb >> (8 - 3 - lmul) < sew) {
> +        if (vlmul =3D=3D 4 ||
> +            cpu->cfg.vlenb >> (8 - 3 - vlmul) < sew) {
>              vill =3D true;
>          }
>      }
> @@ -68,7 +70,9 @@ target_ulong HELPER(vsetvl)(CPURISCVState *env, target_=
ulong s1,
>          return 0;
>      }
>
> -    vlmax =3D vext_get_vlmax(cpu, s2);
> +    /* lmul encoded as in DisasContext::lmul */
> +    lmul =3D sextract32(FIELD_EX64(s2, VTYPE, VLMUL), 0, 3);
> +    vlmax =3D vext_get_vlmax(cpu->cfg.vlenb, vsew, lmul);
>      if (s1 <=3D vlmax) {
>          vl =3D s1;
>      } else {
> --
> 2.43.0
>
>

