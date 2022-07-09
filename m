Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oA6TQ-0001mo-Af
	for mharc-qemu-riscv@gnu.org; Sat, 09 Jul 2022 05:10:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oA6TJ-0001lU-Cs; Sat, 09 Jul 2022 05:09:53 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:34552 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oA6TF-00042q-TF; Sat, 09 Jul 2022 05:09:52 -0400
Received: from [192.168.0.104] (unknown [117.151.235.104])
 by APP-01 (Coremail) with SMTP id qwCowAC3FxXMRcliDjENDg--.41150S2;
 Sat, 09 Jul 2022 17:09:33 +0800 (CST)
Subject: Re: [PATCH 2/2] target/riscv: Implement dump content of vector
 register
To: Kito Cheng <kito.cheng@sifive.com>, alistair.francis@wdc.com,
 palmer@dabbelt.com, frank.chang@sifive.com, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, liweiwei@iscas.ac.cn, richard.henderson@linaro.org
References: <20220708085736.94546-1-kito.cheng@sifive.com>
 <20220708085736.94546-2-kito.cheng@sifive.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <83dc5fba-f1e7-bf1c-060b-41daff4aacd0@iscas.ac.cn>
Date: Sat, 9 Jul 2022 17:09:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220708085736.94546-2-kito.cheng@sifive.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: qwCowAC3FxXMRcliDjENDg--.41150S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WrW3Kw1DZrW8tF4UAw1DWrg_yoW8Aryxpr
 sYg3Way348XrZIq3yfJw1DZr13Zr4kGrn8uanrJry7CFW7JrWDCa98Kw4avr1UGF1Fqr4Y
 kF1Y9Fyruw4qgrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvj14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
 1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CE
 bIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
 AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIY
 rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
 v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVWU
 JVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUoO
 J5UUUUU
X-Originating-IP: [117.151.235.104]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.21; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, MIME_CHARSET_FARAWAY=2.45,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 09 Jul 2022 09:09:53 -0000


ÔÚ 2022/7/8 ÏÂÎç4:57, Kito Cheng Ð´µÀ:
> Implement -d cpu,vu to dump content of vector register.
>
> Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
> ---
>   target/riscv/cpu.c | 31 +++++++++++++++++++++++++++++++
>   1 file changed, 31 insertions(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index c1b96da7da..97b289d277 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -72,6 +72,15 @@ const char * const riscv_fpr_regnames[] = {
>     "f30/ft10", "f31/ft11"
>   };
>   
> +const char * const riscv_vr_regnames[] = {
> +  "v0",  "v1",  "v2",  "v3",  "v4",  "v5",
> +  "v6",  "v7",  "v8",  "v9",  "v10", "v11",
> +  "v12", "v13", "v14", "v15", "v16", "v17",
> +  "v18", "v19", "v20", "v21", "v22", "v23",
> +  "v24", "v25", "v26", "v27", "v28", "v29",
> +  "v30", "v31"
> +};
> +
>   static const char * const riscv_excp_names[] = {
>       "misaligned_fetch",
>       "fault_fetch",
> @@ -375,6 +384,28 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>               }
>           }
>       }
> +    if (flags & CPU_DUMP_VU) {
> +        int vlen = cpu->cfg.vlen;
> +        int n_chunk = vlen / 64;
> +        if (vlen == 32) {
> +            for (i = 0; i < 32; i++) {
> +                qemu_fprintf(f, "0x%08" PRIx64 "\n", env->vreg[i]);
> +            }

Seems forget to dump the riscv_vr_regnames here.

Just another question: whether is it necessary to dump the vector 
related csrs too?

Regards,

Weiwei Li

> +        } else {
> +            for (i = 0; i < 32; i++) {
> +                qemu_fprintf(f, " %-8s ",
> +                             riscv_vr_regnames[i]);
> +
> +                int vec_reg_offset = i * vlen / 64;
> +                qemu_fprintf(f, "0x");
> +                for (int j = n_chunk - 1; j >= 0; --j) {
> +                    qemu_fprintf(f, "%016" PRIx64,
> +                                 env->vreg[vec_reg_offset + j]);
> +                }
> +                qemu_fprintf(f, "\n");
> +            }
> +        }
> +    }
>   }
>   
>   static void riscv_cpu_set_pc(CPUState *cs, vaddr value)


