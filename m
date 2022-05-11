Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nobnV-0001gi-Nm
	for mharc-qemu-riscv@gnu.org; Tue, 10 May 2022 22:09:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nobnU-0001gI-If; Tue, 10 May 2022 22:09:52 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:34022 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nobnS-0000qC-8I; Tue, 10 May 2022 22:09:51 -0400
Received: from [192.168.3.6] (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowABHT5PqGntiXlayBQ--.35461S2;
 Wed, 11 May 2022 10:09:47 +0800 (CST)
Subject: Re: [PATCH qemu v2 04/10] target/riscv: rvv: Add mask agnostic for
 vector integer shift instructions
To: ~eopxd <yueh.ting.chen@gmail.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Frank Chang <frank.chang@sifive.com>,
 WeiWei Li <liweiwei@iscas.ac.cn>, eop Chen <eop.chen@sifive.com>
References: <165220716770.22380.2493420346587893209-4@git.sr.ht>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <1ec3c59f-650b-35bd-0575-6cbef04ab97e@iscas.ac.cn>
Date: Wed, 11 May 2022 10:09:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <165220716770.22380.2493420346587893209-4@git.sr.ht>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: zQCowABHT5PqGntiXlayBQ--.35461S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zw4rJF43GrW3Gw4xCF4rXwb_yoW8tF4kpw
 4kKFWIqrZ3GFWfZ3WSvF4UZr15ZF45Gr4vkw1vvwn5X3yrJrs5ZF4qka1Ikry3JFy3uF1Y
 93WDurWS939aqFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvj14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
 4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
 Yx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbV
 WUJVW8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07Al
 zVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
 0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFyl
 IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxV
 AFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6Fyj6rWUJwCI42IY6I8E87Iv67AKxVWU
 JVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUov
 38UUUUU
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
X-List-Received-Date: Wed, 11 May 2022 02:09:52 -0000


在 2022/3/17 下午4:43, ~eopxd 写道:
> From: Yueh-Ting (eop) Chen <eop.chen@sifive.com>
>
> Signed-off-by: eop Chen <eop.chen@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> ---
>   target/riscv/insn_trans/trans_rvv.c.inc | 1 +
>   target/riscv/vector_helper.c            | 7 +++++++
>   2 files changed, 8 insertions(+)

Reviewed-by: Weiwei Li<liweiwei@iscas.ac.cn>

Regards,
Weiwei Li


>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index de8dda31fe..ffbbbf9b3a 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -1946,6 +1946,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
>           data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
>           data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
>           data = FIELD_DP32(data, VDATA, VTA, s->vta);               \
> +        data = FIELD_DP32(data, VDATA, VMA, s->vma);               \
>           tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
>                              vreg_ofs(s, a->rs1),                    \
>                              vreg_ofs(s, a->rs2), cpu_env,           \
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 98c9f21182..0583602528 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -1300,10 +1300,13 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,                          \
>       uint32_t esz = sizeof(TS1);                                           \
>       uint32_t total_elems = vext_get_total_elems(env, desc, esz);          \
>       uint32_t vta = vext_vta(desc);                                        \
> +    uint32_t vma = vext_vma(desc);                                        \
>       uint32_t i;                                                           \
>                                                                             \
>       for (i = env->vstart; i < vl; i++) {                                  \
>           if (!vm && !vext_elem_mask(v0, i)) {                              \
> +            /* set masked-off elements to 1s */                           \
> +            vext_set_elems_1s(vd, vma, i * esz, (i + 1) * esz);           \
>               continue;                                                     \
>           }                                                                 \
>           TS1 s1 = *((TS1 *)vs1 + HS1(i));                                  \
> @@ -1341,10 +1344,14 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1,      \
>       uint32_t total_elems =                                  \
>           vext_get_total_elems(env, desc, esz);               \
>       uint32_t vta = vext_vta(desc);                          \
> +    uint32_t vma = vext_vma(desc);                          \
>       uint32_t i;                                             \
>                                                               \
>       for (i = env->vstart; i < vl; i++) {                    \
>           if (!vm && !vext_elem_mask(v0, i)) {                \
> +            /* set masked-off elements to 1s */             \
> +            vext_set_elems_1s(vd, vma, i * esz,             \
> +                              (i + 1) * esz);               \
>               continue;                                       \
>           }                                                   \
>           TS2 s2 = *((TS2 *)vs2 + HS2(i));                    \


