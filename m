Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hOAeu-00052S-ST
	for mharc-qemu-riscv@gnu.org; Tue, 07 May 2019 20:42:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47661)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@dabbelt.com>) id 1hOAes-00052D-7f
	for qemu-riscv@nongnu.org; Tue, 07 May 2019 20:42:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@dabbelt.com>) id 1hOAer-0007Uw-8o
	for qemu-riscv@nongnu.org; Tue, 07 May 2019 20:42:06 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:34402)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1hOAer-0007SB-2C
	for qemu-riscv@nongnu.org; Tue, 07 May 2019 20:42:05 -0400
Received: by mail-pg1-f196.google.com with SMTP id c13so9165964pgt.1
	for <qemu-riscv@nongnu.org>; Tue, 07 May 2019 17:42:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=Kr2XqPi1gRvOyb5Xj4YttFQx1exjuEk+xgu3b4WB82c=;
	b=M9kI7uG//jdVPYOYV8Halseh5lHLIekX1CteEUyFms2+NH20kbPmG//hl6SMVIoE2P
	YbSs/8bCTEEf2N7mw9NG36plF+rT08Jm7nCTdQwHuOPR/sa9M2kr2VUeUQKaKtEvkQvQ
	9SaKS59/wh3xHYc9cpFhjQrcUkTW/2l73ntD3JhHH2aVBaQlwX4IRT1aS03fESEtVsub
	4wIOw5BuiuL2vijKOvbb8P845ttCS7Tb1L+fAHtLrjhmKSBRgtKik9m0DLak0ABQEJPX
	mA/WfOKj9tKJBH8hIFiG8GvKflglI/S39pqCqc8lrab15qGm+TFFFOn9ltA9qGvnPrv8
	as/Q==
X-Gm-Message-State: APjAAAXKSkZnRRybhhJw9G6tmVcCH+Bvr04fNGUNrpIMZ0UF+Gl5zI3K
	alce/Zzb0MvrUx4ruar2SXyXDQ==
X-Google-Smtp-Source: APXvYqwa9X610DR5EdCz9IYCYZJzdNKUoTJzXa7oZgVx3YGbYbowTJvZwi0w/pORz1jnC24CTArjoA==
X-Received: by 2002:aa7:8c1a:: with SMTP id c26mr44809399pfd.25.1557276123606; 
	Tue, 07 May 2019 17:42:03 -0700 (PDT)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	b22sm22298420pgg.88.2019.05.07.17.42.02
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 07 May 2019 17:42:02 -0700 (PDT)
Date: Tue, 07 May 2019 17:42:02 -0700 (PDT)
X-Google-Original-Date: Tue, 07 May 2019 17:41:21 PDT (-0700)
In-Reply-To: <20190507223646.18981-1-jonathan@fintelia.io>
CC: qemu-devel@nongnu.org, fintelia@gmail.com, qemu-riscv@nongnu.org,
	sagark@eecs.berkeley.edu, jonathan@fintelia.io
From: Palmer Dabbelt <palmer@sifive.com>
To: jonathan@fintelia.io
Message-ID: <mhng-b328d27f-e971-49bf-a266-c77ffd2f3051@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.196
Subject: Re: [Qemu-riscv] [PATCH] target/riscv: More accurate handling of
 `sip` CSR
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
X-List-Received-Date: Wed, 08 May 2019 00:42:07 -0000

On Tue, 07 May 2019 15:36:46 PDT (-0700), jonathan@fintelia.io wrote:
> According to the spec, "All bits besides SSIP, USIP, and UEIP in the sip
> register are read-only." Further, if an interrupt is not delegated to mode x,
> then "the corresponding bits in xip [...] should appear to be hardwired to
> zero. This patch implements both of those requirements.
>
> Signed-off-by: Jonathan Behrens <jonathan@fintelia.io>
> ---
>  target/riscv/csr.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 1ec1222da1..fff7d834e8 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -246,6 +246,7 @@ static const target_ulong sstatus_v1_9_mask = SSTATUS_SIE | SSTATUS_SPIE |
>  static const target_ulong sstatus_v1_10_mask = SSTATUS_SIE | SSTATUS_SPIE |
>      SSTATUS_UIE | SSTATUS_UPIE | SSTATUS_SPP | SSTATUS_FS | SSTATUS_XS |
>      SSTATUS_SUM | SSTATUS_MXR | SSTATUS_SD;
> +static const target_ulong sip_writable_mask = SIP_SSIP | MIP_USIP | MIP_UEIP;
>
>  #if defined(TARGET_RISCV32)
>  static const char valid_vm_1_09[16] = {
> @@ -694,8 +695,10 @@ static int write_sbadaddr(CPURISCVState *env, int csrno, target_ulong val)
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

Reviewed-by: Palmer Dabbelt <palmer@sifive.com>

Thanks!

