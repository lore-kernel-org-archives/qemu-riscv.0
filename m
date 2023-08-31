Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88792C83F12
	for <qemu-riscv@archiver.kernel.org>; Thu, 31 Aug 2023 12:06:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qbgRI-00007E-Hx; Thu, 31 Aug 2023 08:06:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qbgRG-00006p-O0
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 08:06:18 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1qbgR7-0006zn-Ko
 for qemu-riscv@nongnu.org; Thu, 31 Aug 2023 08:06:15 -0400
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4ff8cf11b90so1468520e87.1
 for <qemu-riscv@nongnu.org>; Thu, 31 Aug 2023 05:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1693483566; x=1694088366; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qKzVzs26HPatWMKNvBArZEBUS1iqPOtkleuOceUodCE=;
 b=ZA2WihROYriMOU4hUkhjNHecBy2FjlO3NLoGpgNvZUm7zGoOgx9F2F0kSUcACw2Ztl
 2G/g7YcclWE8QAgTbO3TLVhWm/nHMiIc1sKBEUv7wgmXgPfMZXDgLXWRtosAPnv5kJg0
 F0aav506iBuiXW8x9jL+dq6Tq2ZXkMqzsHWLyN6gucFqhS6O3jiNnJw/gOX14iAbSG+d
 TN9GS0mBMdKjtRbEwfUGdOtKYZRypVZSpMuwwz/7/uNXs849b1cr5AHr7V3S9D4Nk1GI
 Ohn7Pzn0F4k5W3KD1KrjPhsoOM4eerig3i3i2IFla5wwDyFiPOC2lk7okYJCjqKQHi8Q
 dfhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693483566; x=1694088366;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qKzVzs26HPatWMKNvBArZEBUS1iqPOtkleuOceUodCE=;
 b=N2XspH1FjO2FW5UJmrvtqUrqsGFJfu1BHyhojvedZ42nbIewYGcYgpingDW+U4WRDP
 CK+fFwPwVQkWljqOybpIZ7uWV8s8TsYY3p6kdrgLc5NYK679sanEy+d6HbI/gW/V8Y0e
 Lpa1PpYTez+qjItTLdH3A1WLidUpU9UrGGV8s54ke+D58PngqkvhNWoYGiVDze737UU5
 NTIjMr+XttcNjolKAnm7uEE1B2YMUli2Xj0dHEI1/ja1mYs5ivg/B/myrHcfxeymUnrA
 fkOOVTiUeFd8D8RomxDA+FT8qtxu45QHXIa3VkOyZLCiWIyxcnkC/qqTzLBAIf9tko29
 ccwQ==
X-Gm-Message-State: AOJu0Yxsg4oEQpe1QboUcSwN0vTR1wvIFWzqABQZ4RCtF2k+FtSh/3Cv
 jD89qQAQIHqlYZiIYeKNsj5GYg==
