Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nocFs-0003zY-6n
	for mharc-qemu-riscv@gnu.org; Tue, 10 May 2022 22:39:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nocFp-0003wz-3Z; Tue, 10 May 2022 22:39:09 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:42270 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nocFl-0004kQ-Di; Tue, 10 May 2022 22:39:07 -0400
Received: from [192.168.3.6] (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowAAHjhq_IXtiATm0BQ--.56620S2;
 Wed, 11 May 2022 10:38:56 +0800 (CST)
Subject: Re: [PATCH qemu v2 09/10] target/riscv: rvv: Add mask agnostic for
 vector permutation instructions
To: ~eopxd <yueh.ting.chen@gmail.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Frank Chang <frank.chang@sifive.com>,
 WeiWei Li <liweiwei@iscas.ac.cn>, eop Chen <eop.chen@sifive.com>
References: <165220716770.22380.2493420346587893209-9@git.sr.ht>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <95804de4-9cd4-6042-ab6e-77d2b5a664d1@iscas.ac.cn>
Date: Wed, 11 May 2022 10:38:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <165220716770.22380.2493420346587893209-9@git.sr.ht>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: zQCowAAHjhq_IXtiATm0BQ--.56620S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Wr1UKrWkurW5Kr48XF15XFb_yoW7XFWxp3
 WkKFW3tw4rWFySv3WrAF4UAr1UuFs8GF1kK3s2qwn5XrW8urs5Zr1DKa17Cry3JF9xCF1Y
 va1DZrZ2939avFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkE14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F
 4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
 7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r
 1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE
 67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrV
 AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCI
 c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267
 AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Zr0_Wr1UMIIF0xvEx4A2jsIE14v26r1j
 6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUyby
 ZUUUUU=
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
X-List-Received-Date: Wed, 11 May 2022 02:39:09 -0000


在 2022/3/17 下午5:32, ~eopxd 写道:
> From: Yueh-Ting (eop) Chen <eop.chen@sifive.com>
>
> Signed-off-by: eop Chen <eop.chen@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> ---
>   target/riscv/insn_trans/trans_rvv.c.inc |  1 +
>   target/riscv/vector_helper.c            | 26 +++++++++++++++++++++++--
>   2 files changed, 25 insertions(+), 2 deletions(-)


Reviewed-by: Weiwei Li<liweiwei@iscas.ac.cn>

Regards,
Weiwei Li
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index 18ef9949ad..d853f9f2c4 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -3988,6 +3988,7 @@ static bool int_ext_op(DisasContext *s, arg_rmr *a, uint8_t seq)
>       data = FIELD_DP32(data, VDATA, VM, a->vm);
>       data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
>       data = FIELD_DP32(data, VDATA, VTA, s->vta);
> +    data = FIELD_DP32(data, VDATA, VMA, s->vma);
>   
>       tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
>                          vreg_ofs(s, a->rs2), cpu_env,
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 8f95e286e8..01a3317ee8 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -5020,11 +5020,14 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
>       uint32_t esz = sizeof(ETYPE);                                         \
>       uint32_t total_elems = vext_get_total_elems(env, desc, esz);          \
>       uint32_t vta = vext_vta(desc);                                        \
> +    uint32_t vma = vext_vma(desc);                                        \
>       target_ulong offset = s1, i_min, i;                                   \
>                                                                             \
>       i_min = MAX(env->vstart, offset);                                     \
>       for (i = i_min; i < vl; i++) {                                        \
>           if (!vm && !vext_elem_mask(v0, i)) {                              \
> +            /* set masked-off elements to 1s */                           \
> +            vext_set_elems_1s(vd, vma, i * esz, (i + 1) * esz);           \
>               continue;                                                     \
>           }                                                                 \
>           *((ETYPE *)vd + H(i)) = *((ETYPE *)vs2 + H(i - offset));          \
> @@ -5049,13 +5052,17 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
>       uint32_t esz = sizeof(ETYPE);                                         \
>       uint32_t total_elems = vext_get_total_elems(env, desc, esz);          \
>       uint32_t vta = vext_vta(desc);                                        \
> +    uint32_t vma = vext_vma(desc);                                        \
>       target_ulong i_max, i;                                                \
>                                                                             \
>       i_max = MAX(MIN(s1 < vlmax ? vlmax - s1 : 0, vl), env->vstart);       \
>       for (i = env->vstart; i < i_max; ++i) {                               \
> -        if (vm || vext_elem_mask(v0, i)) {                                \
> -            *((ETYPE *)vd + H(i)) = *((ETYPE *)vs2 + H(i + s1));          \
> +        if (!vm && !vext_elem_mask(v0, i)) {                              \
> +            /* set masked-off elements to 1s */                           \
> +            vext_set_elems_1s(vd, vma, i * esz, (i + 1) * esz);           \
> +            continue;                                                     \
>           }                                                                 \
> +        *((ETYPE *)vd + H(i)) = *((ETYPE *)vs2 + H(i + s1));              \
>       }                                                                     \
>                                                                             \
>       for (i = i_max; i < vl; ++i) {                                        \
> @@ -5085,10 +5092,13 @@ static void vslide1up_##BITWIDTH(void *vd, void *v0, target_ulong s1,       \
>       uint32_t esz = sizeof(ETYPE);                                           \
>       uint32_t total_elems = vext_get_total_elems(env, desc, esz);            \
>       uint32_t vta = vext_vta(desc);                                          \
> +    uint32_t vma = vext_vma(desc);                                          \
>       uint32_t i;                                                             \
>                                                                               \
>       for (i = env->vstart; i < vl; i++) {                                    \
>           if (!vm && !vext_elem_mask(v0, i)) {                                \
> +            /* set masked-off elements to 1s */                             \
> +            vext_set_elems_1s(vd, vma, i * esz, (i + 1) * esz);             \
>               continue;                                                       \
>           }                                                                   \
>           if (i == 0) {                                                       \
> @@ -5130,10 +5140,13 @@ static void vslide1down_##BITWIDTH(void *vd, void *v0, target_ulong s1,       \
>       uint32_t esz = sizeof(ETYPE);                                             \
>       uint32_t total_elems = vext_get_total_elems(env, desc, esz);              \
>       uint32_t vta = vext_vta(desc);                                            \
> +    uint32_t vma = vext_vma(desc);                                            \
>       uint32_t i;                                                               \
>                                                                                 \
>       for (i = env->vstart; i < vl; i++) {                                      \
>           if (!vm && !vext_elem_mask(v0, i)) {                                  \
> +            /* set masked-off elements to 1s */                               \
> +            vext_set_elems_1s(vd, vma, i * esz, (i + 1) * esz);               \
>               continue;                                                         \
>           }                                                                     \
>           if (i == vl - 1) {                                                    \
> @@ -5201,11 +5214,14 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,               \
>       uint32_t esz = sizeof(TS2);                                           \
>       uint32_t total_elems = vext_get_total_elems(env, desc, esz);          \
>       uint32_t vta = vext_vta(desc);                                        \
> +    uint32_t vma = vext_vma(desc);                                        \
>       uint64_t index;                                                       \
>       uint32_t i;                                                           \
>                                                                             \
>       for (i = env->vstart; i < vl; i++) {                                  \
>           if (!vm && !vext_elem_mask(v0, i)) {                              \
> +            /* set masked-off elements to 1s */                           \
> +            vext_set_elems_1s(vd, vma, i * esz, (i + 1) * esz);           \
>               continue;                                                     \
>           }                                                                 \
>           index = *((TS1 *)vs1 + HS1(i));                                   \
> @@ -5241,11 +5257,14 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
>       uint32_t esz = sizeof(ETYPE);                                         \
>       uint32_t total_elems = vext_get_total_elems(env, desc, esz);          \
>       uint32_t vta = vext_vta(desc);                                        \
> +    uint32_t vma = vext_vma(desc);                                        \
>       uint64_t index = s1;                                                  \
>       uint32_t i;                                                           \
>                                                                             \
>       for (i = env->vstart; i < vl; i++) {                                  \
>           if (!vm && !vext_elem_mask(v0, i)) {                              \
> +            /* set masked-off elements to 1s */                           \
> +            vext_set_elems_1s(vd, vma, i * esz, (i + 1) * esz);           \
>               continue;                                                     \
>           }                                                                 \
>           if (index >= vlmax) {                                             \
> @@ -5320,10 +5339,13 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2,                 \
>       uint32_t esz = sizeof(ETYPE);                                \
>       uint32_t total_elems = vext_get_total_elems(env, desc, esz); \
>       uint32_t vta = vext_vta(desc);                               \
> +    uint32_t vma = vext_vma(desc);                               \
>       uint32_t i;                                                  \
>                                                                    \
>       for (i = env->vstart; i < vl; i++) {                         \
>           if (!vm && !vext_elem_mask(v0, i)) {                     \
> +            /* set masked-off elements to 1s */                  \
> +            vext_set_elems_1s(vd, vma, i * esz, (i + 1) * esz);  \
>               continue;                                            \
>           }                                                        \
>           *((ETYPE *)vd + HD(i)) = *((DTYPE *)vs2 + HS1(i));       \


