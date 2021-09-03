Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLxVh-0005Hy-7f
	for mharc-qemu-riscv@gnu.org; Thu, 02 Sep 2021 20:56:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mLxVf-0005H5-CS; Thu, 02 Sep 2021 20:56:47 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:53681 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mLxVc-0006Dl-M8; Thu, 02 Sep 2021 20:56:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1630630598;
 bh=ktRvddubVxWE7Dtd+XIUP0p+p2jdsvgjW3fipkF03VY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DQHw0CXoCLeVjZftr0jVswNtwM8GbP1gxHV/MxkWL8djz+hj+3hQfAlEy8h3PYDdu
 2Mn3eqjxn1zuKdk9+LgYODNkLO3Jn/i28NWOgPNg2DR6VOD/F/UqxHWfOhcfJrJzrC
 jy0T+Ur0ZWdBF11z+KawHepj0mHoqbtiyIOS1p8s=
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4H0zrk1qlJz9sW4; Fri,  3 Sep 2021 10:56:38 +1000 (AEST)
Date: Fri, 3 Sep 2021 10:48:30 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-arm@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Warner Losh <imp@bsdimp.com>,
 Michael Rolnik <mrolnik@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Bin Meng <bin.meng@windriver.com>, Chris Wulff <crwulff@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Kyle Evans <kevans@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Eduardo Habkost <ehabkost@redhat.com>, Marek Vasut <marex@denx.de>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Greg Kurz <groug@kaod.org>, qemu-riscv@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: Re: [PATCH 17/24] target/ppc: Restrict cpu_exec_interrupt() handler
 to sysemu
Message-ID: <YTFw3nhlRdYKQAed@yekko>
References: <20210902151715.383678-1-f4bug@amsat.org>
 <20210902151715.383678-18-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="kyvLM4mpgyEHrF3n"
Content-Disposition: inline
In-Reply-To: <20210902151715.383678-18-f4bug@amsat.org>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 03 Sep 2021 00:56:48 -0000


