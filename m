Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B873CD98D2
	for <qemu-riscv@archiver.kernel.org>; Tue, 16 Jun 2026 03:47:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wZKlQ-00012C-Kf; Mon, 15 Jun 2026 23:47:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wZKlL-00011b-F6
 for qemu-riscv@nongnu.org; Mon, 15 Jun 2026 23:46:56 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wZKlD-0001Qr-AO
 for qemu-riscv@nongnu.org; Mon, 15 Jun 2026 23:46:49 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-693c69b97e7so4075643a12.2
 for <qemu-riscv@nongnu.org>; Mon, 15 Jun 2026 20:46:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781581605; cv=none;
 d=google.com; s=arc-20240605;
 b=f6Vg55VO+xzf2PLVsSFFFWL66MB9GIk0lijl6fEBEP6MeEGLmnziFOVrkF8QXnNwLz
 BKkW3bDkHNyyHoZqIA35ONeLYDkZgWK9xFzWBX5EJGD3Iw/VqmYLAsbwOM7qoBCy5B4n
 HtsW3krzuZq9++YbO+jUax5vnmT2Pzup2OHi3YgYMEH0molY7btCypWNVfWTEqJftwWF
 z+vTj5je3qoAkiU3e3hLKYxSfTQIKhFr+pzRzHqc3p+qy0+FGzfQj6eXN4x6ck1UT2WJ
 nwxgPXshdpjynVgiT72ruBYa143wUVyxs/mMtoiavP+Wyhz2VtiLYDOTcCef6Zl7X36C
 D6OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=50TdmGslnRDhSWpr5PWbameAefXpuq2Lq7FlTskW8oA=;
 fh=V32ZP9YQMf2pX1yF54GovvJE7qeBqjIDVcUSAbP/AMs=;
 b=co6cqJ7Qg6vlYj12mJAmDngWrPomvN3edDj3qV196SYUGs3vZuOWbXR4+J0TtZQPSP
 7+jL4wWAMMjllQEN2/Dj+3jiK91VpCbk5N+fawQMg1DHygrjsDUCh6vqAZzAa6WLExSv
 zl15wZKx6PXDljWZfyYoac8MD0onOQl4lTYA2yArP+z/uAsXqWk3v3C4uTTQXyxGtrJh
 0+rpkiNEaVIdWkxN7lrQuMKXnTLOvoVYR6qmRZoQgXkFWNti5k1xXYNzSiQJrhcQQ3c4
 oWOfqBvVIIkJ6p0lOJiQGWj/HgpUStb98UvQ235UOTz+T5IuSyZIn4PH8c7oQjCwppS0
 tX3A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781581605; x=1782186405; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=50TdmGslnRDhSWpr5PWbameAefXpuq2Lq7FlTskW8oA=;
 b=bfrjYQj19KS/5hXSEmld28M5qpLwEwf1DUZzFrP6WTAsEg33zJgRw6OIYGTcAf3AC8
 TjSMal0Q7I7iycFFrU13hQcbWUAmT/ljRoPEhyUfGchKFj49X0rdmqI/s1sIjAU+dmU8
 P3kvvtUkVtxSuasvbkIL+Q67vMSMtnaBk0v1rJDZHb/bHfcJmo8Di6WVwPACgQbxTk2X
 QFvkgaYmmw7fU5SDQKmrlBY7Tb+yWVM3Pfa8r07jrKrDrinQd+WjLKovpM3dCTQ4roWy
 f8Gcw2SZtvREXI0HIfrHA3ekE9gF0GcGbSPadTkyTx198kHy47KhRBtN7WwEmDS4lnot
 RLkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781581605; x=1782186405;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=50TdmGslnRDhSWpr5PWbameAefXpuq2Lq7FlTskW8oA=;
 b=XKC1rGNmEIrVXx4GAJM04KeP6gLwl+QlrQE4Sq8NeGJIIs+/DypwFeopXm2mq0ang8
 wvtCUh5rVxoKBtPUN3hH3mojiBm9cANHNjqNSuP+Ok9aC7G3IAkwFsIEIxuOQeyJ0DmZ
 EmNIU1uiMWvPdIM+I7nQKu+ZGthzfdkVFZwXo5IK2cFCSPdbTbXDswvkaoWPmOjMT2KA
 rJhbmYgdH473uVVjm5ffv/a/nePC/ilrHbDLy35y1NV2hruGACjqiTS6coLMZd80mAGV
 qzQ9Idh+4X+yFWYw3wbDKzjRRv1359IITUbJC9KuzSApNdiDk8rANiRhj3ZPZ1XND2Uh
 SMBA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9SAtMZHJ3ZmuZakzbQVUn/0YPVPym3EiztdGN69i305ACewK+AoR+gIzfO2yufP7JnAMp7g7FQ5NeI@nongnu.org
