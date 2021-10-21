Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdPgN-0005za-Dr
	for mharc-qemu-riscv@gnu.org; Thu, 21 Oct 2021 00:27:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mdPgL-0005wS-9Y; Thu, 21 Oct 2021 00:27:57 -0400
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:34346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mdPgJ-0000o2-DY; Thu, 21 Oct 2021 00:27:56 -0400
Received: by mail-io1-xd2f.google.com with SMTP id i189so27402842ioa.1;
 Wed, 20 Oct 2021 21:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Aj7cu1H33YLNpwNhPOFYqk8GDN9I2ueRREu6kO9x+uU=;
 b=EEAz6KFMK31M75s4X0+46l+y1dycwFF/dJGZde6Gg1UZOBmf4x19kNcufQ3bXfe2Ty
 wKkx5Lhix4/R5mN5Bkt0wfQvwZ+I5hp4BQd2Z740h+7ZywZ7hQ8lUBwU4xzJRUXraf7h
 MwKOROHw0D2F+36krPkfvHiGXMpt1ehyLeHkwq37qhrVADeguW788P2gd5dy446+LVcw
 hOpCJ7VNCGJCv0Pv5SOvSvIocn65R5EuhumFlDgWbkR5ydPCNBt13lAkBoNrhf630OxX
 o6PCcFmaY25Ze9haIv13QHu1Jmz4ExabwpdbG01G+KkVG29JIYvXRDhaIqct1nmkw9Qt
 7JvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Aj7cu1H33YLNpwNhPOFYqk8GDN9I2ueRREu6kO9x+uU=;
 b=LnM72w/THR3GD1krTl0twF2tIjL6UZHSFTTKVTc7co7FGCUPakgQ3O5HUvGlQsjCqO
 6GbZn05wUcshYBE5y0+AhQ2IsHCAe2DdzH7O6kHdvM241FKdhHF8h6g3lKsc8MPL8tWn
 r4jXhYIDJNrZidFN5RKWe8W2AW+iGUF8GZUcFAbrhwQmKSaCEPUop9Ts5iWbVj0/C/Ut
 IsVcnJmKT7GWTV9ARsW3H7n8SuXHeaSG5uYfMy8cr1YBGmeoIDQWWfDdDioHLqBkRK1A
 CJXKhEKnYMTDG7tV7fI3c83NxdgzYuJEfoTxZq8cxGUK35mTcsBq/grey/1RRf3JWz40
 nx/Q==
X-Gm-Message-State: AOAM533nxbEHp0Ph5zDy3ImK2pNSKK+0uiTSxwGLjgRXIwWT+AKmYqND
 oxhSRsIHaSDcM95qDa2IYcyWf/yvdUy+buj0uiU=
X-Google-Smtp-Source: ABdhPJxUzc8S9reVNKdPZomn3mHE9NfPd3NxQEguqOCBQ/tpg2FUB5Rc0ndcGug/QoOnTXyOfG0UBS0z/sjPh2DwSDM=
X-Received: by 2002:a05:6638:2581:: with SMTP id
 s1mr2330307jat.35.1634790473940; 
 Wed, 20 Oct 2021 21:27:53 -0700 (PDT)
MIME-Version: 1.0
References: <20211015074627.3957162-1-frank.chang@sifive.com>
 <20211015074627.3957162-47-frank.chang@sifive.com>
In-Reply-To: <20211015074627.3957162-47-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 21 Oct 2021 14:27:27 +1000
Message-ID: <CAKmqyKPWB9-swdGyVBNGTuPMMow+fM20nx=wxqh5wtEiAJpf2Q@mail.gmail.com>
Subject: Re: [PATCH v8 39/78] target/riscv: rvv-1.0: whole register move
 instructions
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2f.google.com
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
X-List-Received-Date: Thu, 21 Oct 2021 04:27:58 -0000

On Fri, Oct 15, 2021 at 6:18 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Add the following instructions:
>
> * vmv1r.v
> * vmv2r.v
> * vmv4r.v
> * vmv8r.v
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn32.decode              |  4 ++++
>  target/riscv/insn_trans/trans_rvv.c.inc | 25 +++++++++++++++++++++++++
>  2 files changed, 29 insertions(+)
>
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index ab5fdbf9be8..06a80763112 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -650,6 +650,10 @@ vrgatherei16_vv 001110 . ..... ..... 000 ..... 1010111 @r_vm
>  vrgather_vx     001100 . ..... ..... 100 ..... 1010111 @r_vm
>  vrgather_vi     001100 . ..... ..... 011 ..... 1010111 @r_vm
>  vcompress_vm    010111 - ..... ..... 010 ..... 1010111 @r
> +vmv1r_v         100111 1 ..... 00000 011 ..... 1010111 @r2rd
> +vmv2r_v         100111 1 ..... 00001 011 ..... 1010111 @r2rd
> +vmv4r_v         100111 1 ..... 00011 011 ..... 1010111 @r2rd
> +vmv8r_v         100111 1 ..... 00111 011 ..... 1010111 @r2rd
>
>  vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
>  vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index aec0316fba4..5eaf978fe90 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -3258,3 +3258,28 @@ static bool trans_vcompress_vm(DisasContext *s, arg_r *a)
>      }
>      return false;
>  }
> +
> +/*
> + * Whole Vector Register Move Instructions ignore vtype and vl setting.
> + * Thus, we don't need to check vill bit. (Section 16.6)
> + */
> +#define GEN_VMV_WHOLE_TRANS(NAME, LEN)                          \
> +static bool trans_##NAME(DisasContext *s, arg_##NAME * a)       \
> +{                                                               \
> +    if (require_rvv(s) &&                                       \
> +        QEMU_IS_ALIGNED(a->rd, LEN) &&                          \
> +        QEMU_IS_ALIGNED(a->rs2, LEN)) {                         \
> +        /* EEW = 8 */                                           \
> +        tcg_gen_gvec_mov(MO_8, vreg_ofs(s, a->rd),              \
> +                         vreg_ofs(s, a->rs2),                   \
> +                         s->vlen / 8 * LEN, s->vlen / 8 * LEN); \
> +        mark_vs_dirty(s);                                       \
> +        return true;                                            \
> +    }                                                           \
> +    return false;                                               \
> +}
> +
> +GEN_VMV_WHOLE_TRANS(vmv1r_v, 1)
> +GEN_VMV_WHOLE_TRANS(vmv2r_v, 2)
> +GEN_VMV_WHOLE_TRANS(vmv4r_v, 4)
> +GEN_VMV_WHOLE_TRANS(vmv8r_v, 8)
> --
> 2.25.1
>
>

