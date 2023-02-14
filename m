Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pRr01-0008QE-21
	for mharc-qemu-riscv@gnu.org; Tue, 14 Feb 2023 03:49:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pRqzn-0008G5-1P; Tue, 14 Feb 2023 03:49:09 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pRqzk-0008Jf-1N; Tue, 14 Feb 2023 03:49:02 -0500
Received: from [192.168.0.119] (unknown [114.95.238.225])
 by APP-05 (Coremail) with SMTP id zQCowACnrJjsSutjhIwsBQ--.41664S2;
 Tue, 14 Feb 2023 16:48:45 +0800 (CST)
Message-ID: <4cb6521a-e3e6-1c1d-c71f-4ec5400850ef@iscas.ac.cn>
Date: Tue, 14 Feb 2023 16:48:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Cc: liweiwei@iscas.ac.cn, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Subject: Re: [PATCH 06/18] target/riscv: Use 'bool' type for read_only
Content-Language: en-US
To: Bin Meng <bmeng@tinylab.org>, qemu-devel@nongnu.org
References: <20230213180215.1524938-1-bmeng@tinylab.org>
 <20230213180215.1524938-7-bmeng@tinylab.org>
From: weiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230213180215.1524938-7-bmeng@tinylab.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: zQCowACnrJjsSutjhIwsBQ--.41664S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtw18JFy7ZF4UGw4xAFy8Grg_yoWfWFc_GF
 4SgFySg3y8W3Za9a4DA34rZFy3Kr40kr1YyFsrtrWv9FWDWr9rA34kKrWkZw45Cws7J3Z7
 C3s7Xa9FkF12vjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUb4AFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
 6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
 Y487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
 0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y
 0x0EwIxGrwCI42IY6xIIjxv20xvE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
 W8Jr0_Cr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWx
 JwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7VUbKsjU
 UUUUU==
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
X-List-Received-Date: Tue, 14 Feb 2023 08:49:11 -0000


On 2023/2/14 02:02, Bin Meng wrote:
> The read_only variable is currently declared as an 'int', but it
> should really be a 'bool'.
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Regards,
Weiwei Li
> ---
>
>   target/riscv/csr.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index cc74819759..8bbc75cbfa 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -3778,7 +3778,7 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
>                                                  RISCVCPU *cpu)
>   {
>       /* check privileges and return RISCV_EXCP_ILLEGAL_INST if check fails */
> -    int read_only = get_field(csrno, 0xC00) == 3;
> +    bool read_only = get_field(csrno, 0xC00) == 3;
>       int csr_min_priv = csr_ops[csrno].min_priv_ver;
>   
>       /* ensure the CSR extension is enabled. */


