Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hJgrZ-0000y5-9L
	for mharc-qemu-riscv@gnu.org; Thu, 25 Apr 2019 12:04:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44597)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1hJgrV-0000wD-Jn
	for qemu-riscv@nongnu.org; Thu, 25 Apr 2019 12:04:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1hJgrT-0002aZ-Ks
	for qemu-riscv@nongnu.org; Thu, 25 Apr 2019 12:04:37 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:39837)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1hJgrR-0002DL-L6
	for qemu-riscv@nongnu.org; Thu, 25 Apr 2019 12:04:35 -0400
Received: by mail-pf1-x441.google.com with SMTP id i17so132849pfo.6
	for <qemu-riscv@nongnu.org>; Thu, 25 Apr 2019 09:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=nhi46nyzqGvJUsRpUIwXn4Ih230PeA5yaDI3zHPp7Ds=;
	b=BmJtYZ8J/xD6ihOgyyLGqo61mqPXKAlGpeCk8eMy3BpSMGG2POxmqyAU9N+CSUs7KL
	8nMAsCjfk8bOCIer2qJCMMc3QD3UVRVHWOzyWTs11A++/MWBVHa09Gjmu9YnQv0OV3Yd
	4Tc1Sw57j/QoDOWyWi37a6blUJTV0WLMPNtD/V2z7y8VrfD6C3sWrcz5l1cz53B/y/qM
	ygZgAsk8/gs98MVSfYHMLxHOBQ5cY2BWGyAhnfCfWVj1Wk5kD+vhoCd1l2GFIOiZGzy6
	Xo9vTJvqXK3xqaEDMS95rcuNe7C9TTNX28rCID6VhlzLG6SQThxOTZgnOjupQ8CcMceT
	FlZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=nhi46nyzqGvJUsRpUIwXn4Ih230PeA5yaDI3zHPp7Ds=;
	b=YlYOHXQ1YxLAsL2/r/3QJKVRpqlGBGumTNwsBkpy/MsadEnGXvQQI8GzkSkY4GQ3dR
	9aXn7wEDbtPi+FmlgiWvCKc0StKCacaBWlfk0AYqj5ZcQPL5u6q/JvoMjl6eQGxvZQHw
	+RhVOw9rLryw0pkTg4yxQAc4L5SLz2rIzvYkn+bTmTzm6vD6Gn9OgoyCpR0cDLtx9dID
	8/LVqzvdiEB70O3rof9vBl8qOj514yTTc/HpnC10rAIgcw8JXTp7THg2EhwMLmxK/3xq
	fitEoMpX1ZeuQtjDkO9f4sN8JnDvff2OW5MeSdvKGV1fCbnsUXTZAJ0GY7tp8iJM0hWZ
	OOhg==
X-Gm-Message-State: APjAAAWYEYhHwza1E7kh8SpbJzz0hy2zXYRByNvzZQCj86bEBHzV+5tA
	0kp41rh0hODhk42gMEGLiWMIpg==
X-Google-Smtp-Source: APXvYqyIlxn0wfwgG/0VZcBZRmVPftZZeAGxbl4jWf0vnZTBM0WfYIenJQxdICDbQDiZ5BpSsFywlA==
X-Received: by 2002:a63:d84a:: with SMTP id k10mr37587766pgj.441.1556208266774;
	Thu, 25 Apr 2019 09:04:26 -0700 (PDT)
Received: from localhost ([134.134.139.92]) by smtp.gmail.com with ESMTPSA id
	a80sm46498455pfj.61.2019.04.25.09.04.25
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 25 Apr 2019 09:04:25 -0700 (PDT)
Date: Thu, 25 Apr 2019 09:04:25 -0700 (PDT)
X-Google-Original-Date: Thu, 25 Apr 2019 08:58:24 PDT (-0700)
In-Reply-To: <20190401031155.21293-1-richard.henderson@linaro.org>
CC: qemu-devel@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Alistair Francis <Alistair.Francis@wdc.com>, qemu-riscv@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: richard.henderson@linaro.org
Message-ID: <mhng-f96f6f0d-cec7-477e-96c8-af5485b43bc7@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: Re: [Qemu-riscv] [PATCH for-4.1 0/8] target/riscv: decodetree
 improvments
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
X-List-Received-Date: Thu, 25 Apr 2019 16:04:40 -0000

On Sun, 31 Mar 2019 20:11:47 PDT (-0700), richard.henderson@linaro.org wrote:
> There's new support in decodetree for pattern groups.
> I believe that patch 5, or something close to it, was
> posted as an RFC as part of the original pattern group
> patch set, but this cleans that up further.
>
>
> r~
>
>
> Richard Henderson (8):
>   target/riscv: Name the argument sets for all of insn32 formats
>   target/riscv: Use --static-decode for decodetree
>   target/riscv: Merge argument sets for insn32 and insn16
>   target/riscv: Merge argument decode for RVC shifti
>   target/riscv: Use pattern groups in insn16.decode
>   target/riscv: Split RVC32 and RVC64 insns into separate files
>   target/riscv: Split gen_arith_imm into functional and temp
>   target/riscv: Remove spaces from register names
>
>  target/riscv/cpu.c                      |  16 +-
>  target/riscv/insn_trans/trans_rvc.inc.c | 347 ------------------------
>  target/riscv/insn_trans/trans_rvi.inc.c |  20 +-
>  target/riscv/translate.c                |  40 ++-
>  target/riscv/Makefile.objs              |  15 +-
>  target/riscv/insn16-32.decode           |  28 ++
>  target/riscv/insn16-64.decode           |  30 ++
>  target/riscv/insn16.decode              | 154 ++++++-----
>  target/riscv/insn32.decode              |  10 +-
>  9 files changed, 205 insertions(+), 455 deletions(-)
>  delete mode 100644 target/riscv/insn_trans/trans_rvc.inc.c
>  create mode 100644 target/riscv/insn16-32.decode
>  create mode 100644 target/riscv/insn16-64.decode

Thanks!  I'm happy taking this as it stands, since all those decode issues I
pointed out aren't regressions in this patch set.  Let me know if you want to
fix those or if you want me to -- as you can probably tell my email queue is a
bit long... :)

I've dropped this on my integration branch, but I probably won't submit a pull
for a week or so.

