Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pXYx8-0001Dt-A9
	for mharc-qemu-riscv@gnu.org; Wed, 01 Mar 2023 21:45:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pXYwg-0000gT-Qf; Wed, 01 Mar 2023 21:45:31 -0500
Received: from out30-111.freemail.mail.aliyun.com ([115.124.30.111])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pXYwe-0000uL-EW; Wed, 01 Mar 2023 21:45:26 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R591e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045170;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VcvKext_1677725118; 
Received: from 30.221.97.107(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VcvKext_1677725118) by smtp.aliyun-inc.com;
 Thu, 02 Mar 2023 10:45:18 +0800
Message-ID: <697b7e29-911c-ffeb-6fc7-5e0d483b2319@linux.alibaba.com>
Date: Thu, 2 Mar 2023 10:45:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 17/18] target/riscv: Drop priv level check in mseccfg
 predicate()
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
Cc: Bin Meng <bmeng@tinylab.org>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
References: <20230228104035.1879882-13-bmeng@tinylab.org>
 <20230228104035.1879882-18-bmeng@tinylab.org>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230228104035.1879882-18-bmeng@tinylab.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.111;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-111.freemail.mail.aliyun.com
X-Spam_score_int: -99
X-Spam_score: -10.0
X-Spam_bar: ----------
X-Spam_report: (-10.0 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
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
X-List-Received-Date: Thu, 02 Mar 2023 02:45:47 -0000


On 2023/2/28 21:45, Bin Meng wrote:
> From: Bin Meng <bmeng@tinylab.org>
>
> riscv_csrrw_check() already does the generic privilege level check
> hence there is no need to do the specific M-mode access check in
> the mseccfg predicate().
>
> With this change debugger can access the mseccfg CSR anytime.
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
> ---
>
> (no changes since v1)
>
>   target/riscv/csr.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 020c3f524f..785f6f4d45 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -451,7 +451,7 @@ static RISCVException pmp(CPURISCVState *env, int csrno)
>   
>   static RISCVException epmp(CPURISCVState *env, int csrno)
>   {
> -    if (env->priv == PRV_M && riscv_cpu_cfg(env)->epmp) {
> +    if (riscv_cpu_cfg(env)->epmp) {

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

>           return RISCV_EXCP_NONE;
>       }
>   

