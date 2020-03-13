Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jClTO-0000Th-8R
	for mharc-qemu-riscv@gnu.org; Fri, 13 Mar 2020 10:39:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35201)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bmeng.cn@gmail.com>) id 1jClTK-0000JE-VS
 for qemu-riscv@nongnu.org; Fri, 13 Mar 2020 10:39:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1jClTK-0006Ic-2f
 for qemu-riscv@nongnu.org; Fri, 13 Mar 2020 10:39:34 -0400
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744]:40714)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1jClTH-00067m-U1; Fri, 13 Mar 2020 10:39:32 -0400
Received: by mail-qk1-x744.google.com with SMTP id m2so12814821qka.7;
 Fri, 13 Mar 2020 07:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=44w/yXzypDOsT7HO0jyj2OMeDtD4ttnIYtGEriwFSuc=;
 b=TlnBWd6FmTE86knBjLg7vroxAjkmzetACv+SXTozHvzgA2lf92b5HKu/a8/0omz/KC
 c0d/+zXe67Arp13XN/SoM1cnmPHp+5uqciTehNt5HPJGsI0f8vbG9jxeghvvH1c2747l
 5+G4aanf99K/H1RKokzro5FJw95HefjOJTEGgNlcStX1owEns63jTsYxpfRwpoO+1A9U
 FQNIiAoh/19fi3CRrPXAJxKakjtw7WRUFIyz+lCDaXnSLvg/9+XkV+XZr5k/hvtyGb0L
 BdE175lRLkqwUol9xC9iIbI8B/LFVE4se9pf2/FUt3bsmelcELxqLfy/6/wTshW8TJ9d
 0edA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=44w/yXzypDOsT7HO0jyj2OMeDtD4ttnIYtGEriwFSuc=;
 b=LseWe5gQTcGjSl88mG85B3SDdce05Ve+KZx7+NZLkqiWBYxOWCERo/hX+KPL1mkEsk
 9UTCQF21RyY10EfaRcPIeRd4MCw0M7p2tilSaziE014nn4hFWPYwAcKJQxtK8/aGaXdx
 ZxlfRmDZD+FGJ/rKT6GpoZJptd4EM7f1zUpFs6gYbgFlZDQMO56sqRkdqIagMcbD4hod
 qeayHadiqW/Wj/XCIPAq+xf23DDqzx7YnWB9JgpIJEsWa44DiDjdI8PXHiMWGwkEgKQL
 bltBAEDMO1v1LG4IhvQ8f8S3Iyr8Bj0duAmmFxCO1VmUaalv8f6kb8KN4QWe1NJDli4n
 65nA==
X-Gm-Message-State: ANhLgQ1KqR6iwWwvepxfQZr80c5vtQ4qc+1JfqsPZnuznSYQJAZt1vmS
 0zSf4isL2IHRfHDayNk/8LosGHb+OGolgz8TTsw=
X-Google-Smtp-Source: ADFU+vtsj11dQDDpuIXzfmmG+DxL1oS6r1O5lhlqPfZUWlf87RTNuXSKLcb4nUhSlvFyemveYds4NOxTdw21QSY5Z/0=
X-Received: by 2002:a25:84c6:: with SMTP id x6mr5471940ybm.56.1584110370891;
 Fri, 13 Mar 2020 07:39:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200313005508.1906-1-coreyw7@fb.com>
 <20200313005508.1906-2-coreyw7@fb.com>
In-Reply-To: <20200313005508.1906-2-coreyw7@fb.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 13 Mar 2020 22:39:20 +0800
Message-ID: <CAEUhbmVP__C6F8J+c0pcjcqCCp-q1waO=Kgr6k+QAd+3HLnj+A@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv: sifive_e: Support changing CPU type
To: Corey Wharton <coreyw7@fb.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::744
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
X-List-Received-Date: Fri, 13 Mar 2020 14:39:36 -0000

On Fri, Mar 13, 2020 at 8:57 AM Corey Wharton <coreyw7@fb.com> wrote:
>
> Allows the CPU to be changed from the default via the -cpu command
> line option.
>
> Signed-off-by: Corey Wharton <coreyw7@fb.com>
> ---
>  hw/riscv/sifive_e.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

