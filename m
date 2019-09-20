Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iBRZs-0006dg-Fv
	for mharc-qemu-riscv@gnu.org; Fri, 20 Sep 2019 18:40:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33349)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@sifive.com>) id 1iBRZn-0006cj-2Y
 for qemu-riscv@nongnu.org; Fri, 20 Sep 2019 18:40:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@sifive.com>) id 1iBRZl-0008KF-7S
 for qemu-riscv@nongnu.org; Fri, 20 Sep 2019 18:40:30 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:33435)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@sifive.com>) id 1iBRZk-0008K1-VL
 for qemu-riscv@nongnu.org; Fri, 20 Sep 2019 18:40:29 -0400
Received: by mail-pl1-x642.google.com with SMTP id d22so2538355pls.0
 for <qemu-riscv@nongnu.org>; Fri, 20 Sep 2019 15:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=F7KhDBWvvRG4v4Y73mCUrfxmfjSUF1Jf74k4kp3VlZY=;
 b=bWNmqWNG3HmyhkqlwmT+2BKfMErmlMueueTjyRwp78SN/A0ijzwTbTFmEsKF2lWEZf
 lMuHk9k5nehQG6zHUBPb+85VGq8MgzgGEkN+rFSbK8AwEw5c6daUhrLxjcnsZxmXpWNj
 ftCgiGGVTTUHPSpOqNXHZDiDPzJA4Ll8iuIiN3qr0ionGZcZpL4F98SFsTmIbLewCvWO
 E1SdaXTRcGsQLNc9ld1xdecwxU4AKpIaX+xRw1Pu5S51ieTJiYQV9oDVFuGQCFCl79xU
 7eWomlpO5BH+Gw5CTODsakltNYiz0kW8gU2Yag94RdixJ0DoRubNvf0dpYf2AwQzau+V
 K9AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=F7KhDBWvvRG4v4Y73mCUrfxmfjSUF1Jf74k4kp3VlZY=;
 b=t0USFfFSbEI1x+N8z6UEELc6P4J7W85GSYY2vpOwwSMH/58njv3QjPOXnmc9ujzpoz
 mf+8cEXkQJ4qBlUOy/HyxzxFwERYrmJgtHx/RG9VDJCIsLASKmPVkIQ3nPHB5+9swqWm
 oqvYH3Ay0z45K1fAPQuMj6sro+UJEQKQs6kssRGN2w1kW5hwFNKu/GxX4DUS9nlnYtb2
 Xee6RhwbhvU4x+mDrGwzqTr+XGvq6HT75BiTV4/npuBVe3cqALg1jrE+14GBZWJL6ipN
 EbpuO9NgZ93UwNuVMcyndfuxYc3p8Q7RBGEksTltkBUxPpf/zkgnqkW4MYEIQURv+9Ix
 kiyQ==
X-Gm-Message-State: APjAAAUMeUK33AW+zAn1rZJu/CUbSm+QPeCLsjL9K+qM6wHd606Wq1/k
 35wxmEvwtCzNzLIgBW9cFaVuZw==
X-Google-Smtp-Source: APXvYqyf27puHe3FR6Ndq+Z1ZT6YyCVechBXtwKhw89KvWRRcXuHY4MnqgRpdvIP0u4v8JuGPNtIwg==
X-Received: by 2002:a17:902:b903:: with SMTP id
 bf3mr19905313plb.1.1569019227609; 
 Fri, 20 Sep 2019 15:40:27 -0700 (PDT)
Received: from localhost ([2607:fb90:5de:df7b:9794:c3bf:6169:a06c])
 by smtp.gmail.com with ESMTPSA id s24sm2674064pgm.3.2019.09.20.15.40.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Sep 2019 15:40:26 -0700 (PDT)
Date: Fri, 20 Sep 2019 15:40:26 -0700 (PDT)
X-Google-Original-Date: Fri, 20 Sep 2019 15:32:41 PDT (-0700)
Subject: Re: [PATCH v1 0/6]  RISC-V: Add more machine memory
In-Reply-To: <cover.1568931866.git.alistair.francis@wdc.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, alistair23@gmail.com
From: Palmer Dabbelt <palmer@sifive.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Message-ID: <mhng-7a5e8460-9140-4c81-8342-8854da4a3359@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
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
X-List-Received-Date: Fri, 20 Sep 2019 22:40:32 -0000

On Thu, 19 Sep 2019 15:24:51 PDT (-0700), Alistair Francis wrote:
> This series aims to improve the use of QEMU for developing boot code. It
> does a few things:
>
>  - sifive_u machine:
>    - Adds a chunk of memory in the Flash area. This allows boot loaders
>    to use this memory. I can't find details on the QSPI flash used on
>    the real board, so this is the best bet at the moment.

IIRC it's a is25wp256.

>    - Adds a chunk of memory in the L2-LIM area. This is actualy the L2
>    cache and should shrink as the L2 cache is enalbed. Unfortunatley I
>    don't see a nice way to shrink this memory.
>    - Adds a property that allows users to specify if QEMU should jump to
>    flash or DRAM after the ROM code.
>
>  - virt machine:
>    - Add the pflash_cfi01 flash device. This is based on the ARM virt
>    board implementation
>    - Adjusts QEMU to jump to the flash if a user has speciefied any
>    pflash.
>
> Both machines have been tested with oreboot, but this should also help
> the coreboot developers.
>
> Alistair Francis (6):
>   riscv/sifive_u: Add L2-LIM cache memory
>   riscv/sifive_u: Add QSPI memory region
>   riscv/sifive_u: Manually define the machine
>   riscv/sifive_u: Add the start-in-flash property
>   riscv/virt: Add the PFlash CFI01 device
>   riscv/virt: Jump to pflash if specified
>
>  hw/riscv/Kconfig            |  1 +
>  hw/riscv/sifive_u.c         | 77 +++++++++++++++++++++++++++++--
>  hw/riscv/virt.c             | 91 ++++++++++++++++++++++++++++++++++++-
>  include/hw/riscv/sifive_u.h | 11 ++++-
>  include/hw/riscv/virt.h     |  3 ++
>  5 files changed, 177 insertions(+), 6 deletions(-)