--kyvLM4mpgyEHrF3n
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 02, 2021 at 05:17:08PM +0200, Philippe Mathieu-Daud=E9 wrote:
> Restrict cpu_exec_interrupt() and its callees to sysemu.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  target/ppc/cpu.h         |  4 ++--
>  target/ppc/cpu_init.c    |  2 +-
>  target/ppc/excp_helper.c | 21 +++------------------
>  3 files changed, 6 insertions(+), 21 deletions(-)
>=20
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 500205229c0..362e7c4c5c7 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -1254,8 +1254,6 @@ DECLARE_OBJ_CHECKERS(PPCVirtualHypervisor, PPCVirtu=
alHypervisorClass,
>                       PPC_VIRTUAL_HYPERVISOR, TYPE_PPC_VIRTUAL_HYPERVISOR)
>  #endif /* CONFIG_USER_ONLY */
> =20
> -void ppc_cpu_do_interrupt(CPUState *cpu);
> -bool ppc_cpu_exec_interrupt(CPUState *cpu, int int_req);
>  void ppc_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
>  hwaddr ppc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
>  int ppc_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
> @@ -1271,6 +1269,8 @@ int ppc64_cpu_write_elf64_note(WriteCoreDumpFunctio=
n f, CPUState *cs,
>  int ppc32_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
>                                 int cpuid, void *opaque);
>  #ifndef CONFIG_USER_ONLY
> +void ppc_cpu_do_interrupt(CPUState *cpu);
> +bool ppc_cpu_exec_interrupt(CPUState *cpu, int int_req);
>  void ppc_cpu_do_system_reset(CPUState *cs);
>  void ppc_cpu_do_fwnmi_machine_check(CPUState *cs, target_ulong vector);
>  extern const VMStateDescription vmstate_ppc_cpu;
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index ad7abc6041a..6aad01d1d3a 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -9014,10 +9014,10 @@ static const struct SysemuCPUOps ppc_sysemu_ops =
=3D {
> =20
>  static const struct TCGCPUOps ppc_tcg_ops =3D {
>    .initialize =3D ppc_translate_init,
> -  .cpu_exec_interrupt =3D ppc_cpu_exec_interrupt,
>    .tlb_fill =3D ppc_cpu_tlb_fill,
> =20
>  #ifndef CONFIG_USER_ONLY
> +  .cpu_exec_interrupt =3D ppc_cpu_exec_interrupt,
>    .do_interrupt =3D ppc_cpu_do_interrupt,
>    .cpu_exec_enter =3D ppc_cpu_exec_enter,
>    .cpu_exec_exit =3D ppc_cpu_exec_exit,
> diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> index 7b6ac16eef7..d7e32ee107e 100644
> --- a/target/ppc/excp_helper.c
> +++ b/target/ppc/excp_helper.c
> @@ -40,24 +40,8 @@
> =20
>  /***********************************************************************=
******/
>  /* Exception processing */
> -#if defined(CONFIG_USER_ONLY)
> -void ppc_cpu_do_interrupt(CPUState *cs)
> -{
> -    PowerPCCPU *cpu =3D POWERPC_CPU(cs);
> -    CPUPPCState *env =3D &cpu->env;
> +#if !defined(CONFIG_USER_ONLY)
> =20
> -    cs->exception_index =3D POWERPC_EXCP_NONE;
> -    env->error_code =3D 0;
> -}
> -
> -static void ppc_hw_interrupt(CPUPPCState *env)
> -{
> -    CPUState *cs =3D env_cpu(env);
> -
> -    cs->exception_index =3D POWERPC_EXCP_NONE;
> -    env->error_code =3D 0;
> -}
> -#else /* defined(CONFIG_USER_ONLY) */
>  static inline void dump_syscall(CPUPPCState *env)
>  {
>      qemu_log_mask(CPU_LOG_INT, "syscall r0=3D%016" PRIx64
> @@ -1113,7 +1097,6 @@ void ppc_cpu_do_fwnmi_machine_check(CPUState *cs, t=
arget_ulong vector)
> =20
>      powerpc_set_excp_state(cpu, vector, msr);
>  }
> -#endif /* !CONFIG_USER_ONLY */
> =20
>  bool ppc_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
>  {
> @@ -1130,6 +1113,8 @@ bool ppc_cpu_exec_interrupt(CPUState *cs, int inter=
rupt_request)
>      return false;
>  }
> =20
> +#endif /* !CONFIG_USER_ONLY */
> +
>  #if defined(DEBUG_OP)
>  static void cpu_dump_rfi(target_ulong RA, target_ulong msr)
>  {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--kyvLM4mpgyEHrF3n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmExcNwACgkQbDjKyiDZ
s5Ls7A/8DImqkiBUg/Y3dsB8HfU6M5B9BoXPaw1cxXmJSNEBHIrTUPEFCXKeW3SP
6mzEpcKD5cjgsjKZaZLm9VGs83BLmAHXBydiNc9jOH4l3PZi4b3ih0SlYcpBiY2Q
Q3BSvE7/kQqlobNIOWQxVjR2aWZ9AVjm5sAeTs9L363IgfiedABKAZQbsTs2zDwq
KcMAdBdOKGHkbhpNbCh31put9VH8FqF6GGEBZzXtzOHNfra6lBidSZ6H/0V1Yog7
BISkM0Sr8H615DV0gYzSCHGUtHOcHEQa36SAhrE251f5o6MmqPyyICg4taAM30xI
kNXgBBYqwFMglD5VIpqrvSK+bZQqSCim5qlMGqkXuc0xgKP1oBNT3h/y5b+k8T7O
MADDKZH09A+W+Z1THu9InmS9py7tBsZJRjzeek1GlXlkpLoKOqQmLydi7VEBbXed
PFU0TH98novvaS8s+9OYc0o4un+YHC48jFTHAZhrVmqKC/E6bJ2av0fCfRxMdX87
VjMes8xZ5Oyy7DY1yEoOL+4jzEougv0v6h2GlmH+WfsxL/zoEKt+/VvP5OAjstVT
o81KHIN2jLoOmnrlIlcs7QgVfVcdgdDc+/vOf5Pp1pkYw5p9NT9z5OTDiZ8ihGJv
nJ7IY+wgD7IP6gljbmE+RN+XiRtQ58THrob2L2Guw87acY64cec=
=AgQv
-----END PGP SIGNATURE-----

--kyvLM4mpgyEHrF3n--

