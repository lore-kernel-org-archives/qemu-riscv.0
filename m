Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVoIp-0006IG-Id
	for mharc-qemu-riscv@gnu.org; Sat, 25 Feb 2023 01:45:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pVoIV-0006EQ-JY; Sat, 25 Feb 2023 01:44:45 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pVoIT-0003q4-Bt; Sat, 25 Feb 2023 01:44:43 -0500
Received: from [192.168.0.120] (unknown [180.165.240.213])
 by APP-05 (Coremail) with SMTP id zQCowACn0qJSrvljEdVuCA--.28973S2;
 Sat, 25 Feb 2023 14:44:35 +0800 (CST)
Message-ID: <22e8a263-52db-8538-c71e-fcfb9cfef93b@iscas.ac.cn>
Date: Sat, 25 Feb 2023 14:44:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 4/4] target/riscv/csr.c: avoid env_archcpu() usages when
 reading RISCVCPUConfig
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 zhiwei_liu@linux.alibaba.com
References: <20230224174520.92490-1-dbarboza@ventanamicro.com>
 <20230224174520.92490-5-dbarboza@ventanamicro.com>
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230224174520.92490-5-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: zQCowACn0qJSrvljEdVuCA--.28973S2
X-Coremail-Antispam: 1UD129KBjvJXoWxuF1rWr43tw1DKFykGFW5Awb_yoW5tF13pr
 4UuanxGrW2ya4qva9rGF1qvF15Aa10g3yUKwnrXayrtFs8GF48JFn8W39Iq3s5uay0gw4I
 yry7Wr1kCa18tFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkqb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
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
 cVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8DxhJUUUUU==
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
X-List-Received-Date: Sat, 25 Feb 2023 06:44:51 -0000


On 2023/2/25 01:45, Daniel Henrique Barboza wrote:
> Retrieving the CPU pointer using env_archcpu() just to access cpu->cfg
> can be avoided by using riscv_cpu_cfg().
>
> Suggested-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Weiwei Li
> ---
>   target/riscv/csr.c | 32 +++++++++-----------------------
>   1 file changed, 9 insertions(+), 23 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 53f1a331f9..ffa2d7b606 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -213,9 +213,7 @@ static RISCVException any32(CPURISCVState *env, int csrno)
>   
>   static int aia_any(CPURISCVState *env, int csrno)
>   {
> -    RISCVCPU *cpu = env_archcpu(env);
> -
> -    if (!cpu->cfg.ext_smaia) {
> +    if (!riscv_cpu_cfg(env)->ext_smaia) {
>           return RISCV_EXCP_ILLEGAL_INST;
>       }
>   
> @@ -224,9 +222,7 @@ static int aia_any(CPURISCVState *env, int csrno)
>   
>   static int aia_any32(CPURISCVState *env, int csrno)
>   {
> -    RISCVCPU *cpu = env_archcpu(env);
> -
> -    if (!cpu->cfg.ext_smaia) {
> +    if (!riscv_cpu_cfg(env)->ext_smaia) {
>           return RISCV_EXCP_ILLEGAL_INST;
>       }
>   
> @@ -253,9 +249,7 @@ static int smode32(CPURISCVState *env, int csrno)
>   
>   static int aia_smode(CPURISCVState *env, int csrno)
>   {
> -    RISCVCPU *cpu = env_archcpu(env);
> -
> -    if (!cpu->cfg.ext_ssaia) {
> +    if (!riscv_cpu_cfg(env)->ext_ssaia) {
>           return RISCV_EXCP_ILLEGAL_INST;
>       }
>   
> @@ -264,9 +258,7 @@ static int aia_smode(CPURISCVState *env, int csrno)
>   
>   static int aia_smode32(CPURISCVState *env, int csrno)
>   {
> -    RISCVCPU *cpu = env_archcpu(env);
> -
> -    if (!cpu->cfg.ext_ssaia) {
> +    if (!riscv_cpu_cfg(env)->ext_ssaia) {
>           return RISCV_EXCP_ILLEGAL_INST;
>       }
>   
> @@ -380,9 +372,7 @@ static RISCVException pointer_masking(CPURISCVState *env, int csrno)
>   
>   static int aia_hmode(CPURISCVState *env, int csrno)
>   {
> -    RISCVCPU *cpu = env_archcpu(env);
> -
> -    if (!cpu->cfg.ext_ssaia) {
> +    if (!riscv_cpu_cfg(env)->ext_ssaia) {
>           return RISCV_EXCP_ILLEGAL_INST;
>        }
>   
> @@ -391,9 +381,7 @@ static int aia_hmode(CPURISCVState *env, int csrno)
>   
>   static int aia_hmode32(CPURISCVState *env, int csrno)
>   {
> -    RISCVCPU *cpu = env_archcpu(env);
> -
> -    if (!cpu->cfg.ext_ssaia) {
> +    if (!riscv_cpu_cfg(env)->ext_ssaia) {
>           return RISCV_EXCP_ILLEGAL_INST;
>       }
>   
> @@ -430,9 +418,7 @@ static RISCVException debug(CPURISCVState *env, int csrno)
>   
>   static RISCVException seed(CPURISCVState *env, int csrno)
>   {
> -    RISCVCPU *cpu = env_archcpu(env);
> -
> -    if (!cpu->cfg.ext_zkr) {
> +    if (!riscv_cpu_cfg(env)->ext_zkr) {
>           return RISCV_EXCP_ILLEGAL_INST;
>       }
>   
> @@ -555,7 +541,7 @@ static RISCVException read_vl(CPURISCVState *env, int csrno,
>   
>   static int read_vlenb(CPURISCVState *env, int csrno, target_ulong *val)
>   {
> -    *val = env_archcpu(env)->cfg.vlen >> 3;
> +    *val = riscv_cpu_cfg(env)->vlen >> 3;
>       return RISCV_EXCP_NONE;
>   }
>   
> @@ -610,7 +596,7 @@ static RISCVException write_vstart(CPURISCVState *env, int csrno,
>        * The vstart CSR is defined to have only enough writable bits
>        * to hold the largest element index, i.e. lg2(VLEN) bits.
>        */
> -    env->vstart = val & ~(~0ULL << ctzl(env_archcpu(env)->cfg.vlen));
> +    env->vstart = val & ~(~0ULL << ctzl(riscv_cpu_cfg(env)->vlen));
>       return RISCV_EXCP_NONE;
>   }
>   


