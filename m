Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ocZ0j-0002Pz-2N
	for mharc-qemu-riscv@gnu.org; Sun, 25 Sep 2022 17:18:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ocZ0g-0002PN-5a; Sun, 25 Sep 2022 17:17:58 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:42941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ocZ0e-0005ip-1L; Sun, 25 Sep 2022 17:17:57 -0400
Received: by mail-pg1-x52d.google.com with SMTP id t190so4914830pgd.9;
 Sun, 25 Sep 2022 14:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=cZFkj9U9HTiuKfZKwI8IMmICHNGXB5KA5vY0fa+UIk0=;
 b=J7PVXE4jJKxOStrKV9hdSw7y9K3RW14hhdZkceyfJPqenrsWXd+Bn2O3+UHlXdk8iU
 KQbTsVqyLW6MHpNKY4JLcM/kvp1usp8z12XXm1fZ8lTDd9g5uUvn5TkL8nPxHvKjDxLB
 ck1XXEs94oF7eMD+8vyrWMnAbtlPlvoCc3aP7gjHn4d3EgQ/Ch9DtP/s/+8++3pRRJKz
 5/yPytr/N/HLdk+PgC3mQAxowpoZZYLEeO7t9+IBm4mwF4cBNXnAVomHMKkNHfEKPqbl
 MpDh+1kV9I9FGSlif22jVhMmAFZRwo5QnaxXFSWFrpW22BnHebNe0jW4bST14RtBPoeL
 ZMAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=cZFkj9U9HTiuKfZKwI8IMmICHNGXB5KA5vY0fa+UIk0=;
 b=jgSWPoUvTy9YcdVjc0Oyn13vw8BQd1WVIQTF70Nhm83CreC+V8h7JJic4P8f9LRBBS
 0HP2dBKSspUHSPIJQROKs+pXhqYv5lPidn7X2oa5ajFc8yBnW9ptPmnb7JIog/cqjOWW
 tNrD65TQ1jJ9xHzMUH0IFCgIu8/0Mxe7UWmXgmwf1qune/IPuBGsFVLvd4erfGSB4X8+
 Jj21XufyhIHafZMN57AbmO9JOlxPdipbG3V9lOYqbBUDBr0hDk6XcgcJcbbtIjDMB3eK
 CIv3xdLGOw8AleTeT9JUDvcgODylRIvZwX4mPL+CiBwCFMbAY1Tx6CUBsuOna1SERTU6
 palg==
X-Gm-Message-State: ACrzQf1gt83cHd2EOKWHRx++F7OAyHV/MW/hwBNQxjLUIwKuu9Kt0Hhb
 5FZ8iB4BZL++WVwpvCORjmxdzDRcP83IfIStzFs=
X-Google-Smtp-Source: AMsMyM5T8fIYvyT8gK35Cu8fsDoPN3rbQawU/Bqy0GSO64G7+l3Kfh3fqbMRZH3sg74lR8BTBEJ/uVQSzV6gfrUdJFs=
X-Received: by 2002:a63:db07:0:b0:439:2e24:df01 with SMTP id
 e7-20020a63db07000000b004392e24df01mr17126476pgg.221.1664140672012; Sun, 25
 Sep 2022 14:17:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220817074802.20765-1-liuyang22@iscas.ac.cn>
 <20220817074802.20765-2-liuyang22@iscas.ac.cn>
In-Reply-To: <20220817074802.20765-2-liuyang22@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 26 Sep 2022 07:17:25 +1000
Message-ID: <CAKmqyKN3Drh9iduHyaJWsiHY69rSR8Od6ST2YCzA+E62662ALA@mail.gmail.com>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x52d.google.com
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
X-List-Received-Date: Sun, 25 Sep 2022 21:17:58 -0000

On Thu, Aug 18, 2022 at 1:43 AM Yang Liu <liuyang22@iscas.ac.cn> wrote:
>
> Starting with RVV1.0, the original vf[w]redsum_vs instruction was renamed
> to vf[w]redusum_vs. The distinction between ordered and unordered is also
> more consistent with other instructions, although there is no difference
> in implementation between the two for QEMU.
>
> Signed-off-by: Yang Liu <liuyang22@iscas.ac.cn>

Thanks!

Applied to riscv-to-apply.next

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

