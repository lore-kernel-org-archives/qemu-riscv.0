Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1meti6-0003wJ-Ro
	for mharc-qemu-riscv@gnu.org; Mon, 25 Oct 2021 02:43:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1meti3-0003uO-VC; Mon, 25 Oct 2021 02:43:52 -0400
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132]:46642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1meti2-0006QI-44; Mon, 25 Oct 2021 02:43:51 -0400
Received: by mail-il1-x132.google.com with SMTP id w10so11647601ilc.13;
 Sun, 24 Oct 2021 23:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TpD+zJc50W++bJ3r1NSUTwVGsFdzPnl55A8WaEY9yqQ=;
 b=Ox2JDEWgO5a9po0kjwUaligBwA01MkBPm1038ZOPLldr7XjrFFNKGc0Riyz2C0nK48
 icwVK1IvS+8KzCBfQSrChCUwBUl+1/OtTdK4hokE2jBaX+wq6QVdTfX7I/xRpXcuBaER
 VhUgebJySKnA/yXzJjURnbryL2UdblBQ64sqiOpXNmWYKqb+LbBHGBw0Dchq7COkG1sV
 xpKBMKqTCcb/VSWeQoZYtBfHHPF6HfCH9hNtuzLM5ptMFlFSMfjcg+m8gxxRKWeguBT6
 a8L5tT/xOc4b9OGJKM1Hg1YWW8HtRxzHm9H6jSnN+Nqfcs3I1iqO4K498tQZfrsp1UU+
 YXSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TpD+zJc50W++bJ3r1NSUTwVGsFdzPnl55A8WaEY9yqQ=;
 b=0eZFd6hRLZAaR1oe3oT3TVbP17dhWsp66pWhVcbsuoB+0szkf2ajeLgD+O9EnalzbX
 i7lfvk7mv+/k5VjowyIO1oIwTWa4NUVY/bn18310NqaJTlSr2tC+DXhZ5uk+KG49L8Po
 ntgqqoq5584Hb34aemaUhsY0DqB1bS0FiQqEG+WGCLxS48JZd0nQQzYWHlorEaQE7Pss
 5q6SYM1zrwKliXVDmbFyHWNAfkkApMyg4thhkkoFoOIuhXBoyvC5AEO1//A9cupaFcrq
 iNXYDEkL5RFrJdMiUYgnAEAsYXu9Fz8L++8+uQQIdltCl3le/Z95Jd5stlmB5fSug76r
 8iEw==
X-Gm-Message-State: AOAM5336I5StDohMWI8t3ZHTt6RUZW6F+exRJe+ShfNoSB2JXnFiVUwb
 TSSZaNm6Nb65xPQFYMLOoFbGP4sJ/XinhGRa+is=
X-Google-Smtp-Source: ABdhPJwwbbQlFa71DNo6n9++JjlEyrIWXB/AkMxSlNhc05cquBz3awSx6OikjjOFUru8fdZwVBDOi+WHxUgHQ5OGj3Q=
X-Received: by 2002:a05:6e02:1402:: with SMTP id
 n2mr8842101ilo.208.1635144228606; 
 Sun, 24 Oct 2021 23:43:48 -0700 (PDT)
MIME-Version: 1.0
References: <20211015074627.3957162-1-frank.chang@sifive.com>
 <20211015074627.3957162-73-frank.chang@sifive.com>
In-Reply-To: <20211015074627.3957162-73-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 25 Oct 2021 16:43:22 +1000
Message-ID: <CAKmqyKOcAFS49vqtuMoAuQi9rpnb+E9kGeLjFF=qirZvyQ7Y3A@mail.gmail.com>
Subject: Re: [PATCH v8 65/78] target/riscv: rvv-1.0: relax RV_VLEN_MAX to
 1024-bits
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::132;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x132.google.com
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
X-List-Received-Date: Mon, 25 Oct 2021 06:43:52 -0000

On Fri, Oct 15, 2021 at 6:43 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> --
> ---
>  target/riscv/cpu.h                      | 2 +-
>  target/riscv/insn_trans/trans_rvv.c.inc | 4 ++--
>  target/riscv/vector_helper.c            | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 9b2af4e4d0e..49eece111e2 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -101,7 +101,7 @@ typedef struct CPURISCVState CPURISCVState;
>  #include "pmp.h"
>  #endif
>
> -#define RV_VLEN_MAX 256
> +#define RV_VLEN_MAX 1024
>
>  FIELD(VTYPE, VLMUL, 0, 3)
>  FIELD(VTYPE, VSEW, 3, 3)
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 92a23b52e49..dcb96c954ec 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -567,8 +567,8 @@ static bool ldst_us_trans(uint32_t vd, uint32_t rs1, uint32_t data,
>      base = get_gpr(s, rs1, EXT_NONE);
>
>      /*
> -     * As simd_desc supports at most 256 bytes, and in this implementation,
> -     * the max vector group length is 2048 bytes. So split it into two parts.
> +     * As simd_desc supports at most 2048 bytes, and in this implementation,
> +     * the max vector group length is 4096 bytes. So split it into two parts.
>       *
>       * The first part is vlen in bytes, encoded in maxsz of simd_desc.
>       * The second part is lmul, encoded in data of simd_desc.
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 37b2451bd05..70ddc55e16b 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -124,7 +124,7 @@ static inline int32_t vext_lmul(uint32_t desc)
>  static inline uint32_t vext_max_elems(uint32_t desc, uint32_t esz)
>  {
>      /*
> -     * As simd_desc support at most 256 bytes, the max vlen is 256 bits.
> +     * As simd_desc support at most 2048 bytes, the max vlen is 1024 bits.
>       * so vlen in bytes (vlenb) is encoded as maxsz.
>       */
>      uint32_t vlenb = simd_maxsz(desc);
> --
> 2.25.1
>
>

