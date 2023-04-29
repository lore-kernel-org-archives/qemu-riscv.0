Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1psZG7-0007tR-Ec
	for mharc-qemu-riscv@gnu.org; Fri, 28 Apr 2023 21:20:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1psZG6-0007t7-1f; Fri, 28 Apr 2023 21:20:18 -0400
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1psZG3-00014S-Cb; Fri, 28 Apr 2023 21:20:17 -0400
Received: from [192.168.0.120] (unknown [61.165.33.195])
 by APP-01 (Coremail) with SMTP id qwCowABnbHjIcExk5lGdDA--.9521S2;
 Sat, 29 Apr 2023 09:20:08 +0800 (CST)
Message-ID: <6f84421b-f17c-8397-6c06-6f6694c10ad7@iscas.ac.cn>
Date: Sat, 29 Apr 2023 09:20:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Cc: liweiwei@iscas.ac.cn, Alistair Francis <alistair23@gmail.com>,
 Daniel Barboza <dbarboza@ventanamicro.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 3/4] target/riscv: check smstateen fcsr flag
Content-Language: en-US
To: Mayuresh Chitale <mchitale@ventanamicro.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, alistair.francis@wdc.com
References: <20230428165212.2800669-1-mchitale@ventanamicro.com>
 <20230428165212.2800669-4-mchitale@ventanamicro.com>
From: Weiwei Li <liweiwei@iscas.ac.cn>
In-Reply-To: <20230428165212.2800669-4-mchitale@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: qwCowABnbHjIcExk5lGdDA--.9521S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJFy7Cw4DuF13GryDCry7trb_yoWrJw15p3
 4rGFW5ArWrXrWSya1ftFWrA3sIqa1fKw4vkwnxtw1DJa98Gr45Wrs5K3y7Kry7JF1kWryF
 ka1jvr13Cw48X3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvS14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
 4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
 Y487MxkIecxEwVAFwVWkMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI
 8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
 xVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI
 8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280
 aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43
 ZEXa7VU1ItC7UUUUU==
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
X-List-Received-Date: Sat, 29 Apr 2023 01:20:18 -0000


