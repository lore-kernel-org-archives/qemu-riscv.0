Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lHywB-0003hk-Pf
	for mharc-qemu-riscv@gnu.org; Thu, 04 Mar 2021 20:07:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lHyw9-0003eo-DO; Thu, 04 Mar 2021 20:07:25 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:54099 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lHyw6-0001GF-BG; Thu, 04 Mar 2021 20:07:25 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Ds8ht2Rj0z9sVS; Fri,  5 Mar 2021 12:07:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1614906430;
 bh=LW2yEZyEXEVXWlySE4UX4iQ7rstawgMA2ZOIICFSveA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FVStx8KyXG33hjOovZnhr5Nwl1Ix3GJVBb+uPCPZK+73i0eXBpFRmSb8Mu4Aa1Tkw
 3XGQNG1TWcAIkphvljcdNHrxQA9qEUJDad4yKn8yuo3luuvXUxDkjO3P3s+iSFP46d
 fMkqeQANixECHXHQ+rOIVSzaQSH3e24ptPlFYySY=
Date: Fri, 5 Mar 2021 12:05:15 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>,
 qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Cornelia Huck <cohuck@redhat.com>, Greg Kurz <groug@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-riscv@nongnu.org, Claudio Fontana <cfontana@suse.de>
Subject: Re: [RFC PATCH v2 5/8] target/ppc: Duplicate the TCGCPUOps structure
 for POWER CPUs
Message-ID: <YEGDy/2dE9QBmT6A@yekko.fritz.box>
References: <20210304222323.1954755-1-f4bug@amsat.org>
 <20210304222323.1954755-6-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="JoxYtKU21XRZ6LUp"
Content-Disposition: inline
In-Reply-To: <20210304222323.1954755-6-f4bug@amsat.org>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 05 Mar 2021 01:07:26 -0000


