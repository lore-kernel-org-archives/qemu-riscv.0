Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gmpcv-00006I-Go
	for mharc-qemu-riscv@gnu.org; Thu, 24 Jan 2019 19:45:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59806)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gmpcu-00005j-3N
	for qemu-riscv@nongnu.org; Thu, 24 Jan 2019 19:45:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gmpct-0005fS-7p
	for qemu-riscv@nongnu.org; Thu, 24 Jan 2019 19:45:44 -0500
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:41562)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gmpcs-0005e7-RR; Thu, 24 Jan 2019 19:45:43 -0500
Received: by mail-lj1-x244.google.com with SMTP id k15-v6so6907306ljc.8;
	Thu, 24 Jan 2019 16:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7i390VFdFgC9MB+vfnsbstGpFxq0r2mXorVIf1mUzqg=;
	b=BfR/TROv4eXwdkvE88A3tQd94wbXCiEbzcpr4LAyQEJft7OThq0mZ5q7I0Lv8VfkuD
	l5Ssgl0bXKAKwPNdjXHGFtAgWfz9bH8ITIWWimwJoCzCRVKRf7wmqXJo8/ibv/f+eCt/
	jHL0rB60j6etP7p+LUABQDxIGylsWPe5V7xiJftz/gF1nS8Yu5r+cuQN2dFovylwx0Ac
	UiT77366FN/wEd6B2ebO/Tjtp9o3LIeqT8mkIpa6YdFmJgIJFqY9g/ckmar0qTCE0XmV
	kg7gshtfH41J90NLBZ2DDT3/Sa0G8/vQXvpNGTG6XkWoRZ78DbHQO/RDJaxjZ1ZikV/F
	b02Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7i390VFdFgC9MB+vfnsbstGpFxq0r2mXorVIf1mUzqg=;
	b=KbvzxEaX9kqwcF2S5Q28ocek/KOTn7oc9tSMr8AVKDOsImXeT+HhRcGl88noXGOQVB
	0+Tz7qQqomqOnyRoY+vvRb7e/7Kd8VUgXglT/DnvvH1MlzS9nM8aN9zZbN1bG/XGL4/P
	uaD+lqOWPXy+tvsg6pGqGGEKACmqE5QS0wND6UtDaLC0TEpACJ7TK7Ei4tit9W8/toTj
	/6ZEoKZxrGxiRHWnDDTI6o92ndBQoGnh8BzXBbOpCeDf4WwlVsS4rOjupT//X9cr1yka
	Iksfbz4l7ootQPzSHKf+SG8YxnojcK7+hZAsOklP7v5yeOiDmRDaT9o7tnITlZBd/T5w
	ZRAg==
X-Gm-Message-State: AJcUukfxtJ4b6AChJ3JZ76o60sL2bsIoFrvWJOboxTyTiNLsEM53ErIe
	lCWR6mLLKr7EUCg6JJo+iBO3l+zIx1XuiFFFtn8=
X-Google-Smtp-Source: ALg8bN6kQpfPhRY8oexwIFly7pQpKLcm8wBl5SEqIC32u2fCDvKLtgc760nOOASYVy4TJEurlWGgUdzUDDPTfMCAq7M=
X-Received: by 2002:a2e:9e95:: with SMTP id
	f21-v6mr7095217ljk.128.1548377140724; 
	Thu, 24 Jan 2019 16:45:40 -0800 (PST)
MIME-Version: 1.0
References: <CAKmqyKOgQLX3Feh=g2ytdiSbFaedWdExpVVjMt6v+SUqxRYhzQ@mail.gmail.com>
	<mhng-8ea8314c-74f3-485d-a128-9fe9418ba593@palmer-si-x1c4>
In-Reply-To: <mhng-8ea8314c-74f3-485d-a128-9fe9418ba593@palmer-si-x1c4>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 24 Jan 2019 16:45:13 -0800
Message-ID: <CAKmqyKMAKq_WXtcEi9M55meRa6P=mk7uiy0_5Jg3_B-GpG9tXA@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org, 
	Alistair Francis <Alistair.Francis@wdc.com>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::244
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v1 5/8] RISC-V: Add priv_ver
 to DisasContext
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
X-List-Received-Date: Fri, 25 Jan 2019 00:45:45 -0000

On Thu, Jan 24, 2019 at 4:37 PM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> On Tue, 15 Jan 2019 14:25:44 PST (-0800), alistair23@gmail.com wrote:
> > On Tue, Jan 15, 2019 at 2:24 PM Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> On 1/15/19 10:58 AM, Alistair Francis wrote:
> >> > -static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
> >> > +static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
> >>
> >> Why change this?  I know there is variation in the naming, but my
> >> preferred default mapping is CPUState *cs, RISCVCPU *cpu.
> >
> > Good point, I have changed it back to cs.
>
> I don't see a v2, so I'm just going to go ahead and squash in

Yeah, I was waiting for more comments before sending a v2 on such a
trivial change.

>
>     diff --git a/target/riscv/translate.c b/target/riscv/translate.c
>     index 8593c2170af4..b7176cbf98e1 100644
>     --- a/target/riscv/translate.c
>     +++ b/target/riscv/translate.c
>     @@ -2015,10 +2015,10 @@ static void decode_opc(DisasContext *ctx)
>          }
>      }
>
>     -static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cpu)
>     +static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
>      {
>          DisasContext *ctx = container_of(dcbase, DisasContext, base);
>     -    CPURISCVState *env = cpu->env_ptr;
>     +    CPURISCVState *env = cs->env_ptr;
>
>          ctx->pc_succ_insn = ctx->base.pc_first;
>          ctx->mem_idx = ctx->base.tb->flags & TB_FLAGS_MMU_MASK;
>
> and add Richard's tag.

Sounds good.

Alistair

>
> >
> > Alistair
> >
> >>
> >> Otherwise,
> >> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

