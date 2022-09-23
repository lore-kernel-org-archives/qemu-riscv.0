Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1obalY-0001ak-Q7
	for mharc-qemu-riscv@gnu.org; Fri, 23 Sep 2022 00:58:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1obalX-0001aX-Er; Fri, 23 Sep 2022 00:58:19 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:35723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1obalV-0001Ma-97; Fri, 23 Sep 2022 00:58:18 -0400
Received: by mail-pf1-x432.google.com with SMTP id e5so11351045pfl.2;
 Thu, 22 Sep 2022 21:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=L77KLA6Iwclf6ikWrxNPx9lOc4W9fjOk2l4D0yIuELM=;
 b=gsnMnZWlkRM30kMirUq2+H0Cr1rRNMcGvEERFlnrvoUGNV/qB7iKptUneiWHFXO/o0
 ZP0pNq3ESa7Asog4lZKBEI1iHDsr/sMHBflaU3YjQJjPmTObFllQMWWbCWV1Y/J8vznp
 Kli6ASJNAH6bJoLEz5IrnX08PIL1nRhYaLL+OMFqECwHE70D+S8cxYn4HG4G2QlZVkZ/
 tQcWWFzgWhRUO9blWyupw4al75s0IHjiQ6DC+tWAU2onTr0CNL7pczIUHoTbMLegvyQB
 A1oyRKJ4QZuPT9h6sp6lEDQ6kkvNv/8OE6o6z074/mr7ndYyFQPqzm0tYp1aY/RJcDcB
 YAyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=L77KLA6Iwclf6ikWrxNPx9lOc4W9fjOk2l4D0yIuELM=;
 b=C5Qmxy/VRSWRsg5o1qqphZGrDCDGkUKoB6I3uAuVwPtHQazEhED4Z+gR5aVLMVKHML
 X132QOOcLch973+EtXNmg1z2Lo7da5Hc+25S6pqonzglsg2EKGGR62SR5yAbjHoH16fE
 ubRSE7FC1oLK+o67elIoNcxXLar58inZ4ONe2Ww83lfq9Guhf/wnOeg9pYCCFYkyF5Gy
 ecYGGMj7FgFDOYNI6WB4HP1VgD40ARCi6PXxfVYBdWqSR11f01VuIqUTM30S6g/QEQY3
 xf2FxOJdeSnAvUfrzvXHl6lX+14bUjZMgZYCq2S0G0dUGRB4xwXL9erDbBvu+IuZq9WC
 QfWw==
X-Gm-Message-State: ACrzQf0aJSBx18KKOElU2C8mgIgJ6jleF2DcgMdvet7CAoteePW/UsQ1
 lb/xZkMaiwh4m/ipt/HYGQxFGP+535Jwi1oH8K4=
X-Google-Smtp-Source: AMsMyM5MKH9IwZt4ZaBT142+0BDVbOQWYeL0fFzmBIU0woRsvQyeA2r7OJojuZqU+WXqToa4vRCZ2TK/sOLXZ9d2zEg=
X-Received: by 2002:a63:db07:0:b0:439:2e24:df01 with SMTP id
 e7-20020a63db07000000b004392e24df01mr6035289pgg.221.1663909095464; Thu, 22
 Sep 2022 21:58:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220817074802.20765-1-liuyang22@iscas.ac.cn>
 <20220817074802.20765-2-liuyang22@iscas.ac.cn>
In-Reply-To: <20220817074802.20765-2-liuyang22@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 23 Sep 2022 14:57:48 +1000
Message-ID: <CAKmqyKPZrbWtFexry31RmpfTC4RLChW2eKcSrmwB0p3DMrORXg@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/riscv: rvv-1.0: vf[w]redsum distinguish
 between ordered/unordered
To: Yang Liu <liuyang22@iscas.ac.cn>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 liweiwei <liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=alistair23@gmail.com; helo=mail-pf1-x432.google.com
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
X-List-Received-Date: Fri, 23 Sep 2022 04:58:19 -0000

