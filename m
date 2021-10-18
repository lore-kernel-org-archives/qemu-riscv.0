Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcG6L-0008IH-4W
	for mharc-qemu-riscv@gnu.org; Sun, 17 Oct 2021 20:02:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mcG6G-0008Ft-M8; Sun, 17 Oct 2021 20:01:57 -0400
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d]:40545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mcG6D-0000rP-Uy; Sun, 17 Oct 2021 20:01:56 -0400
Received: by mail-il1-x12d.google.com with SMTP id k3so2709371ilo.7;
 Sun, 17 Oct 2021 17:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/qIerdn404zjU4DiaQTgbg1k2tpqHMBGGD7neb/bDX8=;
 b=N5yIeiTtjrpSnrfx8fXpHABZeJ3YWDbuIkxwsUH1q+x+iWbJh7HRq9jqogOqoX1XdT
 lmaAEwBE1z/rSFD80UoKt3IFpWbQsPrrrjdN66uXZ1cu5QEakKOSuuAk35KG0zqFAMJ7
 sZrPBjFZ8C033BX2/ochTNX0PKGUbSyCFN5B4WIjCkpWI5keBZI4xP0dObHlB05nhmHA
 wGoSemMxuE2DsaAd+i+AHqh5ceoTO62zrZxn9nmbbQ5tQzwoACoYD/Lm0ujZvi6uMhma
 fOrIsYcoz13IMsQCwuJkyX0rdHnOKu7KYOQOXTbpOFiKtpnYRqQC6kt/ts19yWgwIOAT
 5Uvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/qIerdn404zjU4DiaQTgbg1k2tpqHMBGGD7neb/bDX8=;
 b=h83PFfJEx0nPZBA/gHSURg5JVM7hYo0MRk24QA6w7+2wcGFC5cGpRLUi92pZoxkpwa
 VfgphFv1ze2ageXjtiFi/TRgSIZDUAyJE4VHQRzUjlR7SsiBGozRPlGEHKfzv48XKFs/
 QDXJVduWlkj//CC6SZ4JscGLPBlv7YajkQBXdu9McQa4n6K+DFAcJTV2greJTBBx58ub
 j80A18+icZXmfh49Fm34m/eqIzYup+RsR43fYqeDdjhK4uvVavzDOHdudHInW//Ay2em
 h4Ppauac8A5ssB1xO2eRBj5ky8mCImPxsSHQ0XCW1arHnYJY4za8O+79zEEX6YPNrtYf
 ETZg==
X-Gm-Message-State: AOAM5308pSUdU5gwkMOrvxW/xSouAdNFUPXfYGjDFHS/+EJ8MRl/7Fm6
 ppyboVpeo3lNNVYjYdcgJD9VmFRrzvT7PxDqmzF/+rKsoz76PF4a
X-Google-Smtp-Source: ABdhPJxEOlGJP/FN5psTkGGhkC3mE/G+gy6TzcE7ChzKw9vobVwE+XU7lAM09T/87dDFZ5e/BM3COWDGCeS9NXL6r/s=
X-Received: by 2002:a92:1a43:: with SMTP id z3mr12055424ill.46.1634515312533; 
 Sun, 17 Oct 2021 17:01:52 -0700 (PDT)
MIME-Version: 1.0
References: <20211016090742.3034669-1-frank.chang@sifive.com>
 <20211016090742.3034669-6-frank.chang@sifive.com>
In-Reply-To: <20211016090742.3034669-6-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 18 Oct 2021 10:01:26 +1000
Message-ID: <CAKmqyKP3tv92SOTmNcGvz0kU-bA=nzK7cVPOWNJs0dgP=x_WzQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] target/riscv: zfh: half-precision floating-point
 classify
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Chih-Min Chao <chihmin.chao@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Kito Cheng <kito.cheng@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12d;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12d.google.com
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
X-List-Received-Date: Mon, 18 Oct 2021 00:01:57 -0000

