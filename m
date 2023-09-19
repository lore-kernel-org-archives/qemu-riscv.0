Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40511CD54AF
	for <qemu-riscv@archiver.kernel.org>; Tue, 19 Sep 2023 11:20:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qiYmc-00060I-Gr; Tue, 19 Sep 2023 07:20:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qiYmT-0005xu-PJ; Tue, 19 Sep 2023 07:20:37 -0400
Received: from out30-101.freemail.mail.aliyun.com ([115.124.30.101])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qiYmP-00070J-1B; Tue, 19 Sep 2023 07:20:37 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R401e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045176;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VsRL9nx_1695122413; 
Received: from 30.221.108.237(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VsRL9nx_1695122413) by smtp.aliyun-inc.com;
 Tue, 19 Sep 2023 19:20:14 +0800
Message-ID: <545cb0b2-9045-9a59-2ac3-025c01f7871b@linux.alibaba.com>
Date: Tue, 19 Sep 2023 19:19:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 07/19] target/riscv/cpu.c: mark extensions arrays as
 'const'
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, palmer@rivosinc.com, ajones@ventanamicro.com,
 philmd@linaro.org
References: <20230906091647.1667171-1-dbarboza@ventanamicro.com>
 <20230906091647.1667171-8-dbarboza@ventanamicro.com>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230906091647.1667171-8-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.101;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-101.freemail.mail.aliyun.com
X-Spam_score_int: -113
X-Spam_score: -11.4
X-Spam_bar: -----------
X-Spam_report: (-11.4 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-1.473, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org


On 2023/9/6 17:16, Daniel Henrique Barboza wrote:
> We'll need to export these arrays to the accelerator classes in the next
> patches. Mark them as 'const' now because they should not be modified at
> runtime.
>
> Note that 'riscv_cpu_options' will also be exported, but can't be marked
> as 'const', because the properties are changed via
> qdev_property_add_static().
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

> ---
>   target/riscv/cpu.c | 22 +++++++++++++---------
>   1 file changed, 13 insertions(+), 9 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index c15bb572d4..50c2819d68 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1407,7 +1407,7 @@ typedef struct RISCVCPUMultiExtConfig {
>       {.name = _name, .offset = CPU_CFG_OFFSET(_prop), \
>        .enabled = _defval}
>   
> -static RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
> +static const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
>       /* Defaults for standard extensions */
>       MULTI_EXT_CFG_BOOL("sscofpmf", ext_sscofpmf, false),
>       MULTI_EXT_CFG_BOOL("Zifencei", ext_ifencei, true),
> @@ -1469,7 +1469,7 @@ static RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
>       DEFINE_PROP_END_OF_LIST(),
>   };
>   
> -static RISCVCPUMultiExtConfig riscv_cpu_vendor_exts[] = {
> +static const RISCVCPUMultiExtConfig riscv_cpu_vendor_exts[] = {
>       MULTI_EXT_CFG_BOOL("xtheadba", ext_xtheadba, false),
>       MULTI_EXT_CFG_BOOL("xtheadbb", ext_xtheadbb, false),
>       MULTI_EXT_CFG_BOOL("xtheadbs", ext_xtheadbs, false),
> @@ -1487,7 +1487,7 @@ static RISCVCPUMultiExtConfig riscv_cpu_vendor_exts[] = {
>   };
>   
>   /* These are experimental so mark with 'x-' */
> -static RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[] = {
> +static const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[] = {
>       /* ePMP 0.9.3 */
>       MULTI_EXT_CFG_BOOL("x-epmp", epmp, false),
>       MULTI_EXT_CFG_BOOL("x-smaia", ext_smaia, false),
> @@ -1558,7 +1558,7 @@ static void cpu_get_multi_ext_cfg(Object *obj, Visitor *v, const char *name,
>   }
>   
>   static void cpu_add_multi_ext_prop(Object *cpu_obj,
> -                                   RISCVCPUMultiExtConfig *multi_cfg)
> +                                   const RISCVCPUMultiExtConfig *multi_cfg)
>   {
>       object_property_add(cpu_obj, multi_cfg->name, "bool",
>                           cpu_get_multi_ext_cfg,
> @@ -1594,11 +1594,13 @@ static void cpu_set_cfg_unavailable(Object *obj, Visitor *v,
>   #endif
>   
>   static void riscv_cpu_add_multiext_prop_array(Object *obj,
> -                                              RISCVCPUMultiExtConfig *array)
> +                                        const RISCVCPUMultiExtConfig *array)
>   {
> +    const RISCVCPUMultiExtConfig *prop;
> +
>       g_assert(array);
>   
> -    for (RISCVCPUMultiExtConfig *prop = array; prop && prop->name; prop++) {
> +    for (prop = array; prop && prop->name; prop++) {
>           cpu_add_multi_ext_prop(obj, prop);
>       }
>   }
> @@ -1622,11 +1624,13 @@ static void riscv_cpu_add_kvm_unavail_prop(Object *obj, const char *prop_name)
>   }
>   
>   static void riscv_cpu_add_kvm_unavail_prop_array(Object *obj,
> -                                                 RISCVCPUMultiExtConfig *array)
> +                                        const RISCVCPUMultiExtConfig *array)
>   {
> +    const RISCVCPUMultiExtConfig *prop;
> +
>       g_assert(array);
>   
> -    for (RISCVCPUMultiExtConfig *prop = array; prop && prop->name; prop++) {
> +    for (prop = array; prop && prop->name; prop++) {
>           riscv_cpu_add_kvm_unavail_prop(obj, prop->name);
>       }
>   }
> @@ -1689,7 +1693,7 @@ static void riscv_init_max_cpu_extensions(Object *obj)
>   {
>       RISCVCPU *cpu = RISCV_CPU(obj);
>       CPURISCVState *env = &cpu->env;
> -    RISCVCPUMultiExtConfig *prop;
> +    const RISCVCPUMultiExtConfig *prop;
>   
>       /* Enable RVG, RVJ and RVV that are disabled by default */
>       set_misa(env, env->misa_mxl, env->misa_ext | RVG | RVJ | RVV);

