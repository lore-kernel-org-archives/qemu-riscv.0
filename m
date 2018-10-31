Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gHwt4-0008RH-VY
	for mharc-qemu-riscv@gnu.org; Wed, 31 Oct 2018 16:14:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32831)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gHwt2-0008R1-5e
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 16:14:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gHwsy-0002As-08
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 16:14:42 -0400
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:46766)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gHwst-00029E-Co; Wed, 31 Oct 2018 16:14:37 -0400
Received: by mail-lf1-x143.google.com with SMTP id o2-v6so12618555lfl.13;
	Wed, 31 Oct 2018 13:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=q48GscA7G6pASbuVR94C+IBktegNoYK7yGYWSGf7cUw=;
	b=MPlIx2R6t66FK8EDylgzejpOBtTrfbRwxczKwWWxg3iZebGZxJiXwY8u4rIYakhiUQ
	tMCxAzTdF5YyVKkMS5Yx8a5pnpwJJQl4Eg9obBeNzP5ZwlXR4LC9F79pVJzGEYV+MBKW
	RfH/l6BqJrK/7B+BZFLXVr+kr+NeakLBhencn1ttzp+tbCrBA2iraqE/pVn0KADg1MSi
	+++XN1uWZceAZF2gteodqJbBzrpOmsNBjekcEIaAZGaiCyi5Rx9MbtImRul36F+rLtzF
	1EIuZoBydQw2BsWxQJEQte0a4HQSC+Z4l6J68yl7dik/mRiEywqtpBg7lFouVzwgR1EY
	wbog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=q48GscA7G6pASbuVR94C+IBktegNoYK7yGYWSGf7cUw=;
	b=n876WbaUQNpcOlSyxzDwQkM/kgoMCYXPOnUU4mWrtDt8MJk8e1bibexpkttiPab+e7
	nYWQ8aUaoan9zrmBn2pdhl+1GvjPz/AWNhy7St9sKruOuRcNjTPOYuC5fHGJ3d7wP9W4
	LszeOx4cdqo52YNOBJpmbFwXMP+kXMmkq8MekMsPbSJywnBj2BtZ96PHHkb/+PVfvYeY
	zEJy5ThadF9ITB8Y3Xw9hf/Wp/TqEBy3hFaTz9+cfcbI0DMwj71b8v3omy7EAYs9m6bX
	9z3nBQVVE2pnBrnM1npf/jk9VaIraUUjYl254NVcFjGysdeQ3SxaA8qRfPSYUWloXlCh
	dg7A==
X-Gm-Message-State: AGRZ1gLrHAtgCFabaE8HmKWREX5j138KFHdNyGDTxqmy3+yV4QoWw25q
	MRNZdwk8/hms/VekVDhq7i6hhmSGcNx56nxWm/Y=
X-Google-Smtp-Source: AJdET5cFTn25Hrl//+/mVd4Jc141l8S2/mmybEgPdQBa6pNPdx+M0FOqndYWTVrCnOhn74zlzc9FBtrfCbD/yfzvYvA=
X-Received: by 2002:a19:4e9a:: with SMTP id
	u26-v6mr2671254lfk.91.1541016869393; 
	Wed, 31 Oct 2018 13:14:29 -0700 (PDT)
MIME-Version: 1.0
References: <20181031132029.4887-1-kbastian@mail.uni-paderborn.de>
	<20181031132029.4887-2-kbastian@mail.uni-paderborn.de>
In-Reply-To: <20181031132029.4887-2-kbastian@mail.uni-paderborn.de>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 31 Oct 2018 13:14:02 -0700
Message-ID: <CAKmqyKMR6brWRrAXw_RwA2avCUp5rL6VmqOKWZPq5bA4xihWEA@mail.gmail.com>
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: Michael Clark <mjc@sifive.com>, Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@sifive.com>,
	Alistair Francis <Alistair.Francis@wdc.com>, qemu-riscv@nongnu.org, 
	peer.adelt@hni.uni-paderborn.de, 
	Richard Henderson <richard.henderson@linaro.org>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::143
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v3 01/35] target/riscv: Move
 CPURISCVState pointer to DisasContext
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
X-List-Received-Date: Wed, 31 Oct 2018 20:14:45 -0000

On Wed, Oct 31, 2018 at 6:27 AM Bastian Koppelmann
<kbastian@mail.uni-paderborn.de> wrote:
>
> CPURISCVState is rarely used, so there is no need to pass it to every
> translate function. This paves the way for decodetree which only passes
> DisasContext to translate functions.
>
> Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
> Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/translate.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 18d7b6d147..e81b9f097e 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -52,6 +52,7 @@ typedef struct DisasContext {
>         to any system register, which includes CSR_FRM, so we do not have
>         to reset this known value.  */
>      int frm;
> +    CPURISCVState *env;
>  } DisasContext;
>
>  /* convert riscv funct3 to qemu memop for load/store */
> @@ -1789,19 +1790,19 @@ static void decode_RV32_64G(CPURISCVState *env, DisasContext *ctx)
>      }
>  }
>
> -static void decode_opc(CPURISCVState *env, DisasContext *ctx)
> +static void decode_opc(DisasContext *ctx)
>  {
>      /* check for compressed insn */
>      if (extract32(ctx->opcode, 0, 2) != 3) {
> -        if (!riscv_has_ext(env, RVC)) {
> +        if (!riscv_has_ext(ctx->env, RVC)) {
>              gen_exception_illegal(ctx);
>          } else {
>              ctx->pc_succ_insn = ctx->base.pc_next + 2;
> -            decode_RV32_64C(env, ctx);
> +            decode_RV32_64C(ctx->env, ctx);
>          }
>      } else {
>          ctx->pc_succ_insn = ctx->base.pc_next + 4;
> -        decode_RV32_64G(env, ctx);
> +        decode_RV32_64G(ctx->env, ctx);
>      }
>  }
>
> @@ -1846,10 +1847,10 @@ static bool riscv_tr_breakpoint_check(DisasContextBase *dcbase, CPUState *cpu,
>  static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
>  {
>      DisasContext *ctx = container_of(dcbase, DisasContext, base);
> -    CPURISCVState *env = cpu->env_ptr;
> +    ctx->env = cpu->env_ptr;
>
> -    ctx->opcode = cpu_ldl_code(env, ctx->base.pc_next);
> -    decode_opc(env, ctx);
> +    ctx->opcode = cpu_ldl_code(ctx->env, ctx->base.pc_next);
> +    decode_opc(ctx);
>      ctx->base.pc_next = ctx->pc_succ_insn;
>
>      if (ctx->base.is_jmp == DISAS_NEXT) {
> --
> 2.19.1
>
>

