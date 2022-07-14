Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oBvXt-0006cT-9D
	for mharc-qemu-riscv@gnu.org; Thu, 14 Jul 2022 05:54:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heiko@sntech.de>)
 id 1oBvXo-0006ai-F1; Thu, 14 Jul 2022 05:54:04 -0400
Received: from gloria.sntech.de ([185.11.138.130]:42482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heiko@sntech.de>)
 id 1oBvXh-0003uC-HG; Thu, 14 Jul 2022 05:54:00 -0400
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=diego.localnet) by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1oBvXV-0002vd-7A; Thu, 14 Jul 2022 11:53:45 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 frank.chang@sifive.com, Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v10 08/12] target/riscv: Add sscofpmf extension support
Date: Thu, 14 Jul 2022 11:53:44 +0200
Message-ID: <8991819.NyiUUSuA9g@diego>
In-Reply-To: <20220620231603.2547260-9-atishp@rivosinc.com>
References: <20220620231603.2547260-1-atishp@rivosinc.com>
 <20220620231603.2547260-9-atishp@rivosinc.com>
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
X-List-Received-Date: Thu, 14 Jul 2022 09:54:06 -0000

Am Dienstag, 21. Juni 2022, 01:15:58 CEST schrieb Atish Patra:
> The Sscofpmf ('Ss' for Privileged arch and Supervisor-level extensions,
> and 'cofpmf' for Count OverFlow and Privilege Mode Filtering)
> extension allows the perf to handle overflow interrupts and filtering
> support. This patch provides a framework for programmable
> counters to leverage the extension. As the extension doesn't have any
> provision for the overflow bit for fixed counters, the fixed events
> can also be monitoring using programmable counters. The underlying
> counters for cycle and instruction counters are always running. Thus,
> a separate timer device is programmed to handle the overflow.
> 
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

it looks like patches 1-7 already landed in Qemu though I didn't
see any "applied" messages, so it took me a bit to realize that :-) .


In any case, I ran Atish's sample from the cover-letter with a matching
kernel nad got similar results as shown in the cover-letter.

Tested-by: Heiko Stuebner <heiko@sntech.de>



