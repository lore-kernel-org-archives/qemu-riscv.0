Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C3DC4167B
	for <qemu-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 06:18:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1rBUBJ-0006jk-66; Fri, 08 Dec 2023 01:17:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1rBUBH-0006j2-1F; Fri, 08 Dec 2023 01:17:47 -0500
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1rBUBD-0004pf-VL; Fri, 08 Dec 2023 01:17:46 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R981e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046050;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0Vy2BhGQ_1702016250; 
Received: from 30.198.1.84(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0Vy2BhGQ_1702016250) by smtp.aliyun-inc.com;
 Fri, 08 Dec 2023 14:17:31 +0800
Message-ID: <b36c7f48-b7a9-4af6-9253-e41396803718@linux.alibaba.com>
Date: Fri, 8 Dec 2023 14:16:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] target/riscv: FIX xATP_MODE validation
Content-Language: en-US
To: Irina Ryapolova <irina.ryapolova@syntacore.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com
References: <20231201115339.18353-1-irina.ryapolova@syntacore.com>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20231201115339.18353-1-irina.ryapolova@syntacore.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.131;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-131.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01, UNPARSEABLE_RELAY=0.001,
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

Hi Irina,

On 2023/12/1 19:53, Irina Ryapolova wrote:
> The SATP register is an SXLEN-bit read/write WARL register. It means that CSR fields are only defined
> for a subset of bit encodings, but allow any value to be written while guaranteeing to return a legal
> value whenever read (See riscv-privileged-20211203, SATP CSR).
>
> For example on rv64 we are trying to write to SATP CSR val = 0x1000000000000000 (SATP_MODE = 1 - Reserved for standard use)
> and after that we are trying to read SATP_CSR. We read from the SATP CSR value = 0x1000000000000000, which is not a correct
> operation (return illegal value).
>
> Signed-off-by: Irina Ryapolova <irina.ryapolova@syntacore.com>
> ---
>   target/riscv/csr.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index fde7ce1a53..6f244815b7 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -1278,8 +1278,8 @@ static RISCVException read_mstatus(CPURISCVState *env, int csrno,
>   
>   static bool validate_vm(CPURISCVState *env, target_ulong vm)
>   {
> -    return (vm & 0xf) <=
> -           satp_mode_max_from_map(riscv_cpu_cfg(env)->satp_mode.map);
> +    uint64_t mode_supported = riscv_cpu_cfg(env)->satp_mode.supported;

Why not use satp_mode.map? Using satp_mode.supported will violate the 
SATP settings in cpu init.

Zhiwei

> +    return get_field(mode_supported, (1 << vm));
>   }
>   
>   static target_ulong legalize_mpp(CPURISCVState *env, target_ulong old_mpp,

