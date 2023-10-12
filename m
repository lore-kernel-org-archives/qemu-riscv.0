Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A1D7CDB46E
	for <qemu-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 08:44:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qqrIw-00027g-Rc; Thu, 12 Oct 2023 04:44:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qqrIr-00020J-T0; Thu, 12 Oct 2023 04:44:22 -0400
Received: from out30-101.freemail.mail.aliyun.com ([115.124.30.101])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qqrIo-0004D2-Vb; Thu, 12 Oct 2023 04:44:21 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R181e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045176;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0Vu-2zc6_1697100244; 
Received: from 30.221.101.97(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0Vu-2zc6_1697100244) by smtp.aliyun-inc.com;
 Thu, 12 Oct 2023 16:44:05 +0800
Message-ID: <fc9d5798-c1ca-4ee6-8ac1-c917414b3a61@linux.alibaba.com>
Date: Thu, 12 Oct 2023 16:43:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] target/riscv: Use existing PMU counter mask in FDT
 generation
Content-Language: en-US
To: Rob Bradford <rbradford@rivosinc.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, atishp@rivosinc.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com
References: <20231011145032.81509-1-rbradford@rivosinc.com>
 <20231011145032.81509-4-rbradford@rivosinc.com>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20231011145032.81509-4-rbradford@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.101;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-101.freemail.mail.aliyun.com
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


On 2023/10/11 22:45, Rob Bradford wrote:
> During the FDT generation use the existing mask containing the enabled
> counters rather then generating a new one. Using the existing mask will
> support the use of discontinuous counters.
>
> Signed-off-by: Rob Bradford <rbradford@rivosinc.com>
> ---
>   hw/riscv/virt.c    | 2 +-
>   target/riscv/pmu.c | 6 +-----
>   target/riscv/pmu.h | 2 +-
>   3 files changed, 3 insertions(+), 7 deletions(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 5edc1d98d2..acdbaf9da5 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -722,7 +722,7 @@ static void create_fdt_pmu(RISCVVirtState *s)
>       pmu_name = g_strdup_printf("/pmu");
>       qemu_fdt_add_subnode(ms->fdt, pmu_name);
>       qemu_fdt_setprop_string(ms->fdt, pmu_name, "compatible", "riscv,pmu");
> -    riscv_pmu_generate_fdt_node(ms->fdt, hart.cfg.pmu_num, pmu_name);
> +    riscv_pmu_generate_fdt_node(ms->fdt, hart.pmu_avail_ctrs, pmu_name);
>   
>       g_free(pmu_name);
>   }
> diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
> index 13801ccb78..7ddf4977b1 100644
> --- a/target/riscv/pmu.c
> +++ b/target/riscv/pmu.c
> @@ -34,13 +34,9 @@
>    * to provide the correct value as well. Heterogeneous PMU per hart is not
>    * supported yet. Thus, number of counters are same across all harts.
>    */
> -void riscv_pmu_generate_fdt_node(void *fdt, int num_ctrs, char *pmu_name)
> +void riscv_pmu_generate_fdt_node(void *fdt, uint32_t cmask, char *pmu_name)
>   {
>       uint32_t fdt_event_ctr_map[15] = {};
> -    uint32_t cmask;
> -
> -    /* All the programmable counters can map to any event */
> -    cmask = MAKE_32BIT_MASK(3, num_ctrs);
>   
>      /*
>       * The event encoding is specified in the SBI specification
> diff --git a/target/riscv/pmu.h b/target/riscv/pmu.h
> index 88e0713296..505fc850d3 100644
> --- a/target/riscv/pmu.h
> +++ b/target/riscv/pmu.h
> @@ -28,6 +28,6 @@ void riscv_pmu_init(RISCVCPU *cpu, Error **errp);
>   int riscv_pmu_update_event_map(CPURISCVState *env, uint64_t value,
>                                  uint32_t ctr_idx);
>   int riscv_pmu_incr_ctr(RISCVCPU *cpu, enum riscv_pmu_event_idx event_idx);
> -void riscv_pmu_generate_fdt_node(void *fdt, int num_counters, char *pmu_name);
> +void riscv_pmu_generate_fdt_node(void *fdt, uint32_t cmask, char *pmu_name);

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

>   int riscv_pmu_setup_timer(CPURISCVState *env, uint64_t value,
>                             uint32_t ctr_idx);

