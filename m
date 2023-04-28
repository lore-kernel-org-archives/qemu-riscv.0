Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1psCp7-0007OU-M9
	for mharc-qemu-riscv@gnu.org; Thu, 27 Apr 2023 21:22:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1psCoy-0007J0-TW; Thu, 27 Apr 2023 21:22:48 -0400
Received: from [159.226.251.80] (helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1psCov-0004Dj-I9; Thu, 27 Apr 2023 21:22:48 -0400
Received: from [192.168.0.120] (unknown [61.165.33.195])
 by APP-01 (Coremail) with SMTP id qwCowABXOYLaH0tk9X8SDA--.897S2;
 Fri, 28 Apr 2023 09:22:34 +0800 (CST)
Message-ID: <6d48f787-f4ce-e8af-ac2f-a99596c8a012@iscas.ac.cn>
Date: Fri, 28 Apr 2023 09:22:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Cc: liweiwei@iscas.ac.cn, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
Subject: Re: [PATCH 2/2] target/riscv/vector_helper.c: make
 vext_set_tail_elems_1s() debug only
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
References: <20230427205708.246679-1-dbarboza@ventanamicro.com>
 <20230427205708.246679-3-dbarboza@ventanamicro.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
In-Reply-To: <20230427205708.246679-3-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowABXOYLaH0tk9X8SDA--.897S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kr47Aryfuw4kGF4UGrW3Wrg_yoW8tryfpF
 ZYka9FvFZ8XF95W3WSgr4UAw1rXa95Gw45A3Z3A34jy3y5Jrs7WFWvk3ya93W7JF4F9r1j
 q3WqyryUZa1DAa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvm14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
 1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
 7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
 1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE
 67vIY487MxkIecxEwVAFwVWkMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
 4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
 67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
 x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
 z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
 UI43ZEXa7VU1ItC7UUUUU==
X-Originating-IP: [61.165.33.195]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
X-Host-Lookup-Failed: Reverse DNS lookup failed for 159.226.251.80 (deferred)
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.422,
 RCVD_IN_MSPIKE_H2=-0.001, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Fri, 28 Apr 2023 01:22:49 -0000


On 2023/4/28 04:57, Daniel Henrique Barboza wrote:
> Commit 3479a814 ("target/riscv: rvv-1.0: add VMA and VTA") added vma and
> vta fields in the vtype register, while also defining that QEMU doesn't
> need to have a tail agnostic policy to be compliant with the RVV spec.
> It ended up removing all tail handling code as well. Later, commit
> 752614ca ("target/riscv: rvv: Add tail agnostic for vector load / store
> instructions") reintroduced the tail agnostic fill for vector load/store
> instructions only.
>
> This puts QEMU in a situation where some functions are 1-filling the
> tail elements and others don't. This is still a valid implementation,
> but the process of 1-filling the tail elements takes valuable emulation
> time that can be used doing anything else. If the spec doesn't demand a
> specific tail-agostic policy, a proper software wouldn't expect any
> policy to be in place. This means that, more often than not, the work
> we're doing by 1-filling tail elements is wasted. We would be better of
> if vext_set_tail_elems_1s() is removed entirely from the code.
>
> All this said, there's still a debug value associated with it. So,
> instead of removing it, let's gate it with cpu->cfg.debug. This way
> software can enable this code if desirable, but for the regular case we
> shouldn't waste time with it.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   target/riscv/vector_helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
> index 8e6c99e573..e0a292ac24 100644
> --- a/target/riscv/vector_helper.c
> +++ b/target/riscv/vector_helper.c
> @@ -272,7 +272,7 @@ static void vext_set_tail_elems_1s(CPURISCVState *env, target_ulong vl,
>       uint32_t vta = vext_vta(desc);
>       int k;
>   
> -    if (vta == 0) {
> +    if (vta == 0 || !riscv_cpu_cfg(env)->debug)  {

I think this is not correct. 'debug' property is used for debug spec. 
And this feature is controlled by another property 'rvv_ta_all_1s' .

By the way, cfg.rvv_ta_all_1s have been ANDed intovta value. So 
additional check on it  is also unnecessary here.

Regards,

Weiwei Li

>           return;
>       }
>   


