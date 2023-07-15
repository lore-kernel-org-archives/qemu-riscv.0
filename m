Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11609EB64DA
	for <qemu-riscv@archiver.kernel.org>; Sat, 15 Jul 2023 02:34:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qKV7O-0000of-AQ; Fri, 14 Jul 2023 22:34:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1qKV7M-0000oD-LX; Fri, 14 Jul 2023 22:34:44 -0400
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1qKV7J-00055U-Qy; Fri, 14 Jul 2023 22:34:44 -0400
Received: from [192.168.0.120] (unknown [180.175.26.191])
 by APP-01 (Coremail) with SMTP id qwCowADn7wu4BbJkotopCw--.31217S2;
 Sat, 15 Jul 2023 10:34:33 +0800 (CST)
Message-ID: <4328c272-cc7e-6c81-32fb-f2135d054629@iscas.ac.cn>
Date: Sat, 15 Jul 2023 10:34:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Cc: liweiwei@iscas.ac.cn, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 richard.henderson@linaro.org
Subject: Re: [PATCH for-8.2 v3 6/8] target/riscv: add 'max' CPU type
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
References: <20230714174311.672359-1-dbarboza@ventanamicro.com>
 <20230714174311.672359-7-dbarboza@ventanamicro.com>
Content-Language: en-US
From: Weiwei Li <liweiwei@iscas.ac.cn>
In-Reply-To: <20230714174311.672359-7-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: qwCowADn7wu4BbJkotopCw--.31217S2
X-Coremail-Antispam: 1UD129KBjvJXoWxKF1DuF1fJF45JF4xZw4UXFb_yoW7Wr17pF
 45GFZ09FZ8XFs7t3yfJw1kWrs5Aw40gw4agw43Ww42va1fJ3y3Jr1DtF4jkF1DWF4xZ3WY
 9w1YkF13Zw43tFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8JV
 W8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07AlzVAY
 IcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
 v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkG
 c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
 MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUdHUDUUU
 UU=
X-Originating-IP: [180.175.26.191]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.091,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org


