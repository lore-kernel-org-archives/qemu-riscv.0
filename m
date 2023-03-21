Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1peSd1-0003ur-9l
	for mharc-qemu-riscv@gnu.org; Mon, 20 Mar 2023 23:25:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1peScz-0003uL-Gn; Mon, 20 Mar 2023 23:25:37 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1peScw-0003LR-Ix; Mon, 20 Mar 2023 23:25:37 -0400
Received: from [192.168.0.120] (unknown [180.165.240.243])
 by APP-05 (Coremail) with SMTP id zQCowACnlxSjIxlkFpNGBw--.46320S2;
 Tue, 21 Mar 2023 11:25:25 +0800 (CST)
Message-ID: <8b219f0e-cfd8-390e-405c-2fd9b1e784b5@iscas.ac.cn>
Date: Tue, 21 Mar 2023 11:25:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Cc: liweiwei@iscas.ac.cn, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
Subject: Re: [PATCH for-8.1 v3 25/26] target/riscv: allow write_misa() to
 enable RVG
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
References: <20230318200436.299464-1-dbarboza@ventanamicro.com>
 <20230318200436.299464-26-dbarboza@ventanamicro.com>
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230318200436.299464-26-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: zQCowACnlxSjIxlkFpNGBw--.46320S2
X-Coremail-Antispam: 1UD129KBjvJXoWxuF4UtF48AFyrGFykAr4rGrg_yoW5KrW5pr
 4UG3yYyrWDJFZrX3yftr1UXF18Aws2gr4fKwn7Ww1fAan8ArWrGF1DKw12kFyxWFWkur4a
 va1qkF1avF40ya7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07AlzVAY
 IcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
 v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkG
 c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
 MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUdHUDUUU
 UU=
X-Originating-IP: [180.165.240.243]
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
X-List-Received-Date: Tue, 21 Mar 2023 03:25:37 -0000


On 2023/3/19 04:04, Daniel Henrique Barboza wrote:
> Allow write_misa() to enable RVG by changing riscv_cpu_enable_g()
> slighty: instead of returning void, return the current env->misa_ext
> value. This is then retrieved by 'val', which will add the RVG flag
> itself, and then we'll skip validation and go right into commiting the
> changes.
>
> The reason why it's ok to skip validation in this case is because we're
> only allowing RVG (and its associated extensions/Z extensions) to be
> enabled in the hart, and riscv_cpu_enable_g() already does its own
> validation before enabling itself. Everything else is considered to be
> already validated beforehand, so we don't need to repeat ourselves.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   target/riscv/cpu.c |  7 +++++--
>   target/riscv/cpu.h |  2 ++
>   target/riscv/csr.c | 15 +++++++++++++++
>   3 files changed, 22 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 2d2a354af3..73a5fa46ee 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -281,7 +281,8 @@ static uint32_t riscv_get_misa_ext_with_cpucfg(RISCVCPUConfig *cfg)
>       return ext;
>   }
>   
> -static void riscv_cpu_enable_g(RISCVCPU *cpu, Error **errp)
> +
> +target_ulong riscv_cpu_enable_g(RISCVCPU *cpu, Error **errp)
>   {
>       CPURISCVState *env = &cpu->env;
>       RISCVCPUConfig *cfg = &cpu->cfg;
> @@ -289,7 +290,7 @@ static void riscv_cpu_enable_g(RISCVCPU *cpu, Error **errp)
>       if (cpu->cfg.ext_zfinx) {
>           error_setg(errp, "Unable to enable G: Zfinx is enabled, "
>                            "so F can not be enabled");
> -        return;
> +        return 0;
>       }
>   
>       if (!(cfg->ext_i && cfg->ext_m && cfg->ext_a &&
> @@ -315,6 +316,8 @@ static void riscv_cpu_enable_g(RISCVCPU *cpu, Error **errp)
>           cfg->ext_icsr = true;
>           cfg->ext_ifencei = true;
>       }
> +
> +    return env->misa_ext;
>   }
>   
>   static void riscv_set_cpucfg_with_misa(RISCVCPUConfig *cfg,
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index befc3b8fff..3ca1d4903c 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -599,6 +599,8 @@ void riscv_cpu_validate_extensions(RISCVCPU *cpu, uint32_t misa_ext,
>                                      Error **errp);
>   void riscv_cpu_commit_cpu_cfg(RISCVCPU *cpu, uint32_t misa_ext);
>   
> +target_ulong riscv_cpu_enable_g(RISCVCPU *cpu, Error **errp);
> +
>   #define cpu_list riscv_cpu_list
>   #define cpu_mmu_index riscv_cpu_mmu_index
>   
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 839862f1a8..4335398c19 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1381,6 +1381,20 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
>           val &= RVE;
>       }
>   
> +    if (val & RVG && !(env->misa_ext & RVG)) {
> +        /*
> +         * If the write wants to enable RVG, only RVG and
> +         * its dependencies will be updated in the CSR.
> +         */
> +        val = riscv_cpu_enable_g(cpu, &local_err);
> +        if (local_err != NULL) {
> +            return RISCV_EXCP_NONE;
> +        }
> +
> +        val |= RVG;

This assignment is not necessary, since RVG is already set in val.

By the way, RVG is still not disabled if any some of included extensions 
are disabled by write_misa.

Regards,

Weiwei Li

> +        goto commit;
> +    }
> +
>       /*
>        * This flow is similar to what riscv_cpu_realize() does,
>        * with the difference that we will update env->misa_ext
> @@ -1396,6 +1410,7 @@ static RISCVException write_misa(CPURISCVState *env, int csrno,
>           return RISCV_EXCP_NONE;
>       }
>   
> +commit:
>       riscv_cpu_commit_cpu_cfg(cpu, val);
>   
>       if (!(val & RVF)) {


