Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oUASa-0006uX-On
	for mharc-qemu-riscv@gnu.org; Fri, 02 Sep 2022 13:28:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aurelien@aurel32.net>)
 id 1oUASO-0006qr-PQ; Fri, 02 Sep 2022 13:27:54 -0400
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1]:48166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aurelien@aurel32.net>)
 id 1oUASL-0005eJ-JI; Fri, 02 Sep 2022 13:27:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
 ; s=202004.hall;
 h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
 Subject:Content-ID:Content-Description:X-Debbugs-Cc;
 bh=j9BNWLgkWpf6YaoQPtslv3f2Na3q+/x4mXtJTG84R94=; b=ZZ2k5anyaOLbHXiI5gFUC+J3DA
 XSNACMOKZeJ3lVXP03T5P10pGPv2G7sXb3DCjBQUxgi4Pd5hcmGDSNUbVvb0/wEu5waBZ6Ofu9lqi
 15aEnCzl20KTrL05R0TQPqjfBR0owYGVNLApB7WhKRxI/zaJXsnErP7mmFOOZlijX/6vhp/R1ObNy
 30Mo/Hhiusp0gpqi5qAkfhnsFBsKBybJzYkejgOqSTh+SGdPp+bqP+SfYkPoDUk7JEpTNqC96Kyz7
 DhFKvIlr3xXBcmOK2kUiWE1wGg/2V39h3sBhh0T3GGLv/5hW5k/8McJr7S+GK7Mrpq0xBpbyp7pKg
 qSkxjVpA==;
Received: from aurel32 by hall.aurel32.net with local (Exim 4.94.2)
 (envelope-from <aurelien@aurel32.net>)
 id 1oUAS5-004ve3-N4; Fri, 02 Sep 2022 19:27:33 +0200
Date: Fri, 2 Sep 2022 19:27:33 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>
Subject: Re: [PATCH] target/riscv: Implement PMU CSR predicate function for
 U-mode
Message-ID: <YxI9BcCO+kKjbezM@aurel32.net>
References: <20220902164649.4122331-1-aurelien@aurel32.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220902164649.4122331-1-aurelien@aurel32.net>
User-Agent: Mutt/2.0.5 (2021-01-21)
Received-SPF: none client-ip=2001:bc8:30d7:100::1;
 envelope-from=aurelien@aurel32.net; helo=hall.aurel32.net
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 02 Sep 2022 17:28:02 -0000

On 2022-09-02 18:46, Aurelien Jarno wrote:
> Recently the Linux kernel started to use a non default value, for
> the scounteren CSR, which is ignored by QEMU. Fix that by implementing
> the PMU CSR predicate function for U-mode.
> 
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> ---
>  target/riscv/csr.c | 49 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
> 

Please ignore that patch, I have been pointed out this is fixed by this
better patch that has been already reviewed:

https://www.mail-archive.com/qemu-devel@nongnu.org/msg906303.html

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                 http://www.aurel32.net

