Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nnzrK-0003rs-5v
	for mharc-qemu-riscv@gnu.org; Mon, 09 May 2022 05:39:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nnzrE-0003oQ-1i; Mon, 09 May 2022 05:39:13 -0400
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134]:46850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nnzr7-0002jG-Nx; Mon, 09 May 2022 05:39:11 -0400
Received: by mail-il1-x134.google.com with SMTP id f5so8889634ilj.13;
 Mon, 09 May 2022 02:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sEkuQUdEGnyuOLUlZfUFgCuYEulxeJGdb5HUcjYZEME=;
 b=njUW+HwPbOnpUSGQ4a6HHNYuBeV4nkQtPiBuiiJZ6xPMhjE3wSTgHmxct6hphhYmyg
 gMG/z+MYh/TY08f7SSKlDYVda58M6Vk1fEWbtn3JDCLhjKdpXJqVNdU4g8oKJdW+HpvH
 p2PI1s3exc5nyVTzo0XfNPptfH5yvdaY+jYQn8W2CeC7/pbQ8S2guyDRo27N1cQguCTH
 QTzBFQeUB892ZjPrFgk/qJWllhEl3OrSjL3zj5TKxrH0mgleAAFo0FJ1rQl1uTZ4inQ+
 BB3PDlIppoAp38lWyg9iByQNL99roU0YZyRK/x4evhbtrrzSjSvl7Y0HismACRrdF/vt
 rHXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sEkuQUdEGnyuOLUlZfUFgCuYEulxeJGdb5HUcjYZEME=;
 b=CAnaQtVYnLXq/jopVXzhPT0XD4JQkobta3DPhq7c4x3wyJHyr/3RPIp6GZlkkgPrOk
 iEaw6jxGTHlAAwdv9dVIgdm+e4Ry8c7sG/kxDvAU50TjOh/wuUanFiJxBrwr66nX4F6f
 VhmGf5fr+TMQN3Bjy55QEsPm11xKjpv8BoX50CISr2yHwCEhrH2890LvVrgje3re7mqv
 fUFSF+WatnIyIQlBnBniBOVJC/18SwH4D9d1K/SJT4MViAgjzmdhG6yFo/g+EBDUD7jz
 gNA7x3fJjJG32d3g4uGf3tJKzQCDCJ991P1MBBVZoGeU2zgZXUi7tF+ENuUQr1/8jsCO
 pn5A==
X-Gm-Message-State: AOAM530mj+ART84+q47l4mo/UnYt6NCF7xehh+Dg+Ew38N6oxmlwM06I
 o4AUpcBrHO8q7QxaNhuNxOJ2ybPLV0D66/uqHsM=
X-Google-Smtp-Source: ABdhPJyI2H+2pdX21OB1Gy0Mnf/5MmA/coYyYsyeRn8Bym1E0BUpEmy3h3iKPhGU+iIB8yJHfoOQmYh9nmFNNK7H3JU=
X-Received: by 2002:a05:6e02:170b:b0:2cf:9f8f:afdf with SMTP id
 u11-20020a056e02170b00b002cf9f8fafdfmr3143645ill.260.1652089144384; Mon, 09
 May 2022 02:39:04 -0700 (PDT)
MIME-Version: 1.0
References: <165181414065.18540.14828125053334599921-0@git.sr.ht>
In-Reply-To: <165181414065.18540.14828125053334599921-0@git.sr.ht>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 9 May 2022 11:38:38 +0200
Message-ID: <CAKmqyKOo75_HqXBCmyC6DPwy8wUYb6y39RG-DXtiFtNagaNcTQ@mail.gmail.com>
Subject: Re: [PATCH qemu] target/riscv: rvv: Fix early exit condition for
 whole register load/store
To: "~eopxd" <yueh.ting.chen@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Frank Chang <frank.chang@sifive.com>, 
 WeiWei Li <liweiwei@iscas.ac.cn>, eop Chen <eop.chen@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::134;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x134.google.com
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
X-List-Received-Date: Mon, 09 May 2022 09:39:14 -0000