On 2023/4/29 00:52, Mayuresh Chitale wrote:
> If misa.F and smstateen_fcsr_ok flag are clear then all the floating
> point instructions must generate an appropriate exception.
>
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> ---
>   target/riscv/insn_trans/trans_rvd.c.inc   | 13 ++++++---
>   target/riscv/insn_trans/trans_rvf.c.inc   | 24 ++++++++++++++---
>   target/riscv/insn_trans/trans_rvzfh.c.inc | 32 +++++++++++++++--------
>   3 files changed, 50 insertions(+), 19 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvd.c.inc b/target/riscv/insn_trans/trans_rvd.c.inc
> index 2c51e01c40..d9e0cf116f 100644
> --- a/target/riscv/insn_trans/trans_rvd.c.inc
> +++ b/target/riscv/insn_trans/trans_rvd.c.inc
> @@ -18,10 +18,15 @@
>    * this program.  If not, see <http://www.gnu.org/licenses/>.
>    */
>   
> -#define REQUIRE_ZDINX_OR_D(ctx) do { \
> -    if (!ctx->cfg_ptr->ext_zdinx) { \
> -        REQUIRE_EXT(ctx, RVD); \
> -    } \
> +#define REQUIRE_ZDINX_OR_D(ctx) do {           \
> +    if (!has_ext(ctx, RVD)) {                  \
> +        if (!ctx->cfg_ptr->ext_zdinx) {        \
> +            return false;                      \
> +        }                                      \
> +        if (!smstateen_fcsr_check(ctx)) {      \
> +            return false;                      \
> +        }                                      \
> +    }                                          \
>   } while (0)
>   
>   #define REQUIRE_EVEN(ctx, reg) do { \
> diff --git a/target/riscv/insn_trans/trans_rvf.c.inc b/target/riscv/insn_trans/trans_rvf.c.inc
> index b2de4fcf3f..e4d9834237 100644
> --- a/target/riscv/insn_trans/trans_rvf.c.inc
> +++ b/target/riscv/insn_trans/trans_rvf.c.inc
> @@ -24,10 +24,26 @@
>               return false; \
>   } while (0)
>   
> -#define REQUIRE_ZFINX_OR_F(ctx) do {\
> -    if (!ctx->cfg_ptr->ext_zfinx) { \
> -        REQUIRE_EXT(ctx, RVF); \
> -    } \
> +static inline bool smstateen_fcsr_check(DisasContext *ctx)
> +{
> +#ifndef CONFIG_USER_ONLY
> +    if (!ctx->smstateen_fcsr_ok) {
> +        ctx->virt_inst_excp = ctx->virt_enabled;
> +        return false;
> +    }
> +#endif
> +    return true;
> +}
> +
> +#define REQUIRE_ZFINX_OR_F(ctx) do {           \
> +    if (!has_ext(ctx, RVF)) {                  \
> +        if (!ctx->cfg_ptr->ext_zfinx) {        \
> +            return false;                      \
> +        }                                      \
> +        if (!smstateen_fcsr_check(ctx)) {      \
> +            return false;                      \
> +        }                                      \
> +    }                                          \
>   } while (0)
>   
>   #define REQUIRE_ZCF(ctx) do {                  \
> diff --git a/target/riscv/insn_trans/trans_rvzfh.c.inc b/target/riscv/insn_trans/trans_rvzfh.c.inc
> index 74dde37ff7..e228ae28a5 100644
> --- a/target/riscv/insn_trans/trans_rvzfh.c.inc
> +++ b/target/riscv/insn_trans/trans_rvzfh.c.inc
> @@ -16,28 +16,38 @@
>    * this program.  If not, see <http://www.gnu.org/licenses/>.
>    */
>   
> -#define REQUIRE_ZFH(ctx) do { \
> +#define REQUIRE_ZFH(ctx) do {          \

This modification seems unnecessary.

Otherwise, Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Weiwei Li

>       if (!ctx->cfg_ptr->ext_zfh) {      \
> -        return false;         \
> -    }                         \
> -} while (0)
> -
> -#define REQUIRE_ZHINX_OR_ZFH(ctx) do { \
> -    if (!ctx->cfg_ptr->ext_zhinx && !ctx->cfg_ptr->ext_zfh) { \
>           return false;                  \
>       }                                  \
>   } while (0)
>   
> +#define REQUIRE_ZHINX_OR_ZFH(ctx) do {                \
> +    if (!ctx->cfg_ptr->ext_zfh) {                     \
> +        if (!ctx->cfg_ptr->ext_zhinx) {               \
> +            return false;                             \
> +        }                                             \
> +        if (!smstateen_fcsr_check(ctx)) {             \
> +            return false;                             \
> +        }                                             \
> +    }                                                 \
> +} while (0)
> +
>   #define REQUIRE_ZFHMIN(ctx) do {              \
>       if (!ctx->cfg_ptr->ext_zfhmin) {          \
>           return false;                         \
>       }                                         \
>   } while (0)
>   
> -#define REQUIRE_ZFHMIN_OR_ZHINXMIN(ctx) do {                 \
> -    if (!(ctx->cfg_ptr->ext_zfhmin || ctx->cfg_ptr->ext_zhinxmin)) { \
> -        return false;                                        \
> -    }                                                        \
> +#define REQUIRE_ZFHMIN_OR_ZHINXMIN(ctx) do {             \
> +    if (!ctx->cfg_ptr->ext_zfhmin) {                     \
> +        if (ctx->cfg_ptr->ext_zhinxmin) {                \
> +            return false;                                \
> +        }                                                \
> +        if (!smstateen_fcsr_check(ctx)) {                \
> +            return false;                                \
> +        }                                                \
> +    }                                                    \
>   } while (0)
>   
>   static bool trans_flh(DisasContext *ctx, arg_flh *a)


