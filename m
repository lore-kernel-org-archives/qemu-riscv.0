Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 430FBC0032E
	for <qemu-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 06:23:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qvXIe-0001lB-VP; Wed, 25 Oct 2023 02:23:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qvXIa-0001jy-RC; Wed, 25 Oct 2023 02:23:25 -0400
Received: from out30-119.freemail.mail.aliyun.com ([115.124.30.119])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qvXIW-0001IE-Bn; Wed, 25 Oct 2023 02:23:23 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R131e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046049;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=7; SR=0;
 TI=SMTPD_---0VutQvnl_1698214984; 
Received: from 30.198.0.241(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VutQvnl_1698214984) by smtp.aliyun-inc.com;
 Wed, 25 Oct 2023 14:23:04 +0800
Message-ID: <5b3078bd-9805-43cc-a7e7-660041477913@linux.alibaba.com>
Date: Wed, 25 Oct 2023 14:22:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] target/riscv: add rva22u64 profile definition
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, palmer@rivosinc.com
References: <20231020223951.357513-1-dbarboza@ventanamicro.com>
 <20231020223951.357513-2-dbarboza@ventanamicro.com>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20231020223951.357513-2-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.119;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-119.freemail.mail.aliyun.com
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
> The rva22U64 profile, described in:
>
> https://github.com/riscv/riscv-profiles/blob/main/profiles.adoc#rva22-profiles
>
> Contains a set of CPU extensions aimed for 64-bit userspace
> applications. Enabling this set to be enabled via a single user flag
> makes it convenient to enable a predictable set of features for the CPU,
> giving users more predicability when running/testing their workloads.
>
> QEMU implements all possible extensions of this profile. The exception
> is Zicbop (Cache-Block Prefetch Operations) that is not available since
> QEMU RISC-V does not implement a cache model. For this same reason all
> the so called 'synthetic extensions' described in the profile that are
> cache related are ignored (Za64rs, Zic64b, Ziccif, Ziccrse, Ziccamoa,
> Zicclsm).
>
> An abstraction called RISCVCPUProfile is created to store the profile.
> 'ext_offsets' contains mandatory extensions that QEMU supports. Same
> thing with the 'misa_ext' mask. Optional extensions must be enabled
> manually in the command line if desired.
>
> The design here is to use the common target/riscv/cpu.c file to store
> the profile declaration and export it to the accelerator files. Each
> accelerator is then responsible to expose it (or not) to users and how
> to enable the extensions.
>
> Next patches will implement the profile for TCG and KVM.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Acked-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>   target/riscv/cpu.c | 20 ++++++++++++++++++++
>   target/riscv/cpu.h | 12 ++++++++++++
>   2 files changed, 32 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index c64cd726f4..1b75b506c4 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1397,6 +1397,26 @@ Property riscv_cpu_options[] = {
>       DEFINE_PROP_END_OF_LIST(),
>   };
>   
> +/* Optional extensions left out: RVV, zfh, zkn, zks */
> +static RISCVCPUProfile RVA22U64 = {
> +    .name = "rva22u64",
> +    .misa_ext = RVM | RVA | RVF | RVD | RVC,

Why not include RVI?

Zhiwei

> +    .ext_offsets = {
> +        CPU_CFG_OFFSET(ext_zicsr), CPU_CFG_OFFSET(ext_zihintpause),
> +        CPU_CFG_OFFSET(ext_zba), CPU_CFG_OFFSET(ext_zbb),
> +        CPU_CFG_OFFSET(ext_zbs), CPU_CFG_OFFSET(ext_zfhmin),
> +        CPU_CFG_OFFSET(ext_zkt), CPU_CFG_OFFSET(ext_zicntr),
> +        CPU_CFG_OFFSET(ext_zihpm), CPU_CFG_OFFSET(ext_zicbom),
> +        CPU_CFG_OFFSET(ext_zicboz),
> +
> +        RISCV_PROFILE_EXT_LIST_END
> +    }
> +};
> +
> +RISCVCPUProfile *riscv_profiles[] = {
> +    &RVA22U64, NULL,
> +};
> +
>   static Property riscv_cpu_properties[] = {
>       DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
>   
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 7f61e17202..53c1970e0a 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -66,6 +66,18 @@ const char *riscv_get_misa_ext_description(uint32_t bit);
>   
>   #define CPU_CFG_OFFSET(_prop) offsetof(struct RISCVCPUConfig, _prop)
>   
> +typedef struct riscv_cpu_profile {
> +    const char *name;
> +    uint32_t misa_ext;
> +    bool enabled;
> +    bool user_set;
> +    const int32_t ext_offsets[];
> +} RISCVCPUProfile;
> +
> +#define RISCV_PROFILE_EXT_LIST_END -1
> +
> +extern RISCVCPUProfile *riscv_profiles[];
> +
>   /* Privileged specification version */
>   enum {
>       PRIV_VERSION_1_10_0 = 0,

