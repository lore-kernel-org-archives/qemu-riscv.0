Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29CB5EB64DA
	for <qemu-riscv@archiver.kernel.org>; Wed, 28 Jun 2023 13:21:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qEV6u-0001Xf-Rz; Wed, 28 Jun 2023 09:21:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1qEV6m-0001Sw-JV; Wed, 28 Jun 2023 09:21:20 -0400
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1qEV6j-0006nJ-By; Wed, 28 Jun 2023 09:21:20 -0400
Received: from [192.168.0.120] (unknown [114.95.176.74])
 by APP-01 (Coremail) with SMTP id qwCowAD3__O+M5xkCJWJBQ--.52066S2;
 Wed, 28 Jun 2023 21:21:03 +0800 (CST)
Message-ID: <dfc222e9-905d-2f55-7451-0180db4e6f82@iscas.ac.cn>
Date: Wed, 28 Jun 2023 21:21:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Cc: liweiwei@iscas.ac.cn, qemu-riscv@nongnu.org, luruibo2000@163.com,
 alistair.francis@wdc.com
Subject: Re: [PATCH 1/2] target/riscv: Remove redundant check in pmp_is_locked
To: Ruibo Lu <reaperlu@hust.edu.cn>, qemu-devel@nongnu.org
References: <20230628103651.55194-1-reaperlu@hust.edu.cn>
Content-Language: en-US
From: Weiwei Li <liweiwei@iscas.ac.cn>
In-Reply-To: <20230628103651.55194-1-reaperlu@hust.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: qwCowAD3__O+M5xkCJWJBQ--.52066S2
X-Coremail-Antispam: 1UD129KBjvdXoW7JFyUKw45Jw45ZFy5Cr45ZFb_yoWxtrX_Gr
 W0gF48XryDW3WjyFy8Cry5Jw1xKFykG347Kayftw47G347WrW7Xa4kKF95Jryj9F97GFs7
 ur1fAFy7KrnI9jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbckFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Jr0_
 Gr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
 0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
 jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
 1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CEbIxv
 r21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxV
 WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI
 7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
 1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI
 42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUywZ7UUUUU=
X-Originating-IP: [114.95.176.74]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.089,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


On 2023/6/28 18:36, Ruibo Lu wrote:
> the check of top PMP is redundant and will not influence the return
> value, so consider remove it
>
> Signed-off-by: Ruibo Lu <reaperlu@hust.edu.cn>
> ---
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Weiwei Li
>   target/riscv/pmp.c | 5 -----
>   1 file changed, 5 deletions(-)
>
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index 9d8db493e6..1a9279ba88 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -49,11 +49,6 @@ static inline int pmp_is_locked(CPURISCVState *env, uint32_t pmp_index)
>           return 1;
>       }
>   
> -    /* Top PMP has no 'next' to check */
> -    if ((pmp_index + 1u) >= MAX_RISCV_PMPS) {
> -        return 0;
> -    }
> -
>       return 0;
>   }
>   


