Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l1vz2-0007n2-Cf
	for mharc-qemu-riscv@gnu.org; Tue, 19 Jan 2021 13:44:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l1vyv-0007kf-G4; Tue, 19 Jan 2021 13:43:57 -0500
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:38719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l1vyn-0002OW-7F; Tue, 19 Jan 2021 13:43:57 -0500
Received: by mail-io1-xd35.google.com with SMTP id e22so41665257iom.5;
 Tue, 19 Jan 2021 10:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=au/UKhL6f+zdjCa3ichz8ynlkQAcoZUIwtkSsIQ9zNQ=;
 b=MLk6lJk2HjPl7TrFvgBmaGxqXtj04iVsNlDw2N0ZKwGX20A7cKsVGDe9SGcsLpyUvD
 k+TN8IzcCoDW7tcN1sa5YDc3Qo75fP5waY1mlcTVCGEnURTwv74dter2cbxLXY0veHJC
 kgNhj+7zFeqPYRWFFItCE2X1fihu0BUb8RzQ/fuEVMKK7f0diCG56aVrp6azV/NHVGKd
 FUssPJG0GeTnLmRGcduwh4i4pHMBJPs8UjDSsJXeo9VVnMPfpji/z++NEcRDrLYHHCF6
 kVQCikvSFIkW6PVYZjRLQZl1gcChb2hDvD+s5BA+mQKCBH7sFxt8prspk9eL4k3NFdjA
 TLEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=au/UKhL6f+zdjCa3ichz8ynlkQAcoZUIwtkSsIQ9zNQ=;
 b=Z6evnLo5EXnAIv0aRYr1r+9Hio7accGQWy+x8U+80MxYc/BfYvLtWE0bBNXisoyUs3
 JWhCD8oRZ2hNIH21kyoT9Uutq0xsRVVdUGYcS6DftMkQ3wrVmESy4pp0cCkEsx4nykM2
 Hcuj6BiYZnLlHVBR+h4XXNcisw0MQYEhTfaWpTZ/lBtjZ7tf2PRH6UwowpOR5EhMMSqX
 FJhzKQixNV6HOFzsBsg5VB4XjtuVp2Ux+686sdFO0reHrKzssDg7ViAbj40QtMrdiqS9
 blCK0rBruziYvoJ+su3wA5xPe/4AAWi2JYeb0/nldpPQIrPEMnNzZKj6Vb7OIWTaBWCY
 qTkQ==
X-Gm-Message-State: AOAM5314STvsjc9QzNrPo/6D7wzWVnggoojLMhCuTBfjhQ55wPrNu0kN
 Q0Ud8WfciIQESprENoYxnXDzxXxsHPSXc5DCU7g=
X-Google-Smtp-Source: ABdhPJwshxXmV9ocbq6a+D27L53VZpCK0NGqW1RH1cybEIkYZ+2o08sU+ldCcY7H7tgjQvRCmz6XajPO4lI2wSw3UbQ=
X-Received: by 2002:a02:cbad:: with SMTP id v13mr4688569jap.26.1611081827809; 
 Tue, 19 Jan 2021 10:43:47 -0800 (PST)
MIME-Version: 1.0
References: <20210112093950.17530-1-frank.chang@sifive.com>
 <20210112093950.17530-13-frank.chang@sifive.com>
In-Reply-To: <20210112093950.17530-13-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 19 Jan 2021 10:43:21 -0800
Message-ID: <CAKmqyKMvZoNUH=yAhkYansDRjmtSK6Cq7Z7=A_x_xbGTcCJwDw@mail.gmail.com>
Subject: Re: [PATCH v6 12/72] target/riscv: rvv-1.0: add fractional LMUL
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd35.google.com
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
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Jan 2021 18:43:59 -0000

