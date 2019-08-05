Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1huWyL-0001GL-1f
	for mharc-qemu-riscv@gnu.org; Mon, 05 Aug 2019 02:59:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35524)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <chihmin.chao@sifive.com>) id 1huWyH-0001EY-S5
 for qemu-riscv@nongnu.org; Mon, 05 Aug 2019 02:59:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <chihmin.chao@sifive.com>) id 1huWyG-0004m3-3A
 for qemu-riscv@nongnu.org; Mon, 05 Aug 2019 02:59:53 -0400
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:46053)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <chihmin.chao@sifive.com>)
 id 1huWyF-0004ld-QF
 for qemu-riscv@nongnu.org; Mon, 05 Aug 2019 02:59:52 -0400
Received: by mail-io1-xd2c.google.com with SMTP id g20so165125527ioc.12
 for <qemu-riscv@nongnu.org>; Sun, 04 Aug 2019 23:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i5Ww0ywp7+DtPeRbx/mmf4OPOEmvyp7sQtuYzya10vc=;
 b=BKQJFdJztHiOwhmWt0bg8OtyYDLAPFZBtSa1M9jtksEr7TEpQFqSafbtUdtPQTMSR7
 2B4p3IhzfEUfiltoMdzvJGUN3JxDSp2wyY7u8NMoqKDcqhDEbuPpXsLJ/LkF8XWaNpwB
 0vBFia6FCwaQwQkgJUFhVhDOn2HYsWS3LyPfu0jzBNHDaYjHwg962r+b+QMtDj1DGuJC
 5Nvyj1Cha86WHhdAVKc2w0rhN8QX548zEp+wfAzj7EAlvszpYjXnIR5S32g+X7fT58on
 i2EijpibF0NAqzUGAbaXBotu3UbnbiPieh2uIMYpYMJ2CLIgaZzYVnf1vfcOtWWsqQZP
 5D9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i5Ww0ywp7+DtPeRbx/mmf4OPOEmvyp7sQtuYzya10vc=;
 b=QTM1sodnvJRl9i+UFHZ2HpOfND2vYBXd+6mLXgO38Du+Qma8PXRht/WJYqYf4n+uiH
 xcAcOsVFCIWWDoy7OuJUSwCpIx2ViSwfN636C0AblXVmVbg5t1mDhkfzGQUS0EOOUZ3y
 rQzKn6Gi/766ECjyVcgS64fWTY42Ks2tX1r4+EkElajDD7pBQy/r7MDm2EXMjhH/eS5p
 vlrS+C4zB7UaMXDg1upl3NjnyQn/iBSdrdSXGIeMbANwMjEFJQMEiBbJ7ymD72nPMStw
 irDNLVXDj8a0EEB0KqROgPpR+tEc8NYnmwMW+F832v7mYSoT42aeUUkZ0Esln10T8iNq
 +9JQ==
X-Gm-Message-State: APjAAAWN4WBPv/gmGFF9/pvWrUs/DjiVXv56MPK0FXnpq8FMIEFM/rGM
 95xUcSfjhmTbaNeGIfbD2yKLQnFZVyuiBluw8tF4LQ==
X-Google-Smtp-Source: APXvYqyIMTFxKGc6D1YXU0ndNirRhteuuYYCoUF36mBm/h8IlIwZCOCTMDZ/ArB6A6353FJn5yq83+oRs7iRVJJ6rks=
X-Received: by 2002:a5d:8ad0:: with SMTP id e16mr22566875iot.262.1564988390818; 
 Sun, 04 Aug 2019 23:59:50 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1564529681.git.alistair.francis@wdc.com>
 <d35fb37b43115418a497bcb0bfea187a0c1c46bf.1564529681.git.alistair.francis@wdc.com>
In-Reply-To: <d35fb37b43115418a497bcb0bfea187a0c1c46bf.1564529681.git.alistair.francis@wdc.com>
From: Chih-Min Chao <chihmin.chao@sifive.com>
Date: Mon, 5 Aug 2019 14:59:38 +0800
Message-ID: <CAEiOBXW4cHBfZY7w_RQJi57ranQ+FZ9r+E91HOYdUkk8X1iggw@mail.gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair23@gmail.com>, Palmer Dabbelt <palmer@sifive.com>
Content-Type: multipart/alternative; boundary="0000000000001cdfad058f59417d"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d2c
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH-4.2 v2 3/5] target/riscv:
 Create function to test if FP is enabled
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
X-List-Received-Date: Mon, 05 Aug 2019 06:59:55 -0000

--0000000000001cdfad058f59417d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 31, 2019 at 7:39 AM Alistair Francis <alistair.francis@wdc.com>
wrote:

