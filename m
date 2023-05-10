Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E5BC77B7C
	for <qemu-riscv@archiver.kernel.org>; Wed, 10 May 2023 11:11:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1pwhjS-0002Yg-JX; Wed, 10 May 2023 07:11:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pwhjB-00026a-7v; Wed, 10 May 2023 07:11:27 -0400
Received: from out30-112.freemail.mail.aliyun.com ([115.124.30.112])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pwhj8-0000jp-Fz; Wed, 10 May 2023 07:11:24 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R191e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045192;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0ViFryqe_1683717074; 
Received: from 30.221.98.74(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0ViFryqe_1683717074) by smtp.aliyun-inc.com;
 Wed, 10 May 2023 19:11:15 +0800
Message-ID: <0a402a2d-f250-c41a-f408-fa275cfd571c@linux.alibaba.com>
Date: Wed, 10 May 2023 19:11:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] target/riscv: Move zc* out of the experimental properties
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230510030040.20528-1-liweiwei@iscas.ac.cn>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230510030040.20528-1-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.112;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-112.freemail.mail.aliyun.com
X-Spam_score_int: -131
X-Spam_score: -13.2
X-Spam_bar: -------------
X-Spam_report: (-13.2 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-3.251, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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


On 2023/5/10 11:00, Weiwei Li wrote:
> Zc* extensions (version 1.0) are ratified.
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/cpu.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index db0875fb43..99ed9cb80e 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1571,6 +1571,14 @@ static Property riscv_cpu_extensions[] = {
>   
>       DEFINE_PROP_BOOL("zmmul", RISCVCPU, cfg.ext_zmmul, false),
>   
> +    DEFINE_PROP_BOOL("zca", RISCVCPU, cfg.ext_zca, false),
> +    DEFINE_PROP_BOOL("zcb", RISCVCPU, cfg.ext_zcb, false),
> +    DEFINE_PROP_BOOL("zcd", RISCVCPU, cfg.ext_zcd, false),
> +    DEFINE_PROP_BOOL("zce", RISCVCPU, cfg.ext_zce, false),
> +    DEFINE_PROP_BOOL("zcf", RISCVCPU, cfg.ext_zcf, false),
> +    DEFINE_PROP_BOOL("zcmp", RISCVCPU, cfg.ext_zcmp, false),
> +    DEFINE_PROP_BOOL("zcmt", RISCVCPU, cfg.ext_zcmt, false),
> +

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

>       /* Vendor-specific custom extensions */
>       DEFINE_PROP_BOOL("xtheadba", RISCVCPU, cfg.ext_xtheadba, false),
>       DEFINE_PROP_BOOL("xtheadbb", RISCVCPU, cfg.ext_xtheadbb, false),
> @@ -1588,14 +1596,6 @@ static Property riscv_cpu_extensions[] = {
>       /* These are experimental so mark with 'x-' */
>       DEFINE_PROP_BOOL("x-zicond", RISCVCPU, cfg.ext_zicond, false),
>   
> -    DEFINE_PROP_BOOL("x-zca", RISCVCPU, cfg.ext_zca, false),
> -    DEFINE_PROP_BOOL("x-zcb", RISCVCPU, cfg.ext_zcb, false),
> -    DEFINE_PROP_BOOL("x-zcd", RISCVCPU, cfg.ext_zcd, false),
> -    DEFINE_PROP_BOOL("x-zce", RISCVCPU, cfg.ext_zce, false),
> -    DEFINE_PROP_BOOL("x-zcf", RISCVCPU, cfg.ext_zcf, false),
> -    DEFINE_PROP_BOOL("x-zcmp", RISCVCPU, cfg.ext_zcmp, false),
> -    DEFINE_PROP_BOOL("x-zcmt", RISCVCPU, cfg.ext_zcmt, false),
> -
>       /* ePMP 0.9.3 */
>       DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
>       DEFINE_PROP_BOOL("x-smaia", RISCVCPU, cfg.ext_smaia, false),

