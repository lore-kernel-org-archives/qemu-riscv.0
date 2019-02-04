Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gqb2v-000558-Ga
	for mharc-qemu-riscv@gnu.org; Mon, 04 Feb 2019 05:00:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55738)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gqb2p-00052K-BX
	for qemu-riscv@nongnu.org; Mon, 04 Feb 2019 05:00:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gqb2n-0005Zn-Ex
	for qemu-riscv@nongnu.org; Mon, 04 Feb 2019 05:00:03 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:43101)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gqb2n-0005Ye-8p
	for qemu-riscv@nongnu.org; Mon, 04 Feb 2019 05:00:01 -0500
Received: by mail-ot1-x342.google.com with SMTP id a11so11937800otr.10
	for <qemu-riscv@nongnu.org>; Mon, 04 Feb 2019 02:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=nE1EflVJsK5kxbWXwjBiD1lMOR0rCjkUMU/LR+Xy+GM=;
	b=jO6fGUTzbgpeQ21iTNvOop8LdPxRdOfP307rFYOOH8JuZGcx62kbu9NPVu2fpXi1xL
	kz8QU9ajuEnZcEkvCMI2Dw6q5uMR/FOu9Ty3VKcC8QiBdQcgcsRxvub0QobP8jiEfeCi
	w46LzNYdkcjpvMC1p2rpPk7fceb6G1UTqpfc4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=nE1EflVJsK5kxbWXwjBiD1lMOR0rCjkUMU/LR+Xy+GM=;
	b=NnfDrktOEIEyyLfrcpqHccODPU4M36HGM3oARU71WxZ7mmI8F5whWz3kc6Nc03xnzt
	xaH4IXavyaR2UN2bcpPzZv/H9UqM3C2LX7k4wGcnEPzQ4tAHzO9JzgMpig7s9et0sqpM
	D9qc1bZydGlltMfxJpA2o1+eU+Q4bNJZ6Xx0UH1uInT6GpRZ3X6J31u4ohGQJlA6U2Ro
	HJhxGo5IBiNAB1GBE2eDAk54myKPnVDclELDsLIXS9wOP33JoJ6jcM285s8nTLFG2is7
	rYclnG9NRO8hP0f+JTNLkPfPNwxfcqvwYJkYIYtodJcB6Vujux0kN4WTmmyK1jLDxP2y
	XGVg==
X-Gm-Message-State: AJcUukdKrqqco5HRZVq35gpfp06Z8xrqXvPEbP/BBEHroDzN0FWHnbj5
	MbY3ZCTCyzx2QNuJSkw1y9BolCRgo4ZT/qI4secG4g==
X-Google-Smtp-Source: ALg8bN6LN1eNemdAZ57a9y+lidDX5G6iAYLLYAYOGh9ODnN/zyS+qLU83+WHQQUZY8ts97DyBk3Tm+yPfgHDacQpm+I=
X-Received: by 2002:a9d:7855:: with SMTP id c21mr34572932otm.363.1549274399909;
	Mon, 04 Feb 2019 01:59:59 -0800 (PST)
MIME-Version: 1.0
References: <mhng-99c129ef-4e70-4840-b80f-7b3c6b806083@palmer-si-x1c4>
	<01c75f94-26ae-ffa4-dd46-4dd019702fa0@redhat.com>
In-Reply-To: <01c75f94-26ae-ffa4-dd46-4dd019702fa0@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Feb 2019 09:59:48 +0000
Message-ID: <CAFEAcA9JXK5O5tSvBD17CM3Eb132EWuub9VvOJWaAKUOu8KA5A@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Palmer Dabbelt <palmer@sifive.com>, qemu-riscv@nongnu.org, 
	QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-riscv] [Qemu-devel] [PR RFC] RISC-V Patches for 3.2,
 Part 3
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
X-List-Received-Date: Mon, 04 Feb 2019 10:00:09 -0000

On Mon, 4 Feb 2019 at 09:05, Thomas Huth <thuth@redhat.com> wrote:
> On 2019-02-02 09:41, Palmer Dabbelt wrote:
> >> My mail filter finds these RFC pullrequests, yes. I'm then
> >> relying on my manual brain to not actually apply them.
> >> (If it's a slow day I might do a test merge on them, but
> >> usually my queue is full enough that I don't get to them
> >> before the real PR appears.)
> >
> > Ah, OK -- do you want me to do something else?
>
> At least I got a little bit confused by "PR RFC" ... I think some other
> maintainers rather send out patch series marked with "PATCH" first, and
> add some non-pull-request cover letter with a text like "I'm intending
> to send a pull request for this soon, please review one more time...".
> Then after a day or two, once Patchew checked the series and nobody else
> complained, they send a real "PULL" request.

Yeah, generally nobody else sends RFC pull requests, they just
send the actual pulls. I don't object if Palmer finds them
useful, though.

For what it's worth, my filter for finding pull requests is emails
containing "for you to fetch changes up to" but not either of
"not for master" or "PULL SUBSYSTEM". So if you want to specifically
keep out of the filters you can add "not for master" in the cover
letter. But as I say it's not a big deal for me to sort things out
manually -- the filter has the odd false positive anyway.

thanks
-- PMM