> Let's create a function that tests if floating point support is
> enabled. We can then protect all floating point operations based on if
> they are enabled.
>
> This patch so far doesn't change anything, it's just preparing for the
> Hypervisor support for floating point operations.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Reviewed-by: Christophe de Dinechin <dinechin@redhat.com>
> ---
>  target/riscv/cpu.h        |  6 +++++-
>  target/riscv/cpu_helper.c | 10 ++++++++++
>  target/riscv/csr.c        | 20 +++++++++++---------
>  3 files changed, 26 insertions(+), 10 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 0adb307f32..2dc9b17678 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -255,6 +255,7 @@ void riscv_cpu_do_interrupt(CPUState *cpu);
>  int riscv_cpu_gdb_read_register(CPUState *cpu, uint8_t *buf, int reg);
>  int riscv_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
>  bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request);
> +bool riscv_cpu_fp_enabled(CPURISCVState *env);
>  int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch);
>  hwaddr riscv_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
>  void  riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
> @@ -298,7 +299,10 @@ static inline void cpu_get_tb_cpu_state(CPURISCVStat=
e
> *env, target_ulong *pc,
>  #ifdef CONFIG_USER_ONLY
>      *flags =3D TB_FLAGS_MSTATUS_FS;
>  #else
> -    *flags =3D cpu_mmu_index(env, 0) | (env->mstatus & MSTATUS_FS);
> +    *flags =3D cpu_mmu_index(env, 0);
> +    if (riscv_cpu_fp_enabled(env)) {
> +        *flags |=3D env->mstatus & MSTATUS_FS;
> +    }
>  #endif
>  }
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index f027be7f16..225e407cff 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -71,6 +71,16 @@ bool riscv_cpu_exec_interrupt(CPUState *cs, int
> interrupt_request)
>
>  #if !defined(CONFIG_USER_ONLY)
>
> +/* Return true is floating point support is currently enabled */
> +bool riscv_cpu_fp_enabled(CPURISCVState *env)
> +{
> +    if (env->mstatus & MSTATUS_FS) {
> +        return true;
> +    }
> +
> +    return false;
> +}
> +
>  int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint32_t interrupts)
>  {
>      CPURISCVState *env =3D &cpu->env;
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index e0d4586760..2789215b5e 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -46,7 +46,7 @@ void riscv_set_csr_ops(int csrno, riscv_csr_operations
> *ops)
>  static int fs(CPURISCVState *env, int csrno)
>  {
>  #if !defined(CONFIG_USER_ONLY)
> -    if (!env->debugger && !(env->mstatus & MSTATUS_FS)) {
> +    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
>          return -1;
>      }
>  #endif
> @@ -108,7 +108,7 @@ static int pmp(CPURISCVState *env, int csrno)
>  static int read_fflags(CPURISCVState *env, int csrno, target_ulong *val)
>  {
>  #if !defined(CONFIG_USER_ONLY)
> -    if (!env->debugger && !(env->mstatus & MSTATUS_FS)) {
> +    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
>          return -1;
>      }
>  #endif
> @@ -119,7 +119,7 @@ static int read_fflags(CPURISCVState *env, int csrno,
> target_ulong *val)
>  static int write_fflags(CPURISCVState *env, int csrno, target_ulong val)
>  {
>  #if !defined(CONFIG_USER_ONLY)
> -    if (!env->debugger && !(env->mstatus & MSTATUS_FS)) {
> +    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
>          return -1;
>      }
>      env->mstatus |=3D MSTATUS_FS;
> @@ -131,7 +131,7 @@ static int write_fflags(CPURISCVState *env, int csrno=
,
> target_ulong val)
>  static int read_frm(CPURISCVState *env, int csrno, target_ulong *val)
>  {
>  #if !defined(CONFIG_USER_ONLY)
> -    if (!env->debugger && !(env->mstatus & MSTATUS_FS)) {
> +    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
>          return -1;
>      }
>  #endif
> @@ -142,7 +142,7 @@ static int read_frm(CPURISCVState *env, int csrno,
> target_ulong *val)
>  static int write_frm(CPURISCVState *env, int csrno, target_ulong val)
>  {
>  #if !defined(CONFIG_USER_ONLY)
> -    if (!env->debugger && !(env->mstatus & MSTATUS_FS)) {
> +    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
>          return -1;
>      }
>      env->mstatus |=3D MSTATUS_FS;
> @@ -154,7 +154,7 @@ static int write_frm(CPURISCVState *env, int csrno,
> target_ulong val)
>  static int read_fcsr(CPURISCVState *env, int csrno, target_ulong *val)
>  {
>  #if !defined(CONFIG_USER_ONLY)
> -    if (!env->debugger && !(env->mstatus & MSTATUS_FS)) {
> +    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
>          return -1;
>      }
>  #endif
> @@ -166,7 +166,7 @@ static int read_fcsr(CPURISCVState *env, int csrno,
> target_ulong *val)
>  static int write_fcsr(CPURISCVState *env, int csrno, target_ulong val)
>  {
>  #if !defined(CONFIG_USER_ONLY)
> -    if (!env->debugger && !(env->mstatus & MSTATUS_FS)) {
> +    if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
>          return -1;
>      }
>      env->mstatus |=3D MSTATUS_FS;
> @@ -307,6 +307,7 @@ static int write_mstatus(CPURISCVState *env, int
> csrno, target_ulong val)
>  {
>      target_ulong mstatus =3D env->mstatus;
>      target_ulong mask =3D 0;
> +    int dirty;
>
>      /* flush tlb on mstatus fields that affect VM */
>      if (env->priv_ver <=3D PRIV_VERSION_1_09_1) {
> @@ -340,8 +341,9 @@ static int write_mstatus(CPURISCVState *env, int
> csrno, target_ulong val)
>
>      mstatus =3D (mstatus & ~mask) | (val & mask);
>
> -    int dirty =3D ((mstatus & MSTATUS_FS) =3D=3D MSTATUS_FS) |
> -                ((mstatus & MSTATUS_XS) =3D=3D MSTATUS_XS);
> +    dirty =3D (riscv_cpu_fp_enabled(env) &&
> +             ((mstatus & MSTATUS_FS) =3D=3D MSTATUS_FS)) |
> +            ((mstatus & MSTATUS_XS) =3D=3D MSTATUS_XS);
>      mstatus =3D set_field(mstatus, MSTATUS_SD, dirty);
>      env->mstatus =3D mstatus;
>
> --
> 2.22.0
>
>
> Reviewed-by: Chih-Min Chao <chihmin.chao@sifive.com>

--0000000000001cdfad058f59417d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 31, 2019 at 7:39 AM Alist=
air Francis &lt;<a href=3D"mailto:alistair.francis@wdc.com">alistair.franci=
s@wdc.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Let&#39;s create a function that tests if floating point support=
 is<br>
enabled. We can then protect all floating point operations based on if<br>
they are enabled.<br>
<br>
This patch so far doesn&#39;t change anything, it&#39;s just preparing for =
the<br>
Hypervisor support for floating point operations.<br>
<br>
Signed-off-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.=
com" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redha=
t.com" target=3D"_blank">philmd@redhat.com</a>&gt;<br>
Reviewed-by: Christophe de Dinechin &lt;<a href=3D"mailto:dinechin@redhat.c=
om" target=3D"_blank">dinechin@redhat.com</a>&gt;<br>
---<br>
=C2=A0target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 +++++-<br>
=C2=A0target/riscv/cpu_helper.c | 10 ++++++++++<br>
=C2=A0target/riscv/csr.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 20 +++++++++++-------=
--<br>
=C2=A03 files changed, 26 insertions(+), 10 deletions(-)<br>
<br>
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
index 0adb307f32..2dc9b17678 100644<br>
--- a/target/riscv/cpu.h<br>
+++ b/target/riscv/cpu.h<br>
@@ -255,6 +255,7 @@ void riscv_cpu_do_interrupt(CPUState *cpu);<br>
=C2=A0int riscv_cpu_gdb_read_register(CPUState *cpu, uint8_t *buf, int reg)=
;<br>
=C2=A0int riscv_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg=
);<br>
=C2=A0bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request);<b=
r>
+bool riscv_cpu_fp_enabled(CPURISCVState *env);<br>
=C2=A0int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch);<br>
=C2=A0hwaddr riscv_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);<br>
=C2=A0void=C2=A0 riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,<br=
>
@@ -298,7 +299,10 @@ static inline void cpu_get_tb_cpu_state(CPURISCVState =
*env, target_ulong *pc,<br>
=C2=A0#ifdef CONFIG_USER_ONLY<br>
=C2=A0 =C2=A0 =C2=A0*flags =3D TB_FLAGS_MSTATUS_FS;<br>
=C2=A0#else<br>
-=C2=A0 =C2=A0 *flags =3D cpu_mmu_index(env, 0) | (env-&gt;mstatus &amp; MS=
TATUS_FS);<br>
+=C2=A0 =C2=A0 *flags =3D cpu_mmu_index(env, 0);<br>
+=C2=A0 =C2=A0 if (riscv_cpu_fp_enabled(env)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *flags |=3D env-&gt;mstatus &amp; MSTATUS_FS;<=
br>
+=C2=A0 =C2=A0 }<br>
=C2=A0#endif<br>
=C2=A0}<br>
<br>
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c<br>
index f027be7f16..225e407cff 100644<br>
--- a/target/riscv/cpu_helper.c<br>
+++ b/target/riscv/cpu_helper.c<br>
@@ -71,6 +71,16 @@ bool riscv_cpu_exec_interrupt(CPUState *cs, int interrup=
t_request)<br>
<br>
=C2=A0#if !defined(CONFIG_USER_ONLY)<br>
<br>
+/* Return true is floating point support is currently enabled */<br>
+bool riscv_cpu_fp_enabled(CPURISCVState *env)<br>
+{<br>
+=C2=A0 =C2=A0 if (env-&gt;mstatus &amp; MSTATUS_FS) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return false;<br>
+}<br>
+<br>
=C2=A0int riscv_cpu_claim_interrupts(RISCVCPU *cpu, uint32_t interrupts)<br=
>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0CPURISCVState *env =3D &amp;cpu-&gt;env;<br>
diff --git a/target/riscv/csr.c b/target/riscv/csr.c<br>
index e0d4586760..2789215b5e 100644<br>
--- a/target/riscv/csr.c<br>
+++ b/target/riscv/csr.c<br>
@@ -46,7 +46,7 @@ void riscv_set_csr_ops(int csrno, riscv_csr_operations *o=
ps)<br>
=C2=A0static int fs(CPURISCVState *env, int csrno)<br>
=C2=A0{<br>
=C2=A0#if !defined(CONFIG_USER_ONLY)<br>
-=C2=A0 =C2=A0 if (!env-&gt;debugger &amp;&amp; !(env-&gt;mstatus &amp; MST=
ATUS_FS)) {<br>
+=C2=A0 =C2=A0 if (!env-&gt;debugger &amp;&amp; !riscv_cpu_fp_enabled(env))=
 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0#endif<br>
@@ -108,7 +108,7 @@ static int pmp(CPURISCVState *env, int csrno)<br>
=C2=A0static int read_fflags(CPURISCVState *env, int csrno, target_ulong *v=
al)<br>
=C2=A0{<br>
=C2=A0#if !defined(CONFIG_USER_ONLY)<br>
-=C2=A0 =C2=A0 if (!env-&gt;debugger &amp;&amp; !(env-&gt;mstatus &amp; MST=
ATUS_FS)) {<br>
+=C2=A0 =C2=A0 if (!env-&gt;debugger &amp;&amp; !riscv_cpu_fp_enabled(env))=
 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0#endif<br>
@@ -119,7 +119,7 @@ static int read_fflags(CPURISCVState *env, int csrno, t=
arget_ulong *val)<br>
=C2=A0static int write_fflags(CPURISCVState *env, int csrno, target_ulong v=
al)<br>
=C2=A0{<br>
=C2=A0#if !defined(CONFIG_USER_ONLY)<br>
-=C2=A0 =C2=A0 if (!env-&gt;debugger &amp;&amp; !(env-&gt;mstatus &amp; MST=
ATUS_FS)) {<br>
+=C2=A0 =C2=A0 if (!env-&gt;debugger &amp;&amp; !riscv_cpu_fp_enabled(env))=
 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0env-&gt;mstatus |=3D MSTATUS_FS;<br>
@@ -131,7 +131,7 @@ static int write_fflags(CPURISCVState *env, int csrno, =
target_ulong val)<br>
=C2=A0static int read_frm(CPURISCVState *env, int csrno, target_ulong *val)=
<br>
=C2=A0{<br>
=C2=A0#if !defined(CONFIG_USER_ONLY)<br>
-=C2=A0 =C2=A0 if (!env-&gt;debugger &amp;&amp; !(env-&gt;mstatus &amp; MST=
ATUS_FS)) {<br>
+=C2=A0 =C2=A0 if (!env-&gt;debugger &amp;&amp; !riscv_cpu_fp_enabled(env))=
 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0#endif<br>
@@ -142,7 +142,7 @@ static int read_frm(CPURISCVState *env, int csrno, targ=
et_ulong *val)<br>
=C2=A0static int write_frm(CPURISCVState *env, int csrno, target_ulong val)=
<br>
=C2=A0{<br>
=C2=A0#if !defined(CONFIG_USER_ONLY)<br>
-=C2=A0 =C2=A0 if (!env-&gt;debugger &amp;&amp; !(env-&gt;mstatus &amp; MST=
ATUS_FS)) {<br>
+=C2=A0 =C2=A0 if (!env-&gt;debugger &amp;&amp; !riscv_cpu_fp_enabled(env))=
 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0env-&gt;mstatus |=3D MSTATUS_FS;<br>
@@ -154,7 +154,7 @@ static int write_frm(CPURISCVState *env, int csrno, tar=
get_ulong val)<br>
=C2=A0static int read_fcsr(CPURISCVState *env, int csrno, target_ulong *val=
)<br>
=C2=A0{<br>
=C2=A0#if !defined(CONFIG_USER_ONLY)<br>
-=C2=A0 =C2=A0 if (!env-&gt;debugger &amp;&amp; !(env-&gt;mstatus &amp; MST=
ATUS_FS)) {<br>
+=C2=A0 =C2=A0 if (!env-&gt;debugger &amp;&amp; !riscv_cpu_fp_enabled(env))=
 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0#endif<br>
@@ -166,7 +166,7 @@ static int read_fcsr(CPURISCVState *env, int csrno, tar=
get_ulong *val)<br>
=C2=A0static int write_fcsr(CPURISCVState *env, int csrno, target_ulong val=
)<br>
=C2=A0{<br>
=C2=A0#if !defined(CONFIG_USER_ONLY)<br>
-=C2=A0 =C2=A0 if (!env-&gt;debugger &amp;&amp; !(env-&gt;mstatus &amp; MST=
ATUS_FS)) {<br>
+=C2=A0 =C2=A0 if (!env-&gt;debugger &amp;&amp; !riscv_cpu_fp_enabled(env))=
 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0env-&gt;mstatus |=3D MSTATUS_FS;<br>
@@ -307,6 +307,7 @@ static int write_mstatus(CPURISCVState *env, int csrno,=
 target_ulong val)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0target_ulong mstatus =3D env-&gt;mstatus;<br>
=C2=A0 =C2=A0 =C2=A0target_ulong mask =3D 0;<br>
+=C2=A0 =C2=A0 int dirty;<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* flush tlb on mstatus fields that affect VM */<br>
=C2=A0 =C2=A0 =C2=A0if (env-&gt;priv_ver &lt;=3D PRIV_VERSION_1_09_1) {<br>
@@ -340,8 +341,9 @@ static int write_mstatus(CPURISCVState *env, int csrno,=
 target_ulong val)<br>
<br>
=C2=A0 =C2=A0 =C2=A0mstatus =3D (mstatus &amp; ~mask) | (val &amp; mask);<b=
r>
<br>
-=C2=A0 =C2=A0 int dirty =3D ((mstatus &amp; MSTATUS_FS) =3D=3D MSTATUS_FS)=
 |<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((mstatus &amp; MS=
TATUS_XS) =3D=3D MSTATUS_XS);<br>
+=C2=A0 =C2=A0 dirty =3D (riscv_cpu_fp_enabled(env) &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0((mstatus &amp; MSTATUS_FS=
) =3D=3D MSTATUS_FS)) |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((mstatus &amp; MSTATUS_XS) =3D=
=3D MSTATUS_XS);<br>
=C2=A0 =C2=A0 =C2=A0mstatus =3D set_field(mstatus, MSTATUS_SD, dirty);<br>
=C2=A0 =C2=A0 =C2=A0env-&gt;mstatus =3D mstatus;<br>
<br>
-- <br>
2.22.0<br>
<br>
<br></blockquote><div class=3D"gmail-gs" style=3D"margin:0px;padding:0px 0p=
x 20px;width:1717.59px;font-family:Roboto,RobotoDraft,Helvetica,Arial,sans-=
serif;font-size:medium"><div class=3D"gmail-"><div id=3D"gmail-:1gx" class=
=3D"gmail-ii gmail-gt gmail-adP" style=3D"font-size:0.875rem;direction:ltr;=
margin:8px 0px 0px;padding:0px"><div id=3D"gmail-:1f3" class=3D"gmail-a3s g=
mail-aXjCH" style=3D"overflow:hidden;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;font-stretch:normal;font-size:small;line-height:1.5;fo=
nt-family:Arial,Helvetica,sans-serif"><div dir=3D"ltr"><div class=3D"gmail_=
quote"><div>Reviewed-by: Chih-Min Chao &lt;<a href=3D"mailto:chihmin.chao@s=
ifive.com" target=3D"_blank">chihmin.chao@sifive.com</a>&gt;=C2=A0 =C2=A0</=
div></div></div></div></div></div></div></div></div>

--0000000000001cdfad058f59417d--

