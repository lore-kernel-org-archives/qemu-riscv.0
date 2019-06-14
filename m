Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hbimx-0005xr-Mh
	for mharc-qemu-riscv@gnu.org; Fri, 14 Jun 2019 05:46:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43371)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hbimr-0005vI-Jr
 for qemu-riscv@nongnu.org; Fri, 14 Jun 2019 05:46:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hbimp-0001KP-GK
 for qemu-riscv@nongnu.org; Fri, 14 Jun 2019 05:46:21 -0400
Received: from mail-yw1-f66.google.com ([209.85.161.66]:41432)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hbimn-0001IH-Mm
 for qemu-riscv@nongnu.org; Fri, 14 Jun 2019 05:46:18 -0400
Received: by mail-yw1-f66.google.com with SMTP id y185so827189ywy.8
 for <qemu-riscv@nongnu.org>; Fri, 14 Jun 2019 02:46:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=cK4IHru9NjtoK1j7sPnIwHPmoDOk1U9/R6+MGUtxwxM=;
 b=laxfl0YQYVNqwM3s7Paw3p6MYU3VL0XOBQOcjCPj7J5sAgLFA84vk3JUrTmOcGVTFg
 FFzkYcL3rGZ1YuTOwNH9jR9UaJBzp175gCzae/VpX4uCJMvpInbWhnlX5upGvojR2I2/
 CaJ3UYcmHILKIagHP3HduAf/BTu1lrbXtFGsMXJ70aemsBruju2PlekivlPpepvz2fF+
 DkA8vG+2wLRrjypx6FxXC0rtm1Ta20VOMrpZfxu2fmzbaovZyOTjap001CiR5CgM2X/U
 ducZ6mITN88AO//NXHD12BZCJ9mLsZfNepQJYfC9hMgfH5yN+JbcogKmzXqIrc/kMaaa
 sMTQ==
X-Gm-Message-State: APjAAAVI7t0wg5oavfpSkz3va+/wOUWJIwEXlpECICIXHptVXuLNUlvA
 IkN25oydAjKmxwKXjAUrneS5OQ==
X-Google-Smtp-Source: APXvYqwSxlAaD/UdXNQxiqJIeb1XUQ3SEVwE8D0U2XrWpwLqMcImTpWEULlQXDxLPzTsXCJyVB1qxw==
X-Received: by 2002:a81:3250:: with SMTP id y77mr37829602ywy.437.1560505575907; 
 Fri, 14 Jun 2019 02:46:15 -0700 (PDT)
Received: from localhost ([83.137.6.186])
 by smtp.gmail.com with ESMTPSA id j127sm642757ywe.32.2019.06.14.02.46.14
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 02:46:15 -0700 (PDT)
Date: Fri, 14 Jun 2019 02:46:15 -0700 (PDT)
X-Google-Original-Date: Fri, 14 Jun 2019 02:45:46 PDT (-0700)
In-Reply-To: <cover.1558131003.git.alistair.francis@wdc.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, alistair23@gmail.com
From: Palmer Dabbelt <palmer@sifive.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Message-ID: <mhng-0be72427-39c4-40d8-b88d-d050ec1591bb@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.161.66
Subject: Re: [Qemu-riscv] [PATCH v1 0/4] Miscellaneous patches from the
 RISC-V fork
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
X-List-Received-Date: Fri, 14 Jun 2019 09:46:23 -0000

On Fri, 17 May 2019 15:10:56 PDT (-0700), Alistair Francis wrote:
> This should be the last series bringing the patches from the RISC-V fork
> into mainline QEMU.
>
> Dayeol Lee (1):
>   target/riscv: Fix PMP range boundary address bug
>
> Michael Clark (3):
>   disas/riscv: Disassemble reserved compressed encodings as illegal
>   disas/riscv: Fix `rdinstreth` constraint
>   target/riscv: Implement riscv_cpu_unassigned_access
>
>  disas/riscv.c             | 53 ++++++++++++++++++++++++++-------------
>  target/riscv/cpu.c        |  1 +
>  target/riscv/cpu.h        |  2 ++
>  target/riscv/cpu_helper.c | 16 ++++++++++++
>  target/riscv/pmp.c        |  2 +-
>  5 files changed, 55 insertions(+), 19 deletions(-)

There's some minor issues with two of these, but since they're all independent
I'm going to take the other two right now.

Thanks!