X-Gm-Message-State: AOJu0YxSJk0t4nAnm2y8E7pKckTgR7576pKeI0vtLQanaBlf3/B4unqN
 Hhsx09m9e2Sx0Kse5NXIBaSrpmuNUalsVfIdwi2CWp7yTWb3k2j1O66rD4APlalpK5a37HUSLN1
 Al+qkMY7L9VasGvbR/lvLDHMUYbTP2FU=
X-Gm-Gg: Acq92OFpp2iBztG0wkFRWz6iWI90FzraTfI7RhqeKOKfMlcPA/e3kP9sUL01HpupZBt
 RtwtcXjjybc8vS14ix0Cc7p+yTrme1AqohY6OXff/KB3eiNrw6nRUqDFdcKrrX6qwP7AgZsX60d
 z8qVsXQ7cqhoEb9HWkSrpUAbRaxp7p6v3nbAVGRouf35013PwKAabQbG6YPVtKJWQ8Sh+MRXd8w
 0oCFMZbBEh5oxgQLuAXacWHlj7MAq4vxoK4nUsauaySciQoc+POloTUJdAvhNjqI2cgm8xLOZeT
 hD70ukpcJZyJ4ap72ozQcI3Uru1Hc2gpnYv87Q==
X-Received: by 2002:a05:6402:1ec5:b0:691:aeaf:42a7 with SMTP id
 4fb4d7f45d1cf-695086f24e0mr935488a12.10.1781581605401; Mon, 15 Jun 2026
 20:46:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260611123412.2135600-1-daniel.barboza@oss.qualcomm.com>
 <20260611123412.2135600-3-daniel.barboza@oss.qualcomm.com>
In-Reply-To: <20260611123412.2135600-3-daniel.barboza@oss.qualcomm.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 16 Jun 2026 13:46:19 +1000
X-Gm-Features: AVVi8CclfttVgfJe659cZHioXj-08Ue6ChTvoKP_YtQwGdjzHEDBHCsmFbhJK2k
Message-ID: <CAKmqyKOVHsXggvoQxLh7M1shW-rtfLtt_m4uA9HrrOX_Sf2RiA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] target/riscv: dynamic alloc of debug trigger arrays
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com, 
 philmd@oss.qualcomm.com, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=alistair23@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Thu, Jun 11, 2026 at 10:35=E2=80=AFPM Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
