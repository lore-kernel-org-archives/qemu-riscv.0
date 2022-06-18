Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o2eIu-0006tN-Ak
	for mharc-qemu-riscv@gnu.org; Sat, 18 Jun 2022 15:40:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@fluff.org>)
 id 1o2eIs-0006t4-D8; Sat, 18 Jun 2022 15:40:18 -0400
Received: from test-v6.fluff.org ([2a01:4f8:222:2004::3]:50922
 helo=hetzy.fluff.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@fluff.org>)
 id 1o2eIq-0002U0-91; Sat, 18 Jun 2022 15:40:18 -0400
Received: from ben by hetzy.fluff.org with local (Exim 4.89)
 (envelope-from <ben@fluff.org>)
 id 1o2eIc-0008NW-BH; Sat, 18 Jun 2022 20:40:02 +0100
Date: Sat, 18 Jun 2022 20:40:02 +0100
From: Ben Dooks <ben@fluff.org>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Ben Dooks <qemu@ben.fluff.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Subject: Re: [PATCH 4/4] hw/riscv: use qemu_fdt_setprop_strings() in sifive_u.c
Message-ID: <20220618194002.tecvyvb3qdlijinm@hetzy.fluff.org>
References: <20220416193034.538161-1-qemu@ben.fluff.org>
 <20220416193034.538161-5-qemu@ben.fluff.org>
 <CAEUhbmUAYtS1bshMrVceWe_B=uWVacty0scHUv9MoAfBQxeMKQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEUhbmUAYtS1bshMrVceWe_B=uWVacty0scHUv9MoAfBQxeMKQ@mail.gmail.com>
X-Disclaimer: These are my views alone.
X-URL: http://www.fluff.org/
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: ben@fluff.org
X-SA-Exim-Scanned: No (on hetzy.fluff.org); SAEximRunCond expanded to false
Received-SPF: pass client-ip=2a01:4f8:222:2004::3; envelope-from=ben@fluff.org;
 helo=hetzy.fluff.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Sat, 18 Jun 2022 19:40:18 -0000

On Fri, Apr 22, 2022 at 10:19:34AM +0800, Bin Meng wrote:
> On Mon, Apr 18, 2022 at 5:13 AM Ben Dooks <qemu@ben.fluff.org> wrote:
> >
> > Use the qemu_fdt_setprop_strings() in sifve_u.c to simplify
> > the code.
> >
> > Signed-off-by; Ben Dooks <qemu@ben.fluff.org>
> 
> ; should be replaced to :
> 
> Not sure how you did that, but you can do with "git commit -s" and git
> will take care of the SoB tag.

I'm used to adding them manually to git commit messages.

-- 
Ben Dooks, ben@fluff.org, http://www.fluff.org/ben/

Large Hadron Colada: A large Pina Colada that makes the universe disappear.


