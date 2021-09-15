Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQK1q-00029k-Dm
	for mharc-qemu-riscv@gnu.org; Tue, 14 Sep 2021 21:48:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mQK1l-000239-O2; Tue, 14 Sep 2021 21:47:57 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:40305 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mQK1g-0000O1-K6; Tue, 14 Sep 2021 21:47:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1631670453;
 bh=7Wv1DfgAyZ9lWydSV0ET07SCIrR7pdmsPJKoAD3x84o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pyqYggh0IIy54nBzKDMyCCQszU0bhG1YwKBIAXWSNpiF5mjr1lUxo4RHO9YVX02sI
 xEplEM8UmSPReKn9d/0M1YTkg/qRx79sYAy4EWj3JYdhfStBROly8Fkwt0bMYOmKem
 CsmEcif4ouzvMMAKjwl29xwF8a7dvD0fzKfR44eo=
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4H8NPx0gspz9sRK; Wed, 15 Sep 2021 11:47:33 +1000 (AEST)
Date: Wed, 15 Sep 2021 11:40:03 +1000
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
Subject: Re: [PATCH v2 46/53] target/ppc: convert to use format_tlb callback
Message-ID: <YUFO82Nbe50k2Mih@yekko>
References: <20210914142042.1655100-1-berrange@redhat.com>
 <20210914142042.1655100-47-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+gv/YgNjt/MgA38s"
Content-Disposition: inline
In-Reply-To: <20210914142042.1655100-47-berrange@redhat.com>
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


