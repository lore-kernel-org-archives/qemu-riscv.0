Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nCewv-0001zj-3U
	for mharc-qemu-riscv@gnu.org; Wed, 26 Jan 2022 04:50:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nCewf-0001xp-Tx; Wed, 26 Jan 2022 04:50:31 -0500
Received: from smtp25.cstnet.cn ([159.226.251.25]:60640 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1nCewa-0004PO-0c; Wed, 26 Jan 2022 04:50:28 -0500
Received: from [192.168.0.104] (unknown [180.156.147.178])
 by APP-05 (Coremail) with SMTP id zQCowAC3mfJTGfFhUiEBAA--.335S2;
 Wed, 26 Jan 2022 17:50:12 +0800 (CST)
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
From: Weiwei Li <liweiwei@iscas.ac.cn>
Message-ID: <5d78b5a3-f9c5-cebb-2e2e-e637ccf14755@iscas.ac.cn>
Date: Wed, 26 Jan 2022 17:50:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220124005958.38848-3-alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID: zQCowAC3mfJTGfFhUiEBAA--.335S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Aw18Xr1rAr1rXr18tF4Utwb_yoWxCFW3pa
 1xCr4xZFn8tryagFykGF4Y9wn8ZF1Syr4DJw13Xwn5Ca1fGF45Gr1UGw4a9r1Uuw1kW3y5
 WF1UCa1Ik3W2y37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUB214x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
 0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
 jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
 1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY
 04v7Mxk0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAKzI0EY4vE52x082I5MxAIw28IcxkI7V
 AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
 r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6x
 IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAI
 w20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
 kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU8VbyDUUUU
X-Originating-IP: [180.156.147.178]
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
X-List-Received-Date: Wed, 26 Jan 2022 09:50:32 -0000

It seems that target is miswritten to "targett"  in commit message.

Regards,

Weiwei Li

在 2022/1/24 上午8:59, Alistair Francis 写道:
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


