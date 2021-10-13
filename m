Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mahOr-0000ga-AV
	for mharc-qemu-riscv@gnu.org; Wed, 13 Oct 2021 12:46:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mahOo-0000dC-O9; Wed, 13 Oct 2021 12:46:38 -0400
Received: from zm-mta-out-3.u-ga.fr ([152.77.200.56]:57848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <frederic.petrot@univ-grenoble-alpes.fr>)
 id 1mahOl-0005Bf-Bf; Wed, 13 Oct 2021 12:46:38 -0400
Received: from mailhost.u-ga.fr (mailhost2.u-ga.fr [129.88.177.242])
 by zm-mta-out-3.u-ga.fr (Postfix) with ESMTP id 766FD41E7B;
 Wed, 13 Oct 2021 18:46:29 +0200 (CEST)
Received: from smtps.univ-grenoble-alpes.fr (smtps3.u-ga.fr [195.83.24.62])
 by mailhost.u-ga.fr (Postfix) with ESMTP id 6C33D60066;
 Wed, 13 Oct 2021 18:46:29 +0200 (CEST)
Received: from [147.171.132.208] (palmier.tima.u-ga.fr [147.171.132.208])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: petrotf@univ-grenoble-alpes.fr)
 by smtps.univ-grenoble-alpes.fr (Postfix) with ESMTPSA id D8EF740064;
 Wed, 13 Oct 2021 18:46:28 +0200 (CEST)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 fabien.portas@grenoble-inp.org
References: <20211007174722.929993-1-richard.henderson@linaro.org>
 <20211007174722.929993-5-richard.henderson@linaro.org>
From: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Subject: Re: [PATCH 04/13] target/riscv: Replace riscv_cpu_is_32bit with
 riscv_cpu_mxl
Message-ID: <7faa13cd-c0ed-e34e-a77a-6fedd6d01ac9@univ-grenoble-alpes.fr>
Date: Wed, 13 Oct 2021 18:46:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211007174722.929993-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Greylist: Whitelist-UGA SMTP Authentifie (petrotf@univ-grenoble-alpes.fr)
 via submission-587 ACL (40)
X-Greylist: Whitelist-UGA MAILHOST (SMTP non authentifie) depuis 195.83.24.62
Received-SPF: pass client-ip=152.77.200.56;
 envelope-from=frederic.petrot@univ-grenoble-alpes.fr;
 helo=zm-mta-out-3.u-ga.fr
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 13 Oct 2021 16:46:39 -0000

Hello,

Le 07/10/2021 à 19:47, Richard Henderson a écrit :
> Shortly, the set of supported XL will not be just 32 and 64,
> and representing that properly using the enumeration will be
> imperative.
> 
> Two places, booting and gdb, intentionally use misa_mxl_max
> to emphasize the use of the reset value of misa.mxl, and not
> the current cpu state.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/riscv/cpu.h            |  9 ++++++++-
>  hw/riscv/boot.c               |  2 +-
>  semihosting/arm-compat-semi.c |  2 +-
>  target/riscv/cpu.c            | 24 ++++++++++++++----------
>  target/riscv/cpu_helper.c     | 12 ++++++------
>  target/riscv/csr.c            | 24 ++++++++++++------------
>  target/riscv/gdbstub.c        |  2 +-
>  target/riscv/monitor.c        |  4 ++--
>  8 files changed, 45 insertions(+), 34 deletions(-)


> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> @@ -522,7 +522,7 @@ static RISCVException write_mstatus(CPURISCVState *env, int csrno,
>  
>      dirty = ((mstatus & MSTATUS_FS) == MSTATUS_FS) |
>              ((mstatus & MSTATUS_XS) == MSTATUS_XS);
> -    if (riscv_cpu_is_32bit(env)) {
> +    if (riscv_cpu_mxl(env) == MXL_RV32) {
>          mstatus = set_field(mstatus, MSTATUS32_SD, dirty);
>      } else {
>          mstatus = set_field(mstatus, MSTATUS64_SD, dirty);

I believe we miss the settings of the SXL and UXL fields that are needed
by cpu_get_xl

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 9c0753bc8b..c4a479ddd2 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -526,6 +526,9 @@ static RISCVException write_mstatus(CPURISCVState *env, int
csrno,
         mstatus = set_field(mstatus, MSTATUS32_SD, dirty);
     } else {
         mstatus = set_field(mstatus, MSTATUS64_SD, dirty);
+        /* SXL and UXL fields are for now read only */
+        mstatus = set_field(mstatus, MSTATUS64_SXL, MXL_RV64);
+        mstatus = set_field(mstatus, MSTATUS64_UXL, MXL_RV64);
     }
     env->mstatus = mstatus;

Frédéric
-- 
+---------------------------------------------------------------------------+
| Frédéric Pétrot, Pr. Grenoble INP-Ensimag/TIMA,   Ensimag deputy director |
| Mob/Pho: +33 6 74 57 99 65/+33 4 76 57 48 70      Ad augusta  per angusta |
| http://tima.univ-grenoble-alpes.fr frederic.petrot@univ-grenoble-alpes.fr |
+---------------------------------------------------------------------------+

