Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQK1p-00028u-Oh
	for mharc-qemu-riscv@gnu.org; Tue, 14 Sep 2021 21:48:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mQK1k-00022b-E0; Tue, 14 Sep 2021 21:47:56 -0400
Received: from ozlabs.org ([203.11.71.1]:40587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mQK1h-0000O2-4y; Tue, 14 Sep 2021 21:47:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1631670453;
 bh=NwndZtTLOjUYyi7djQs5a8xGpidoGLI0MTf/YJl8xX8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=m7qhXllqRNNhq4fLcTX7eS5ebYpfq4aZMQ7AVceLwEcCjESISKQ2yHBx40meq9rDK
 BuSE4PJJuRRNUbuavz2Uw/Ra199mIHehu84BSLY6CNJCYren38Z86jTHsP9Oa/3uPS
 GWQnbuX+0mBzYOZrnIkEny08+AgDi/3gc9RLoKN4=
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4H8NPx18JXz9sW4; Wed, 15 Sep 2021 11:47:33 +1000 (AEST)
Date: Wed, 15 Sep 2021 11:41:28 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>,
 Bin Meng <bin.meng@windriver.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Stafford Horne <shorne@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Peter Xu <peterx@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-ppc@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Halil Pasic <pasic@linux.ibm.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-riscv@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>, Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Marek Vasut <marex@denx.de>,
 Markus Armbruster <armbru@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-s390x@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Chris Wulff <crwulff@gmail.com>
Subject: Re: [PATCH v2 50/53] monitor: merge duplicate "info tlb" handlers
Message-ID: <YUFPSJCIsUlp5L4Y@yekko>
References: <20210914142042.1655100-1-berrange@redhat.com>
 <20210914142042.1655100-51-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="a/JNFcIeN8xVqrhe"
Content-Disposition: inline
In-Reply-To: <20210914142042.1655100-51-berrange@redhat.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 15 Sep 2021 01:47:57 -0000


--a/JNFcIeN8xVqrhe
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 14, 2021 at 03:20:39PM +0100, Daniel P. Berrang=E9 wrote:
> Now that all target architectures are converted to use the "format_tlb"
> callback, we can merge all the duplicate "info tlb" handlers into one
> and remove the architecture condition on the command.
>=20
> Signed-off-by: Daniel P. Berrang=E9 <berrange@redhat.com>

ppc parts
Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hmp-commands-info.hx         |  3 ---
>  include/monitor/hmp-target.h |  1 -
>  monitor/misc.c               | 15 +++++++++++++++
>  target/i386/monitor.c        | 15 ---------------
>  target/m68k/monitor.c        | 15 ---------------
>  target/nios2/monitor.c       | 15 ---------------
>  target/ppc/monitor.c         | 15 ---------------
>  target/sh4/monitor.c         | 15 ---------------
>  target/sparc/monitor.c       | 16 ----------------
>  target/xtensa/monitor.c      | 15 ---------------
>  10 files changed, 15 insertions(+), 110 deletions(-)
>=20
> diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
> index f8312342cd..7bd1e04d46 100644
> --- a/hmp-commands-info.hx
> +++ b/hmp-commands-info.hx
> @@ -206,8 +206,6 @@ SRST
>      Show PCI information.
>  ERST
> =20
> -#if defined(TARGET_I386) || defined(TARGET_SH4) || defined(TARGET_SPARC)=
 || \
> -    defined(TARGET_PPC) || defined(TARGET_XTENSA) || defined(TARGET_M68K)
>      {
>          .name       =3D "tlb",
>          .args_type  =3D "",
> @@ -215,7 +213,6 @@ ERST
>          .help       =3D "show virtual to physical memory mappings",
>          .cmd        =3D hmp_info_tlb,
>      },
> -#endif
> =20
>  SRST
>    ``info tlb``
> diff --git a/include/monitor/hmp-target.h b/include/monitor/hmp-target.h
> index df79ad3355..04e02e8895 100644
> --- a/include/monitor/hmp-target.h
> +++ b/include/monitor/hmp-target.h
> @@ -45,7 +45,6 @@ CPUArchState *mon_get_cpu_env(Monitor *mon);
>  CPUState *mon_get_cpu(Monitor *mon);
> =20
>  void hmp_info_mem(Monitor *mon, const QDict *qdict);
> -void hmp_info_tlb(Monitor *mon, const QDict *qdict);
>  void hmp_mce(Monitor *mon, const QDict *qdict);
>  void hmp_info_local_apic(Monitor *mon, const QDict *qdict);
> =20
> diff --git a/monitor/misc.c b/monitor/misc.c
> index 6b07efdddd..c7d138914d 100644
> --- a/monitor/misc.c
> +++ b/monitor/misc.c
> @@ -936,6 +936,21 @@ static void hmp_info_mtree(Monitor *mon, const QDict=
 *qdict)
>      mtree_info(flatview, dispatch_tree, owner, disabled);
>  }
> =20
> +static void hmp_info_tlb(Monitor *mon, const QDict *qdict)
> +{
> +    g_autoptr(GString) buf =3D g_string_new("");
> +    CPUState *cpu =3D mon_get_cpu(mon);
> +
> +    if (!cpu) {
> +        monitor_printf(mon, "No CPU available\n");
> +        return;
> +    }
> +
> +    cpu_format_tlb(cpu, buf);
> +
> +    monitor_printf(mon, "%s", buf->str);
> +}
> +
>  static void hmp_info_profile(Monitor *mon, const QDict *qdict)
>  {
>      Error *err =3D NULL;
> diff --git a/target/i386/monitor.c b/target/i386/monitor.c
> index 698fbbc80b..a7eb4205c7 100644
> --- a/target/i386/monitor.c
> +++ b/target/i386/monitor.c
> @@ -248,21 +248,6 @@ void x86_cpu_format_tlb(CPUState *cpu, GString *buf)
>      }
>  }
> =20
> -void hmp_info_tlb(Monitor *mon, const QDict *qdict)
> -{
> -    g_autoptr(GString) buf =3D g_string_new("");
> -    CPUState *cpu =3D mon_get_cpu(mon);
> -
> -    if (!cpu) {
> -        monitor_printf(mon, "No CPU available\n");
> -        return;
> -    }
> -
> -    cpu_format_tlb(cpu, buf);
> -
> -    monitor_printf(mon, "%s", buf->str);
> -}
> -
>  static void mem_print(Monitor *mon, CPUArchState *env,
>                        hwaddr *pstart, int *plast_prot,
>                        hwaddr end, int prot)
> diff --git a/target/m68k/monitor.c b/target/m68k/monitor.c
> index 003a665246..0dc729692b 100644
> --- a/target/m68k/monitor.c
> +++ b/target/m68k/monitor.c
> @@ -12,21 +12,6 @@
>  #include "qapi/error.h"
>  #include "qapi/qapi-commands-machine-target.h"
> =20
> -void hmp_info_tlb(Monitor *mon, const QDict *qdict)
> -{
> -    g_autoptr(GString) buf =3D g_string_new("");
> -    CPUState *cpu =3D mon_get_cpu(mon);
> -
> -    if (!cpu) {
> -        monitor_printf(mon, "No CPU available\n");
> -        return;
> -    }
> -
> -    cpu_format_tlb(cpu, buf);
> -
> -    monitor_printf(mon, "%s", buf->str);
> -}
> -
>  static const MonitorDef monitor_defs[] =3D {
>      { "d0", offsetof(CPUM68KState, dregs[0]) },
>      { "d1", offsetof(CPUM68KState, dregs[1]) },
> diff --git a/target/nios2/monitor.c b/target/nios2/monitor.c
> index 99d35e8ef1..1180a32f80 100644
> --- a/target/nios2/monitor.c
> +++ b/target/nios2/monitor.c
> @@ -26,18 +26,3 @@
>  #include "monitor/monitor.h"
>  #include "monitor/hmp-target.h"
>  #include "monitor/hmp.h"
> -
> -void hmp_info_tlb(Monitor *mon, const QDict *qdict)
> -{
> -    g_autoptr(GString) buf =3D g_string_new("");
> -    CPUState *cpu =3D mon_get_cpu(mon);
> -
> -    if (!cpu) {
> -        monitor_printf(mon, "No CPU available\n");
> -        return;
> -    }
> -
> -    cpu_format_tlb(cpu, buf);
> -
> -    monitor_printf(mon, "%s", buf->str);
> -}
> diff --git a/target/ppc/monitor.c b/target/ppc/monitor.c
> index 401a36c2eb..3564fd5f45 100644
> --- a/target/ppc/monitor.c
> +++ b/target/ppc/monitor.c
> @@ -65,21 +65,6 @@ static target_long monitor_get_tbl(Monitor *mon, const=
 struct MonitorDef *md,
>      return cpu_ppc_load_tbl(env);
>  }
> =20
> -void hmp_info_tlb(Monitor *mon, const QDict *qdict)
> -{
> -    g_autoptr(GString) buf =3D g_string_new("");
> -    CPUState *cpu =3D mon_get_cpu(mon);
> -
> -    if (!cpu) {
> -        monitor_printf(mon, "No CPU available\n");
> -        return;
> -    }
> -
> -    cpu_format_tlb(cpu, buf);
> -
> -    monitor_printf(mon, "%s", buf->str);
> -}
> -
>  const MonitorDef monitor_defs[] =3D {
>      { "fpscr", offsetof(CPUPPCState, fpscr) },
>      /* Next instruction pointer */
> diff --git a/target/sh4/monitor.c b/target/sh4/monitor.c
> index 5ccb95af93..d641d95316 100644
> --- a/target/sh4/monitor.c
> +++ b/target/sh4/monitor.c
> @@ -53,18 +53,3 @@ void superh_cpu_format_tlb(CPUState *cpu, GString *buf)
>          print_tlb(buf, i, &env->utlb[i]);
>      }
>  }
> -
> -void hmp_info_tlb(Monitor *mon, const QDict *qdict)
> -{
> -    g_autoptr(GString) buf =3D g_string_new("");
> -    CPUState *cpu =3D mon_get_cpu(mon);
> -
> -    if (!cpu) {
> -        monitor_printf(mon, "No CPU available\n");
> -        return;
> -    }
> -
> -    cpu_format_tlb(cpu, buf);
> -
> -    monitor_printf(mon, "%s", buf->str);
> -}
> diff --git a/target/sparc/monitor.c b/target/sparc/monitor.c
> index cc7fe74e3e..0c51669c08 100644
> --- a/target/sparc/monitor.c
> +++ b/target/sparc/monitor.c
> @@ -27,22 +27,6 @@
>  #include "monitor/hmp-target.h"
>  #include "monitor/hmp.h"
> =20
> -
> -void hmp_info_tlb(Monitor *mon, const QDict *qdict)
> -{
> -    g_autoptr(GString) buf =3D g_string_new("");
> -    CPUState *cpu =3D mon_get_cpu(mon);
> -
> -    if (!cpu) {
> -        monitor_printf(mon, "No CPU available\n");
> -        return;
> -    }
> -
> -    cpu_format_tlb(cpu, buf);
> -
> -    monitor_printf(mon, "%s", buf->str);
> -}
> -
>  #ifndef TARGET_SPARC64
>  static target_long monitor_get_psr(Monitor *mon, const struct MonitorDef=
 *md,
>                                     int val)
> diff --git a/target/xtensa/monitor.c b/target/xtensa/monitor.c
> index 99d35e8ef1..1180a32f80 100644
> --- a/target/xtensa/monitor.c
> +++ b/target/xtensa/monitor.c
> @@ -26,18 +26,3 @@
>  #include "monitor/monitor.h"
>  #include "monitor/hmp-target.h"
>  #include "monitor/hmp.h"
> -
> -void hmp_info_tlb(Monitor *mon, const QDict *qdict)
> -{
> -    g_autoptr(GString) buf =3D g_string_new("");
> -    CPUState *cpu =3D mon_get_cpu(mon);
> -
> -    if (!cpu) {
> -        monitor_printf(mon, "No CPU available\n");
> -        return;
> -    }
> -
> -    cpu_format_tlb(cpu, buf);
> -
> -    monitor_printf(mon, "%s", buf->str);
> -}

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--a/JNFcIeN8xVqrhe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFBT0gACgkQbDjKyiDZ
s5JCkQ//fbqmB3EVRceZI0ugxSzJRNRF+PHrSkMJO2IHOs8NRO2guAHi8Lp1Ish9
FfwMbkYt5XMlVnmuq17jDc4HFQrISgAQCwkhS6J3P+CZtyLRf8sc8UMQ0VF/jAoS
muTD/Gm94WAxsEL++e1SlIuZ8t1o9CwL/b8aOTMghTaij7ZB4JHtfo2d6zkVksoc
RMzJNN5VXfnUqRKeeeMf9qbnydsazyRHWr/jsMktUc3G7HilLJhNT3vvPEfPlgK/
ODqHO+8DyPrT5oCVUM1i5h0rk7VQCrSEDkNh0DKQePl8NYfW1P+fTgbhUY19fBAR
+V6qZLQNoCOkBN2wN+1Hz3v0fhF605eYO1bPBplRcL5zYyEy41McWTOOJ4YKLIrM
M0UPfkyljLiDkNn8IlfNUcVW+KfgT64OoUMc9u40LRbm20I4ub3FL5ubRQqMvMHD
xPVAcMdY/N8P6uIXEXVqYEd5I37seFldw4bTqzfaeD65vXvnOv0CAOwVgOZrkRzQ
dWnJVFrBEsQsaxlePt2NQY368SxREv9Yqkhw4hBK66eG471LkpEVqzIJvB76tQBn
JDwr7F4yMFIFRV+uj0PcBjMeiJ8ua7t9xcSqNq6GtW9/DOZ/LufgrE36Od9rffN0
zT1KKEgM/iedA20p20EdyWfKvaYCI5OaM7QtVb3JPgIr1plPoSs=
=Ir56
-----END PGP SIGNATURE-----

--a/JNFcIeN8xVqrhe--

