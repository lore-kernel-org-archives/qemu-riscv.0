Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lHywD-0003m5-OL
	for mharc-qemu-riscv@gnu.org; Thu, 04 Mar 2021 20:07:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lHywA-0003g5-Q3; Thu, 04 Mar 2021 20:07:26 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:47371 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lHyw6-0001GG-QL; Thu, 04 Mar 2021 20:07:26 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Ds8ht2kTkz9sWC; Fri,  5 Mar 2021 12:07:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1614906430;
 bh=WZi47CbVDOwbhFJ0/P2W6Jrth05XQmWfu7L+MWLJ9m8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UKz/CyvgB06Hw4qKhSQhZhh/EE5m2eKne0KvsjRC2IaFQ5jQ8W7W/iadOGwGXzz8h
 jFE/QTHE2dER+tt0hyJSRmdprceQB0iA7al4vVCqOLLbRtwn92L1CR2MMUBcAyiX+V
 +hq00hhw+Jii16/bLVLJ12LtvXt2tPpnyiDYSZ/k=
Date: Fri, 5 Mar 2021 12:05:32 +1100
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
 qemu-riscv@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Taylor Simpson <tsimpson@quicinc.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Michael Rolnik <mrolnik@gmail.com>, Sarah Harris <S.E.Harris@kent.ac.uk>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Michael Walle <michael@walle.cc>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Anthony Green <green@moxielogic.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
 Max Filippov <jcmvbkbc@gmail.com>
Subject: Re: [RFC PATCH v2 7/8] cpu: Move CPUClass::has_work() to TCGCPUOps
Message-ID: <YEGD3GZZI0t/t2Gl@yekko.fritz.box>
References: <20210304222323.1954755-1-f4bug@amsat.org>
 <20210304222323.1954755-8-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="0YNCq3PC/YVYRk0A"
Content-Disposition: inline
In-Reply-To: <20210304222323.1954755-8-f4bug@amsat.org>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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
X-List-Received-Date: Fri, 05 Mar 2021 01:07:27 -0000


--0YNCq3PC/YVYRk0A
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 04, 2021 at 11:23:22PM +0100, Philippe Mathieu-Daud=E9 wrote:
> We can only check if a vCPU has work with TCG.
> Restrict the has_work() handler to TCG by moving it to
> the TCGCPUOps structure, and adapt all the targets.
>=20
> cpu_common_has_work() is removed as being inlined in
> cpu_has_work().
>=20
> Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>

