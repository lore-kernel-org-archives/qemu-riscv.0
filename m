Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jFMbq-0003AA-Im
	for mharc-qemu-riscv@gnu.org; Fri, 20 Mar 2020 14:43:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46940)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1jFMbn-00035M-Po
 for qemu-riscv@nongnu.org; Fri, 20 Mar 2020 14:43:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1jFMbm-0000c1-7x
 for qemu-riscv@nongnu.org; Fri, 20 Mar 2020 14:43:03 -0400
Received: from mail-vk1-xa44.google.com ([2607:f8b0:4864:20::a44]:46146)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1jFMbe-0000Zz-95; Fri, 20 Mar 2020 14:42:55 -0400
Received: by mail-vk1-xa44.google.com with SMTP id s139so2007084vka.13;
 Fri, 20 Mar 2020 11:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9QiZckJFhpd07Y6lqebvjbXNhcJYlJbhmyArpO6FNGo=;
 b=W3vojgQgseRQ0ivUK6rPl8FeYn6ukewalY7bwiNU6QXICvsE4G0dmYez3faIk/z9ie
 nqdRYkuwcEw7KMc7SsmpiZwN1PbVaGZK9y9rDPnL+kYDeuNZIMHCcoX/xTjhsADkehbm
 qeXIpNriPvkyccfJZ/ZmEVK0HRnVRvqobB8dldb8lARnbWCja0UtL7odguC9f52MRPlB
 2cdk/suRFTS1qC2iuQtI9dFkrCwFwzSlTGwvZ2VGAWAt0j4Huosoui4vuPK0plIbWoii
 qBtsnt0TRcrjcAL4qgChRZYQ1KLVdV6yKZBuBq5gpp+0YM8RX5q4W/i4XEPlDSSbosSe
 qsbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9QiZckJFhpd07Y6lqebvjbXNhcJYlJbhmyArpO6FNGo=;
 b=T2Nm4OfgWCcV9Cx6+Fr7eyKh98fTHvyGkp5zT9z1W/2soz8P/kMo3Kkrror10mSIje
 EG+kavC2rxxsemTeoMWSla/e1PO0ONusiyL5AD9vu56gxMTrbjGzrea40RThXNkgz8cH
 KlihaY6YrSPGiN8Hz1TV9wiP4FS91jkb7yLsJgtGZfzNR8inNin09QWNK5cuQHl55Tsm
 BqJgyWMF9qNNyY9wczAB4+kVcYtRtoUlLmvRqX3BqHbLNqg6Ek7B/kffEqGAhS79NCVj
 WFz0B3GFK1VUbI4BKM8fSafirz8P9zSbdmKUqtEbixiH2JXh7ka5xbGpGZe4qWH+AIVm
 HJew==
X-Gm-Message-State: ANhLgQ3bB/9ATj+zFwuf+gPXC0p51KYbyJw9y3bBUIxQse0hFzNFB0k3
 WDivarex4InZ67JHwElgHeLLa1DlYxW3k9J7HWc=
X-Google-Smtp-Source: ADFU+vvbZoMhF3pnGuUUf7vMEOIWVU4kZgky/mrn+a31gDLMBmU7c6VSf8JoIPvp4yia66bo4/CFClhBqCo4SeqAo8w=
X-Received: by 2002:a1f:4c86:: with SMTP id z128mr6561141vka.70.1584729773353; 
 Fri, 20 Mar 2020 11:42:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200317150653.9008-1-zhiwei_liu@c-sky.com>
 <20200317150653.9008-14-zhiwei_liu@c-sky.com>
In-Reply-To: <20200317150653.9008-14-zhiwei_liu@c-sky.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 20 Mar 2020 11:34:55 -0700
Message-ID: <CAKmqyKNJBJ6BqfdbMj5_XE3cWwYv0ukfDS2_HiTE7f6s8f7=Zg@mail.gmail.com>
Subject: Re: [PATCH v6 13/61] target/riscv: vector bitwise logical instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Chih-Min Chao <chihmin.chao@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, wenmeng_zhang@c-sky.com,
 wxy194768@alibaba-inc.com, guoren@linux.alibaba.com, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::a44
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
X-List-Received-Date: Fri, 20 Mar 2020 18:43:05 -0000

