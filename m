Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1matiq-0003Ih-Sg
	for mharc-qemu-riscv@gnu.org; Thu, 14 Oct 2021 01:56:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1matil-0003FA-2y; Thu, 14 Oct 2021 01:56:04 -0400
Received: from out28-2.mail.aliyun.com ([115.124.28.2]:55478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1matii-0007fO-JW; Thu, 14 Oct 2021 01:56:02 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1055969|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.612902-0.000189583-0.386908;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047206; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.LZCKyMS_1634190951; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.LZCKyMS_1634190951)
 by smtp.aliyun-inc.com(10.147.41.137);
 Thu, 14 Oct 2021 13:55:51 +0800
Subject: Re: [PATCH v2 07/13] target/riscv: Properly check SEW in amo_op
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 frederic.petrot@univ-grenoble-alpes.fr, fabien.portas@grenoble-inp.org
References: <20211013205104.1031679-1-richard.henderson@linaro.org>
 <20211013205104.1031679-8-richard.henderson@linaro.org>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <ba826b90-1f8a-20b3-45f9-b497d3b6dbef@c-sky.com>
Date: Thu, 14 Oct 2021 13:55:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211013205104.1031679-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.2; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-2.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Thu, 14 Oct 2021 05:56:06 -0000


On 2021/10/14 上午4:50, Richard Henderson wrote:
> We're currently assuming SEW <= 3, and the "else" from
> the SEW == 3 must be less.  Use a switch and explicitly
> bound both SEW and SEQ for all cases.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: LIU Zhiwei<zhiwei_liu@c-sky.com>

Zhiwei
> ---
>   target/riscv/insn_trans/trans_rvv.c.inc | 26 +++++++++++++------------
>   1 file changed, 14 insertions(+), 12 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
> index bbc5c93ef1..91fca4a2d1 100644
> --- a/target/riscv/insn_trans/trans_rvv.c.inc
> +++ b/target/riscv/insn_trans/trans_rvv.c.inc
> @@ -704,18 +704,20 @@ static bool amo_op(DisasContext *s, arg_rwdvm *a, uint8_t seq)
>           gen_helper_exit_atomic(cpu_env);
>           s->base.is_jmp = DISAS_NORETURN;
>           return true;
> -    } else {
> -        if (s->sew == 3) {
> -            if (!is_32bit(s)) {
> -                fn = fnsd[seq];
> -            } else {
> -                /* Check done in amo_check(). */
> -                g_assert_not_reached();
> -            }
> -        } else {
> -            assert(seq < ARRAY_SIZE(fnsw));
> -            fn = fnsw[seq];
> -        }
> +    }
> +
> +    switch (s->sew) {
> +    case 0 ... 2:
> +        assert(seq < ARRAY_SIZE(fnsw));
> +        fn = fnsw[seq];
> +        break;
> +    case 3:
> +        /* XLEN check done in amo_check(). */
> +        assert(seq < ARRAY_SIZE(fnsd));
> +        fn = fnsd[seq];
> +        break;
> +    default:
> +        g_assert_not_reached();
>       }
>   
>       data = FIELD_DP32(data, VDATA, MLEN, s->mlen);

