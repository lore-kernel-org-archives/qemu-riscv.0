Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSqWV-0005DT-Lv
	for mharc-qemu-riscv@gnu.org; Thu, 16 Feb 2023 21:30:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pSqWU-0005Cz-78; Thu, 16 Feb 2023 21:30:54 -0500
Received: from out30-101.freemail.mail.aliyun.com ([115.124.30.101])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pSqWS-0003sF-9z; Thu, 16 Feb 2023 21:30:53 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R181e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046049;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0Vbqh95c_1676601043; 
Received: from 30.221.98.44(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0Vbqh95c_1676601043) by smtp.aliyun-inc.com;
 Fri, 17 Feb 2023 10:30:43 +0800
Message-ID: <269e81ac-3488-a38a-825e-62e23ebda937@linux.alibaba.com>
Date: Fri, 17 Feb 2023 10:30:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 08/18] target/riscv: Simplify getting RISCVCPU pointer
 from env
Content-Language: en-US
To: Bin Meng <bmeng@tinylab.org>, qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 qemu-riscv@nongnu.org
References: <20230213180215.1524938-1-bmeng@tinylab.org>
 <20230213180215.1524938-9-bmeng@tinylab.org>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230213180215.1524938-9-bmeng@tinylab.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.101;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-101.freemail.mail.aliyun.com
X-Spam_score_int: -102
X-Spam_score: -10.3
X-Spam_bar: ----------
X-Spam_report: (-10.3 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.351, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 17 Feb 2023 02:30:54 -0000


On 2023/2/14 2:02, Bin Meng wrote:
> Use env_archcpu() to get RISCVCPU pointer from env directly.
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
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

I see many RISCVCPU pointers are just for cfg in this patch. We can also 
use the new interface by Dianel, which will unify the interface for same 
function.

Otherwise,

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

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

