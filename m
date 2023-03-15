Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pcJ7C-00018b-NM
	for mharc-qemu-riscv@gnu.org; Wed, 15 Mar 2023 00:51:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pcJ7A-00018B-C6; Wed, 15 Mar 2023 00:51:52 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pcJ78-0002n8-FT; Wed, 15 Mar 2023 00:51:52 -0400
Received: from [192.168.0.120] (unknown [180.165.240.243])
 by APP-05 (Coremail) with SMTP id zQCowACHjxfhThFkkvAvAw--.1169S2;
 Wed, 15 Mar 2023 12:51:45 +0800 (CST)
Message-ID: <e32cac7e-015b-b6e4-cd7b-0454a3ab5d44@iscas.ac.cn>
Date: Wed, 15 Mar 2023 12:51:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Cc: liweiwei@iscas.ac.cn, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
Subject: Re: [PATCH for-8.1 v2 19/26] target/riscv/cpu:c add misa_ext V-> D &
 F dependency
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
References: <20230314164948.539135-1-dbarboza@ventanamicro.com>
 <20230314164948.539135-20-dbarboza@ventanamicro.com>
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230314164948.539135-20-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowACHjxfhThFkkvAvAw--.1169S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ArWDtF43tFWUXw4rur4rKrg_yoW8XF1xpr
 W3G3yakrWDJr9rC3y3JF1UZFyUurn5Wrs7Kwn3Ka47CrWSvrWUGr95Kw1xCr1xAa95Cw43
 Z3WDWr13Zr4DWa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
 1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CE
 bIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
 AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIY
 rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
 v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8
 JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUF9a9DU
 UUU
X-Originating-IP: [180.165.240.243]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Wed, 15 Mar 2023 04:51:52 -0000


On 2023/3/15 00:49, Daniel Henrique Barboza wrote:
> We have a chained dependency in riscv_cpu_validate_set_extensions()
> related to RVV. If RVV is set, we enable other extensions such as
> Zve64d, Zve64f and Zve32f, and these depends on misa bits RVD and RVF.
> Thus, we're making RVV depend on RVD and RVF.
>
> Let's add this dependency in riscv_cpu_validate_misa_ext() to fail
> earlier.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   target/riscv/cpu.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 83b1b874ee..fa1954a850 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1060,6 +1060,20 @@ static void riscv_cpu_validate_misa_ext(RISCVCPU *cpu, Error **errp)
>           error_setg(errp, "D extension requires F extension");
>           return;
>       }
> +
> +    if (cpu->cfg.ext_v) {
> +        /*
> +         * V depends on Zve64d, which requires D. It also
> +         * depends on Zve64f, which depends on Zve32f,
> +         * which requires F.
> +         *
> +         * This means that V depends on both D and F.
> +         */
> +        if (!(cpu->cfg.ext_d && cpu->cfg.ext_f)) {
> +            error_setg(errp, "V extension requires D and F extensions");
> +            return;
> +        }
> +    }
>   }

It seems not necessary to add this check here, since "zve64d requires D" 
will be checked later.

By the way,  "D requires  F" is checked before, so  check on F is 
redundant here.

Regards,

Weiwei Li

>   
>   static void riscv_cpu_validate_misa_mxl(RISCVCPU *cpu, Error **errp)


