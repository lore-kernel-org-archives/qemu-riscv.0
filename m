Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1njgH2-00032m-O2
	for mharc-qemu-riscv@gnu.org; Wed, 27 Apr 2022 07:56:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1njgH0-0002zK-0D; Wed, 27 Apr 2022 07:55:58 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:45550 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1njgGw-0005BM-Mn; Wed, 27 Apr 2022 07:55:57 -0400
Received: from [192.168.3.6] (unknown [180.156.147.178])
 by APP-01 (Coremail) with SMTP id qwCowAAHDoY9L2li6W9eAQ--.9094S2;
 Wed, 27 Apr 2022 19:55:42 +0800 (CST)
Subject: Re: [PATCH qemu v9 05/14] target/riscv: rvv: Add tail agnostic for
 vector load / store instructions
To: ~eopxd <yueh.ting.chen@gmail.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: WeiWei Li <liweiwei@iscas.ac.cn>, Frank Chang <frank.chang@sifive.com>,
 eop Chen <eop.chen@sifive.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <165105385811.8013.9841879319865783070-5@git.sr.ht>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <7b28461b-641e-210f-e156-75e02064a61b@iscas.ac.cn>
Date: Wed, 27 Apr 2022 19:55:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <165105385811.8013.9841879319865783070-5@git.sr.ht>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: qwCowAAHDoY9L2li6W9eAQ--.9094S2
X-Coremail-Antispam: 1UD129KBjvJXoWxKry8Zry7Xr1fKw1fCw17Jrb_yoW7GF1kpa
 yxCFWSqr9xKFyxAw1fZF4UAr1rZFs7Kw1jkrn7Xr4UWa95Gw1kXFWUKFW0q342yrs8Gr40
 kF1xZryruasYyFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
 Y487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
 0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y
 0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
 WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8
 JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUF9a9DU
 UUU
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.21; envelope-from=liweiwei@iscas.ac.cn;
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
X-List-Received-Date: Wed, 27 Apr 2022 11:55:58 -0000


在 2022/3/7 下午3:10, ~eopxd 写道:
> From: eopXD <eop.chen@sifive.com>
>
> Destination register of unit-stride mask load and store instructions are
> always written with a tail-agnostic policy.
>
> Signed-off-by: eop Chen <eop.chen@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> ---
>   target/riscv/insn_trans/trans_rvv.c.inc | 11 ++++++++++
>   target/riscv/vector_helper.c            | 28 +++++++++++++++++++++++++
>   2 files changed, 39 insertions(+)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index cc80bf00ff..99691f1b9f 100644
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
> @@ -774,6 +776,8 @@ static bool ld_us_mask_op(DisasContext *s, arg_vlm_v *a, uint8_t eew)
>       /* EMUL = 1, NFIELDS = 1 */
>       data = FIELD_DP32(data, VDATA, LMUL, 0);
>       data = FIELD_DP32(data, VDATA, NF, 1);
> +    /* Mask destination register are always tail-agnostic */
> +    data = FIELD_DP32(data, VDATA, VTA, s->cfg_vta_all_1s);
>       return ldst_us_trans(a->rd, a->rs1, data, fn, s, false);
>   }
>   
> @@ -791,6 +795,8 @@ static bool st_us_mask_op(DisasContext *s, arg_vsm_v *a, uint8_t eew)
>       /* EMUL = 1, NFIELDS = 1 */
>       data = FIELD_DP32(data, VDATA, LMUL, 0);
>       data = FIELD_DP32(data, VDATA, NF, 1);
> +    /* Mask destination register are always tail-agnostic */
> +    data = FIELD_DP32(data, VDATA, VTA, s->cfg_vta_all_1s);
>       return ldst_us_trans(a->rd, a->rs1, data, fn, s, true);
>   }
>   
> @@ -862,6 +868,7 @@ static bool ld_stride_op(DisasContext *s, arg_rnfvm *a, uint8_t eew)
>       data = FIELD_DP32(data, VDATA, VM, a->vm);
>       data = FIELD_DP32(data, VDATA, LMUL, emul);
>       data = FIELD_DP32(data, VDATA, NF, a->nf);
> +    data = FIELD_DP32(data, VDATA, VTA, s->vta);
>       return ldst_stride_trans(a->rd, a->rs1, a->rs2, data, fn, s, false);
>   }
>   
> @@ -891,6 +898,7 @@ static bool st_stride_op(DisasContext *s, arg_rnfvm *a, uint8_t eew)
>       data = FIELD_DP32(data, VDATA, VM, a->vm);
>       data = FIELD_DP32(data, VDATA, LMUL, emul);
>       data = FIELD_DP32(data, VDATA, NF, a->nf);
> +    data = FIELD_DP32(data, VDATA, VTA, s->vta);
>       fn = fns[eew];
>       if (fn == NULL) {
>           return false;
> @@ -991,6 +999,7 @@ static bool ld_index_op(DisasContext *s, arg_rnfvm *a, uint8_t eew)
>       data = FIELD_DP32(data, VDATA, VM, a->vm);
>       data = FIELD_DP32(data, VDATA, LMUL, emul);
>       data = FIELD_DP32(data, VDATA, NF, a->nf);
> +    data = FIELD_DP32(data, VDATA, VTA, s->vta);
>       return ldst_index_trans(a->rd, a->rs1, a->rs2, data, fn, s, false);
>   }
>   
> @@ -1043,6 +1052,7 @@ static bool st_index_op(DisasContext *s, arg_rnfvm *a, uint8_t eew)
>       data = FIELD_DP32(data, VDATA, VM, a->vm);
>       data = FIELD_DP32(data, VDATA, LMUL, emul);
>       data = FIELD_DP32(data, VDATA, NF, a->nf);
> +    data = FIELD_DP32(data, VDATA, VTA, s->vta);
>       return ldst_index_trans(a->rd, a->rs1, a->rs2, data, fn, s, true);
>   }
>   
> @@ -1108,6 +1118,7 @@ static bool ldff_op(DisasContext *s, arg_r2nfvm *a, uint8_t eew)
>       data = FIELD_DP32(data, VDATA, VM, a->vm);
>       data = FIELD_DP32(data, VDATA, LMUL, emul);
>       data = FIELD_DP32(data, VDATA, NF, a->nf);
> +    data = FIELD_DP32(data, VDATA, VTA, s->vta);
>       return ldff_trans(a->rd, a->rs1, data, fn, s);
>   }
>   
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 396e252179..1541d97b08 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -270,6 +270,8 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,
>       uint32_t i, k;
>       uint32_t nf = vext_nf(desc);
>       uint32_t max_elems = vext_max_elems(desc, log2_esz);
> +    uint32_t esz = 1 << log2_esz;
> +    uint32_t vta = vext_vta(desc);
>   
>       for (i = env->vstart; i < env->vl; i++, env->vstart++) {
>           if (!vm && !vext_elem_mask(v0, i)) {
> @@ -284,6 +286,11 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,
>           }
>       }
>       env->vstart = 0;
> +    /* set tail elements to 1s */
> +    for (k = 0; k < nf; ++k) {
> +        vext_set_elems_1s(vd, vta, env->vl * esz + k * max_elems,
> +                          max_elems * esz + k * max_elems);
> +    }
>   }

It seems incorrect here. I think it should be  k * max_elems * esz. The 
same to following similar case.

Otherwise, this patchset looks good to me.

Reviewed-by: Weiwei Li<liweiwei@iscas.ac.cn>

Regards,
Weiwei Li


