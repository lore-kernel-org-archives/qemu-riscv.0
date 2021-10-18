Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcLTx-0007z8-4U
	for mharc-qemu-riscv@gnu.org; Mon, 18 Oct 2021 01:46:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mcLTw-0007y5-0n; Mon, 18 Oct 2021 01:46:44 -0400
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129]:37608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mcLTu-0008KV-7Y; Mon, 18 Oct 2021 01:46:43 -0400
Received: by mail-il1-x129.google.com with SMTP id x1so13670042ilv.4;
 Sun, 17 Oct 2021 22:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0waKdUrO8M1X9sxy2g+FYNvHEXEUavQ0avtFprSHbWA=;
 b=DMn56X3n1GByZCrNf7rSSQXdDeLfAnoxjyQo10WexuBKgG9ZhZJmHeKWonJoYFwSOr
 SF3Zc9QxLVC2VETMhJqjGtv20QBM8Vbzp9uwrdBPnUYHRNQHRT13In+HxS2Wtd43ZjK9
 PJyQ1CXmHTtAicIpAcZb+4JDJ4elT7QrULJ5p6t0EB+N4YcgAAoY7XtmmeT0jBBdccIM
 9Py06BhKclY606fs8a06rdCAKmwAz+Z688bMxFu//cvUeMA4ox8Xf3gz0co8eZZ4nPjM
 LDWSVKolUYvmdiiXKut+j/06hfMk75JvU5vVtR4BYwEndAuWOQy0oUDYsPhVUE2QYJOC
 uysA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0waKdUrO8M1X9sxy2g+FYNvHEXEUavQ0avtFprSHbWA=;
 b=BbGLtSF+Oz3FGF/tHELVk/CWizoFvmnMMfwG5jeuRmveymTgYpbcMcPuoEF1HgJ/KM
 oPzT1AXcgZ6zzDmwEWV0T7JpJ2tkrTJw+MeK4ZLSRyVbBMlThHM7feF33E5GH7GIvN+q
 NlUd5Vt2n2rzdm4KoQNRv2E395pE0Km/PTvpHEd5vGAEYwKcHEdmU21mgtd/CC9FPJOx
 uG2z14rowy62rD876jyM9CwNEeuyLohG9P/OwWKi96uf5X2ICSnUrrz9zc6IvAVZFfoy
 3PrqfYyuqXMA83aTLaaPRn4u8mB7NuxBz+RRBWuv8DzRkzvK8VrQGGM+/ztLmc7zrhLK
 c9+w==
X-Gm-Message-State: AOAM532BVW0Jk2PhOOgRTjHsW3JkUThBP1UMOe0DhW8JDkRP0UsOWjnv
 /mpUtfBAZqfI8oPjgn+BX0WLPVPPCz2yApxOKzw=
X-Google-Smtp-Source: ABdhPJwfq0OGYkNySCm3jsmPzWbhrHMcy10YPTkcvUptDIFpThu3iF71wQJdo9UCUstelsfYB7RYE2czRVGRXrCtYu4=
X-Received: by 2002:a05:6e02:1402:: with SMTP id
 n2mr13103517ilo.208.1634535999653; 
 Sun, 17 Oct 2021 22:46:39 -0700 (PDT)
MIME-Version: 1.0
References: <20211015074627.3957162-1-frank.chang@sifive.com>
 <20211015074627.3957162-36-frank.chang@sifive.com>
In-Reply-To: <20211015074627.3957162-36-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 18 Oct 2021 15:46:13 +1000
Message-ID: <CAKmqyKMfRSHTi38Wzf-X+e=zPg0AigYvpRWDk2_0hdUoQnPBLA@mail.gmail.com>
Subject: Re: [PATCH v8 29/78] target/riscv: rvv-1.0: count population in mask
 instruction
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::129;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x129.google.com
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
X-List-Received-Date: Mon, 18 Oct 2021 05:46:44 -0000

