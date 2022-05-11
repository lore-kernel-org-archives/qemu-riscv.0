Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nocUU-0008P9-LE
	for mharc-qemu-riscv@gnu.org; Tue, 10 May 2022 22:54:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nocUT-0008Ov-Hn; Tue, 10 May 2022 22:54:17 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:47136 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nocUQ-0006vu-Mn; Tue, 10 May 2022 22:54:17 -0400
Received: from [192.168.3.6] (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowAB3fpJCJXticiW1BQ--.64741S2;
 Wed, 11 May 2022 10:54:07 +0800 (CST)
Subject: Re: [PATCH qemu v2 02/10] target/riscv: rvv: Add mask agnostic for
 vector load / store instructions
To: ~eopxd <yueh.ting.chen@gmail.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Frank Chang <frank.chang@sifive.com>,
 WeiWei Li <liweiwei@iscas.ac.cn>, eop Chen <eop.chen@sifive.com>
References: <165220716770.22380.2493420346587893209-2@git.sr.ht>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <8e6106bf-9b1a-5f3d-fdfe-ab32e8f362ce@iscas.ac.cn>
Date: Wed, 11 May 2022 10:53:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <165220716770.22380.2493420346587893209-2@git.sr.ht>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: zQCowAB3fpJCJXticiW1BQ--.64741S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Wr1UJry8KF4UuFWrJF43Jrb_yoWxAw43pa
 yxGrWaqrZ3KFyfAw1fXF4jyr18Zan7Kw1jkr10qr4UuaykGw4kXFWUtFW8A342yrs8Jr4F
 vF17Zr95ua9YyFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvY14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F
 4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
 7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r
 1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE
 67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrV
 AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCI
 c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267
 AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_
 Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0J
 UkrcfUUUUU=
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.84; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Wed, 11 May 2022 02:54:17 -0000


在 2022/3/17 下午3:47, ~eopxd 写道:
> From: Yueh-Ting (eop) Chen <eop.chen@sifive.com>
>
> Signed-off-by: eop Chen <eop.chen@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> ---
>   target/riscv/insn_trans/trans_rvv.c.inc |  9 +++++++
>   target/riscv/vector_helper.c            | 35 +++++++++++++++++--------
>   2 files changed, 33 insertions(+), 11 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 63ddd54669..9a2d54313a 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -712,6 +712,7 @@ static bool ld_us_op(DisasContext *s, arg_r2nfvm *a, uint8_t eew)
>       data = FIELD_DP32(data, VDATA, LMUL, emul);
>       data = FIELD_DP32(data, VDATA, NF, a->nf);
>       data = FIELD_DP32(data, VDATA, VTA, s->vta);
> +    data = FIELD_DP32(data, VDATA, VMA, s->vma);
>       return ldst_us_trans(a->rd, a->rs1, data, fn, s, false);
>   }
>   
> @@ -750,6 +751,7 @@ static bool st_us_op(DisasContext *s, arg_r2nfvm *a, uint8_t eew)
>       data = FIELD_DP32(data, VDATA, LMUL, emul);
>       data = FIELD_DP32(data, VDATA, NF, a->nf);
>       data = FIELD_DP32(data, VDATA, VTA, s->vta);
> +    data = FIELD_DP32(data, VDATA, VMA, s->vma);
>       return ldst_us_trans(a->rd, a->rs1, data, fn, s, true);
>   }
>   
> @@ -778,6 +780,7 @@ static bool ld_us_mask_op(DisasContext *s, arg_vlm_v *a, uint8_t eew)
>       data = FIELD_DP32(data, VDATA, NF, 1);
>       /* Mask destination register are always tail-agnostic */
>       data = FIELD_DP32(data, VDATA, VTA, s->cfg_vta_all_1s);
> +    data = FIELD_DP32(data, VDATA, VMA, s->vma);
>       return ldst_us_trans(a->rd, a->rs1, data, fn, s, false);
>   }
>   
> @@ -797,6 +800,7 @@ static bool st_us_mask_op(DisasContext *s, arg_vsm_v *a, uint8_t eew)
>       data = FIELD_DP32(data, VDATA, NF, 1);
>       /* Mask destination register are always tail-agnostic */
>       data = FIELD_DP32(data, VDATA, VTA, s->cfg_vta_all_1s);
> +    data = FIELD_DP32(data, VDATA, VMA, s->vma);
>       return ldst_us_trans(a->rd, a->rs1, data, fn, s, true);
>   }
>   
> @@ -869,6 +873,7 @@ static bool ld_stride_op(DisasContext *s, arg_rnfvm *a, uint8_t eew)
>       data = FIELD_DP32(data, VDATA, LMUL, emul);
>       data = FIELD_DP32(data, VDATA, NF, a->nf);
>       data = FIELD_DP32(data, VDATA, VTA, s->vta);
> +    data = FIELD_DP32(data, VDATA, VMA, s->vma);
>       return ldst_stride_trans(a->rd, a->rs1, a->rs2, data, fn, s, false);
>   }
>   
> @@ -899,6 +904,7 @@ static bool st_stride_op(DisasContext *s, arg_rnfvm *a, uint8_t eew)
>       data = FIELD_DP32(data, VDATA, LMUL, emul);
>       data = FIELD_DP32(data, VDATA, NF, a->nf);
>       data = FIELD_DP32(data, VDATA, VTA, s->vta);
> +    data = FIELD_DP32(data, VDATA, VMA, s->vma);
>       fn = fns[eew];
>       if (fn == NULL) {
>           return false;
> @@ -1000,6 +1006,7 @@ static bool ld_index_op(DisasContext *s, arg_rnfvm *a, uint8_t eew)
>       data = FIELD_DP32(data, VDATA, LMUL, emul);
>       data = FIELD_DP32(data, VDATA, NF, a->nf);
>       data = FIELD_DP32(data, VDATA, VTA, s->vta);
> +    data = FIELD_DP32(data, VDATA, VMA, s->vma);
>       return ldst_index_trans(a->rd, a->rs1, a->rs2, data, fn, s, false);
>   }
>   
> @@ -1053,6 +1060,7 @@ static bool st_index_op(DisasContext *s, arg_rnfvm *a, uint8_t eew)
>       data = FIELD_DP32(data, VDATA, LMUL, emul);
>       data = FIELD_DP32(data, VDATA, NF, a->nf);
>       data = FIELD_DP32(data, VDATA, VTA, s->vta);
> +    data = FIELD_DP32(data, VDATA, VMA, s->vma);
>       return ldst_index_trans(a->rd, a->rs1, a->rs2, data, fn, s, true);
>   }
>   
> @@ -1119,6 +1127,7 @@ static bool ldff_op(DisasContext *s, arg_r2nfvm *a, uint8_t eew)
>       data = FIELD_DP32(data, VDATA, LMUL, emul);
>       data = FIELD_DP32(data, VDATA, NF, a->nf);
>       data = FIELD_DP32(data, VDATA, VTA, s->vta);
> +    data = FIELD_DP32(data, VDATA, VMA, s->vma);
>       return ldff_trans(a->rd, a->rs1, data, fn, s);
>   }
>   
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 934b283db2..89eea33eb3 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -282,14 +282,18 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,
>       uint32_t esz = 1 << log2_esz;
>       uint32_t total_elems = vext_get_total_elems(env, desc, esz);
>       uint32_t vta = vext_vta(desc);
> +    uint32_t vma = vext_vma(desc);
>   
>       for (i = env->vstart; i < env->vl; i++, env->vstart++) {
> -        if (!vm && !vext_elem_mask(v0, i)) {
> -            continue;
> -        }
> -
>           k = 0;
>           while (k < nf) {
> +            if (!vm && !vext_elem_mask(v0, i)) {
> +                /* set masked-off elements to 1s */
> +                vext_set_elems_1s(vd, vma,(i + k * max_elems) * esz,
> +                                  (i + k * max_elems + 1) * esz);
> +                k++;
> +                continue;

There is another question here:

this function is reused by load&store. However  vd is used as source for 
store.

So we cannot set it without distinguish load and store here. The same to 
following load&store functions.

Maybe we can set vma to zero for stores(it seems have no effect on the 
function for stores).

Regards,

Weiwei Li

> +            }
>               target_ulong addr = base + stride * i + (k << log2_esz);
>               ldst_elem(env, adjust_addr(env, addr), i + k * max_elems, vd, ra);
>               k++;
> @@ -481,15 +485,19 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
>       uint32_t esz = 1 << log2_esz;
>       uint32_t total_elems = vext_get_total_elems(env, desc, esz);
>       uint32_t vta = vext_vta(desc);
> +    uint32_t vma = vext_vma(desc);
>   
>       /* load bytes from guest memory */
>       for (i = env->vstart; i < env->vl; i++, env->vstart++) {
> -        if (!vm && !vext_elem_mask(v0, i)) {
> -            continue;
> -        }
> -
>           k = 0;
>           while (k < nf) {
> +            if (!vm && !vext_elem_mask(v0, i)) {
> +                /* set masked-off elements to 1s */
> +                vext_set_elems_1s(vd, vma,(i + k * max_elems) * esz,
> +                                  (i + k * max_elems + 1) * esz);
> +                k++;
> +                continue;
> +            }
>               abi_ptr addr = get_index_addr(base, i, vs2) + (k << log2_esz);
>               ldst_elem(env, adjust_addr(env, addr), i + k * max_elems, vd, ra);
>               k++;
> @@ -578,6 +586,7 @@ vext_ldff(void *vd, void *v0, target_ulong base,
>       uint32_t esz = 1 << log2_esz;
>       uint32_t total_elems = vext_get_total_elems(env, desc, esz);
>       uint32_t vta = vext_vta(desc);
> +    uint32_t vma = vext_vma(desc);
>       target_ulong addr, offset, remain;
>   
>       /* probe every access*/
> @@ -623,10 +632,14 @@ ProbeSuccess:
>       }
>       for (i = env->vstart; i < env->vl; i++) {
>           k = 0;
> -        if (!vm && !vext_elem_mask(v0, i)) {
> -            continue;
> -        }
>           while (k < nf) {
> +            if (!vm && !vext_elem_mask(v0, i)) {
> +                /* set masked-off elements to 1s */
> +                vext_set_elems_1s(vd, vma,(i + k * max_elems) * esz,
> +                                  (i + k * max_elems + 1) * esz);
> +                k++;
> +                continue;
> +            }
>               target_ulong addr = base + ((i * nf + k) << log2_esz);
>               ldst_elem(env, adjust_addr(env, addr), i + k * max_elems, vd, ra);
>               k++;


