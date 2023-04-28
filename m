Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1psCi4-0005Fj-Ic
	for mharc-qemu-riscv@gnu.org; Thu, 27 Apr 2023 21:15:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1psCi2-0005FJ-C4; Thu, 27 Apr 2023 21:15:38 -0400
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1psChy-0002AQ-TT; Thu, 27 Apr 2023 21:15:38 -0400
Received: from [192.168.0.120] (unknown [61.165.33.195])
 by APP-01 (Coremail) with SMTP id qwCowABHTp6DHEtkOOwQDA--.52756S2;
 Fri, 28 Apr 2023 09:08:19 +0800 (CST)
Message-ID: <10d903e4-0760-1121-792d-e29e5e7c5b6d@iscas.ac.cn>
Date: Fri, 28 Apr 2023 09:08:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Cc: liweiwei@iscas.ac.cn, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
Subject: Re: [PATCH 1/2] target/riscv/vector_helper.c: skip set tail when vta
 is zero
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
References: <20230427205708.246679-1-dbarboza@ventanamicro.com>
 <20230427205708.246679-2-dbarboza@ventanamicro.com>
Content-Language: en-US
From: Weiwei Li <liweiwei@iscas.ac.cn>
In-Reply-To: <20230427205708.246679-2-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: qwCowABHTp6DHEtkOOwQDA--.52756S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uFW7ury8CFyDKw1kZr1rtFb_yoW8KrWxpr
 48Kr9rur4rAFyxX3Wagr45A3W5Zrn5Gr4UCwn7twn0v3y3WrZ2gF4qya18CF17GFn7Ar1F
 g3WDZa1xZ3ykKaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvv14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
 1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
 7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
 1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE
 67vIY487MxkIecxEwVAFwVWkMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
 4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
 67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
 x0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
 z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73Uj
 IFyTuYvjfUOMKZDUUUU
X-Originating-IP: [61.165.33.195]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.422,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Fri, 28 Apr 2023 01:15:38 -0000


On 2023/4/28 04:57, Daniel Henrique Barboza wrote:
> The function is a no-op if 'vta' is zero but we're still doing a lot of
> stuff in this function regardless. vext_set_elems_1s() will ignore every
> single time (since vta is zero) and we just wasted time.
>
> Skip it altogether in this case. Aside from the code simplification
> there's a noticeable emulation performance gain by doing it. For a
> regular C binary that does a vectors operation like this:
>
> =======
>   #define SZ 10000000
>
> int main ()
> {
>    int *a = malloc (SZ * sizeof (int));
>    int *b = malloc (SZ * sizeof (int));
>    int *c = malloc (SZ * sizeof (int));
>
>    for (int i = 0; i < SZ; i++)
>      c[i] = a[i] + b[i];
>    return c[SZ - 1];
> }
> =======
>
> Emulating it with qemu-riscv64 and RVV takes ~0.3 sec:
>
> $ time ~/work/qemu/build/qemu-riscv64 \
>      -cpu rv64,debug=false,vext_spec=v1.0,v=true,vlen=128 ./foo.out
>
> real    0m0.303s
> user    0m0.281s
> sys     0m0.023s
>
> With this skip we take ~0.275 sec:
>
> $ time ~/work/qemu/build/qemu-riscv64 \
>      -cpu rv64,debug=false,vext_spec=v1.0,v=true,vlen=128 ./foo.out
>
> real    0m0.274s
> user    0m0.252s
> sys     0m0.019s
>
> This performance gain adds up fast when executing heavy benchmarks like
> SPEC.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---

Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Weiwei Li

>   target/riscv/vector_helper.c | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index f4d0438988..8e6c99e573 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -268,12 +268,17 @@ static void vext_set_tail_elems_1s(CPURISCVState *env, target_ulong vl,
>                                      void *vd, uint32_t desc, uint32_t nf,
>                                      uint32_t esz, uint32_t max_elems)
>   {
> -    uint32_t total_elems = vext_get_total_elems(env, desc, esz);
> -    uint32_t vlenb = riscv_cpu_cfg(env)->vlen >> 3;
> +    uint32_t total_elems, vlenb, registers_used;
>       uint32_t vta = vext_vta(desc);
> -    uint32_t registers_used;
>       int k;
>   
> +    if (vta == 0) {
> +        return;
> +    }
> +
> +    total_elems = vext_get_total_elems(env, desc, esz);
> +    vlenb = riscv_cpu_cfg(env)->vlen >> 3;
> +
>       for (k = 0; k < nf; ++k) {
>           vext_set_elems_1s(vd, vta, (k * max_elems + vl) * esz,
>                             (k * max_elems + max_elems) * esz);


