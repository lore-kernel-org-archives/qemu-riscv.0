Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iHXhb-0002hH-UT
	for mharc-qemu-riscv@gnu.org; Mon, 07 Oct 2019 14:25:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49729)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iHXhY-0002et-LP
 for qemu-riscv@nongnu.org; Mon, 07 Oct 2019 14:25:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iHXhX-00072N-EV
 for qemu-riscv@nongnu.org; Mon, 07 Oct 2019 14:25:44 -0400
Received: from mail-yb1-xb43.google.com ([2607:f8b0:4864:20::b43]:38484)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iHXhX-00071a-9q
 for qemu-riscv@nongnu.org; Mon, 07 Oct 2019 14:25:43 -0400
Received: by mail-yb1-xb43.google.com with SMTP id k10so1809853ybs.5
 for <qemu-riscv@nongnu.org>; Mon, 07 Oct 2019 11:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cs8zxU93aD8ynvB0tt+JhMRUQ4TwR66VJedOixxINHs=;
 b=OZ1MJaQrzXMbX/Fl3hbEeR5p7XUBoFuhIce8qlMx838m2pSQ1o15VL9I2fTi2WZIar
 DnwdU+HRW2S7y8hOzMSlvXeolP/Izz/9zNtFGV6kyCUdhXbkmbEBDJRtfHpms4LnL5oV
 bq3lIU8alKSNj/N2e2PoAgfe226mQoLhHb7D7f7HByQ06/ajKAmNbPgCfG3gv/aw4u6m
 mDQ/aXA2nQXhs+pYS6ffrJrhzhvYJLFWyP82Ms4ryYdpCcdBBI4U7UWeHyjM+iDt4Iqr
 WjwgXM1sFFiteQi4d3ze7zV4Xm2+er7eWaAgrKWefD/0fKZvIZ39dHw1xsVjq5X8d0vT
 l8UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cs8zxU93aD8ynvB0tt+JhMRUQ4TwR66VJedOixxINHs=;
 b=TZ9f7iGu7RSqnpe++qYGbpCDA6tDxubq/TDVF7TiMEDYhdrBLhygZoVa5AS0V4wcx4
 OI7nYNp2zXL3jaoEHmJ7T9DuT0fKpy5iAvtv+lNu/zksfW5czHfNAl1BP/EX+0g+1C4g
 Ga6AbShlh3UOGQEoUraTFcKHqhXBD75Yf6HhsZCtIYGO7PMpms/9naqyZfwz1bL5Nmph
 jyxngr9ivNJdA32ZKPP7RxlnZmPWWfMxYyaqhzS1FxR5kOT+ba6FaRsZCE89PemhoEeP
 bJ9NonUgYOabRM9iaUaNFYwbjHNPSJp9uNBgTkua1sPic/FUFzXt3IufB1kC5vdbCb0Q
 nQRA==
X-Gm-Message-State: APjAAAUSok4ghWZOjTl1CAvHtZozEFMmQzrk7nyzqjNc30ZRaeSjlNkZ
 aEtkSJoXpQHib7jlyAWRYTAhKw==
X-Google-Smtp-Source: APXvYqw7M4zeGpw+lqQPcGr0FVjgCOq+k7o0m8G4S4ptUI3KHcoq7plIlTTnuob53XnM9x04cO805Q==
X-Received: by 2002:a25:b7c8:: with SMTP id u8mr12240390ybj.212.1570472742310; 
 Mon, 07 Oct 2019 11:25:42 -0700 (PDT)
Received: from [192.168.1.44] (67.216.144.16.pool.hargray.net. [67.216.144.16])
 by smtp.gmail.com with ESMTPSA id a130sm4075650ywc.81.2019.10.07.11.25.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Oct 2019 11:25:41 -0700 (PDT)
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
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <3747223d-23ee-1f28-e165-b2b0c5746b68@linaro.org>
Date: Mon, 7 Oct 2019 14:25:16 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CACjxMEsw+Deh176JLP2aF4Pdkb_s8MiPApwMON-_K6ed61-Zyw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::b43
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
X-List-Received-Date: Mon, 07 Oct 2019 18:25:45 -0000

On 10/7/19 10:19 AM, Dayeol Lee wrote:
> Thank you very much for the clarification!
> 
> I found tlb_set_page with size != TARGET_PAGE_SIZE makes the translation way
> too slow; the Linux doesn't seem to boot.

To clarify, PMP specifies a range.  That range has only two end points.
Therefore, a maximum of 2 pages may be affected by a mis-aligned PMP boundary.

It sounds like you're getting size != TARGET_PAGE_SIZE for all pages.


r~

