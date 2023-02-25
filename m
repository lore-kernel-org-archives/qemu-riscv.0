Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVoHi-0005jp-90
	for mharc-qemu-riscv@gnu.org; Sat, 25 Feb 2023 01:43:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pVoHd-0005jQ-TY; Sat, 25 Feb 2023 01:43:52 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pVoHb-0003m4-LF; Sat, 25 Feb 2023 01:43:49 -0500
Received: from [192.168.0.120] (unknown [180.165.240.213])
 by APP-05 (Coremail) with SMTP id zQCowAAnLfEervljjM5uCA--.7479S2;
 Sat, 25 Feb 2023 14:43:43 +0800 (CST)
Message-ID: <90edffde-39a0-923f-9263-12a4ada0ffa6@iscas.ac.cn>
Date: Sat, 25 Feb 2023 14:43:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 3/4] target/riscv/csr.c: use riscv_cpu_cfg() to avoid
 env_cpu() pointers
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 zhiwei_liu@linux.alibaba.com
References: <20230224174520.92490-1-dbarboza@ventanamicro.com>
 <20230224174520.92490-4-dbarboza@ventanamicro.com>
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230224174520.92490-4-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: zQCowAAnLfEervljjM5uCA--.7479S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAw4xKryDZry5ur13Zw4DXFb_yoW7Jr4xpr
 48uFsxGa42qa4qvay7JF1qgF1rAw17G3yUKanrWa93AF4DCrW5JF1DKa9IyF4kua40vr4F
 vFy7GF1vva10ya7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkqb7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I
 8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
 F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r
 4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487
 MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
 0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0E
 wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JV
 WxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAI
 cVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8mhF7UUUUU==
X-Originating-IP: [180.165.240.213]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.094,
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
X-List-Received-Date: Sat, 25 Feb 2023 06:43:53 -0000