X-Google-Smtp-Source: AGHT+IF5IX30il0m7PHtnH+Evzu22Ao1g3WTQq0FuThtccN8Vtm5uzVNzs7zVZmtIxBph2gm+Z31Og==
X-Received: by 2002:a05:6512:3481:b0:500:b42f:1830 with SMTP id
 v1-20020a056512348100b00500b42f1830mr3375493lfr.63.1693483566416; 
 Thu, 31 Aug 2023 05:06:06 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz.
 [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
 by smtp.gmail.com with ESMTPSA id
 g24-20020a170906395800b00992e265495csm687088eje.212.2023.08.31.05.06.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Aug 2023 05:06:05 -0700 (PDT)
Date: Thu, 31 Aug 2023 14:06:04 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com
Subject: Re: [PATCH 17/20] target/riscv/cpu.c: export isa_edata_arr[]
Message-ID: <20230831-5326ae2dedf427e7ed8a4264@orel>
References: <20230825130853.511782-1-dbarboza@ventanamicro.com>
 <20230825130853.511782-18-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230825130853.511782-18-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=ajones@ventanamicro.com; helo=mail-lf1-x134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Fri, Aug 25, 2023 at 10:08:50AM -0300, Daniel Henrique Barboza wrote:
> This array will be read by the TCG accel class, allowing it to handle
> priv spec verifications on its own. The array will remain here in cpu.c
> because it's also used by the riscv,isa string function.
> 
> To export it we'll make it constant and finish it with an empty element
                             ^ it's already constant

> since ARRAY_SIZE() won't work outside of cpu.c. Get rid of its
> ARRAY_SIZE() usage now to alleviate the changes for the next patch.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu.c | 47 +++++++++++++++++++++-------------------------
>  target/riscv/cpu.h |  7 +++++++
>  2 files changed, 28 insertions(+), 26 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 3c9db46837..ac5ad4727c 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -41,15 +41,6 @@ static const char riscv_single_letter_exts[] = "IEMAFDQCPVH";
>  const uint32_t misa_bits[] = {RVI, RVE, RVM, RVA, RVF, RVD, RVV,
>                                RVC, RVS, RVU, RVH, RVJ, RVG};
>  
> -struct isa_ext_data {
> -    const char *name;
> -    int min_version;
> -    int ext_enable_offset;
> -};
> -
> -#define ISA_EXT_DATA_ENTRY(_name, _min_ver, _prop) \
> -    {#_name, _min_ver, CPU_CFG_OFFSET(_prop)}
> -
>  /*
>   * From vector_helper.c
>   * Note that vector data is stored in host-endian 64-bit chunks,
> @@ -61,6 +52,9 @@ struct isa_ext_data {
>  #define BYTE(x)   (x)
>  #endif
>  
> +#define ISA_EXT_DATA_ENTRY(_name, _min_ver, _prop) \
> +    {#_name, _min_ver, CPU_CFG_OFFSET(_prop)}
> +
>  /*
>   * Here are the ordering rules of extension naming defined by RISC-V
>   * specification :
> @@ -81,7 +75,7 @@ struct isa_ext_data {
>   * Single letter extensions are checked in riscv_cpu_validate_misa_priv()
>   * instead.
>   */
> -static const struct isa_ext_data isa_edata_arr[] = {
> +const RISCVIsaExtData isa_edata_arr[] = {
>      ISA_EXT_DATA_ENTRY(zicbom, PRIV_VERSION_1_12_0, ext_icbom),
>      ISA_EXT_DATA_ENTRY(zicboz, PRIV_VERSION_1_12_0, ext_icboz),
>      ISA_EXT_DATA_ENTRY(zicond, PRIV_VERSION_1_12_0, ext_zicond),
> @@ -160,6 +154,8 @@ static const struct isa_ext_data isa_edata_arr[] = {
>      ISA_EXT_DATA_ENTRY(xtheadmempair, PRIV_VERSION_1_11_0, ext_xtheadmempair),
>      ISA_EXT_DATA_ENTRY(xtheadsync, PRIV_VERSION_1_11_0, ext_xtheadsync),
>      ISA_EXT_DATA_ENTRY(xventanacondops, PRIV_VERSION_1_12_0, ext_XVentanaCondOps),
> +
> +    DEFINE_PROP_END_OF_LIST(),
>  };
>  
>  bool isa_ext_is_enabled(RISCVCPU *cpu, uint32_t ext_offset)
> @@ -178,14 +174,14 @@ void isa_ext_update_enabled(RISCVCPU *cpu, uint32_t ext_offset, bool en)
>  
>  int cpu_cfg_ext_get_min_version(uint32_t ext_offset)
>  {
> -    int i;
> +    const RISCVIsaExtData *edata;
>  
> -    for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
> -        if (isa_edata_arr[i].ext_enable_offset != ext_offset) {
> +    for (edata = isa_edata_arr; edata && edata->name; edata++) {

Just checking edata->name is sufficient.

> +        if (edata->ext_enable_offset != ext_offset) {
>              continue;
>          }
>  
> -        return isa_edata_arr[i].min_version;
> +        return edata->min_version;
>      }
>  
>      /* Default to oldest priv spec if no match found */
> @@ -933,22 +929,21 @@ static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
>  void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
>  {
>      CPURISCVState *env = &cpu->env;
> -    int i;
> +    const RISCVIsaExtData *edata;
>  
>      /* Force disable extensions if priv spec version does not match */
> -    for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
> -        if (isa_ext_is_enabled(cpu, isa_edata_arr[i].ext_enable_offset) &&
> -            (env->priv_ver < isa_edata_arr[i].min_version)) {
> -            isa_ext_update_enabled(cpu, isa_edata_arr[i].ext_enable_offset,
> -                                   false);
> +    for (edata = isa_edata_arr; edata && edata->name; edata++) {
> +        if (isa_ext_is_enabled(cpu, edata->ext_enable_offset) &&
> +            (env->priv_ver < edata->min_version)) {
> +            isa_ext_update_enabled(cpu, edata->ext_enable_offset, false);
>  #ifndef CONFIG_USER_ONLY
>              warn_report("disabling %s extension for hart 0x" TARGET_FMT_lx
>                          " because privilege spec version does not match",
> -                        isa_edata_arr[i].name, env->mhartid);
> +                        edata->name, env->mhartid);
>  #else
>              warn_report("disabling %s extension because "
>                          "privilege spec version does not match",
> -                        isa_edata_arr[i].name);
> +                        edata->name);
>  #endif
>          }
>      }
> @@ -1614,13 +1609,13 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
>  static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str,
>                                   int max_str_len)
>  {
> +    const RISCVIsaExtData *edata;
>      char *old = *isa_str;
>      char *new = *isa_str;
> -    int i;
>  
> -    for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
> -        if (isa_ext_is_enabled(cpu, isa_edata_arr[i].ext_enable_offset)) {
> -            new = g_strconcat(old, "_", isa_edata_arr[i].name, NULL);
> +    for (edata = isa_edata_arr; edata && edata->name; edata++) {
> +        if (isa_ext_is_enabled(cpu, edata->ext_enable_offset)) {
> +            new = g_strconcat(old, "_", edata->name, NULL);
>              g_free(old);
>              old = new;
>          }
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 4269523e24..d9a17df46a 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -726,6 +726,13 @@ extern const RISCVCPUMultiExtConfig riscv_cpu_vendor_exts[];
>  extern const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[];
>  extern Property riscv_cpu_options[];
>  
> +typedef struct isa_ext_data {
> +    const char *name;
> +    int min_version;
> +    int ext_enable_offset;
> +} RISCVIsaExtData;
> +extern const RISCVIsaExtData isa_edata_arr[];
> +
>  void riscv_add_satp_mode_properties(Object *obj);
>  
>  /* CSR function table */
> -- 
> 2.41.0
> 
>

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>