On Fri, Oct 15, 2021 at 6:22 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/helper.h                   | 2 +-
>  target/riscv/insn32.decode              | 2 +-
>  target/riscv/insn_trans/trans_rvv.c.inc | 7 ++++---
>  target/riscv/vector_helper.c            | 6 +++---
>  4 files changed, 9 insertions(+), 8 deletions(-)
>
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index b8894d61510..3f30882aec4 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -1020,7 +1020,7 @@ DEF_HELPER_6(vmnor_mm, void, ptr, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_6(vmornot_mm, void, ptr, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_6(vmxnor_mm, void, ptr, ptr, ptr, ptr, env, i32)
>
> -DEF_HELPER_4(vmpopc_m, tl, ptr, ptr, env, i32)
> +DEF_HELPER_4(vcpop_m, tl, ptr, ptr, env, i32)
>
>  DEF_HELPER_4(vmfirst_m, tl, ptr, ptr, env, i32)
>
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index f61eaf7c6ba..e748f7ca714 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -627,7 +627,7 @@ vmor_mm         011010 - ..... ..... 010 ..... 1010111 @r
>  vmnor_mm        011110 - ..... ..... 010 ..... 1010111 @r
>  vmornot_mm      011100 - ..... ..... 010 ..... 1010111 @r
>  vmxnor_mm       011111 - ..... ..... 010 ..... 1010111 @r
> -vmpopc_m        010100 . ..... ----- 010 ..... 1010111 @r2_vm
> +vcpop_m         010000 . ..... 10000 010 ..... 1010111 @r2_vm
>  vmfirst_m       010101 . ..... ----- 010 ..... 1010111 @r2_vm
>  vmsbf_m         010110 . ..... 00001 010 ..... 1010111 @r2_vm
>  vmsif_m         010110 . ..... 00011 010 ..... 1010111 @r2_vm
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 3ba74cdc403..fc17e57d0f7 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -2663,8 +2663,8 @@ GEN_MM_TRANS(vmnor_mm)
>  GEN_MM_TRANS(vmornot_mm)
>  GEN_MM_TRANS(vmxnor_mm)
>
> -/* Vector mask population count vmpopc */
> -static bool trans_vmpopc_m(DisasContext *s, arg_rmr *a)
> +/* Vector count population in mask vcpop */
> +static bool trans_vcpop_m(DisasContext *s, arg_rmr *a)
>  {
>      if (require_rvv(s) &&
>          vext_check_isa_ill(s)) {
> @@ -2683,11 +2683,12 @@ static bool trans_vmpopc_m(DisasContext *s, arg_rmr *a)
>          tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, a->rs2));
>          tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
>
> -        gen_helper_vmpopc_m(dst, mask, src2, cpu_env, desc);
> +        gen_helper_vcpop_m(dst, mask, src2, cpu_env, desc);
>          gen_set_gpr(s, a->rd, dst);
>
>          tcg_temp_free_ptr(mask);
>          tcg_temp_free_ptr(src2);
> +
>          return true;
>      }
>      return false;
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index f9919273dca..9451112b3da 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -4214,9 +4214,9 @@ GEN_VEXT_MASK_VV(vmnor_mm, DO_NOR)
>  GEN_VEXT_MASK_VV(vmornot_mm, DO_ORNOT)
>  GEN_VEXT_MASK_VV(vmxnor_mm, DO_XNOR)
>
> -/* Vector mask population count vmpopc */
> -target_ulong HELPER(vmpopc_m)(void *v0, void *vs2, CPURISCVState *env,
> -                              uint32_t desc)
> +/* Vector count population in mask vcpop */
> +target_ulong HELPER(vcpop_m)(void *v0, void *vs2, CPURISCVState *env,
> +                             uint32_t desc)
>  {
>      target_ulong cnt = 0;
>      uint32_t vm = vext_vm(desc);
> --
> 2.25.1
>
>

