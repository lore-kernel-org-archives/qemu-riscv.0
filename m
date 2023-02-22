Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pUeRj-0003u5-Bb
	for mharc-qemu-riscv@gnu.org; Tue, 21 Feb 2023 21:01:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pUeRg-0003nd-Mr; Tue, 21 Feb 2023 21:01:24 -0500
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pUeRd-00019a-0t; Tue, 21 Feb 2023 21:01:24 -0500
Received: from [192.168.0.119] (unknown [114.95.238.225])
 by APP-01 (Coremail) with SMTP id qwCowAA3Mz9jd_VjgKXPBg--.1186S2;
 Wed, 22 Feb 2023 10:01:08 +0800 (CST)
Message-ID: <c14725b0-7ac4-61c7-fab2-54c0f5f83aaa@iscas.ac.cn>
Date: Wed, 22 Feb 2023 10:01:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] target/riscv/vector_helper.c: create
 vext_set_tail_elems_1s()
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com
References: <20230221184525.140704-1-dbarboza@ventanamicro.com>
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230221184525.140704-1-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: qwCowAA3Mz9jd_VjgKXPBg--.1186S2
X-Coremail-Antispam: 1UD129KBjvJXoWxtw18AF1fZrW8Zw4DtF43KFg_yoWxGw4Upa
 1xKrW7ur4Syws3uw15GF4UZF18G3W5Jr1jkr1vkF1FqrWUuws7GF1qya1xCryDAr97Zr4F
 y3WDZwsrWayxuFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkE14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxV
 W8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xf
 McIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7
 v_Jr0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xF
 o4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4
 xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1D
 MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I
 0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWU
 JVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUdHU
 DUUUUU=
X-Originating-IP: [114.95.238.225]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.095,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Wed, 22 Feb 2023 02:01:26 -0000


