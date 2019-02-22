Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gxKha-0005LM-G6
	for mharc-qemu-riscv@gnu.org; Fri, 22 Feb 2019 18:57:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52523)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gxKhY-0005LE-HK
	for qemu-riscv@nongnu.org; Fri, 22 Feb 2019 18:57:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gxKhU-00025Z-Ib
	for qemu-riscv@nongnu.org; Fri, 22 Feb 2019 18:57:54 -0500
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:43243)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gxKhR-00020e-VO
	for qemu-riscv@nongnu.org; Fri, 22 Feb 2019 18:57:51 -0500
Received: by mail-pl1-x643.google.com with SMTP id m10so1762284plt.10
	for <qemu-riscv@nongnu.org>; Fri, 22 Feb 2019 15:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=3CWyACuKZCBuyjjIQ+FLcKHPl8mUhG3XE8m+oi9Js80=;
	b=g04AiCd+DlcOFbjSmYtJSyhcOHe11YLThAR9Z6+mTm2oAwBiFhI8iaAzAABvODbisa
	6zhBgkjo3GGEdBG0SFgFyKJTROmNEI/qMMhp09/yxCwR84XvV6NyQpnK5gvf1aoX+dQv
	sXqg5glG1UT4fGL4Jn6/XwiIW4CIvzcFdaPeVhhuiTLx7P2I2SzI2GYQvFWC4L9y0Q9a
	1XfPBoqAGLEREim2Ke+0M0M1ShihP9u7i0ZEdIETtrZvMCEWaR5M/7zlOYG3EF/1LDM2
	wmIPJ8jOVHMzICHBq0SmEsF/D5tpOsCjlNEI606qZs8UcEAYceHTRq9KJ/rrwxwPhJtS
	a16A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=3CWyACuKZCBuyjjIQ+FLcKHPl8mUhG3XE8m+oi9Js80=;
	b=AmUjXJjq5lQwR8oNtFXg1d7ThBydkJU3+A4F3PnDucNq08E4vitkyBCJKd0Wi2ZCB9
	CH0lIczF7aFSh40YYVhrpPsLcXMIbb/GGUDncXpJwgDcp4R9bR0GKRsUsV+m8ma+G3qh
	r2x2sIyC6Ux8RPFoEx2fWkxJ1FapH15NW31aeJ2mZR+qBMwmlsr5vigQjn/DJU6GNqJt
	eQn0v4+gQJHKGWov2kI7Hm/c51OhZINVVVgGIldsw4aWHgxg1+gNBkDYk7jEHSoe13/S
	K4DgzSpI90+aakax6PkYpYJKSkkKShRgEriwGH9WL9W+NqTS8pq3RD/qOGqmJrxtXlkL
	/hIw==
X-Gm-Message-State: AHQUAubIfCmtS7lLExIYFPX5IyO7Csh32U61b+d8V1hAKVPO/kVRYuWT
	dE+zP9fH3JOkmSN2TLBmvi2Z6A==
X-Google-Smtp-Source: AHgI3IZRvrJHTSArXSTXmDwMZoPQMuL4k5+hG15x9FvlnXCat67Gkxd4TEv9+5Eh6TlU2Nqgd30ung==
X-Received: by 2002:a17:902:7e49:: with SMTP id
	a9mr6378059pln.303.1550879863193; 
	Fri, 22 Feb 2019 15:57:43 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	m17sm4340306pff.170.2019.02.22.15.57.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Feb 2019 15:57:42 -0800 (PST)
To: amagdy.afifi@gmail.com, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, sagark@eecs.berkeley.edu,
	kbastian@mail.uni-paderborn.de, palmer@sifive.com, mjc@sifive.com,
	Alistair.Francis@wdc.com
References: <20190222162555.13764-1-amagdy.afifi@gmail.com>
	<20190222162555.13764-2-amagdy.afifi@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <f782bdde-2a42-c612-5769-1cde42e7c2a4@linaro.org>
Date: Fri, 22 Feb 2019 15:57:40 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190222162555.13764-2-amagdy.afifi@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] riscv: Add proper alignment
 check and pending 'C' extension upon misa writes
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
X-List-Received-Date: Fri, 22 Feb 2019 23:57:57 -0000

On 2/22/19 8:25 AM, amagdy.afifi@gmail.com wrote:
> @@ -373,9 +373,10 @@ static int write_misa(CPURISCVState *env, int csrno, target_ulong val)
>      }
>  
>      /* Suppress 'C' if next instruction is not aligned
> -       TODO: this should check next_pc */
> -    if ((val & RVC) && (GETPC() & ~3) != 0) {
> +       check next target pc */
> +    if ((val & RVC) && (env->pc_next & 3) != 0) {
>          val &= ~RVC;
> +        env->pending_rvc = 1;
>      }
>  
>      /* misa.MXL writes are not supported by QEMU */
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 2321bba..c9d84ea 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -1999,20 +1999,26 @@ static void decode_RV32_64G(DisasContext *ctx)
>      }
>  }
>  
> -static void decode_opc(DisasContext *ctx)
> +static void decode_opc(DisasContext *ctx, CPUState *cpu)
>  {
> +    CPURISCVState *env = cpu->env_ptr;
>      /* check for compressed insn */
>      if (extract32(ctx->opcode, 0, 2) != 3) {
>          if (!has_ext(ctx, RVC)) {
>              gen_exception_illegal(ctx);
>          } else {
> -            ctx->pc_succ_insn = ctx->base.pc_next + 2;
> +            env->pc_next = ctx->pc_succ_insn = ctx->base.pc_next + 2;
>              decode_RV32_64C(ctx);
>          }
>      } else {
> -        ctx->pc_succ_insn = ctx->base.pc_next + 4;
> +        env->pc_next = ctx->pc_succ_insn = ctx->base.pc_next + 4;
>          decode_RV32_64G(ctx);
>      }
> +    /* check pending RVC */
> +    if (env->pending_rvc && ((env->pc_next & 3) != 0)) {
> +        env->misa |= RVC;
> +        env->pending_rvc = 0;

You cannot manipulate env like this during translation.

Neither the write to env->pc_next nor the read from env->pending_rvc here will
be in any synchronization with the execution of write_misa.

What semantics are you attempting to implement wrt setting/clearing RVC from MISA?

> @@ -2061,7 +2067,7 @@ static void riscv_tr_translate_insn
>      CPURISCVState *env = cpu->env_ptr;
>  
>      ctx->opcode = cpu_ldl_code(env, ctx->base.pc_next);
> -    decode_opc(ctx);
> +    decode_opc(ctx, cpu);

This is exactly the reason why cpu is *not* passed down to decode_opc, so that
you cannot make this kind of mistake.


r~

