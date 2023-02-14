Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pRr2m-0001n2-EI
	for mharc-qemu-riscv@gnu.org; Tue, 14 Feb 2023 03:52:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pRr2k-0001mX-F0; Tue, 14 Feb 2023 03:52:06 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pRr2i-0000dc-CR; Tue, 14 Feb 2023 03:52:06 -0500
Received: from [192.168.0.119] (unknown [114.95.238.225])
 by APP-05 (Coremail) with SMTP id zQCowADn7uqvS+tjOZssBQ--.41717S2;
 Tue, 14 Feb 2023 16:51:59 +0800 (CST)
Message-ID: <35d63096-1c90-84ac-ae6d-6d0823640fd0@iscas.ac.cn>
Date: Tue, 14 Feb 2023 16:51:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Cc: liweiwei@iscas.ac.cn, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Subject: Re: [PATCH 08/18] target/riscv: Simplify getting RISCVCPU pointer
 from env
Content-Language: en-US
To: Bin Meng <bmeng@tinylab.org>, qemu-devel@nongnu.org
References: <20230213180215.1524938-1-bmeng@tinylab.org>
 <20230213180215.1524938-9-bmeng@tinylab.org>
From: weiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230213180215.1524938-9-bmeng@tinylab.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: zQCowADn7uqvS+tjOZssBQ--.41717S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXw1xAF1xJFWkGw1UCr1rJFb_yoWrtw4Dpr
 WUZFZxGFy7t34qvayfJF1q9F4rJw47K3y7Gws7XayrtF4DJry5Jr1DGasxtrn8uay8u3yF
 vFW3Jr1ktw40kFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkE14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07AlzVAY
 IcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
 v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkG
 c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW5JVW7JwCI42IY6xIIjxv20xvEc7CjxVAFwI
 0_Gr1j6F4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_
 Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUHlk
 sUUUUU=
X-Originating-IP: [114.95.238.225]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.345,
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
X-List-Received-Date: Tue, 14 Feb 2023 08:52:06 -0000


