Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oA5s1-0004mY-0Y
	for mharc-qemu-riscv@gnu.org; Sat, 09 Jul 2022 04:31:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oA5rk-0004lX-Bk; Sat, 09 Jul 2022 04:31:19 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:56710 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oA5rg-0000Sr-QE; Sat, 09 Jul 2022 04:31:04 -0400
Received: from [192.168.0.104] (unknown [117.151.235.104])
 by APP-01 (Coremail) with SMTP id qwCowAC3vxe6PMlir3ALDg--.40544S2;
 Sat, 09 Jul 2022 16:30:51 +0800 (CST)
Subject: Re: [PATCH 1/2] target/riscv: Lower bound of VLEN is 32, and check
 VLEN >= ELEN
To: Kito Cheng <kito.cheng@sifive.com>, alistair.francis@wdc.com,
 palmer@dabbelt.com, frank.chang@sifive.com, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, liweiwei@iscas.ac.cn
References: <20220708073943.54781-1-kito.cheng@sifive.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <64a67165-8fd5-e4f3-7fe4-7445d337e4e0@iscas.ac.cn>
Date: Sat, 9 Jul 2022 16:30:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220708073943.54781-1-kito.cheng@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: qwCowAC3vxe6PMlir3ALDg--.40544S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WryDWryUJF4rWrW5CF13CFg_yoW8Zw1UpF
 4kKa4akr9Fy34xWa4IqF4DKF1UZrsYga1fJwsYyw1DXFZxGrZ8trn0kF1a9FW8GFn5XF4I
 ga1jgF15ZanrJrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUv014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
 1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
 7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
 1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE
 67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrV
 AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCI
 c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267
 AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_
 Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUb
 XdbUUUUUU==
X-Originating-IP: [117.151.235.104]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.21; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Sat, 09 Jul 2022 08:31:20 -0000


在 2022/7/8 下午3:39, Kito Cheng 写道:
> According RVV spec 1.0, the minmal requirement of VLEN is great than or
> equal to ELEN, and minmal possible ELEN is 32, and also spec has mention
> `Minimum VLEN` for zve32* is 32, so the lower bound of VLEN is 32 I
> think.

Sorry. I have a question about how to decide the minmal possible ELEN to 
be 32?

In current implementation, elen should be in the range [8, 64](and there 
seems to be a typo in the check for this).

If the minmal possible ELEN is 32, maybe we need change the check to 
"elen >= 32" too.

Regards,

Weiwei Li

> [1] https://github.com/riscv/riscv-v-spec/blob/master/v-spec.adoc#2-implementation-defined-constant-parameters
> [2] https://github.com/riscv/riscv-v-spec/blob/master/v-spec.adoc#182-zve-vector-extensions-for-embedded-processors
>
> Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
> ---
>   target/riscv/cpu.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 1bb3973806..487d0faa63 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -740,10 +740,10 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>                           "Vector extension VLEN must be power of 2");
>                   return;
>               }
> -            if (cpu->cfg.vlen > RV_VLEN_MAX || cpu->cfg.vlen < 128) {
> +            if (cpu->cfg.vlen > RV_VLEN_MAX || cpu->cfg.vlen < 32) {
>                   error_setg(errp,
>                           "Vector extension implementation only supports VLEN "
> -                        "in the range [128, %d]", RV_VLEN_MAX);
> +                        "in the range [32, %d]", RV_VLEN_MAX);
>                   return;
>               }
>               if (!is_power_of_2(cpu->cfg.elen)) {
> @@ -757,6 +757,12 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>                           "in the range [8, 64]");
>                   return;
>               }
> +            if (cpu->cfg.vlen < cpu->cfg.elen) {
> +                error_setg(errp,
> +                        "Vector extension VLEN must be greater than or equal "
> +                        "to ELEN");
> +                return;
> +            }
>               if (cpu->cfg.vext_spec) {
>                   if (!g_strcmp0(cpu->cfg.vext_spec, "v1.0")) {
>                       vext_version = VEXT_VERSION_1_00_0;


