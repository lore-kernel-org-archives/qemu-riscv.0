Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mnvwT-0004pX-Nx
	for mharc-qemu-riscv@gnu.org; Thu, 18 Nov 2021 23:56:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mnvwR-0004nU-MR; Thu, 18 Nov 2021 23:56:03 -0500
Received: from [2607:f8b0:4864:20::129] (port=40844
 helo=mail-il1-x129.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mnvwP-0002nA-E3; Thu, 18 Nov 2021 23:56:03 -0500
Received: by mail-il1-x129.google.com with SMTP id k1so9041794ilo.7;
 Thu, 18 Nov 2021 20:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iXs/NNPux9IBWZMBX/hAHs5WiGygP/YF8JdYUBZmFg8=;
 b=UR4b38BniJT9qCwXPgNls8JiF0b2wozDshy89i5dMlkNC6atMmAlZ8FDddarfOb4b2
 YOdRBIa1OiXLxDKx08fM/Tpf4UKw0xkUA71gbUAtUGdnB5ntp95sQx8lI4N1zA/q4NpY
 c8Eahp8x5+C2AhGupf1C7F0wVBelEDRVDCeZhN+4MzbUS48CWz48MO885liz7UPFbO4k
 Kjlg9KJa22bT9D19ieSnP08mFlK/AecxQ1RGPwOANmUDR+f2f2JJfYMl0lvTDzvtlYuq
 qQYJW0i/m346wrAttdrCPlQa7wW1fUJFZKBaldWN/mjQJj4weDPRD+Yw7GCO4QpXExe0
 xBTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iXs/NNPux9IBWZMBX/hAHs5WiGygP/YF8JdYUBZmFg8=;
 b=nbcNshiZfId1Ida8xcX/1aS/h5Y1DduCZCoMB+suormQEDFHk3Y85hFa4Nu3jNVKol
 vaUntCvwi2c/sbYwN6xNvrPBnqTzPF5ei90To+PyaJdN6XHQb8B3+6h1/ekNcrFWnoVq
 koKlwzUhwrgoD1++pjSthVg3Giu2NPdpTGKo9lVuLhU+Op+2SdlbeON46ko97LoctZpp
 mpUMKzQOddwT9RJXZwFBwGjHHeGi6kQj27hsnqUKKeq4UC+zttg0qtuZPmW4MhG2nVod
 OCzOu7Tpls0MbVLi4RA8wZssdK3OAZnSJwYuS3Z/6Xc0AWpHPEiYXJY3CnU8MDSj1x9y
 X6sQ==
X-Gm-Message-State: AOAM532vgooYCKybwCo6YJ4SIQjcOfsz0f1eFWo+v918rPoODPMc+4Sy
 4rWotWK3UwiPe7tgUXLBBPMDTmZzB7IL2rHt/8v51yaEAALeowLU
X-Google-Smtp-Source: ABdhPJx0ZAudn2xmw4jVuXu9hG2s8vyhN6vC8vDXkYUL7eySf7UYXsT3qIdIFAce5DSaWvb8WkNWNoQgE5cJQ0Vxj2I=
X-Received: by 2002:a05:6e02:1402:: with SMTP id
 n2mr2943046ilo.208.1637297759984; 
 Thu, 18 Nov 2021 20:55:59 -0800 (PST)
MIME-Version: 1.0
References: <20211111155149.58172-1-zhiwei_liu@c-sky.com>
 <20211111155149.58172-13-zhiwei_liu@c-sky.com>
In-Reply-To: <20211111155149.58172-13-zhiwei_liu@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 19 Nov 2021 14:55:33 +1000
Message-ID: <CAKmqyKNRsAR4YRNCOJqbKxHyH_Cfw6rLAcXMnjJVD2=zK0im3g@mail.gmail.com>
Subject: Re: [PATCH v4 12/20] target/riscv: Split out the vill from vtype
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::129
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::129;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x129.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 19 Nov 2021 04:56:04 -0000

On Fri, Nov 12, 2021 at 2:03 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> We need not specially process vtype when XLEN changes.
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.h           |  1 +
>  target/riscv/cpu_helper.c    |  3 +--
>  target/riscv/csr.c           | 13 ++++++++++++-
>  target/riscv/machine.c       |  5 +++--
>  target/riscv/vector_helper.c |  3 ++-
>  5 files changed, 19 insertions(+), 6 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 9fba876e08..52ce670cbe 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -119,6 +119,7 @@ struct CPURISCVState {
>      target_ulong vl;
>      target_ulong vstart;
>      target_ulong vtype;
> +    bool vill;
>
>      target_ulong pc;
>      target_ulong load_res;
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index a40ed6d748..9b9dc83ab9 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -78,8 +78,7 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
>      if (riscv_has_ext(env, RVV)) {
>          uint32_t vlmax = vext_get_vlmax(env_archcpu(env), env->vtype);
>          bool vl_eq_vlmax = (env->vstart == 0) && (vlmax == env->vl);
> -        flags = FIELD_DP32(flags, TB_FLAGS, VILL,
> -                    FIELD_EX64(env->vtype, VTYPE, VILL));
> +        flags = FIELD_DP32(flags, TB_FLAGS, VILL, env->vill);
>          flags = FIELD_DP32(flags, TB_FLAGS, SEW,
>                      FIELD_EX64(env->vtype, VTYPE, VSEW));
>          flags = FIELD_DP32(flags, TB_FLAGS, LMUL,
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 6bb2d09519..8f8f170768 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -286,7 +286,18 @@ static RISCVException write_fcsr(CPURISCVState *env, int csrno,
>  static RISCVException read_vtype(CPURISCVState *env, int csrno,
>                                   target_ulong *val)
>  {
> -    *val = env->vtype;
> +    uint64_t vill;
> +    switch (cpu_get_xl(env)) {
> +    case MXL_RV32:
> +        vill = (uint32_t)env->vill << 31;
> +        break;
> +    case MXL_RV64:
> +        vill = (uint64_t)env->vill << 63;
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +    *val = (target_ulong)vill | env->vtype;
>      return RISCV_EXCP_NONE;
>  }
>
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index 19e982d3f0..ec7584f256 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -94,8 +94,8 @@ static bool pointermasking_needed(void *opaque)
>
>  static const VMStateDescription vmstate_vector = {
>      .name = "cpu/vector",
> -    .version_id = 1,
> -    .minimum_version_id = 1,
> +    .version_id = 2,
> +    .minimum_version_id = 2,
>      .needed = vector_needed,
>      .fields = (VMStateField[]) {
>              VMSTATE_UINT64_ARRAY(env.vreg, RISCVCPU, 32 * RV_VLEN_MAX / 64),
> @@ -104,6 +104,7 @@ static const VMStateDescription vmstate_vector = {
>              VMSTATE_UINTTL(env.vl, RISCVCPU),
>              VMSTATE_UINTTL(env.vstart, RISCVCPU),
>              VMSTATE_UINTTL(env.vtype, RISCVCPU),
> +            VMSTATE_BOOL(env.vill, RISCVCPU),
>              VMSTATE_END_OF_LIST()
>          }
>  };
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 12c31aa4b4..b02ccefa4d 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -38,7 +38,8 @@ target_ulong HELPER(vsetvl)(CPURISCVState *env, target_ulong s1,
>
>      if ((sew > cpu->cfg.elen) || vill || (ediv != 0) || (reserved != 0)) {
>          /* only set vill bit. */
> -        env->vtype = FIELD_DP64(0, VTYPE, VILL, 1);
> +        env->vill = 1;
> +        env->vtype = 0;
>          env->vl = 0;
>          env->vstart = 0;
>          return 0;
> --
> 2.25.1
>
>

