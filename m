Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E850C46CD4
	for <qemu-riscv@archiver.kernel.org>; Fri, 29 Dec 2023 11:23:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rJAwv-0005Hb-10; Fri, 29 Dec 2023 06:22:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vladimir.isaev@syntacore.com>)
 id 1rJAwu-0005HB-0s; Fri, 29 Dec 2023 06:22:44 -0500
Received: from mta-04.yadro.com ([89.207.88.248])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vladimir.isaev@syntacore.com>)
 id 1rJAwr-0008VF-MZ; Fri, 29 Dec 2023 06:22:43 -0500
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-04.yadro.com A0C48C000E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com;
 s=mta-04; t=1703848954;
 bh=kFoli7/mdhFEtIIZf3zoEn+BbGlPSvTT5HZ7JcGpIiE=;
 h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type:From;
 b=ueAP/VbfbGgM8Ec/iDH39zLyyLXyIjucenuseHoEvermAQ5Kj1u8MabMZxce77soL
 7+K3yclaHW2FXqbi85eFPnpjbJwlr5AHKKGxPrNOJx47yMvnd+dRaczkbLTQRJpb5V
 6c7g966fMD0tbjK3BEwYewEwri9ht9UibgiNAJ8yGadOvEBRoNAxLCe4Wm72977te0
 YAkDz6DatL0fafb6OL4xmcIA20Nk5H7PuBIqJksp1OU4V9vFoCBaOebGMsfHKBYQfU
 qwdLRfl46XW3QiU0wFYaMHxMnuU/HLA4sy7277rnnyfmahgf8ugR42M4YkpxnoPlwD
 cWmqhRAfHhmWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com;
 s=mta-03; t=1703848954;
 bh=kFoli7/mdhFEtIIZf3zoEn+BbGlPSvTT5HZ7JcGpIiE=;
 h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type:From;
 b=UqCOPvWT1H/geVPAO5r2AIzv+TNalu95cM4fPUJXxjzr36qqpkNFZfQA3JSlJxCav
 Tqd3PGo1+Qx8UFKJ5M3G0S/gYD2YrxR19u1ltwZmi1DQ5iWeEfvsug1Ykew4g9p92V
 GgSEd9/XF4SKrRDz7voMFxIhl0S3tjWC4xQkSzpZyOsPmQlci5FtokxgtNBpGE+8as
 B67Flk+U8cENxn86dX/A7/wi7hLTFKtxQc/XPMtRVDOfmUxdn8ZVixEK9kaKXtd5G9
 SBTTbenVCcjwsnOaqd9hTMrAFkQfrt6mR6kCV3vpf99zSWmxOwkv+Me43oeFcpC4+I
 KETljUw++idQg==
Message-ID: <346d8260-bed8-492b-aae3-8110b7663e5e@syntacore.com>
Date: Fri, 29 Dec 2023 14:22:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Vladimir Isaev <vladimir.isaev@syntacore.com>
Subject: Re: [PATCH v2 08/16] target/riscv: move 'vlen' to
 riscv_cpu_properties[]
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 <qemu-devel@nongnu.org>
CC: <qemu-riscv@nongnu.org>, <alistair.francis@wdc.com>, <bmeng@tinylab.org>, 
 <liwei1518@gmail.com>, <zhiwei_liu@linux.alibaba.com>,
 <palmer@rivosinc.com>, <ajones@ventanamicro.com>
References: <20231222122235.545235-1-dbarboza@ventanamicro.com>
 <20231222122235.545235-9-dbarboza@ventanamicro.com>
Content-Language: en-US, ru-RU
In-Reply-To: <20231222122235.545235-9-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: T-EXCH-09.corp.yadro.com (172.17.11.59) To
 S-Exch-01.corp.yadro.com (10.78.5.241)
Received-SPF: permerror client-ip=89.207.88.248;
 envelope-from=vladimir.isaev@syntacore.com; helo=mta-04.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
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

