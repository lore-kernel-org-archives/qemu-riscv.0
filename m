Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iADyG-0008FC-Of
	for mharc-qemu-riscv@gnu.org; Tue, 17 Sep 2019 09:56:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48709)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iADyE-0008Cq-19
 for qemu-riscv@nongnu.org; Tue, 17 Sep 2019 09:56:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iADyC-00078B-Tb
 for qemu-riscv@nongnu.org; Tue, 17 Sep 2019 09:56:41 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:42945)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iADyC-00077k-NJ
 for qemu-riscv@nongnu.org; Tue, 17 Sep 2019 09:56:40 -0400
Received: by mail-oi1-x241.google.com with SMTP id i185so2887358oif.9
 for <qemu-riscv@nongnu.org>; Tue, 17 Sep 2019 06:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xmM7iwnvkq10Lyfkc7ylrWLusbSjk4O32yWvyT0ob/U=;
 b=ZpNbruXZX8bHtLp8eRpsGZUwz69avhe5B5wYaCQT9X6+pi0Yx8ZXJ3pC6pPcWM84UO
 w20Yn/RIih4K9UKaxpEVrOuON/o7TJoVRSNPUrkgMspEOpSpyUeBRdph63g97Cf3MLDe
 HIzehWcZCGm2MHbKSFucV/uBXGNObB9fDTLczIzRV0B12h5V8jX4c/Yl+1MuYNr5gH3M
 +Got5Ij1Ah25wg3iTgRCi2/uIw27UffB0VGVE6kVFX07uZJKeMF6HC2b/VfZ2F3KoI0K
 BdOlQJH/0o3KmXznLh9N5xlHGVkTr7KJt2XZcANescZE9kg2n14XgfKDq7hNXxjC55Jw
 VP2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xmM7iwnvkq10Lyfkc7ylrWLusbSjk4O32yWvyT0ob/U=;
 b=IbX/+/xAxBh95hLPW8ad6Mlyjcs/a2S3KqtVUFLxoBuXzGT05hGnox31pPt9fSf5wR
 duZzl/PJD0IBU2S+p7IrXFpGasuYnzYfowR7y4pBDu2zdRbnLLhbRq0g5GRmuzsqUlBp
 xpxrA0yDSR2L7S3pQSZvhl3obtubTSDqy/D+j6N5a/K2SgzNAzBT2KF2ggNaUr3d7CWu
 Y9dabN1od4Jy0cmWHKQl4+S37duN0B6eOdfXIowq6OhHvH7BBiQrN2WC4Bz/XnHqimEo
 An7AfQhngnyVOUSSz7kfnwycJUiLd2fbK0yFtL2ydE6krxDgWQIEUDVkoUPlnd4YD+tN
 +R5g==
X-Gm-Message-State: APjAAAWmEP0i47kMqEs5V+UFN4Wg1EQnE/8FkbxnyzmusCI6IpnK3SsC
 BXw4GPkd+aZYvBzABuE3bL0H0JrZm8hRRtcej0JhZQ==
X-Google-Smtp-Source: APXvYqyP/OHa5w2aKok3hrAqzNf/L0rDLX7Jch1CE0hY4YYnA5QNNMdpBP6cHnnqki053DusWoCvaWPCUpl70Nv8VJ0=
X-Received: by 2002:aca:f54d:: with SMTP id t74mr3851311oih.170.1568728599867; 
 Tue, 17 Sep 2019 06:56:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAKmqyKMyv8gt8Gb6y0DMktnWnSKBw4ePwOXBzWkEpw5GVmyG0A@mail.gmail.com>
 <mhng-f7096b78-f11e-425e-8ade-d20c77ee1de6@palmer-si-x1e>
 <CAFEAcA_gpS3odPN_1sxCjV+0bRrNn+=xmS=5JgUFvz2A332LEw@mail.gmail.com>
In-Reply-To: <CAFEAcA_gpS3odPN_1sxCjV+0bRrNn+=xmS=5JgUFvz2A332LEw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Sep 2019 14:56:29 +0100
Message-ID: <CAFEAcA-r5nr3xF6A5C6mdt2rakB8TXPSp+s_g6sd-aUy566LrQ@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: Alistair Francis <alistair23@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-riscv] [Qemu-devel] [PULL 04/32] target/riscv: Implement
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
X-List-Received-Date: Tue, 17 Sep 2019 13:56:43 -0000

On Fri, 16 Aug 2019 at 09:57, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Thu, 15 Aug 2019 at 23:17, Palmer Dabbelt <palmer@sifive.com> wrote:
> > You're more than welcome to take them over.  I've got something that boots
> > Linux on my unassigned_access branch (github.com/palmer-dabbelt/qemu), but I
> > haven't sanitized the whole port for physical accesses and I haven't convinced
> > myself that my hook implementation is correct.
>
> Rather than doing
>    if (retaddr) {
>        cpu_restore_state(cs, retaddr, true);
>    }
>
> at the start of the hook I think you just want to pass 'retaddr'
> as the final argument to riscv_raise_exception() instead of
> using GETPC(). Other than that I think the hook itself is right.
>
> The 'git grep' regexes in docs/devel/loads-stores.rst are handy
> for finding the places where the target code is doing physical
> accesses. IIRC the only ones I found with a quick scan were the
> PTE loads in get_physical_address() via ldl_phys/ldq_phys, which will
> now return 0 and run into the 'invalid PTE' code path. I don't
> know whether your architecture requires some different behaviour
> for bus errors on page table walk than that (you might want to
> specifically code the error path anyway or comment it even if the
> behaviour is right, to be a bit more explicit that it can happen).

Gentle ping -- would somebody like to have a go at the riscv
do_transaction_failed hook conversion? I think it should be
straightforward, and riscv is now the only architecture still
using the old unassigned_access hook and preventing us from
getting rid of it entirely.

thanks
-- PMM