On Tue, Mar 17, 2020 at 8:33 AM LIU Zhiwei <zhiwei_liu@c-sky.com> wrote:
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/helper.h                   | 25 ++++++++++++
>  target/riscv/insn32.decode              |  9 +++++
>  target/riscv/insn_trans/trans_rvv.inc.c | 11 ++++++
>  target/riscv/vector_helper.c            | 51 +++++++++++++++++++++++++
>  4 files changed, 96 insertions(+)
>
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index 72c733bf49..4373e9e8c2 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -372,3 +372,28 @@ DEF_HELPER_6(vmsbc_vxm_b, void, ptr, ptr, tl, ptr, env, i32)
>  DEF_HELPER_6(vmsbc_vxm_h, void, ptr, ptr, tl, ptr, env, i32)
>  DEF_HELPER_6(vmsbc_vxm_w, void, ptr, ptr, tl, ptr, env, i32)
>  DEF_HELPER_6(vmsbc_vxm_d, void, ptr, ptr, tl, ptr, env, i32)
> +
> +DEF_HELPER_6(vand_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vand_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vand_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vand_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vor_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vor_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vor_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vor_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vxor_vv_b, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vxor_vv_h, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vxor_vv_w, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vxor_vv_d, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vand_vx_b, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vand_vx_h, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vand_vx_w, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vand_vx_d, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vor_vx_b, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vor_vx_h, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vor_vx_w, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vor_vx_d, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vxor_vx_b, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vxor_vx_h, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vxor_vx_w, void, ptr, ptr, tl, ptr, env, i32)
> +DEF_HELPER_6(vxor_vx_d, void, ptr, ptr, tl, ptr, env, i32)
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 022c8ea18b..3ad6724632 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -311,6 +311,15 @@ vsbc_vvm        010010 1 ..... ..... 000 ..... 1010111 @r_vm_1
>  vsbc_vxm        010010 1 ..... ..... 100 ..... 1010111 @r_vm_1
>  vmsbc_vvm       010011 1 ..... ..... 000 ..... 1010111 @r_vm_1
>  vmsbc_vxm       010011 1 ..... ..... 100 ..... 1010111 @r_vm_1
> +vand_vv         001001 . ..... ..... 000 ..... 1010111 @r_vm
> +vand_vx         001001 . ..... ..... 100 ..... 1010111 @r_vm
> +vand_vi         001001 . ..... ..... 011 ..... 1010111 @r_vm
> +vor_vv          001010 . ..... ..... 000 ..... 1010111 @r_vm
> +vor_vx          001010 . ..... ..... 100 ..... 1010111 @r_vm
> +vor_vi          001010 . ..... ..... 011 ..... 1010111 @r_vm
> +vxor_vv         001011 . ..... ..... 000 ..... 1010111 @r_vm
> +vxor_vx         001011 . ..... ..... 100 ..... 1010111 @r_vm
> +vxor_vi         001011 . ..... ..... 011 ..... 1010111 @r_vm
>
>  vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
>  vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
> diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
> index 4562d5f14f..b4ba6d83f3 100644
> --- a/target/riscv/insn_trans/trans_rvv.inc.c
> +++ b/target/riscv/insn_trans/trans_rvv.inc.c
> @@ -1247,3 +1247,14 @@ GEN_OPIVX_TRANS(vmsbc_vxm, opivx_vmadc_check)
>
>  GEN_OPIVI_TRANS(vadc_vim, 0, vadc_vxm, opivx_vadc_check)
>  GEN_OPIVI_TRANS(vmadc_vim, 0, vmadc_vxm, opivx_vmadc_check)
> +
> +/* Vector Bitwise Logical Instructions */
> +GEN_OPIVV_GVEC_TRANS(vand_vv, and)
> +GEN_OPIVV_GVEC_TRANS(vor_vv,  or)
> +GEN_OPIVV_GVEC_TRANS(vxor_vv, xor)
> +GEN_OPIVX_GVEC_TRANS(vand_vx, ands)
> +GEN_OPIVX_GVEC_TRANS(vor_vx,  ors)
> +GEN_OPIVX_GVEC_TRANS(vxor_vx, xors)
> +GEN_OPIVI_GVEC_TRANS(vand_vi, 0, vand_vx, andi)
> +GEN_OPIVI_GVEC_TRANS(vor_vi, 0, vor_vx,  ori)
> +GEN_OPIVI_GVEC_TRANS(vxor_vi, 0, vxor_vx, xori)
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 9913dcbea2..470bf079b2 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -1235,3 +1235,54 @@ GEN_VEXT_VMADC_VXM(vmsbc_vxm_b, uint8_t,  H1, DO_MSBC)
>  GEN_VEXT_VMADC_VXM(vmsbc_vxm_h, uint16_t, H2, DO_MSBC)
>  GEN_VEXT_VMADC_VXM(vmsbc_vxm_w, uint32_t, H4, DO_MSBC)
>  GEN_VEXT_VMADC_VXM(vmsbc_vxm_d, uint64_t, H8, DO_MSBC)
> +
> +/* Vector Bitwise Logical Instructions */
> +RVVCALL(OPIVV2, vand_vv_b, OP_SSS_B, H1, H1, H1, DO_AND)
> +RVVCALL(OPIVV2, vand_vv_h, OP_SSS_H, H2, H2, H2, DO_AND)
> +RVVCALL(OPIVV2, vand_vv_w, OP_SSS_W, H4, H4, H4, DO_AND)
> +RVVCALL(OPIVV2, vand_vv_d, OP_SSS_D, H8, H8, H8, DO_AND)
> +RVVCALL(OPIVV2, vor_vv_b, OP_SSS_B, H1, H1, H1, DO_OR)
> +RVVCALL(OPIVV2, vor_vv_h, OP_SSS_H, H2, H2, H2, DO_OR)
> +RVVCALL(OPIVV2, vor_vv_w, OP_SSS_W, H4, H4, H4, DO_OR)
> +RVVCALL(OPIVV2, vor_vv_d, OP_SSS_D, H8, H8, H8, DO_OR)
> +RVVCALL(OPIVV2, vxor_vv_b, OP_SSS_B, H1, H1, H1, DO_XOR)
> +RVVCALL(OPIVV2, vxor_vv_h, OP_SSS_H, H2, H2, H2, DO_XOR)
> +RVVCALL(OPIVV2, vxor_vv_w, OP_SSS_W, H4, H4, H4, DO_XOR)
> +RVVCALL(OPIVV2, vxor_vv_d, OP_SSS_D, H8, H8, H8, DO_XOR)
> +GEN_VEXT_VV(vand_vv_b, 1, 1, clearb)
> +GEN_VEXT_VV(vand_vv_h, 2, 2, clearh)
> +GEN_VEXT_VV(vand_vv_w, 4, 4, clearl)
> +GEN_VEXT_VV(vand_vv_d, 8, 8, clearq)
> +GEN_VEXT_VV(vor_vv_b, 1, 1, clearb)
> +GEN_VEXT_VV(vor_vv_h, 2, 2, clearh)
> +GEN_VEXT_VV(vor_vv_w, 4, 4, clearl)
> +GEN_VEXT_VV(vor_vv_d, 8, 8, clearq)
> +GEN_VEXT_VV(vxor_vv_b, 1, 1, clearb)
> +GEN_VEXT_VV(vxor_vv_h, 2, 2, clearh)
> +GEN_VEXT_VV(vxor_vv_w, 4, 4, clearl)
> +GEN_VEXT_VV(vxor_vv_d, 8, 8, clearq)
> +
> +RVVCALL(OPIVX2, vand_vx_b, OP_SSS_B, H1, H1, DO_AND)
> +RVVCALL(OPIVX2, vand_vx_h, OP_SSS_H, H2, H2, DO_AND)
> +RVVCALL(OPIVX2, vand_vx_w, OP_SSS_W, H4, H4, DO_AND)
> +RVVCALL(OPIVX2, vand_vx_d, OP_SSS_D, H8, H8, DO_AND)
> +RVVCALL(OPIVX2, vor_vx_b, OP_SSS_B, H1, H1, DO_OR)
> +RVVCALL(OPIVX2, vor_vx_h, OP_SSS_H, H2, H2, DO_OR)
> +RVVCALL(OPIVX2, vor_vx_w, OP_SSS_W, H4, H4, DO_OR)
> +RVVCALL(OPIVX2, vor_vx_d, OP_SSS_D, H8, H8, DO_OR)
> +RVVCALL(OPIVX2, vxor_vx_b, OP_SSS_B, H1, H1, DO_XOR)
> +RVVCALL(OPIVX2, vxor_vx_h, OP_SSS_H, H2, H2, DO_XOR)
> +RVVCALL(OPIVX2, vxor_vx_w, OP_SSS_W, H4, H4, DO_XOR)
> +RVVCALL(OPIVX2, vxor_vx_d, OP_SSS_D, H8, H8, DO_XOR)
> +GEN_VEXT_VX(vand_vx_b, 1, 1, clearb)
> +GEN_VEXT_VX(vand_vx_h, 2, 2, clearh)
> +GEN_VEXT_VX(vand_vx_w, 4, 4, clearl)
> +GEN_VEXT_VX(vand_vx_d, 8, 8, clearq)
> +GEN_VEXT_VX(vor_vx_b, 1, 1, clearb)
> +GEN_VEXT_VX(vor_vx_h, 2, 2, clearh)
> +GEN_VEXT_VX(vor_vx_w, 4, 4, clearl)
> +GEN_VEXT_VX(vor_vx_d, 8, 8, clearq)
> +GEN_VEXT_VX(vxor_vx_b, 1, 1, clearb)
> +GEN_VEXT_VX(vxor_vx_h, 2, 2, clearh)
> +GEN_VEXT_VX(vxor_vx_w, 4, 4, clearl)
> +GEN_VEXT_VX(vxor_vx_d, 8, 8, clearq)
> --
> 2.23.0
>