--JoxYtKU21XRZ6LUp
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 04, 2021 at 11:23:20PM +0100, Philippe Mathieu-Daud=E9 wrote:
65;6203;1c> POWER CPUs have specific CPUClass::has_work() handlers.
> In preparation of moving this field to TCGCPUOps, we need
> to duplicate the current ppc_tcg_ops structure for the
> POWER cpus.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  target/ppc/translate_init.c.inc | 69 +++++++++++++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
>=20
> diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.=
c.inc
> index 80239077e0b..fe76d0b3773 100644
> --- a/target/ppc/translate_init.c.inc
> +++ b/target/ppc/translate_init.c.inc
> @@ -48,6 +48,11 @@
>  /* #define PPC_DUMP_SPR_ACCESSES */
>  /* #define USE_APPLE_GDB */
> =20
> +static const struct TCGCPUOps power7_tcg_ops;
> +static const struct TCGCPUOps power8_tcg_ops;
> +static const struct TCGCPUOps power9_tcg_ops;
> +static const struct TCGCPUOps power10_tcg_ops;
> +
>  /*
>   * Generic callbacks:
>   * do nothing but store/retrieve spr value
> @@ -8685,6 +8690,9 @@ POWERPC_FAMILY(POWER7)(ObjectClass *oc, void *data)
>      pcc->l1_dcache_size =3D 0x8000;
>      pcc->l1_icache_size =3D 0x8000;
>      pcc->interrupts_big_endian =3D ppc_cpu_interrupts_big_endian_lpcr;
> +#ifdef CONFIG_TCG
> +    cc->tcg_ops =3D &power7_tcg_ops;
> +#endif /* CONFIG_TCG */
>  }
> =20
>  static void init_proc_POWER8(CPUPPCState *env)
> @@ -8863,6 +8871,9 @@ POWERPC_FAMILY(POWER8)(ObjectClass *oc, void *data)
>      pcc->l1_dcache_size =3D 0x8000;
>      pcc->l1_icache_size =3D 0x8000;
>      pcc->interrupts_big_endian =3D ppc_cpu_interrupts_big_endian_lpcr;
> +#ifdef CONFIG_TCG
> +    cc->tcg_ops =3D &power8_tcg_ops;
> +#endif /* CONFIG_TCG */
>  }
> =20
>  #ifdef CONFIG_SOFTMMU
> @@ -9081,6 +9092,9 @@ POWERPC_FAMILY(POWER9)(ObjectClass *oc, void *data)
>      pcc->l1_dcache_size =3D 0x8000;
>      pcc->l1_icache_size =3D 0x8000;
>      pcc->interrupts_big_endian =3D ppc_cpu_interrupts_big_endian_lpcr;
> +#ifdef CONFIG_TCG
> +    cc->tcg_ops =3D &power9_tcg_ops;
> +#endif /* CONFIG_TCG */
>  }
> =20
>  #ifdef CONFIG_SOFTMMU
> @@ -9292,6 +9306,9 @@ POWERPC_FAMILY(POWER10)(ObjectClass *oc, void *data)
>      pcc->l1_dcache_size =3D 0x8000;
>      pcc->l1_icache_size =3D 0x8000;
>      pcc->interrupts_big_endian =3D ppc_cpu_interrupts_big_endian_lpcr;
> +#ifdef CONFIG_TCG
> +    cc->tcg_ops =3D &power10_tcg_ops;
> +#endif /* CONFIG_TCG */
>  }
> =20
>  #if !defined(CONFIG_USER_ONLY)
> @@ -10851,6 +10868,58 @@ static const struct TCGCPUOps ppc_tcg_ops =3D {
>    .cpu_exec_interrupt =3D ppc_cpu_exec_interrupt,
>    .tlb_fill =3D ppc_cpu_tlb_fill,
> =20
> +#ifndef CONFIG_USER_ONLY
> +  .do_interrupt =3D ppc_cpu_do_interrupt,
> +  .cpu_exec_enter =3D ppc_cpu_exec_enter,
> +  .cpu_exec_exit =3D ppc_cpu_exec_exit,
> +  .do_unaligned_access =3D ppc_cpu_do_unaligned_access,
> +#endif /* !CONFIG_USER_ONLY */
> +};
> +
> +static const struct TCGCPUOps power7_tcg_ops =3D {
> +  .initialize =3D ppc_translate_init,
> +  .cpu_exec_interrupt =3D ppc_cpu_exec_interrupt,
> +  .tlb_fill =3D ppc_cpu_tlb_fill,
> +
> +#ifndef CONFIG_USER_ONLY
> +  .do_interrupt =3D ppc_cpu_do_interrupt,
> +  .cpu_exec_enter =3D ppc_cpu_exec_enter,
> +  .cpu_exec_exit =3D ppc_cpu_exec_exit,
> +  .do_unaligned_access =3D ppc_cpu_do_unaligned_access,
> +#endif /* !CONFIG_USER_ONLY */
> +};
> +
> +static const struct TCGCPUOps power8_tcg_ops =3D {
> +  .initialize =3D ppc_translate_init,
> +  .cpu_exec_interrupt =3D ppc_cpu_exec_interrupt,
> +  .tlb_fill =3D ppc_cpu_tlb_fill,
> +
> +#ifndef CONFIG_USER_ONLY
> +  .do_interrupt =3D ppc_cpu_do_interrupt,
> +  .cpu_exec_enter =3D ppc_cpu_exec_enter,
> +  .cpu_exec_exit =3D ppc_cpu_exec_exit,
> +  .do_unaligned_access =3D ppc_cpu_do_unaligned_access,
> +#endif /* !CONFIG_USER_ONLY */
> +};
> +
> +static const struct TCGCPUOps power9_tcg_ops =3D {
> +  .initialize =3D ppc_translate_init,
> +  .cpu_exec_interrupt =3D ppc_cpu_exec_interrupt,
> +  .tlb_fill =3D ppc_cpu_tlb_fill,
> +
> +#ifndef CONFIG_USER_ONLY
> +  .do_interrupt =3D ppc_cpu_do_interrupt,
> +  .cpu_exec_enter =3D ppc_cpu_exec_enter,
> +  .cpu_exec_exit =3D ppc_cpu_exec_exit,
> +  .do_unaligned_access =3D ppc_cpu_do_unaligned_access,
> +#endif /* !CONFIG_USER_ONLY */
> +};
> +
> +static const struct TCGCPUOps power10_tcg_ops =3D {
> +  .initialize =3D ppc_translate_init,
> +  .cpu_exec_interrupt =3D ppc_cpu_exec_interrupt,
> +  .tlb_fill =3D ppc_cpu_tlb_fill,
> +
>  #ifndef CONFIG_USER_ONLY
>    .do_interrupt =3D ppc_cpu_do_interrupt,
>    .cpu_exec_enter =3D ppc_cpu_exec_enter,

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--JoxYtKU21XRZ6LUp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBBg8sACgkQbDjKyiDZ
s5K42A/9Gkm+537WmfYhMjqLMRNp2p7H+NVIpR8+KEskuZgOvL6l7KHVmIwuMSHo
V+zJo0BVMNzxG3qBHCeUCANJkZkqypQrqeqQkxUWPR6alpVcqYnW3moeIhJ8wClF
lyD8t00pRzfAI6c+RWpXmE8Uc47N9S8ToIfZTNui/QUjcn25d3ithmSsFyFafena
xVZXHgw/4T4jv1LmQJ+VFOPmcM5/m4wlSCNaLwAoB2ZyWw89vngY1rs4A65WkeEU
TrpnRYqYnzfMAYTY7jxwAkGyv8jubzlU2a0vQm6cnWtvQSPkGoultuCc8iPvtzZf
53qn+kJvOPCcpOCNnjlybc6E/9WruRVEmPELYNDGIvjOUFRmDZOMFLV680oc7PAy
N+r0O529oFBTQNgnR67WCUFwno5eqE3kC+g3zURkRREkv/tTrO9DGmmlms1QNWB4
3IZ6D/Yrf0uN5c0hL9MfQv2Xtv0/zE8DOrDaWqKpRCt5kYGeHh2SDaKukchpKT5q
petd57aQpHI/1j5kbNgOCpfFpyJm0tBSea4cJ3ePO7D/ykwVDN0n1pcmjGHjExdm
kpSe0Q7WgCq1TpJOACivz5o5vecmGhRx3zo7mIbNuAhFwdfhsqbLdtC4xkA7ZVaW
ABCf/4PbYqAeA6/gLruTv5b5XNsvPtT+QDWWWpUY+ytdsHWNJ5U=
=2aVv
-----END PGP SIGNATURE-----

--JoxYtKU21XRZ6LUp--

