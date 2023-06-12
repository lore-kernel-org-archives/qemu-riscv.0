Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A07AC7EE23
	for <qemu-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 06:49:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q8bMD-00010V-1M; Mon, 12 Jun 2023 02:48:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1q8bM5-0000yd-0V; Mon, 12 Jun 2023 02:48:47 -0400
Received: from out30-99.freemail.mail.aliyun.com ([115.124.30.99])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1q8bM1-0005Ct-3A; Mon, 12 Jun 2023 02:48:44 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R431e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045168;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0VktCoYL_1686552510; 
Received: from 30.221.96.167(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VktCoYL_1686552510) by smtp.aliyun-inc.com;
 Mon, 12 Jun 2023 14:48:30 +0800
Message-ID: <f2a8e06d-2447-ea95-d4ab-8b5848db59b9@linux.alibaba.com>
Date: Mon, 12 Jun 2023 14:48:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 4/9] disas/riscv: Make rv_op_illegal a shared enum value
Content-Language: en-US
To: Christoph Muellner <christoph.muellner@vrull.eu>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Philipp Tomsich
 <philipp.tomsich@vrull.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20230530131843.1186637-1-christoph.muellner@vrull.eu>
 <20230530131843.1186637-5-christoph.muellner@vrull.eu>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230530131843.1186637-5-christoph.muellner@vrull.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.99;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-99.freemail.mail.aliyun.com
X-Spam_score_int: -99
X-Spam_score: -10.0
X-Spam_bar: ----------
X-Spam_report: (-10.0 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.093, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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


On 2023/5/30 21:18, Christoph Muellner wrote:
> From: Christoph Müllner <christoph.muellner@vrull.eu>
>
> The enum value 'rv_op_illegal' does not represent an
> instruction, but is a catch-all value in case we have
> no match in the decoder. Let's make the value a shared
> one, so that other compile units can reuse it.
>
> Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
> ---
>   disas/riscv.c | 2 +-
>   disas/riscv.h | 4 ++++
>   2 files changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/disas/riscv.c b/disas/riscv.c
> index a062fb48cc..4cf477bc02 100644
> --- a/disas/riscv.c
> +++ b/disas/riscv.c
> @@ -22,7 +22,7 @@
>   #include "disas/riscv.h"
>   
>   typedef enum {
> -    rv_op_illegal = 0,
> +    /* 0 is reserved for rv_op_illegal. */
>       rv_op_lui = 1,
>       rv_op_auipc = 2,
>       rv_op_jal = 3,
> diff --git a/disas/riscv.h b/disas/riscv.h
> index 0f34b71518..de2623e3cc 100644
> --- a/disas/riscv.h
> +++ b/disas/riscv.h
> @@ -189,6 +189,10 @@ typedef struct {
>       const rvc_constraint *constraints;
>   } rv_comp_data;
>   
> +enum {
> +    rv_op_illegal = 0
> +};
> +

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

>   enum {
>       rvcd_imm_nz = 0x1
>   };

