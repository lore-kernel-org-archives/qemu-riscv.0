Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hZP3f-0001Ya-Nv
	for mharc-qemu-riscv@gnu.org; Fri, 07 Jun 2019 20:18:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52155)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <palmer@dabbelt.com>) id 1hZP3W-0001Su-VP
 for qemu-riscv@nongnu.org; Fri, 07 Jun 2019 20:18:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1hZOpl-0004Lk-6I
 for qemu-riscv@nongnu.org; Fri, 07 Jun 2019 20:03:46 -0400
Received: from mail-pg1-f173.google.com ([209.85.215.173]:37428)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hZOpl-0004L0-0M
 for qemu-riscv@nongnu.org; Fri, 07 Jun 2019 20:03:45 -0400
Received: by mail-pg1-f173.google.com with SMTP id 20so1955758pgr.4
 for <qemu-riscv@nongnu.org>; Fri, 07 Jun 2019 17:03:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=UfN5Ps3CxtjSBHqQrng8JFYxHCePUVvB/RK4caGxegE=;
 b=PE5oRCppPGR2N54eKpDNinl5R2dP2H4OYuneqLYpK+cDHMY2zCwZ9E+AbyidsoM9Ac
 XOzcpr9Xwiu5CS7DLwhq2fckQ6yViDl4yyCuipcRCzVglWbdxTki+bSioLqKGf5S4G6L
 ihb+JY9de+3nJDOdsghB6SiaHcSsABf0yo8NzDgoqZ4m/Gppb6sO3qLHInzWlokgq84D
 zO1f33VJpWJbCP8tcAcxVngjtxb85xBbU4Nh8CliDE4XWeAdjqt8aHtd9FPAgpxnfaAk
 uoIzL9vrxI4roX4QfQSkCwaRnrEdjNOnAz+RVtTntxWPj3AEvIu0d4L3/pcMqG/rIKq2
 rrng==
X-Gm-Message-State: APjAAAUWXvKj3W2qpqnGtDT1A7BGn04M0XEVzNqYbrsCWsGb+EKmk5j+
 gtexcrY6q/2zzCYhlG19wq6VFw==
X-Google-Smtp-Source: APXvYqxLOtjJ8txr5e2SZBJiTpv+o2h73W6IxX0mMTiNexNGwOmP1HUhyrT8RbAz6kTAYlR1vSzFqg==
X-Received: by 2002:a17:90a:778c:: with SMTP id
 v12mr8092548pjk.141.1559952223220; 
 Fri, 07 Jun 2019 17:03:43 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id t25sm2849200pgv.30.2019.06.07.17.03.42
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 07 Jun 2019 17:03:42 -0700 (PDT)
Date: Fri, 07 Jun 2019 17:03:42 -0700 (PDT)
X-Google-Original-Date: Fri, 07 Jun 2019 16:16:54 PDT (-0700)
In-Reply-To: <CAKmqyKMs4nt0eddFkXHG9vOdxnj=yB8jx8s9NivNiwvVg8TObA@mail.gmail.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, sagark@eecs.berkeley.edu,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Alistair Francis <Alistair.Francis@wdc.com>, onathan@fintelia.io
From: Palmer Dabbelt <palmer@sifive.com>
To: alistair23@gmail.com
Message-ID: <mhng-03d5c9ed-4818-4efc-99e0-cdceab2eab3d@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.215.173
Subject: Re: [Qemu-riscv] RISC-V: Include ROM in QEMU
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
X-List-Received-Date: Sat, 08 Jun 2019 00:18:00 -0000

On Thu, 06 Jun 2019 16:22:47 PDT (-0700), alistair23@gmail.com wrote:
> Hello,
>
> As a test of the waters, how would the QEMU community feel about
> including the RISC-V OpenSBI project as a ROM submodule?
>
> The idea would be to have OpenSBI (similar to ATF for ARM and a BIOS
> for x86) included by default to simplify the QEMU RISC-V boot process
> for users. This would remove the requirement for users/developers to
> build a RISC-V firmware. The goal here is to allow people to just
> download and run their kernel as easily as they currently do for x86.
>
> We would make sure that it can be disabled! That is users/developers
> can use their own (or none) if they want to. The idea here is just to
> simplify the boot process, not lock anyone out.

I like it.  My only question is about the mechanics of doing so: are we just
going to assume there's a cross compiler in PATH?  I guess that's less of a
usability headache than needing a complier and a firmware.