On 2023/2/14 02:02, Bin Meng wrote:
> Use env_archcpu() to get RISCVCPU pointer from env directly.
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Regards,
Weiwei Li
> ---
>
>   target/riscv/csr.c | 36 ++++++++++++------------------------
>   1 file changed, 12 insertions(+), 24 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index da3b770894..0a3f2bef6f 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -46,8 +46,7 @@ static RISCVException smstateen_acc_ok(CPURISCVState *env, int index,
>                                          uint64_t bit)
>   {
>       bool virt = riscv_cpu_virt_enabled(env);
> -    CPUState *cs = env_cpu(env);
> -    RISCVCPU *cpu = RISCV_CPU(cs);
> +    RISCVCPU *cpu = env_archcpu(env);
>   
>       if (env->priv == PRV_M || !cpu->cfg.ext_smstateen) {
>           return RISCV_EXCP_NONE;
> @@ -90,8 +89,7 @@ static RISCVException fs(CPURISCVState *env, int csrno)
>   
>   static RISCVException vs(CPURISCVState *env, int csrno)
>   {
> -    CPUState *cs = env_cpu(env);
> -    RISCVCPU *cpu = RISCV_CPU(cs);
> +    RISCVCPU *cpu = env_archcpu(env);
>   
>       if (env->misa_ext & RVV ||
>           cpu->cfg.ext_zve32f || cpu->cfg.ext_zve64f) {
> @@ -108,8 +106,7 @@ static RISCVException vs(CPURISCVState *env, int csrno)
>   static RISCVException ctr(CPURISCVState *env, int csrno)
>   {
>   #if !defined(CONFIG_USER_ONLY)
> -    CPUState *cs = env_cpu(env);
> -    RISCVCPU *cpu = RISCV_CPU(cs);
> +    RISCVCPU *cpu = env_archcpu(env);
>       int ctr_index;
>       target_ulong ctr_mask;
>       int base_csrno = CSR_CYCLE;
> @@ -166,8 +163,7 @@ static RISCVException ctr32(CPURISCVState *env, int csrno)
>   #if !defined(CONFIG_USER_ONLY)
>   static RISCVException mctr(CPURISCVState *env, int csrno)
>   {
> -    CPUState *cs = env_cpu(env);
> -    RISCVCPU *cpu = RISCV_CPU(cs);
> +    RISCVCPU *cpu = env_archcpu(env);
>       int ctr_index;
>       int base_csrno = CSR_MHPMCOUNTER3;
>   
> @@ -195,8 +191,7 @@ static RISCVException mctr32(CPURISCVState *env, int csrno)
>   
>   static RISCVException sscofpmf(CPURISCVState *env, int csrno)
>   {
> -    CPUState *cs = env_cpu(env);
> -    RISCVCPU *cpu = RISCV_CPU(cs);
> +    RISCVCPU *cpu = env_archcpu(env);
>   
>       if (!cpu->cfg.ext_sscofpmf) {
>           return RISCV_EXCP_ILLEGAL_INST;
> @@ -321,8 +316,7 @@ static RISCVException umode32(CPURISCVState *env, int csrno)
>   
>   static RISCVException mstateen(CPURISCVState *env, int csrno)
>   {
> -    CPUState *cs = env_cpu(env);
> -    RISCVCPU *cpu = RISCV_CPU(cs);
> +    RISCVCPU *cpu = env_archcpu(env);
>   
>       if (!cpu->cfg.ext_smstateen) {
>           return RISCV_EXCP_ILLEGAL_INST;
> @@ -333,8 +327,7 @@ static RISCVException mstateen(CPURISCVState *env, int csrno)
>   
>   static RISCVException hstateen_pred(CPURISCVState *env, int csrno, int base)
>   {
> -    CPUState *cs = env_cpu(env);
> -    RISCVCPU *cpu = RISCV_CPU(cs);
> +    RISCVCPU *cpu = env_archcpu(env);
>   
>       if (!cpu->cfg.ext_smstateen) {
>           return RISCV_EXCP_ILLEGAL_INST;
> @@ -363,8 +356,7 @@ static RISCVException sstateen(CPURISCVState *env, int csrno)
>   {
>       bool virt = riscv_cpu_virt_enabled(env);
>       int index = csrno - CSR_SSTATEEN0;
> -    CPUState *cs = env_cpu(env);
> -    RISCVCPU *cpu = RISCV_CPU(cs);
> +    RISCVCPU *cpu = env_archcpu(env);
>   
>       if (!cpu->cfg.ext_smstateen) {
>           return RISCV_EXCP_ILLEGAL_INST;
> @@ -918,8 +910,7 @@ static RISCVException read_timeh(CPURISCVState *env, int csrno,
>   
>   static RISCVException sstc(CPURISCVState *env, int csrno)
>   {
> -    CPUState *cs = env_cpu(env);
> -    RISCVCPU *cpu = RISCV_CPU(cs);
> +    RISCVCPU *cpu = env_archcpu(env);
>       bool hmode_check = false;
>   
>       if (!cpu->cfg.ext_sstc || !env->rdtime_fn) {
> @@ -1152,8 +1143,7 @@ static RISCVException write_ignore(CPURISCVState *env, int csrno,
>   static RISCVException read_mvendorid(CPURISCVState *env, int csrno,
>                                        target_ulong *val)
>   {
> -    CPUState *cs = env_cpu(env);
> -    RISCVCPU *cpu = RISCV_CPU(cs);
> +    RISCVCPU *cpu = env_archcpu(env);
>   
>       *val = cpu->cfg.mvendorid;
>       return RISCV_EXCP_NONE;
> @@ -1162,8 +1152,7 @@ static RISCVException read_mvendorid(CPURISCVState *env, int csrno,
>   static RISCVException read_marchid(CPURISCVState *env, int csrno,
>                                      target_ulong *val)
>   {
> -    CPUState *cs = env_cpu(env);
> -    RISCVCPU *cpu = RISCV_CPU(cs);
> +    RISCVCPU *cpu = env_archcpu(env);
>   
>       *val = cpu->cfg.marchid;
>       return RISCV_EXCP_NONE;
> @@ -1172,8 +1161,7 @@ static RISCVException read_marchid(CPURISCVState *env, int csrno,
>   static RISCVException read_mimpid(CPURISCVState *env, int csrno,
>                                     target_ulong *val)
>   {
> -    CPUState *cs = env_cpu(env);
> -    RISCVCPU *cpu = RISCV_CPU(cs);
> +    RISCVCPU *cpu = env_archcpu(env);
>   
>       *val = cpu->cfg.mimpid;
>       return RISCV_EXCP_NONE;