On Fri, May 6, 2022 at 7:17 AM ~eopxd <eopxd@git.sr.ht> wrote:
>
> From: eopXD <eop.chen@sifive.com>
>
> Vector whole register load instructions have EEW encoded in the opcode,
> so we shouldn't take SEW here. Vector whole register store instructions
> are always EEW=8.
>
> Signed-off-by: eop Chen <eop.chen@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/insn_trans/trans_rvv.c.inc | 58 +++++++++++++------------
>  1 file changed, 31 insertions(+), 27 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 90327509f7..391c61fe93 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -1118,10 +1118,10 @@ GEN_VEXT_TRANS(vle64ff_v, MO_64, r2nfvm, ldff_op, ld_us_check)
>  typedef void gen_helper_ldst_whole(TCGv_ptr, TCGv, TCGv_env, TCGv_i32);
>
>  static bool ldst_whole_trans(uint32_t vd, uint32_t rs1, uint32_t nf,
> -                             gen_helper_ldst_whole *fn, DisasContext *s,
> -                             bool is_store)
> +                             uint32_t width, gen_helper_ldst_whole *fn,
> +                             DisasContext *s, bool is_store)
>  {
> -    uint32_t evl = (s->cfg_ptr->vlen / 8) * nf / (1 << s->sew);
> +    uint32_t evl = (s->cfg_ptr->vlen / 8) * nf / width;
>      TCGLabel *over = gen_new_label();
>      tcg_gen_brcondi_tl(TCG_COND_GEU, cpu_vstart, evl, over);
>
> @@ -1153,38 +1153,42 @@ static bool ldst_whole_trans(uint32_t vd, uint32_t rs1, uint32_t nf,
>   * load and store whole register instructions ignore vtype and vl setting.
>   * Thus, we don't need to check vill bit. (Section 7.9)
>   */
> -#define GEN_LDST_WHOLE_TRANS(NAME, ARG_NF, IS_STORE)                      \
> +#define GEN_LDST_WHOLE_TRANS(NAME, ARG_NF, WIDTH, IS_STORE)               \
>  static bool trans_##NAME(DisasContext *s, arg_##NAME * a)                 \
>  {                                                                         \
>      if (require_rvv(s) &&                                                 \
>          QEMU_IS_ALIGNED(a->rd, ARG_NF)) {                                 \
> -        return ldst_whole_trans(a->rd, a->rs1, ARG_NF, gen_helper_##NAME, \
> -                                s, IS_STORE);                             \
> +        return ldst_whole_trans(a->rd, a->rs1, ARG_NF, WIDTH,             \
> +                                gen_helper_##NAME, s, IS_STORE);          \
>      }                                                                     \
>      return false;                                                         \
>  }
>
> -GEN_LDST_WHOLE_TRANS(vl1re8_v,  1, false)
> -GEN_LDST_WHOLE_TRANS(vl1re16_v, 1, false)
> -GEN_LDST_WHOLE_TRANS(vl1re32_v, 1, false)
> -GEN_LDST_WHOLE_TRANS(vl1re64_v, 1, false)
> -GEN_LDST_WHOLE_TRANS(vl2re8_v,  2, false)
> -GEN_LDST_WHOLE_TRANS(vl2re16_v, 2, false)
> -GEN_LDST_WHOLE_TRANS(vl2re32_v, 2, false)
> -GEN_LDST_WHOLE_TRANS(vl2re64_v, 2, false)
> -GEN_LDST_WHOLE_TRANS(vl4re8_v,  4, false)
> -GEN_LDST_WHOLE_TRANS(vl4re16_v, 4, false)
> -GEN_LDST_WHOLE_TRANS(vl4re32_v, 4, false)
> -GEN_LDST_WHOLE_TRANS(vl4re64_v, 4, false)
> -GEN_LDST_WHOLE_TRANS(vl8re8_v,  8, false)
> -GEN_LDST_WHOLE_TRANS(vl8re16_v, 8, false)
> -GEN_LDST_WHOLE_TRANS(vl8re32_v, 8, false)
> -GEN_LDST_WHOLE_TRANS(vl8re64_v, 8, false)
> -
> -GEN_LDST_WHOLE_TRANS(vs1r_v, 1, true)
> -GEN_LDST_WHOLE_TRANS(vs2r_v, 2, true)
> -GEN_LDST_WHOLE_TRANS(vs4r_v, 4, true)
> -GEN_LDST_WHOLE_TRANS(vs8r_v, 8, true)
> +GEN_LDST_WHOLE_TRANS(vl1re8_v,  1, 1, false)
> +GEN_LDST_WHOLE_TRANS(vl1re16_v, 1, 2, false)
> +GEN_LDST_WHOLE_TRANS(vl1re32_v, 1, 4, false)
> +GEN_LDST_WHOLE_TRANS(vl1re64_v, 1, 8, false)
> +GEN_LDST_WHOLE_TRANS(vl2re8_v,  2, 1, false)
> +GEN_LDST_WHOLE_TRANS(vl2re16_v, 2, 2, false)
> +GEN_LDST_WHOLE_TRANS(vl2re32_v, 2, 4, false)
> +GEN_LDST_WHOLE_TRANS(vl2re64_v, 2, 8, false)
> +GEN_LDST_WHOLE_TRANS(vl4re8_v,  4, 1, false)
> +GEN_LDST_WHOLE_TRANS(vl4re16_v, 4, 2, false)
> +GEN_LDST_WHOLE_TRANS(vl4re32_v, 4, 4, false)
> +GEN_LDST_WHOLE_TRANS(vl4re64_v, 4, 8, false)
> +GEN_LDST_WHOLE_TRANS(vl8re8_v,  8, 1, false)
> +GEN_LDST_WHOLE_TRANS(vl8re16_v, 8, 2, false)
> +GEN_LDST_WHOLE_TRANS(vl8re32_v, 8, 4, false)
> +GEN_LDST_WHOLE_TRANS(vl8re64_v, 8, 8, false)
> +
> +/*
> + * The vector whole register store instructions are encoded similar to
> + * unmasked unit-stride store of elements with EEW=8.
> + */
> +GEN_LDST_WHOLE_TRANS(vs1r_v, 1, 1, true)
> +GEN_LDST_WHOLE_TRANS(vs2r_v, 2, 1, true)
> +GEN_LDST_WHOLE_TRANS(vs4r_v, 4, 1, true)
> +GEN_LDST_WHOLE_TRANS(vs8r_v, 8, 1, true)
>
>  /*
>   *** Vector Integer Arithmetic Instructions
> --
> 2.34.2
>