ppc parts
Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
> v2:
> - finished PPC
> - check cc->tcg_ops->has_work non-null (thuth)
> ---
>  include/hw/core/cpu.h           |  2 --
>  include/hw/core/tcg-cpu-ops.h   |  4 ++++
>  accel/tcg/cpu-exec.c            |  6 +++++-
>  hw/core/cpu.c                   |  6 ------
>  target/alpha/cpu.c              |  2 +-
>  target/arm/cpu.c                |  2 +-
>  target/avr/cpu.c                |  2 +-
>  target/cris/cpu.c               |  3 ++-
>  target/hexagon/cpu.c            |  2 +-
>  target/hppa/cpu.c               |  2 +-
>  target/i386/cpu.c               |  7 +------
>  target/i386/tcg/tcg-cpu.c       |  6 ++++++
>  target/lm32/cpu.c               |  2 +-
>  target/m68k/cpu.c               |  2 +-
>  target/microblaze/cpu.c         |  2 +-
>  target/mips/cpu.c               |  2 +-
>  target/moxie/cpu.c              |  2 +-
>  target/nios2/cpu.c              |  2 +-
>  target/openrisc/cpu.c           |  2 +-
>  target/riscv/cpu.c              |  2 +-
>  target/rx/cpu.c                 |  2 +-
>  target/s390x/cpu.c              |  2 +-
>  target/sh4/cpu.c                |  2 +-
>  target/sparc/cpu.c              |  2 +-
>  target/tilegx/cpu.c             |  2 +-
>  target/tricore/cpu.c            |  2 +-
>  target/unicore32/cpu.c          |  2 +-
>  target/xtensa/cpu.c             |  2 +-
>  target/ppc/translate_init.c.inc | 10 +++++-----
>  29 files changed, 44 insertions(+), 42 deletions(-)
>=20
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index 66109bcca35..8efea289e7e 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -86,7 +86,6 @@ struct AccelCPUClass;
>   * instantiatable CPU type.
>   * @parse_features: Callback to parse command line arguments.
>   * @reset_dump_flags: #CPUDumpFlags to use for reset logging.
> - * @has_work: Callback for checking if there is work to do.
>   * @virtio_is_big_endian: Callback to return %true if a CPU which suppor=
ts
>   * runtime configurable endianness is currently big-endian. Non-configur=
able
>   * CPUs can use the default implementation of this method. This method s=
hould
> @@ -149,7 +148,6 @@ struct CPUClass {
>      void (*parse_features)(const char *typename, char *str, Error **errp=
);
> =20
>      int reset_dump_flags;
> -    bool (*has_work)(CPUState *cpu);
>      bool (*virtio_is_big_endian)(CPUState *cpu);
>      int (*memory_rw_debug)(CPUState *cpu, vaddr addr,
>                             uint8_t *buf, int len, bool is_write);
> diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
> index 72d791438c2..f5d44ba59f3 100644
> --- a/include/hw/core/tcg-cpu-ops.h
> +++ b/include/hw/core/tcg-cpu-ops.h
> @@ -19,6 +19,10 @@ struct TCGCPUOps {
>       * Called when the first CPU is realized.
>       */
>      void (*initialize)(void);
> +    /**
> +     * @has_work: Callback for checking if there is work to do
> +     */
> +    bool (*has_work)(CPUState *cpu);
>      /**
>       * @synchronize_from_tb: Synchronize state from a TCG #TranslationBl=
ock
>       *
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index b9ce36e59e2..4e73550f981 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -451,7 +451,11 @@ bool cpu_has_work(CPUState *cpu)
>  {
>      CPUClass *cc =3D CPU_GET_CLASS(cpu);
> =20
> -    return cc->has_work(cpu);
> +    if (cc->tcg_ops->has_work) {
> +        return cc->tcg_ops->has_work(cpu);
> +    }
> +
> +    return false;
>  }
> =20
>  static inline bool cpu_handle_halt(CPUState *cpu)
> diff --git a/hw/core/cpu.c b/hw/core/cpu.c
> index 00330ba07de..3110867c3a3 100644
> --- a/hw/core/cpu.c
> +++ b/hw/core/cpu.c
> @@ -261,11 +261,6 @@ static void cpu_common_reset(DeviceState *dev)
>      }
>  }
> =20
> -static bool cpu_common_has_work(CPUState *cs)
> -{
> -    return false;
> -}
> -
>  ObjectClass *cpu_class_by_name(const char *typename, const char *cpu_mod=
el)
>  {
>      CPUClass *cc =3D CPU_CLASS(object_class_by_name(typename));
> @@ -397,7 +392,6 @@ static void cpu_class_init(ObjectClass *klass, void *=
data)
> =20
>      k->parse_features =3D cpu_common_parse_features;
>      k->get_arch_id =3D cpu_common_get_arch_id;
> -    k->has_work =3D cpu_common_has_work;
>      k->get_paging_enabled =3D cpu_common_get_paging_enabled;
>      k->get_memory_mapping =3D cpu_common_get_memory_mapping;
>      k->write_elf32_qemunote =3D cpu_common_write_elf32_qemunote;
> diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
> index e50ae7bef06..57e88bbe7fd 100644
> --- a/target/alpha/cpu.c
> +++ b/target/alpha/cpu.c
> @@ -210,6 +210,7 @@ static void alpha_cpu_initfn(Object *obj)
> =20
>  static const struct TCGCPUOps alpha_tcg_ops =3D {
>      .initialize =3D alpha_translate_init,
> +    .has_work =3D alpha_cpu_has_work,
>      .cpu_exec_interrupt =3D alpha_cpu_exec_interrupt,
>      .tlb_fill =3D alpha_cpu_tlb_fill,
> =20
> @@ -230,7 +231,6 @@ static void alpha_cpu_class_init(ObjectClass *oc, voi=
d *data)
>                                      &acc->parent_realize);
> =20
>      cc->class_by_name =3D alpha_cpu_class_by_name;
> -    cc->has_work =3D alpha_cpu_has_work;
>      cc->dump_state =3D alpha_cpu_dump_state;
>      cc->set_pc =3D alpha_cpu_set_pc;
>      cc->gdb_read_register =3D alpha_cpu_gdb_read_register;
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 6d2d9f2100f..7181deee84a 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -2263,6 +2263,7 @@ static gchar *arm_gdb_arch_name(CPUState *cs)
>  #ifdef CONFIG_TCG
>  static const struct TCGCPUOps arm_tcg_ops =3D {
>      .initialize =3D arm_translate_init,
> +    .has_work =3D arm_cpu_has_work,
>      .synchronize_from_tb =3D arm_cpu_synchronize_from_tb,
>      .cpu_exec_interrupt =3D arm_cpu_exec_interrupt,
>      .tlb_fill =3D arm_cpu_tlb_fill,
> @@ -2291,7 +2292,6 @@ static void arm_cpu_class_init(ObjectClass *oc, voi=
d *data)
>      device_class_set_parent_reset(dc, arm_cpu_reset, &acc->parent_reset);
> =20
>      cc->class_by_name =3D arm_cpu_class_by_name;
> -    cc->has_work =3D arm_cpu_has_work;
>      cc->dump_state =3D arm_cpu_dump_state;
>      cc->set_pc =3D arm_cpu_set_pc;
>      cc->gdb_read_register =3D arm_cpu_gdb_read_register;
> diff --git a/target/avr/cpu.c b/target/avr/cpu.c
> index 7d0ab606ae1..7416aa805d0 100644
> --- a/target/avr/cpu.c
> +++ b/target/avr/cpu.c
> @@ -188,6 +188,7 @@ static void avr_cpu_dump_state(CPUState *cs, FILE *f,=
 int flags)
> =20
>  static const struct TCGCPUOps avr_tcg_ops =3D {
>      .initialize =3D avr_cpu_tcg_init,
> +    .has_work =3D avr_cpu_has_work,
>      .synchronize_from_tb =3D avr_cpu_synchronize_from_tb,
>      .cpu_exec_interrupt =3D avr_cpu_exec_interrupt,
>      .tlb_fill =3D avr_cpu_tlb_fill,
> @@ -208,7 +209,6 @@ static void avr_cpu_class_init(ObjectClass *oc, void =
*data)
> =20
>      cc->class_by_name =3D avr_cpu_class_by_name;
> =20
> -    cc->has_work =3D avr_cpu_has_work;
>      cc->dump_state =3D avr_cpu_dump_state;
>      cc->set_pc =3D avr_cpu_set_pc;
>      cc->memory_rw_debug =3D avr_cpu_memory_rw_debug;
> diff --git a/target/cris/cpu.c b/target/cris/cpu.c
> index 4586302ba39..eef76a211f1 100644
> --- a/target/cris/cpu.c
> +++ b/target/cris/cpu.c
> @@ -197,6 +197,7 @@ static void cris_cpu_initfn(Object *obj)
> =20
>  static const struct TCGCPUOps crisv10_tcg_ops =3D {
>      .initialize =3D cris_initialize_crisv10_tcg,
> +    .has_work =3D cris_cpu_has_work,
>      .cpu_exec_interrupt =3D cris_cpu_exec_interrupt,
>      .tlb_fill =3D cris_cpu_tlb_fill,
> =20
> @@ -207,6 +208,7 @@ static const struct TCGCPUOps crisv10_tcg_ops =3D {
> =20
>  static const struct TCGCPUOps crisv32_tcg_ops =3D {
>      .initialize =3D cris_initialize_tcg,
> +    .has_work =3D cris_cpu_has_work,
>      .cpu_exec_interrupt =3D cris_cpu_exec_interrupt,
>      .tlb_fill =3D cris_cpu_tlb_fill,
> =20
> @@ -286,7 +288,6 @@ static void cris_cpu_class_init(ObjectClass *oc, void=
 *data)
>      device_class_set_parent_reset(dc, cris_cpu_reset, &ccc->parent_reset=
);
> =20
>      cc->class_by_name =3D cris_cpu_class_by_name;
> -    cc->has_work =3D cris_cpu_has_work;
>      cc->dump_state =3D cris_cpu_dump_state;
>      cc->set_pc =3D cris_cpu_set_pc;
>      cc->gdb_read_register =3D cris_cpu_gdb_read_register;
> diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
> index a13a941ed5b..cda63537d32 100644
> --- a/target/hexagon/cpu.c
> +++ b/target/hexagon/cpu.c
> @@ -268,6 +268,7 @@ static bool hexagon_tlb_fill(CPUState *cs, vaddr addr=
ess, int size,
> =20
>  static const struct TCGCPUOps hexagon_tcg_ops =3D {
>      .initialize =3D hexagon_translate_init,
> +    .has_work =3D hexagon_cpu_has_work,
>      .synchronize_from_tb =3D hexagon_cpu_synchronize_from_tb,
>      .tlb_fill =3D hexagon_tlb_fill,
>  };
> @@ -284,7 +285,6 @@ static void hexagon_cpu_class_init(ObjectClass *c, vo=
id *data)
>      device_class_set_parent_reset(dc, hexagon_cpu_reset, &mcc->parent_re=
set);
> =20
>      cc->class_by_name =3D hexagon_cpu_class_by_name;
> -    cc->has_work =3D hexagon_cpu_has_work;
>      cc->dump_state =3D hexagon_dump_state;
>      cc->set_pc =3D hexagon_cpu_set_pc;
>      cc->gdb_read_register =3D hexagon_gdb_read_register;
> diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
> index 5f1822b5fe6..b9437f4c534 100644
> --- a/target/hppa/cpu.c
> +++ b/target/hppa/cpu.c
> @@ -135,6 +135,7 @@ static ObjectClass *hppa_cpu_class_by_name(const char=
 *cpu_model)
> =20
>  static const struct TCGCPUOps hppa_tcg_ops =3D {
>      .initialize =3D hppa_translate_init,
> +    .has_work =3D hppa_cpu_has_work,
>      .synchronize_from_tb =3D hppa_cpu_synchronize_from_tb,
>      .cpu_exec_interrupt =3D hppa_cpu_exec_interrupt,
>      .tlb_fill =3D hppa_cpu_tlb_fill,
> @@ -155,7 +156,6 @@ static void hppa_cpu_class_init(ObjectClass *oc, void=
 *data)
>                                      &acc->parent_realize);
> =20
>      cc->class_by_name =3D hppa_cpu_class_by_name;
> -    cc->has_work =3D hppa_cpu_has_work;
>      cc->dump_state =3D hppa_cpu_dump_state;
>      cc->set_pc =3D hppa_cpu_set_pc;
>      cc->gdb_read_register =3D hppa_cpu_gdb_read_register;
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 50008431c35..464e136a072 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -7171,6 +7171,7 @@ static void x86_cpu_set_pc(CPUState *cs, vaddr valu=
e)
>      cpu->env.eip =3D value;
>  }
> =20
> +/* FIXME TCG only? */
>  int x86_cpu_pending_interrupt(CPUState *cs, int interrupt_request)
>  {
>      X86CPU *cpu =3D X86_CPU(cs);
> @@ -7213,11 +7214,6 @@ int x86_cpu_pending_interrupt(CPUState *cs, int in=
terrupt_request)
>      return 0;
>  }
> =20
> -static bool x86_cpu_has_work(CPUState *cs)
> -{
> -    return x86_cpu_pending_interrupt(cs, cs->interrupt_request) !=3D 0;
> -}
> -
>  static void x86_disas_set_info(CPUState *cs, disassemble_info *info)
>  {
>      X86CPU *cpu =3D X86_CPU(cs);
> @@ -7404,7 +7400,6 @@ static void x86_cpu_common_class_init(ObjectClass *=
oc, void *data)
> =20
>      cc->class_by_name =3D x86_cpu_class_by_name;
>      cc->parse_features =3D x86_cpu_parse_featurestr;
> -    cc->has_work =3D x86_cpu_has_work;
> =20
>  #ifdef CONFIG_TCG
>      tcg_cpu_common_class_init(cc);
> diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
> index 6a35aa664dc..fee8487135d 100644
> --- a/target/i386/tcg/tcg-cpu.c
> +++ b/target/i386/tcg/tcg-cpu.c
> @@ -57,10 +57,16 @@ static void x86_cpu_synchronize_from_tb(CPUState *cs,
>      cpu->env.eip =3D tb->pc - tb->cs_base;
>  }
> =20
> +static bool x86_cpu_has_work(CPUState *cs)
> +{
> +    return x86_cpu_pending_interrupt(cs, cs->interrupt_request) !=3D 0;
> +}
> +
>  #include "hw/core/tcg-cpu-ops.h"
> =20
>  static const struct TCGCPUOps x86_tcg_ops =3D {
>      .initialize =3D tcg_x86_init,
> +    .has_work =3D x86_cpu_has_work,
>      .synchronize_from_tb =3D x86_cpu_synchronize_from_tb,
>      .cpu_exec_enter =3D x86_cpu_exec_enter,
>      .cpu_exec_exit =3D x86_cpu_exec_exit,
> diff --git a/target/lm32/cpu.c b/target/lm32/cpu.c
> index 4ad253a50ec..5d18255ac83 100644
> --- a/target/lm32/cpu.c
> +++ b/target/lm32/cpu.c
> @@ -214,6 +214,7 @@ static ObjectClass *lm32_cpu_class_by_name(const char=
 *cpu_model)
> =20
>  static const struct TCGCPUOps lm32_tcg_ops =3D {
>      .initialize =3D lm32_translate_init,
> +    .has_work =3D lm32_cpu_has_work,
>      .cpu_exec_interrupt =3D lm32_cpu_exec_interrupt,
>      .tlb_fill =3D lm32_cpu_tlb_fill,
>      .debug_excp_handler =3D lm32_debug_excp_handler,
> @@ -234,7 +235,6 @@ static void lm32_cpu_class_init(ObjectClass *oc, void=
 *data)
>      device_class_set_parent_reset(dc, lm32_cpu_reset, &lcc->parent_reset=
);
> =20
>      cc->class_by_name =3D lm32_cpu_class_by_name;
> -    cc->has_work =3D lm32_cpu_has_work;
>      cc->dump_state =3D lm32_cpu_dump_state;
>      cc->set_pc =3D lm32_cpu_set_pc;
>      cc->gdb_read_register =3D lm32_cpu_gdb_read_register;
> diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
> index 9b2f651213b..9c38138215f 100644
> --- a/target/m68k/cpu.c
> +++ b/target/m68k/cpu.c
> @@ -506,6 +506,7 @@ static const VMStateDescription vmstate_m68k_cpu =3D {
> =20
>  static const struct TCGCPUOps m68k_tcg_ops =3D {
>      .initialize =3D m68k_tcg_init,
> +    .has_work =3D m68k_cpu_has_work,
>      .cpu_exec_interrupt =3D m68k_cpu_exec_interrupt,
>      .tlb_fill =3D m68k_cpu_tlb_fill,
> =20
> @@ -526,7 +527,6 @@ static void m68k_cpu_class_init(ObjectClass *c, void =
*data)
>      device_class_set_parent_reset(dc, m68k_cpu_reset, &mcc->parent_reset=
);
> =20
>      cc->class_by_name =3D m68k_cpu_class_by_name;
> -    cc->has_work =3D m68k_cpu_has_work;
>      cc->dump_state =3D m68k_cpu_dump_state;
>      cc->set_pc =3D m68k_cpu_set_pc;
>      cc->gdb_read_register =3D m68k_cpu_gdb_read_register;
> diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
> index 4e086ab5465..809f42b5e0d 100644
> --- a/target/microblaze/cpu.c
> +++ b/target/microblaze/cpu.c
> @@ -356,6 +356,7 @@ static ObjectClass *mb_cpu_class_by_name(const char *=
cpu_model)
> =20
>  static const struct TCGCPUOps mb_tcg_ops =3D {
>      .initialize =3D mb_tcg_init,
> +    .has_work =3D mb_cpu_has_work,
>      .synchronize_from_tb =3D mb_cpu_synchronize_from_tb,
>      .cpu_exec_interrupt =3D mb_cpu_exec_interrupt,
>      .tlb_fill =3D mb_cpu_tlb_fill,
> @@ -378,7 +379,6 @@ static void mb_cpu_class_init(ObjectClass *oc, void *=
data)
>      device_class_set_parent_reset(dc, mb_cpu_reset, &mcc->parent_reset);
> =20
>      cc->class_by_name =3D mb_cpu_class_by_name;
> -    cc->has_work =3D mb_cpu_has_work;
> =20
>      cc->dump_state =3D mb_cpu_dump_state;
>      cc->set_pc =3D mb_cpu_set_pc;
> diff --git a/target/mips/cpu.c b/target/mips/cpu.c
> index 81030c5c407..a189710904a 100644
> --- a/target/mips/cpu.c
> +++ b/target/mips/cpu.c
> @@ -688,6 +688,7 @@ static Property mips_cpu_properties[] =3D {
>   */
>  static const struct TCGCPUOps mips_tcg_ops =3D {
>      .initialize =3D mips_tcg_init,
> +    .has_work =3D mips_cpu_has_work,
>      .synchronize_from_tb =3D mips_cpu_synchronize_from_tb,
>      .cpu_exec_interrupt =3D mips_cpu_exec_interrupt,
>      .tlb_fill =3D mips_cpu_tlb_fill,
> @@ -713,7 +714,6 @@ static void mips_cpu_class_init(ObjectClass *c, void =
*data)
>      device_class_set_props(dc, mips_cpu_properties);
> =20
>      cc->class_by_name =3D mips_cpu_class_by_name;
> -    cc->has_work =3D mips_cpu_has_work;
>      cc->dump_state =3D mips_cpu_dump_state;
>      cc->set_pc =3D mips_cpu_set_pc;
>      cc->gdb_read_register =3D mips_cpu_gdb_read_register;
> diff --git a/target/moxie/cpu.c b/target/moxie/cpu.c
> index c3de71b82fe..942804de21b 100644
> --- a/target/moxie/cpu.c
> +++ b/target/moxie/cpu.c
> @@ -98,6 +98,7 @@ static ObjectClass *moxie_cpu_class_by_name(const char =
*cpu_model)
> =20
>  static const struct TCGCPUOps moxie_tcg_ops =3D {
>      .initialize =3D moxie_translate_init,
> +    .has_work =3D moxie_cpu_has_work,
>      .tlb_fill =3D moxie_cpu_tlb_fill,
> =20
>  #ifndef CONFIG_USER_ONLY
> @@ -117,7 +118,6 @@ static void moxie_cpu_class_init(ObjectClass *oc, voi=
d *data)
> =20
>      cc->class_by_name =3D moxie_cpu_class_by_name;
> =20
> -    cc->has_work =3D moxie_cpu_has_work;
>      cc->dump_state =3D moxie_cpu_dump_state;
>      cc->set_pc =3D moxie_cpu_set_pc;
>  #ifndef CONFIG_USER_ONLY
> diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
> index 0de93cdd98f..cfd9f002436 100644
> --- a/target/nios2/cpu.c
> +++ b/target/nios2/cpu.c
> @@ -211,6 +211,7 @@ static Property nios2_properties[] =3D {
> =20
>  static const struct TCGCPUOps nios2_tcg_ops =3D {
>      .initialize =3D nios2_tcg_init,
> +    .has_work =3D nios2_cpu_has_work,
>      .cpu_exec_interrupt =3D nios2_cpu_exec_interrupt,
>      .tlb_fill =3D nios2_cpu_tlb_fill,
> =20
> @@ -232,7 +233,6 @@ static void nios2_cpu_class_init(ObjectClass *oc, voi=
d *data)
>      device_class_set_parent_reset(dc, nios2_cpu_reset, &ncc->parent_rese=
t);
> =20
>      cc->class_by_name =3D nios2_cpu_class_by_name;
> -    cc->has_work =3D nios2_cpu_has_work;
>      cc->dump_state =3D nios2_cpu_dump_state;
>      cc->set_pc =3D nios2_cpu_set_pc;
>      cc->disas_set_info =3D nios2_cpu_disas_set_info;
> diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
> index 52aef277232..674e1ac0d23 100644
> --- a/target/openrisc/cpu.c
> +++ b/target/openrisc/cpu.c
> @@ -178,6 +178,7 @@ static void openrisc_any_initfn(Object *obj)
> =20
>  static const struct TCGCPUOps openrisc_tcg_ops =3D {
>      .initialize =3D openrisc_translate_init,
> +    .has_work =3D openrisc_cpu_has_work,
>      .cpu_exec_interrupt =3D openrisc_cpu_exec_interrupt,
>      .tlb_fill =3D openrisc_cpu_tlb_fill,
> =20
> @@ -197,7 +198,6 @@ static void openrisc_cpu_class_init(ObjectClass *oc, =
void *data)
>      device_class_set_parent_reset(dc, openrisc_cpu_reset, &occ->parent_r=
eset);
> =20
>      cc->class_by_name =3D openrisc_cpu_class_by_name;
> -    cc->has_work =3D openrisc_cpu_has_work;
>      cc->dump_state =3D openrisc_cpu_dump_state;
>      cc->set_pc =3D openrisc_cpu_set_pc;
>      cc->gdb_read_register =3D openrisc_cpu_gdb_read_register;
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 6f9822bc0a1..a5de166bb3f 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -584,6 +584,7 @@ static const char *riscv_gdb_get_dynamic_xml(CPUState=
 *cs, const char *xmlname)
> =20
>  static const struct TCGCPUOps riscv_tcg_ops =3D {
>      .initialize =3D riscv_translate_init,
> +    .has_work =3D riscv_cpu_has_work,
>      .synchronize_from_tb =3D riscv_cpu_synchronize_from_tb,
>      .cpu_exec_interrupt =3D riscv_cpu_exec_interrupt,
>      .tlb_fill =3D riscv_cpu_tlb_fill,
> @@ -607,7 +608,6 @@ static void riscv_cpu_class_init(ObjectClass *c, void=
 *data)
>      device_class_set_parent_reset(dc, riscv_cpu_reset, &mcc->parent_rese=
t);
> =20
>      cc->class_by_name =3D riscv_cpu_class_by_name;
> -    cc->has_work =3D riscv_cpu_has_work;
>      cc->dump_state =3D riscv_cpu_dump_state;
>      cc->set_pc =3D riscv_cpu_set_pc;
>      cc->gdb_read_register =3D riscv_cpu_gdb_read_register;
> diff --git a/target/rx/cpu.c b/target/rx/cpu.c
> index 28d2becc32c..f5f967ff509 100644
> --- a/target/rx/cpu.c
> +++ b/target/rx/cpu.c
> @@ -177,6 +177,7 @@ static void rx_cpu_init(Object *obj)
> =20
>  static const struct TCGCPUOps rx_tcg_ops =3D {
>      .initialize =3D rx_translate_init,
> +    .has_work =3D rx_cpu_has_work,
>      .synchronize_from_tb =3D rx_cpu_synchronize_from_tb,
>      .cpu_exec_interrupt =3D rx_cpu_exec_interrupt,
>      .tlb_fill =3D rx_cpu_tlb_fill,
> @@ -198,7 +199,6 @@ static void rx_cpu_class_init(ObjectClass *klass, voi=
d *data)
>                                    &rcc->parent_reset);
> =20
>      cc->class_by_name =3D rx_cpu_class_by_name;
> -    cc->has_work =3D rx_cpu_has_work;
>      cc->dump_state =3D rx_cpu_dump_state;
>      cc->set_pc =3D rx_cpu_set_pc;
> =20
> diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
> index d57f69e7f7d..d2f897bf41a 100644
> --- a/target/s390x/cpu.c
> +++ b/target/s390x/cpu.c
> @@ -465,6 +465,7 @@ static void s390_cpu_reset_full(DeviceState *dev)
> =20
>  static const struct TCGCPUOps s390_tcg_ops =3D {
>      .initialize =3D s390x_translate_init,
> +    .has_work =3D s390_cpu_has_work,
>      .tlb_fill =3D s390_cpu_tlb_fill,
> =20
>  #if !defined(CONFIG_USER_ONLY)
> @@ -493,7 +494,6 @@ static void s390_cpu_class_init(ObjectClass *oc, void=
 *data)
>  #endif
>      scc->reset =3D s390_cpu_reset;
>      cc->class_by_name =3D s390_cpu_class_by_name,
> -    cc->has_work =3D s390_cpu_has_work;
>      cc->dump_state =3D s390_cpu_dump_state;
>      cc->set_pc =3D s390_cpu_set_pc;
>      cc->gdb_read_register =3D s390_cpu_gdb_read_register;
> diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
> index 9d77f9cfdae..8bac001bfa4 100644
> --- a/target/sh4/cpu.c
> +++ b/target/sh4/cpu.c
> @@ -227,6 +227,7 @@ static const VMStateDescription vmstate_sh_cpu =3D {
> =20
>  static const struct TCGCPUOps superh_tcg_ops =3D {
>      .initialize =3D sh4_translate_init,
> +    .has_work =3D superh_cpu_has_work,
>      .synchronize_from_tb =3D superh_cpu_synchronize_from_tb,
>      .cpu_exec_interrupt =3D superh_cpu_exec_interrupt,
>      .tlb_fill =3D superh_cpu_tlb_fill,
> @@ -250,7 +251,6 @@ static void superh_cpu_class_init(ObjectClass *oc, vo=
id *data)
>      device_class_set_parent_reset(dc, superh_cpu_reset, &scc->parent_res=
et);
> =20
>      cc->class_by_name =3D superh_cpu_class_by_name;
> -    cc->has_work =3D superh_cpu_has_work;
>      cc->dump_state =3D superh_cpu_dump_state;
>      cc->set_pc =3D superh_cpu_set_pc;
>      cc->gdb_read_register =3D superh_cpu_gdb_read_register;
> diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
> index ccabe189c4a..761813ce96b 100644
> --- a/target/sparc/cpu.c
> +++ b/target/sparc/cpu.c
> @@ -853,6 +853,7 @@ static Property sparc_cpu_properties[] =3D {
> =20
>  static const struct TCGCPUOps sparc_tcg_ops =3D {
>      .initialize =3D sparc_tcg_init,
> +    .has_work =3D sparc_cpu_has_work,
>      .synchronize_from_tb =3D sparc_cpu_synchronize_from_tb,
>      .cpu_exec_interrupt =3D sparc_cpu_exec_interrupt,
>      .tlb_fill =3D sparc_cpu_tlb_fill,
> @@ -879,7 +880,6 @@ static void sparc_cpu_class_init(ObjectClass *oc, voi=
d *data)
> =20
>      cc->class_by_name =3D sparc_cpu_class_by_name;
>      cc->parse_features =3D sparc_cpu_parse_features;
> -    cc->has_work =3D sparc_cpu_has_work;
>      cc->dump_state =3D sparc_cpu_dump_state;
>  #if !defined(TARGET_SPARC64) && !defined(CONFIG_USER_ONLY)
>      cc->memory_rw_debug =3D sparc_cpu_memory_rw_debug;
> diff --git a/target/tilegx/cpu.c b/target/tilegx/cpu.c
> index c7f8a898caf..3bc89e736b3 100644
> --- a/target/tilegx/cpu.c
> +++ b/target/tilegx/cpu.c
> @@ -138,6 +138,7 @@ static bool tilegx_cpu_exec_interrupt(CPUState *cs, i=
nt interrupt_request)
> =20
>  static const struct TCGCPUOps tilegx_tcg_ops =3D {
>      .initialize =3D tilegx_tcg_init,
> +    .has_work =3D tilegx_cpu_has_work,
>      .cpu_exec_interrupt =3D tilegx_cpu_exec_interrupt,
>      .tlb_fill =3D tilegx_cpu_tlb_fill,
> =20
> @@ -158,7 +159,6 @@ static void tilegx_cpu_class_init(ObjectClass *oc, vo=
id *data)
>      device_class_set_parent_reset(dc, tilegx_cpu_reset, &tcc->parent_res=
et);
> =20
>      cc->class_by_name =3D tilegx_cpu_class_by_name;
> -    cc->has_work =3D tilegx_cpu_has_work;
>      cc->dump_state =3D tilegx_cpu_dump_state;
>      cc->set_pc =3D tilegx_cpu_set_pc;
>      cc->gdb_num_core_regs =3D 0;
> diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
> index 5b500b575bd..b493e3ede85 100644
> --- a/target/tricore/cpu.c
> +++ b/target/tricore/cpu.c
> @@ -146,6 +146,7 @@ static void tc27x_initfn(Object *obj)
> =20
>  static const struct TCGCPUOps tricore_tcg_ops =3D {
>      .initialize =3D tricore_tcg_init,
> +    .has_work =3D tricore_cpu_has_work,
>      .synchronize_from_tb =3D tricore_cpu_synchronize_from_tb,
>      .tlb_fill =3D tricore_cpu_tlb_fill,
>  };
> @@ -161,7 +162,6 @@ static void tricore_cpu_class_init(ObjectClass *c, vo=
id *data)
> =20
>      device_class_set_parent_reset(dc, tricore_cpu_reset, &mcc->parent_re=
set);
>      cc->class_by_name =3D tricore_cpu_class_by_name;
> -    cc->has_work =3D tricore_cpu_has_work;
> =20
>      cc->gdb_read_register =3D tricore_cpu_gdb_read_register;
>      cc->gdb_write_register =3D tricore_cpu_gdb_write_register;
> diff --git a/target/unicore32/cpu.c b/target/unicore32/cpu.c
> index a732b08748d..55569018296 100644
> --- a/target/unicore32/cpu.c
> +++ b/target/unicore32/cpu.c
> @@ -124,6 +124,7 @@ static const VMStateDescription vmstate_uc32_cpu =3D {
> =20
>  static const struct TCGCPUOps uc32_tcg_ops =3D {
>      .initialize =3D uc32_translate_init,
> +    .has_work =3D uc32_cpu_has_work,
>      .cpu_exec_interrupt =3D uc32_cpu_exec_interrupt,
>      .tlb_fill =3D uc32_cpu_tlb_fill,
> =20
> @@ -142,7 +143,6 @@ static void uc32_cpu_class_init(ObjectClass *oc, void=
 *data)
>                                      &ucc->parent_realize);
> =20
>      cc->class_by_name =3D uc32_cpu_class_by_name;
> -    cc->has_work =3D uc32_cpu_has_work;
>      cc->dump_state =3D uc32_cpu_dump_state;
>      cc->set_pc =3D uc32_cpu_set_pc;
>      cc->get_phys_page_debug =3D uc32_cpu_get_phys_page_debug;
> diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
> index badc3a26aa2..849a664a679 100644
> --- a/target/xtensa/cpu.c
> +++ b/target/xtensa/cpu.c
> @@ -185,6 +185,7 @@ static const VMStateDescription vmstate_xtensa_cpu =
=3D {
> =20
>  static const struct TCGCPUOps xtensa_tcg_ops =3D {
>      .initialize =3D xtensa_translate_init,
> +    .has_work =3D xtensa_cpu_has_work,
>      .cpu_exec_interrupt =3D xtensa_cpu_exec_interrupt,
>      .tlb_fill =3D xtensa_cpu_tlb_fill,
>      .debug_excp_handler =3D xtensa_breakpoint_handler,
> @@ -208,7 +209,6 @@ static void xtensa_cpu_class_init(ObjectClass *oc, vo=
id *data)
>      device_class_set_parent_reset(dc, xtensa_cpu_reset, &xcc->parent_res=
et);
> =20
>      cc->class_by_name =3D xtensa_cpu_class_by_name;
> -    cc->has_work =3D xtensa_cpu_has_work;
>      cc->dump_state =3D xtensa_cpu_dump_state;
>      cc->set_pc =3D xtensa_cpu_set_pc;
>      cc->gdb_read_register =3D xtensa_cpu_gdb_read_register;
> diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.=
c.inc
> index fe76d0b3773..1558de804c9 100644
> --- a/target/ppc/translate_init.c.inc
> +++ b/target/ppc/translate_init.c.inc
> @@ -8633,7 +8633,6 @@ POWERPC_FAMILY(POWER7)(ObjectClass *oc, void *data)
>      pcc->pcr_supported =3D PCR_COMPAT_2_06 | PCR_COMPAT_2_05;
>      pcc->init_proc =3D init_proc_POWER7;
>      pcc->check_pow =3D check_pow_nocheck;
> -    cc->has_work =3D cpu_has_work_POWER7;
>      pcc->insns_flags =3D PPC_INSNS_BASE | PPC_ISEL | PPC_STRING | PPC_MF=
TB |
>                         PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
>                         PPC_FLOAT_FSQRT | PPC_FLOAT_FRSQRTE |
> @@ -8806,7 +8805,6 @@ POWERPC_FAMILY(POWER8)(ObjectClass *oc, void *data)
>      pcc->pcr_supported =3D PCR_COMPAT_2_07 | PCR_COMPAT_2_06 | PCR_COMPA=
T_2_05;
>      pcc->init_proc =3D init_proc_POWER8;
>      pcc->check_pow =3D check_pow_nocheck;
> -    cc->has_work =3D cpu_has_work_POWER8;
>      pcc->insns_flags =3D PPC_INSNS_BASE | PPC_ISEL | PPC_STRING | PPC_MF=
TB |
>                         PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
>                         PPC_FLOAT_FSQRT | PPC_FLOAT_FRSQRTE |
> @@ -9026,7 +9024,6 @@ POWERPC_FAMILY(POWER9)(ObjectClass *oc, void *data)
>                           PCR_COMPAT_2_05;
>      pcc->init_proc =3D init_proc_POWER9;
>      pcc->check_pow =3D check_pow_nocheck;
> -    cc->has_work =3D cpu_has_work_POWER9;
>      pcc->insns_flags =3D PPC_INSNS_BASE | PPC_ISEL | PPC_STRING | PPC_MF=
TB |
>                         PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
>                         PPC_FLOAT_FSQRT | PPC_FLOAT_FRSQRTE |
> @@ -9241,7 +9238,6 @@ POWERPC_FAMILY(POWER10)(ObjectClass *oc, void *data)
>                           PCR_COMPAT_2_06 | PCR_COMPAT_2_05;
>      pcc->init_proc =3D init_proc_POWER10;
>      pcc->check_pow =3D check_pow_nocheck;
> -    cc->has_work =3D cpu_has_work_POWER10;
>      pcc->insns_flags =3D PPC_INSNS_BASE | PPC_ISEL | PPC_STRING | PPC_MF=
TB |
>                         PPC_FLOAT | PPC_FLOAT_FSEL | PPC_FLOAT_FRES |
>                         PPC_FLOAT_FSQRT | PPC_FLOAT_FRSQRTE |
> @@ -10865,6 +10861,7 @@ static Property ppc_cpu_properties[] =3D {
> =20
>  static const struct TCGCPUOps ppc_tcg_ops =3D {
>    .initialize =3D ppc_translate_init,
> +  .has_work =3D ppc_cpu_has_work,
>    .cpu_exec_interrupt =3D ppc_cpu_exec_interrupt,
>    .tlb_fill =3D ppc_cpu_tlb_fill,
> =20
> @@ -10878,6 +10875,7 @@ static const struct TCGCPUOps ppc_tcg_ops =3D {
> =20
>  static const struct TCGCPUOps power7_tcg_ops =3D {
>    .initialize =3D ppc_translate_init,
> +  .has_work =3D cpu_has_work_POWER7,
>    .cpu_exec_interrupt =3D ppc_cpu_exec_interrupt,
>    .tlb_fill =3D ppc_cpu_tlb_fill,
> =20
> @@ -10891,6 +10889,7 @@ static const struct TCGCPUOps power7_tcg_ops =3D {
> =20
>  static const struct TCGCPUOps power8_tcg_ops =3D {
>    .initialize =3D ppc_translate_init,
> +  .has_work =3D cpu_has_work_POWER8,
>    .cpu_exec_interrupt =3D ppc_cpu_exec_interrupt,
>    .tlb_fill =3D ppc_cpu_tlb_fill,
> =20
> @@ -10904,6 +10903,7 @@ static const struct TCGCPUOps power8_tcg_ops =3D {
> =20
>  static const struct TCGCPUOps power9_tcg_ops =3D {
>    .initialize =3D ppc_translate_init,
> +  .has_work =3D cpu_has_work_POWER9,
>    .cpu_exec_interrupt =3D ppc_cpu_exec_interrupt,
>    .tlb_fill =3D ppc_cpu_tlb_fill,
> =20
> @@ -10917,6 +10917,7 @@ static const struct TCGCPUOps power9_tcg_ops =3D {
> =20
>  static const struct TCGCPUOps power10_tcg_ops =3D {
>    .initialize =3D ppc_translate_init,
> +  .has_work =3D cpu_has_work_POWER10,
>    .cpu_exec_interrupt =3D ppc_cpu_exec_interrupt,
>    .tlb_fill =3D ppc_cpu_tlb_fill,
> =20
> @@ -10946,7 +10947,6 @@ static void ppc_cpu_class_init(ObjectClass *oc, v=
oid *data)
>      device_class_set_parent_reset(dc, ppc_cpu_reset, &pcc->parent_reset);
> =20
>      cc->class_by_name =3D ppc_cpu_class_by_name;
> -    cc->has_work =3D ppc_cpu_has_work;
>      cc->dump_state =3D ppc_cpu_dump_state;
>      cc->dump_statistics =3D ppc_cpu_dump_statistics;
>      cc->set_pc =3D ppc_cpu_set_pc;

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--0YNCq3PC/YVYRk0A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBBg9wACgkQbDjKyiDZ
s5II/g//TsRc2aG28PBcyUqUqt4PF7lRHsAaNZ5Ew2ouYe+s7eHv4rd2SA9crtzq
bFRELbr+ifqjY74Lh8d+xleR9yydewMiO4ZyMXYtwZJiPP1a8HA522Kim9eGNHKN
DghKrFVABebQETg6TvCWfhvDeEGmZE23GCzff3zAOg+B6r/gEHi3PScQlmD7aUkp
e349CBqm/5A/TNLBnNtbnDgNTMFc5MBZ87eoSfjCJBfuPjlDF1FZOsbYMFeq49ID
8Ut1igEbGhuLzoIl5sCaWaASG7aa7y5CrCDXOA5aKATeGc2f0DYYxfo+pa6GKPbr
PstJJHlafgfhhq9l4+TCA9R2qYpfkqoDL6fO9kBoiuObsJBNRFlBbUD2FOY/RmHS
ze+L22HpBUwv687vjyL2wx57msKQ6cQMouuBJrP0j0h2PR8WdDr56Olg0oyCjdb1
LmQFcpJU+xRfKoE+ewDNnk4eruNWWUrvReUoZ3MwOsmftgWADPeK72DIqOQTzYrO
9CFEgttQiCifQt8QXjdT242Bre45Ps7iAiXCI4uqGKmRqEzOnTUPX0KABG8a22F1
F6qxTWvDm7/fg5LJfqKe6uv2yygDLbx1GuOeORC6WajYY1rdvuF7HFk0nbFdelgl
fk76IJjDNGcCfQkhxMswPX9qW8Pi0BmZhBxHZG0uaoqJfSGhnVs=
=zv76
-----END PGP SIGNATURE-----

--0YNCq3PC/YVYRk0A--

