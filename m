Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1htDBQ-0003t9-GF
	for mharc-qemu-riscv@gnu.org; Thu, 01 Aug 2019 11:40:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40796)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1htDBM-0003qD-EF
 for qemu-riscv@nongnu.org; Thu, 01 Aug 2019 11:39:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1htDBF-0005mV-U3
 for qemu-riscv@nongnu.org; Thu, 01 Aug 2019 11:39:51 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231]:44521)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1htDB9-0005gE-IN
 for qemu-riscv@nongnu.org; Thu, 01 Aug 2019 11:39:44 -0400
Received: by mail-oi1-x231.google.com with SMTP id e189so54151575oib.11
 for <qemu-riscv@nongnu.org>; Thu, 01 Aug 2019 08:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4e92+S/B1j008AYg6mI/HQ2hIjEp+EJaePOmjvO0ygI=;
 b=JQnlrBfoC0vidb3wwBJKAP8vhzA4Znb0WCNk21yFSEqHHs+rBRBHi4oda4wzGIEmAH
 rnh1Gx7eGg15D1VQf3M3v/FzaFL78Q9/BFq6lqlwPJscuGoq24dVs9mNCDnEEq+Ooxg4
 9fy5mmLcecZjll06JkpsIJKDg5N9xN801w7J+rWqamh7pKoY6A7CjU5cb9ICRbP929sT
 Nqkfh6IqYd4k1UbNgi9pLUffiN1hB9pS+1bx7RQnvHG1Z0fP4YKAA5bdy8FEl/M7WgxY
 7AToknVJ6cOYgXIjAEm1Ic1JE4rNipSqK2wsmUFZz6hHizoG1JgqJH1KvW86+mm1QqB+
 Y+3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4e92+S/B1j008AYg6mI/HQ2hIjEp+EJaePOmjvO0ygI=;
 b=bI2Nsz4DDrYbdhtg9wliQL3dS9qT6k4HvicYr/6BTMqD02/MNl+/fAPGsvh5a79LmP
 JoVyx9wPINcRiSB+Umq5QXnoIc5PpgAOUdIGiN4LhMiC6Hmp+26Iy6T0y8EcsmSxmiYd
 ZwTCWg0nHVVD36PGLAO2+luHni4Q5iI6jpTsKMAR5Y+l5BTlnig8qHd/UStuHKUqDWjY
 qVZROU/vN5pfOZrTHphVQdWOfYEkW+Q87JQ3UxXPNAoTkKPNuvsrSIW3mSPMb8j7Q8CX
 TqF+mgZfv6e49Oe5B3qe29uFMoh4yiLTx8aTh/t5LigACWaKcssMukI1NgSObYN1xseq
 2ehg==
X-Gm-Message-State: APjAAAVROjztLZKznpr51WAUjen8SFAr2HZ6kWSgD9ESss35plVXHkLQ
 nEqgFhW/+Zc40mOc3d+RlRByICtAVUtKSKtiqIvHtQ==
X-Google-Smtp-Source: APXvYqxRSBRR+oOcxXUI3ErxDs+l88nbF78pdtmR103Dgp+Hcv0EEH/vV+afnRc4MhWNP91xtq3HaulBmfEL9LczTw0=
X-Received: by 2002:a05:6808:8c2:: with SMTP id
 k2mr62008514oij.98.1564673967959; 
 Thu, 01 Aug 2019 08:39:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190703084048.6980-1-palmer@sifive.com>
 <20190703084048.6980-5-palmer@sifive.com>
In-Reply-To: <20190703084048.6980-5-palmer@sifive.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Aug 2019 16:39:17 +0100
Message-ID: <CAFEAcA-A5P+2XE49dg582CRtDPH0CXevyYfkGkaDH3HN=NFYcg@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::231
Subject: Re: [Qemu-riscv] [PULL 04/32] target/riscv: Implement
 riscv_cpu_unassigned_access
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
X-List-Received-Date: Thu, 01 Aug 2019 15:39:58 -0000

On Wed, 3 Jul 2019 at 09:41, Palmer Dabbelt <palmer@sifive.com> wrote:
>
> From: Michael Clark <mjc@sifive.com>
>
> This patch adds support for the riscv_cpu_unassigned_access call
> and will raise a load or store access fault.
>
> Signed-off-by: Michael Clark <mjc@sifive.com>
> [Changes by AF:
>  - Squash two patches and rewrite commit message
>  - Set baddr to the access address
> ]
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>

Oops, I missed seeing this go by. The do_unassigned_access
hook is deprecated and you should drop this and use
the do_transaction_failed hook instead.

The distinction between the two is that do_unassigned_access
will end up being called for any failing access, including
not just "normal" guest accesses but also for bad accesses
that happen during page table walks (which often want to
be reported to the guest differently) and also accesses
by random devices like DMA controllers (where throwing a
cpu exception is always a bug).

Changing the hook implementation itself should be straightforward;
commit 6ad4d7eed05a1e23537f is an example of doing that on Alpha.
You also want to check all the places in your target code that
do physical memory accesses, determine what the right behaviour
if they get a bus fault is, and implement that (or at least put
in TODO comments).

thanks
-- PMM

