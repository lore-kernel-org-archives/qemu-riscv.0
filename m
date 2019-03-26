Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h8uV1-0000CQ-T2
	for mharc-qemu-riscv@gnu.org; Tue, 26 Mar 2019 18:24:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39609)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1h8uUz-0008Pm-4e
	for qemu-riscv@nongnu.org; Tue, 26 Mar 2019 18:24:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1h8uUX-0001JI-Om
	for qemu-riscv@nongnu.org; Tue, 26 Mar 2019 18:24:22 -0400
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144]:44876)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1h8uUX-0001Ic-GE; Tue, 26 Mar 2019 18:24:21 -0400
Received: by mail-lf1-x144.google.com with SMTP id u9so9810279lfe.11;
	Tue, 26 Mar 2019 15:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=PYgWmmTn3NwIaawUFswp1rZ15I4nIekeAzFFevppZuY=;
	b=sjseeZnRIKv7OobHHgG/Yb0silxgRt87BRVyy8g0tuBn3lgI7zRS7S2c0RKrBbn43b
	pmuK/vp+uvoRZqMwjwmK2kslVsy/vxImJBr8VGMCIE9ecAWHR7szfkFQaubW5+7xw7Vk
	+I1gPYW9crum3NBTamQoKzmBRz0WDvxuqc7b/8pWuGCBgh2tePNatG2CAHvs7VULp3SD
	WsiUqWmKU2uWeiPMTOKymYjKRLlvuZXpf3N3bYNCWMRo0iJVtfEL9y5pfx97/pOZBsK/
	JGvbrTUWNEUw8m6S2GstGvz+g92+Pgoy3aT0hXwO0U68l1+as/BmA3R/tSw6nsnr+KsM
	PaPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=PYgWmmTn3NwIaawUFswp1rZ15I4nIekeAzFFevppZuY=;
	b=nUoJlGDCnyDH+0qMSKrbLHOCYbU608rsDCWYiyTqbPPwdNPKDYfhUgOFOcHtR4gSFx
	+zeanALw4BoTE5D+GoCtCVGBGRUYWlu6RJ0nPeU7GBxpHeE9jwxRXz2LS+0VsfiMCnF8
	gkCpe17UvJE1ONdy9sdRtja8SLHdUxVGhtDdsjHN/tTxC/QwU6fCfqbdewLahTq3rzJg
	5FOwFyPlxVXi75nMPjGrSlxNOqmYqOd0olE3Y959VDCw/6ALs2s/ZKxI2OP1CbLqXDd5
	z0dc9DkO9Kjx77WTfFsMy1klhWSypA/1/Bp4XRymxj6sv5ShVU6sACjn4EPpvmgzSKFO
	s+6A==
X-Gm-Message-State: APjAAAWDyVHC/EE/DdyXlAcZdGxtxrwoPDZjOskrgl+5vj4jK/Uph7PP
	ITVWOBxsacfeK2OIJszknvIThr+72p9AbntcDSA=
X-Google-Smtp-Source: APXvYqyrsHAAi41O2zgyiEeMeKVoHcWrqgetIWM5rVMWoZJvnJwyXRALC/LoTh5xOr5Y1GC0+U7x922TIPAkiqlh4dQ=
X-Received: by 2002:a19:40cc:: with SMTP id n195mr4215170lfa.150.1553639060223;
	Tue, 26 Mar 2019 15:24:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190325114554.7388-1-chouteau@adacore.com>
	<7b79d668-fffb-35ed-b855-e27eab819a05@linaro.org>
In-Reply-To: <7b79d668-fffb-35ed-b855-e27eab819a05@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 26 Mar 2019 15:23:01 -0700
Message-ID: <CAKmqyKOak5=8Z_Tu+a1xncGvg8k9no4DBPEQqgMTLX+On0c8ZA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Fabien Chouteau <chouteau@adacore.com>,
	"open list:RISC-V" <qemu-riscv@nongnu.org>, 
	Sagar Karandikar <sagark@eecs.berkeley.edu>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Palmer Dabbelt <palmer@sifive.com>, 
	"open list:All patches CC here" <qemu-devel@nongnu.org>,
	Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::144
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH V2] RISC-V: fix single
 stepping over ret and other branching instructions
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
X-List-Received-Date: Tue, 26 Mar 2019 22:24:50 -0000

On Mon, Mar 25, 2019 at 9:59 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 3/25/19 4:45 AM, Fabien Chouteau wrote:
> > This patch introduces wrappers around the tcg_gen_exit_tb() and
> > tcg_gen_lookup_and_goto_ptr() functions that handle single stepping,
> > i.e. call gen_exception_debug() when single stepping is enabled.
> >
> > Theses functions are then used instead of the originals, bringing single
> > stepping handling in places where it was previously ignored such as jalr
> > and system branch instructions (ecall, mret, sret, etc.).
> >
> > Signed-off-by: Fabien Chouteau <chouteau@adacore.com>
> > ---
> >  .../riscv/insn_trans/trans_privileged.inc.c   |  8 ++---
> >  target/riscv/insn_trans/trans_rvi.inc.c       |  6 ++--
> >  target/riscv/translate.c                      | 30 +++++++++++++++----
> >  3 files changed, 32 insertions(+), 12 deletions(-)
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
>
> r~
>

