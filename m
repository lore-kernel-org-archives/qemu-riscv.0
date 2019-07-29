Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hs8wq-00062R-6o
	for mharc-qemu-riscv@gnu.org; Mon, 29 Jul 2019 12:56:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36127)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <chihmin.chao@sifive.com>) id 1hs8wm-0005vd-4t
 for qemu-riscv@nongnu.org; Mon, 29 Jul 2019 12:56:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <chihmin.chao@sifive.com>) id 1hs8wk-0006Qa-6t
 for qemu-riscv@nongnu.org; Mon, 29 Jul 2019 12:56:28 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:46110)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <chihmin.chao@sifive.com>)
 id 1hs8wi-0006P9-Sb
 for qemu-riscv@nongnu.org; Mon, 29 Jul 2019 12:56:25 -0400
Received: by mail-io1-xd32.google.com with SMTP id i10so8214448iol.13
 for <qemu-riscv@nongnu.org>; Mon, 29 Jul 2019 09:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yFkCbBnxncmMkqatptlnFARvoc8e9243qWK43wD8hm8=;
 b=kQFNCJFFFXNqNZpCXI6KysjCP+hShuchdRr2Yvawa9iPfk0AAqqacsRniKU4B1oe71
 wbOjSQkdWyFnbcjOAoIZiftEEaO7PnLYaryJVLgIpr9/QDkBaq5E4Uhujlea+6sm6Qzx
 WaRgUu8vss7+5OeqWiKMaMqNegkEBJOZ3G0+ARicoEo+j9KZuNJHsS80lhmaj0k2SkTT
 LFsf3JoCIedQOSFxq0B+Yoq82owY54trV1F3w7tNSiWyN0M3I9ZW6pFwfvbtSVYjAI34
 p3G/YoxkzGM07zvi75G7KL5b4x4t+42XTpDUExfduRi/CkYdxYk/VplymhlZHEvZGCFE
 vg+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yFkCbBnxncmMkqatptlnFARvoc8e9243qWK43wD8hm8=;
 b=qRGK5A3GNM8LUwzv4hSreUEh+2cbYr9an1ccp0xBK2ARmskz6JfRLiXrWURd7NyGhm
 i+hoBn4LYAlU3Ls6dBwwGcmHhMEe19DynTLLE58QeEADaDNgU6jmMgLD5+ORLydg5vlX
 1UUnVDjrD87bVWDXkWr8KBQZDaGDRuVpkr+DzsIQmJ1gu4OUxbioA7fxzeIpqy0JvSH1
 IuSNqQKBsg4HVE0+EYtJkg0teyEevA7Re4m2xO4n08beA+sjoOSqqHt7i5ATluvci66j
 j69qXE5gg421YCTxw64o09k5CC92sh/jXVF7PUMPbVRG0xCMDO6Fw7Abm+G9UybRaZs3
 Uvpw==
X-Gm-Message-State: APjAAAX4TJn5g0IipWeraX0soenRVpP/fWTThZ6sezYtB0GJLCutZQea
 vCSudAY4MV269vT+1WvkYh2WpYOk6Egz4R+yAFFFEw==
X-Google-Smtp-Source: APXvYqyuv/wf4iyZ+Z8B0vQKbG/OCgbE78Gso+8kkePebiSZnkNSXtgyRrBLeUqAURA/wKcsr0mCHO1N94TCkn9ZB3M=
X-Received: by 2002:a02:b395:: with SMTP id p21mr116521330jan.31.1564419383546; 
 Mon, 29 Jul 2019 09:56:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1564080680.git.alistair.francis@wdc.com>
 <edea77ff4aa6900d01ab7146d5b52c2dae4a856e.1564080680.git.alistair.francis@wdc.com>
In-Reply-To: <edea77ff4aa6900d01ab7146d5b52c2dae4a856e.1564080680.git.alistair.francis@wdc.com>
From: Chih-Min Chao <chihmin.chao@sifive.com>
Date: Tue, 30 Jul 2019 00:56:12 +0800
Message-ID: <CAEiOBXU-4KLv64pZJ__gszG8RyC6cE_GxwTt+przwbDkmS9vgQ@mail.gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Alistair Francis <alistair23@gmail.com>, Palmer Dabbelt <palmer@sifive.com>
Content-Type: multipart/alternative; boundary="000000000000a2f339058ed4c569"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d32
Subject: Re: [Qemu-riscv] [PATCH-4.2 v1 4/6] target/riscv: Create function
 to test if FP is enabled
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
X-List-Received-Date: Mon, 29 Jul 2019 16:56:30 -0000

--000000000000a2f339058ed4c569
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 26, 2019 at 2:55 AM Alistair Francis <alistair.francis@wdc.com>
wrote:

