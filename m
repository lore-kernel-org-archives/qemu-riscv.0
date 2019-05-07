Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hO4GZ-0005Kh-6s
	for mharc-qemu-riscv@gnu.org; Tue, 07 May 2019 13:52:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38905)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@dabbelt.com>) id 1hO4GV-0005Jn-E3
	for qemu-riscv@nongnu.org; Tue, 07 May 2019 13:52:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@dabbelt.com>) id 1hO4GU-0005Ve-CS
	for qemu-riscv@nongnu.org; Tue, 07 May 2019 13:52:31 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:40992)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hO4GU-0005Ui-6a
	for qemu-riscv@nongnu.org; Tue, 07 May 2019 13:52:30 -0400
Received: by mail-pl1-f194.google.com with SMTP id d9so8545332pls.8
	for <qemu-riscv@nongnu.org>; Tue, 07 May 2019 10:52:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=cYprQMWktnww3CUSan+0ugetvPRquyZiZq8dJoeUsHE=;
	b=XzSPMGsASZ6pwHGtZhyoqd+3jrnyBoK7vs5fwXmq2gBINj+Kl2DQ87VqhKPBS1CKJK
	DG9TTqOtHe33ZiaFniaZsEiEzC+cUvd0K9uqum3H2ckhkeIxPPzZyHW+aRGmJqnjaxcK
	ACuzlXVUJ+4jlZXI5lKX8bHG5jGxgic1Lr4NZAeDVnmyFZVq3ocuQtZq1V8QltmaOq8M
	0Q3iQ6P3AigrT14Yu5+Q86R/5WVFbALqXdq9b3VYSjden0723ldOA7MA4wFwWOpn4/if
	AhJf7wzPVLM+fOXy2YQGqIDls2LhaVdLssP+Fwdfy8A0V8ZcCGx1WJBwZzdp9O3W2K73
	XYog==
X-Gm-Message-State: APjAAAVg1yb3b4Kzqddb6sadlyZhjNKejA9xrCPi+d4Kj8X1/PJFAdel
	oHypYeBIuLmrcFfgEI0bK4EXcA==
X-Google-Smtp-Source: APXvYqzRlyo7Sa9ZDMUJv8ycBxHkq2ETTa+Ny+MP/FrKdrsigBL6kr6QNlsqR30MA//UKOSwoVpm+w==
X-Received: by 2002:a17:902:8f93:: with SMTP id
	z19mr34015284plo.108.1557251547998; 
	Tue, 07 May 2019 10:52:27 -0700 (PDT)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	f14sm20340508pgj.24.2019.05.07.10.52.27
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 07 May 2019 10:52:27 -0700 (PDT)
Date: Tue, 07 May 2019 10:52:27 -0700 (PDT)
X-Google-Original-Date: Tue, 07 May 2019 10:18:29 PDT (-0700)
In-Reply-To: <CANnJOVHd1aFR2tiORJmZ2h3xa+t8djToUEom4WSy=4vBcOjegg@mail.gmail.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
	Alistair Francis <Alistair.Francis@wdc.com>, sagark@eecs.berkeley.edu,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
From: Palmer Dabbelt <palmer@sifive.com>
To: fintelia@gmail.com
Message-ID: <mhng-29822037-900e-4149-aa85-36cbc1db4972@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.214.194
Subject: Re: [Qemu-riscv] [PATCH for 4.1] target/riscv: More accurate
 handling of `sip` CSR
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
X-List-Received-Date: Tue, 07 May 2019 17:52:34 -0000

On Mon, 06 May 2019 08:52:43 PDT (-0700), fintelia@gmail.com wrote:
> According to the spec, "All bits besides SSIP, USIP, and UEIP in the sip
> register are read-only." Further, if an interrupt is not delegated to mode
> x,
> then "the corresponding bits in xip [...] should appear to be hardwired to
> zero. This patch implements both of those requirements.
>
> Signed-off-by: Jonathan Behrens <fintelia@gmail.com>
> ---
>  target/riscv/csr.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 1ec1222da1..fff7d834e8 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -246,6 +246,7 @@ static const target_ulong sstatus_v1_9_mask =
> SSTATUS_SIE | SSTATUS_SPIE |
>  static const target_ulong sstatus_v1_10_mask = SSTATUS_SIE | SSTATUS_SPIE |
>      SSTATUS_UIE | SSTATUS_UPIE | SSTATUS_SPP | SSTATUS_FS | SSTATUS_XS |
>      SSTATUS_SUM | SSTATUS_MXR | SSTATUS_SD;
> +static const target_ulong sip_writable_mask = SIP_SSIP | MIP_USIP |
> MIP_UEIP;
>
>  #if defined(TARGET_RISCV32)
>  static const char valid_vm_1_09[16] = {
> @@ -694,8 +695,10 @@ static int write_sbadaddr(CPURISCVState *env, int
> csrno, target_ulong val)
>  static int rmw_sip(CPURISCVState *env, int csrno, target_ulong *ret_value,
>                     target_ulong new_value, target_ulong write_mask)
>  {
> -    return rmw_mip(env, CSR_MSTATUS, ret_value, new_value,
> -                   write_mask & env->mideleg);
> +    int ret = rmw_mip(env, CSR_MSTATUS, ret_value, new_value,
> +                      write_mask & env->mideleg & sip_writable_mask);
> +    *ret_value &= env->mideleg;
> +    return ret;
>  }
>
>  /* Supervisor Protection and Translation */

This patch (and your previous one) don't apply for me.  I don't see the
git-send-email tags in your messages, are you trying to do something like paste
them into gmail?  If so I think they're getting line wrapped.

