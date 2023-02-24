Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pVNRM-0000qk-FH
	for mharc-qemu-riscv@gnu.org; Thu, 23 Feb 2023 21:04:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pVNRK-0000qC-4E; Thu, 23 Feb 2023 21:04:02 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pVNRI-0006z1-8i; Thu, 23 Feb 2023 21:04:01 -0500
Received: from [192.168.0.120] (unknown [114.95.238.225])
 by APP-05 (Coremail) with SMTP id zQCowAD3_PALG_hjC838Bw--.36265S2;
 Fri, 24 Feb 2023 10:03:56 +0800 (CST)
Message-ID: <cbf7d10e-ca97-6c69-8575-1a81cb378c5b@iscas.ac.cn>
Date: Fri, 24 Feb 2023 10:03:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v7 4/4] target/riscv: add Zicbop cbo.prefetch{i, r, m}
 placeholder
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 richard.henderson@linaro.org, Christoph Muellner <cmuellner@linux.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
References: <20230223234427.521114-1-dbarboza@ventanamicro.com>
 <20230223234427.521114-5-dbarboza@ventanamicro.com>
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230223234427.521114-5-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: zQCowAD3_PALG_hjC838Bw--.36265S2
X-Coremail-Antispam: 1UD129KBjvJXoW7trW8Jr17Jr4UCFWkGFW8tFb_yoW8GFWDpr
 48Gw48GF48Jry7G340gF45ZryUGrsxWFWUJr93Xw1fWa15Xay8J34DKw45KFZ5ArZrAFyU
 Xr4DAry7AFZ5trUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9214x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
 4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
 Yx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbV
 WUJVW8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
 Y2ka0xkIwI1lc7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4
 IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1r
 MI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJV
 WUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j
 6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYx
 BIdaVFxhVjvjDU0xZFpf9x0JUZa9-UUUUU=
X-Originating-IP: [114.95.238.225]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.09,
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
X-List-Received-Date: Fri, 24 Feb 2023 02:04:02 -0000


On 2023/2/24 07:44, Daniel Henrique Barboza wrote:
> From: Christoph Muellner <cmuellner@linux.com>
>
> The cmo.prefetch instructions are nops for QEMU (no emulation of the
> memory hierarchy, no illegal instructions, no permission faults, no
> traps).
>
> Add a comment noting where they would be decoded in case cbo.prefetch
> instructions become relevant in the future.
>
> Co-developed-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
> Signed-off-by: Christoph Muellner <cmuellner@linux.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Weiwei Li

>   target/riscv/insn32.decode | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 3788f86528..1aebd37572 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -134,6 +134,7 @@ addi     ............     ..... 000 ..... 0010011 @i
>   slti     ............     ..... 010 ..... 0010011 @i
>   sltiu    ............     ..... 011 ..... 0010011 @i
>   xori     ............     ..... 100 ..... 0010011 @i
> +# cbo.prefetch_{i,r,m} instructions are ori with rd=x0 and not decoded.
>   ori      ............     ..... 110 ..... 0010011 @i
>   andi     ............     ..... 111 ..... 0010011 @i
>   slli     00000. ......    ..... 001 ..... 0010011 @sh


