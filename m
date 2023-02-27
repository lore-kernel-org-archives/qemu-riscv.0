Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWRrF-0007eH-9x
	for mharc-qemu-riscv@gnu.org; Sun, 26 Feb 2023 19:59:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pWRrC-0007dn-Cu; Sun, 26 Feb 2023 19:59:10 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pWRr8-0000tb-Vm; Sun, 26 Feb 2023 19:59:09 -0500
Received: from [192.168.0.120] (unknown [180.165.240.213])
 by APP-05 (Coremail) with SMTP id zQCowAB3fppPAPxjLUTfCA--.20590S2;
 Mon, 27 Feb 2023 08:58:56 +0800 (CST)
Message-ID: <f63f2b25-3bf3-d8a0-6e5c-9050b5a177fd@iscas.ac.cn>
Date: Mon, 27 Feb 2023 08:58:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/2] target/riscv/vector_helper.c: avoid env_archcpu()
 when reading RISCVCPUConfig
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com
References: <20230226170514.588071-1-dbarboza@ventanamicro.com>
 <20230226170514.588071-3-dbarboza@ventanamicro.com>
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230226170514.588071-3-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: zQCowAB3fppPAPxjLUTfCA--.20590S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCFy3Kw4xWF4kWF4kur4Uurg_yoWrCrW8pF
 40grW3Wr45JF97Xw13GF1UXF1Durn8Kr40k34rAa4rJr4rZrs8Ar1DAa10kr17Gas7CryY
 va9rZa4Igan29FDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkm14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
 4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
 Y487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
 0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y
 0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
 WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
 IxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUoOJ5UUUUU
X-Originating-IP: [180.165.240.213]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Mon, 27 Feb 2023 00:59:10 -0000


On 2023/2/27 01:05, Daniel Henrique Barboza wrote:
> This file has several uses of env_archcpu() that are used solely to read
> cfg->vlen. Use the new riscv_cpu_cfg() inline instead.
>
> Suggested-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>


Reviewed-by: Weiwei Li<liweiwei@iscas.ac.cn>

Weiwei Li

> ---
>   target/riscv/vector_helper.c | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 7d2e3978f1..a7fb09efa3 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -272,7 +272,7 @@ static void vext_set_tail_elems_1s(CPURISCVState *env, target_ulong vl,
>                                      uint32_t esz, uint32_t max_elems)
>   {
>       uint32_t total_elems = vext_get_total_elems(env, desc, esz);
> -    uint32_t vlenb = env_archcpu(env)->cfg.vlen >> 3;
> +    uint32_t vlenb = riscv_cpu_cfg(env)->vlen >> 3;
>       uint32_t vta = vext_vta(desc);
>       uint32_t registers_used;
>       int k;
> @@ -671,7 +671,7 @@ vext_ldst_whole(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
>   {
>       uint32_t i, k, off, pos;
>       uint32_t nf = vext_nf(desc);
> -    uint32_t vlenb = env_archcpu(env)->cfg.vlen >> 3;
> +    uint32_t vlenb = riscv_cpu_cfg(env)->vlen >> 3;
>       uint32_t max_elems = vlenb >> log2_esz;
>   
>       k = env->vstart / max_elems;
> @@ -1141,7 +1141,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
>   {                                                             \
>       uint32_t vl = env->vl;                                    \
>       uint32_t vm = vext_vm(desc);                              \
> -    uint32_t total_elems = env_archcpu(env)->cfg.vlen;        \
> +    uint32_t total_elems = riscv_cpu_cfg(env)->vlen;          \
>       uint32_t vta_all_1s = vext_vta_all_1s(desc);              \
>       uint32_t i;                                               \
>                                                                 \
> @@ -1177,7 +1177,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1,          \
>   {                                                               \
>       uint32_t vl = env->vl;                                      \
>       uint32_t vm = vext_vm(desc);                                \
> -    uint32_t total_elems = env_archcpu(env)->cfg.vlen;          \
> +    uint32_t total_elems = riscv_cpu_cfg(env)->vlen;            \
>       uint32_t vta_all_1s = vext_vta_all_1s(desc);                \
>       uint32_t i;                                                 \
>                                                                   \
> @@ -1376,7 +1376,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
>   {                                                             \
>       uint32_t vm = vext_vm(desc);                              \
>       uint32_t vl = env->vl;                                    \
> -    uint32_t total_elems = env_archcpu(env)->cfg.vlen;        \
> +    uint32_t total_elems = riscv_cpu_cfg(env)->vlen;          \
>       uint32_t vta_all_1s = vext_vta_all_1s(desc);              \
>       uint32_t vma = vext_vma(desc);                            \
>       uint32_t i;                                               \
> @@ -1439,7 +1439,7 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,   \
>   {                                                                   \
>       uint32_t vm = vext_vm(desc);                                    \
>       uint32_t vl = env->vl;                                          \
> -    uint32_t total_elems = env_archcpu(env)->cfg.vlen;              \
> +    uint32_t total_elems = riscv_cpu_cfg(env)->vlen;                \
>       uint32_t vta_all_1s = vext_vta_all_1s(desc);                    \
>       uint32_t vma = vext_vma(desc);                                  \
>       uint32_t i;                                                     \
> @@ -4152,7 +4152,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
>   {                                                             \
>       uint32_t vm = vext_vm(desc);                              \
>       uint32_t vl = env->vl;                                    \
> -    uint32_t total_elems = env_archcpu(env)->cfg.vlen;        \
> +    uint32_t total_elems = riscv_cpu_cfg(env)->vlen;          \
>       uint32_t vta_all_1s = vext_vta_all_1s(desc);              \
>       uint32_t vma = vext_vma(desc);                            \
>       uint32_t i;                                               \
> @@ -4190,7 +4190,7 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void *vs2,       \
>   {                                                                   \
>       uint32_t vm = vext_vm(desc);                                    \
>       uint32_t vl = env->vl;                                          \
> -    uint32_t total_elems = env_archcpu(env)->cfg.vlen;              \
> +    uint32_t total_elems = riscv_cpu_cfg(env)->vlen;                \
>       uint32_t vta_all_1s = vext_vta_all_1s(desc);                    \
>       uint32_t vma = vext_vma(desc);                                  \
>       uint32_t i;                                                     \
> @@ -4721,7 +4721,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
>                     uint32_t desc)                          \
>   {                                                         \
>       uint32_t vl = env->vl;                                \
> -    uint32_t total_elems = env_archcpu(env)->cfg.vlen;    \
> +    uint32_t total_elems = riscv_cpu_cfg(env)->vlen;      \
>       uint32_t vta_all_1s = vext_vta_all_1s(desc);          \
>       uint32_t i;                                           \
>       int a, b;                                             \
> @@ -4808,7 +4808,7 @@ static void vmsetm(void *vd, void *v0, void *vs2, CPURISCVState *env,
>   {
>       uint32_t vm = vext_vm(desc);
>       uint32_t vl = env->vl;
> -    uint32_t total_elems = env_archcpu(env)->cfg.vlen;
> +    uint32_t total_elems = riscv_cpu_cfg(env)->vlen;
>       uint32_t vta_all_1s = vext_vta_all_1s(desc);
>       uint32_t vma = vext_vma(desc);
>       int i;


