Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQK1q-0002BI-Qd
	for mharc-qemu-riscv@gnu.org; Tue, 14 Sep 2021 21:48:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mQK1l-00023A-Qg; Tue, 14 Sep 2021 21:47:57 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:43035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mQK1g-0000O0-LF; Tue, 14 Sep 2021 21:47:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1631670453;
 bh=Ivfg+ktSuvZNpNcvDR8ynJGrGTajsWBweswhlpkQoQc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=L2N0Q7Qrk2wz98QuwDJPrZfDZb2E+jrKwl5C4yMl4hdjnCAuObbF3u38UtLlVe95U
 Yat1RX8swb5lypqf/yZjGbR9igRJFXqpCadF7QlHb2cZwCJyYBMliDHfZulmeBAMka
 K/Y8rVloXC7G6mYCPHNVtdbDEIPKo++Mje25BGqU=
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4H8NPx01BKz9sVq; Wed, 15 Sep 2021 11:47:32 +1000 (AEST)
Date: Wed, 15 Sep 2021 11:37:12 +1000
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
Subject: Re: [PATCH v2 20/53] target/ppc: convert to use format_state instead
 of dump_state
Message-ID: <YUFOSC93VUSv77m2@yekko>
References: <20210914142042.1655100-1-berrange@redhat.com>
 <20210914142042.1655100-21-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="bBqJMaMk9VlgpXoE"
Content-Disposition: inline
In-Reply-To: <20210914142042.1655100-21-berrange@redhat.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
X-List-Received-Date: Wed, 15 Sep 2021 01:47:58 -0000


