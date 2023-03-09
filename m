Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1paAQh-0003Xd-Jo
	for mharc-qemu-riscv@gnu.org; Thu, 09 Mar 2023 02:11:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1paAQg-0003XQ-Ft; Thu, 09 Mar 2023 02:11:10 -0500
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1paAQe-0005G8-4r; Thu, 09 Mar 2023 02:11:10 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R171e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045168;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=7; SR=0;
 TI=SMTPD_---0VdSWpVg_1678345858; 
Received: from 30.221.99.193(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VdSWpVg_1678345858) by smtp.aliyun-inc.com;
 Thu, 09 Mar 2023 15:10:58 +0800
Message-ID: <677e5ab2-4fc5-1670-725e-16faeff11734@linux.alibaba.com>
Date: Thu, 9 Mar 2023 15:10:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH for-8.1 14/17] target/riscv/cpu.c: do not allow RVE to be
 set
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, palmer@rivosinc.com
References: <20230308201925.258223-1-dbarboza@ventanamicro.com>
 <20230308201925.258223-15-dbarboza@ventanamicro.com>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230308201925.258223-15-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.124.30.130;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-130.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Thu, 09 Mar 2023 07:11:10 -0000


On 2023/3/9 4:19, Daniel Henrique Barboza wrote:
> This restriction is found at the current implementation of write_misa()
> in csr.c. Add it in riscv_cpu_validate_set_extensions() as well, while
> also removing the checks we're doing considering that I or E can be
> enabled.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   target/riscv/cpu.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 49f0fd2c11..7a5d202069 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1045,15 +1045,15 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
>           cpu->cfg.ext_ifencei = true;
>       }
>   
> -    if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
> -        error_setg(errp,
> -                   "I and E extensions are incompatible");
> +    /* We do not have RV32E support  */
> +    if (cpu->cfg.ext_e) {
> +        error_setg(errp, "E extension (RV32E) is not supported");
>           return;
>       }
>   
> -    if (!cpu->cfg.ext_i && !cpu->cfg.ext_e) {
> -        error_setg(errp,
> -                   "Either I or E extension must be set");
> +    /* When RV32E is supported we'll need to check for either I or E */
> +    if (!cpu->cfg.ext_i) {
> +        error_setg(errp, "I extension must be set");

We currently have supported the RV64E and RV32E in fact. Although we 
miss some checking when decoding, the current QEMU can run programs 
written for RVE.  So we should not prohibit the RVE here.

Zhiwei

>           return;
>       }
>   

