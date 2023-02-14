Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pRrNp-0001Ln-6u
	for mharc-qemu-riscv@gnu.org; Tue, 14 Feb 2023 04:13:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pRrNl-0001LJ-J4; Tue, 14 Feb 2023 04:13:50 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pRrNi-00023l-PT; Tue, 14 Feb 2023 04:13:49 -0500
Received: from [192.168.0.119] (unknown [114.95.238.225])
 by APP-05 (Coremail) with SMTP id zQCowAA3PJi+UOtjWCMtBQ--.41338S2;
 Tue, 14 Feb 2023 17:13:34 +0800 (CST)
Message-ID: <cf8deb72-afe5-6a0e-030f-3c23fba83d3c@iscas.ac.cn>
Date: Tue, 14 Feb 2023 17:13:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Cc: liweiwei@iscas.ac.cn, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Subject: Re: [PATCH 11/18] target/riscv: gdbstub: Drop the vector CSRs in
 riscv-vector.xml
Content-Language: en-US
To: Bin Meng <bmeng@tinylab.org>, qemu-devel@nongnu.org
References: <20230213180215.1524938-1-bmeng@tinylab.org>
 <20230213180215.1524938-12-bmeng@tinylab.org>
From: weiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230213180215.1524938-12-bmeng@tinylab.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: zQCowAA3PJi+UOtjWCMtBQ--.41338S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWrW3ur4ftr47JF1xWFyDWrg_yoW5urW5pw
 43JFZxArW5tr1xXwn3Jrs0qF15Aa47GrW5Aw4DK3s5Ca95uF4DJF1vk34SvFyUJas09r12
 y3WUua15C3yUAFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07AlzVAY
 IcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
 v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkG
 c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4U
 MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjfUOGQDUU
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
X-List-Received-Date: Tue, 14 Feb 2023 09:13:50 -0000


On 2023/2/14 02:02, Bin Meng wrote:
> It's worth noting that the vector CSR predicate() has a similar
> run-time check logic to the FPU CSR. With the previous patch our
> gdbstub can correctly report these vector CSRs via the CSR xml.
>
> Commit 719d3561b269 ("target/riscv: gdb: support vector registers for rv64 & rv32")
> inserted these vector CSRs in an ad-hoc, non-standard way in the
> riscv-vector.xml. Now we can treat these CSRs no different from
> other CSRs.
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Regards,
Weiwei Li
> ---
>
>   target/riscv/gdbstub.c | 75 ------------------------------------------
>   1 file changed, 75 deletions(-)
>
> diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
> index ef52f41460..6048541606 100644
> --- a/target/riscv/gdbstub.c
> +++ b/target/riscv/gdbstub.c
> @@ -127,40 +127,6 @@ static int riscv_gdb_set_fpu(CPURISCVState *env, uint8_t *mem_buf, int n)
>       return 0;
>   }
>   
> -/*
> - * Convert register index number passed by GDB to the correspond
> - * vector CSR number. Vector CSRs are defined after vector registers
> - * in dynamic generated riscv-vector.xml, thus the starting register index
> - * of vector CSRs is 32.
> - * Return 0 if register index number is out of range.
> - */
> -static int riscv_gdb_vector_csrno(int num_regs)
> -{
> -    /*
> -     * The order of vector CSRs in the switch case
> -     * should match with the order defined in csr_ops[].
> -     */
> -    switch (num_regs) {
> -    case 32:
> -        return CSR_VSTART;
> -    case 33:
> -        return CSR_VXSAT;
> -    case 34:
> -        return CSR_VXRM;
> -    case 35:
> -        return CSR_VCSR;
> -    case 36:
> -        return CSR_VL;
> -    case 37:
> -        return CSR_VTYPE;
> -    case 38:
> -        return CSR_VLENB;
> -    default:
> -        /* Unknown register. */
> -        return 0;
> -    }
> -}
> -
>   static int riscv_gdb_get_vector(CPURISCVState *env, GByteArray *buf, int n)
>   {
>       uint16_t vlenb = env_archcpu(env)->cfg.vlen >> 3;
> @@ -174,19 +140,6 @@ static int riscv_gdb_get_vector(CPURISCVState *env, GByteArray *buf, int n)
>           return cnt;
>       }
>   
> -    int csrno = riscv_gdb_vector_csrno(n);
> -
> -    if (!csrno) {
> -        return 0;
> -    }
> -
> -    target_ulong val = 0;
> -    int result = riscv_csrrw_debug(env, csrno, &val, 0, 0);
> -
> -    if (result == RISCV_EXCP_NONE) {
> -        return gdb_get_regl(buf, val);
> -    }
> -
>       return 0;
>   }
>   
> @@ -201,19 +154,6 @@ static int riscv_gdb_set_vector(CPURISCVState *env, uint8_t *mem_buf, int n)
>           return vlenb;
>       }
>   
> -    int csrno = riscv_gdb_vector_csrno(n);
> -
> -    if (!csrno) {
> -        return 0;
> -    }
> -
> -    target_ulong val = ldtul_p(mem_buf);
> -    int result = riscv_csrrw_debug(env, csrno, NULL, val, -1);
> -
> -    if (result == RISCV_EXCP_NONE) {
> -        return sizeof(target_ulong);
> -    }
> -
>       return 0;
>   }
>   
> @@ -361,21 +301,6 @@ static int ricsv_gen_dynamic_vector_xml(CPUState *cs, int base_reg)
>           num_regs++;
>       }
>   
> -    /* Define vector CSRs */
> -    const char *vector_csrs[7] = {
> -        "vstart", "vxsat", "vxrm", "vcsr",
> -        "vl", "vtype", "vlenb"
> -    };
> -
> -    for (i = 0; i < 7; i++) {
> -        g_string_append_printf(s,
> -                               "<reg name=\"%s\" bitsize=\"%d\""
> -                               " regnum=\"%d\" group=\"vector\""
> -                               " type=\"int\"/>",
> -                               vector_csrs[i], TARGET_LONG_BITS, base_reg++);
> -        num_regs++;
> -    }
> -
>       g_string_append_printf(s, "</feature>");
>   
>       cpu->dyn_vreg_xml = g_string_free(s, false);


