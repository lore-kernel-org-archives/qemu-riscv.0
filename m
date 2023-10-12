Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 382D7CDB46E
	for <qemu-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 08:27:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qqr1u-00069C-99; Thu, 12 Oct 2023 04:26:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qqr1t-00068w-6O; Thu, 12 Oct 2023 04:26:49 -0400
Received: from out30-118.freemail.mail.aliyun.com ([115.124.30.118])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qqr1q-0008Oh-HN; Thu, 12 Oct 2023 04:26:48 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R241e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046059;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0Vtzybky_1697099195; 
Received: from 30.221.101.97(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0Vtzybky_1697099195) by smtp.aliyun-inc.com;
 Thu, 12 Oct 2023 16:26:36 +0800
Message-ID: <ddd48e3c-9a36-46b3-b49c-0e5409d7cd3f@linux.alibaba.com>
Date: Thu, 12 Oct 2023 16:25:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] target/riscv: Don't assume PMU counters are continuous
Content-Language: en-US
To: Rob Bradford <rbradford@rivosinc.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, atishp@rivosinc.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com
References: <20231003125107.34859-1-rbradford@rivosinc.com>
 <20231003125107.34859-4-rbradford@rivosinc.com>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20231003125107.34859-4-rbradford@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.118;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-118.freemail.mail.aliyun.com
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


On 2023/10/3 20:49, Rob Bradford wrote:
> Check the PMU available bitmask when checking if a counter is valid
> rather than comparing the index against the number of PMUs.
>
> Signed-off-by: Rob Bradford <rbradford@rivosinc.com>
> ---
>   target/riscv/csr.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 85a31dc420..3e126219ba 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -182,7 +182,8 @@ static RISCVException zcmt(CPURISCVState *env, int csrno)
>   #if !defined(CONFIG_USER_ONLY)
>   static RISCVException mctr(CPURISCVState *env, int csrno)
>   {
> -    int pmu_num = riscv_cpu_cfg(env)->pmu_num;
> +    RISCVCPU *cpu = RISCV_CPU(env_cpu(env));
Use env_archcpu(env) instead of RISCV_CPU(env_cpu(env)) macro.
> +    uint32_t pmu_avail_ctrs = cpu->pmu_avail_ctrs;
>       int ctr_index;
>       int base_csrno = CSR_MHPMCOUNTER3;
>   
> @@ -191,7 +192,7 @@ static RISCVException mctr(CPURISCVState *env, int csrno)
>           base_csrno += 0x80;
>       }
>       ctr_index = csrno - base_csrno;
> -    if (!pmu_num || ctr_index >= pmu_num) {
> +    if ((BIT(ctr_index) & pmu_avail_ctrs >> 3) == 0) {

Otherwise,

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

>           /* The PMU is not enabled or counter is out of range */
>           return RISCV_EXCP_ILLEGAL_INST;
>       }

