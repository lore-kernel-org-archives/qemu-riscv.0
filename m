Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h6itp-0001hC-LB
	for mharc-qemu-riscv@gnu.org; Wed, 20 Mar 2019 17:37:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56362)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1h6itn-0001fb-Tq
	for qemu-riscv@nongnu.org; Wed, 20 Mar 2019 17:37:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1h6itm-0005Xi-TW
	for qemu-riscv@nongnu.org; Wed, 20 Mar 2019 17:37:23 -0400
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:33740)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1h6itk-0005KP-3q; Wed, 20 Mar 2019 17:37:20 -0400
Received: by mail-lj1-x242.google.com with SMTP id f23so3631315ljc.0;
	Wed, 20 Mar 2019 14:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=2y7zwrleDwq6hgLNASuudGjU1EI2pvF1/JU5XeUFkUc=;
	b=hxaNXjdKSJTt+U13h7elrVb02bEubu83gXqLMgGc8FCtE2tksTslgnN08J7KHux+fB
	AkRoH+/HFAK04J0QSGh2tSOvaRfyeTYEMeZ5Zt+ySpLaYuE1ZEDZ4nz8RtKsPXXA/vxw
	/gFQqM7TmxKPq6RsbWoT5HbcHjPKanoYsgOoQkM1d9DAQErp98Dy/AnDd2V4Mc+YL89x
	ZvmzU/fNkGBk0vIGYhQn+VQvGebsH3jym63fEvxAdO78UQauuww8yrdNAHfx4b3yyr2I
	R0FfHXHAyHPmS+JZtAeYDtMBTZnJEiFxV4O0v1oHvSrx/EA+ChaNNZ7FxPwnIZ04s1pE
	ecHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2y7zwrleDwq6hgLNASuudGjU1EI2pvF1/JU5XeUFkUc=;
	b=Z13bLPFq75ZwHf7ibCR75D/Az7yBjtIbrJmf1Qh3ps4hYu9+akOFshGAWBSffuO9gM
	taBY4tQ75LcS5M5kVK0ONBwDVTPgM712loVjNIAwO155hAYI/gx5m3vGYfomxgJzj8T9
	rdFKO6rUw0Au3duSjWIIdPJKkfwWiG4p4Usif7Hf7hIrCrtjH8r+Fh/SPCtaYyxmHYrZ
	Ts6vzcoTvbyzw0eejSPLEZRoP3ssju8osS3jFkwnH0M+3NFFQly7RKO2z+xkkMMXFDf2
	mVMn/tWnwDByP6ca6Wp9Ue4IFEOEnuQCvTXuIiptezy+9nnU/PlOeHyBaFsNSXnM1/vn
	NPsA==
X-Gm-Message-State: APjAAAUZAn58cPMVdlZjVhpxJZk7sZAp6F2SRDGOUAgObK+3jgnmNJSS
	83Tx68OJuZ6eVeMJYPZhLBAeE2GqJ8SxABWp5E8=
X-Google-Smtp-Source: APXvYqxcYsJMejk7Ajuls+TrpXtgAMvc2OFSY53hfrljLjJwum46aTAFO9dH+yuMOMUDXiBWiugcCsd1XVRqVtp4Fwo=
X-Received: by 2002:a2e:6350:: with SMTP id x77mr132357ljb.191.1553117835009; 
	Wed, 20 Mar 2019 14:37:15 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1553019560.git.alistair.francis@wdc.com>
	<073a79909f5ec317747ff8330744e6d7dabec717.1553019560.git.alistair.francis@wdc.com>
	<CAFEAcA-x0r6a7uyR8KDBp2qv7KwRZu3dKxK73-XN7aAzgz=e_A@mail.gmail.com>
In-Reply-To: <CAFEAcA-x0r6a7uyR8KDBp2qv7KwRZu3dKxK73-XN7aAzgz=e_A@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 20 Mar 2019 14:35:56 -0700
Message-ID: <CAKmqyKP6_Gv2jFG6YteTuqNU1YKgYho=-2rxugGqLjXzhfm8Bw@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, 
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>, 
	"palmer@sifive.com" <palmer@sifive.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::242
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH for 4.1 v1 4/6] target/riscvL
 Remove the unused any CPU
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
X-List-Received-Date: Wed, 20 Mar 2019 21:37:24 -0000

On Tue, Mar 19, 2019 at 12:10 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 19 Mar 2019 at 18:24, Alistair Francis <Alistair.Francis@wdc.com> wrote:
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  target/riscv/cpu.c | 10 ----------
> >  target/riscv/cpu.h |  1 -
> >  2 files changed, 11 deletions(-)
>
> Won't this break linux-user? cpu_get_model() in linux-user/riscv/target_elf.h
> specifies the "any" CPU as the default to use if the user doesn't
> pass one on the command line. (In general you want the default for
> linux-user to be an "as many features as possible enabled" CPU.)

I don't have any linux-user tests setup at the moment so I'm not sure.
I'll add one and update this accordingly.

Alistair

>
> thanks
> -- PMM