--bBqJMaMk9VlgpXoE
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 14, 2021 at 03:20:09PM +0100, Daniel P. Berrang=E9 wrote:
> Signed-off-by: Daniel P. Berrang=E9 <berrange@redhat.com>

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  target/ppc/cpu.h      |   2 +-
>  target/ppc/cpu_init.c | 212 +++++++++++++++++++++++++-----------------
>  2 files changed, 126 insertions(+), 88 deletions(-)
>=20
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 500205229c..c84ae29b98 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -1256,7 +1256,7 @@ DECLARE_OBJ_CHECKERS(PPCVirtualHypervisor, PPCVirtu=
alHypervisorClass,
> =20
>  void ppc_cpu_do_interrupt(CPUState *cpu);
>  bool ppc_cpu_exec_interrupt(CPUState *cpu, int int_req);
> -void ppc_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
> +void ppc_cpu_format_state(CPUState *cpu, GString *buf, int flags);
>  hwaddr ppc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
>  int ppc_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
>  int ppc_cpu_gdb_read_register_apple(CPUState *cpu, GByteArray *buf, int =
reg);
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index ad7abc6041..3456be465c 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -9043,7 +9043,7 @@ static void ppc_cpu_class_init(ObjectClass *oc, voi=
d *data)
> =20
>      cc->class_by_name =3D ppc_cpu_class_by_name;
>      cc->has_work =3D ppc_cpu_has_work;
> -    cc->dump_state =3D ppc_cpu_dump_state;
> +    cc->format_state =3D ppc_cpu_format_state;
>      cc->set_pc =3D ppc_cpu_set_pc;
>      cc->gdb_read_register =3D ppc_cpu_gdb_read_register;
>      cc->gdb_write_register =3D ppc_cpu_gdb_write_register;
> @@ -9104,7 +9104,7 @@ static void ppc_cpu_register_types(void)
>  #endif
>  }
> =20
> -void ppc_cpu_dump_state(CPUState *cs, FILE *f, int flags)
> +void ppc_cpu_format_state(CPUState *cs, GString *buf, int flags)
>  {
>  #define RGPL  4
>  #define RFPL  4
> @@ -9113,39 +9113,41 @@ void ppc_cpu_dump_state(CPUState *cs, FILE *f, in=
t flags)
>      CPUPPCState *env =3D &cpu->env;
>      int i;
> =20
> -    qemu_fprintf(f, "NIP " TARGET_FMT_lx "   LR " TARGET_FMT_lx " CTR "
> -                 TARGET_FMT_lx " XER " TARGET_FMT_lx " CPU#%d\n",
> -                 env->nip, env->lr, env->ctr, cpu_read_xer(env),
> -                 cs->cpu_index);
> -    qemu_fprintf(f, "MSR " TARGET_FMT_lx " HID0 " TARGET_FMT_lx "  HF "
> -                 "%08x iidx %d didx %d\n",
> -                 env->msr, env->spr[SPR_HID0], env->hflags,
> -                 cpu_mmu_index(env, true), cpu_mmu_index(env, false));
> +    g_string_append_printf(buf,
> +                           "NIP " TARGET_FMT_lx "   LR " TARGET_FMT_lx "=
 CTR "
> +                           TARGET_FMT_lx " XER " TARGET_FMT_lx " CPU#%d\=
n",
> +                           env->nip, env->lr, env->ctr, cpu_read_xer(env=
),
> +                           cs->cpu_index);
> +    g_string_append_printf(buf,
> +                           "MSR " TARGET_FMT_lx " HID0 " TARGET_FMT_lx "=
  HF "
> +                           "%08x iidx %d didx %d\n",
> +                           env->msr, env->spr[SPR_HID0], env->hflags,
> +                           cpu_mmu_index(env, true), cpu_mmu_index(env, =
false));
>  #if !defined(NO_TIMER_DUMP)
> -    qemu_fprintf(f, "TB %08" PRIu32 " %08" PRIu64
> +    g_string_append_printf(buf, "TB %08" PRIu32 " %08" PRIu64
>  #if !defined(CONFIG_USER_ONLY)
> -                 " DECR " TARGET_FMT_lu
> +                           " DECR " TARGET_FMT_lu
>  #endif
> -                 "\n",
> -                 cpu_ppc_load_tbu(env), cpu_ppc_load_tbl(env)
> +                           "\n",
> +                           cpu_ppc_load_tbu(env), cpu_ppc_load_tbl(env)
>  #if !defined(CONFIG_USER_ONLY)
> -                 , cpu_ppc_load_decr(env)
> +                           , cpu_ppc_load_decr(env)
>  #endif
>          );
>  #endif
>      for (i =3D 0; i < 32; i++) {
>          if ((i & (RGPL - 1)) =3D=3D 0) {
> -            qemu_fprintf(f, "GPR%02d", i);
> +            g_string_append_printf(buf, "GPR%02d", i);
>          }
> -        qemu_fprintf(f, " %016" PRIx64, ppc_dump_gpr(env, i));
> +        g_string_append_printf(buf, " %016" PRIx64, ppc_dump_gpr(env, i)=
);
>          if ((i & (RGPL - 1)) =3D=3D (RGPL - 1)) {
> -            qemu_fprintf(f, "\n");
> +            g_string_append_printf(buf, "\n");
>          }
>      }
> -    qemu_fprintf(f, "CR ");
> +    g_string_append_printf(buf, "CR ");
>      for (i =3D 0; i < 8; i++)
> -        qemu_fprintf(f, "%01x", env->crf[i]);
> -    qemu_fprintf(f, "  [");
> +        g_string_append_printf(buf, "%01x", env->crf[i]);
> +    g_string_append_printf(buf, "  [");
>      for (i =3D 0; i < 8; i++) {
>          char a =3D '-';
>          if (env->crf[i] & 0x08) {
> @@ -9155,75 +9157,97 @@ void ppc_cpu_dump_state(CPUState *cs, FILE *f, in=
t flags)
>          } else if (env->crf[i] & 0x02) {
>              a =3D 'E';
>          }
> -        qemu_fprintf(f, " %c%c", a, env->crf[i] & 0x01 ? 'O' : ' ');
> +        g_string_append_printf(buf, " %c%c", a, env->crf[i] & 0x01 ? 'O'=
 : ' ');
>      }
> -    qemu_fprintf(f, " ]             RES " TARGET_FMT_lx "\n",
> -                 env->reserve_addr);
> +    g_string_append_printf(buf, " ]             RES " TARGET_FMT_lx "\n",
> +                           env->reserve_addr);
> =20
>      if (flags & CPU_DUMP_FPU) {
>          for (i =3D 0; i < 32; i++) {
>              if ((i & (RFPL - 1)) =3D=3D 0) {
> -                qemu_fprintf(f, "FPR%02d", i);
> +                g_string_append_printf(buf, "FPR%02d", i);
>              }
> -            qemu_fprintf(f, " %016" PRIx64, *cpu_fpr_ptr(env, i));
> +            g_string_append_printf(buf, " %016" PRIx64, *cpu_fpr_ptr(env=
, i));
>              if ((i & (RFPL - 1)) =3D=3D (RFPL - 1)) {
> -                qemu_fprintf(f, "\n");
> +                g_string_append_printf(buf, "\n");
>              }
>          }
> -        qemu_fprintf(f, "FPSCR " TARGET_FMT_lx "\n", env->fpscr);
> +        g_string_append_printf(buf, "FPSCR " TARGET_FMT_lx "\n", env->fp=
scr);
>      }
> =20
>  #if !defined(CONFIG_USER_ONLY)
> -    qemu_fprintf(f, " SRR0 " TARGET_FMT_lx "  SRR1 " TARGET_FMT_lx
> -                 "    PVR " TARGET_FMT_lx " VRSAVE " TARGET_FMT_lx "\n",
> -                 env->spr[SPR_SRR0], env->spr[SPR_SRR1],
> -                 env->spr[SPR_PVR], env->spr[SPR_VRSAVE]);
> -
> -    qemu_fprintf(f, "SPRG0 " TARGET_FMT_lx " SPRG1 " TARGET_FMT_lx
> -                 "  SPRG2 " TARGET_FMT_lx "  SPRG3 " TARGET_FMT_lx "\n",
> -                 env->spr[SPR_SPRG0], env->spr[SPR_SPRG1],
> -                 env->spr[SPR_SPRG2], env->spr[SPR_SPRG3]);
> -
> -    qemu_fprintf(f, "SPRG4 " TARGET_FMT_lx " SPRG5 " TARGET_FMT_lx
> -                 "  SPRG6 " TARGET_FMT_lx "  SPRG7 " TARGET_FMT_lx "\n",
> -                 env->spr[SPR_SPRG4], env->spr[SPR_SPRG5],
> -                 env->spr[SPR_SPRG6], env->spr[SPR_SPRG7]);
> +    g_string_append_printf(buf, " SRR0 " TARGET_FMT_lx "  SRR1 " TARGET_=
FMT_lx
> +                           "    PVR " TARGET_FMT_lx " VRSAVE " TARGET_FM=
T_lx
> +                           "\n",
> +                           env->spr[SPR_SRR0], env->spr[SPR_SRR1],
> +                           env->spr[SPR_PVR], env->spr[SPR_VRSAVE]);
> +
> +    g_string_append_printf(buf, "SPRG0 " TARGET_FMT_lx " SPRG1 " TARGET_=
FMT_lx
> +                           "  SPRG2 " TARGET_FMT_lx "  SPRG3 " TARGET_FM=
T_lx
> +                           "\n",
> +                           env->spr[SPR_SPRG0], env->spr[SPR_SPRG1],
> +                           env->spr[SPR_SPRG2], env->spr[SPR_SPRG3]);
> +
> +    g_string_append_printf(buf, "SPRG4 " TARGET_FMT_lx " SPRG5 " TARGET_=
FMT_lx
> +                           "  SPRG6 " TARGET_FMT_lx "  SPRG7 " TARGET_FM=
T_lx
> +                           "\n",
> +                           env->spr[SPR_SPRG4], env->spr[SPR_SPRG5],
> +                           env->spr[SPR_SPRG6], env->spr[SPR_SPRG7]);
> =20
>  #if defined(TARGET_PPC64)
>      if (env->excp_model =3D=3D POWERPC_EXCP_POWER7 ||
>          env->excp_model =3D=3D POWERPC_EXCP_POWER8 ||
>          env->excp_model =3D=3D POWERPC_EXCP_POWER9 ||
>          env->excp_model =3D=3D POWERPC_EXCP_POWER10)  {
> -        qemu_fprintf(f, "HSRR0 " TARGET_FMT_lx " HSRR1 " TARGET_FMT_lx "=
\n",
> -                     env->spr[SPR_HSRR0], env->spr[SPR_HSRR1]);
> +        g_string_append_printf(buf, "HSRR0 " TARGET_FMT_lx
> +                               " HSRR1 " TARGET_FMT_lx "\n",
> +                               env->spr[SPR_HSRR0], env->spr[SPR_HSRR1]);
>      }
>  #endif
>      if (env->excp_model =3D=3D POWERPC_EXCP_BOOKE) {
> -        qemu_fprintf(f, "CSRR0 " TARGET_FMT_lx " CSRR1 " TARGET_FMT_lx
> -                     " MCSRR0 " TARGET_FMT_lx " MCSRR1 " TARGET_FMT_lx "=
\n",
> -                     env->spr[SPR_BOOKE_CSRR0], env->spr[SPR_BOOKE_CSRR1=
],
> -                     env->spr[SPR_BOOKE_MCSRR0], env->spr[SPR_BOOKE_MCSR=
R1]);
> -
> -        qemu_fprintf(f, "  TCR " TARGET_FMT_lx "   TSR " TARGET_FMT_lx
> -                     "    ESR " TARGET_FMT_lx "   DEAR " TARGET_FMT_lx "=
\n",
> -                     env->spr[SPR_BOOKE_TCR], env->spr[SPR_BOOKE_TSR],
> -                     env->spr[SPR_BOOKE_ESR], env->spr[SPR_BOOKE_DEAR]);
> -
> -        qemu_fprintf(f, "  PIR " TARGET_FMT_lx " DECAR " TARGET_FMT_lx
> -                     "   IVPR " TARGET_FMT_lx "   EPCR " TARGET_FMT_lx "=
\n",
> -                     env->spr[SPR_BOOKE_PIR], env->spr[SPR_BOOKE_DECAR],
> -                     env->spr[SPR_BOOKE_IVPR], env->spr[SPR_BOOKE_EPCR]);
> -
> -        qemu_fprintf(f, " MCSR " TARGET_FMT_lx " SPRG8 " TARGET_FMT_lx
> -                     "    EPR " TARGET_FMT_lx "\n",
> -                     env->spr[SPR_BOOKE_MCSR], env->spr[SPR_BOOKE_SPRG8],
> -                     env->spr[SPR_BOOKE_EPR]);
> +        g_string_append_printf(buf, "CSRR0 " TARGET_FMT_lx
> +                               " CSRR1 " TARGET_FMT_lx
> +                               " MCSRR0 " TARGET_FMT_lx
> +                               " MCSRR1 " TARGET_FMT_lx "\n",
> +                               env->spr[SPR_BOOKE_CSRR0],
> +                               env->spr[SPR_BOOKE_CSRR1],
> +                               env->spr[SPR_BOOKE_MCSRR0],
> +                               env->spr[SPR_BOOKE_MCSRR1]);
> +
> +        g_string_append_printf(buf, "  TCR " TARGET_FMT_lx
> +                               "   TSR " TARGET_FMT_lx
> +                               "    ESR " TARGET_FMT_lx
> +                               "   DEAR " TARGET_FMT_lx "\n",
> +                               env->spr[SPR_BOOKE_TCR],
> +                               env->spr[SPR_BOOKE_TSR],
> +                               env->spr[SPR_BOOKE_ESR],
> +                               env->spr[SPR_BOOKE_DEAR]);
> +
> +        g_string_append_printf(buf, "  PIR " TARGET_FMT_lx
> +                               " DECAR " TARGET_FMT_lx
> +                               "   IVPR " TARGET_FMT_lx
> +                               "   EPCR " TARGET_FMT_lx "\n",
> +                               env->spr[SPR_BOOKE_PIR],
> +                               env->spr[SPR_BOOKE_DECAR],
> +                               env->spr[SPR_BOOKE_IVPR],
> +                               env->spr[SPR_BOOKE_EPCR]);
> +
> +        g_string_append_printf(buf, " MCSR " TARGET_FMT_lx
> +                               " SPRG8 " TARGET_FMT_lx
> +                               "    EPR " TARGET_FMT_lx "\n",
> +                               env->spr[SPR_BOOKE_MCSR],
> +                               env->spr[SPR_BOOKE_SPRG8],
> +                               env->spr[SPR_BOOKE_EPR]);
> =20
>          /* FSL-specific */
> -        qemu_fprintf(f, " MCAR " TARGET_FMT_lx "  PID1 " TARGET_FMT_lx
> -                     "   PID2 " TARGET_FMT_lx "    SVR " TARGET_FMT_lx "=
\n",
> -                     env->spr[SPR_Exxx_MCAR], env->spr[SPR_BOOKE_PID1],
> -                     env->spr[SPR_BOOKE_PID2], env->spr[SPR_E500_SVR]);
> +        g_string_append_printf(buf, " MCAR " TARGET_FMT_lx
> +                               "  PID1 " TARGET_FMT_lx
> +                               "   PID2 " TARGET_FMT_lx
> +                               "    SVR " TARGET_FMT_lx "\n",
> +                               env->spr[SPR_Exxx_MCAR],
> +                               env->spr[SPR_BOOKE_PID1],
> +                               env->spr[SPR_BOOKE_PID2],
> +                               env->spr[SPR_E500_SVR]);
> =20
>          /*
>           * IVORs are left out as they are large and do not change often =
--
> @@ -9233,12 +9257,13 @@ void ppc_cpu_dump_state(CPUState *cs, FILE *f, in=
t flags)
> =20
>  #if defined(TARGET_PPC64)
>      if (env->flags & POWERPC_FLAG_CFAR) {
> -        qemu_fprintf(f, " CFAR " TARGET_FMT_lx"\n", env->cfar);
> +        g_string_append_printf(buf, " CFAR " TARGET_FMT_lx"\n", env->cfa=
r);
>      }
>  #endif
> =20
>      if (env->spr_cb[SPR_LPCR].name) {
> -        qemu_fprintf(f, " LPCR " TARGET_FMT_lx "\n", env->spr[SPR_LPCR]);
> +        g_string_append_printf(buf,
> +                               " LPCR " TARGET_FMT_lx "\n", env->spr[SPR=
_LPCR]);
>      }
> =20
>      switch (env->mmu_model) {
> @@ -9254,29 +9279,42 @@ void ppc_cpu_dump_state(CPUState *cs, FILE *f, in=
t flags)
>      case POWERPC_MMU_3_00:
>  #endif
>          if (env->spr_cb[SPR_SDR1].name) { /* SDR1 Exists */
> -            qemu_fprintf(f, " SDR1 " TARGET_FMT_lx " ", env->spr[SPR_SDR=
1]);
> +            g_string_append_printf(buf, " SDR1 " TARGET_FMT_lx " ",
> +                                   env->spr[SPR_SDR1]);
>          }
>          if (env->spr_cb[SPR_PTCR].name) { /* PTCR Exists */
> -            qemu_fprintf(f, " PTCR " TARGET_FMT_lx " ", env->spr[SPR_PTC=
R]);
> +            g_string_append_printf(buf, " PTCR " TARGET_FMT_lx " ",
> +                                   env->spr[SPR_PTCR]);
>          }
> -        qemu_fprintf(f, "  DAR " TARGET_FMT_lx "  DSISR " TARGET_FMT_lx =
"\n",
> -                     env->spr[SPR_DAR], env->spr[SPR_DSISR]);
> +        g_string_append_printf(buf, "  DAR " TARGET_FMT_lx "  DSISR "
> +                               TARGET_FMT_lx "\n",
> +                               env->spr[SPR_DAR], env->spr[SPR_DSISR]);
>          break;
>      case POWERPC_MMU_BOOKE206:
> -        qemu_fprintf(f, " MAS0 " TARGET_FMT_lx "  MAS1 " TARGET_FMT_lx
> -                     "   MAS2 " TARGET_FMT_lx "   MAS3 " TARGET_FMT_lx "=
\n",
> -                     env->spr[SPR_BOOKE_MAS0], env->spr[SPR_BOOKE_MAS1],
> -                     env->spr[SPR_BOOKE_MAS2], env->spr[SPR_BOOKE_MAS3]);
> -
> -        qemu_fprintf(f, " MAS4 " TARGET_FMT_lx "  MAS6 " TARGET_FMT_lx
> -                     "   MAS7 " TARGET_FMT_lx "    PID " TARGET_FMT_lx "=
\n",
> -                     env->spr[SPR_BOOKE_MAS4], env->spr[SPR_BOOKE_MAS6],
> -                     env->spr[SPR_BOOKE_MAS7], env->spr[SPR_BOOKE_PID]);
> -
> -        qemu_fprintf(f, "MMUCFG " TARGET_FMT_lx " TLB0CFG " TARGET_FMT_lx
> -                     " TLB1CFG " TARGET_FMT_lx "\n",
> -                     env->spr[SPR_MMUCFG], env->spr[SPR_BOOKE_TLB0CFG],
> -                     env->spr[SPR_BOOKE_TLB1CFG]);
> +        g_string_append_printf(buf, " MAS0 " TARGET_FMT_lx
> +                               "  MAS1 " TARGET_FMT_lx
> +                               "   MAS2 " TARGET_FMT_lx
> +                               "   MAS3 " TARGET_FMT_lx "\n",
> +                               env->spr[SPR_BOOKE_MAS0],
> +                               env->spr[SPR_BOOKE_MAS1],
> +                               env->spr[SPR_BOOKE_MAS2],
> +                               env->spr[SPR_BOOKE_MAS3]);
> +
> +        g_string_append_printf(buf, " MAS4 " TARGET_FMT_lx
> +                               "  MAS6 " TARGET_FMT_lx
> +                               "   MAS7 " TARGET_FMT_lx
> +                               "    PID " TARGET_FMT_lx "\n",
> +                               env->spr[SPR_BOOKE_MAS4],
> +                               env->spr[SPR_BOOKE_MAS6],
> +                               env->spr[SPR_BOOKE_MAS7],
> +                               env->spr[SPR_BOOKE_PID]);
> +
> +        g_string_append_printf(buf, "MMUCFG " TARGET_FMT_lx
> +                               " TLB0CFG " TARGET_FMT_lx
> +                               " TLB1CFG " TARGET_FMT_lx "\n",
> +                               env->spr[SPR_MMUCFG],
> +                               env->spr[SPR_BOOKE_TLB0CFG],
> +                               env->spr[SPR_BOOKE_TLB1CFG]);
>          break;
>      default:
>          break;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--bBqJMaMk9VlgpXoE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFBTkYACgkQbDjKyiDZ
s5JKERAAkKYDEjcl9KTZinOXC4mOtNmXhjfep0x1/v4ZTLGdUqKO+lX/NbuZB3xE
MD+8kbuCYGHKFeOMphuaWfGfdBOqBOoGk7ZjKpk8d9ejQhXgJ33+i3JGYTwjEw/r
mQZKlDQXXP1RQM0lwS50MnFZ2vbWOvK16TvKm+iPhlGjiPMtkaHyDEuYda0ULk44
wycQdXPhlBuOFCWVtlCgf7fg7PhOfoSpxIQzXS831EvLm0hTrJMFsrHp+84dGTpb
Zz4oDPaj36aSvrR921+cqjJ8TqTad73+945Cn522TTkVR5j9g3K6BIj184e2SlWK
zBEtURKOaDI2IziLh1ZDKdxwkfPGvamw+NLmHCepF0gNXKAhB4RAYS2fFoA63FxH
ZbnyFV0JQZdG+jXzuZbwagu3aK6NUafE3BnzH5kozyX79kT+gJ97haYJYY6X1ksT
t8Imj6IqvMWzEdGV5SLSBn5E2092cvaLCJpkZeJ2I8MsFVqnWrlcQBpIq0Ki3hVg
da11VZUqR6hQ3FmPx0D+9NcQP4huaPCLiKqcFjqtr4TWMqSQxhXTVOY5g8GzF1IB
30y+RAU4W54g7djNAWi+c9KwGgffjrPNqnBuPnLtGEZELpDvdOyEYs/FG1qs7AO4
a/+HT/yjFODxQ+dcbqdj05tHolNq04RYME+zD5XxAEOuT+QxhDY=
=Lsgw
-----END PGP SIGNATURE-----

--bBqJMaMk9VlgpXoE--

