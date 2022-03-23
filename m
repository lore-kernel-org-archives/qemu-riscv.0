Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nX0TB-0001cM-Jd
	for mharc-qemu-riscv@gnu.org; Wed, 23 Mar 2022 08:52:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nX0T6-0001XF-LQ; Wed, 23 Mar 2022 08:52:06 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:46438 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nX0T3-0002vK-RK; Wed, 23 Mar 2022 08:52:04 -0400
Received: from [192.168.3.6] (unknown [180.156.147.178])
 by APP-01 (Coremail) with SMTP id qwCowACHj_PrFztigvsZBQ--.58717S2;
 Wed, 23 Mar 2022 20:51:55 +0800 (CST)
Subject: Re: [RFC PATCH v2 2/4] target/riscv: smstateen check for h/senvcfg
To: Mayuresh Chitale <mchitale@ventanamicro.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com
References: <20220323111309.9109-1-mchitale@ventanamicro.com>
 <20220323111309.9109-3-mchitale@ventanamicro.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <472dfd4e-099f-97e0-ba16-561df8ddeef1@iscas.ac.cn>
Date: Wed, 23 Mar 2022 20:51:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220323111309.9109-3-mchitale@ventanamicro.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: qwCowACHj_PrFztigvsZBQ--.58717S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKr4rAFW7XFWDCw4Duw43trb_yoWkurb_Cw
 1Fgr92gr15W3ZakFy8Jw15uryakw48KF1Yv3W3tr1UG34UWryUGw1ktF1UC3yY9r4UJFnx
 Cr97XryxCr1avjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUb38FF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
 Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
 0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
 jxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
 1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CEbIxv
 r21lc7CjxVAKzI0EY4vE52x082I5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r
 1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CE
 b7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0x
 vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI
 42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWI
 evJa73UjIFyTuYvjfU8TmhUUUUU
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.21; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, MIME_CHARSET_FARAWAY=2.45,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Wed, 23 Mar 2022 12:52:06 -0000


ÔÚ 2022/3/23 ÏÂÎç7:13, Mayuresh Chitale Ð´µÀ:
> Accesses to henvcfg, henvcfgh and senvcfg are allowed
> only if corresponding bit in mstateen0/hstateen0 is
> enabled. Otherwise an illegal instruction trap is
> generated.
>
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> ---
>   target/riscv/csr.c | 82 ++++++++++++++++++++++++++++++++++++++++++----
>   1 file changed, 76 insertions(+), 6 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 215c8ecef1..2388f0226f 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -39,6 +39,35 @@ void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops)
>   }
>   
>   /* Predicates */
> +static RISCVException smstateen_acc_ok(CPURISCVState *env, int mode, int bit)
> +{
> +    CPUState *cs = env_cpu(env);
> +    RISCVCPU *cpu = RISCV_CPU(cs);
> +    bool virt = riscv_cpu_virt_enabled(env);
> +
> +    if (!cpu->cfg.ext_smstateen) {
> +        return RISCV_EXCP_NONE;
> +    }
> +
> +    if (!(env->mstateen[0] & 1UL << bit)) {
> +        return RISCV_EXCP_ILLEGAL_INST;
> +    }

I think here should be " & (1UL << bit) " . The same for following 
similar cases.

Regards,

Weiwei Li


