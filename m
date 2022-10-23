Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1omZee-0005Vw-8Y
	for mharc-qemu-riscv@gnu.org; Sun, 23 Oct 2022 08:00:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1omZec-0005VX-4G; Sun, 23 Oct 2022 08:00:34 -0400
Received: from out30-45.freemail.mail.aliyun.com ([115.124.30.45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@linux.alibaba.com>)
 id 1omZeZ-0004ew-FP; Sun, 23 Oct 2022 08:00:33 -0400
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R701e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046049;
 MF=zhiwei_liu@linux.alibaba.com; NM=1; PH=DS; RN=5; SR=0;
 TI=SMTPD_---0VSpUFc1_1666526418; 
Received: from 30.0.183.221(mailfrom:zhiwei_liu@linux.alibaba.com
 fp:SMTPD_---0VSpUFc1_1666526418) by smtp.aliyun-inc.com;
 Sun, 23 Oct 2022 20:00:19 +0800
Message-ID: <c8185d29-c451-e9c0-9545-b18423c6714d@linux.alibaba.com>
Date: Sun, 23 Oct 2022 20:00:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH] tcg/riscv: Fix range matched by TCG_CT_CONST_M12
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Alistair.Francis@wdc.com, qemu-riscv@nongnu.org, palmer@dabbelt.com
References: <20221022095821.2441874-1-richard.henderson@linaro.org>
Content-Language: en-US
From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20221022095821.2441874-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.124.30.45;
 envelope-from=zhiwei_liu@linux.alibaba.com;
 helo=out30-45.freemail.mail.aliyun.com
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sun, 23 Oct 2022 12:00:34 -0000


On 2022/10/22 17:58, Richard Henderson wrote:
> We were matching a signed 13-bit range, not a 12-bit range.
> Expand the commentary within the function and be explicit
> about all of the ranges.
>
> Reported-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> ---
>   tcg/riscv/tcg-target.c.inc | 19 ++++++++++++++++---
>   1 file changed, 16 insertions(+), 3 deletions(-)
>
> diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
> index 1cdaf7b57b..2a84c57bec 100644
> --- a/tcg/riscv/tcg-target.c.inc
> +++ b/tcg/riscv/tcg-target.c.inc
> @@ -154,13 +154,26 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
>       if ((ct & TCG_CT_CONST_ZERO) && val == 0) {
>           return 1;
>       }
> -    if ((ct & TCG_CT_CONST_S12) && val == sextreg(val, 0, 12)) {
> +    /*
> +     * Sign extended from 12 bits: [-0x800, 0x7ff].
> +     * Used for most arithmetic, as this is the isa field.
> +     */
> +    if ((ct & TCG_CT_CONST_S12) && val >= -0x800 && val <= 0x7ff) {
>           return 1;
>       }
> -    if ((ct & TCG_CT_CONST_N12) && -val == sextreg(-val, 0, 12)) {
> +    /*
> +     * Sign extended from 12 bits, negated: [-0x7ff, 0x800].
> +     * Used for subtraction, where a constant must be handled by ADDI.
> +     */
> +    if ((ct & TCG_CT_CONST_N12) && val >= -0x7ff && val <= 0x800) {
>           return 1;
>       }
> -    if ((ct & TCG_CT_CONST_M12) && val >= -0xfff && val <= 0xfff) {
> +    /*
> +     * Sign extended from 12 bits, +/- matching: [-0x7ff, 0x7ff].
> +     * Used by addsub2, which may need the negative operation,
> +     * and requires the modified constant to be representable.
> +     */
> +    if ((ct & TCG_CT_CONST_M12) && val >= -0x7ff && val <= 0x7ff) {
>           return 1;
>       }
>       return 0;

