Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nYnzK-0007xD-Nd
	for mharc-qemu-riscv@gnu.org; Mon, 28 Mar 2022 07:56:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nYnzI-0007uA-5a; Mon, 28 Mar 2022 07:56:44 -0400
Received: from smtp23.cstnet.cn ([159.226.251.23]:48984 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nYnzE-0007oO-Nx; Mon, 28 Mar 2022 07:56:43 -0400
Received: from [192.168.3.6] (unknown [180.156.147.178])
 by APP-03 (Coremail) with SMTP id rQCowACHDnduokFiJGgIAA--.27256S2;
 Mon, 28 Mar 2022 19:56:32 +0800 (CST)
Subject: Re: [PATCH qemu v5 05/14] target/riscv: rvv: Add tail agnostic for
 vector load / store instructions
To: ~eopxd <yueh.ting.chen@gmail.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Frank Chang <frank.chang@sifive.com>,
 eop Chen <eop.chen@sifive.com>
References: <164845204233.25323.14607469451359734000-5@git.sr.ht>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <7f3c995d-182f-f1b3-4e79-94f5b81e1be9@iscas.ac.cn>
Date: Mon, 28 Mar 2022 19:56:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <164845204233.25323.14607469451359734000-5@git.sr.ht>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: rQCowACHDnduokFiJGgIAA--.27256S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Wr1UJryrWryxXr4UJFWDurg_yoWxXw15pa
 yxCrWaqrZ3KFyxAw1fZF4UAryrZF4kKw1jkr1Iqr4UGayrGw1vqFWjvF409ry2yrs5Gr4F
 kF17Ar9xua9YyFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
 Y487MxkF7I0Ew4C26cxK6c8Ij28IcwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbV
 WUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF
 67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42
 IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1U
 MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
 VFxhVjvjDU0xZFpf9x0JU2fOwUUUUU=
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.23; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Mon, 28 Mar 2022 11:56:44 -0000


在 2022/3/7 下午3:10, ~eopxd 写道:
> From: eopXD <eop.chen@sifive.com>
>
> Signed-off-by: eop Chen <eop.chen@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> ---
>   target/riscv/insn_trans/trans_rvv.c.inc |  9 +++++++
>   target/riscv/vector_helper.c            | 32 +++++++++++++++++++++++++
>   2 files changed, 41 insertions(+)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index cc80bf00ff..66cfc8c603 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -711,6 +711,7 @@ static bool ld_us_op(DisasContext *s, arg_r2nfvm *a, uint8_t eew)
>       data = FIELD_DP32(data, VDATA, VM, a->vm);
>       data = FIELD_DP32(data, VDATA, LMUL, emul);
>       data = FIELD_DP32(data, VDATA, NF, a->nf);
> +    data = FIELD_DP32(data, VDATA, VTA, s->vta);
>       return ldst_us_trans(a->rd, a->rs1, data, fn, s, false);
>   }
>   
> @@ -748,6 +749,7 @@ static bool st_us_op(DisasContext *s, arg_r2nfvm *a, uint8_t eew)
>       data = FIELD_DP32(data, VDATA, VM, a->vm);
>       data = FIELD_DP32(data, VDATA, LMUL, emul);
>       data = FIELD_DP32(data, VDATA, NF, a->nf);
> +    data = FIELD_DP32(data, VDATA, VTA, s->vta);
>       return ldst_us_trans(a->rd, a->rs1, data, fn, s, true);
>   }
>   
> @@ -774,6 +776,7 @@ static bool ld_us_mask_op(DisasContext *s, arg_vlm_v *a, uint8_t eew)
>       /* EMUL = 1, NFIELDS = 1 */
>       data = FIELD_DP32(data, VDATA, LMUL, 0);
>       data = FIELD_DP32(data, VDATA, NF, 1);
> +    data = FIELD_DP32(data, VDATA, VTA, s->vta);
>       return ldst_us_trans(a->rd, a->rs1, data, fn, s, false);
>   }
>   
> @@ -791,6 +794,7 @@ static bool st_us_mask_op(DisasContext *s, arg_vsm_v *a, uint8_t eew)
>       /* EMUL = 1, NFIELDS = 1 */
>       data = FIELD_DP32(data, VDATA, LMUL, 0);
>       data = FIELD_DP32(data, VDATA, NF, 1);
> +    data = FIELD_DP32(data, VDATA, VTA, s->vta);
>       return ldst_us_trans(a->rd, a->rs1, data, fn, s, true);
>   }
>   
> @@ -862,6 +866,7 @@ static bool ld_stride_op(DisasContext *s, arg_rnfvm *a, uint8_t eew)
>       data = FIELD_DP32(data, VDATA, VM, a->vm);
>       data = FIELD_DP32(data, VDATA, LMUL, emul);
>       data = FIELD_DP32(data, VDATA, NF, a->nf);
> +    data = FIELD_DP32(data, VDATA, VTA, s->vta);
>       return ldst_stride_trans(a->rd, a->rs1, a->rs2, data, fn, s, false);
>   }
>   
> @@ -891,6 +896,7 @@ static bool st_stride_op(DisasContext *s, arg_rnfvm *a, uint8_t eew)
>       data = FIELD_DP32(data, VDATA, VM, a->vm);
>       data = FIELD_DP32(data, VDATA, LMUL, emul);
>       data = FIELD_DP32(data, VDATA, NF, a->nf);
> +    data = FIELD_DP32(data, VDATA, VTA, s->vta);
>       fn = fns[eew];
>       if (fn == NULL) {
>           return false;
> @@ -991,6 +997,7 @@ static bool ld_index_op(DisasContext *s, arg_rnfvm *a, uint8_t eew)
>       data = FIELD_DP32(data, VDATA, VM, a->vm);
>       data = FIELD_DP32(data, VDATA, LMUL, emul);
>       data = FIELD_DP32(data, VDATA, NF, a->nf);
> +    data = FIELD_DP32(data, VDATA, VTA, s->vta);
>       return ldst_index_trans(a->rd, a->rs1, a->rs2, data, fn, s, false);
>   }
>   
> @@ -1043,6 +1050,7 @@ static bool st_index_op(DisasContext *s, arg_rnfvm *a, uint8_t eew)
>       data = FIELD_DP32(data, VDATA, VM, a->vm);
>       data = FIELD_DP32(data, VDATA, LMUL, emul);
>       data = FIELD_DP32(data, VDATA, NF, a->nf);
> +    data = FIELD_DP32(data, VDATA, VTA, s->vta);
>       return ldst_index_trans(a->rd, a->rs1, a->rs2, data, fn, s, true);
>   }
>   
> @@ -1108,6 +1116,7 @@ static bool ldff_op(DisasContext *s, arg_r2nfvm *a, uint8_t eew)
>       data = FIELD_DP32(data, VDATA, VM, a->vm);
>       data = FIELD_DP32(data, VDATA, LMUL, emul);
>       data = FIELD_DP32(data, VDATA, NF, a->nf);
> +    data = FIELD_DP32(data, VDATA, VTA, s->vta);
>       return ldff_trans(a->rd, a->rs1, data, fn, s);
>   }
>   
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 39c79c59c2..1c7015e917 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -289,6 +289,9 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,
>       uint32_t i, k;
>       uint32_t nf = vext_nf(desc);
>       uint32_t max_elems = vext_max_elems(desc, log2_esz);
> +    uint32_t esz = 1 << log2_esz;
> +    uint32_t total_elems = vext_get_total_elems(desc, esz);
> +    uint32_t vta = vext_vta(desc);
>   
>       for (i = env->vstart; i < env->vl; i++, env->vstart++) {
>           if (!vm && !vext_elem_mask(v0, i)) {
> @@ -303,6 +306,11 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,
>           }
>       }
>       env->vstart = 0;
> +    /* set tail elements to 1s */
> +    for (k = 0; k < nf; ++k) {
> +        vext_set_elems_1s_fns[log2_esz](vd, vta, env->vl + k * total_elems,
> +                                        env->vl * esz, total_elems * esz);
> +    }
>   }
>   
>   #define GEN_VEXT_LD_STRIDE(NAME, ETYPE, LOAD_FN)                        \
> @@ -348,6 +356,9 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
>       uint32_t i, k;
>       uint32_t nf = vext_nf(desc);
>       uint32_t max_elems = vext_max_elems(desc, log2_esz);
> +    uint32_t esz = 1 << log2_esz;
> +    uint32_t total_elems = vext_get_total_elems(desc, esz);
> +    uint32_t vta = vext_vta(desc);
>   
>       /* load bytes from guest memory */
>       for (i = env->vstart; i < evl; i++, env->vstart++) {
> @@ -359,6 +370,11 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
>           }
>       }
>       env->vstart = 0;
> +    /* set tail elements to 1s */
> +    for (k = 0; k < nf; ++k) {
> +        vext_set_elems_1s_fns[log2_esz](vd, vta, env->vl + k * total_elems,
> +                                        env->vl * esz, total_elems * esz);
> +    }
>   }
>   

It seems incorrect here. similar to following load/store helper.

In above instructions,  following elements are loaded:

0       *  max_elems          ...     0      *max_elems + vl - 1

1       *  max_elems          ...     1     *max_elems + vl - 1

.......

(nf-1)* max_elems         ...    (nf-1)*max_elems + vl - 1

So,  the elements[vl  .. max_elems  - 1]  are  tail elements, however 
elements[vl ... 1* total_elems - 1] may not:

elements from max_elems to total_elems - 1 are active elements, If 
total_elems > max_elems(LMUL< 1)

Or LMUL should be equal or greater than 1 here? I didn't find any 
description about this from the spec.

I also have another question about the tail elements for these 
load/store instructions:

when nf = 3, LMUL = 1, vl=vlmax,  reg, reg+1, reg+2 will be loaded, then 
whether elements in reg+3

(if they belong to the same register group) are tail elements?

Regards,

Weiwei Li