On 2023/2/22 02:45, Daniel Henrique Barboza wrote:
> Commit 752614cab8e6 ("target/riscv: rvv: Add tail agnostic for vector
> load / store instructions") added code to set the tail elements to 1 in
> the end of vext_ldst_stride(), vext_ldst_us(), vext_ldst_index() and
> vext_ldff(). Aside from a env->vl versus an evl value being used in the
> first loop, the code is being repeated 4 times.
>
> Create a helper to avoid code repetition in all those functions.
> Arguments that are used in the callers (nf, esz and max_elems) are
> passed as arguments. All other values are being derived inside the
> helper.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

LGTM.

Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

> ---
>   target/riscv/vector_helper.c | 86 +++++++++++++-----------------------
>   1 file changed, 30 insertions(+), 56 deletions(-)
>
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 00de879787..7d2e3978f1 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -267,6 +267,28 @@ GEN_VEXT_ST_ELEM(ste_h, int16_t, H2, stw)
>   GEN_VEXT_ST_ELEM(ste_w, int32_t, H4, stl)
>   GEN_VEXT_ST_ELEM(ste_d, int64_t, H8, stq)
>   
> +static void vext_set_tail_elems_1s(CPURISCVState *env, target_ulong vl,
> +                                   void *vd, uint32_t desc, uint32_t nf,
> +                                   uint32_t esz, uint32_t max_elems)
> +{
> +    uint32_t total_elems = vext_get_total_elems(env, desc, esz);
> +    uint32_t vlenb = env_archcpu(env)->cfg.vlen >> 3;

By the way, env_archcpu(env)->cfg in vector_helper.c can also be replace 
by cpu_get_cfg().

Regards,

Weiwei Li

> +    uint32_t vta = vext_vta(desc);
> +    uint32_t registers_used;
> +    int k;
> +
> +    for (k = 0; k < nf; ++k) {
> +        vext_set_elems_1s(vd, vta, (k * max_elems + vl) * esz,
> +                          (k * max_elems + max_elems) * esz);
> +    }
> +
> +    if (nf * max_elems % total_elems != 0) {
> +        registers_used = ((nf * max_elems) * esz + (vlenb - 1)) / vlenb;
> +        vext_set_elems_1s(vd, vta, (nf * max_elems) * esz,
> +                          registers_used * vlenb);
> +    }
> +}
> +
>   /*
>    *** stride: access vector element from strided memory
>    */
> @@ -281,8 +303,6 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,
>       uint32_t nf = vext_nf(desc);
>       uint32_t max_elems = vext_max_elems(desc, log2_esz);
>       uint32_t esz = 1 << log2_esz;
> -    uint32_t total_elems = vext_get_total_elems(env, desc, esz);
> -    uint32_t vta = vext_vta(desc);
>       uint32_t vma = vext_vma(desc);
>   
>       for (i = env->vstart; i < env->vl; i++, env->vstart++) {
> @@ -301,18 +321,8 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,
>           }
>       }
>       env->vstart = 0;
> -    /* set tail elements to 1s */
> -    for (k = 0; k < nf; ++k) {
> -        vext_set_elems_1s(vd, vta, (k * max_elems + env->vl) * esz,
> -                          (k * max_elems + max_elems) * esz);
> -    }
> -    if (nf * max_elems % total_elems != 0) {
> -        uint32_t vlenb = env_archcpu(env)->cfg.vlen >> 3;
> -        uint32_t registers_used =
> -            ((nf * max_elems) * esz + (vlenb - 1)) / vlenb;
> -        vext_set_elems_1s(vd, vta, (nf * max_elems) * esz,
> -                          registers_used * vlenb);
> -    }
> +
> +    vext_set_tail_elems_1s(env, env->vl, vd, desc, nf, esz, max_elems);
>   }
>   
>   #define GEN_VEXT_LD_STRIDE(NAME, ETYPE, LOAD_FN)                        \
> @@ -359,8 +369,6 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
>       uint32_t nf = vext_nf(desc);
>       uint32_t max_elems = vext_max_elems(desc, log2_esz);
>       uint32_t esz = 1 << log2_esz;
> -    uint32_t total_elems = vext_get_total_elems(env, desc, esz);
> -    uint32_t vta = vext_vta(desc);
>   
>       /* load bytes from guest memory */
>       for (i = env->vstart; i < evl; i++, env->vstart++) {
> @@ -372,18 +380,8 @@ vext_ldst_us(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
>           }
>       }
>       env->vstart = 0;
> -    /* set tail elements to 1s */
> -    for (k = 0; k < nf; ++k) {
> -        vext_set_elems_1s(vd, vta, (k * max_elems + evl) * esz,
> -                          (k * max_elems + max_elems) * esz);
> -    }
> -    if (nf * max_elems % total_elems != 0) {
> -        uint32_t vlenb = env_archcpu(env)->cfg.vlen >> 3;
> -        uint32_t registers_used =
> -            ((nf * max_elems) * esz + (vlenb - 1)) / vlenb;
> -        vext_set_elems_1s(vd, vta, (nf * max_elems) * esz,
> -                          registers_used * vlenb);
> -    }
> +
> +    vext_set_tail_elems_1s(env, evl, vd, desc, nf, esz, max_elems);
>   }
>   
>   /*
> @@ -484,8 +482,6 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
>       uint32_t vm = vext_vm(desc);
>       uint32_t max_elems = vext_max_elems(desc, log2_esz);
>       uint32_t esz = 1 << log2_esz;
> -    uint32_t total_elems = vext_get_total_elems(env, desc, esz);
> -    uint32_t vta = vext_vta(desc);
>       uint32_t vma = vext_vma(desc);
>   
>       /* load bytes from guest memory */
> @@ -505,18 +501,8 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
>           }
>       }
>       env->vstart = 0;
> -    /* set tail elements to 1s */
> -    for (k = 0; k < nf; ++k) {
> -        vext_set_elems_1s(vd, vta, (k * max_elems + env->vl) * esz,
> -                          (k * max_elems + max_elems) * esz);
> -    }
> -    if (nf * max_elems % total_elems != 0) {
> -        uint32_t vlenb = env_archcpu(env)->cfg.vlen >> 3;
> -        uint32_t registers_used =
> -            ((nf * max_elems) * esz + (vlenb - 1)) / vlenb;
> -        vext_set_elems_1s(vd, vta, (nf * max_elems) * esz,
> -                          registers_used * vlenb);
> -    }
> +
> +    vext_set_tail_elems_1s(env, env->vl, vd, desc, nf, esz, max_elems);
>   }
>   
>   #define GEN_VEXT_LD_INDEX(NAME, ETYPE, INDEX_FN, LOAD_FN)                  \
> @@ -585,8 +571,6 @@ vext_ldff(void *vd, void *v0, target_ulong base,
>       uint32_t vm = vext_vm(desc);
>       uint32_t max_elems = vext_max_elems(desc, log2_esz);
>       uint32_t esz = 1 << log2_esz;
> -    uint32_t total_elems = vext_get_total_elems(env, desc, esz);
> -    uint32_t vta = vext_vta(desc);
>       uint32_t vma = vext_vma(desc);
>       target_ulong addr, offset, remain;
>   
> @@ -647,18 +631,8 @@ ProbeSuccess:
>           }
>       }
>       env->vstart = 0;
> -    /* set tail elements to 1s */
> -    for (k = 0; k < nf; ++k) {
> -        vext_set_elems_1s(vd, vta, (k * max_elems + env->vl) * esz,
> -                          (k * max_elems + max_elems) * esz);
> -    }
> -    if (nf * max_elems % total_elems != 0) {
> -        uint32_t vlenb = env_archcpu(env)->cfg.vlen >> 3;
> -        uint32_t registers_used =
> -            ((nf * max_elems) * esz + (vlenb - 1)) / vlenb;
> -        vext_set_elems_1s(vd, vta, (nf * max_elems) * esz,
> -                          registers_used * vlenb);
> -    }
> +
> +    vext_set_tail_elems_1s(env, env->vl, vd, desc, nf, esz, max_elems);
>   }
>   
>   #define GEN_VEXT_LDFF(NAME, ETYPE, LOAD_FN)               \


