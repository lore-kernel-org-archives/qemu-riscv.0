Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1obaeJ-0006M6-5h
	for mharc-qemu-riscv@gnu.org; Fri, 23 Sep 2022 00:50:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1obaeF-0006Kp-Nx; Fri, 23 Sep 2022 00:50:47 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:44005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1obaeB-0008V2-OE; Fri, 23 Sep 2022 00:50:47 -0400
Received: by mail-pf1-x434.google.com with SMTP id d82so11292481pfd.10;
 Thu, 22 Sep 2022 21:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=2woa+WPc4x9Ej19NiAeBmOOGZF9dSMMEsUnjDEqmbmg=;
 b=A6Hkui1tHz6QYCS5MvvgYHrr0sER0scmUCYrm9Osjxsw28uzn0OBzZI1khy67A2x7E
 R61fAo+eRU1ZYSGjA18vkZyDIZngfGyKWFe6gigfjxnTn7XFaXjyHo4ccHcPsVUvvuyk
 h1deC6RBG+QE5ze97aYXUF3rpUo7HUXaNK2hfNso2nGP+dp1vNlv65jKag9WXMTGicKz
 tEdSne/muIISASKvBjvCSc7z/CMFpbh/229ZeRpnZJO4hr/0ImjVBLlVMuwapE5BpBeG
 PXXR18dYxGi4Jrwtn/x+6Ie1wecXeI4fleL5UU7hNaL6sbAlvAxtyrMJ0itdmhmkh/cf
 bQlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=2woa+WPc4x9Ej19NiAeBmOOGZF9dSMMEsUnjDEqmbmg=;
 b=QiC8gdSQCP/wK/drtNHtd6ilAFAFHFWOrKtaqC3r/z9CVpqddxbv4kJQI13pPbuxzU
 5lk4kKDa2Q8HRPPtnHf4NSiG4I+Y+9w5IYEXokBDr4U7JKg7+Buq3QPj7ObMouUdbYwd
 z6fp+UGta9rrYdYdhxW0a5fsmbsyvh/q+4lcnggX4m7JFij3WlU9l1+xJrGRro4aHweg
 t+RpDxFjOQPmry2QVvnhAqxBJ0zxxloCQhlxu21JTa6ASjYynrDbcx0J3I7575MmqZSp
 YrXYPyjMngHbJ09kcOWyaCpzz/yuDY4VOL32E3fy4l2n33DGEu/rpYVCf6M+jt6DEf6L
 VQug==
X-Gm-Message-State: ACrzQf0VX4cZBFPG32nymjXeI+SG0qzkFYrxOvEKLOoPHlB/m7YMyzj/
 QwaTjUsdmZupM7gRK+0waoRyzrGjFPGZf/l0Cls=
X-Google-Smtp-Source: AMsMyM5mprpMSBxiGBsrDNxszUXnwubHNHA3dsJFY8rrBqeXpCYR5r6Rt5wo6U+h+/Gvxg96kMH0nrtHYIeUdkfzbDw=
X-Received: by 2002:a63:1e03:0:b0:439:868c:8a7c with SMTP id
 e3-20020a631e03000000b00439868c8a7cmr5981528pge.406.1663908641421; Thu, 22
 Sep 2022 21:50:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220817074802.20765-1-liuyang22@iscas.ac.cn>
In-Reply-To: <20220817074802.20765-1-liuyang22@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 23 Sep 2022 14:50:15 +1000
Message-ID: <CAKmqyKM+6hB6y64DXrKThiHtz-qegdeGhcgihe=WWwPGY9OkKA@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/riscv: rvv-1.0: Simplify vfwredsum code
To: Yang Liu <liuyang22@iscas.ac.cn>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wangjunqiang <wangjunqiang@iscas.ac.cn>, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 liweiwei <liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=alistair23@gmail.com; helo=mail-pf1-x434.google.com
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
X-List-Received-Date: Fri, 23 Sep 2022 04:50:48 -0000

