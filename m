Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nocEQ-0002kW-H8
	for mharc-qemu-riscv@gnu.org; Tue, 10 May 2022 22:37:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nocEP-0002kB-Az; Tue, 10 May 2022 22:37:41 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:41914 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nocEM-0004g6-Kq; Tue, 10 May 2022 22:37:40 -0400
Received: from [192.168.3.6] (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowAA3PpJrIXtibSO0BQ--.1847S2;
 Wed, 11 May 2022 10:37:31 +0800 (CST)
Subject: Re: [PATCH qemu v2 08/10] target/riscv: rvv: Add mask agnostic for
 vector mask instructions
To: ~eopxd <yueh.ting.chen@gmail.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Frank Chang <frank.chang@sifive.com>,
 WeiWei Li <liweiwei@iscas.ac.cn>, eop Chen <eop.chen@sifive.com>
References: <165220716770.22380.2493420346587893209-8@git.sr.ht>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <78738746-79d9-3ebd-3687-223c3327545d@iscas.ac.cn>
Date: Wed, 11 May 2022 10:37:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <165220716770.22380.2493420346587893209-8@git.sr.ht>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: zQCowAA3PpJrIXtibSO0BQ--.1847S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCr4xAFy5Kr45KF4kJF45trb_yoWrJF43pw
 48KFWaqrZ5tFyfZ3Z5ZF4UAF1UZFs8Kw1UKw1kAws5u3y8Ww4DZF4Dta1Ikry2yF13WF1F
 v3WqvryS939YyFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUv014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F
 4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
 7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r
 1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE
 67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrV
 AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCI
 c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267
 AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_
 Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUb
 rOz3UUUUU==
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
X-List-Received-Date: Wed, 11 May 2022 02:37:41 -0000


在 2022/3/17 下午5:14, ~eopxd 写道:
> From: Yueh-Ting (eop) Chen <eop.chen@sifive.com>
>
> Signed-off-by: eop Chen <eop.chen@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> ---
>   target/riscv/insn_trans/trans_rvv.c.inc |  3 +++
>   target/riscv/vector_helper.c            | 11 +++++++++++
>   2 files changed, 14 insertions(+)


Reviewed-by: Weiwei Li<liweiwei@iscas.ac.cn>

Regards,
Weiwei Li
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 8fb8045957..18ef9949ad 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -3352,6 +3352,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
>           data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
>           data =                                                     \
>               FIELD_DP32(data, VDATA, VTA_ALL_1S, s->cfg_vta_all_1s);\
> +        data = FIELD_DP32(data, VDATA, VMA, s->vma);               \
>           tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd),                     \
>                              vreg_ofs(s, 0), vreg_ofs(s, a->rs2),    \
>                              cpu_env, s->cfg_ptr->vlen / 8,          \
> @@ -3390,6 +3391,7 @@ static bool trans_viota_m(DisasContext *s, arg_viota_m *a)
>           data = FIELD_DP32(data, VDATA, VM, a->vm);
>           data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
>           data = FIELD_DP32(data, VDATA, VTA, s->vta);
> +        data = FIELD_DP32(data, VDATA, VMA, s->vma);
>           static gen_helper_gvec_3_ptr * const fns[4] = {
>               gen_helper_viota_m_b, gen_helper_viota_m_h,
>               gen_helper_viota_m_w, gen_helper_viota_m_d,
> @@ -3420,6 +3422,7 @@ static bool trans_vid_v(DisasContext *s, arg_vid_v *a)
>           data = FIELD_DP32(data, VDATA, VM, a->vm);
>           data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
>           data = FIELD_DP32(data, VDATA, VTA, s->vta);
> +        data = FIELD_DP32(data, VDATA, VMA, s->vma);
>           static gen_helper_gvec_2_ptr * const fns[4] = {
>               gen_helper_vid_v_b, gen_helper_vid_v_h,
>               gen_helper_vid_v_w, gen_helper_vid_v_d,
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 5b9d766e0e..8f95e286e8 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -4881,11 +4881,16 @@ static void vmsetm(void *vd, void *v0, void *vs2, CPURISCVState *env,
>       uint32_t vl = env->vl;
>       uint32_t total_elems = env_archcpu(env)->cfg.vlen;
>       uint32_t vta_all_1s = vext_vta_all_1s(desc);
> +    uint32_t vma = vext_vma(desc);
>       int i;
>       bool first_mask_bit = false;
>   
>       for (i = env->vstart; i < vl; i++) {
>           if (!vm && !vext_elem_mask(v0, i)) {
> +            /* set masked-off elements to 1s */
> +            if (vma) {
> +                vext_set_elem_mask(vd, i, 1);
> +            }
>               continue;
>           }
>           /* write a zero to all following active elements */
> @@ -4946,11 +4951,14 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2, CPURISCVState *env,      \
>       uint32_t esz = sizeof(ETYPE);                                         \
>       uint32_t total_elems = vext_get_total_elems(env, desc, esz);          \
>       uint32_t vta = vext_vta(desc);                                        \
> +    uint32_t vma = vext_vma(desc);                                        \
>       uint32_t sum = 0;                                                     \
>       int i;                                                                \
>                                                                             \
>       for (i = env->vstart; i < vl; i++) {                                  \
>           if (!vm && !vext_elem_mask(v0, i)) {                              \
> +            /* set masked-off elements to 1s */                           \
> +            vext_set_elems_1s(vd, vma, i * esz, (i + 1) * esz);           \
>               continue;                                                     \
>           }                                                                 \
>           *((ETYPE *)vd + H(i)) = sum;                                      \
> @@ -4977,10 +4985,13 @@ void HELPER(NAME)(void *vd, void *v0, CPURISCVState *env, uint32_t desc)  \
>       uint32_t esz = sizeof(ETYPE);                                         \
>       uint32_t total_elems = vext_get_total_elems(env, desc, esz);          \
>       uint32_t vta = vext_vta(desc);                                        \
> +    uint32_t vma = vext_vma(desc);                                        \
>       int i;                                                                \
>                                                                             \
>       for (i = env->vstart; i < vl; i++) {                                  \
>           if (!vm && !vext_elem_mask(v0, i)) {                              \
> +            /* set masked-off elements to 1s */                           \
> +            vext_set_elems_1s(vd, vma, i * esz, (i + 1) * esz);           \
>               continue;                                                     \
>           }                                                                 \
>           *((ETYPE *)vd + H(i)) = i;                                        \