On Sat, Oct 16, 2021 at 7:11 PM <frank.chang@sifive.com> wrote:
>
> From: Kito Cheng <kito.cheng@sifive.com>
>
> Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
> Signed-off-by: Chih-Min Chao <chihmin.chao@sifive.com>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/fpu_helper.c                 |  6 ++++++
>  target/riscv/helper.h                     |  1 +
>  target/riscv/insn32.decode                |  1 +
>  target/riscv/insn_trans/trans_rvzfh.c.inc | 12 ++++++++++++
>  4 files changed, 20 insertions(+)
>
> diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
> index ec2009ee65b..388e23ca670 100644
> --- a/target/riscv/fpu_helper.c
> +++ b/target/riscv/fpu_helper.c
> @@ -482,6 +482,12 @@ target_ulong helper_feq_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
>      return float16_eq_quiet(frs1, frs2, &env->fp_status);
>  }
>
> +target_ulong helper_fclass_h(uint64_t rs1)
> +{
> +    float16 frs1 = check_nanbox_h(rs1);
> +    return fclass_h(frs1);
> +}
> +
>  target_ulong helper_fcvt_w_h(CPURISCVState *env, uint64_t rs1)
>  {
>      float16 frs1 = check_nanbox_h(rs1);
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index 9c89521d4ad..d25cf725c57 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -89,6 +89,7 @@ DEF_HELPER_FLAGS_2(fcvt_h_w, TCG_CALL_NO_RWG, i64, env, tl)
>  DEF_HELPER_FLAGS_2(fcvt_h_wu, TCG_CALL_NO_RWG, i64, env, tl)
>  DEF_HELPER_FLAGS_2(fcvt_h_l, TCG_CALL_NO_RWG, i64, env, tl)
>  DEF_HELPER_FLAGS_2(fcvt_h_lu, TCG_CALL_NO_RWG, i64, env, tl)
> +DEF_HELPER_FLAGS_1(fclass_h, TCG_CALL_NO_RWG_SE, tl, i64)
>
>  /* Special functions */
>  DEF_HELPER_2(csrr, tl, env, int)
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 3906c9fb201..6c4cde216bc 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -754,6 +754,7 @@ fmv_x_h    1110010  00000 ..... 000 ..... 1010011 @r2
>  feq_h      1010010  ..... ..... 010 ..... 1010011 @r
>  flt_h      1010010  ..... ..... 001 ..... 1010011 @r
>  fle_h      1010010  ..... ..... 000 ..... 1010011 @r
> +fclass_h   1110010  00000 ..... 001 ..... 1010011 @r2
>  fcvt_h_w   1101010  00000 ..... ... ..... 1010011 @r2_rm
>  fcvt_h_wu  1101010  00001 ..... ... ..... 1010011 @r2_rm
>  fmv_h_x    1111010  00000 ..... 000 ..... 1010011 @r2
> diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc b/target/riscv/insn_trans/trans_rvzfh.c.inc
> index 8d0959a6671..0549e25fb45 100644
> --- a/target/riscv/insn_trans/trans_rvzfh.c.inc
> +++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
> @@ -372,6 +372,18 @@ static bool trans_fle_h(DisasContext *ctx, arg_fle_h *a)
>      return true;
>  }
>
> +static bool trans_fclass_h(DisasContext *ctx, arg_fclass_h *a)
> +{
> +    REQUIRE_FPU;
> +    REQUIRE_ZFH(ctx);
> +
> +    TCGv dest = dest_gpr(ctx, a->rd);
> +
> +    gen_helper_fclass_h(dest, cpu_fpr[a->rs1]);
> +    gen_set_gpr(ctx, a->rd, dest);
> +    return true;
> +}
> +
>  static bool trans_fcvt_w_h(DisasContext *ctx, arg_fcvt_w_h *a)
>  {
>      REQUIRE_FPU;
> --
> 2.25.1
>
>

