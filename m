Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k1Elx-0003Xv-Ar
	for mharc-qemu-riscv@gnu.org; Thu, 30 Jul 2020 16:03:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k1Elv-0003Xf-Gt
 for qemu-riscv@nongnu.org; Thu, 30 Jul 2020 16:03:23 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:53613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k1Elt-0000Wv-EF
 for qemu-riscv@nongnu.org; Thu, 30 Jul 2020 16:03:23 -0400
Received: by mail-pj1-x1030.google.com with SMTP id a9so5174350pjd.3
 for <qemu-riscv@nongnu.org>; Thu, 30 Jul 2020 13:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LOipJzQ2BqLqs7xlYpJJ/NiuKnLm29ElS9vmdOF2cFQ=;
 b=jqBO7h3uRKEbDCp0O+CdS+yxtdFYdu29U/QE80dZfpBuBB1ycHh5VYLxbVbnfzLJxc
 VcQfCqnCrtQP/2ZRcbqPE8yyhVfHlu7yxlY+Hn26jTT3DrzGm2Dg24f2AtOiIJVV/ORH
 HjGGOeeRL4Nes3Jhn4D0NfMDOp7ocABn9nTs927vl0P3XhmEWlciuG/NZB1eeUN31ena
 lh87eevhTTuScPu4YyVR8JcNmdmRAC4++udpzXPbPshoBpU4VJJC3NV5sA8aRyWqCc1+
 W9BhWUjybHKt8hnuS+yHNbE9iocZfXt4uHCvj5bmSqr0d2whaU0lYXKl9kBSqwtowCA4
 x/mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LOipJzQ2BqLqs7xlYpJJ/NiuKnLm29ElS9vmdOF2cFQ=;
 b=K+KnFnwPDR2cpevuQaImmoEfZ4rNiaSUuphwudab08qfUIurQ/hTCzPNGVF4UaPQm+
 NOAg/hwZdJuNG7XCCsBXgdYCHtAIf47cMMJKOr8MtGLkxhVBaKZ7jI5k+jbM8uRAnnOo
 yBl9sZhsr9vNuThKjEEyLTOQjvriGuU+07YWHuhRfwsOad0KznzXalBas6ssR7trMmiJ
 IOzq28zpyU/WWVMeczQOEFNIq6Ks7r2t17Hbo79hS96L4Zpjg9bREMFveshZQS0BvdyF
 5TjSjV7YWtc5hdSGz2YzfDi9NTSqcZ7KSqEHUlFzN3pDJDKZ2Dfc20VFPG6ag84A762y
 FXMg==
X-Gm-Message-State: AOAM5316813PS27n14LclUq4DlCS1Yw/yCSgCH4sSNmzs7U5KNqmoOVi
 wzbm5rv0t+2vLYOfmkdjxKmHXA==
X-Google-Smtp-Source: ABdhPJwM445w6wYUOVSGhKGiWjPnHgBVxr2dV78RyvneBxwZryBPKCOe/O3lDQjqAEdS+dQSgj/hoQ==
X-Received: by 2002:a17:90a:1c97:: with SMTP id
 t23mr771250pjt.216.1596139399630; 
 Thu, 30 Jul 2020 13:03:19 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id z67sm8278615pfc.162.2020.07.30.13.03.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jul 2020 13:03:18 -0700 (PDT)
Subject: Re: [RFC v2 41/76] target/riscv: rvv-0.9: floating-point scalar move
 instructions
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
 <20200722091641.8834-42-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <de0406ff-4443-3bd9-4499-deedc3545dab@linaro.org>
Date: Thu, 30 Jul 2020 13:03:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722091641.8834-42-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Thu, 30 Jul 2020 20:03:23 -0000

