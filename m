Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nuB2M-0001oR-WE
	for mharc-qemu-riscv@gnu.org; Thu, 26 May 2022 06:48:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.shubin@maquefel.me>)
 id 1nuB2K-0001in-ON; Thu, 26 May 2022 06:48:12 -0400
Received: from forward500o.mail.yandex.net ([2a02:6b8:0:1a2d::610]:55408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.shubin@maquefel.me>)
 id 1nuB2H-0008JH-Fh; Thu, 26 May 2022 06:48:11 -0400
Received: from sas1-d25548431a90.qloud-c.yandex.net
 (sas1-d25548431a90.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:bd03:0:640:d255:4843])
 by forward500o.mail.yandex.net (Yandex) with ESMTP id 37A5894246B;
 Thu, 26 May 2022 13:48:05 +0300 (MSK)
Received: from sas2-1cbd504aaa99.qloud-c.yandex.net
 (sas2-1cbd504aaa99.qloud-c.yandex.net [2a02:6b8:c14:7101:0:640:1cbd:504a])
 by sas1-d25548431a90.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 Lp3lgv7hJo-m4feU0RC; Thu, 26 May 2022 13:48:05 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail;
 t=1653562085; bh=8BWmxKmk93jcCNGGBCj3AoLiQhT6zH45sS2X9pNz7FI=;
 h=In-Reply-To:Subject:Cc:To:From:References:Date:Message-ID;
 b=jq8/fEPqBceyCn8mLMnKWWPwvr9qiHCBQ1yJCoiK9ADlh46AE2xVWUpA+oHwzk+/8
 yinr8/Rk5zPc770CIQlRHNDFBWeFjt7AjKBWiozSMJVgr9yAqUcTDsxc1vmyD08NNo
 KicaE/SeM53rM9pR/JkLbrb0Qv4t9H4/4IqZhgV8=
Authentication-Results: sas1-d25548431a90.qloud-c.yandex.net;
 dkim=pass header.i=@maquefel.me
Received: by sas2-1cbd504aaa99.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id cFOGLakfB2-m35SHLEO; Thu, 26 May 2022 13:48:03 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Date: Thu, 26 May 2022 13:48:02 +0300
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atishp@rivosinc.com>, linux <linux@yadro.com>, Nikita
 Shubin <n.shubin@yadro.com>, Palmer Dabbelt <palmer@dabbelt.com>, Alistair
 Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, QEMU Developers
 <qemu-devel@nongnu.org>
Subject: Re: [PATCH] target/riscv: fix priv enum
Message-ID: <20220526134802.656a7b73@redslave.neermore.group>
In-Reply-To: <CAAhSdy0YOp8RY+V1hzf9KcdpEnVZpB5PuuSODDgpQ41GChMjxA@mail.gmail.com>
References: <20220526084240.31298-1-nikita.shubin@maquefel.me>
 <CAAhSdy0YOp8RY+V1hzf9KcdpEnVZpB5PuuSODDgpQ41GChMjxA@mail.gmail.com>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:0:1a2d::610;
 envelope-from=nikita.shubin@maquefel.me; helo=forward500o.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Thu, 26 May 2022 10:48:13 -0000

Hi Anup!

On Thu, 26 May 2022 15:37:54 +0530
Anup Patel <anup@brainfault.org> wrote:

> On Thu, May 26, 2022 at 2:15 PM Nikita Shubin
> <nikita.shubin@maquefel.me> wrote:
> >
> > From: Nikita Shubin <n.shubin@yadro.com>
> >
> > Add PRIV_VERSION_UNKNOWN to enum, otherwise PRIV_VERSION_1_10_0 will
> > be overwritten to PRIV_VERSION_1_12_0 in riscv_cpu_realize.
> >
> > Fixes: a46d410c5c ("target/riscv: Define simpler privileged spec
> > version numbering") Signed-off-by: Nikita Shubin
> > <n.shubin@yadro.com>  
> 
> This breaks the CSR ops table because with this patch most CSRs
> (not having explicit min_priv_version value) will be associated with
> an unknown priv spec version.
> 
> Please check "[PATCH v3 1/4] target/riscv: Don't force update priv
> spec version to latest" which I just sent.

Makes sense, thank you pointing it out.

> 
> Thanks,
> Anup
> 
> 
> > ---
> >  target/riscv/cpu.h | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index f08c3e8813..1f1d6589a7 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -91,7 +91,8 @@ enum {
> >
> >  /* Privileged specification version */
> >  enum {
> > -    PRIV_VERSION_1_10_0 = 0,
> > +    PRIV_VERSION_UNKNOWN = 0,
> > +    PRIV_VERSION_1_10_0,
> >      PRIV_VERSION_1_11_0,
> >      PRIV_VERSION_1_12_0,
> >  };
> > --
> > 2.35.1
> >
> >  


