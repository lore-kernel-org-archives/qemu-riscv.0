Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gLEzh-0004ky-9R
	for mharc-qemu-riscv@gnu.org; Fri, 09 Nov 2018 17:11:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44261)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gLEzd-0004d8-3M
	for qemu-riscv@nongnu.org; Fri, 09 Nov 2018 17:11:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gLEra-0003GI-Qj
	for qemu-riscv@nongnu.org; Fri, 09 Nov 2018 17:02:51 -0500
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141]:38504)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gLEra-0003AP-Hg; Fri, 09 Nov 2018 17:02:50 -0500
Received: by mail-lf1-x141.google.com with SMTP id p86so2410787lfg.5;
	Fri, 09 Nov 2018 14:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=/fMCwajW5/mE5FSn2ibr7YS701a8tokeiExCSNtvmdk=;
	b=d6pwrIA1Pod74xcLhNdf00B8pb5tiHM6bRSzdGK+hYbHH3hLTj4ca2IJGaV1cRjcQP
	WVZEHG0cMW+lYo9iwLp38lsxMt8T9r7pRDiSe594Y3qmYq5BLDORoUo7EQyVYYCfR3/w
	lN/3u9X9dPx/eviR6+6JFc90lD/iunBMAWA1wxsQY0lzvaGWUmKov8BFapgQQkt7Zg3C
	KWia5eBC7s31tX4j3c/ivRj2s1NNwnBd7iAkfqUW0l+rHrpNw+K4r8y0xk2yl0O8xl/n
	KBVJZjkHAal/4ra64P7WE7WOHJu9txAV75KljdZR7//U03tmFeCU7g6GKgX9c7/Fjn/m
	WtWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/fMCwajW5/mE5FSn2ibr7YS701a8tokeiExCSNtvmdk=;
	b=qWrNBbBIlZWBW086NUOO1QnOuyPvfYwxg7CIyImzn3/ozL/edtpfRxU4D3XrOT1PcG
	lDgYdPnSyGkeW57XTgQmAEz+ezA2nVDfxr7NW292fISTxUkx8p/w6PlkDClG7cSUxWku
	4OB2VRj7YArU9U12s5hi04Z/viWrGmw3i8PMt3wKRjjpRuYZrQtKlIX2HFWnEOZC0IhD
	NWbH4mIyGBR3OS6yqbnKizTlAsOYa850/OUEsFejVIIFexpneBQM7P9bBIVyfdVcYDx3
	iICxD67DLvz6/oMRRSOR3EtX4f4D7355m0Ctr0wWmLatiebDGK641N14mpqaWbnNZ1KU
	vSZQ==
X-Gm-Message-State: AGRZ1gIaoGeFY+ZyzoDnsuCd91LhxqsmUs2jZUUAS/WtThUROiNhhHaA
	jjicjSv6VTRA0Ab2WIYruroQnt3XmKudDfpuCtc=
X-Google-Smtp-Source: AJdET5cJyZADsw4OshGHPGwP0xRMX2VamqEMnSH8ZeIOPuYJW3lsDakwu1cWZdVH/DuuLZ3wSWHn99Rpfh1/Fjy9MGw=
X-Received: by 2002:a19:4e59:: with SMTP id c86mr6720101lfb.132.1541800961983; 
	Fri, 09 Nov 2018 14:02:41 -0800 (PST)
MIME-Version: 1.0
References: <20181109191933.6641-1-palmer@sifive.com>
	<20181109191933.6641-2-palmer@sifive.com>
In-Reply-To: <20181109191933.6641-2-palmer@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 9 Nov 2018 14:02:15 -0800
Message-ID: <CAKmqyKPDNncn5NTcBm+ubgAD3M22aKK2yvLmzuP5x4s4nP8Ozg@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: qemu-riscv@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::141
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH for 3.1] RISC-V: Respect
 fences for user-only emulators
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
X-List-Received-Date: Fri, 09 Nov 2018 22:11:12 -0000

On Fri, Nov 9, 2018 at 11:21 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> Our current fence implementation ignores fences for the user-only
> configurations.  This is incorrect but unlikely to manifest: it requires
> multi-threaded user-only code that takes advantage of the weakness in
> the host's memory model and can be inlined by TCG.
>
> This patch simply treats fences the same way for all our emulators.
> I've given it to testing as I don't want to construct a test that would
> actually trigger the failure.
>
> Our fence implementation has an additional deficiency where we map all
> RISC-V fences to full fences.  Now that we have a formal memory model
> for RISC-V we can start to take advantage of the strength bits on our
> fence instructions.  This requires a bit more though, so I'm going to

s/though/thought/g

> split it out because the implementation is still correct without taking
> advantage of these weaker fences.
>
> Thanks to Richard Henderson for pointing out both of the issues.
>
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/translate.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 18d7b6d1471d..624d1c679a84 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -1766,7 +1766,6 @@ static void decode_RV32_64G(CPURISCVState *env, DisasContext *ctx)
>                       GET_RM(ctx->opcode));
>          break;
>      case OPC_RISC_FENCE:
> -#ifndef CONFIG_USER_ONLY
>          if (ctx->opcode & 0x1000) {
>              /* FENCE_I is a no-op in QEMU,
>               * however we need to end the translation block */
> @@ -1777,7 +1776,6 @@ static void decode_RV32_64G(CPURISCVState *env, DisasContext *ctx)
>              /* FENCE is a full memory barrier. */
>              tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
>          }
> -#endif
>          break;
>      case OPC_RISC_SYSTEM:
>          gen_system(env, ctx, MASK_OP_SYSTEM(ctx->opcode), rd, rs1,
> --
> 2.18.1
>
>

