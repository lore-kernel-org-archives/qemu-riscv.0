Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23A9CE95A8F
	for <qemu-riscv@archiver.kernel.org>; Sun,  8 Oct 2023 05:11:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qpM4H-0000f1-Iz; Sun, 08 Oct 2023 01:11:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1qpM4E-0000eF-55; Sun, 08 Oct 2023 01:11:02 -0400
Received: from mail-sender-0.a4lg.com ([2401:2500:203:30b:4000:6bfe:4757:0])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <research_trasio@irq.a4lg.com>)
 id 1qpM47-0001nx-IT; Sun, 08 Oct 2023 01:11:01 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by mail-sender-0.a4lg.com (Postfix) with ESMTPSA id 74940300089;
 Sun,  8 Oct 2023 05:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irq.a4lg.com;
 s=2017s01; t=1696741843;
 bh=BFQ22wCzs7mj8IPfQNhRwYLL+TJAoLgzGgXT9z57Z6o=;
 h=Message-ID:Date:Mime-Version:Subject:To:References:Cc:From:
 In-Reply-To:Content-Type:Content-Transfer-Encoding;
 b=V6T28PJMF4CnqSpmTWwifwi/YhXGnGiWZbTAyzHOuex0UzktmwlnO7EZv8y42sGYG
 NTKmo/4XLgGXVm39GTFI8mdkEfiqYWfu/kBcZ9lZI/MkJ0oPMb83O61nAcuZIMo2Vv
 BEvszYe0Mzm+fRUVLQtwKoGsrvOQdvLpdpRJXX8Q=
Message-ID: <197ccae9-18c6-4ef3-8662-98b8c8ee2446@irq.a4lg.com>
Date: Sun, 8 Oct 2023 14:10:41 +0900
Mime-Version: 1.0
Subject: Re: [PATCH] target/riscv: deprecate capital 'Z' CPU properties
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
References: <20231007171427.1210117-1-dbarboza@ventanamicro.com>
Content-Language: en-US
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
From: Tsukasa OI <research_trasio@irq.a4lg.com>
In-Reply-To: <20231007171427.1210117-1-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2401:2500:203:30b:4000:6bfe:4757:0;
 envelope-from=research_trasio@irq.a4lg.com; helo=mail-sender-0.a4lg.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

That's great!

I submitted a patch set to deal with the exact problem:

<https://lists.gnu.org/archive/html/qemu-riscv/2022-05/msg00227.html>
<https://lists.gnu.org/archive/html/qemu-riscv/2022-05/msg00411.html>

But this one is simpler than mine (and also fits to the latest QEMU).

I support this patch set and want it to be merged.

Thanks,
Tsukasa

