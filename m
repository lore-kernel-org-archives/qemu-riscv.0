Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLLJj-0008Rx-FL
	for mharc-qemu-riscv@gnu.org; Wed, 01 Sep 2021 04:09:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1mLLJb-0008Np-Iz; Wed, 01 Sep 2021 04:09:47 -0400
Received: from collins.uni-paderborn.de ([2001:638:502:c003::14]:39056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1mLLJZ-000654-61; Wed, 01 Sep 2021 04:09:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mail.uni-paderborn.de; s=20170601; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6lZ6ydmxvbnC4r0Pymcd338rHTaneKicD1zouDaR9B4=; b=nmvAFUt4vIGCfB6G8oONgc+jwF
 +rEGS7jey9hOxOwvjlXfNSsB7XEdoc/uYmhO01C9zV9blvAp0OYj7tjkbDKhJQMOzu9cuMozUn+9H
 MtOfSkBCBidNQY7MYUBVD8rVY8Ah9xTQCVAxoliEMRmJgtsP7YTbNRRQAdSP/mphQp7k=;
Date: Wed, 1 Sep 2021 10:09:30 +0200
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 David Hildenbrand <david@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Peter Xu <peterx@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Huacai Chen <chenhuacai@kernel.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Greg Kurz <groug@kaod.org>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Stafford Horne <shorne@gmail.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [PATCH 20/29] tcg_funcs: Add cpu_restore_state to TCGModuleOps
Message-ID: <20210901080930.42kpcwrobyzgxmqt@schnipp-desktop>
References: <20210831121545.2874233-1-kraxel@redhat.com>
 <20210831121545.2874233-21-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210831121545.2874233-21-kraxel@redhat.com>
X-IMT-Spam-Score: 0.0 ()
X-PMX-Version: 6.4.9.2830568, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2021.9.1.75716, AntiVirus-Engine: 5.84.0,
 AntiVirus-Data: 2021.7.20.5840001
X-Sophos-SenderHistory: ip=84.184.59.97, fs=3861074, da=118092839, mc=48, sc=0,
 hc=48, sp=0, fso=3861074, re=0, sd=0, hd=0
X-IMT-Authenticated-Sender: kbastian@UNI-PADERBORN.DE
Received-SPF: pass client-ip=2001:638:502:c003::14;
 envelope-from=kbastian@mail.uni-paderborn.de; helo=collins.uni-paderborn.de
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
X-List-Received-Date: Wed, 01 Sep 2021 08:09:53 -0000

On Tue, Aug 31, 2021 at 02:15:36PM +0200, Gerd Hoffmann wrote:
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  include/exec/exec-all.h             | 2 +-
>  include/tcg/tcg-module.h            | 1 +
>  accel/tcg/cpu-exec-common.c         | 2 +-
>  accel/tcg/tcg-module.c              | 6 ++++++
>  accel/tcg/translate-all.c           | 3 ++-
>  softmmu/physmem.c                   | 2 +-
>  target/alpha/helper.c               | 2 +-
>  target/alpha/mem_helper.c           | 2 +-
>  target/arm/op_helper.c              | 2 +-
>  target/arm/tlb_helper.c             | 8 ++++----
>  target/cris/helper.c                | 2 +-
>  target/i386/helper.c                | 2 +-
>  target/i386/tcg/sysemu/svm_helper.c | 2 +-
>  target/m68k/op_helper.c             | 6 +++---
>  target/microblaze/helper.c          | 2 +-
>  target/openrisc/sys_helper.c        | 8 ++++----
>  target/ppc/excp_helper.c            | 2 +-
>  target/s390x/tcg/excp_helper.c      | 2 +-
>  target/tricore/op_helper.c          | 2 +-
>  target/xtensa/helper.c              | 6 +++---
>  20 files changed, 36 insertions(+), 28 deletions(-)

tricore part

Reviewed-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

Cheers,
Bastian

