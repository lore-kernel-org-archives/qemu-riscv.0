Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iVant-0000OH-2V
	for mharc-qemu-riscv@gnu.org; Fri, 15 Nov 2019 07:34:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45412)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iVanp-0000KQ-Jj
 for qemu-riscv@nongnu.org; Fri, 15 Nov 2019 07:34:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iVano-0003R3-CC
 for qemu-riscv@nongnu.org; Fri, 15 Nov 2019 07:34:17 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:38221)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iVano-0003Qs-48
 for qemu-riscv@nongnu.org; Fri, 15 Nov 2019 07:34:16 -0500
Received: by mail-oi1-x243.google.com with SMTP id a14so8474616oid.5
 for <qemu-riscv@nongnu.org>; Fri, 15 Nov 2019 04:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SJJTS0yn2SzMU9d/U32LoplYPG4IeTJT1EFwP24QH68=;
 b=G2Zwq6bFTk9Pg1SDQFt03tgbp/8HP23R964fhdwzIYGZ5uhRwbnLUFXyHMV8hOE/sx
 GaSQzZjoAohOziL39IXg80O2pgjSJPqUr+DniU5hKGCblbnVKWHq9Uzto8JZTbYadyMn
 j8ELLi5Dk39cwhPy8nr5ijPXQfsk4xof8FY36CZu/9D7T2EPxVhUT70HyNSZ3/vbDWL4
 KrxHBcyq1/M8GFNjhryKt3LdFRUTtXGciFGQuHpzFMq+stlq89yOcC/ef9a/nnAawRx7
 MKUeEqB2S4RthN3GkAeCERMrsfP/gD9x+llH6pPIEMEnGyhBxDgB7yXQVskbpI1Tq9SW
 BWDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SJJTS0yn2SzMU9d/U32LoplYPG4IeTJT1EFwP24QH68=;
 b=R+yXGivTcz7fdgWkGNxOtAB5GbkiwvLy5OPfWKvNzLxX1imLvkE907IobOfWfTTaaO
 NL+msTtIIagXhw45t6/ha6+BygCYeVuSi61P/kxgX448gf/3seOgqJTOtwlJxvAJy7n8
 CxpPprIgLfLGbCpMjnGb4VDUHpuy15WoUTpU/aJVHIQqcM2PrOfasOiccF3PdupUyEmJ
 uYSeE8UTUaeMEbKVdOuVWib/TlqBfTV3mA2yeU1NqhdO6blejtNMzj1CS9xtjLoA0V/n
 jBCdJ7NEpGXKZklslHtvQkcTFYr0/GOn6wKUJb8mBS1wPpf6k9z8wV7Za7l/ScYrN5AD
 lHDA==
X-Gm-Message-State: APjAAAVo+tMkGtsZSvMMehp2HHCZKC6EOAwnJpgiDdFo4DwvzbE2mVOn
 mu0fqOZD1zvyqdZBk6Um0yfYUqch93c7g0XgUKf3QA==
X-Google-Smtp-Source: APXvYqyK5/jCgix7uj8q9hQmllGYjLkGC3cjmuj6ReJKHWEPM9kN25l0Xwr+PiSZm/wePAO068qXPS+XZiXRnYhnCoM=
X-Received: by 2002:a05:6808:b04:: with SMTP id
 s4mr7787822oij.163.1573821255158; 
 Fri, 15 Nov 2019 04:34:15 -0800 (PST)
MIME-Version: 1.0
References: <20191115044104.4197-1-palmer@dabbelt.com>
In-Reply-To: <20191115044104.4197-1-palmer@dabbelt.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Nov 2019 12:34:04 +0000
Message-ID: <CAFEAcA-DPTHcLMKa7TZrftSV00nAjt+AxqPWV81-mXHxf+PJ2g@mail.gmail.com>
Subject: Re: [PULL] RISC-V Fixes for 4.2-rc2
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Fri, 15 Nov 2019 12:34:19 -0000

On Fri, 15 Nov 2019 at 04:41, Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> The following changes since commit aa464db69b40b4b695be31085e6d2f1e90956c89:
>
>   Update version for v4.2.0-rc1 release (2019-11-12 18:40:02 +0000)
>
> are available in the Git repository at:
>
>   git@github.com:palmer-dabbelt/qemu.git tags/riscv-for-master-4.2-rc2
>
> for you to fetch changes up to 6911fde41006b2afe3510755c4cff259ca56c1d9:
>
>   riscv/virt: Increase flash size (2019-11-14 09:53:28 -0800)
>
> ----------------------------------------------------------------
> RISC-V Fixes for 4.2-rc2
>
> This contains a handful of patches that I'd like to target for 4.2:
>
> * OpenSBI upgrade to 0.5
> * Increase in the flash size of the virt board.
> * A non-functional cleanup.
> * A cleanup to our MIP handling that avoids atomics.
>
> This passes "make check" and boots OpenEmbedded for me.
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.2
for any user-visible changes.

-- PMM