On 7/22/20 2:16 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> NaN-boxed the scalar floating-point register based on RVV 0.9's rules.
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/insn32.decode              |  4 +--
>  target/riscv/insn_trans/trans_rvv.inc.c | 45 ++++++++++++++++---------
>  2 files changed, 31 insertions(+), 18 deletions(-)
> 
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index ef53df7c73..4be1b88e2d 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -583,8 +583,8 @@ vid_v           010100 . 00000 10001 010 ..... 1010111 @r1_vm
>  vmv_x_s         010000 1 ..... 00000 010 ..... 1010111 @r2rd
>  vmv_s_x         010000 1 00000 ..... 110 ..... 1010111 @r2
>  vext_x_v        001100 1 ..... ..... 010 ..... 1010111 @r
> -vfmv_f_s        001100 1 ..... 00000 001 ..... 1010111 @r2rd
> -vfmv_s_f        001101 1 00000 ..... 101 ..... 1010111 @r2
> +vfmv_f_s        010000 1 ..... 00000 001 ..... 1010111 @r2rd
> +vfmv_s_f        010000 1 00000 ..... 101 ..... 1010111 @r2
>  vslideup_vx     001110 . ..... ..... 100 ..... 1010111 @r_vm
>  vslideup_vi     001110 . ..... ..... 011 ..... 1010111 @r_vm
>  vslide1up_vx    001110 . ..... ..... 110 ..... 1010111 @r_vm
> diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
> index 54c08ea1f8..56cd7444f2 100644
> --- a/target/riscv/insn_trans/trans_rvv.inc.c
> +++ b/target/riscv/insn_trans/trans_rvv.inc.c
> @@ -3326,14 +3326,22 @@ static bool trans_vmv_s_x(DisasContext *s, arg_vmv_s_x *a)
>  /* Floating-Point Scalar Move Instructions */
>  static bool trans_vfmv_f_s(DisasContext *s, arg_vfmv_f_s *a)
>  {
> -    if (!s->vill && has_ext(s, RVF) &&
> -        (s->mstatus_fs != 0) && (s->sew != 0)) {
> -        unsigned int len = 8 << s->sew;
> -
> -        vec_element_loadi(s, cpu_fpr[a->rd], a->rs2, 0);
> -        if (len < 64) {
> -            tcg_gen_ori_i64(cpu_fpr[a->rd], cpu_fpr[a->rd],
> -                            MAKE_64BIT_MASK(len, 64 - len));
> +    if (require_rvv(s) &&
> +        vext_check_isa_ill(s) &&
> +        has_ext(s, RVF) &&
> +        (s->mstatus_fs != 0) &&
> +        (s->sew != 0)) {
> +        unsigned int ofs = (8 << s->sew);
> +        unsigned int len = 64 - ofs;
> +        TCGv_i64 t_nan;
> +
> +        vec_element_loadi(s, cpu_fpr[a->rd], a->rs2, 0, false);
> +        /* NaN-box f[rd] as necessary for SEW */
> +        if (len) {
> +            t_nan = tcg_const_i64(UINT64_MAX);
> +            tcg_gen_deposit_i64(cpu_fpr[a->rd], cpu_fpr[a->rd],
> +                                t_nan, ofs, len);
> +            tcg_temp_free_i64(t_nan);
>          }

It would be better to use the gen_nanbox_[sh] functions here.


>          t1 = tcg_temp_new_i64();
>          if (s->sew == MO_64 && !has_ext(s, RVD)) {
> +            /* SEW > FLEN, f[rs1] is NaN-boxed to SEW bits */
>              tcg_gen_ori_i64(t1, cpu_fpr[a->rs1], MAKE_64BIT_MASK(32, 32));

With my nanbox patch set, RVF-only cpus will *always* have values nanboxed to
64-bits.  So there should be no need to special case this, only provide a
comment noting that RVF and RVD can be treated equally.

> +        } else if ((s->sew < MO_64 && has_ext(s, RVD)) ||
> +                   (s->sew < MO_32)) {
> +            /* SEW < FLEN */
> +            TCGv_i32 sew = tcg_const_i32(1 << (s->sew + 3));
> +            gen_helper_narrower_nanbox_fpr(t1, cpu_fpr[a->rs1], sew, cpu_env);

Use gen_check_nanbox_[sh].


r~

