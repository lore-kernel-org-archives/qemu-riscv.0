Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mathW-0001xs-BH
	for mharc-qemu-riscv@gnu.org; Thu, 14 Oct 2021 01:54:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mathU-0001xM-1P; Thu, 14 Oct 2021 01:54:44 -0400
Received: from out28-171.mail.aliyun.com ([115.124.28.171]:43767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mathR-00055f-9M; Thu, 14 Oct 2021 01:54:43 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.2205171|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.00507848-0.000257926-0.994664;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047188; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.LZC6sKN_1634190872; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.LZC6sKN_1634190872)
 by smtp.aliyun-inc.com(10.147.42.241);
 Thu, 14 Oct 2021 13:54:32 +0800
Subject: Re: [PATCH v2 06/13] target/riscv: Use REQUIRE_64BIT in amo_check64
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 frederic.petrot@univ-grenoble-alpes.fr, fabien.portas@grenoble-inp.org
References: <20211013205104.1031679-1-richard.henderson@linaro.org>
 <20211013205104.1031679-7-richard.henderson@linaro.org>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <18cb1652-9e01-7fea-29c3-e8429dc5885d@c-sky.com>
Date: Thu, 14 Oct 2021 13:54:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211013205104.1031679-7-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.171; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-171.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 14 Oct 2021 05:54:44 -0000


On 2021/10/14 上午4:50, Richard Henderson wrote:
> Use the same REQUIRE_64BIT check that we use elsewhere,
> rather than open-coding the use of is_32bit.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: LIU Zhiwei<zhiwei_liu@c-sky.com>

Zhiwei
> ---
>   target/riscv/insn_trans/trans_rvv.c.inc | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index fa451938f1..bbc5c93ef1 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -743,7 +743,8 @@ static bool amo_check(DisasContext *s, arg_rwdvm* a)
>   
>   static bool amo_check64(DisasContext *s, arg_rwdvm* a)
>   {
> -    return !is_32bit(s) && amo_check(s, a);
> +    REQUIRE_64BIT(s);
> +    return amo_check(s, a);
>   }
>   
>   GEN_VEXT_TRANS(vamoswapw_v, 0, rwdvm, amo_op, amo_check)