On 2023/10/08 2:14, Daniel Henrique Barboza wrote:
> At this moment there are eleven CPU extension properties that starts
> with capital 'Z': Zifencei, Zicsr, Zihintntl, Zihintpause, Zawrs, Zfa,
> Zfh, Zfhmin, Zve32f, Zve64f and Zve64d. All other extensions are named
> with lower-case letters.
> 
> We want all properties to be named with lower-case letters since it's
> consistent with the riscv-isa string that we create in the FDT. Having
> these 11 properties to be exceptions can be confusing.
> 
> Deprecate all of them. Create their lower-case counterpart to be used as
> maintained CPU properties. When trying to use any deprecated property a
> warning message will be displayed, recommending users to switch to the
> lower-case variant:
> 
> ./build/qemu-system-riscv64 -M virt -cpu rv64,Zifencei=true --nographic
> qemu-system-riscv64: warning: CPU property 'Zifencei' is deprecated. Please use 'zifencei' instead
> 
> This will give users some time to change their scripts before we remove
> the capital 'Z' properties entirely.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  docs/about/deprecated.rst  | 23 ++++++++++++++++++++++
>  target/riscv/cpu.c         | 39 +++++++++++++++++++++++++++-----------
>  target/riscv/cpu.h         |  1 +
>  target/riscv/tcg/tcg-cpu.c | 31 +++++++++++++++++++++++++++++-
>  4 files changed, 82 insertions(+), 12 deletions(-)
> 
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index 694b878f36..331f10f930 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -378,6 +378,29 @@ of generic CPUs: rv32 and rv64 as default CPUs and 'max' as a feature complete
>  CPU for both 32 and 64 bit builds. Users are then discouraged to use the 'any'
>  CPU type starting in 8.2.
>  
> +RISC-V CPU properties which start with with capital 'Z' (since 8.2)
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +All RISC-V CPU properties which start with capital 'Z' are being deprecated
> +starting in 8.2. The reason is that they were wrongly added with capital 'Z'
> +in the past. CPU properties were later added with lower-case names, which
> +is the format we want to use from now on.
> +
> +Users which try to use these deprecated properties will receive a warning
> +recommending to switch to their stable counterparts:
> +
> +- "Zifencei" should be replaced with "zifencei"
> +- "Zicsr" should be replaced with "zicsr"
> +- "Zihintntl" should be replaced with "zihintntl"
> +- "Zihintpause" should be replaced with "zihintpause"
> +- "Zawrs" should be replaced with "zawrs"
> +- "Zfa" should be replaced with "zfa"
> +- "Zfh" should be replaced with "zfh"
> +- "Zfhmin" should be replaced with "zfhmin"
> +- "Zve32f" should be replaced with "zve32f"
> +- "Zve64f" should be replaced with "zve64f"
> +- "Zve64d" should be replaced with "zve64d"
> +
>  Block device options
>  ''''''''''''''''''''
>  
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 521bb88538..1cdc3d2609 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1246,17 +1246,17 @@ const char *riscv_get_misa_ext_description(uint32_t bit)
>  const RISCVCPUMultiExtConfig riscv_cpu_extensions[] = {
>      /* Defaults for standard extensions */
>      MULTI_EXT_CFG_BOOL("sscofpmf", ext_sscofpmf, false),
> -    MULTI_EXT_CFG_BOOL("Zifencei", ext_ifencei, true),
> -    MULTI_EXT_CFG_BOOL("Zicsr", ext_icsr, true),
> -    MULTI_EXT_CFG_BOOL("Zihintntl", ext_zihintntl, true),
> -    MULTI_EXT_CFG_BOOL("Zihintpause", ext_zihintpause, true),
> -    MULTI_EXT_CFG_BOOL("Zawrs", ext_zawrs, true),
> -    MULTI_EXT_CFG_BOOL("Zfa", ext_zfa, true),
> -    MULTI_EXT_CFG_BOOL("Zfh", ext_zfh, false),
> -    MULTI_EXT_CFG_BOOL("Zfhmin", ext_zfhmin, false),
> -    MULTI_EXT_CFG_BOOL("Zve32f", ext_zve32f, false),
> -    MULTI_EXT_CFG_BOOL("Zve64f", ext_zve64f, false),
> -    MULTI_EXT_CFG_BOOL("Zve64d", ext_zve64d, false),
> +    MULTI_EXT_CFG_BOOL("zifencei", ext_ifencei, true),
> +    MULTI_EXT_CFG_BOOL("zicsr", ext_icsr, true),
> +    MULTI_EXT_CFG_BOOL("zihintntl", ext_zihintntl, true),
> +    MULTI_EXT_CFG_BOOL("zihintpause", ext_zihintpause, true),
> +    MULTI_EXT_CFG_BOOL("zawrs", ext_zawrs, true),
> +    MULTI_EXT_CFG_BOOL("zfa", ext_zfa, true),
> +    MULTI_EXT_CFG_BOOL("zfh", ext_zfh, false),
> +    MULTI_EXT_CFG_BOOL("zfhmin", ext_zfhmin, false),
> +    MULTI_EXT_CFG_BOOL("zve32f", ext_zve32f, false),
> +    MULTI_EXT_CFG_BOOL("zve64f", ext_zve64f, false),
> +    MULTI_EXT_CFG_BOOL("zve64d", ext_zve64d, false),
>      MULTI_EXT_CFG_BOOL("sstc", ext_sstc, true),
>  
>      MULTI_EXT_CFG_BOOL("smstateen", ext_smstateen, false),
> @@ -1349,6 +1349,23 @@ const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[] = {
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> +/* Deprecated entries marked for future removal */
> +const RISCVCPUMultiExtConfig riscv_cpu_deprecated_exts[] = {
> +    MULTI_EXT_CFG_BOOL("Zifencei", ext_ifencei, true),
> +    MULTI_EXT_CFG_BOOL("Zicsr", ext_icsr, true),
> +    MULTI_EXT_CFG_BOOL("Zihintntl", ext_zihintntl, true),
> +    MULTI_EXT_CFG_BOOL("Zihintpause", ext_zihintpause, true),
> +    MULTI_EXT_CFG_BOOL("Zawrs", ext_zawrs, true),
> +    MULTI_EXT_CFG_BOOL("Zfa", ext_zfa, true),
> +    MULTI_EXT_CFG_BOOL("Zfh", ext_zfh, false),
> +    MULTI_EXT_CFG_BOOL("Zfhmin", ext_zfhmin, false),
> +    MULTI_EXT_CFG_BOOL("Zve32f", ext_zve32f, false),
> +    MULTI_EXT_CFG_BOOL("Zve64f", ext_zve64f, false),
> +    MULTI_EXT_CFG_BOOL("Zve64d", ext_zve64d, false),
> +
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
>  Property riscv_cpu_options[] = {
>      DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
>  
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 3f11e69223..e98f5de32e 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -722,6 +722,7 @@ typedef struct RISCVCPUMultiExtConfig {
>  extern const RISCVCPUMultiExtConfig riscv_cpu_extensions[];
>  extern const RISCVCPUMultiExtConfig riscv_cpu_vendor_exts[];
>  extern const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[];
> +extern const RISCVCPUMultiExtConfig riscv_cpu_deprecated_exts[];
>  extern Property riscv_cpu_options[];
>  
>  typedef struct isa_ext_data {
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 08b806dc07..00676593f7 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -732,6 +732,25 @@ static void riscv_cpu_add_misa_properties(Object *cpu_obj)
>      }
>  }
>  
> +static bool cpu_ext_is_deprecated(const char *ext_name)
> +{
> +    return isupper(ext_name[0]);
> +}
> +
> +/*
> + * String will be allocated in the heap. Caller is responsible
> + * for freeing it.
> + */
> +static char *cpu_ext_to_lower(const char *ext_name)
> +{
> +    char *ret = g_malloc0(strlen(ext_name) + 1);
> +
> +    strcpy(ret, ext_name);
> +    ret[0] = tolower(ret[0]);
> +
> +    return ret;
> +}
> +
>  static void cpu_set_multi_ext_cfg(Object *obj, Visitor *v, const char *name,
>                                    void *opaque, Error **errp)
>  {
> @@ -744,6 +763,13 @@ static void cpu_set_multi_ext_cfg(Object *obj, Visitor *v, const char *name,
>          return;
>      }
>  
> +    if (cpu_ext_is_deprecated(multi_ext_cfg->name)) {
> +        g_autofree char *lower = cpu_ext_to_lower(multi_ext_cfg->name);
> +
> +        warn_report("CPU property '%s' is deprecated. Please use '%s' instead",
> +                    multi_ext_cfg->name, lower);
> +    }
> +
>      g_hash_table_insert(multi_ext_user_opts,
>                          GUINT_TO_POINTER(multi_ext_cfg->offset),
>                          (gpointer)value);
> @@ -777,13 +803,14 @@ static void cpu_add_multi_ext_prop(Object *cpu_obj,
>                                     const RISCVCPUMultiExtConfig *multi_cfg)
>  {
>      bool generic_cpu = riscv_cpu_is_generic(cpu_obj);
> +    bool deprecated_ext = cpu_ext_is_deprecated(multi_cfg->name);
>  
>      object_property_add(cpu_obj, multi_cfg->name, "bool",
>                          cpu_get_multi_ext_cfg,
>                          cpu_set_multi_ext_cfg,
>                          NULL, (void *)multi_cfg);
>  
> -    if (!generic_cpu) {
> +    if (!generic_cpu || deprecated_ext) {
>          return;
>      }
>  
> @@ -826,6 +853,8 @@ static void riscv_cpu_add_user_properties(Object *obj)
>      riscv_cpu_add_multiext_prop_array(obj, riscv_cpu_vendor_exts);
>      riscv_cpu_add_multiext_prop_array(obj, riscv_cpu_experimental_exts);
>  
> +    riscv_cpu_add_multiext_prop_array(obj, riscv_cpu_deprecated_exts);
> +
>      for (Property *prop = riscv_cpu_options; prop && prop->name; prop++) {
>          qdev_property_add_static(DEVICE(obj), prop);
>      }

