Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1maw4e-0003EG-TS
	for mharc-qemu-riscv@gnu.org; Thu, 14 Oct 2021 04:26:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1maw4d-0003AD-En; Thu, 14 Oct 2021 04:26:47 -0400
Received: from out28-99.mail.aliyun.com ([115.124.28.99]:45464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1maw4b-0001pG-0p; Thu, 14 Oct 2021 04:26:47 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07479754|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_alarm|0.184722-0.000265436-0.815012;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047211; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.LZKkrRI_1634199997; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.LZKkrRI_1634199997)
 by smtp.aliyun-inc.com(10.147.41.158);
 Thu, 14 Oct 2021 16:26:38 +0800
Subject: Re: [PATCH v2 08/13] target/riscv: Replace is_32bit with
 get_xl/get_xlen
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 frederic.petrot@univ-grenoble-alpes.fr, fabien.portas@grenoble-inp.org
References: <20211013205104.1031679-1-richard.henderson@linaro.org>
 <20211013205104.1031679-9-richard.henderson@linaro.org>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <b68b383d-c2e2-69eb-9951-d3c468184335@c-sky.com>
Date: Thu, 14 Oct 2021 16:26:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211013205104.1031679-9-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.99; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-99.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Oct 2021 08:26:47 -0000


On 2021/10/14 上午4:50, Richard Henderson wrote:
> In preparation for RV128, replace a simple predicate
> with a more versatile test.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: LIU Zhiwei<zhiwei_liu@c-sky.com>

Zhiwei
> ---
>   target/riscv/translate.c | 32 +++++++++++++++++---------------
>   1 file changed, 17 insertions(+), 15 deletions(-)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 7e7bb67d15..5724a62bb0 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -91,16 +91,18 @@ static inline bool has_ext(DisasContext *ctx, uint32_t ext)
>   }
>   
>   #ifdef TARGET_RISCV32
> -# define is_32bit(ctx)  true
> +#define get_xl(ctx)    MXL_RV32
>   #elif defined(CONFIG_USER_ONLY)
> -# define is_32bit(ctx)  false
> +#define get_xl(ctx)    MXL_RV64
>   #else
> -static inline bool is_32bit(DisasContext *ctx)
> -{
> -    return ctx->xl == MXL_RV32;
> -}
> +#define get_xl(ctx)    ((ctx)->xl)
>   #endif
>   
> +static inline int get_xlen(DisasContext *ctx)
> +{
> +    return 16 << get_xl(ctx);
> +}
> +
>   /* The word size for this operation. */
>   static inline int oper_len(DisasContext *ctx)
>   {
> @@ -282,7 +284,7 @@ static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
>   static void mark_fs_dirty(DisasContext *ctx)
>   {
>       TCGv tmp;
> -    target_ulong sd = is_32bit(ctx) ? MSTATUS32_SD : MSTATUS64_SD;
> +    target_ulong sd = get_xl(ctx) == MXL_RV32 ? MSTATUS32_SD : MSTATUS64_SD;
>   
>       if (ctx->mstatus_fs != MSTATUS_FS) {
>           /* Remember the state change for the rest of the TB. */
> @@ -341,16 +343,16 @@ EX_SH(12)
>       }                              \
>   } while (0)
>   
> -#define REQUIRE_32BIT(ctx) do { \
> -    if (!is_32bit(ctx)) {       \
> -        return false;           \
> -    }                           \
> +#define REQUIRE_32BIT(ctx) do {    \
> +    if (get_xl(ctx) != MXL_RV32) { \
> +        return false;              \
> +    }                              \
>   } while (0)
>   
> -#define REQUIRE_64BIT(ctx) do { \
> -    if (is_32bit(ctx)) {        \
> -        return false;           \
> -    }                           \
> +#define REQUIRE_64BIT(ctx) do {    \
> +    if (get_xl(ctx) < MXL_RV64) {  \
> +        return false;              \
> +    }                              \
>   } while (0)
>   
>   static int ex_rvc_register(DisasContext *ctx, int reg)

