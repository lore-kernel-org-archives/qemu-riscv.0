Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 782C4CD80A9
	for <qemu-riscv@archiver.kernel.org>; Tue, 10 Oct 2023 11:28:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qqAuM-000589-3M; Tue, 10 Oct 2023 07:28:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qqAuK-0004yc-AK; Tue, 10 Oct 2023 07:28:12 -0400
Received: from out30-113.freemail.mail.aliyun.com ([115.124.30.113])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1qqAuH-00085A-Fc; Tue, 10 Oct 2023 07:28:12 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R311e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046049;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0VtseYkV_1696937277; 
Received: from 30.221.98.57(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VtseYkV_1696937277) by smtp.aliyun-inc.com;
 Tue, 10 Oct 2023 19:27:58 +0800
Message-ID: <f929466e-9b0b-414f-8087-02d5b81c6750@linux.alibaba.com>
Date: Tue, 10 Oct 2023 19:26:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv: Fix vfwmaccbf16.vf
Content-Language: en-US
To: Max Chou <max.chou@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
References: <20231005095734.567575-1-max.chou@sifive.com>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20231005095734.567575-1-max.chou@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.113;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-113.freemail.mail.aliyun.com
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


On 2023/10/5 17:57, Max Chou wrote:
> The operator (fwmacc16) of vfwmaccbf16.vf helper function should be
> replaced by fwmaccbf16.
>
> Signed-off-by: Max Chou <max.chou@sifive.com>
> ---
>   target/riscv/vector_helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 3fb05cc3d6e..c45d94c165c 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -3361,7 +3361,7 @@ static uint32_t fwmaccbf16(uint16_t a, uint16_t b, uint32_t d, float_status *s)
>   
>   RVVCALL(OPFVV3, vfwmaccbf16_vv, WOP_UUU_H, H4, H2, H2, fwmaccbf16)
>   GEN_VEXT_VV_ENV(vfwmaccbf16_vv, 4)
> -RVVCALL(OPFVF3, vfwmaccbf16_vf, WOP_UUU_H, H4, H2, fwmacc16)
> +RVVCALL(OPFVF3, vfwmaccbf16_vf, WOP_UUU_H, H4, H2, fwmaccbf16)

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

>   GEN_VEXT_VF(vfwmaccbf16_vf, 4)
>   
>   static uint32_t fwnmacc16(uint16_t a, uint16_t b, uint32_t d, float_status *s)

