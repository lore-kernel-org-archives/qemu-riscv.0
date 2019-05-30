Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hWIkR-0007iQ-TJ
	for mharc-qemu-riscv@gnu.org; Thu, 30 May 2019 06:57:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39264)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hWIkP-0007ho-Ka
	for qemu-riscv@nongnu.org; Thu, 30 May 2019 06:57:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hWIkO-0002uE-JX
	for qemu-riscv@nongnu.org; Thu, 30 May 2019 06:57:25 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:38443)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hWIkO-0002rc-DD
	for qemu-riscv@nongnu.org; Thu, 30 May 2019 06:57:24 -0400
Received: by mail-oi1-x244.google.com with SMTP id 18so3797943oij.5
	for <qemu-riscv@nongnu.org>; Thu, 30 May 2019 03:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8CUGtddsQAcpIedVPK7EXveMNL6giQ7v3lJi/i4QwOk=;
	b=bzPPLeoowxHw8ZPNXM8RxeuD0sTMM6S0gjpSG70GcVSRudlJBBWeTMM1rF5F5Ke6T3
	LiEK5muKGjMe0VW1nGasvrtxFASjQT9ghGNTEk69aRjEPkVhhzSXydVbDPf+BBvwqZgv
	v10LUoxHcMzCdw6tfqSQIdPfsPOWbdZAXdEPkY92uV0LCQ3C2g+g5ILqohoIFWzhjJZL
	wcxSWUGGbJKUkrllgA0Am2/msjHHenxOVXyJDMt4Oy9Ze28K9/ejmXIcrVELhka4khK/
	KmODPMD7YObw+SG4HxZj0FCB6tqQzIPVeY4cEryZGG1VaeQJYKsuhrvtz/yj3faOkhys
	2KdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8CUGtddsQAcpIedVPK7EXveMNL6giQ7v3lJi/i4QwOk=;
	b=XssVqF9A5wfhbvVCER9lBr9n4tOwybNyRAa0j5fN48TpRtKjYRrtsPUDvljX4MkVzl
	NIB/Ekjw1MRQqbdm73ObgO/2dtlaz49rwCcrgTyZoweGW+RnOPegrvbAYL9423XsC+I0
	zjQUEX6eIX4tAFPws0Fm6XY1lCxjZalL9WfrNCFCUZgLxrGok8cz7phIpGHnA+fgVIX3
	ugp4sj7KITh4vXFn4PnEMoEMU5QETmfKNzznXuiFVWZe1tR8XDytel2L1Jfa7LQSLFe2
	kIoDQUxR/B0QRU0jsCLW8QnDiqpeZ6M9WB7t5ZHG28E9/amZGip2nn5JWqATBkXBpdQS
	Lj4A==
X-Gm-Message-State: APjAAAWN+FSfsCr86/UIDpdRqDwgGyq6cn/g5FwBszu7bqhlVp2rOY0f
	YK9JpDUBbUgAyK1w9ROaEcPf0zNPDfRRiXSVdvAScA==
X-Google-Smtp-Source: APXvYqyPQ9nqn37SloKIULf2etAGLfCBkH00WHyi0wZur1IOn2ahOeCnNybcpbK/80a0otx0Bl/ZJJek0Zg0eIY+wiY=
X-Received: by 2002:aca:5785:: with SMTP id l127mr1910631oib.48.1559213843255; 
	Thu, 30 May 2019 03:57:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190526010948.3923-1-palmer@sifive.com>
	<20190526010948.3923-2-palmer@sifive.com>
In-Reply-To: <20190526010948.3923-2-palmer@sifive.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 May 2019 11:57:12 +0100
Message-ID: <CAFEAcA-01sahAvfLRoe3e9RfCcgmk4+Ubceufg9hhmwQAFpbRQ@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>, 
	Fabien Chouteau <chouteau@adacore.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-riscv] [PULL 01/29] SiFive RISC-V GPIO Device
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
X-List-Received-Date: Thu, 30 May 2019 10:57:26 -0000

On Sun, 26 May 2019 at 02:10, Palmer Dabbelt <palmer@sifive.com> wrote:
>
> From: Fabien Chouteau <chouteau@adacore.com>
>
> QEMU model of the GPIO device on the SiFive E300 series SOCs.
>
> The pins are not used by a board definition yet, however this
> implementation can already be used to trigger GPIO interrupts from the
> software by configuring a pin as both output and input.
>
> Signed-off-by: Fabien Chouteau <chouteau@adacore.com>
> Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>

Hi; this patch causes Coverity to complain about a memory
leak (CID 1401707):

>  static void riscv_sifive_e_soc_realize(DeviceState *dev, Error **errp)
>  {
>      const struct MemmapEntry *memmap = sifive_e_memmap;
> +    Error *err = NULL;
>
>      SiFiveESoCState *s = RISCV_E_SOC(dev);
>      MemoryRegion *sys_mem = get_system_memory();
> @@ -184,8 +188,28 @@ static void riscv_sifive_e_soc_realize(DeviceState *dev, Error **errp)
>      sifive_mmio_emulate(sys_mem, "riscv.sifive.e.aon",
>          memmap[SIFIVE_E_AON].base, memmap[SIFIVE_E_AON].size);
>      sifive_prci_create(memmap[SIFIVE_E_PRCI].base);
> -    sifive_mmio_emulate(sys_mem, "riscv.sifive.e.gpio0",
> -        memmap[SIFIVE_E_GPIO0].base, memmap[SIFIVE_E_GPIO0].size);
> +
> +    /* GPIO */
> +
> +    object_property_set_bool(OBJECT(&s->gpio), true, "realized", &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }

This function allocated xip_mem and mask_rom via g_new() but
then this error-exit doesn't free them.

The best way to fix this is to stop doing separate memory
allocations at all -- instead just have fields in the
SiFiveESoCState struct
   MemoryRegion xip_mem;
   Memory_Region mask_rom;

and pass &s->xip_mem etc where currently the code uses xip_mem.

thanks
-- PMM