On Thu, Aug 18, 2022 at 1:43 AM Yang Liu <liuyang22@iscas.ac.cn> wrote:
>
> Starting with RVV1.0, the original vf[w]redsum_vs instruction was renamed
> to vf[w]redusum_vs. The distinction between ordered and unordered is also
> more consistent with other instructions, although there is no difference
> in implementation between the two for QEMU.
>
> Signed-off-by: Yang Liu <liuyang22@iscas.ac.cn>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/helper.h                   | 15 ++++++++++-----
>  target/riscv/insn32.decode              |  6 ++++--
>  target/riscv/insn_trans/trans_rvv.c.inc |  6 ++++--
>  target/riscv/vector_helper.c            | 19 +++++++++++++------
>  4 files changed, 31 insertions(+), 15 deletions(-)
>
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index 4ef3b2251d..a03014fe67 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -1009,9 +1009,12 @@ DEF_HELPER_6(vwredsum_vs_b, void, ptr, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_6(vwredsum_vs_h, void, ptr, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_6(vwredsum_vs_w, void, ptr, ptr, ptr, ptr, env, i32)
>
> -DEF_HELPER_6(vfredsum_vs_h, void, ptr, ptr, ptr, ptr, env, i32)
> -DEF_HELPER_6(vfredsum_vs_w, void, ptr, ptr, ptr, ptr, env, i32)
> -DEF_HELPER_6(vfredsum_vs_d, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vfredusum_vs_h, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vfredusum_vs_w, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vfredusum_vs_d, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vfredosum_vs_h, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vfredosum_vs_w, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vfredosum_vs_d, void, ptr, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_6(vfredmax_vs_h, void, ptr, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_6(vfredmax_vs_w, void, ptr, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_6(vfredmax_vs_d, void, ptr, ptr, ptr, ptr, env, i32)
> @@ -1019,8 +1022,10 @@ DEF_HELPER_6(vfredmin_vs_h, void, ptr, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_6(vfredmin_vs_w, void, ptr, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_6(vfredmin_vs_d, void, ptr, ptr, ptr, ptr, env, i32)
>
> -DEF_HELPER_6(vfwredsum_vs_h, void, ptr, ptr, ptr, ptr, env, i32)
> -DEF_HELPER_6(vfwredsum_vs_w, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vfwredusum_vs_h, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vfwredusum_vs_w, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vfwredosum_vs_h, void, ptr, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_6(vfwredosum_vs_w, void, ptr, ptr, ptr, ptr, env, i32)
>
>  DEF_HELPER_6(vmand_mm, void, ptr, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_6(vmnand_mm, void, ptr, ptr, ptr, ptr, env, i32)
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 4033565393..2873a7ae04 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -659,11 +659,13 @@ vredmax_vs      000111 . ..... ..... 010 ..... 1010111 @r_vm
>  vwredsumu_vs    110000 . ..... ..... 000 ..... 1010111 @r_vm
>  vwredsum_vs     110001 . ..... ..... 000 ..... 1010111 @r_vm
>  # Vector ordered and unordered reduction sum
> -vfredsum_vs     0000-1 . ..... ..... 001 ..... 1010111 @r_vm
> +vfredusum_vs    000001 . ..... ..... 001 ..... 1010111 @r_vm
> +vfredosum_vs    000011 . ..... ..... 001 ..... 1010111 @r_vm
>  vfredmin_vs     000101 . ..... ..... 001 ..... 1010111 @r_vm
>  vfredmax_vs     000111 . ..... ..... 001 ..... 1010111 @r_vm
>  # Vector widening ordered and unordered float reduction sum
> -vfwredsum_vs    1100-1 . ..... ..... 001 ..... 1010111 @r_vm
> +vfwredusum_vs   110001 . ..... ..... 001 ..... 1010111 @r_vm
> +vfwredosum_vs   110011 . ..... ..... 001 ..... 1010111 @r_vm
>  vmand_mm        011001 - ..... ..... 010 ..... 1010111 @r
>  vmnand_mm       011101 - ..... ..... 010 ..... 1010111 @r
>  vmandn_mm       011000 - ..... ..... 010 ..... 1010111 @r
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 6c091824b6..9c9de17f8a 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -3112,7 +3112,8 @@ static bool freduction_check(DisasContext *s, arg_rmrr *a)
>             require_zve64f(s);
>  }
>
> -GEN_OPFVV_TRANS(vfredsum_vs, freduction_check)
> +GEN_OPFVV_TRANS(vfredusum_vs, freduction_check)
> +GEN_OPFVV_TRANS(vfredosum_vs, freduction_check)
>  GEN_OPFVV_TRANS(vfredmax_vs, freduction_check)
>  GEN_OPFVV_TRANS(vfredmin_vs, freduction_check)
>
> @@ -3124,7 +3125,8 @@ static bool freduction_widen_check(DisasContext *s, arg_rmrr *a)
>             (s->sew != MO_8);
>  }
>
> -GEN_OPFVV_WIDEN_TRANS(vfwredsum_vs, freduction_widen_check)
> +GEN_OPFVV_WIDEN_TRANS(vfwredusum_vs, freduction_widen_check)
> +GEN_OPFVV_WIDEN_TRANS(vfwredosum_vs, freduction_widen_check)
>
>  /*
>   *** Vector Mask Operations
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index fd83c0b20b..d87f79ad82 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -4641,9 +4641,14 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,           \
>  }
>
>  /* Unordered sum */
> -GEN_VEXT_FRED(vfredsum_vs_h, uint16_t, uint16_t, H2, H2, float16_add)
> -GEN_VEXT_FRED(vfredsum_vs_w, uint32_t, uint32_t, H4, H4, float32_add)
> -GEN_VEXT_FRED(vfredsum_vs_d, uint64_t, uint64_t, H8, H8, float64_add)
> +GEN_VEXT_FRED(vfredusum_vs_h, uint16_t, uint16_t, H2, H2, float16_add)
> +GEN_VEXT_FRED(vfredusum_vs_w, uint32_t, uint32_t, H4, H4, float32_add)
> +GEN_VEXT_FRED(vfredusum_vs_d, uint64_t, uint64_t, H8, H8, float64_add)
> +
> +/* Ordered sum */
> +GEN_VEXT_FRED(vfredosum_vs_h, uint16_t, uint16_t, H2, H2, float16_add)
> +GEN_VEXT_FRED(vfredosum_vs_w, uint32_t, uint32_t, H4, H4, float32_add)
> +GEN_VEXT_FRED(vfredosum_vs_d, uint64_t, uint64_t, H8, H8, float64_add)
>
>  /* Maximum value */
>  GEN_VEXT_FRED(vfredmax_vs_h, uint16_t, uint16_t, H2, H2, float16_maximum_number)
> @@ -4667,9 +4672,11 @@ static uint64_t fwadd32(uint64_t a, uint32_t b, float_status *s)
>  }
>
>  /* Vector Widening Floating-Point Reduction Instructions */
> -/* Unordered reduce 2*SEW = 2*SEW + sum(promote(SEW)) */
> -GEN_VEXT_FRED(vfwredsum_vs_h, uint32_t, uint16_t, H4, H2, fwadd16)
> -GEN_VEXT_FRED(vfwredsum_vs_w, uint64_t, uint32_t, H8, H4, fwadd32)
> +/* Ordered/unordered reduce 2*SEW = 2*SEW + sum(promote(SEW)) */
> +GEN_VEXT_FRED(vfwredusum_vs_h, uint32_t, uint16_t, H4, H2, fwadd16)
> +GEN_VEXT_FRED(vfwredusum_vs_w, uint64_t, uint32_t, H8, H4, fwadd32)
> +GEN_VEXT_FRED(vfwredosum_vs_h, uint32_t, uint16_t, H4, H2, fwadd16)
> +GEN_VEXT_FRED(vfwredosum_vs_w, uint64_t, uint32_t, H8, H4, fwadd32)
>
>  /*
>   *** Vector Mask Operations
> --
> 2.30.1 (Apple Git-130)
>
>

