Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44975EB64D8
	for <qemu-riscv@archiver.kernel.org>; Wed, 21 Jun 2023 01:32:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qBmiC-0001RT-OD; Tue, 20 Jun 2023 21:32:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qBmiB-0001RA-Rw; Tue, 20 Jun 2023 21:32:43 -0400
Received: from out30-111.freemail.mail.aliyun.com ([115.124.30.111])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qBmi9-0000ei-RZ; Tue, 20 Jun 2023 21:32:43 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R211e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045168;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=7; SR=0;
 TI=SMTPD_---0Vldqif3_1687311149; 
Received: from 30.221.97.101(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0Vldqif3_1687311149) by smtp.aliyun-inc.com;
 Wed, 21 Jun 2023 09:32:30 +0800
Message-ID: <91038a8e-6ff6-fbbb-0dda-ded772dab5f5@linux.alibaba.com>
Date: Wed, 21 Jun 2023 09:32:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] target/riscv/cpu.c: fix veyron-v1 CPU properties
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, palmer@rivosinc.com
References: <20230620152443.137079-1-dbarboza@ventanamicro.com>
Content-Language: en-US
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230620152443.137079-1-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.111;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-111.freemail.mail.aliyun.com
X-Spam_score_int: -99
X-Spam_score: -10.0
X-Spam_bar: ----------
X-Spam_report: (-10.0 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, UNPARSEABLE_RELAY=0.001,
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


On 2023/6/20 23:24, Daniel Henrique Barboza wrote:
> Commit 7f0bdfb5bfc2 ("target/riscv/cpu.c: remove cfg setup from
> riscv_cpu_init()") removed code that was enabling mmu, pmp, ext_ifencei
> and ext_icsr from riscv_cpu_init(), the init() function of
> TYPE_RISCV_CPU, parent type of all RISC-V CPUss. This was done to force
> CPUs to explictly enable all extensions and features it requires,
> without any 'magic values' that were inherited by the parent type.
>
> This commit failed to make appropriate changes in the 'veyron-v1' CPU,
> added earlier by commit e1d084a8524a. The result is that the veyron-v1
> CPU has ext_ifencei, ext_icsr and pmp set to 'false', which is not the
> case.
>
> The reason why it took this long to notice (thanks LIU Zhiwei for
> reporting it) is because Linux doesn't mind 'ifencei' and 'icsr' being
> absent in the 'riscv,isa' DT, implying that they're both present if the
> 'i' extension is enabled. OpenSBI also doesn't error out or warns about
> the lack of 'pmp', it'll just not protect memory pages.
>
> Fix it by setting them to 'true' in rv64_veyron_v1_cpu_init() like
> 7f0bdfb5bfc2 already did with other CPUs.
>
> Reported-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Fixes: 7f0bdfb5bfc2 ("target/riscv/cpu.c: remove cfg setup from riscv_cpu_init()")
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   target/riscv/cpu.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 881bddf393..707f62b592 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -444,6 +444,9 @@ static void rv64_veyron_v1_cpu_init(Object *obj)
>   
>       /* Enable ISA extensions */
>       cpu->cfg.mmu = true;
> +    cpu->cfg.ext_ifencei = true;
> +    cpu->cfg.ext_icsr = true;
> +    cpu->cfg.pmp = true;

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

>       cpu->cfg.ext_icbom = true;
>       cpu->cfg.cbom_blocksize = 64;
>       cpu->cfg.cboz_blocksize = 64;

