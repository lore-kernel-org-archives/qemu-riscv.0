Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1phREM-0004pM-7T
	for mharc-qemu-riscv@gnu.org; Wed, 29 Mar 2023 04:32:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1phREK-0004or-Ap; Wed, 29 Mar 2023 04:32:28 -0400
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1phREH-0002Qk-4T; Wed, 29 Mar 2023 04:32:27 -0400
Received: from [192.168.0.119] (unknown [180.175.29.170])
 by APP-01 (Coremail) with SMTP id qwCowAAnL8+O9yNkdMaLGA--.56506S2;
 Wed, 29 Mar 2023 16:32:15 +0800 (CST)
Message-ID: <4464e2e6-278f-5031-b358-fab35a37b927@iscas.ac.cn>
Date: Wed, 29 Mar 2023 16:32:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Cc: liweiwei@iscas.ac.cn, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org
Subject: Re: [PATCH v2 02/19] target/riscv: remove MISA properties from
 isa_edata_arr[]
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
References: <20230327224934.363314-1-dbarboza@ventanamicro.com>
 <20230327224934.363314-3-dbarboza@ventanamicro.com>
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230327224934.363314-3-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAAnL8+O9yNkdMaLGA--.56506S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXw4UCw13Gw17urW7uryxGrg_yoW5WFW3pF
 W8G3yakr1DJFnrJ3yfJr15J3W5Crn5W397Wws3G34xJrZxJrZ5Gr1qk3yIgry8JFZ5ur4F
 va1jqF17ZF4DCFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07AlzVAY
 IcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
 v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkG
 c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
 MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUdHUDUUU
 UU=
X-Originating-IP: [180.175.29.170]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Wed, 29 Mar 2023 08:32:28 -0000


On 2023/3/28 06:49, Daniel Henrique Barboza wrote:
> The code that disables extensions if there's a priv version mismatch
> uses cpu->cfg.ext_N properties to do its job.
>
> We're aiming to not rely on cpu->cfg.ext_N props for MISA bits. Split
> the MISA related verifications in a new function, removing it from
> isa_edata_arr[].
>
> We're also erroring it out instead of disabling, making the cpu_init()
> function responsible for running an adequate priv spec for the MISA
> extensions it wants to use.
>
> Note that the RVV verification is being ignored since we're always have
> at least PRIV_VERSION_1_10_0.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   target/riscv/cpu.c | 19 +++++++++++++++++--
>   1 file changed, 17 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 2711d80e16..21c0c637e4 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -72,10 +72,11 @@ struct isa_ext_data {
>    * 4. Non-standard extensions (starts with 'X') must be listed after all
>    *    standard extensions. They must be separated from other multi-letter
>    *    extensions by an underscore.
> + *
> + * Single letter extensions are checked in riscv_cpu_validate_misa_priv()
> + * instead.
>    */
>   static const struct isa_ext_data isa_edata_arr[] = {
> -    ISA_EXT_DATA_ENTRY(h, false, PRIV_VERSION_1_12_0, ext_h),
> -    ISA_EXT_DATA_ENTRY(v, false, PRIV_VERSION_1_10_0, ext_v),

If misa properties are removed from here,  the multi_letter field in 
isa_edata_arr will be redundant.

We can just remove it. Otherwise, the all patchset is LGTM.

Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Weiwei Li

>       ISA_EXT_DATA_ENTRY(zicbom, true, PRIV_VERSION_1_12_0, ext_icbom),
>       ISA_EXT_DATA_ENTRY(zicboz, true, PRIV_VERSION_1_12_0, ext_icboz),
>       ISA_EXT_DATA_ENTRY(zicond, true, PRIV_VERSION_1_12_0, ext_zicond),
> @@ -1131,6 +1132,14 @@ static void riscv_cpu_sync_misa_cfg(CPURISCVState *env)
>       env->misa_ext = env->misa_ext_mask = ext;
>   }
>   
> +static void riscv_cpu_validate_misa_priv(CPURISCVState *env, Error **errp)
> +{
> +    if (riscv_has_ext(env, RVH) && env->priv_ver < PRIV_VERSION_1_12_0) {
> +        error_setg(errp, "H extension requires priv spec 1.12.0");
> +        return;
> +    }
> +}
> +
>   static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>   {
>       CPUState *cs = CPU(dev);
> @@ -1174,6 +1183,12 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>        */
>       riscv_cpu_sync_misa_cfg(env);
>   
> +    riscv_cpu_validate_misa_priv(env, &local_err);
> +    if (local_err != NULL) {
> +        error_propagate(errp, local_err);
> +        return;
> +    }
> +
>       /* Force disable extensions if priv spec version does not match */
>       for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
>           if (isa_ext_is_enabled(cpu, &isa_edata_arr[i]) &&


