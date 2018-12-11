Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gWqpU-0006Yb-Kq
	for mharc-qemu-riscv@gnu.org; Tue, 11 Dec 2018 17:48:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40846)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gWqpR-0006WK-34
	for qemu-riscv@nongnu.org; Tue, 11 Dec 2018 17:48:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gWqpN-0007TO-Qp
	for qemu-riscv@nongnu.org; Tue, 11 Dec 2018 17:48:36 -0500
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:34313)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gWqpN-0007S6-8m
	for qemu-riscv@nongnu.org; Tue, 11 Dec 2018 17:48:33 -0500
Received: by mail-pf1-x442.google.com with SMTP id h3so7850036pfg.1
	for <qemu-riscv@nongnu.org>; Tue, 11 Dec 2018 14:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=URBCZm7xV3qmiPerxtUlIcDBr7+Hv3BNJlbauL+jNQw=;
	b=k3vfPPo1CmynY8/ngRHH/Xd3PPeyhJYnfu1c9e0JuAtFplwiqypMezHn61JCasEgbQ
	MSMvnqv/CBxnmU6xGFAIPirDywxmz2IEeS08fDiVUVKFo+/S1nZaDu+7aYMAhSLccksg
	ps2g+zSES+0BdjOxGddWAjly0q960OMRmZ039IF2lRogA1DZ62jFRQbEsMlX021KH4go
	eYwlfFssdqHLn0sud7/6hNkA7Lsbh5UhtpV7yMD4dBaQTSRLsALstixEC0FvXMasTdbG
	Jc23VrpHgOdXrBG0pZj1YMD2clMiqC5vPtFsZAfTEkBqBA9Tl3R+3g3i19Ox/PlWG8tZ
	paDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=URBCZm7xV3qmiPerxtUlIcDBr7+Hv3BNJlbauL+jNQw=;
	b=AtTulUDn06A98h9FNzk3+wV8ylL7NCSRD0QEv+T68ZtlkcAnmZH9B9ZzfuvxI/a6N2
	+hpG1LMU4TaLo/nMaGOstD8fYenwdS0XJHyYOjrQKrE97DiChbXMTYIhWWU7UkMN4DX/
	xtn1h1wUto9V0CsLU2Wo9EBPlU0nag68DVGrrSZ7AV9XaAwpaoeT5I0DeZW9LwaHrTxg
	wmvnDeNkeF9/pyKaiJZtFr48W9xE+fPRTkD+6MZxXIDKFMXibTFCVra2iLrAMz54cIk4
	nezCDanXpfFSf6mfuybWBivsNsF5Z96i920mWFwO31Wdp4gBaSWpF9UxgaZDSM/ZJtNi
	VCWA==
X-Gm-Message-State: AA+aEWbdge27WRb7Q0YfcP5IaLgcinfekZf4aMwlP6oTR9li4oIBfOPN
	GrsB1KRTJpBEy9AjstbFvhs9Hw==
X-Google-Smtp-Source: AFSGD/XODJsV7CxxTZ/Rd5b4YcKtvx/obVM1yO71ZCTYqhfFWZ7fQ7gyFUzlnl85mw5XchO/eS1NUQ==
X-Received: by 2002:a63:4a4d:: with SMTP id j13mr16562417pgl.127.1544568511888;
	Tue, 11 Dec 2018 14:48:31 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	e128sm20863147pfe.67.2018.12.11.14.48.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Dec 2018 14:48:31 -0800 (PST)
Date: Tue, 11 Dec 2018 14:48:31 -0800 (PST)
X-Google-Original-Date: Tue, 11 Dec 2018 14:48:24 PST (-0800)
In-Reply-To: <cover.1544567709.git.alistair.francis@wdc.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
	Alistair Francis <Alistair.Francis@wdc.com>, alistair23@gmail.com,
	stephen@eideticom.com
From: Palmer Dabbelt <palmer@sifive.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Message-ID: <mhng-b51f090f-6ece-4e17-9527-04f73763de4d@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::442
Subject: Re: [Qemu-riscv] [PATCH v8 0/4] Connect a PCIe host and graphics
 support to RISC-V
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
X-List-Received-Date: Tue, 11 Dec 2018 22:48:39 -0000

On Tue, 11 Dec 2018 14:37:07 PST (-0800), Alistair Francis wrote:
> This series is now ready to be merged, all of the patches are reviewed
> and tested.
>
> Palmer can you take this with all the other RISC-V patches sent during
> the freeze?

Yep, I'll be collecting everything this week.

Thanks!

>
> V8:
>  - Drop SiFive U support
>  - Drop legacy -nic support
>  - Small other review changes
> V7:
>  - Fix the GPEX memory mapping thanks to Bin Meng
>  - Fix the interrupt mapping thanks to Logan Gunthorpe
> V6:
>  - Fix the interrupt issue for the GPEX device
> V5:
>  - Rebase
>  - Include pci.mak in the default configs
> V4:
>  - Fix the spike device tree
>  - Don't use stdvga device
> V3:
>  - Remove Makefile config changes
>  - Connect a network adapter to the virt device
> V2:
>  - Use the gpex PCIe host for virt
>  - Add support for SiFive U PCIe
>
>
> Alistair Francis (4):
>   hw/riscv/virt: Increase the number of interrupts
>   hw/riscv/virt: Adjust memory layout spacing
>   hw/riscv/virt: Connect the gpex PCIe
>   riscv: Enable VGA and PCIE_VGA
>
>  default-configs/riscv32-softmmu.mak |   8 +-
>  default-configs/riscv64-softmmu.mak |   8 +-
>  hw/riscv/virt.c                     | 147 ++++++++++++++++++++++++++--
>  include/hw/riscv/virt.h             |  15 ++-
>  4 files changed, 165 insertions(+), 13 deletions(-)
>
> -- 
> 2.19.1