On Tue, Jan 12, 2021 at 1:46 AM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Introduce the concepts of fractional LMUL for RVV 1.0.
> In RVV 1.0, LMUL bits are contiguous in vtype register.
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.h           | 17 +++++++++--------
>  target/riscv/translate.c     | 16 ++++++++++++++--
>  target/riscv/vector_helper.c | 16 ++++++++++++++--
>  3 files changed, 37 insertions(+), 12 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index cd5c77114a4..3b985f6218d 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -105,10 +105,10 @@ typedef struct CPURISCVState CPURISCVState;
>
>  #define RV_VLEN_MAX 256
>
> -FIELD(VTYPE, VLMUL, 0, 2)
> -FIELD(VTYPE, VSEW, 2, 3)
> -FIELD(VTYPE, VEDIV, 5, 2)
> -FIELD(VTYPE, RESERVED, 7, sizeof(target_ulong) * 8 - 9)
> +FIELD(VTYPE, VLMUL, 0, 3)
> +FIELD(VTYPE, VSEW, 3, 3)
> +FIELD(VTYPE, VEDIV, 8, 2)
> +FIELD(VTYPE, RESERVED, 10, sizeof(target_ulong) * 8 - 11)
>  FIELD(VTYPE, VILL, sizeof(target_ulong) * 8 - 1, 1)
>
>  struct CPURISCVState {
> @@ -380,11 +380,12 @@ typedef RISCVCPU ArchCPU;
>  #include "exec/cpu-all.h"
>
>  FIELD(TB_FLAGS, VL_EQ_VLMAX, 2, 1)
> -FIELD(TB_FLAGS, LMUL, 3, 2)
> -FIELD(TB_FLAGS, SEW, 5, 3)
> -FIELD(TB_FLAGS, VILL, 8, 1)
> +FIELD(TB_FLAGS, LMUL, 3, 3)
> +FIELD(TB_FLAGS, SEW, 6, 3)
> +/* Skip MSTATUS_VS (0x600) fields */
> +FIELD(TB_FLAGS, VILL, 11, 1)
>  /* Is a Hypervisor instruction load/store allowed? */
> -FIELD(TB_FLAGS, HLSX, 9, 1)
> +FIELD(TB_FLAGS, HLSX, 12, 1)
>
>  bool riscv_cpu_is_32bit(CPURISCVState *env);
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 18e198bf8a6..d9b3b37f698 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -60,7 +60,19 @@ typedef struct DisasContext {
>      bool hlsx;
>      /* vector extension */
>      bool vill;
> -    uint8_t lmul;
> +    /*
> +     * Encode LMUL to lmul as follows:
> +     *     LMUL    vlmul    lmul
> +     *      1       000       0
> +     *      2       001       1
> +     *      4       010       2
> +     *      8       011       3
> +     *      -       100       -
> +     *     1/8      101      -3
> +     *     1/4      110      -2
> +     *     1/2      111      -1
> +     */
> +    int8_t lmul;
>      uint8_t sew;
>      uint16_t vlen;
>      bool vl_eq_vlmax;
> @@ -843,7 +855,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>      ctx->hlsx = FIELD_EX32(tb_flags, TB_FLAGS, HLSX);
>      ctx->vill = FIELD_EX32(tb_flags, TB_FLAGS, VILL);
>      ctx->sew = FIELD_EX32(tb_flags, TB_FLAGS, SEW);
> -    ctx->lmul = FIELD_EX32(tb_flags, TB_FLAGS, LMUL);
> +    ctx->lmul = sextract32(FIELD_EX32(tb_flags, TB_FLAGS, LMUL), 0, 3);
>      ctx->vl_eq_vlmax = FIELD_EX32(tb_flags, TB_FLAGS, VL_EQ_VLMAX);
>  }
>
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 12301e943e6..aa8348ea25a 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -86,9 +86,21 @@ static inline uint32_t vext_vm(uint32_t desc)
>      return FIELD_EX32(simd_data(desc), VDATA, VM);
>  }
>
> -static inline uint32_t vext_lmul(uint32_t desc)
> +/*
> + * Encode LMUL to lmul as following:
> + *     LMUL    vlmul    lmul
> + *      1       000       0
> + *      2       001       1
> + *      4       010       2
> + *      8       011       3
> + *      -       100       -
> + *     1/8      101      -3
> + *     1/4      110      -2
> + *     1/2      111      -1
> + */
> +static inline int32_t vext_lmul(uint32_t desc)
>  {
> -    return FIELD_EX32(simd_data(desc), VDATA, LMUL);
> +    return sextract32(FIELD_EX32(simd_data(desc), VDATA, LMUL), 0, 3);
>  }
>
>  static uint32_t vext_wd(uint32_t desc)
> --
> 2.17.1
>
>