> Let's creaate a function that tests if floating point support is
> enabled. We can then protect all floating point operations based on if
> they are enabled.
>
> This patch so far doesn't change anything, it's just preparing for the
> Hypervisor support for floating point operations.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.h        |  6 +++++-
>  target/riscv/cpu_helper.c | 10 ++++++++++
>  target/riscv/csr.c        | 19 ++++++++++---------
>  3 files changed, 25 insertions(+), 10 deletions(-)
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
> @@ -298,7 +299,10 @@ static inline void cpu_get_tb_cpu_state(CPURISCVState
> *env, target_ulong *pc,
>  #ifdef CONFIG_USER_ONLY
>      *flags = TB_FLAGS_MSTATUS_FS;
>  #else
> -    *flags = cpu_mmu_index(env, 0) | (env->mstatus & MSTATUS_FS);
> +    *flags = cpu_mmu_index(env, 0);
> +    if (riscv_cpu_fp_enabled(env)) {
> +        *flags |= env->mstatus & MSTATUS_FS;
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
>      CPURISCVState *env = &cpu->env;
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index af3b762c8b..7b73b73cf7 100644
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
>      env->mstatus |= MSTATUS_FS;
> @@ -131,7 +131,7 @@ static int write_fflags(CPURISCVState *env, int csrno,
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
>      env->mstatus |= MSTATUS_FS;
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
>      env->mstatus |= MSTATUS_FS;
> @@ -307,6 +307,7 @@ static int write_mstatus(CPURISCVState *env, int
> csrno, target_ulong val)
>  {
>      target_ulong mstatus = env->mstatus;
>      target_ulong mask = 0;
> +    int dirty;
>
>      /* flush tlb on mstatus fields that affect VM */
>      if (env->priv_ver <= PRIV_VERSION_1_09_1) {
> @@ -340,8 +341,8 @@ static int write_mstatus(CPURISCVState *env, int
> csrno, target_ulong val)
>
>      mstatus = (mstatus & ~mask) | (val & mask);
>
> -    int dirty = ((mstatus & MSTATUS_FS) == MSTATUS_FS) |
> -                ((mstatus & MSTATUS_XS) == MSTATUS_XS);
> +    dirty = riscv_cpu_fp_enabled(env) |
> +            ((mstatus & MSTATUS_XS) == MSTATUS_XS);
>

  FS are 2bits
  original:
        only 3 is true
  new
       1, 2, 3 all make dirty true

  Since only 3 means dirty, keeps this part unchanged should be reasonable.

chihmin

     mstatus = set_field(mstatus, MSTATUS_SD, dirty);
>      env->mstatus = mstatus;
>
> --
> 2.22.0
>
>
>

--000000000000a2f339058ed4c569
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 26, 2019 at 2:55 AM Alist=
air Francis &lt;<a href=3D"mailto:alistair.francis@wdc.com">alistair.franci=
s@wdc.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Let&#39;s creaate a function that tests if floating point suppor=
t is<br>
enabled. We can then protect all floating point operations based on if<br>
they are enabled.<br>
<br>
This patch so far doesn&#39;t change anything, it&#39;s just preparing for =
the<br>
Hypervisor support for floating point operations.<br>
<br>
Signed-off-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.=
com" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
---<br>
=C2=A0target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 +++++-<br>
=C2=A0target/riscv/cpu_helper.c | 10 ++++++++++<br>
=C2=A0target/riscv/csr.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 19 ++++++++++--------=
-<br>
=C2=A03 files changed, 25 insertions(+), 10 deletions(-)<br>
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
index af3b762c8b..7b73b73cf7 100644<br>
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
@@ -340,8 +341,8 @@ static int write_mstatus(CPURISCVState *env, int csrno,=
 target_ulong val)<br>
<br>
=C2=A0 =C2=A0 =C2=A0mstatus =3D (mstatus &amp; ~mask) | (val &amp; mask);<b=
r>
<br>
-=C2=A0 =C2=A0 int dirty =3D ((mstatus &amp; MSTATUS_FS) =3D=3D MSTATUS_FS)=
 |<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((mstatus &amp; MS=
TATUS_XS) =3D=3D MSTATUS_XS);<br>
+=C2=A0 =C2=A0 dirty =3D riscv_cpu_fp_enabled(env) |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((mstatus &amp; MSTATUS_XS) =3D=
=3D MSTATUS_XS);<br></blockquote><div><br></div><div>=C2=A0 FS are 2bits</d=
iv><div>=C2=A0 original:</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 only 3 is tr=
ue=C2=A0</div><div>=C2=A0 new</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A01, 2, 3 =
all make dirty true<br></div><div><br></div><div>=C2=A0 Since only 3 means =
dirty, keeps this part unchanged should be reasonable.</div><div><br></div>=
<div>chihmin</div><div><br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
=C2=A0 =C2=A0 =C2=A0mstatus =3D set_field(mstatus, MSTATUS_SD, dirty);<br>
=C2=A0 =C2=A0 =C2=A0env-&gt;mstatus =3D mstatus;<br>
<br>
-- <br>
2.22.0<br>
<br>
<br>
</blockquote></div></div>

--000000000000a2f339058ed4c569--

