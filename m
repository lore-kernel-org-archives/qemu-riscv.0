Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oA74v-0003zq-SJ
	for mharc-qemu-riscv@gnu.org; Sat, 09 Jul 2022 05:48:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oA74u-0003zd-F5; Sat, 09 Jul 2022 05:48:44 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:39780 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1oA74r-0004FP-NR; Sat, 09 Jul 2022 05:48:44 -0400
Received: from [192.168.0.104] (unknown [117.151.235.104])
 by APP-01 (Coremail) with SMTP id qwCowAD3_gbwTslit9oODg--.41133S2;
 Sat, 09 Jul 2022 17:48:33 +0800 (CST)
Subject: Re: [PATCH 1/2] target/riscv: Lower bound of VLEN is 32, and check
 VLEN >= ELEN
To: Kito Cheng <kito.cheng@sifive.com>, alistair.francis@wdc.com,
 palmer@dabbelt.com, frank.chang@sifive.com, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, liweiwei@iscas.ac.cn
References: <20220708073943.54781-1-kito.cheng@sifive.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <63d89660-7f73-3dce-bf14-7458d7e2d6e2@iscas.ac.cn>
Date: Sat, 9 Jul 2022 17:48:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220708073943.54781-1-kito.cheng@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: qwCowAD3_gbwTslit9oODg--.41133S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WryDWryUJF4rWrW5CF13CFg_yoW8ZryDpF
 48K3Wakr9Fy3Z7ua4IqF4UKF1UZr4Fga1xGwsYvw1DXa93CrZ8tr1vkF429F47GFn5XF4S
 ga4jqF45ZwsrJrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvj14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
 1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CE
 bIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
 AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIY
 rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
 v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVWU
 JVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUoO
 J5UUUUU
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
X-List-Received-Date: Sat, 09 Jul 2022 09:48:44 -0000


在 2022/7/8 下午3:39, Kito Cheng 写道:
> According RVV spec 1.0, the minmal requirement of VLEN is great than or
> equal to ELEN, and minmal possible ELEN is 32, and also spec has mention
> `Minimum VLEN` for zve32* is 32, so the lower bound of VLEN is 32 I
> think.
>
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

The check for "VLEN in the range [128, RV_VLEN_MAX]" seems right here, 
since this check is for

V vector extension in current implementation and  "The V vector 
extension requires Zvl128b"(in section 18.3).

Regards,

Weiwei Li

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


