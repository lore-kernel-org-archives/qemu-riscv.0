Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nBs3w-00017f-9J
	for mharc-qemu-riscv@gnu.org; Mon, 24 Jan 2022 00:38:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1nBs3t-000174-Ng; Mon, 24 Jan 2022 00:38:41 -0500
Received: from out28-97.mail.aliyun.com ([115.124.28.97]:56828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1nBs3q-0006cI-H2; Mon, 24 Jan 2022 00:38:41 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436283|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.472491-0.000289957-0.527219;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047205; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=13; RT=13; SR=0; TI=SMTPD_---.MhSz3VA_1643002711; 
Received: from 10.0.2.15(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.MhSz3VA_1643002711)
 by smtp.aliyun-inc.com(10.147.44.145);
 Mon, 24 Jan 2022 13:38:31 +0800
Subject: Re: [PATCH 2/2] targett/riscv: rva: Correctly generate a store/amo
 fault
To: Alistair Francis <alistair.francis@opensource.wdc.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, alistair23@gmail.com,
 Bin Meng <bin.meng@windriver.com>, palmer@dabbelt.com,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, bmeng.cn@gmail.com
References: <20220124005958.38848-1-alistair.francis@opensource.wdc.com>
 <20220124005958.38848-3-alistair.francis@opensource.wdc.com>
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Message-ID: <6d67a43e-8675-480e-6245-8f27e2c91485@c-sky.com>
Date: Mon, 24 Jan 2022 13:38:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220124005958.38848-3-alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: none client-ip=115.124.28.97; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-97.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 24 Jan 2022 05:38:42 -0000


On 2022/1/24 上午8:59, Alistair Francis wrote:
> From: Alistair Francis <alistair.francis@wdc.com>
>
> If the atomic operation fails we want to generate a MMU_DATA_STORE
> access type so we can produce a RISCV_EXCP_STORE_AMO_ACCESS_FAULT for
> the guest.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/594
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>   target/riscv/insn_trans/trans_rva.c.inc | 56 ++++++++++++++++---------
>   1 file changed, 37 insertions(+), 19 deletions(-)
>
> diff --git a/target/riscv/insn_trans/trans_rva.c.inc b/target/riscv/insn_trans/trans_rva.c.inc
> index 45db82c9be..be5c94803b 100644
> --- a/target/riscv/insn_trans/trans_rva.c.inc
> +++ b/target/riscv/insn_trans/trans_rva.c.inc
> @@ -93,7 +93,7 @@ static bool gen_amo(DisasContext *ctx, arg_atomic *a,
>   static bool trans_lr_w(DisasContext *ctx, arg_lr_w *a)
>   {
>       REQUIRE_EXT(ctx, RVA);
> -    return gen_lr(ctx, a, (MO_ALIGN | MO_TESL));
> +    return gen_lr(ctx, a, (MO_ALIGN  | MO_TESL));

Typo.  This changes nothing.

Besides, I think we can add MO_WRITE_FAULT for SC in this patch or 
another patch.

Otherwise,

Reviewed-by: LIU Zhiwei<zhiwei_liu@c-sky.com>

Thanks,
Zhiwei

>   }
>   
>   static bool trans_sc_w(DisasContext *ctx, arg_sc_w *a)
> @@ -105,55 +105,64 @@ static bool trans_sc_w(DisasContext *ctx, arg_sc_w *a)
>   static bool trans_amoswap_w(DisasContext *ctx, arg_amoswap_w *a)
>   {
>       REQUIRE_EXT(ctx, RVA);
> -    return gen_amo(ctx, a, &tcg_gen_atomic_xchg_tl, (MO_ALIGN | MO_TESL));
> +    return gen_amo(ctx, a, &tcg_gen_atomic_xchg_tl,
> +                   (MO_ALIGN | MO_WRITE_FAULT | MO_TESL));
>   }
>   
>   static bool trans_amoadd_w(DisasContext *ctx, arg_amoadd_w *a)
>   {
>       REQUIRE_EXT(ctx, RVA);
> -    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_add_tl, (MO_ALIGN | MO_TESL));
> +    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_add_tl,
> +                   (MO_ALIGN | MO_WRITE_FAULT | MO_TESL));
>   }
>   
>   static bool trans_amoxor_w(DisasContext *ctx, arg_amoxor_w *a)
>   {
>       REQUIRE_EXT(ctx, RVA);
> -    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_xor_tl, (MO_ALIGN | MO_TESL));
> +    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_xor_tl,
> +                   (MO_ALIGN | MO_WRITE_FAULT | MO_TESL));
>   }
>   
>   static bool trans_amoand_w(DisasContext *ctx, arg_amoand_w *a)
>   {
>       REQUIRE_EXT(ctx, RVA);
> -    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_and_tl, (MO_ALIGN | MO_TESL));
> +    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_and_tl,
> +                   (MO_ALIGN | MO_WRITE_FAULT | MO_TESL));
>   }
>   
>   static bool trans_amoor_w(DisasContext *ctx, arg_amoor_w *a)
>   {
>       REQUIRE_EXT(ctx, RVA);
> -    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_or_tl, (MO_ALIGN | MO_TESL));
> +    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_or_tl,
> +                   (MO_ALIGN | MO_WRITE_FAULT | MO_TESL));
>   }
>   
>   static bool trans_amomin_w(DisasContext *ctx, arg_amomin_w *a)
>   {
>       REQUIRE_EXT(ctx, RVA);
> -    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_smin_tl, (MO_ALIGN | MO_TESL));
> +    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_smin_tl,
> +                   (MO_ALIGN | MO_WRITE_FAULT | MO_TESL));
>   }
>   
>   static bool trans_amomax_w(DisasContext *ctx, arg_amomax_w *a)
>   {
>       REQUIRE_EXT(ctx, RVA);
> -    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_smax_tl, (MO_ALIGN | MO_TESL));
> +    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_smax_tl,
> +                   (MO_ALIGN | MO_WRITE_FAULT | MO_TESL));
>   }
>   
>   static bool trans_amominu_w(DisasContext *ctx, arg_amominu_w *a)
>   {
>       REQUIRE_EXT(ctx, RVA);
> -    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_umin_tl, (MO_ALIGN | MO_TESL));
> +    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_umin_tl,
> +                   (MO_ALIGN | MO_WRITE_FAULT | MO_TESL));
>   }
>   
>   static bool trans_amomaxu_w(DisasContext *ctx, arg_amomaxu_w *a)
>   {
>       REQUIRE_EXT(ctx, RVA);
> -    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_umax_tl, (MO_ALIGN | MO_TESL));
> +    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_umax_tl,
> +                   (MO_ALIGN | MO_WRITE_FAULT | MO_TESL));
>   }
>   
>   static bool trans_lr_d(DisasContext *ctx, arg_lr_d *a)
> @@ -171,53 +180,62 @@ static bool trans_sc_d(DisasContext *ctx, arg_sc_d *a)
>   static bool trans_amoswap_d(DisasContext *ctx, arg_amoswap_d *a)
>   {
>       REQUIRE_64BIT(ctx);
> -    return gen_amo(ctx, a, &tcg_gen_atomic_xchg_tl, (MO_ALIGN | MO_TEUQ));
> +    return gen_amo(ctx, a, &tcg_gen_atomic_xchg_tl,
> +                   (MO_ALIGN | MO_WRITE_FAULT | MO_TEUQ));
>   }
>   
>   static bool trans_amoadd_d(DisasContext *ctx, arg_amoadd_d *a)
>   {
>       REQUIRE_64BIT(ctx);
> -    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_add_tl, (MO_ALIGN | MO_TEUQ));
> +    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_add_tl,
> +                   (MO_ALIGN | MO_WRITE_FAULT | MO_TEUQ));
>   }
>   
>   static bool trans_amoxor_d(DisasContext *ctx, arg_amoxor_d *a)
>   {
>       REQUIRE_64BIT(ctx);
> -    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_xor_tl, (MO_ALIGN | MO_TEUQ));
> +    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_xor_tl,
> +                   (MO_ALIGN | MO_WRITE_FAULT | MO_TEUQ));
>   }
>   
>   static bool trans_amoand_d(DisasContext *ctx, arg_amoand_d *a)
>   {
>       REQUIRE_64BIT(ctx);
> -    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_and_tl, (MO_ALIGN | MO_TEUQ));
> +    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_and_tl,
> +                   (MO_ALIGN | MO_WRITE_FAULT | MO_TEUQ));
>   }
>   
>   static bool trans_amoor_d(DisasContext *ctx, arg_amoor_d *a)
>   {
>       REQUIRE_64BIT(ctx);
> -    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_or_tl, (MO_ALIGN | MO_TEUQ));
> +    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_or_tl,
> +                   (MO_ALIGN | MO_WRITE_FAULT | MO_TEUQ));
>   }
>   
>   static bool trans_amomin_d(DisasContext *ctx, arg_amomin_d *a)
>   {
>       REQUIRE_64BIT(ctx);
> -    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_smin_tl, (MO_ALIGN | MO_TEUQ));
> +    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_smin_tl,
> +                   (MO_ALIGN | MO_WRITE_FAULT | MO_TEUQ));
>   }
>   
>   static bool trans_amomax_d(DisasContext *ctx, arg_amomax_d *a)
>   {
>       REQUIRE_64BIT(ctx);
> -    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_smax_tl, (MO_ALIGN | MO_TEUQ));
> +    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_smax_tl,
> +                   (MO_ALIGN | MO_WRITE_FAULT | MO_TEUQ));
>   }
>   
>   static bool trans_amominu_d(DisasContext *ctx, arg_amominu_d *a)
>   {
>       REQUIRE_64BIT(ctx);
> -    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_umin_tl, (MO_ALIGN | MO_TEUQ));
> +    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_umin_tl,
> +                   (MO_ALIGN | MO_WRITE_FAULT | MO_TEUQ));
>   }
>   
>   static bool trans_amomaxu_d(DisasContext *ctx, arg_amomaxu_d *a)
>   {
>       REQUIRE_64BIT(ctx);
> -    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_umax_tl, (MO_ALIGN | MO_TEUQ));
> +    return gen_amo(ctx, a, &tcg_gen_atomic_fetch_umax_tl,
> +                   (MO_ALIGN | MO_WRITE_FAULT | MO_TEUQ));
>   }

