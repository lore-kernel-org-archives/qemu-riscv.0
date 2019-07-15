Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hmzeU-0002aS-RF
	for mharc-qemu-riscv@gnu.org; Mon, 15 Jul 2019 08:00:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57774)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hmzeN-0002Eg-9G
 for qemu-riscv@nongnu.org; Mon, 15 Jul 2019 08:00:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hmzeM-0001ns-8o
 for qemu-riscv@nongnu.org; Mon, 15 Jul 2019 08:00:11 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:46369)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hmzeM-0001li-30
 for qemu-riscv@nongnu.org; Mon, 15 Jul 2019 08:00:10 -0400
Received: by mail-oi1-x242.google.com with SMTP id 65so12387113oid.13
 for <qemu-riscv@nongnu.org>; Mon, 15 Jul 2019 05:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VpxcwQfT6oonbjtfL7efqwNP5w52cC1PYO/hslDRy9Y=;
 b=oMjrey/uDVA9URYRAsD4TQgi9BJck6rkBoQCEUIWUfu0QAC1ANKGwfVauBXbRrxRwr
 p1r2IvgNsEybbfKnS1ijjWmd70YZ7+AuDfeb/7PYInwD0Aa1ou330w/fedXT2lrvkyqF
 hHHrtxhVlI/TSfL1Y/SLScywFswb6eXxlu+W4YwDoaFMlfT+sRMKtGdKuAqXqVTHqo/o
 slld/5WM0AekV8R79f+4lzmTXe1dNXmqwqgEkrwTx1MTs8KySX5r647APn26nbKlnbss
 dxoCoD9OZ/S1Oume+974/jBtFluskrvpOBKleRR2OhRdol4mosyebMDcWA6ItkIzHZVu
 TTxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VpxcwQfT6oonbjtfL7efqwNP5w52cC1PYO/hslDRy9Y=;
 b=nWTVKOz+xtolscvt0kGrpEDdru7xGOVwt/SON9Ijfe7bOB7nkOqI3KLs5tLK39/bbk
 6YABiS5S5G1akZOnrqRFo4+zFiDBud75F3fj+ybYqOp8eMU2yTT1Mcq1oFeXx2j5wm0a
 7J1Wfmx/OPxaWln0jddUduekW+ztfzIAxCwZQm2FR57w7QXDXW3sstIEGxklnpNYdX2H
 8Vhgfr3l5TGiUkfIsvtj3OFPbbNuLJRJ1/vD2pJlGyhhFlVB3bY1ilwtdOo59USTFytz
 NRu8IYmmp2e/J66ZY5HsjyoUd3jTrCt6zwsg2xNRD9sHERZPrsGzb8ZPKYaSOXuV/DYC
 2I0A==
X-Gm-Message-State: APjAAAWHLG9MEOYsqCwnR+qbiRvC7wN+2KpnPdcgpn68anmKwBHhMjKo
 vGkkeSXwWUhXDPgnAOg/TIVBrU9c8vzAsrid6ekFCg==
X-Google-Smtp-Source: APXvYqw4tu/0con8kdCslr58/ls7WFg600Lm886pSc8QYF3iPSdqDaiNE5PxsXvfe6tOpJhOqzyiyQoYzgHAB7C8v2c=
X-Received: by 2002:aca:6185:: with SMTP id
 v127mr13421086oib.163.1563192008781; 
 Mon, 15 Jul 2019 05:00:08 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1559944445.git.alistair.francis@wdc.com>
In-Reply-To: <cover.1559944445.git.alistair.francis@wdc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Jul 2019 12:59:57 +0100
Message-ID: <CAFEAcA95grVBoiCbMAeZYTXYxc6nhjx1EM6=05G_3Qqpp8obNQ@mail.gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair23@gmail.com>, Palmer Dabbelt <palmer@sifive.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v1 00/27] Add RISC-V
 Hypervisor Extension
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
X-List-Received-Date: Mon, 15 Jul 2019 12:00:17 -0000

On Fri, 7 Jun 2019 at 23:03, Alistair Francis <alistair.francis@wdc.com> wrote:
> At the moment this spec is in a draft state and is subject to change. As
> QEMU is extreamly useful in early bring up I think it makes sense for
> QEMU to support non-frozen extensions. I would like to decide with this
> series how QEMU will handle all future non-frozen extensions. That is a
> standard way that QEMU users can test future RISC-V extensions while
> still understanding things will change. One idea is just to disable it by
> default, another option is to maybe use the Kconfig to make it a compile
> time option which developers can use. Should we also display a warning
> when running non-frozen extensions?

We had an instance of this for Arm (though in fact the
relevant patches to QEMU didn't end up getting into master
before the spec was finalized in the end). My suggestion
would be at minimum:
 * by default non-frozen extensions should not be provided
 * they should be enabled via a command line option (cpu
   property) whose name starts with "x-", which is our standard
   way of flagging properties that are experimental and subject
   to change or removal in future QEMU versions

That way end-users know they're doing something non-standard
that won't necessarily be supported in future by newer versions
of QEMU, and if people copy recipes/commandlines/random guest
images off old blog posts there'll be a hint that there's a
reason why they don't work on newer QEMU that adheres to the
final spec.

thanks
-- PMM

