Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1noc1q-0004SM-HG
	for mharc-qemu-riscv@gnu.org; Tue, 10 May 2022 22:24:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1noc1o-0004Qp-7k; Tue, 10 May 2022 22:24:40 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:38356 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1noc1l-0002ui-W2; Tue, 10 May 2022 22:24:39 -0400
Received: from [192.168.3.6] (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowAD3fRpdHntijUezBQ--.37291S2;
 Wed, 11 May 2022 10:24:30 +0800 (CST)
Subject: Re: [PATCH qemu v2 05/10] target/riscv: rvv: Add mask agnostic for
 vector integer comparison instructions
To: ~eopxd <yueh.ting.chen@gmail.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Frank Chang <frank.chang@sifive.com>,
 WeiWei Li <liweiwei@iscas.ac.cn>, eop Chen <eop.chen@sifive.com>
References: <165220716770.22380.2493420346587893209-5@git.sr.ht>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <f30b84a7-026d-5486-fe26-99b4fe64d890@iscas.ac.cn>
Date: Wed, 11 May 2022 10:24:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <165220716770.22380.2493420346587893209-5@git.sr.ht>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: zQCowAD3fRpdHntijUezBQ--.37291S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zw4rJF43GFW5Zr18Zw1kZrb_yoW8Kw17pa
 1kKrWfWrZ3JFyfZ3WS9F4UJr15XFs8Kr4vkw1vvwn5W3yrJws8Zr1qk3WIkry7JF17GF1Y
 v3WUurZa93yfXFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUv014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
 1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
 7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r
 1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE
 67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrV
 AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCI
 c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267
 AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_
 Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUb
 0D73UUUUU==
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
X-List-Received-Date: Wed, 11 May 2022 02:24:40 -0000


在 2022/3/17 下午4:46, ~eopxd 写道:
> From: Yueh-Ting (eop) Chen <eop.chen@sifive.com>
>
> Signed-off-by: eop Chen <eop.chen@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> ---
>   target/riscv/insn_trans/trans_rvv.c.inc |  1 +
>   target/riscv/vector_helper.c            | 10 ++++++++++
>   2 files changed, 11 insertions(+)


Reviewed-by: Weiwei Li<liweiwei@iscas.ac.cn>

Regards,
Weiwei Li
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index ffbbbf9b3a..5cbf323c18 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -1753,6 +1753,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
>           data = FIELD_DP32(data, VDATA, VTA, s->vta);               \
>           data =                                                     \
>               FIELD_DP32(data, VDATA, VTA_ALL_1S, s->cfg_vta_all_1s);\
> +        data = FIELD_DP32(data, VDATA, VMA, s->vma);               \
>           tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
>                              vreg_ofs(s, a->rs1),                    \
>                              vreg_ofs(s, a->rs2), cpu_env,           \
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 0583602528..9bb259586d 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -1406,12 +1406,17 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
>       uint32_t vl = env->vl;                                    \
>       uint32_t total_elems = env_archcpu(env)->cfg.vlen;        \
>       uint32_t vta_all_1s = vext_vta_all_1s(desc);              \
> +    uint32_t vma = vext_vma(desc);                            \
>       uint32_t i;                                               \
>                                                                 \
>       for (i = env->vstart; i < vl; i++) {                      \
>           ETYPE s1 = *((ETYPE *)vs1 + H(i));                    \
>           ETYPE s2 = *((ETYPE *)vs2 + H(i));                    \
>           if (!vm && !vext_elem_mask(v0, i)) {                  \
> +            /* set masked-off elements to 1s */               \
> +            if (vma) {                                        \
> +                vext_set_elem_mask(vd, i, 1);                 \
> +            }                                                 \
>               continue;                                         \
>           }                                                     \
>           vext_set_elem_mask(vd, i, DO_OP(s2, s1));             \
> @@ -1464,11 +1469,16 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,   \
>       uint32_t vl = env->vl;                                          \
>       uint32_t total_elems = env_archcpu(env)->cfg.vlen;              \
>       uint32_t vta_all_1s = vext_vta_all_1s(desc);                    \
> +    uint32_t vma = vext_vma(desc);                                  \
>       uint32_t i;                                                     \
>                                                                       \
>       for (i = env->vstart; i < vl; i++) {                            \
>           ETYPE s2 = *((ETYPE *)vs2 + H(i));                          \
>           if (!vm && !vext_elem_mask(v0, i)) {                        \
> +            /* set masked-off elements to 1s */                     \
> +            if (vma) {                                              \
> +                vext_set_elem_mask(vd, i, 1);                       \
> +            }                                                       \
>               continue;                                               \
>           }                                                           \
>           vext_set_elem_mask(vd, i,                                   \


