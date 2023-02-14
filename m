Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pRrCj-0006qk-TY
	for mharc-qemu-riscv@gnu.org; Tue, 14 Feb 2023 04:02:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pRrCh-0006qB-CI; Tue, 14 Feb 2023 04:02:23 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pRrCe-00055B-A0; Tue, 14 Feb 2023 04:02:22 -0500
Received: from [192.168.0.119] (unknown [114.95.238.225])
 by APP-05 (Coremail) with SMTP id zQCowAD3_PAUTutjyOwsBQ--.41238S2;
 Tue, 14 Feb 2023 17:02:13 +0800 (CST)
Message-ID: <f6123fde-c840-c6a0-6dfb-00bdec459134@iscas.ac.cn>
Date: Tue, 14 Feb 2023 17:02:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Cc: liweiwei@iscas.ac.cn, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Subject: Re: [PATCH 10/18] target/riscv: gdbstub: Turn on debugger mode before
 calling CSR predicate()
Content-Language: en-US
To: Bin Meng <bmeng@tinylab.org>, qemu-devel@nongnu.org
References: <20230213180215.1524938-1-bmeng@tinylab.org>
 <20230213180215.1524938-11-bmeng@tinylab.org>
From: weiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230213180215.1524938-11-bmeng@tinylab.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: zQCowAD3_PAUTutjyOwsBQ--.41238S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ur1fKrW8GFWxJw1DJFy7Jrb_yoW8ArW7p3
 yrC3yUCrWUt347A393XFs5WF15Xrn5Kr9093s5Z34rJ3y5WrWj9r9rK3W5tFy7XFZ7KF1j
 9F1q9rWF9w48AFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
 Y487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
 0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y
 0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
 WxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4U
 MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjfU5JPEDU
 UUU
X-Originating-IP: [114.95.238.225]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.345,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 14 Feb 2023 09:02:24 -0000


On 2023/2/14 02:02, Bin Meng wrote:
> Since commit 94452ac4cf26 ("target/riscv: remove fflags, frm, and fcsr from riscv-*-fpu.xml")
> the 3 FPU CSRs are removed from the XML target decription. The
> original intent of that commit was based on the assumption that
> the 3 FPU CSRs will show up in the riscv-csr.xml so the ones in
> riscv-*-fpu.xml are redundant. But unforuantely that is not ture.

typo here -> true

otherwise, Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Regards,
Weiwei Li

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
>       return CSR_TABLE_SIZE;
>   }
>   


