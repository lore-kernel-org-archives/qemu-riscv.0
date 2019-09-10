Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i7g0k-0000Cd-A0
	for mharc-qemu-riscv@gnu.org; Tue, 10 Sep 2019 09:16:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37755)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1i7g0g-00009C-Sj
 for qemu-riscv@nongnu.org; Tue, 10 Sep 2019 09:16:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1i7g0f-0006fF-S6
 for qemu-riscv@nongnu.org; Tue, 10 Sep 2019 09:16:42 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:41283)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1i7g0f-0006ez-ML
 for qemu-riscv@nongnu.org; Tue, 10 Sep 2019 09:16:41 -0400
Received: by mail-wr1-f65.google.com with SMTP id h7so19157345wrw.8
 for <qemu-riscv@nongnu.org>; Tue, 10 Sep 2019 06:16:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=z9JvWVeEbyWm2+to6czdf1YkWTTv0yFivC2PxELEm94=;
 b=jrpgBtxYzGSFfaehhIH8/6SdNILQJwabWCG5DWaMlYtGaPHcuwARHYLcFFt2pgUqNM
 FPypPTxZxrnMyxUCENWMBevlHMjuyWG1+z0QK8uDzRJOQx/+iQbUcO5q5BaNcsuoLHct
 nTjHBgR8qc23Yowk1P+dtgRgoMRrgG/Y7uXKLhw0HwiVw2Jrp1hybFOKWLk8HzBNxOh3
 Bo3UDaOkK5Pi8YlXwOX0SMBzH3Yk7Gl7JHfZoB3BFgtNDZFBBBZ2lLIoCfOWdlO2qwfy
 jkMWPXFsx6FddEsahRA0haFJrU0tXlgbOzaDk00TwsKmA5pcaVsenJqaLzVNSdzy3TE3
 9ppA==
X-Gm-Message-State: APjAAAVNNEpMT306zj8iGccXL/I2dxVtjjWjZJ2s//9YGjRPcQ+Av+Fq
 lO0b11bQ/jUZM4IdBHUchTKb/A==
X-Google-Smtp-Source: APXvYqwDmhwDhs3WKG34RsEKvgP/Y5dPP7xlaHnoJVhfHzy5tbCIjgRPjR95sMtfnrwC6tmY9dMjLg==
X-Received: by 2002:adf:e30e:: with SMTP id b14mr26116154wrj.168.1568121400402; 
 Tue, 10 Sep 2019 06:16:40 -0700 (PDT)
Received: from localhost ([148.69.85.38])
 by smtp.gmail.com with ESMTPSA id o22sm32214327wra.96.2019.09.10.06.16.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2019 06:16:34 -0700 (PDT)
Date: Tue, 10 Sep 2019 06:16:34 -0700 (PDT)
X-Google-Original-Date: Tue, 10 Sep 2019 06:15:11 PDT (-0700)
In-Reply-To: <cover.1566573576.git.alistair.francis@wdc.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, alistair23@gmail.com,
 bmeng.cn@gmail.com
From: Palmer Dabbelt <palmer@sifive.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Message-ID: <mhng-d54ccfda-315c-4d9b-8b29-dd6cc43818e6@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.65
Subject: Re: [Qemu-riscv] [PATCH v4 0/7] RISC-V: Hypervisor prep work part 2
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
X-List-Received-Date: Tue, 10 Sep 2019 13:16:44 -0000

On Fri, 23 Aug 2019 08:21:06 PDT (-0700), Alistair Francis wrote:
>
> The first three patches are ones that I have pulled out of my original
> Hypervisor series at an attempt to reduce the number of patches in the
> series.
>
> These three patches all make sense without the Hypervisor series so can
> be merged seperatley and will reduce the review burden of the next
> version of the patches.
>
> The fource patch is a prep patch for the new v0.4 Hypervisor spec.
>
> The fifth patch is unreleated to Hypervisor that I'm just slipping in
> here because it seems easier then sending it by itself.
>
> The final two patches are issues I discovered while adding the v0.4
> Hypervisor extension.
>
> v4:
>  - Drop MIP change patch
>  - Add a Floating Point fixup patch
> v3:
>  - Change names of all GP registers
>  - Add two more patches
> v2:
>  - Small corrections based on feedback
>  - Remove the CSR permission check patch
>
>
>
> Alistair Francis (6):
>   target/riscv: Don't set write permissions on dirty PTEs
>   riscv: plic: Remove unused interrupt functions
>   target/riscv: Create function to test if FP is enabled
>   target/riscv: Update the Hypervisor CSRs to v0.4
>   target/riscv: Fix mstatus dirty mask
>   target/riscv: Use TB_FLAGS_MSTATUS_FS for floating point
>
> Atish Patra (1):
>   target/riscv: Use both register name and ABI name
>
>  hw/riscv/sifive_plic.c         | 12 ------------
>  include/hw/riscv/sifive_plic.h |  3 ---
>  target/riscv/cpu.c             | 19 ++++++++++--------
>  target/riscv/cpu.h             |  6 +++++-
>  target/riscv/cpu_bits.h        | 35 +++++++++++++++++-----------------
>  target/riscv/cpu_helper.c      | 16 ++++++++++++----
>  target/riscv/csr.c             | 22 +++++++++++----------
>  7 files changed, 58 insertions(+), 55 deletions(-)

Aside from that PTE patch, I've applied

    target/riscv: Use both register name and ABI name
    target/riscv: Fix mstatus dirty mask
    target/riscv: Use TB_FLAGS_MSTATUS_FS for floating point

on top of Bin's patch set, as the rest had made it into for-master.  Like we 
talked about at lunch, I'm not sure the PTE one is actually correct -- it might 
just be paranoia, though.