22.12.2023 15:22, Daniel Henrique Barboza wrote:
> 
> Turning 'vlen' into a class property will allow its default value to be
> overwritten by cpu_init() later on, solving the issue we have now where
> CPU specific settings are getting overwritten by the default.
> 
> For 'vlen', 'elen' and the blocksize options we need a way of tracking
> if the user set a value for them. This is benign for TCG since the cost
> of always validating these values are small, but for KVM we need syscalls
> to read the host values to make the validations. Knowing whether the
> user didn't touch the values makes a difference. We'll track user setting
> for these properties using a hash, like we do in the TCG driver.
> 
> Common validation bits are moved from riscv_cpu_validate_v() to
> prop_vlen_set() to be shared with KVM.
> 
> And, as done with every option we migrated to riscv_cpu_properties[],
> vendor CPUs can't have their 'vlen' value changed.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu.c         | 63 +++++++++++++++++++++++++++++++++++++-
>  target/riscv/tcg/tcg-cpu.c |  5 ---
>  2 files changed, 62 insertions(+), 6 deletions(-)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index d6625399a7..c2ff50bcab 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -29,6 +29,7 @@
>  #include "qapi/visitor.h"
>  #include "qemu/error-report.h"
>  #include "hw/qdev-properties.h"
> +#include "hw/core/qdev-prop-internal.h"
>  #include "migration/vmstate.h"
>  #include "fpu/softfloat-helpers.h"
>  #include "sysemu/kvm.h"
> @@ -53,6 +54,15 @@ const uint32_t misa_bits[] = {RVI, RVE, RVM, RVA, RVF, RVD, RVV,
>  #define BYTE(x)   (x)
>  #endif
> 
> +/* Hash that stores general user set numeric options */
> +static GHashTable *general_user_opts;
> +
> +static void cpu_option_add_user_setting(const char *optname, uint32_t value)
> +{
> +    g_hash_table_insert(general_user_opts, (gpointer)optname,
> +                        GUINT_TO_POINTER(value));
> +}
> +
>  #define ISA_EXT_DATA_ENTRY(_name, _min_ver, _prop) \
>      {#_name, _min_ver, CPU_CFG_OFFSET(_prop)}
> 
> @@ -1244,6 +1254,8 @@ static void riscv_cpu_init(Object *obj)
>                        IRQ_LOCAL_MAX + IRQ_LOCAL_GUEST_MAX);
>  #endif /* CONFIG_USER_ONLY */
> 
> +    general_user_opts = g_hash_table_new(g_str_hash, g_str_equal);
> +
>      /*
>       * The timer and performance counters extensions were supported
>       * in QEMU before they were added as discrete extensions in the
> @@ -1664,8 +1676,54 @@ static const PropertyInfo prop_vext_spec = {
>      .set = prop_vext_spec_set,
>  };
> 
> +static void prop_vlen_set(Object *obj, Visitor *v, const char *name,
> +                         void *opaque, Error **errp)
> +{
> +    RISCVCPU *cpu = RISCV_CPU(obj);
> +    uint16_t value;
> +
> +    if (!visit_type_uint16(v, name, &value, errp)) {
> +        return;
> +    }
> +
> +    if (!is_power_of_2(value)) {
> +        error_setg(errp, "Vector extension VLEN must be power of 2");
> +        return;
> +    }
> +
> +    /* Always allow setting a default value */

What is the case for vlen equal to 0? Since in properties it is defined with default value set to 128.

> +    if (cpu->cfg.vlen == 0) {
> +        cpu->cfg.vlen = value;
> +        return;
> +    }
> +
> +    if (value != cpu->cfg.vlen && riscv_cpu_is_vendor(obj)) {
> +        cpu_set_prop_err(cpu, name, errp);
> +        error_append_hint(errp, "Current '%s' val: %u\n",
> +                          name, cpu->cfg.vlen);
> +        return;
> +    }
> +
> +    cpu_option_add_user_setting(name, value);
> +    cpu->cfg.vlen = value;
> +}
> +
> +static void prop_vlen_get(Object *obj, Visitor *v, const char *name,
> +                         void *opaque, Error **errp)
> +{
> +    uint16_t value = RISCV_CPU(obj)->cfg.vlen;
> +
> +    visit_type_uint16(v, name, &value, errp);
> +}
> +
> +static const PropertyInfo prop_vlen = {
> +    .name = "vlen",
> +    .get = prop_vlen_get,
> +    .set = prop_vlen_set,
> +    .set_default_value = qdev_propinfo_set_default_value_uint,
> +};
> +
>  Property riscv_cpu_options[] = {
> -    DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
>      DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
> 
>      DEFINE_PROP_UINT16("cbom_blocksize", RISCVCPU, cfg.cbom_blocksize, 64),
> @@ -1687,6 +1745,9 @@ static Property riscv_cpu_properties[] = {
>      {.name = "priv_spec", .info = &prop_priv_spec},
>      {.name = "vext_spec", .info = &prop_vext_spec},
> 
> +    {.name = "vlen", .info = &prop_vlen,
> +     .set_default = true, .defval.u = 128},
> +
>  #ifndef CONFIG_USER_ONLY
>      DEFINE_PROP_UINT64("resetvec", RISCVCPU, env.resetvec, DEFAULT_RSTVEC),
>  #endif
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 6501c29d8e..8ec858e096 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -178,11 +178,6 @@ static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)
>  static void riscv_cpu_validate_v(CPURISCVState *env, RISCVCPUConfig *cfg,
>                                   Error **errp)
>  {
> -    if (!is_power_of_2(cfg->vlen)) {
> -        error_setg(errp, "Vector extension VLEN must be power of 2");
> -        return;
> -    }
> -
>      if (cfg->vlen > RV_VLEN_MAX || cfg->vlen < 128) {
>          error_setg(errp,
>                     "Vector extension implementation only supports VLEN "
> --
> 2.43.0
> 
> 

