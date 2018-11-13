Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gMf1u-0004rF-J4
	for mharc-qemu-riscv@gnu.org; Tue, 13 Nov 2018 15:11:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55367)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gMf1s-0004bV-J6
	for qemu-riscv@nongnu.org; Tue, 13 Nov 2018 15:11:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gMeyu-0007Vz-Nr
	for qemu-riscv@nongnu.org; Tue, 13 Nov 2018 15:08:17 -0500
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:36816)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gMeyu-0007VQ-G3; Tue, 13 Nov 2018 15:08:16 -0500
Received: by mail-lj1-x243.google.com with SMTP id s15-v6so12029082lji.3;
	Tue, 13 Nov 2018 12:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=GvCvEYp2tw5jRYQwjgto04bYTCe/21WUYz/sGndvo+U=;
	b=Sa0osVX0ydpKWwW523tX0eHs80zOziZF8qUxn/0RSC/mFphaW9s6TTCnIHH7xk20DF
	89x8HDbENGN5Y/hvOwm52u4HEINvFCDbY0/nKESTU4nqgqtcSdWIEZubtvkd6IAc0PSO
	ay6EoACDI79FotGbKokVRdjRpy+h3zFfkdlYA/T4zw6PZL14g52rnmxzQZieAfDJ6/uC
	kb51cNcN2/pDpPIvyd8CCymTP7H/rtmWp2wqudPDPWYUg4MNIEMoIDj7spLpCdBjUIL3
	zgOPBDFw6JZh3N5IIN8t9FyWUx+OxfGXU1H8h1hyesJx1qRLOnS8o8ENVA0WgciJoo+n
	g11g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=GvCvEYp2tw5jRYQwjgto04bYTCe/21WUYz/sGndvo+U=;
	b=Q6UiuvfYCrS3tZD3c4yJx6QarErsyR9QDU6j/bH2pKjPRi/c/Ebsyue5wP5kymILhk
	n3fspACOpeuYR6yJOItlO6yON//eWc95sV6HDGG1HKXxK1FCjlI6iO3NdaoatVEl2nGe
	HT6KOFyLT73VQcfadTC0DCyyIqJYRvN9HxH1B2zgRlD6aMevSfmkoP61pR1V0i5TbFAl
	uAWmhbAxpAJNl9MJqgcCF6aQNfcXG2pADzDQ1PfexHjKN7CjI8oT+GCRlRVOX7cbuPci
	16+5bUafd6ytSI/EX6gmJ+4ws0QQlOwB5shw7IZPmJO1udinaCsmOR22gBWrSFPpI72u
	icQQ==
X-Gm-Message-State: AGRZ1gKs2amK5Ti9W1YEA9giWW0TtQUxjMR/PyaysIMpmAxoLCQ4Suqw
	/yeDHvBYagwF9ECbbYhD1TUETzGAxkgApHmT7sI=
X-Google-Smtp-Source: AJdET5c567D3kxWIc9mPYbUqQj6EaDDPdtgN3On2FCeVLWeFgAP6m8tGsfoXLi+MqVfsEPxhHiD1bAMPVxoAMqVU6WA=
X-Received: by 2002:a2e:4218:: with SMTP id
	p24-v6mr3905196lja.58.1542139695202; 
	Tue, 13 Nov 2018 12:08:15 -0800 (PST)
MIME-Version: 1.0
References: <20181108120628.29926-1-kbastian@mail.uni-paderborn.de>
	<20181108120628.29926-3-kbastian@mail.uni-paderborn.de>
In-Reply-To: <20181108120628.29926-3-kbastian@mail.uni-paderborn.de>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 13 Nov 2018 12:07:43 -0800
Message-ID: <CAKmqyKMovbJcChitESLqep_4D4-kgMjaUSaESghPu5+EYKSu5A@mail.gmail.com>
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: Michael Clark <mjc@sifive.com>, Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@sifive.com>,
	Alistair Francis <Alistair.Francis@wdc.com>, qemu-riscv@nongnu.org, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::243
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH 2/2] target/riscv: Fix
 sfence.vm/a both available in any priv version
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
X-List-Received-Date: Tue, 13 Nov 2018 20:11:21 -0000

On Thu, Nov 8, 2018 at 4:07 AM Bastian Koppelmann
<kbastian@mail.uni-paderborn.de> wrote:
>
> sfence.vm has been replaced in priv v1.10 spec by sfence.vma.
>
> Reported-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/translate.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 5359088e24..f44eb9c41b 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -1292,10 +1292,14 @@ static void gen_system(CPURISCVState *env, DisasContext *ctx, uint32_t opc,
>  #ifndef CONFIG_USER_ONLY
>      /* Extract funct7 value and check whether it matches SFENCE.VMA */
>      if ((opc == OPC_RISC_ECALL) && ((csr >> 5) == 9)) {
> -        /* sfence.vma */
> -        /* TODO: handle ASID specific fences */
> -        gen_helper_tlb_flush(cpu_env);
> -        return;
> +        if (env->priv_ver == PRIV_VERSION_1_10_0) {
> +            /* sfence.vma */
> +            /* TODO: handle ASID specific fences */
> +            gen_helper_tlb_flush(cpu_env);
> +            return;
> +        } else {
> +            gen_exception_illegal(ctx);
> +        }
>      }
>  #endif
>
> @@ -1342,7 +1346,11 @@ static void gen_system(CPURISCVState *env, DisasContext *ctx, uint32_t opc,
>              gen_helper_wfi(cpu_env);
>              break;
>          case 0x104: /* SFENCE.VM */
> -            gen_helper_tlb_flush(cpu_env);
> +            if (env->priv_ver <= PRIV_VERSION_1_09_1) {
> +                gen_helper_tlb_flush(cpu_env);
> +            } else {
> +                gen_exception_illegal(ctx);
> +            }
>              break;
>  #endif
>          default:
> --
> 2.19.1
>
>

