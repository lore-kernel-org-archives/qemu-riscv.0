Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gHx87-0002lU-5r
	for mharc-qemu-riscv@gnu.org; Wed, 31 Oct 2018 16:30:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36900)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gHx84-0002jF-Mf
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 16:30:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gHx82-0002HN-LU
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 16:30:16 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:36051)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gHx7u-000292-Qc; Wed, 31 Oct 2018 16:30:07 -0400
Received: by mail-pl1-x644.google.com with SMTP id y11-v6so7837542plt.3;
	Wed, 31 Oct 2018 13:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=4xH24X3vTPu3fMXIDPzSdlxuswcJIVgdBS6JU/qMb9U=;
	b=YDzyZ3oBkZaUeYoReBUIZAKru1gIzTjsSXoBvR/BF8Li6Od+Kggl1oK70fkeePgUYZ
	QljUx+0FQg3STvbDYIU5zn+wkWHgTYIDp7ad/+xpU8V4R2dH2Rl/5vXWbtOpKYVorAM+
	pnxzWDKqY396d0U3kxe746pIu9i9rIjH15Q0U20ZLe5gFYodNgV3//CqZICW7Wk3no86
	edmTbb49Zr3oPZDnopJhv3UOLAJwvhr5nc+RSz+eAuybEtNkXhkdwDX/bj8KJoD2+Vtv
	71wd8+ZOYiUlUE4RfRnD6YvCG2DiyaCwYG1w65i8ksPcozpcfo7uPduDxLHXujL32R1w
	S59A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=4xH24X3vTPu3fMXIDPzSdlxuswcJIVgdBS6JU/qMb9U=;
	b=CSaxz+EygV49pS/S957h8KFs3bWScIWJjXWbLRKTKauuh/yhFBFgbEirWiWzNdJ6QK
	tm/kewZQ+9qs66CoPBnStq/Ygm8N4Pd0Kumi83AYj96GxEl7FYeL2jlGdQm9H83CmvHN
	Yqx07a0O3YwB6iPPhOZbjN6+e2rki+Y+ErZpxPUSgoRUJ+/jjyro9XdsUfj8yaEoA40h
	uxGLQgmZQasBtCmh+8ouBdIhvFBkoOb5C+si5xKy6KUwePZ8qxUMvDCYjJ0fOmHbsNiz
	Pe3welhltn1crqkTIHWbWmAUZrcqEN5lXsnDafgkdsabP/fjzQPJt+HyLdAeq8hTkt/d
	z07w==
X-Gm-Message-State: AGRZ1gK0DVzItMCLse2iSbPoxCJl/NVVuL4wnoh3oo/uJ3y8aEbDnRX6
	cqWojEsAKOyR/SaeM4WfCm/9xwip
X-Google-Smtp-Source: AJdET5cxoWa3C9NvLJ0q0/DlexreC6+tICZ97geBnxUxf23N4srvdCKAdvumGlimad9tdbVaW2DZyQ==
X-Received: by 2002:a17:902:8c84:: with SMTP id
	t4-v6mr4960636plo.188.1541017805358; 
	Wed, 31 Oct 2018 13:30:05 -0700 (PDT)
Received: from [10.196.159.185] (rap-us.hgst.com. [199.255.44.250])
	by smtp.gmail.com with ESMTPSA id
	f6-v6sm10650160pfg.128.2018.10.31.13.30.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 31 Oct 2018 13:30:04 -0700 (PDT)
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, mjc@sifive.com,
	sagark@eecs.berkeley.edu, palmer@sifive.com, Alistair.Francis@wdc.com
Cc: qemu-riscv@nongnu.org, peer.adelt@hni.uni-paderborn.de,
	richard.henderson@linaro.org, qemu-devel@nongnu.org
References: <20181031132029.4887-1-kbastian@mail.uni-paderborn.de>
	<20181031132029.4887-8-kbastian@mail.uni-paderborn.de>
