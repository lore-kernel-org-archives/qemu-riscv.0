Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pofVU-0003uE-52
	for mharc-qemu-riscv@gnu.org; Tue, 18 Apr 2023 03:12:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pofVS-0003tL-9Z; Tue, 18 Apr 2023 03:12:02 -0400
Received: from out30-110.freemail.mail.aliyun.com ([115.124.30.110])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pofVP-000159-UT; Tue, 18 Apr 2023 03:12:02 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R671e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046059;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=10; SR=0;
 TI=SMTPD_---0VgOMhUN_1681801911; 
Received: from 30.221.97.146(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VgOMhUN_1681801911) by smtp.aliyun-inc.com;
 Tue, 18 Apr 2023 15:11:52 +0800
Message-ID: <de40eeea-6ddf-264c-2cfb-94b5d55093d8@linux.alibaba.com>
Date: Tue, 18 Apr 2023 15:11:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 3/6] target/riscv: flush tlb when pmpaddr is updated
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, richard.henderson@linaro.org,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230413090122.65228-1-liweiwei@iscas.ac.cn>
 <20230413090122.65228-4-liweiwei@iscas.ac.cn>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230413090122.65228-4-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.110;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-110.freemail.mail.aliyun.com
X-Spam_score_int: -121
X-Spam_score: -12.2
X-Spam_bar: ------------
X-Spam_report: (-12.2 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-2.284, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 18 Apr 2023 07:12:02 -0000


On 2023/4/13 17:01, Weiwei Li wrote:
> TLB should be flushed not only for pmpcfg csr changes, but also for
> pmpaddr csr changes.
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/pmp.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
> index 4f9389e73c..6d4813806b 100644
> --- a/target/riscv/pmp.c
> +++ b/target/riscv/pmp.c
> @@ -537,6 +537,7 @@ void pmpaddr_csr_write(CPURISCVState *env, uint32_t addr_index,
>           if (!pmp_is_locked(env, addr_index)) {
>               env->pmp_state.pmp[addr_index].addr_reg = val;
>               pmp_update_rule(env, addr_index);
> +            tlb_flush(env_cpu(env));

Can we always flush tlb in pmp_update_rule?

Zhiwei

>           } else {
>               qemu_log_mask(LOG_GUEST_ERROR,
>                             "ignoring pmpaddr write - locked\n");