On 2023/7/15 01:43, Daniel Henrique Barboza wrote:
> The 'max' CPU type is used by tooling to determine what's the most
> capable CPU a current QEMU version implements. Other archs such as ARM
> implements this type. Let's add it to RISC-V.
>
> What we consider "most capable CPU" in this context are related to
> ratified, non-vendor extensions. This means that we want the 'max' CPU
> to enable all (possible) ratified extensions by default. The reasoning
> behind this design is (1) vendor extensions can conflict with each other
> and we won't play favorities deciding which one is default or not and
> (2) non-ratified extensions are always prone to changes, not being
> stable enough to be enabled by default.
>
> All this said, we're still not able to enable all ratified extensions
> due to conflicts between them. Zfinx and all its dependencies aren't
> enabled because of a conflict with RVF. zce, zcmp and zcmt are also
> disabled due to RVD conflicts. When running with 64 bits we're also
> disabling zcf.
>
> MISA bits RVG, RVJ and RVV are also being set manually since they're
> default disabled.
>
> This is the resulting 'riscv,isa' DT for this new CPU:
>
> rv64imafdcvh_zicbom_zicboz_zicsr_zifencei_zihintpause_zawrs_zfa_
> zfh_zfhmin_zca_zcb_zcd_zba_zbb_zbc_zbkb_zbkc_zbkx_zbs_zk_zkn_zknd_
> zkne_zknh_zkr_zks_zksed_zksh_zkt_zve32f_zve64f_zve64d_
> smstateen_sscofpmf_sstc_svadu_svinval_svnapot_svpbmt
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---

Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Weiwei Li
>   target/riscv/cpu-qom.h |  1 +
>   target/riscv/cpu.c     | 53 ++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 54 insertions(+)
>
> diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
> index 04af50983e..f3fbe37a2c 100644
> --- a/target/riscv/cpu-qom.h
> +++ b/target/riscv/cpu-qom.h
> @@ -30,6 +30,7 @@
>   #define CPU_RESOLVING_TYPE TYPE_RISCV_CPU
>   
>   #define TYPE_RISCV_CPU_ANY              RISCV_CPU_TYPE_NAME("any")
> +#define TYPE_RISCV_CPU_MAX              RISCV_CPU_TYPE_NAME("max")
>   #define TYPE_RISCV_CPU_BASE32           RISCV_CPU_TYPE_NAME("rv32")
>   #define TYPE_RISCV_CPU_BASE64           RISCV_CPU_TYPE_NAME("rv64")
>   #define TYPE_RISCV_CPU_BASE128          RISCV_CPU_TYPE_NAME("x-rv128")
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index f7083b2d5c..1cdffd5927 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -248,6 +248,7 @@ static const char * const riscv_intr_names[] = {
>   };
>   
>   static void riscv_cpu_add_user_properties(Object *obj);
> +static void riscv_init_max_cpu_extensions(Object *obj);
>   
>   const char *riscv_cpu_get_trap_name(target_ulong cause, bool async)
>   {
> @@ -374,6 +375,25 @@ static void riscv_any_cpu_init(Object *obj)
>       cpu->cfg.pmp = true;
>   }
>   
> +static void riscv_max_cpu_init(Object *obj)
> +{
> +    RISCVCPU *cpu = RISCV_CPU(obj);
> +    CPURISCVState *env = &cpu->env;
> +    RISCVMXL mlx = MXL_RV64;
> +
> +#ifdef TARGET_RISCV32
> +    mlx = MXL_RV32;
> +#endif
> +    set_misa(env, mlx, 0);
> +    riscv_cpu_add_user_properties(obj);
> +    riscv_init_max_cpu_extensions(obj);
> +    env->priv_ver = PRIV_VERSION_LATEST;
> +#ifndef CONFIG_USER_ONLY
> +    set_satp_mode_max_supported(RISCV_CPU(obj), mlx == MXL_RV32 ?
> +                                VM_1_10_SV32 : VM_1_10_SV57);
> +#endif
> +}
> +
>   #if defined(TARGET_RISCV64)
>   static void rv64_base_cpu_init(Object *obj)
>   {
> @@ -1930,6 +1950,38 @@ static void riscv_cpu_add_user_properties(Object *obj)
>       ADD_CPU_PROPERTIES_ARRAY(dev, riscv_cpu_experimental_exts);
>   }
>   
> +/*
> + * The 'max' type CPU will have all possible ratified
> + * non-vendor extensions enabled.
> + */
> +static void riscv_init_max_cpu_extensions(Object *obj)
> +{
> +    RISCVCPU *cpu = RISCV_CPU(obj);
> +    CPURISCVState *env = &cpu->env;
> +    Property *prop;
> +
> +    /* Enable RVG, RVJ and RVV that are disabled by default */
> +    set_misa(env, env->misa_mxl, env->misa_ext | RVG | RVJ | RVV);
> +
> +    for (prop = riscv_cpu_extensions; prop && prop->name; prop++) {
> +        object_property_set_bool(obj, prop->name, true, NULL);
> +    }
> +
> +    /* Zfinx is not compatible with F. Disable it */
> +    object_property_set_bool(obj, "zfinx", false, NULL);
> +    object_property_set_bool(obj, "zdinx", false, NULL);
> +    object_property_set_bool(obj, "zhinx", false, NULL);
> +    object_property_set_bool(obj, "zhinxmin", false, NULL);
> +
> +    object_property_set_bool(obj, "zce", false, NULL);
> +    object_property_set_bool(obj, "zcmp", false, NULL);
> +    object_property_set_bool(obj, "zcmt", false, NULL);
> +
> +    if (env->misa_mxl != MXL_RV32) {
> +        object_property_set_bool(obj, "zcf", false, NULL);
> +    }
> +}
> +
>   static Property riscv_cpu_properties[] = {
>       DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
>   
> @@ -2268,6 +2320,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
>           .abstract = true,
>       },
>       DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_ANY,      riscv_any_cpu_init),
> +    DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_MAX,      riscv_max_cpu_init),
>   #if defined(CONFIG_KVM)
>       DEFINE_CPU(TYPE_RISCV_CPU_HOST,             riscv_host_cpu_init),
>   #endif


