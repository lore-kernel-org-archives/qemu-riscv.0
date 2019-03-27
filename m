Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h95oF-00084Z-NU
	for mharc-qemu-riscv@gnu.org; Wed, 27 Mar 2019 06:29:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45740)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h95oD-00082N-LP
	for qemu-riscv@nongnu.org; Wed, 27 Mar 2019 06:29:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h95oC-0001Ko-CM
	for qemu-riscv@nongnu.org; Wed, 27 Mar 2019 06:29:25 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:37108)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h95oC-0001Jd-2F
	for qemu-riscv@nongnu.org; Wed, 27 Mar 2019 06:29:24 -0400
Received: by mail-pf1-x444.google.com with SMTP id 8so9499731pfr.4
	for <qemu-riscv@nongnu.org>; Wed, 27 Mar 2019 03:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=TGtLX9t84s/c2sZq7BNLqM7lFJ4ze4bSl9it26O8He8=;
	b=Xw9L7NAEauu9d+q3Z3R2ok2AlRajESorU8D5Ye1HUVJZS2cVGaObekkLfH4+1GIbQ7
	acqFAYmh7p2IJUVzheFY20oaCJ4DxZjHdRv1iIf+APgyRNmhTGg76N7a2NVoa0xPOtny
	Z2yrmBYCpeE6rNsZ0YC47crNVT9LK2t1X0J0jvrM/peXG2WZy2JKogoQ2457ceDPpBHJ
	8VbNPwyCS4gP+KhzPDEa8w+PnciBTH+UsPsLfRF/aGcWM53uWYyOVn4xJlqDBzzE5T52
	2Gtz/rq4/7bBVqki8r4ZitHX4qbQ7uH/m8gvKSEycPFRKSI4M98SwHKOK65A+HWbn073
	EPxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=TGtLX9t84s/c2sZq7BNLqM7lFJ4ze4bSl9it26O8He8=;
	b=Fl60pRh3cU31q/toxBatDA0lN5teFZ8SKzb9O8Q46Y17R50S3SHFhUZvkhBCrRBSK8
	Gi+7JwTOPHuodH8GAo3Yo5hG9/yPhbpIL08E0QhxQ+ubK2QwZAlg/XLJMAaHCfNt3T0r
	voNwgG3leSiWHJL7th4h3ijSYGmwTM/9KF+NqRMZCc6GpVJDkEJYOcCIfWdNV1mpUZWz
	UNJhQkmnKlykRI6x9vCtPo0Tf6ETZpy9PBx0pNY43r0kP1K+wnS64COxVXYURT9oNhgc
	ugB2do6ObTzLhow7LDYAQlGRYgL1lV5a4R5rQxZpH09k1SDbXrhqgpnbaeSFblL9CQAO
	f+RQ==
X-Gm-Message-State: APjAAAWFHhJxaFSXjgPbEn3StgGeql4JoGJh2RFBGRz1n4/XNBQva5DK
	GqsqDh0VRNgiMrcph58R8+BY2Q==
X-Google-Smtp-Source: APXvYqxBLNuCRGbX8/GJh6O50Ms/5LZV1Klh0rdhc15CvnvFJZVE4FC2kwTi9GDXE11f5GgeKs9qpw==
X-Received: by 2002:a62:fb10:: with SMTP id x16mr34686344pfm.5.1553682562747; 
	Wed, 27 Mar 2019 03:29:22 -0700 (PDT)
Received: from localhost
	(2001-b011-7001-168c-9355-f21f-1416-8b19.dynamic-ip6.hinet.net.
	[2001:b011:7001:168c:9355:f21f:1416:8b19])
	by smtp.gmail.com with ESMTPSA id g2sm791043pfd.134.2019.03.27.03.29.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Mar 2019 03:29:21 -0700 (PDT)
Date: Wed, 27 Mar 2019 03:29:21 -0700 (PDT)
X-Google-Original-Date: Wed, 27 Mar 2019 03:29:18 PDT (-0700)
In-Reply-To: <7efcf90aa1cc78d1ce2c5f823a7ff9ac96c379ed.1553129005.git.alistair.francis@wdc.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
	Alistair Francis <Alistair.Francis@wdc.com>, alistair23@gmail.com
From: Palmer Dabbelt <palmer@sifive.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Message-ID: <mhng-5414d791-e26f-4d3d-aec0-1d11191ddace@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: Re: [Qemu-riscv] [PATCH for 4.0 v1 1/5] riscv: plic: Fix incorrect
 irq calculation
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
X-List-Received-Date: Wed, 27 Mar 2019 10:29:26 -0000

On Wed, 20 Mar 2019 17:46:09 PDT (-0700), Alistair Francis wrote:
> The irq is incorrectly calculated to be off by one. It has worked in the
> past as the priority_base offset has also been set incorrectly. We are
> about to fix the priority_base offset so first first the irq
> calculation.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/riscv/sifive_plic.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/riscv/sifive_plic.c b/hw/riscv/sifive_plic.c
> index 1c703e1a37..70a85cd075 100644
> --- a/hw/riscv/sifive_plic.c
> +++ b/hw/riscv/sifive_plic.c
> @@ -206,7 +206,7 @@ static uint64_t sifive_plic_read(void *opaque, hwaddr addr, unsigned size)
>      if (addr >= plic->priority_base && /* 4 bytes per source */
>          addr < plic->priority_base + (plic->num_sources << 2))
>      {
> -        uint32_t irq = (addr - plic->priority_base) >> 2;
> +        uint32_t irq = ((addr - plic->priority_base) >> 2) + 1;
>          if (RISCV_DEBUG_PLIC) {
>              qemu_log("plic: read priority: irq=%d priority=%d\n",
>                  irq, plic->source_priority[irq]);
> @@ -279,7 +279,7 @@ static void sifive_plic_write(void *opaque, hwaddr addr, uint64_t value,
>      if (addr >= plic->priority_base && /* 4 bytes per source */
>          addr < plic->priority_base + (plic->num_sources << 2))
>      {
> -        uint32_t irq = (addr - plic->priority_base) >> 2;
> +        uint32_t irq = ((addr - plic->priority_base) >> 2) + 1;
>          plic->source_priority[irq] = value & 7;
>          if (RISCV_DEBUG_PLIC) {
>              qemu_log("plic: write priority: irq=%d priority=%d\n",

I think this breaks bisectability and should be merged with the 
*_PLIC_PRIORITY_BASE modifications as otherwise we'll end up the priority being 
set for the brong IRQ.

I'm also not sure how this fixes the bug listed in the OpenSBI PR.  As far as I 
can understand it, all this does is ensure that source 0 is actually treated as 
illegal (and shrinks the number of sources to match what's actually there, but 
that shouldn't fix the bug).  That looks more like a cleanup than an actual fix.

Am I missing something?

