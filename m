Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gMf1z-0004wW-QM
	for mharc-qemu-riscv@gnu.org; Tue, 13 Nov 2018 15:11:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55421)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gMf1y-0004bo-5X
	for qemu-riscv@nongnu.org; Tue, 13 Nov 2018 15:11:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gMexp-0006A6-TX
	for qemu-riscv@nongnu.org; Tue, 13 Nov 2018 15:07:10 -0500
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142]:37170)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gMexp-00069X-Kv; Tue, 13 Nov 2018 15:07:09 -0500
Received: by mail-lf1-x142.google.com with SMTP id p17so9807372lfh.4;
	Tue, 13 Nov 2018 12:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=oZ0/wKdDPGFAet71hOVx7O49Rw5dd6mH4vVErFBkNJA=;
	b=DS7Mwzh5EUCnsF+N2kvfKiiOmenewinFdPx6Z8SUCtGnJ6nb6TrhH5HIhHSMzDiWOr
	7zoWTk9o2lnR5+2lqtP6JBjoEgYE1yKSkAdlYt8Tl2iZ9eUGhrZYCBBQSrxRRCxyWJpP
	5oly0KdiXDO1T4WupniLPyn0Ugh2VYeBp3OC5BMf1tBos2/oe/+5t6xflBJ/dU2ibGfP
	fWOIYy68oLjhUMg3s4kOrlyOYqTCCi6zbFDggSuGOU1ZegFiNV0Re4dSQHwRTrhSUIV/
	VMdn8nRqpIj//Z24jR2gVzhsK7rKG6tOJrp54LhQg8ztT9bWZRCe+2xFyKeIGUEWvg5G
	RUeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=oZ0/wKdDPGFAet71hOVx7O49Rw5dd6mH4vVErFBkNJA=;
	b=ZDpQkuCpiSt8nqsFTxELvR82MwR065+qvpJrz97nIKpZ6lC7wicsl2bEgyCKKzsY71
	9SR3iOlFpzHevyxaJ4rJgsSlFb2deXERJ9Q+AkcAZdEHKeEFES5Mu4KMSt2oBbDXG4X0
	uQQ9+O39GUSgJ8Tn3EoadYeDOX33bxWCVP1ubpvgnRvIdTLxNmFUu4rQKrvpkiWOm65c
	zb29wKpQ+YyPao5+Q2TO3/NF/ANNUEWSpMUKlQtHh9F6nRm+yMXxH1Nch3tT824jp7Fl
	b6LY0pbJO4OZZnYScrQ4S6a8b+nZfTDrzkms3iFIelnEQ8io/to2+YkkGvUPgIwR8pM3
	wFLw==
X-Gm-Message-State: AGRZ1gKdwu2DXFAgg3jL7fqen4EtUCyU5F4D+lChmQpTqn0WLdV62McL
	pNn/q5j0B9nEIoT1z7EDFKkyh1/FVzZS49HQuYM=
X-Google-Smtp-Source: AJdET5fIcOW9/swwkbSrjCyhx/EXigSnQq5mLSr/VAGQeaAQ8l5kbBBOTxEC64xFs9rZAhhCKhjlVfkN8Zs48YD7OFo=
X-Received: by 2002:a19:2a9a:: with SMTP id q26mr3477169lfq.94.1542139627761; 
	Tue, 13 Nov 2018 12:07:07 -0800 (PST)
MIME-Version: 1.0
References: <20181108120628.29926-1-kbastian@mail.uni-paderborn.de>
	<20181108120628.29926-2-kbastian@mail.uni-paderborn.de>
In-Reply-To: <20181108120628.29926-2-kbastian@mail.uni-paderborn.de>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 13 Nov 2018 12:06:36 -0800
Message-ID: <CAKmqyKNewd1mk48KuSwe-5HjS8h9p0f_3Z_rmc05WX+_rP5BHw@mail.gmail.com>
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: Michael Clark <mjc@sifive.com>, Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@sifive.com>,
	Alistair Francis <Alistair.Francis@wdc.com>, qemu-riscv@nongnu.org, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::142
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH 1/2] target/riscv: Fix
 FCLASS_D being treated as RV64 only
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
X-List-Received-Date: Tue, 13 Nov 2018 20:11:27 -0000

On Thu, Nov 8, 2018 at 4:07 AM Bastian Koppelmann
<kbastian@mail.uni-paderborn.de> wrote:
>
> Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/translate.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 18d7b6d147..5359088e24 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -1237,13 +1237,14 @@ static void gen_fp_arith(DisasContext *ctx, uint32_t opc, int rd,
>          tcg_temp_free(t0);
>          break;
>
> -#if defined(TARGET_RISCV64)
>      case OPC_RISC_FMV_X_D:
>          /* also OPC_RISC_FCLASS_D */
>          switch (rm) {
> +#if defined(TARGET_RISCV64)
>          case 0: /* FMV */
>              gen_set_gpr(rd, cpu_fpr[rs1]);
>              break;
> +#endif
>          case 1:
>              t0 = tcg_temp_new();
>              gen_helper_fclass_d(t0, cpu_fpr[rs1]);
> @@ -1255,6 +1256,7 @@ static void gen_fp_arith(DisasContext *ctx, uint32_t opc, int rd,
>          }
>          break;
>
> +#if defined(TARGET_RISCV64)
>      case OPC_RISC_FMV_D_X:
>          t0 = tcg_temp_new();
>          gen_get_gpr(t0, rs1);
> --
> 2.19.1
>
>