From: Alistair <alistair23@gmail.com>
Message-ID: <94f933ad-2cba-c18b-bac1-15349df446cd@gmail.com>
Date: Wed, 31 Oct 2018 13:30:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181031132029.4887-8-kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v3 07/35] target/riscv:
 Convert RVXI fence insns to decodetree
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 31 Oct 2018 20:30:17 -0000

On 10/31/18 6:20 AM, Bastian Koppelmann wrote:
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> Signed-off-by: Peer Adelt <peer.adelt@hni.uni-paderborn.de>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> v2 -> v3:
>      - removed %pred/%succ
>      - dropped insn argument of trans_foo functions
> 
>   target/riscv/insn32.decode              |  2 ++
>   target/riscv/insn_trans/trans_rvi.inc.c | 21 +++++++++++++++++++++
>   target/riscv/translate.c                | 14 --------------
>   3 files changed, 23 insertions(+), 14 deletions(-)
> 
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 4fd88f48d2..6d750b4c5a 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -82,3 +82,5 @@ srl      0000000 .....    ..... 101 ..... 0110011 @r
>   sra      0100000 .....    ..... 101 ..... 0110011 @r
>   or       0000000 .....    ..... 110 ..... 0110011 @r
>   and      0000000 .....    ..... 111 ..... 0110011 @r
> +fence    ---- pred:4 succ:4 ----- 000 ----- 0001111
> +fence_i  ---- ----   ----   ----- 001 ----- 0001111
> diff --git a/target/riscv/insn_trans/trans_rvi.inc.c b/target/riscv/insn_trans/trans_rvi.inc.c
> index 01f751650a..a149e913b1 100644
> --- a/target/riscv/insn_trans/trans_rvi.inc.c
> +++ b/target/riscv/insn_trans/trans_rvi.inc.c
> @@ -318,3 +318,24 @@ static bool trans_sraw(DisasContext *ctx, arg_sraw *a)
>       return true;
>   }
>   #endif
> +
> +static bool trans_fence(DisasContext *ctx, arg_fence *a)
> +{
> +#ifndef CONFIG_USER_ONLY
> +    /* FENCE is a full memory barrier. */
> +    tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
> +#endif
> +    return true;
> +}
> +
> +static bool trans_fence_i(DisasContext *ctx, arg_fence_i *a)
> +{
> +#ifndef CONFIG_USER_ONLY
> +    /* FENCE_I is a no-op in QEMU,
> +     * however we need to end the translation block */
> +    tcg_gen_movi_tl(cpu_pc, ctx->pc_succ_insn);
> +    tcg_gen_exit_tb(NULL, 0);
> +    ctx->base.is_jmp = DISAS_NORETURN;
> +#endif
> +    return true;
> +}
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 855c241e97..80f18fb6aa 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -1740,20 +1740,6 @@ static void decode_RV32_64G(CPURISCVState *env, DisasContext *ctx)
>           gen_fp_arith(ctx, MASK_OP_FP_ARITH(ctx->opcode), rd, rs1, rs2,
>                        GET_RM(ctx->opcode));
>           break;
> -    case OPC_RISC_FENCE:
> -#ifndef CONFIG_USER_ONLY
> -        if (ctx->opcode & 0x1000) {
> -            /* FENCE_I is a no-op in QEMU,
> -             * however we need to end the translation block */
> -            tcg_gen_movi_tl(cpu_pc, ctx->pc_succ_insn);
> -            tcg_gen_exit_tb(NULL, 0);
> -            ctx->base.is_jmp = DISAS_NORETURN;
> -        } else {
> -            /* FENCE is a full memory barrier. */
> -            tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
> -        }
> -#endif
> -        break;
>       case OPC_RISC_SYSTEM:
>           gen_system(env, ctx, MASK_OP_SYSTEM(ctx->opcode), rd, rs1,
>                      (ctx->opcode & 0xFFF00000) >> 20);
> 

