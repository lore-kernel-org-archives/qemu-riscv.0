Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 494D0E7734B
	for <qemu-riscv@archiver.kernel.org>; Fri, 29 Sep 2023 23:50:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qmNFZ-00046C-QK; Fri, 29 Sep 2023 19:50:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qmNFV-00045N-5J; Fri, 29 Sep 2023 19:50:21 -0400
Received: from out30-100.freemail.mail.aliyun.com ([115.124.30.100])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qmNFO-000393-7o; Fri, 29 Sep 2023 19:50:18 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R301e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045176;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=13; SR=0;
 TI=SMTPD_---0Vt4vcbs_1696031397; 
Received: from 192.168.3.95(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0Vt4vcbs_1696031397) by smtp.aliyun-inc.com;
 Sat, 30 Sep 2023 07:49:58 +0800
Message-ID: <73a4c943-23ea-c268-c13b-be26870a2df0@linux.alibaba.com>
Date: Sat, 30 Sep 2023 07:49:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] MAINTAINERS: Add unowned RISC-V related files to the
 right sections
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Christoph Muellner <christoph.muellner@vrull.eu>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Vijai Kumar K <vijai@behindbytes.com>
References: <20230929123727.391346-1-thuth@redhat.com>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230929123727.391346-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.100;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-100.freemail.mail.aliyun.com
X-Spam_score_int: -131
X-Spam_score: -13.2
X-Spam_bar: -------------
X-Spam_report: (-13.2 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-3.295, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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


On 2023/9/29 20:37, Thomas Huth wrote:
> There are a bunch of RISC-V files that are currently not covered
> by the "get_maintainers.pl" script. Add them to the right sections
> in MAINTAINERS to fix this problem.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

> ---
>   MAINTAINERS | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 355b1960ce..1313257180 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -317,8 +317,11 @@ R: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>   R: Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
>   L: qemu-riscv@nongnu.org
>   S: Supported
> +F: configs/targets/riscv*
> +F: docs/system/target-riscv.rst
>   F: target/riscv/
>   F: hw/riscv/
> +F: hw/intc/riscv*
>   F: include/hw/riscv/
>   F: linux-user/host/riscv32/
>   F: linux-user/host/riscv64/
> @@ -330,6 +333,7 @@ L: qemu-riscv@nongnu.org
>   S: Supported
>   F: target/riscv/insn_trans/trans_xthead.c.inc
>   F: target/riscv/xthead*.decode
> +F: disas/riscv-xthead*
>   
>   RISC-V XVentanaCondOps extension
>   M: Philipp Tomsich <philipp.tomsich@vrull.eu>
> @@ -337,6 +341,7 @@ L: qemu-riscv@nongnu.org
>   S: Maintained
>   F: target/riscv/XVentanaCondOps.decode
>   F: target/riscv/insn_trans/trans_xventanacondops.c.inc
> +F: disas/riscv-xventana*
>   
>   RENESAS RX CPUs
>   R: Yoshinori Sato <ysato@users.sourceforge.jp>
> @@ -1518,6 +1523,7 @@ Microchip PolarFire SoC Icicle Kit
>   M: Bin Meng <bin.meng@windriver.com>
>   L: qemu-riscv@nongnu.org
>   S: Supported
> +F: docs/system/riscv/microchip-icicle-kit.rst
>   F: hw/riscv/microchip_pfsoc.c
>   F: hw/char/mchp_pfsoc_mmuart.c
>   F: hw/misc/mchp_pfsoc_dmc.c
> @@ -1533,6 +1539,7 @@ Shakti C class SoC
>   M: Vijai Kumar K <vijai@behindbytes.com>
>   L: qemu-riscv@nongnu.org
>   S: Supported
> +F: docs/system/riscv/shakti-c.rst
>   F: hw/riscv/shakti_c.c
>   F: hw/char/shakti_uart.c
>   F: include/hw/riscv/shakti_c.h
> @@ -1544,6 +1551,7 @@ M: Bin Meng <bin.meng@windriver.com>
>   M: Palmer Dabbelt <palmer@dabbelt.com>
>   L: qemu-riscv@nongnu.org
>   S: Supported
> +F: docs/system/riscv/sifive_u.rst
>   F: hw/*/*sifive*.c
>   F: include/hw/*/*sifive*.h
>   
> @@ -3543,7 +3551,7 @@ M: Alistair Francis <Alistair.Francis@wdc.com>
>   L: qemu-riscv@nongnu.org
>   S: Maintained
>   F: tcg/riscv/
> -F: disas/riscv.c
> +F: disas/riscv.[ch]
>   
>   S390 TCG target
>   M: Richard Henderson <richard.henderson@linaro.org>