On Thu, Aug 18, 2022 at 1:57 AM Yang Liu <liuyang22@iscas.ac.cn> wrote:
>
> Remove duplicate code by wrapping vfwredsum_vs's OP function.
>
> Signed-off-by: Yang Liu <liuyang22@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/vector_helper.c | 56 +++++++-----------------------------
>  1 file changed, 10 insertions(+), 46 deletions(-)
>
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index a96fc49c71..fd83c0b20b 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -4655,58 +4655,22 @@ GEN_VEXT_FRED(vfredmin_vs_h, uint16_t, uint16_t, H2, H2, float16_minimum_number)
>  GEN_VEXT_FRED(vfredmin_vs_w, uint32_t, uint32_t, H4, H4, float32_minimum_number)
>  GEN_VEXT_FRED(vfredmin_vs_d, uint64_t, uint64_t, H8, H8, float64_minimum_number)
>
> -/* Vector Widening Floating-Point Reduction Instructions */
> -/* Unordered reduce 2*SEW = 2*SEW + sum(promote(SEW)) */
> -void HELPER(vfwredsum_vs_h)(void *vd, void *v0, void *vs1,
> -                            void *vs2, CPURISCVState *env, uint32_t desc)
> +/* Vector Widening Floating-Point Add Instructions */
> +static uint32_t fwadd16(uint32_t a, uint16_t b, float_status *s)
>  {
> -    uint32_t vm = vext_vm(desc);
> -    uint32_t vl = env->vl;
> -    uint32_t esz = sizeof(uint32_t);
> -    uint32_t vlenb = simd_maxsz(desc);
> -    uint32_t vta = vext_vta(desc);
> -    uint32_t i;
> -    uint32_t s1 =  *((uint32_t *)vs1 + H4(0));
> -
> -    for (i = env->vstart; i < vl; i++) {
> -        uint16_t s2 = *((uint16_t *)vs2 + H2(i));
> -        if (!vm && !vext_elem_mask(v0, i)) {
> -            continue;
> -        }
> -        s1 = float32_add(s1, float16_to_float32(s2, true, &env->fp_status),
> -                         &env->fp_status);
> -    }
> -    *((uint32_t *)vd + H4(0)) = s1;
> -    env->vstart = 0;
> -    /* set tail elements to 1s */
> -    vext_set_elems_1s(vd, vta, esz, vlenb);
> +    return float32_add(a, float16_to_float32(b, true, s), s);
>  }
>
> -void HELPER(vfwredsum_vs_w)(void *vd, void *v0, void *vs1,
> -                            void *vs2, CPURISCVState *env, uint32_t desc)
> +static uint64_t fwadd32(uint64_t a, uint32_t b, float_status *s)
>  {
> -    uint32_t vm = vext_vm(desc);
> -    uint32_t vl = env->vl;
> -    uint32_t esz = sizeof(uint64_t);
> -    uint32_t vlenb = simd_maxsz(desc);
> -    uint32_t vta = vext_vta(desc);
> -    uint32_t i;
> -    uint64_t s1 =  *((uint64_t *)vs1);
> -
> -    for (i = env->vstart; i < vl; i++) {
> -        uint32_t s2 = *((uint32_t *)vs2 + H4(i));
> -        if (!vm && !vext_elem_mask(v0, i)) {
> -            continue;
> -        }
> -        s1 = float64_add(s1, float32_to_float64(s2, &env->fp_status),
> -                         &env->fp_status);
> -    }
> -    *((uint64_t *)vd) = s1;
> -    env->vstart = 0;
> -    /* set tail elements to 1s */
> -    vext_set_elems_1s(vd, vta, esz, vlenb);
> +    return float64_add(a, float32_to_float64(b, s), s);
>  }
>
> +/* Vector Widening Floating-Point Reduction Instructions */
> +/* Unordered reduce 2*SEW = 2*SEW + sum(promote(SEW)) */
> +GEN_VEXT_FRED(vfwredsum_vs_h, uint32_t, uint16_t, H4, H2, fwadd16)
> +GEN_VEXT_FRED(vfwredsum_vs_w, uint64_t, uint32_t, H8, H4, fwadd32)
> +
>  /*
>   *** Vector Mask Operations
>   */
> --
> 2.30.1 (Apple Git-130)
>
>

