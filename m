Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcLUp-0000Vu-Cp
	for mharc-qemu-riscv@gnu.org; Mon, 18 Oct 2021 01:47:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mcLUl-0000Sp-Ut; Mon, 18 Oct 2021 01:47:36 -0400
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:35496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mcLUk-0000ax-CU; Mon, 18 Oct 2021 01:47:35 -0400
Received: by mail-io1-xd33.google.com with SMTP id h196so14886222iof.2;
 Sun, 17 Oct 2021 22:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N/o4hOtBnp4OcDbI4A9vINEOTuctWyV7yUv2yKjVbPo=;
 b=OQ18r/cR6/urcSNfCwYYxBjddakZlH7+H7rCigksUdEF7kJN7yX/+qTYW5P+xVRYi4
 iWHYspn52mn297/Fph2qYR6khdrDI+QZD671u91oVdzsOrC90lib+QM8gIixT5OFZ8eJ
 9xov/4UJQQRvgZM94mnfFxjhh/AF8nGhsfBcBncDUjNSShurWgkh48L6HE2WYDEolsMn
 YdMv6GAPEbiFFVJaei/C0iiJiRw/zPIgwkl0bEbJq+q+0FsAyX4aoKb/7Z33gGQ0CTdF
 6QvvdaEpkx+54hcsUJB5n18d5xP5jHE6FDgeyCL0N72ns/LD41qk6NjI20IZb3TskJ0S
 8/Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N/o4hOtBnp4OcDbI4A9vINEOTuctWyV7yUv2yKjVbPo=;
 b=Fz+nGzkHmneMHxeANnrxB9zr0Nyqny24TRM1Uy2AWEFInUQ6s+/EkJbx290x4xoCyy
 R1qItC8eOrWXgNGvdgpwtdbK3xarPk3j6Z/eSm0jHI8c6mhIMGB54DkSod/JzF8Q7hTS
 Uq2pbos9EXBwYO4Dk2dpjupG0zEi1vzECpb2XDyyTd8aJ2WBBOhOzZKzCIBaS/kFV0B8
 eMApd358WRGipuCORcW5IuPvaEuenOUphy7sQUBa1DwB29D5Zxyv/YBGIcAHcXk9R+CU
 e/iEvVzgR5Zw4GVxOzV5/uigcjYY/3MDgoTSGfXGOhjX7qTZK+hKqfs9ZTcZsULP9/7D
 yAGg==
X-Gm-Message-State: AOAM53019PtQ9RL562/vZi+sD8989kQl1N/Wh1G4iqUbwe5EcfafS4ra
 +/wYbvacWAL5Q1M7duhP+xw1ag4LKbgQTw7yL1c=
X-Google-Smtp-Source: ABdhPJxEi7aSKcRb9VpFJGRJ9/4uCXr8gIqEiNHtfduoYnMG/6+963kdSwTLFMQvsaP+bzXzKqoo+Vd8Ng/FzZvg31Q=
X-Received: by 2002:a6b:8d4a:: with SMTP id p71mr12955070iod.16.1634536052712; 
 Sun, 17 Oct 2021 22:47:32 -0700 (PDT)
MIME-Version: 1.0
References: <20211015074627.3957162-1-frank.chang@sifive.com>
 <20211015074627.3957162-38-frank.chang@sifive.com>
In-Reply-To: <20211015074627.3957162-38-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 18 Oct 2021 15:47:06 +1000
Message-ID: <CAKmqyKOuD50pBpSwwRhCvYHAZErpx22Kmpp7+5SW8yORBTYeyA@mail.gmail.com>
Subject: Re: [PATCH v8 30/78] target/riscv: rvv-1.0: find-first-set mask bit
 instruction
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd33.google.com
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
X-List-Received-Date: Mon, 18 Oct 2021 05:47:37 -0000

On Fri, Oct 15, 2021 at 6:03 PM <frank.chang@sifive.com> wrote:
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
>  target/riscv/insn_trans/trans_rvv.c.inc | 4 ++--
>  target/riscv/vector_helper.c            | 6 +++---
>  4 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index 3f30882aec4..7646567eb27 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -1022,7 +1022,7 @@ DEF_HELPER_6(vmxnor_mm, void, ptr, ptr, ptr, ptr, env, i32)
>
>  DEF_HELPER_4(vcpop_m, tl, ptr, ptr, env, i32)
>
> -DEF_HELPER_4(vmfirst_m, tl, ptr, ptr, env, i32)
> +DEF_HELPER_4(vfirst_m, tl, ptr, ptr, env, i32)
>
>  DEF_HELPER_5(vmsbf_m, void, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_5(vmsif_m, void, ptr, ptr, ptr, env, i32)
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index e748f7ca714..4df2aa9cddc 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -628,7 +628,7 @@ vmnor_mm        011110 - ..... ..... 010 ..... 1010111 @r
>  vmornot_mm      011100 - ..... ..... 010 ..... 1010111 @r
>  vmxnor_mm       011111 - ..... ..... 010 ..... 1010111 @r
>  vcpop_m         010000 . ..... 10000 010 ..... 1010111 @r2_vm
> -vmfirst_m       010101 . ..... ----- 010 ..... 1010111 @r2_vm
> +vfirst_m        010000 . ..... 10001 010 ..... 1010111 @r2_vm
>  vmsbf_m         010110 . ..... 00001 010 ..... 1010111 @r2_vm
>  vmsif_m         010110 . ..... 00011 010 ..... 1010111 @r2_vm
>  vmsof_m         010110 . ..... 00010 010 ..... 1010111 @r2_vm
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index fc17e57d0f7..5376adca60c 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -2695,7 +2695,7 @@ static bool trans_vcpop_m(DisasContext *s, arg_rmr *a)
>  }
>
>  /* vmfirst find-first-set mask bit */
> -static bool trans_vmfirst_m(DisasContext *s, arg_rmr *a)
> +static bool trans_vfirst_m(DisasContext *s, arg_rmr *a)
>  {
>      if (require_rvv(s) &&
>          vext_check_isa_ill(s)) {
> @@ -2714,7 +2714,7 @@ static bool trans_vmfirst_m(DisasContext *s, arg_rmr *a)
>          tcg_gen_addi_ptr(src2, cpu_env, vreg_ofs(s, a->rs2));
>          tcg_gen_addi_ptr(mask, cpu_env, vreg_ofs(s, 0));
>
> -        gen_helper_vmfirst_m(dst, mask, src2, cpu_env, desc);
> +        gen_helper_vfirst_m(dst, mask, src2, cpu_env, desc);
>          gen_set_gpr(s, a->rd, dst);
>
>          tcg_temp_free_ptr(mask);
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 9451112b3da..f97783acf05 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -4233,9 +4233,9 @@ target_ulong HELPER(vcpop_m)(void *v0, void *vs2, CPURISCVState *env,
>      return cnt;
>  }
>
> -/* vmfirst find-first-set mask bit*/
> -target_ulong HELPER(vmfirst_m)(void *v0, void *vs2, CPURISCVState *env,
> -                               uint32_t desc)
> +/* vfirst find-first-set mask bit*/
> +target_ulong HELPER(vfirst_m)(void *v0, void *vs2, CPURISCVState *env,
> +                              uint32_t desc)
>  {
>      uint32_t vm = vext_vm(desc);
>      uint32_t vl = env->vl;
> --
> 2.25.1
>
>

