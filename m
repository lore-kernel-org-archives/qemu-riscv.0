Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSqee-0002BZ-Ul
	for mharc-qemu-riscv@gnu.org; Thu, 16 Feb 2023 21:39:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pSqec-00021G-Hy; Thu, 16 Feb 2023 21:39:18 -0500
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1pSqea-0007y2-HZ; Thu, 16 Feb 2023 21:39:18 -0500
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R181e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045170;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0Vbqdpjv_1676601549; 
Received: from 30.221.98.44(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0Vbqdpjv_1676601549) by smtp.aliyun-inc.com;
 Fri, 17 Feb 2023 10:39:09 +0800
Message-ID: <28e5473d-f8da-0afd-177a-02f6c5f33206@linux.alibaba.com>
Date: Fri, 17 Feb 2023 10:39:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 10/18] target/riscv: gdbstub: Turn on debugger mode before
 calling CSR predicate()
Content-Language: en-US
To: Bin Meng <bmeng@tinylab.org>, qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 qemu-riscv@nongnu.org
References: <20230213180215.1524938-1-bmeng@tinylab.org>
 <20230213180215.1524938-11-bmeng@tinylab.org>
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20230213180215.1524938-11-bmeng@tinylab.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.130;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-130.freemail.mail.aliyun.com
X-Spam_score_int: -102
X-Spam_score: -10.3
X-Spam_bar: ----------
X-Spam_report: (-10.3 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.351, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Fri, 17 Feb 2023 02:39:19 -0000


On 2023/2/14 2:02, Bin Meng wrote:
> Since commit 94452ac4cf26 ("target/riscv: remove fflags, frm, and fcsr from riscv-*-fpu.xml")
> the 3 FPU CSRs are removed from the XML target decription. The
> original intent of that commit was based on the assumption that
> the 3 FPU CSRs will show up in the riscv-csr.xml so the ones in
> riscv-*-fpu.xml are redundant. But unforuantely that is not ture.
> As the FPU CSR predicate() has a run-time check on MSTATUS.FS,
> at the time when CSR XML is generated MSTATUS.FS is unset, hence
> no FPU CSRs will be reported.
>
> The FPU CSR predicate() already considered such a case of being
> accessed by a debugger. All we need to do is to turn on debugger
> mode before calling predicate().
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
> ---
>
>   target/riscv/gdbstub.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
>
> diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
> index 294f0ceb1c..ef52f41460 100644
> --- a/target/riscv/gdbstub.c
> +++ b/target/riscv/gdbstub.c
> @@ -280,6 +280,10 @@ static int riscv_gen_dynamic_csr_xml(CPUState *cs, int base_reg)
>       int bitsize = 16 << env->misa_mxl_max;
>       int i;
>   
> +#if !defined(CONFIG_USER_ONLY)
> +    env->debugger = true;
> +#endif
> +
>       /* Until gdb knows about 128-bit registers */
>       if (bitsize > 64) {
>           bitsize = 64;
> @@ -308,6 +312,11 @@ static int riscv_gen_dynamic_csr_xml(CPUState *cs, int base_reg)
>       g_string_append_printf(s, "</feature>");
>   
>       cpu->dyn_csr_xml = g_string_free(s, false);
> +
> +#if !defined(CONFIG_USER_ONLY)
> +    env->debugger = false;
> +#endif
> +

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

Zhiwei

>       return CSR_TABLE_SIZE;
>   }
>   