On 2023/2/25 01:45, Daniel Henrique Barboza wrote:
> A common trend in this file is to retrieve a RISCVCPU pointer by first
> retrieving a CPUState pointer via env_cpu(). The CPU pointer is used
> only to access the RISCVCPUConfig object and nothing else.
>
> Let's use riscv_cpu_cfg() to access what we need directly without these
> 2 pointers.
>
> Suggested-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Weiwei Li
>   target/riscv/csr.c | 50 +++++++++++-----------------------------------
>   1 file changed, 12 insertions(+), 38 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 0f4aa22a0f..53f1a331f9 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -46,10 +46,8 @@ static RISCVException smstateen_acc_ok(CPURISCVState *env, int index,
>                                          uint64_t bit)
>   {
>       bool virt = riscv_cpu_virt_enabled(env);
> -    CPUState *cs = env_cpu(env);
> -    RISCVCPU *cpu = RISCV_CPU(cs);
>   
> -    if (env->priv == PRV_M || !cpu->cfg.ext_smstateen) {
> +    if (env->priv == PRV_M || !riscv_cpu_cfg(env)->ext_smstateen) {
>           return RISCV_EXCP_NONE;
>       }
>   
> @@ -81,7 +79,7 @@ static RISCVException fs(CPURISCVState *env, int csrno)
>   {
>   #if !defined(CONFIG_USER_ONLY)
>       if (!env->debugger && !riscv_cpu_fp_enabled(env) &&
> -        !RISCV_CPU(env_cpu(env))->cfg.ext_zfinx) {
> +        !riscv_cpu_cfg(env)->ext_zfinx) {
>           return RISCV_EXCP_ILLEGAL_INST;
>       }
>   #endif
> @@ -90,11 +88,9 @@ static RISCVException fs(CPURISCVState *env, int csrno)
>   
>   static RISCVException vs(CPURISCVState *env, int csrno)
>   {
> -    CPUState *cs = env_cpu(env);
> -    RISCVCPU *cpu = RISCV_CPU(cs);
> -
>       if (env->misa_ext & RVV ||
> -        cpu->cfg.ext_zve32f || cpu->cfg.ext_zve64f) {
> +        riscv_cpu_cfg(env)->ext_zve32f ||
> +        riscv_cpu_cfg(env)->ext_zve64f) {
>   #if !defined(CONFIG_USER_ONLY)
>           if (!env->debugger && !riscv_cpu_vector_enabled(env)) {
>               return RISCV_EXCP_ILLEGAL_INST;
> @@ -193,10 +189,7 @@ static RISCVException mctr32(CPURISCVState *env, int csrno)
>   
>   static RISCVException sscofpmf(CPURISCVState *env, int csrno)
>   {
> -    CPUState *cs = env_cpu(env);
> -    RISCVCPU *cpu = RISCV_CPU(cs);
> -
> -    if (!cpu->cfg.ext_sscofpmf) {
> +    if (!riscv_cpu_cfg(env)->ext_sscofpmf) {
>           return RISCV_EXCP_ILLEGAL_INST;
>       }
>   
> @@ -319,10 +312,7 @@ static RISCVException umode32(CPURISCVState *env, int csrno)
>   
>   static RISCVException mstateen(CPURISCVState *env, int csrno)
>   {
> -    CPUState *cs = env_cpu(env);
> -    RISCVCPU *cpu = RISCV_CPU(cs);
> -
> -    if (!cpu->cfg.ext_smstateen) {
> +    if (!riscv_cpu_cfg(env)->ext_smstateen) {
>           return RISCV_EXCP_ILLEGAL_INST;
>       }
>   
> @@ -331,10 +321,7 @@ static RISCVException mstateen(CPURISCVState *env, int csrno)
>   
>   static RISCVException hstateen_pred(CPURISCVState *env, int csrno, int base)
>   {
> -    CPUState *cs = env_cpu(env);
> -    RISCVCPU *cpu = RISCV_CPU(cs);
> -
> -    if (!cpu->cfg.ext_smstateen) {
> +    if (!riscv_cpu_cfg(env)->ext_smstateen) {
>           return RISCV_EXCP_ILLEGAL_INST;
>       }
>   
> @@ -361,10 +348,8 @@ static RISCVException sstateen(CPURISCVState *env, int csrno)
>   {
>       bool virt = riscv_cpu_virt_enabled(env);
>       int index = csrno - CSR_SSTATEEN0;
> -    CPUState *cs = env_cpu(env);
> -    RISCVCPU *cpu = RISCV_CPU(cs);
>   
> -    if (!cpu->cfg.ext_smstateen) {
> +    if (!riscv_cpu_cfg(env)->ext_smstateen) {
>           return RISCV_EXCP_ILLEGAL_INST;
>       }
>   
> @@ -916,11 +901,9 @@ static RISCVException read_timeh(CPURISCVState *env, int csrno,
>   
>   static RISCVException sstc(CPURISCVState *env, int csrno)
>   {
> -    CPUState *cs = env_cpu(env);
> -    RISCVCPU *cpu = RISCV_CPU(cs);
>       bool hmode_check = false;
>   
> -    if (!cpu->cfg.ext_sstc || !env->rdtime_fn) {
> +    if (!riscv_cpu_cfg(env)->ext_sstc || !env->rdtime_fn) {
>           return RISCV_EXCP_ILLEGAL_INST;
>       }
>   
> @@ -1150,30 +1133,21 @@ static RISCVException write_ignore(CPURISCVState *env, int csrno,
>   static RISCVException read_mvendorid(CPURISCVState *env, int csrno,
>                                        target_ulong *val)
>   {
> -    CPUState *cs = env_cpu(env);
> -    RISCVCPU *cpu = RISCV_CPU(cs);
> -
> -    *val = cpu->cfg.mvendorid;
> +    *val = riscv_cpu_cfg(env)->mvendorid;
>       return RISCV_EXCP_NONE;
>   }
>   
>   static RISCVException read_marchid(CPURISCVState *env, int csrno,
>                                      target_ulong *val)
>   {
> -    CPUState *cs = env_cpu(env);
> -    RISCVCPU *cpu = RISCV_CPU(cs);
> -
> -    *val = cpu->cfg.marchid;
> +    *val = riscv_cpu_cfg(env)->marchid;
>       return RISCV_EXCP_NONE;
>   }
>   
>   static RISCVException read_mimpid(CPURISCVState *env, int csrno,
>                                     target_ulong *val)
>   {
> -    CPUState *cs = env_cpu(env);
> -    RISCVCPU *cpu = RISCV_CPU(cs);
> -
> -    *val = cpu->cfg.mimpid;
> +    *val = riscv_cpu_cfg(env)->mimpid;
>       return RISCV_EXCP_NONE;
>   }
>   


