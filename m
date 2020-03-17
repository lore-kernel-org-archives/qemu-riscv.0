Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jEA6O-0007Pv-PS
	for mharc-qemu-riscv@gnu.org; Tue, 17 Mar 2020 07:09:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35562)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jEA6L-0007OB-NN
 for qemu-riscv@nongnu.org; Tue, 17 Mar 2020 07:09:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jEA6K-0006cc-My
 for qemu-riscv@nongnu.org; Tue, 17 Mar 2020 07:09:37 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:45018)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jEA6K-0006W6-HL
 for qemu-riscv@nongnu.org; Tue, 17 Mar 2020 07:09:36 -0400
Received: by mail-oi1-x243.google.com with SMTP id d62so21181861oia.11
 for <qemu-riscv@nongnu.org>; Tue, 17 Mar 2020 04:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NXc1CMVP8fPkOAEbAXSA1LX5CXyYPNg1sYK75gFtxkA=;
 b=AKYFtF/g6sx/HiI0KzPvMFmMkCrG9HVQZwHH//m5UuO3M10DTjRrbinSx1ERjGgAIy
 IFJBbBo9FEDq+FYlh0xEv3STgi24H0e1TuIl2f0xaxHJPWvTr5ci+6VcJ6qASajowgto
 QTZr1eGASXUMcw8Twz25eewAXhdMjPdaUiKsw46CzKLWF15RZK+mYKmpTCOtSt+ysACS
 WHfGCZSLnNicLT8PU5H4DLccmFTS13K1OHrf3RcWM9ZQOmaXdVVB31gx19T/xfL3r5g7
 R01/EmMI04lWnYIUnT0hPYqgbNZ0EWVTISaSWBCoErPVTnwSG8LmKalh5AL0iCLVrfir
 b0yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NXc1CMVP8fPkOAEbAXSA1LX5CXyYPNg1sYK75gFtxkA=;
 b=OR4dP9iW70G5V6x6ifEG/aS4EDiSnoK0JnACKdzqKsWCR9U3cMFPuOf7aZrrTMq+8y
 Nzx+VL8FzKCpiIAGzufwoy2mefaBLAdAzPOrbKJHpa/7DreCpfR2fkYtIElo/OQ/8dW+
 ikB+ZKPEQKSdBI6T15c4KDhrpY6oEa32QB04+RSD1SzRE0bgv63fuTJyYNsMSI1BRXjs
 dnxr4XwSbTM29RC8E03nvv/ZAjzI/P/O5lpa8WjGOYrZjUOm9KOWUGodAAOt7giPXe0v
 i0371sLJ9rwpK6f3wi+dhqb8An7uSH5bEU8stXZFCz+TMFXCCSz6LoJsQeDgfYl2e5jm
 tl8w==
X-Gm-Message-State: ANhLgQ2fb7oxzAs0CX9PCoESYf/ynXvWdYENRdWngBEnAIJiPw4S6Ine
 rIUvN5Z3lKWFVS5wHX4NG4yrUpova+nnUQVdiMolJQ==
X-Google-Smtp-Source: ADFU+vs2c9DxpS0l4trZekhVLc3xZAcpRkIj9P/idCPZL/Dwnk4e6YmgjRqCs9EAE8eGRtSGWMpvmCBrez5pnUn1SKo=
X-Received: by 2002:aca:190f:: with SMTP id l15mr2930921oii.48.1584443374646; 
 Tue, 17 Mar 2020 04:09:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200303100511.5498-1-peter.maydell@linaro.org>
 <c71dbe77-a883-361b-e33c-ed85ce07c0de@redhat.com>
In-Reply-To: <c71dbe77-a883-361b-e33c-ed85ce07c0de@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Mar 2020 11:09:22 +0000
Message-ID: <CAFEAcA-gZnOVD9MPwUBCcA4fvrTSaE1xEvd9dyr_r1RctiPJhg@mail.gmail.com>
Subject: Re: [PATCH] cpu: Use DeviceClass reset instead of a special CPUClass
 reset
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Chris Wulff <crwulff@gmail.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>, 
 Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Marek Vasut <marex@denx.de>,
 qemu-ppc <qemu-ppc@nongnu.org>, 
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>, 
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>, 
 qemu-s390x <qemu-s390x@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Walle <michael@walle.cc>, Palmer Dabbelt <palmer@dabbelt.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Mar 2020 11:09:38 -0000

On Tue, 17 Mar 2020 at 11:01, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> ping

Eduardo said he'd queued it -- I've been assuming he'll send
a pullreq for it.

(The followup work I was planning to base on this turned out
to have complications I hadn't expected, so I've put it on
the shelf for the moment. But this is still a good bit of cleanup.)

thanks
-- PMM

