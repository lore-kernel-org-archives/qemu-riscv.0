Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lU3LJ-0000Bw-Ev
	for mharc-qemu-riscv@gnu.org; Wed, 07 Apr 2021 04:15:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1lU3LF-0000BQ-A6; Wed, 07 Apr 2021 04:15:13 -0400
Received: from shirlock.uni-paderborn.de ([2001:638:502:c003::15]:40786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1lU3LC-0003sv-Uq; Wed, 07 Apr 2021 04:15:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mail.uni-paderborn.de; s=20170601; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iGM9+jMKSRPGzsJG2RSM3qNloi5GjNS8Ob6njgmoUjE=; b=RiV0fPCMVaRsJWPKRYA2kG0g8E
 03W8/zb6oDpfJFsVQwqKfUmoy+p0ByLmK0YbM+ooangnSUny1IF/4Sx/5vfJNxb8n/pIN/Wn5oO9V
 sGhvObi2aAYaNNuTb76Qwo3/R/hwRHR9mkfbn1LAXxmCrOAQZ4fB/c4pYwwbJ53qn+Nw=;
Date: Wed, 7 Apr 2021 10:14:45 +0200
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, sagark@eecs.berkeley.edu,
 alistair23@gmail.com, palmer@dabbelt.com, bmeng.cn@gmail.com
Subject: Re: [PATCH v1 1/1] MAINTAINERS: Update the RISC-V CPU Maintainers
Message-ID: <20210407081445.rjhws622igwbbpy4@schnipp.zuhause>
References: <6564ba829c40ad9aa7d28f43be69d8eb5cf4b56b.1617749142.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6564ba829c40ad9aa7d28f43be69d8eb5cf4b56b.1617749142.git.alistair.francis@wdc.com>
X-IMT-Spam-Score: 0.0 ()
X-PMX-Version: 6.4.9.2830568, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2021.4.7.80615, AntiVirus-Engine: 5.82.0,
 AntiVirus-Data: 2021.3.29.5820001
X-Sophos-SenderHistory: ip=2a02:908:2214:e5bc::3d7, fs=6045350, da=105392371,
 mc=10, sc=0, hc=10, sp=0, fso=6045350, re=0, sd=0, hd=0
X-IMT-Authenticated-Sender: kbastian@UNI-PADERBORN.DE
Received-SPF: pass client-ip=2001:638:502:c003::15;
 envelope-from=kbastian@mail.uni-paderborn.de; helo=shirlock.uni-paderborn.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Wed, 07 Apr 2021 08:15:13 -0000

On Tue, Apr 06, 2021 at 06:48:25PM -0400, Alistair Francis wrote:
> Update the RISC-V maintainers by removing Sagar and Bastian who haven't
> been involved recently.
> 
> Also add Bin who has been helping with reviews.
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---

Acked-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

Cheers,
Bastian

