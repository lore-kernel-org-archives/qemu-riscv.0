Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nVa5X-00074i-Gq
	for mharc-qemu-riscv@gnu.org; Sat, 19 Mar 2022 10:29:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nVa5W-00074W-8n; Sat, 19 Mar 2022 10:29:50 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:44872 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nVa5T-0003Wa-8s; Sat, 19 Mar 2022 10:29:49 -0400
Received: from [192.168.3.6] (unknown [180.156.147.178])
 by APP-01 (Coremail) with SMTP id qwCowAAXH_PT6DViQQxUBA--.4728S2;
 Sat, 19 Mar 2022 22:29:39 +0800 (CST)
Subject: Re: [PATCH qemu 01/13] target/riscv: rvv: Prune redundant ESZ, DSZ
 parameter passed
To: ~eopxd <yueh.ting.chen@gmail.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 eop Chen <eop.chen@sifive.com>
References: <164769423983.18409.14760549429989700286-1@git.sr.ht>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <409d7084-2fdb-d508-d962-8b4a41747219@iscas.ac.cn>
Date: Sat, 19 Mar 2022 22:29:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <164769423983.18409.14760549429989700286-1@git.sr.ht>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: qwCowAAXH_PT6DViQQxUBA--.4728S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zr4rAF4UtryrWr4fCw43GFg_yoW8Gw4Upa
 n7WrWavr4DJFWxWasagF1UZa1rZFs3GrW8GrnxWw1rArZ5Xr9rAr4kKa1rCFy7Ga93uF1Y
 v3Wjyr1akr1UJFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9F14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
 1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CE
 bIxvr21lc7CjxVAKzI0EY4vE52x082I5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
 AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
 17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
 IF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3
 Jr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcS
 sGvfC2KfnxnUUI43ZEXa7VUjdHUDUUUUU==
X-Originating-IP: [180.156.147.178]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.21; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Sat, 19 Mar 2022 14:29:50 -0000


在 2022/3/14 下午3:38, ~eopxd 写道:
> From: eopXD <eop.chen@sifive.com>
>
> No functional change intended in this commit.
>
> Signed-off-by: eop Chen <eop.chen@sifive.com>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> ---
>   target/riscv/vector_helper.c | 1132 +++++++++++++++++-----------------
>   1 file changed, 565 insertions(+), 567 deletions(-)
>
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 3bd4aac9c9..e94caf1a3c 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -710,7 +710,6 @@ RVVCALL(OPIVV2, vsub_vv_d, OP_SSS_D, H8, H8, H8, DO_SUB)
>   
>   static void do_vext_vv(void *vd, void *v0, void *vs1, void *vs2,
>                          CPURISCVState *env, uint32_t desc,
> -                       uint32_t esz, uint32_t dsz,
>                          opivv2_fn *fn)
>   {
>       uint32_t vm = vext_vm(desc);
> @@ -727,23 +726,23 @@ static void do_vext_vv(void *vd, void *v0, void *vs1, void *vs2,
>   }
>   
>   /* generate the helpers for OPIVV */
> -#define GEN_VEXT_VV(NAME, ESZ, DSZ)                       \
> +#define GEN_VEXT_VV(NAME)                                 \
>   void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
>                     void *vs2, CPURISCVState *env,          \
>                     uint32_t desc)                          \
>   {                                                         \
> -    do_vext_vv(vd, v0, vs1, vs2, env, desc, ESZ, DSZ,     \
> +    do_vext_vv(vd, v0, vs1, vs2, env, desc,               \
>                  do_##NAME);                                \
>   }
>   

ESZ can be used in the later patches. Maybe it's better to move this 
patch to  last  and prune redundant DSZ parameter.

Regards,

Weiwei Li