> The debug trigger facility consists of a set of arrays: tdata1-3,
> cpu_breakpoint, cpu_watchpoint and itrigger_timer.  All of them are
> static allocated with RV_MAX_TRIGGERS (2).  This means that all RISC-V
> cpus will have 2 triggers per hart.
>
> The RISC-V Server Ref demands at least 11 triggers per hart, and several
> CPUs in the wild works with 4+ triggers.  We need more flexibility, ergo
> we need to parametrize the amount of triggers and make it configurable.
>
> Before doing that we need to handle a situation faced in a previous
> attempt [1].  We were unable to set the tdataN array length in
> vmstate_debug, meaning that we would always migrate RV_MAX_TRIGGERS
> regardless of the actual amount of triggers in play. To fix that we need
> to change the tdata arrays from static to dynamic, allowing us to use
> VMSTATE_VARRAY_UINT32().  This also means that, in contrast with [1], we
> have the opportunity to turn all trigger arrays into dynamic allocation
> and reduce the amount of stuff being carried by CPURISCVState, or in
> other words, we can carry just what we're using instead of a static max
> value.
>
> All the forementioned trigger facility arrays are now dynamic.  They are
> allocated and freed during realize/unrealize, and their size is
> expressed by env->num_triggers.  All relevant code is changed to use
> env->num_triggers instead of the RV_MAX_TRIGGERS to loop through each
> array.
>
> This will make it easier for the next patch to parametrize
> env->num_triggers.
>
> [1] https://lore.kernel.org/qemu-devel/94c772b0-5231-40e4-9cab-6ac39b9e4d=
45@oss.qualcomm.com/
>
> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c     |  6 ++++++
>  target/riscv/cpu.h     | 18 +++++++++++------
>  target/riscv/csr.c     |  2 +-
>  target/riscv/debug.c   | 46 ++++++++++++++++++++++++++++++++++--------
>  target/riscv/debug.h   |  1 +
>  target/riscv/machine.c | 16 ++++++++++-----
>  6 files changed, 69 insertions(+), 20 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 5b2133d811..b20271a220 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1015,7 +1015,13 @@ static void riscv_cpu_realize(DeviceState *dev, Er=
ror **errp)
>  static void riscv_cpu_unrealize(DeviceState *dev)
>  {
>      RISCVCPUClass *mcc =3D RISCV_CPU_GET_CLASS(dev);
> +#ifndef CONFIG_USER_ONLY
> +    RISCVCPU *cpu =3D RISCV_CPU(dev);
>
> +    if (cpu->cfg.debug) {
> +        riscv_trigger_unrealize(&cpu->env);
> +    }
> +#endif
>      mcc->parent_unrealize(dev);
>  }
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 11cd710990..ea92e2c68c 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -467,12 +467,18 @@ struct CPUArchState {
>      /* trigger module */
>      uint16_t mcontext;
>      uint8_t trigger_cur;
> -    uint64_t tdata1[RV_MAX_TRIGGERS];
> -    uint64_t tdata2[RV_MAX_TRIGGERS];
> -    uint64_t tdata3[RV_MAX_TRIGGERS];
> -    struct CPUBreakpoint *cpu_breakpoint[RV_MAX_TRIGGERS];
> -    struct CPUWatchpoint *cpu_watchpoint[RV_MAX_TRIGGERS];
> -    QEMUTimer *itrigger_timer[RV_MAX_TRIGGERS];
> +    /*
> +     * num_triggers is the length of tdata1, tdata2, tdata3,
> +     * cpu_breakpoint, cpu_watchpoint and itrigger_timer
> +     * arrays.
> +     */
> +    uint32_t num_triggers;
> +    uint64_t *tdata1;
> +    uint64_t *tdata2;
> +    uint64_t *tdata3;
> +    struct CPUBreakpoint **cpu_breakpoint;
> +    struct CPUWatchpoint **cpu_watchpoint;
> +    QEMUTimer **itrigger_timer;
>      int64_t last_icount;
>      bool itrigger_enabled;
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index ec931a8c3d..82afad82db 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -5436,7 +5436,7 @@ static RISCVException read_tdata(CPURISCVState *env=
, int csrno,
>                                   target_ulong *val)
>  {
>      /* return 0 in tdata1 to end the trigger enumeration */
> -    if (env->trigger_cur >=3D RV_MAX_TRIGGERS && csrno =3D=3D CSR_TDATA1=
) {
> +    if (env->trigger_cur >=3D env->num_triggers && csrno =3D=3D CSR_TDAT=
A1) {
>          *val =3D 0;
>          return RISCV_EXCP_NONE;
>      }
> diff --git a/target/riscv/debug.c b/target/riscv/debug.c
> index 30d39ee5cd..9a4910c431 100644
> --- a/target/riscv/debug.c
> +++ b/target/riscv/debug.c
> @@ -172,7 +172,7 @@ target_ulong tselect_csr_read(CPURISCVState *env)
>
>  void tselect_csr_write(CPURISCVState *env, target_ulong val)
>  {
> -    if (val < RV_MAX_TRIGGERS) {
> +    if (val < env->num_triggers) {
>          env->trigger_cur =3D val;
>      }
>  }
> @@ -701,7 +701,7 @@ static bool check_itrigger_priv(CPURISCVState *env, i=
nt index)
>  bool riscv_itrigger_enabled(CPURISCVState *env)
>  {
>      int count;
> -    for (int i =3D 0; i < RV_MAX_TRIGGERS; i++) {
> +    for (int i =3D 0; i < env->num_triggers; i++) {
>          if (get_trigger_type(env, i) !=3D TRIGGER_TYPE_INST_CNT) {
>              continue;
>          }
> @@ -721,7 +721,7 @@ bool riscv_itrigger_enabled(CPURISCVState *env)
>  void helper_itrigger_match(CPURISCVState *env)
>  {
>      int count;
> -    for (int i =3D 0; i < RV_MAX_TRIGGERS; i++) {
> +    for (int i =3D 0; i < env->num_triggers; i++) {
>          if (get_trigger_type(env, i) !=3D TRIGGER_TYPE_INST_CNT) {
>              continue;
>          }
> @@ -750,7 +750,7 @@ static void riscv_itrigger_update_count(CPURISCVState=
 *env)
>      int64_t last_icount =3D env->last_icount, current_icount;
>      current_icount =3D env->last_icount =3D icount_get_raw();
>
> -    for (int i =3D 0; i < RV_MAX_TRIGGERS; i++) {
> +    for (int i =3D 0; i < env->num_triggers; i++) {
>          if (get_trigger_type(env, i) !=3D TRIGGER_TYPE_INST_CNT) {
>              continue;
>          }
> @@ -950,7 +950,7 @@ bool riscv_cpu_debug_check_breakpoint(CPUState *cs)
>      int i;
>
>      QTAILQ_FOREACH(bp, &cs->breakpoints, entry) {
> -        for (i =3D 0; i < RV_MAX_TRIGGERS; i++) {
> +        for (i =3D 0; i < env->num_triggers; i++) {
>              trigger_type =3D get_trigger_type(env, i);
>
>              if (!trigger_common_match(env, trigger_type, i)) {
> @@ -996,7 +996,7 @@ bool riscv_cpu_debug_check_watchpoint(CPUState *cs, C=
PUWatchpoint *wp)
>      int flags;
>      int i;
>
> -    for (i =3D 0; i < RV_MAX_TRIGGERS; i++) {
> +    for (i =3D 0; i < env->num_triggers; i++) {
>          trigger_type =3D get_trigger_type(env, i);
>
>          if (!trigger_common_match(env, trigger_type, i)) {
> @@ -1049,19 +1049,49 @@ void riscv_trigger_realize(CPURISCVState *env)
>  {
>      int i;
>
> -    for (i =3D 0; i < RV_MAX_TRIGGERS; i++) {
> +    /*
> +     * Alloc env->tdata1/2/3, cpu_breakpoint, cpu_watchpoint and
> +     * itrigger_timer dynamically.  This is overkill now
> +     * given that they could be static arrays with RV_MAX_TRIGGERS
> +     * but we'll parametrize the trigger number later, i.e. the
> +     * array length won't be static.
> +     */
> +    env->num_triggers =3D RV_MAX_TRIGGERS;
> +    env->tdata1 =3D g_new0(uint64_t, env->num_triggers);
> +    env->tdata2 =3D g_new0(uint64_t, env->num_triggers);
> +    env->tdata3 =3D g_new0(uint64_t, env->num_triggers);
> +    env->cpu_breakpoint =3D g_new0(struct CPUBreakpoint *, env->num_trig=
gers);
> +    env->cpu_watchpoint =3D g_new0(struct CPUWatchpoint *, env->num_trig=
gers);
> +    env->itrigger_timer =3D g_new0(QEMUTimer *, env->num_triggers);
> +
> +    for (i =3D 0; i < env->num_triggers; i++) {
>          env->itrigger_timer[i] =3D timer_new_ns(QEMU_CLOCK_VIRTUAL,
>                                                riscv_itrigger_timer_cb, e=
nv);
>      }
>  }
>
> +void riscv_trigger_unrealize(CPURISCVState *env)
> +{
> +    g_free(env->tdata1);
> +    g_free(env->tdata2);
> +    g_free(env->tdata3);
> +
> +    g_free(env->cpu_breakpoint);
> +    g_free(env->cpu_watchpoint);
> +
> +    for (int i =3D 0; i < env->num_triggers; i++) {
> +        timer_del(env->itrigger_timer[i]);
> +    }
> +    g_free(env->itrigger_timer);
> +}
> +
>  void riscv_trigger_reset_hold(CPURISCVState *env)
>  {
>      target_ulong tdata1 =3D build_tdata1(env, TRIGGER_TYPE_AD_MATCH, 0, =
0);
>      int i;
>
>      /* init to type 2 triggers */
> -    for (i =3D 0; i < RV_MAX_TRIGGERS; i++) {
> +    for (i =3D 0; i < env->num_triggers; i++) {
>          /*
>           * type =3D TRIGGER_TYPE_AD_MATCH
>           * dmode =3D 0 (both debug and M-mode can write tdata)
> diff --git a/target/riscv/debug.h b/target/riscv/debug.h
> index 55a3ac72e6..a25d099b37 100644
> --- a/target/riscv/debug.h
> +++ b/target/riscv/debug.h
> @@ -148,6 +148,7 @@ bool riscv_cpu_debug_check_breakpoint(CPUState *cs);
>  bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp);
>
>  void riscv_trigger_realize(CPURISCVState *env);
> +void riscv_trigger_unrealize(CPURISCVState *env);
>  void riscv_trigger_reset_hold(CPURISCVState *env);
>
>  bool riscv_itrigger_enabled(CPURISCVState *env);
> diff --git a/target/riscv/machine.c b/target/riscv/machine.c
> index 6e70b145a5..ba96ceceef 100644
> --- a/target/riscv/machine.c
> +++ b/target/riscv/machine.c
> @@ -240,16 +240,22 @@ static int debug_post_load(void *opaque, int versio=
n_id)
>
>  static const VMStateDescription vmstate_debug =3D {
>      .name =3D "cpu/debug",
> -    .version_id =3D 3,
> -    .minimum_version_id =3D 3,
> +    .version_id =3D 4,
> +    .minimum_version_id =3D 4,
>      .needed =3D debug_needed,
>      .post_load =3D debug_post_load,
>      .fields =3D (const VMStateField[]) {
>          VMSTATE_UINT16(env.mcontext, RISCVCPU),
>          VMSTATE_UINT8(env.trigger_cur, RISCVCPU),
> -        VMSTATE_UINT64_ARRAY(env.tdata1, RISCVCPU, RV_MAX_TRIGGERS),
> -        VMSTATE_UINT64_ARRAY(env.tdata2, RISCVCPU, RV_MAX_TRIGGERS),
> -        VMSTATE_UINT64_ARRAY(env.tdata3, RISCVCPU, RV_MAX_TRIGGERS),
> +        VMSTATE_VARRAY_UINT32(env.tdata1, RISCVCPU,
> +                              env.num_triggers, 0,
> +                              vmstate_info_uint64, uint64_t),
> +        VMSTATE_VARRAY_UINT32(env.tdata2, RISCVCPU,
> +                              env.num_triggers, 0,
> +                              vmstate_info_uint64, uint64_t),
> +        VMSTATE_VARRAY_UINT32(env.tdata3, RISCVCPU,
> +                              env.num_triggers, 0,
> +                              vmstate_info_uint64, uint64_t),
>          VMSTATE_END_OF_LIST()
>      }
>  };
> --
> 2.43.0
>
>

