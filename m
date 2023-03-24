Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pfhk3-0002L8-Rn
	for mharc-qemu-riscv@gnu.org; Fri, 24 Mar 2023 09:46:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pfhk2-0002Ko-Mc; Fri, 24 Mar 2023 09:46:02 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pfhjr-0004kZ-OX; Fri, 24 Mar 2023 09:46:02 -0400
Received: from [192.168.0.120] (unknown [180.165.240.150])
 by APP-05 (Coremail) with SMTP id zQCowADHzzN4qR1k+e0dCQ--.52822S2;
 Fri, 24 Mar 2023 21:45:29 +0800 (CST)
Message-ID: <b3c51b9c-fdd2-7e28-b9c6-2651e758eb87@iscas.ac.cn>
Date: Fri, 24 Mar 2023 21:45:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Cc: liweiwei@iscas.ac.cn, Alistair.Francis@wdc.com, palmer@dabbelt.com,
 bin.meng@windriver.com, dbarboza@ventanamicro.com, qemu-riscv@nongnu.org
Subject: Re: [PATCH] target/riscv: Fix itrigger when icount is used
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
References: <20230324064011.976-1-zhiwei_liu@linux.alibaba.com>
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230324064011.976-1-zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: zQCowADHzzN4qR1k+e0dCQ--.52822S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZrWDXFW5AF13Kw1kKr1DAwb_yoW8Xw1xpw
 4FkayYk3yrK348Cas8Gw48Zr1UZa15Kr17XrnYqwn8ZFsxZr4q9F48Kw1akr4DJFW0vrs0
 ya1jy3s8Ca1FkFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
 Y487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
 0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y
 0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
 W8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1l
 IxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUZa9-UUU
 UU=
X-Originating-IP: [180.165.240.150]
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
X-List-Received-Date: Fri, 24 Mar 2023 13:46:03 -0000


On 2023/3/24 14:40, LIU Zhiwei wrote:
> When I boot a ubuntu image, QEMU output a "Bad icount read" message and exit.
> The reason is that when execute helper_mret or helper_sret, it will
> cause a call to icount_get_raw_locked (), which needs set can_do_io flag
> on cpustate.
>
> Thus we setting this flag when execute these two instructions.
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> ---

LGTM.

Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Weiwei L

>   target/riscv/insn_trans/trans_privileged.c.inc | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/target/riscv/insn_trans/trans_privileged.c.inc b/target/riscv/insn_trans/trans_privileged.c.inc
> index 59501b2780..e3bee971c6 100644
> --- a/target/riscv/insn_trans/trans_privileged.c.inc
> +++ b/target/riscv/insn_trans/trans_privileged.c.inc
> @@ -77,6 +77,9 @@ static bool trans_sret(DisasContext *ctx, arg_sret *a)
>   #ifndef CONFIG_USER_ONLY
>       if (has_ext(ctx, RVS)) {
>           decode_save_opc(ctx);
> +        if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +            gen_io_start();
> +        }
>           gen_helper_sret(cpu_pc, cpu_env);
>           exit_tb(ctx); /* no chaining */
>           ctx->base.is_jmp = DISAS_NORETURN;
> @@ -93,6 +96,9 @@ static bool trans_mret(DisasContext *ctx, arg_mret *a)
>   {
>   #ifndef CONFIG_USER_ONLY
>       decode_save_opc(ctx);
> +    if (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT) {
> +        gen_io_start();
> +    }
>       gen_helper_mret(cpu_pc, cpu_env);
>       exit_tb(ctx); /* no chaining */
>       ctx->base.is_jmp = DISAS_NORETURN;


