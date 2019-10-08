Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iHg1V-0008V4-99
	for mharc-qemu-riscv@gnu.org; Mon, 07 Oct 2019 23:18:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55494)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iHg1S-0008Ur-VX
 for qemu-riscv@nongnu.org; Mon, 07 Oct 2019 23:18:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iHg1R-0000jL-Pl
 for qemu-riscv@nongnu.org; Mon, 07 Oct 2019 23:18:50 -0400
Received: from mail-yw1-xc43.google.com ([2607:f8b0:4864:20::c43]:41588)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iHg1R-0000j6-Kk
 for qemu-riscv@nongnu.org; Mon, 07 Oct 2019 23:18:49 -0400
Received: by mail-yw1-xc43.google.com with SMTP id 129so5934968ywb.8
 for <qemu-riscv@nongnu.org>; Mon, 07 Oct 2019 20:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=b5yIKmmNoKJrilF6g3EXjAEu9BhFAIhQDCBPbmUikMY=;
 b=VYqkHCtAnHYMzjHqblHLvsMEANl7+Oyg7EJw9OLHD5H59u+zKMwBffPMIumEKUsU8t
 zDRdEyIUiON7P8DwCE2jwR6CG/cMYdFYnLzs1lsd7wONmMY0BijxKyv8xxsmieur6Meg
 BZxA+lENLR60/AKHlql6hLq7xwd5GQ77ewIzkZJzWrgVV9jcNRI9jMhbCe9P1XVcgOMk
 zCRP9GWwp+6GfThmXDJw1wzyBVujGYBWjW8iBHfoKdiWYngTNtsliukvHKQc6MzsgeRx
 37OQD3Kxbz4FFqhyTXBsE+81vRHPMdDeZwtM19qY0CD85gUNkNb3rM6FCZZZJBNguaLK
 j0ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=b5yIKmmNoKJrilF6g3EXjAEu9BhFAIhQDCBPbmUikMY=;
 b=nxE/+alCwRwChL0L0zenno7vFj6/MhI67IpnQAW2fmAekSY5ibebyBiuxFUqpv8TX3
 aRNzjVloMWgMYJvt/8WpyaNv2HeZf7Q04NBZ1vZPVQJqGFr4BjV4kG4wQ6mrdsSO2vyS
 FH7401FGzQ8MJ8AlYzVkPj7OFbtPZipmDrwfvNYYzwk2ICZ6KES6YYFuoSP1QrC5V+UD
 IgtnTIp458ggRWOIDOtJK1oA8cNy1vErIitNeYTtZ8GL5tRbBq2qQ5u9j0j1m0K1wxq1
 iPlrlUEsFgTkttDVVVz7511QUzJIyiOk24ZKfoQO3EIdZsitPk3794SQ7a+Q9lmPRR/C
 ichQ==
X-Gm-Message-State: APjAAAXR4TRLGqq133rjPESuv6EbZRA0jbx6vtogCOaRXaGEbIEFfoEv
 RXL7eM0uN3eZj3GlLBs++vu3eg==
X-Google-Smtp-Source: APXvYqwVxZ1mFJGsFOjEybvI6UCk4L/2uklWE5f5Td+iWydo4mnk1Hql2GwBcMtDx3XmknDHiiG3xg==
X-Received: by 2002:a0d:e301:: with SMTP id m1mr22389524ywe.243.1570504728607; 
 Mon, 07 Oct 2019 20:18:48 -0700 (PDT)
Received: from [192.168.1.44] (67.216.144.16.pool.hargray.net. [67.216.144.16])
 by smtp.gmail.com with ESMTPSA id g1sm4282639ywk.53.2019.10.07.20.18.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Oct 2019 20:18:47 -0700 (PDT)
Subject: Re: [PATCH] target/riscv: PMP violation due to wrong size parameter
To: Dayeol Lee <dayeol@berkeley.edu>
Cc: qemu-devel@nongnu.org, "open list:RISC-V TCG CPUs"
 <qemu-riscv@nongnu.org>, Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>
References: <20191007052813.25814-1-dayeol@berkeley.edu>
 <5583387c-5c5b-8890-999b-2ba4d75cd69d@linaro.org>
 <CACjxMEsw+Deh176JLP2aF4Pdkb_s8MiPApwMON-_K6ed61-Zyw@mail.gmail.com>
 <3747223d-23ee-1f28-e165-b2b0c5746b68@linaro.org>
 <CACjxMEtPRxTQdOYFL97G7aYXC6KTBuGY2avf1bPJLYGEpURh=Q@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <4cfde72b-9a31-a6c5-a7af-a3418a750f3a@linaro.org>
Date: Mon, 7 Oct 2019 23:18:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CACjxMEtPRxTQdOYFL97G7aYXC6KTBuGY2avf1bPJLYGEpURh=Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::c43
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
X-List-Received-Date: Tue, 08 Oct 2019 03:18:52 -0000

On 10/7/19 11:41 AM, Dayeol Lee wrote:
> if pmp_hart_has_privs() gets addr=0x2000 and size=0,
> pmp_hart_has_privs() will ALWAYS return false because the code assumes size > 0.
> It checks if (addr) and (addr + size - 1) are within the PMP range for each PMP
> entry.

You certainly could do

    if (size == 0) {
        size = -(addr | TARGET_PAGE_MASK);
    }

to assume that all bytes from addr to the end of the page are accessed.  That
would avoid changing too much of the rest of the logic.

That said, this code will continue to not work for mis-aligned boundaries.

r~


> (addr + size - 1) is supposed to be the last byte address of the memory access,
> but it ends up with (addr - 1) if size = 0.
> Thus, pmp_hart_has_privs() returns false as (addr - 1) = 0x1fff is within the
> range, and addr = 0x2000 is out of the range (partial match violation).


