Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1plsXb-00010a-Nv
	for mharc-qemu-riscv@gnu.org; Mon, 10 Apr 2023 10:30:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1plsXO-0000xU-4K; Mon, 10 Apr 2023 10:30:31 -0400
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1plsXK-00044V-S1; Mon, 10 Apr 2023 10:30:29 -0400
Received: from [192.168.0.120] (unknown [180.175.29.170])
 by APP-05 (Coremail) with SMTP id zQCowAD35xR5HTRkKNOJEA--.65452S2;
 Mon, 10 Apr 2023 22:30:18 +0800 (CST)
Message-ID: <8077963d-2c08-35de-06c1-9cef9d361651@iscas.ac.cn>
Date: Mon, 10 Apr 2023 22:30:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Cc: liweiwei@iscas.ac.cn, Alistair Francis <alistair23@gmail.com>,
 Daniel Barboza <dbarboza@ventanamicro.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [RFC PATCH 3/4] target/riscv: check smstateen fcsr flag
Content-Language: en-US
To: Mayuresh Chitale <mchitale@ventanamicro.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, alistair.francis@wdc.com
References: <20230410141316.3317474-1-mchitale@ventanamicro.com>
 <20230410141316.3317474-4-mchitale@ventanamicro.com>
From: liweiwei <liweiwei@iscas.ac.cn>
In-Reply-To: <20230410141316.3317474-4-mchitale@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: zQCowAD35xR5HTRkKNOJEA--.65452S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWFyDZw1fCF1kXFy5ArWrXwb_yoW5Xr15p3
 95GF4YkrZ5Jr10ya13tF45Ar9xJw4fKws7Kwnrt3s5AayDKr45WFs3Kry7Kr9xXFykWryF
 ka1FvFy3CrWUX3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkl14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
 Y487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
 0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y
 0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
 W8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
 IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VU1a9aPUUUU
 U==
X-Originating-IP: [180.175.29.170]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.25; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -73
X-Spam_score: -7.4
X-Spam_bar: -------
X-Spam_report: (-7.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.246,
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
X-List-Received-Date: Mon, 10 Apr 2023 14:30:35 -0000


On 2023/4/10 22:13, Mayuresh Chitale wrote:
> If misa.F and smstateen_fcsr_ok flag are clear then all the floating
> point instructions must generate an appropriate exception.
>
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> ---
>   target/riscv/insn_trans/trans_rvf.c.inc   | 24 ++++++++++++++++++++---
>   target/riscv/insn_trans/trans_rvzfh.c.inc |  4 ++++
>   2 files changed, 25 insertions(+), 3 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvf.c.inc b/target/riscv/insn_trans/trans_rvf.c.inc
> index 052408f45c..6173dace46 100644
> --- a/target/riscv/insn_trans/trans_rvf.c.inc
> +++ b/target/riscv/insn_trans/trans_rvf.c.inc
> @@ -24,9 +24,27 @@
>               return false; \
>   } while (0)
>   
> -#define REQUIRE_ZFINX_OR_F(ctx) do {\
> -    if (!ctx->cfg_ptr->ext_zfinx) { \
> -        REQUIRE_EXT(ctx, RVF); \
> +#ifndef CONFIG_USER_ONLY
> +#define smstateen_fcsr_check(ctx) do { \
> +    if (!ctx->smstateen_fcsr_ok) { \
> +        if (ctx->virt_enabled) { \
> +            generate_exception(ctx, RISCV_EXCP_VIRT_INSTRUCTION_FAULT); \
> +        } else { \
> +            generate_exception(ctx, RISCV_EXCP_ILLEGAL_INST); \
> +        } \

We can setctx->virt_inst_excp = ctx->virt_enabledand return false here.

Or we need store current opcode to bins before generate_exception.

>   
> +        return true; \
> +    } \
> +} while (0)
> +#else
> +#define smstateen_fcsr_check(ctx)
> +#endif
> +
> +#define REQUIRE_ZFINX_OR_F(ctx) do { \
> +    if (!has_ext(ctx, RVF)) { \
> +        if (!ctx->cfg_ptr->ext_zfinx) { \
> +            return false; \
> +        } \
> +        smstateen_fcsr_check(ctx); \
>       } \
>   } while (0)
>   
> diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc b/target/riscv/insn_trans/trans_rvzfh.c.inc
> index 74dde37ff7..304bee1002 100644
> --- a/target/riscv/insn_trans/trans_rvzfh.c.inc
> +++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
> @@ -20,24 +20,28 @@
>       if (!ctx->cfg_ptr->ext_zfh) {      \
>           return false;         \
>       }                         \
> +    smstateen_fcsr_check(ctx); \
>   } while (0)
>   
>   #define REQUIRE_ZHINX_OR_ZFH(ctx) do { \
>       if (!ctx->cfg_ptr->ext_zhinx && !ctx->cfg_ptr->ext_zfh) { \
>           return false;                  \
>       }                                  \
> +    smstateen_fcsr_check(ctx); \

It's better to remain "\" alignment here.

Similar to following cases.

Regards,

Weiwei Li

>   } while (0)
>   
>   #define REQUIRE_ZFHMIN(ctx) do {              \
>       if (!ctx->cfg_ptr->ext_zfhmin) {          \
>           return false;                         \
>       }                                         \
> +    smstateen_fcsr_check(ctx); \
>   } while (0)
>   
>   #define REQUIRE_ZFHMIN_OR_ZHINXMIN(ctx) do {                 \
>       if (!(ctx->cfg_ptr->ext_zfhmin || ctx->cfg_ptr->ext_zhinxmin)) { \
>           return false;                                        \
>       }                                                        \
> +    smstateen_fcsr_check(ctx); \
>   } while (0)
>   
>   static bool trans_flh(DisasContext *ctx, arg_flh *a)


