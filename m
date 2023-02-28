Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pWylY-0005bF-C8
	for mharc-qemu-riscv@gnu.org; Tue, 28 Feb 2023 07:07:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pWylV-0005Wt-D1; Tue, 28 Feb 2023 07:07:29 -0500
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pWylJ-00049L-IJ; Tue, 28 Feb 2023 07:07:28 -0500
Received: from [192.168.0.120] (unknown [180.165.240.213])
 by APP-01 (Coremail) with SMTP id qwCowAA3Pkpo7v1jhjMTCQ--.10374S2;
 Tue, 28 Feb 2023 20:07:05 +0800 (CST)
Message-ID: <66886725-262a-5985-32c6-388d7bcb36e5@iscas.ac.cn>
Date: Tue, 28 Feb 2023 20:07:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 02/18] target/riscv: Add some comments to clarify the
 priority policy of riscv_csrrw_check()
Content-Language: en-US
To: Bin Meng <bmeng@tinylab.org>, qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
References: <20230228104035.1879882-1-bmeng@tinylab.org>
 <20230228104035.1879882-3-bmeng@tinylab.org>
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230228104035.1879882-3-bmeng@tinylab.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: qwCowAA3Pkpo7v1jhjMTCQ--.10374S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zw18WF1fGw43Gw45KF4fAFb_yoW8tF4fpw
 40k3y5u395WFZrCanxJF1jqF13uw45Ja15J3Z2kw1rW3yfJry5tF98KrZ8KF97XrsYkw12
 vFs0yFyS9F4UAa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkIb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
 8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
 64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
 Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzVAYIcxG8wCF
 04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r
 18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vI
 r41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr
 1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvE
 x4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8IzuJUUUUU==
X-Originating-IP: [180.165.240.213]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.092,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Tue, 28 Feb 2023 12:07:30 -0000


On 2023/2/28 18:40, Bin Meng wrote:
> The priority policy of riscv_csrrw_check() was once adjusted in
> commit eacaf4401956 ("target/riscv: Fix priority of csr related check in riscv_csrrw_check")
> whose commit message says the CSR existence check should come before
> the access control check, but the code changes did not agree with
> the commit message, that the predicate() check actually came after
> the read / write check.
>
> In fact this was intentional. Add some comments there so that people
> won't bother trying to change it without a solid reason.
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Weiwei Li<liweiwei@iscas.ac.cn>

Weiwei Li
> ---
>
> Changes in v2:
> - Keep the original priority policy, instead add some comments for clarification
>
>   target/riscv/csr.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 75a540bfcb..4cc2c6370f 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -3776,11 +3776,12 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
>       int read_only = get_field(csrno, 0xC00) == 3;
>       int csr_min_priv = csr_ops[csrno].min_priv_ver;
>   
> -    /* ensure the CSR extension is enabled. */
> +    /* ensure the CSR extension is enabled */
>       if (!cpu->cfg.ext_icsr) {
>           return RISCV_EXCP_ILLEGAL_INST;
>       }
>   
> +    /* privileged spec version check */
>       if (env->priv_ver < csr_min_priv) {
>           return RISCV_EXCP_ILLEGAL_INST;
>       }
> @@ -3790,10 +3791,18 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
>           return RISCV_EXCP_ILLEGAL_INST;
>       }
>   
> +    /* read / write check */
>       if (write_mask && read_only) {
>           return RISCV_EXCP_ILLEGAL_INST;
>       }
>   
> +    /*
> +     * The predicate() not only does existence check but also does some
> +     * access control check which triggers for example virtual instruction
> +     * exception in some cases. When writing read-only CSRs in those cases
> +     * illegal instruction exception should be triggered instead of virtual
> +     * instruction exception. Hence this comes after the read / write check.
> +     */
>       RISCVException ret = csr_ops[csrno].predicate(env, csrno);
>       if (ret != RISCV_EXCP_NONE) {
>           return ret;


