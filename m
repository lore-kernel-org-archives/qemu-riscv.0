Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1psKRE-0006cd-SI
	for mharc-qemu-riscv@gnu.org; Fri, 28 Apr 2023 05:30:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dickon.hood@codethink.co.uk>)
 id 1psKRC-0006aj-MX; Fri, 28 Apr 2023 05:30:46 -0400
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dickon.hood@codethink.co.uk>)
 id 1psKRB-0005gY-07; Fri, 28 Apr 2023 05:30:46 -0400
Received: from static44-108.adsl.bogons.net ([85.158.44.108]
 helo=ct-lt-2205.boot.codethink.co.uk)
 by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
 id 1psKR1-009zss-Vi; Fri, 28 Apr 2023 10:30:36 +0100
Date: Fri, 28 Apr 2023 10:30:30 +0100
From: Dickon Hood <dickon.hood@codethink.co.uk>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn,
 zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com
Subject: Re: [PATCH 0/2] target/riscv: RVV 1-fill tail element changes
Message-ID: <ZEuSNvwMOxo1K0J/@ct-lt-2205.boot.codethink.co.uk>
References: <20230427205708.246679-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230427205708.246679-1-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=78.40.148.171;
 envelope-from=dickon.hood@codethink.co.uk; helo=imap5.colo.codethink.co.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 28 Apr 2023 09:30:47 -0000

On Thu, Apr 27, 2023 at 17:57:06 -0300, Daniel Henrique Barboza wrote:

: Second patch makes the function debug only. The logic is explained in
: the commit message, but long story short: we don't have to implement any
: tail-agnostic policy at all to be spec compliant, but this function has
: its uses for debug purposes, so keeping it as a debug option allow users
: to disable it on demand.

Yes, please don't remove this functionality completely -- our internal
stress test tool for the vector crypto patches relies on it.

-- 
Dickon Hood                                    Senior Software Engineer
                                                         Codethink Ltd.
                                 3rd Floor, Dale House, 35 Dale Street,
https://www.codethink.co.uk/        Manchester, M1 2HF, United Kingdom.