--+gv/YgNjt/MgA38s
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 14, 2021 at 03:20:35PM +0100, Daniel P. Berrang=E9 wrote:
> Change the "info tlb" implementation to use the format_tlb callback.
>=20
> Signed-off-by: Daniel P. Berrang=E9 <berrange@redhat.com>

Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  target/ppc/cpu.h        |   3 +-
>  target/ppc/cpu_init.c   |   3 +
>  target/ppc/mmu-hash64.c |   8 +-
>  target/ppc/mmu-hash64.h |   2 +-
>  target/ppc/mmu_common.c | 167 ++++++++++++++++++++++------------------
>  target/ppc/monitor.c    |  10 ++-
>  6 files changed, 107 insertions(+), 86 deletions(-)
>=20
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index c84ae29b98..37b44bfbc3 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -1257,6 +1257,7 @@ DECLARE_OBJ_CHECKERS(PPCVirtualHypervisor, PPCVirtu=
alHypervisorClass,
>  void ppc_cpu_do_interrupt(CPUState *cpu);
>  bool ppc_cpu_exec_interrupt(CPUState *cpu, int int_req);
>  void ppc_cpu_format_state(CPUState *cpu, GString *buf, int flags);
> +void ppc_cpu_format_tlb(CPUState *cpu, GString *buf);
>  hwaddr ppc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
>  int ppc_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
>  int ppc_cpu_gdb_read_register_apple(CPUState *cpu, GByteArray *buf, int =
reg);
> @@ -2667,8 +2668,6 @@ static inline bool ppc_interrupts_little_endian(Pow=
erPCCPU *cpu)
>      return false;
>  }
> =20
> -void dump_mmu(CPUPPCState *env);
> -
>  void ppc_maybe_bswap_register(CPUPPCState *env, uint8_t *mem_buf, int le=
n);
>  void ppc_store_vscr(CPUPPCState *env, uint32_t vscr);
>  uint32_t ppc_get_vscr(CPUPPCState *env);
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 3456be465c..98d6f40a49 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -9044,6 +9044,9 @@ static void ppc_cpu_class_init(ObjectClass *oc, voi=
d *data)
>      cc->class_by_name =3D ppc_cpu_class_by_name;
>      cc->has_work =3D ppc_cpu_has_work;
>      cc->format_state =3D ppc_cpu_format_state;
> +#ifndef CONFIG_USER_ONLY
> +    cc->format_tlb =3D ppc_cpu_format_tlb;
> +#endif
>      cc->set_pc =3D ppc_cpu_set_pc;
>      cc->gdb_read_register =3D ppc_cpu_gdb_read_register;
>      cc->gdb_write_register =3D ppc_cpu_gdb_write_register;
> diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
> index 19832c4b46..73927a0819 100644
> --- a/target/ppc/mmu-hash64.c
> +++ b/target/ppc/mmu-hash64.c
> @@ -80,7 +80,7 @@ static ppc_slb_t *slb_lookup(PowerPCCPU *cpu, target_ul=
ong eaddr)
>      return NULL;
>  }
> =20
> -void dump_slb(PowerPCCPU *cpu)
> +void dump_slb(PowerPCCPU *cpu, GString *buf)
>  {
>      CPUPPCState *env =3D &cpu->env;
>      int i;
> @@ -88,15 +88,15 @@ void dump_slb(PowerPCCPU *cpu)
> =20
>      cpu_synchronize_state(CPU(cpu));
> =20
> -    qemu_printf("SLB\tESID\t\t\tVSID\n");
> +    g_string_append_printf(buf, "SLB\tESID\t\t\tVSID\n");
>      for (i =3D 0; i < cpu->hash64_opts->slb_size; i++) {
>          slbe =3D env->slb[i].esid;
>          slbv =3D env->slb[i].vsid;
>          if (slbe =3D=3D 0 && slbv =3D=3D 0) {
>              continue;
>          }
> -        qemu_printf("%d\t0x%016" PRIx64 "\t0x%016" PRIx64 "\n",
> -                    i, slbe, slbv);
> +        g_string_append_printf(buf, "%d\t0x%016" PRIx64 "\t0x%016" PRIx6=
4 "\n",
> +                               i, slbe, slbv);
>      }
>  }
> =20
> diff --git a/target/ppc/mmu-hash64.h b/target/ppc/mmu-hash64.h
> index c5b2f97ff7..99e03a5849 100644
> --- a/target/ppc/mmu-hash64.h
> +++ b/target/ppc/mmu-hash64.h
> @@ -4,7 +4,7 @@
>  #ifndef CONFIG_USER_ONLY
> =20
>  #ifdef TARGET_PPC64
> -void dump_slb(PowerPCCPU *cpu);
> +void dump_slb(PowerPCCPU *cpu, GString *buf);
>  int ppc_store_slb(PowerPCCPU *cpu, target_ulong slot,
>                    target_ulong esid, target_ulong vsid);
>  bool ppc_hash64_xlate(PowerPCCPU *cpu, vaddr eaddr, MMUAccessType access=
_type,
> diff --git a/target/ppc/mmu_common.c b/target/ppc/mmu_common.c
> index 754509e556..d7b716f30a 100644
> --- a/target/ppc/mmu_common.c
> +++ b/target/ppc/mmu_common.c
> @@ -937,19 +937,19 @@ static const char *book3e_tsize_to_str[32] =3D {
>      "1T", "2T"
>  };
> =20
> -static void mmubooke_dump_mmu(CPUPPCState *env)
> +static void mmubooke_dump_mmu(CPUPPCState *env, GString *buf)
>  {
>      ppcemb_tlb_t *entry;
>      int i;
> =20
>      if (kvm_enabled() && !env->kvm_sw_tlb) {
> -        qemu_printf("Cannot access KVM TLB\n");
> +        g_string_append_printf(buf, "Cannot access KVM TLB\n");
>          return;
>      }
> =20
> -    qemu_printf("\nTLB:\n");
> -    qemu_printf("Effective          Physical           Size PID   Prot  =
   "
> -                "Attr\n");
> +    g_string_append_printf(buf, "\nTLB:\n");
> +    g_string_append_printf(buf, "Effective          Physical           "
> +                           "Size PID   Prot     Attr\n");
> =20
>      entry =3D &env->tlb.tlbe[0];
>      for (i =3D 0; i < env->nb_tlb; i++, entry++) {
> @@ -973,22 +973,24 @@ static void mmubooke_dump_mmu(CPUPPCState *env)
>          } else {
>              snprintf(size_buf, sizeof(size_buf), "%3" PRId64 "k", size /=
 KiB);
>          }
> -        qemu_printf("0x%016" PRIx64 " 0x%016" PRIx64 " %s %-5u %08x %08x=
\n",
> -                    (uint64_t)ea, (uint64_t)pa, size_buf, (uint32_t)entr=
y->PID,
> -                    entry->prot, entry->attr);
> +        g_string_append_printf(buf, "0x%016" PRIx64 " 0x%016" PRIx64
> +                               " %s %-5u %08x %08x\n",
> +                               (uint64_t)ea, (uint64_t)pa, size_buf,
> +                               (uint32_t)entry->PID,
> +                               entry->prot, entry->attr);
>      }
> =20
>  }
> =20
>  static void mmubooke206_dump_one_tlb(CPUPPCState *env, int tlbn, int off=
set,
> -                                     int tlbsize)
> +                                     int tlbsize, GString *buf)
>  {
>      ppcmas_tlb_t *entry;
>      int i;
> =20
> -    qemu_printf("\nTLB%d:\n", tlbn);
> -    qemu_printf("Effective          Physical           Size TID   TS SRW=
X"
> -                " URWX WIMGE U0123\n");
> +    g_string_append_printf(buf, "\nTLB%d:\n", tlbn);
> +    g_string_append_printf(buf, "Effective          Physical           "
> +                           "Size TID   TS SRWX URWX WIMGE U0123\n");
> =20
>      entry =3D &env->tlb.tlbm[offset];
>      for (i =3D 0; i < tlbsize; i++, entry++) {
> @@ -1004,37 +1006,38 @@ static void mmubooke206_dump_one_tlb(CPUPPCState =
*env, int tlbn, int offset,
>          ea =3D entry->mas2 & ~(size - 1);
>          pa =3D entry->mas7_3 & ~(size - 1);
> =20
> -        qemu_printf("0x%016" PRIx64 " 0x%016" PRIx64 " %4s %-5u %1u  S%c=
%c%c"
> -                    "U%c%c%c %c%c%c%c%c U%c%c%c%c\n",
> -                    (uint64_t)ea, (uint64_t)pa,
> -                    book3e_tsize_to_str[tsize],
> -                    (entry->mas1 & MAS1_TID_MASK) >> MAS1_TID_SHIFT,
> -                    (entry->mas1 & MAS1_TS) >> MAS1_TS_SHIFT,
> -                    entry->mas7_3 & MAS3_SR ? 'R' : '-',
> -                    entry->mas7_3 & MAS3_SW ? 'W' : '-',
> -                    entry->mas7_3 & MAS3_SX ? 'X' : '-',
> -                    entry->mas7_3 & MAS3_UR ? 'R' : '-',
> -                    entry->mas7_3 & MAS3_UW ? 'W' : '-',
> -                    entry->mas7_3 & MAS3_UX ? 'X' : '-',
> -                    entry->mas2 & MAS2_W ? 'W' : '-',
> -                    entry->mas2 & MAS2_I ? 'I' : '-',
> -                    entry->mas2 & MAS2_M ? 'M' : '-',
> -                    entry->mas2 & MAS2_G ? 'G' : '-',
> -                    entry->mas2 & MAS2_E ? 'E' : '-',
> -                    entry->mas7_3 & MAS3_U0 ? '0' : '-',
> -                    entry->mas7_3 & MAS3_U1 ? '1' : '-',
> -                    entry->mas7_3 & MAS3_U2 ? '2' : '-',
> -                    entry->mas7_3 & MAS3_U3 ? '3' : '-');
> +        g_string_append_printf(buf, "0x%016" PRIx64 " 0x%016" PRIx64
> +                               " %4s %-5u %1u  S%c%c%c"
> +                               "U%c%c%c %c%c%c%c%c U%c%c%c%c\n",
> +                               (uint64_t)ea, (uint64_t)pa,
> +                               book3e_tsize_to_str[tsize],
> +                               (entry->mas1 & MAS1_TID_MASK) >> MAS1_TID=
_SHIFT,
> +                               (entry->mas1 & MAS1_TS) >> MAS1_TS_SHIFT,
> +                               entry->mas7_3 & MAS3_SR ? 'R' : '-',
> +                               entry->mas7_3 & MAS3_SW ? 'W' : '-',
> +                               entry->mas7_3 & MAS3_SX ? 'X' : '-',
> +                               entry->mas7_3 & MAS3_UR ? 'R' : '-',
> +                               entry->mas7_3 & MAS3_UW ? 'W' : '-',
> +                               entry->mas7_3 & MAS3_UX ? 'X' : '-',
> +                               entry->mas2 & MAS2_W ? 'W' : '-',
> +                               entry->mas2 & MAS2_I ? 'I' : '-',
> +                               entry->mas2 & MAS2_M ? 'M' : '-',
> +                               entry->mas2 & MAS2_G ? 'G' : '-',
> +                               entry->mas2 & MAS2_E ? 'E' : '-',
> +                               entry->mas7_3 & MAS3_U0 ? '0' : '-',
> +                               entry->mas7_3 & MAS3_U1 ? '1' : '-',
> +                               entry->mas7_3 & MAS3_U2 ? '2' : '-',
> +                               entry->mas7_3 & MAS3_U3 ? '3' : '-');
>      }
>  }
> =20
> -static void mmubooke206_dump_mmu(CPUPPCState *env)
> +static void mmubooke206_dump_mmu(CPUPPCState *env, GString *buf)
>  {
>      int offset =3D 0;
>      int i;
> =20
>      if (kvm_enabled() && !env->kvm_sw_tlb) {
> -        qemu_printf("Cannot access KVM TLB\n");
> +        g_string_append_printf(buf, "Cannot access KVM TLB\n");
>          return;
>      }
> =20
> @@ -1045,12 +1048,12 @@ static void mmubooke206_dump_mmu(CPUPPCState *env)
>              continue;
>          }
> =20
> -        mmubooke206_dump_one_tlb(env, i, offset, size);
> +        mmubooke206_dump_one_tlb(env, i, offset, size, buf);
>          offset +=3D size;
>      }
>  }
> =20
> -static void mmu6xx_dump_BATs(CPUPPCState *env, int type)
> +static void mmu6xx_dump_BATs(CPUPPCState *env, int type, GString *buf)
>  {
>      target_ulong *BATlt, *BATut, *BATu, *BATl;
>      target_ulong BEPIl, BEPIu, bl;
> @@ -1073,51 +1076,59 @@ static void mmu6xx_dump_BATs(CPUPPCState *env, in=
t type)
>          BEPIu =3D *BATu & 0xF0000000;
>          BEPIl =3D *BATu & 0x0FFE0000;
>          bl =3D (*BATu & 0x00001FFC) << 15;
> -        qemu_printf("%s BAT%d BATu " TARGET_FMT_lx
> -                    " BATl " TARGET_FMT_lx "\n\t" TARGET_FMT_lx " "
> -                    TARGET_FMT_lx " " TARGET_FMT_lx "\n",
> -                    type =3D=3D ACCESS_CODE ? "code" : "data", i,
> -                    *BATu, *BATl, BEPIu, BEPIl, bl);
> +        g_string_append_printf(buf, "%s BAT%d BATu " TARGET_FMT_lx
> +                               " BATl " TARGET_FMT_lx "\n\t" TARGET_FMT_=
lx " "
> +                               TARGET_FMT_lx " " TARGET_FMT_lx "\n",
> +                               type =3D=3D ACCESS_CODE ? "code" : "data"=
, i,
> +                               *BATu, *BATl, BEPIu, BEPIl, bl);
>      }
>  }
> =20
> -static void mmu6xx_dump_mmu(CPUPPCState *env)
> +static void mmu6xx_dump_mmu(CPUPPCState *env, GString *buf)
>  {
>      PowerPCCPU *cpu =3D env_archcpu(env);
>      ppc6xx_tlb_t *tlb;
>      target_ulong sr;
>      int type, way, entry, i;
> =20
> -    qemu_printf("HTAB base =3D 0x%"HWADDR_PRIx"\n", ppc_hash32_hpt_base(=
cpu));
> -    qemu_printf("HTAB mask =3D 0x%"HWADDR_PRIx"\n", ppc_hash32_hpt_mask(=
cpu));
> +    g_string_append_printf(buf, "HTAB base =3D 0x%"HWADDR_PRIx"\n",
> +                           ppc_hash32_hpt_base(cpu));
> +    g_string_append_printf(buf, "HTAB mask =3D 0x%"HWADDR_PRIx"\n",
> +                           ppc_hash32_hpt_mask(cpu));
> =20
> -    qemu_printf("\nSegment registers:\n");
> +    g_string_append_printf(buf, "\nSegment registers:\n");
>      for (i =3D 0; i < 32; i++) {
>          sr =3D env->sr[i];
>          if (sr & 0x80000000) {
> -            qemu_printf("%02d T=3D%d Ks=3D%d Kp=3D%d BUID=3D0x%03x "
> -                        "CNTLR_SPEC=3D0x%05x\n", i,
> -                        sr & 0x80000000 ? 1 : 0, sr & 0x40000000 ? 1 : 0,
> -                        sr & 0x20000000 ? 1 : 0, (uint32_t)((sr >> 20) &=
 0x1FF),
> -                        (uint32_t)(sr & 0xFFFFF));
> +            g_string_append_printf(buf, "%02d T=3D%d Ks=3D%d Kp=3D%d BUI=
D=3D0x%03x "
> +                                   "CNTLR_SPEC=3D0x%05x\n", i,
> +                                   sr & 0x80000000 ? 1 : 0,
> +                                   sr & 0x40000000 ? 1 : 0,
> +                                   sr & 0x20000000 ? 1 : 0,
> +                                   (uint32_t)((sr >> 20) & 0x1FF),
> +                                   (uint32_t)(sr & 0xFFFFF));
>          } else {
> -            qemu_printf("%02d T=3D%d Ks=3D%d Kp=3D%d N=3D%d VSID=3D0x%06=
x\n", i,
> -                        sr & 0x80000000 ? 1 : 0, sr & 0x40000000 ? 1 : 0,
> -                        sr & 0x20000000 ? 1 : 0, sr & 0x10000000 ? 1 : 0,
> -                        (uint32_t)(sr & 0x00FFFFFF));
> +            g_string_append_printf(buf, "%02d T=3D%d Ks=3D%d Kp=3D%d N=
=3D%d "
> +                                   "VSID=3D0x%06x\n", i,
> +                                   sr & 0x80000000 ? 1 : 0,
> +                                   sr & 0x40000000 ? 1 : 0,
> +                                   sr & 0x20000000 ? 1 : 0,
> +                                   sr & 0x10000000 ? 1 : 0,
> +                                   (uint32_t)(sr & 0x00FFFFFF));
>          }
>      }
> =20
> -    qemu_printf("\nBATs:\n");
> -    mmu6xx_dump_BATs(env, ACCESS_INT);
> -    mmu6xx_dump_BATs(env, ACCESS_CODE);
> +    g_string_append_printf(buf, "\nBATs:\n");
> +    mmu6xx_dump_BATs(env, ACCESS_INT, buf);
> +    mmu6xx_dump_BATs(env, ACCESS_CODE, buf);
> =20
>      if (env->id_tlbs !=3D 1) {
> -        qemu_printf("ERROR: 6xx MMU should have separated TLB"
> -                    " for code and data\n");
> +        g_string_append_printf(buf, "ERROR: 6xx MMU should have separate=
d TLB"
> +                               " for code and data\n");
>      }
> =20
> -    qemu_printf("\nTLBs                       [EPN    EPN + SIZE]\n");
> +    g_string_append_printf(buf,
> +                           "\nTLBs                       [EPN    EPN + S=
IZE]\n");
> =20
>      for (type =3D 0; type < 2; type++) {
>          for (way =3D 0; way < env->nb_ways; way++) {
> @@ -1126,48 +1137,52 @@ static void mmu6xx_dump_mmu(CPUPPCState *env)
>                   entry++) {
> =20
>                  tlb =3D &env->tlb.tlb6[entry];
> -                qemu_printf("%s TLB %02d/%02d way:%d %s ["
> -                            TARGET_FMT_lx " " TARGET_FMT_lx "]\n",
> -                            type ? "code" : "data", entry % env->nb_tlb,
> -                            env->nb_tlb, way,
> -                            pte_is_valid(tlb->pte0) ? "valid" : "inval",
> -                            tlb->EPN, tlb->EPN + TARGET_PAGE_SIZE);
> +                g_string_append_printf(buf, "%s TLB %02d/%02d way:%d %s =
["
> +                                       TARGET_FMT_lx " " TARGET_FMT_lx "=
]\n",
> +                                       type ? "code" : "data",
> +                                       entry % env->nb_tlb,
> +                                       env->nb_tlb, way,
> +                                       pte_is_valid(tlb->pte0) ?
> +                                       "valid" : "inval",
> +                                       tlb->EPN, tlb->EPN + TARGET_PAGE_=
SIZE);
>              }
>          }
>      }
>  }
> =20
> -void dump_mmu(CPUPPCState *env)
> +void ppc_cpu_format_tlb(CPUState *cpu, GString *buf)
>  {
> +    CPUPPCState *env =3D cpu->env_ptr;
> +
>      switch (env->mmu_model) {
>      case POWERPC_MMU_BOOKE:
> -        mmubooke_dump_mmu(env);
> +        mmubooke_dump_mmu(env, buf);
>          break;
>      case POWERPC_MMU_BOOKE206:
> -        mmubooke206_dump_mmu(env);
> +        mmubooke206_dump_mmu(env, buf);
>          break;
>      case POWERPC_MMU_SOFT_6xx:
>      case POWERPC_MMU_SOFT_74xx:
> -        mmu6xx_dump_mmu(env);
> +        mmu6xx_dump_mmu(env, buf);
>          break;
>  #if defined(TARGET_PPC64)
>      case POWERPC_MMU_64B:
>      case POWERPC_MMU_2_03:
>      case POWERPC_MMU_2_06:
>      case POWERPC_MMU_2_07:
> -        dump_slb(env_archcpu(env));
> +        dump_slb(env_archcpu(env), buf);
>          break;
>      case POWERPC_MMU_3_00:
>          if (ppc64_v3_radix(env_archcpu(env))) {
> -            qemu_log_mask(LOG_UNIMP, "%s: the PPC64 MMU is unsupported\n=
",
> -                          __func__);
> +            g_string_append_printf(buf, "PPC64 MMU not supported\n");
>          } else {
> -            dump_slb(env_archcpu(env));
> +            dump_slb(env_archcpu(env), buf);
>          }
>          break;
>  #endif
>      default:
> -        qemu_log_mask(LOG_UNIMP, "%s: unimplemented\n", __func__);
> +        g_string_append_printf(buf, "MMU model %d not supported\n",
> +                               env->mmu_model);
>      }
>  }
> =20
> diff --git a/target/ppc/monitor.c b/target/ppc/monitor.c
> index a475108b2d..401a36c2eb 100644
> --- a/target/ppc/monitor.c
> +++ b/target/ppc/monitor.c
> @@ -67,13 +67,17 @@ static target_long monitor_get_tbl(Monitor *mon, cons=
t struct MonitorDef *md,
> =20
>  void hmp_info_tlb(Monitor *mon, const QDict *qdict)
>  {
> -    CPUArchState *env1 =3D mon_get_cpu_env(mon);
> +    g_autoptr(GString) buf =3D g_string_new("");
> +    CPUState *cpu =3D mon_get_cpu(mon);
> =20
> -    if (!env1) {
> +    if (!cpu) {
>          monitor_printf(mon, "No CPU available\n");
>          return;
>      }
> -    dump_mmu(env1);
> +
> +    cpu_format_tlb(cpu, buf);
> +
> +    monitor_printf(mon, "%s", buf->str);
>  }
> =20
>  const MonitorDef monitor_defs[] =3D {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--+gv/YgNjt/MgA38s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFBTvMACgkQbDjKyiDZ
s5I+bRAAhfgbhHtwkx6HkiSXk23+D7ayNe9IdbRw8aXgvnS4HSapVzVPPOsyOt4E
C/AkOdusbuNtHkWMPXbII872fOhrXBsTJGnfP7fb3YtWB0RlVxs+p8RoZnuCFGUm
S8SqK+g9qm4fLxtMIyDXOUPuR/ZvWroRTycgm68EPv7se+i0Z8wAhRxIMbXZECi3
K1T8GPzyXL4yCFiLVLCh/5c3V65a1gMcc6DK6gGC4ri1SVroCG7IX0S+NSFgYQpR
5v4TRmDcBmfPbyPAbvh0+M7Nka9IaCTGkygWTmzbzPWn23nfyAvieP2h7mqWqcgi
wjWSEu+gOZF6LL1B3UpZcsqBoHl5Y+nZ1ouQjFVNMrA+zuzeISo82Y3x2KntgnFa
YVe74oU5QqvKRWtsDxComQ+WD+xH1rc02wEIdXOf8hzx1alvGICXvRhvTb2JgL46
BsR3JMhWoEiGkarhmOvl6xcQ87GQsxO5kacgLNcclBuauH1AVntcHFaC5rTHVDJe
RC2vrxMtkSiPFfNUjTtSZ8u9c09Gf4zcB7R37Bm2yQ1+9ANrmjp8lQL1/FGRYLb3
Q4lenk5EbmHhuFZ7MSyJqt2C+61RrDmkgjd/4uGzygY+rw9yFQZtprijxzp5RCTe
16tlVB/9+Lmh9Ak0D/ttD727es0DrEMOdQXTugnIY/Rj/0qBRGQ=
=Fqz7
-----END PGP SIGNATURE-----

--+gv/YgNjt/MgA38s--

