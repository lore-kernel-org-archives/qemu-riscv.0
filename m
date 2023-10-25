Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28388C0032E
	for <qemu-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 06:37:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qvXVj-000055-Rq; Wed, 25 Oct 2023 02:37:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qvXVh-0008SQ-BZ; Wed, 25 Oct 2023 02:36:57 -0400
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qvXVd-0003mN-JH; Wed, 25 Oct 2023 02:36:56 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R871e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046056;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=7; SR=0;
 TI=SMTPD_---0VutXGwi_1698215800; 
Received: from 30.198.0.241(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VutXGwi_1698215800) by smtp.aliyun-inc.com;
 Wed, 25 Oct 2023 14:36:41 +0800
Message-ID: <d6b0380b-f738-4e7c-87ad-0ba6ea3c274b@linux.alibaba.com>
Date: Wed, 25 Oct 2023 14:35:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] target/riscv/tcg: add user flag for profile support
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, palmer@rivosinc.com
References: <20231020223951.357513-1-dbarboza@ventanamicro.com>
 <20231020223951.357513-4-dbarboza@ventanamicro.com>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20231020223951.357513-4-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.130;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-130.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001,
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


On 2023/10/21 6:39, Daniel Henrique Barboza wrote:
> The TCG emulation implements all the extensions described in the
> RVA22U64 profile, both mandatory and optional. The mandatory extensions
> will be enabled via the profile flag. We'll leave the optional
> extensions to be enabled by hand.
>
> Given that this is the first profile we're implementing in TCG we'll
> need some ground work first:
>
> - all profiles declared in riscv_profiles[] will be exposed to users.
> TCG is the main accelerator we're considering when adding profile
> support in QEMU, so for now it's safe to assume that all profiles in
> riscv_profiles[] will be relevant to TCG;
>
> - we'll not support user profile settings for vendor CPUs. The flags
> will still be exposed but users won't be able to change them. The idea
> is that vendor CPUs in the future can enable profiles internally in
> their cpu_init() functions, showing to the external world that the CPU
> supports a certain profile. But users won't be able to enable/disable
> it;
>
> - Setting a profile to 'true' means 'enable all mandatory extensions of
> this profile, setting it to 'false' means disabling all its mandatory
> extensions. Disabling a profile is discouraged for regular use and will
> issue an user warning. User choices for individual extensions will take
> precedence, i.e. enabling a profile will not enable extensions that the
> user set to 'false', and vice-versa. This will make us independent of
> left-to-right ordering in the QEMU command line, i.e. the following QEMU
> command lines:
>
> -cpu rv64,zicbom=false,rva22u64=true,Zifencei=false
> -cpu rv64,zicbom=false,Zifencei=false,rva22u64=true
> -cpu rv64,rva22u64=true,zicbom=false,Zifencei=false
>
> They mean the same thing: "enable all mandatory extensions of the
> rva22u64 profile while keeping zicbom and Zifencei disabled".
>
> For now we'll handle multi-letter extensions only. MISA extensions need
> additional steps that we'll take care later.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   target/riscv/tcg/tcg-cpu.c | 59 ++++++++++++++++++++++++++++++++++++++
>   1 file changed, 59 insertions(+)
>
> diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
> index 7a4400e2ba..3dd4783191 100644
> --- a/target/riscv/tcg/tcg-cpu.c
> +++ b/target/riscv/tcg/tcg-cpu.c
> @@ -757,6 +757,63 @@ static void riscv_cpu_add_misa_properties(Object *cpu_obj)
>       }
>   }
>   
> +static void cpu_set_profile(Object *obj, Visitor *v, const char *name,
> +                            void *opaque, Error **errp)
> +{
> +    RISCVCPUProfile *profile = opaque;
> +    RISCVCPU *cpu = RISCV_CPU(obj);
> +    bool value;
> +    int i, ext_offset;
> +
> +    if (object_dynamic_cast(obj, TYPE_RISCV_DYNAMIC_CPU) == NULL) {
> +        error_setg(errp, "Profile %s only available for generic CPUs",
> +                   profile->name);
> +        return;
> +    }
> +
> +    if (!visit_type_bool(v, name, &value, errp)) {
> +        return;
> +    }
> +
> +    if (!value) {
> +        warn_report("Disabling the '%s' profile is a debug/development "
> +                    "tool, not recommended for regular use",
> +                    profile->name);
> +    }
> +
> +    profile->enabled = value;
> +
> +    for (i = 0; profile->ext_offsets[i] != RISCV_PROFILE_EXT_LIST_END; i++) {
> +        ext_offset = profile->ext_offsets[i];
> +
> +        if (cpu_cfg_ext_is_user_set(ext_offset)) {
> +            continue;
> +        }
> +
> +        isa_ext_update_enabled(cpu, ext_offset, profile->enabled);
> +    }
> +}
> +
> +static void cpu_get_profile(Object *obj, Visitor *v, const char *name,
> +                            void *opaque, Error **errp)
> +{
> +    RISCVCPUProfile *profile = opaque;
> +    bool value = profile->enabled;
> +
> +    visit_type_bool(v, name, &value, errp);
> +}
> +
> +static void riscv_cpu_add_profiles(Object *cpu_obj)
> +{
> +    for (int i = 0; riscv_profiles[i] != NULL; i++) {
> +        const RISCVCPUProfile *profile = riscv_profiles[i];
> +
> +        object_property_add(cpu_obj, profile->name, "bool",
> +                            cpu_get_profile, cpu_set_profile,
> +                            NULL, (void *)profile);
> +    }
> +}
> +
>   static bool cpu_ext_is_deprecated(const char *ext_name)
>   {
>       return isupper(ext_name[0]);
> @@ -880,6 +937,8 @@ static void riscv_cpu_add_user_properties(Object *obj)
>   
>       riscv_cpu_add_multiext_prop_array(obj, riscv_cpu_deprecated_exts);
>   
> +    riscv_cpu_add_profiles(obj);
> +

Acked-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

>       for (Property *prop = riscv_cpu_options; prop && prop->name; prop++) {
>           qdev_property_add_static(DEVICE(obj), prop);
>       }

