Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oBvZF-00083I-38
	for mharc-qemu-riscv@gnu.org; Thu, 14 Jul 2022 05:55:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heiko@sntech.de>)
 id 1oBvZ2-0007xE-B0; Thu, 14 Jul 2022 05:55:23 -0400
Received: from gloria.sntech.de ([185.11.138.130]:42564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heiko@sntech.de>)
 id 1oBvZ1-0004c5-1N; Thu, 14 Jul 2022 05:55:20 -0400
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=diego.localnet) by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1oBvYv-0002wU-T7; Thu, 14 Jul 2022 11:55:13 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Atish Patra <atishp@rivosinc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 frank.chang@sifive.com, Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v10 10/12] target/riscv: Add few cache related PMU events
Date: Thu, 14 Jul 2022 11:55:13 +0200
Message-ID: <23574872.6Emhk5qWAg@diego>
In-Reply-To: <20220620231603.2547260-11-atishp@rivosinc.com>
References: <20220620231603.2547260-1-atishp@rivosinc.com>
 <20220620231603.2547260-11-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=185.11.138.130; envelope-from=heiko@sntech.de;
 helo=gloria.sntech.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Jul 2022 09:55:28 -0000

Am Dienstag, 21. Juni 2022, 01:16:00 CEST schrieb Atish Patra:
> From: Atish Patra <atish.patra@wdc.com>
> 
> Qemu can monitor the following cache related PMU events through
> tlb_fill functions.
> 
> 1. DTLB load/store miss
> 3. ITLB prefetch miss
> 
> Increment the PMU counter in tlb_fill function.
> 
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Tested-by: Heiko Stuebner <heiko@sntech.de>



