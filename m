Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nhBGn-00066R-5V
	for mharc-qemu-riscv@gnu.org; Wed, 20 Apr 2022 10:25:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nhBGc-0005yk-O9
 for qemu-riscv@nongnu.org; Wed, 20 Apr 2022 10:25:14 -0400
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e]:35734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nhBGT-0005xh-LD
 for qemu-riscv@nongnu.org; Wed, 20 Apr 2022 10:25:14 -0400
Received: by mail-vs1-xe2e.google.com with SMTP id j16so1699256vsv.2
 for <qemu-riscv@nongnu.org>; Wed, 20 Apr 2022 07:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5SLzwG5QrmzZwrw5CHkQvl4b3xGavv7UAa+ndIiCQ8Q=;
 b=zKJTKXdL/Z8U7zdVYJbw3nZBT/9C13UgPWZifK+xDs/xLNE8wkeJ82wgWYU0jnD7Q5
 xX+jbDAO9XrLhzlb5+KftSbJduZ3XEGdypIv41hfINlOVxLw/vYFUuWcPLNn+ZrThtTC
 Q8vKwFsVL6WSkek9CmQkhbB/ki6gfpdalPuWdh0mSHOShGbyzkOxB//4iv1Fw1OZRdMc
 fOpKDP3Ug3L4Gwq7kbajJ7NqlIWaHoIPiTtmu/waZyKCLrfa2D/0ZpWGDj/5PyJ618vO
 VyeID39Jycszm/4wLvxUM9QIOvIv5NyPGzCZJ8H+XOSyl1PcJx4plo8xTUmZBmU0L+UB
 23wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5SLzwG5QrmzZwrw5CHkQvl4b3xGavv7UAa+ndIiCQ8Q=;
 b=lr7sg5HZan9IaR7V68i8IdQ0FiT24dGHzUndahXbOj2hHGo35bjucGsJxiAHym0poL
 EYZo8ryCzkL88MV3hrnF0fsf/0RkQgqyA590HoVkB5pf/dKQTQqKxBVT/7eRDD4X12/Z
 ZHcZPs6gxzEHzGlA6xmDle3MifKRgn/BrgCve4UIDe2I5YYod9mAxccVUb0pZxLYnCxu
 llb95iqH0qKSybYsyTKINrg/J5eezYhm27o8aFxlf48GGR92K9KYs+uDYb+OQtNh2rfC
 tFoyY1hYzSPlBPaXQKadMX+W8hh6CZw7QVLGyf7nkniVR70Z7t0SY3+3FmMmFmEMbHcx
 AbKQ==
X-Gm-Message-State: AOAM530tjd2LXwd0L8YZWb/OmR+7lhdri8C6LLTiRuN+FkGYikcE4gf2
 33YHj/IVkYt3t+RtrKDx3MYavBAZz9cIYzqUSqf2Rg==
X-Google-Smtp-Source: ABdhPJydZiIQpctdUEr18jAWvP96TCca9un5RfiNVpBXOurA6SrHqiYzaaw4DJqMIIwSyntLKiASNsOUSi2ohWZeA84=
X-Received: by 2002:a67:746:0:b0:328:33e3:6079 with SMTP id
 67-20020a670746000000b0032833e36079mr6546248vsh.17.1650464704218; Wed, 20 Apr
 2022 07:25:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
 <20220420132624.2439741-20-marcandre.lureau@redhat.com>
In-Reply-To: <20220420132624.2439741-20-marcandre.lureau@redhat.com>
From: Warner Losh <imp@bsdimp.com>
Date: Wed, 20 Apr 2022 08:24:53 -0600
Message-ID: <CANCZdfo1hwpf6WL4dX0Yw_52Q6PahDQZcVOx=HKKx8jNEquStw@mail.gmail.com>
Subject: Re: [PATCH 19/41] compiler.h: replace QEMU_NORETURN with G_NORETURN
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Kyle Evans <kevans@freebsd.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Yanan Wang <wangyanan55@huawei.com>, Laurent Vivier <laurent@vivier.eu>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Taylor Simpson <tsimpson@quicinc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, 
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, 
 Greg Kurz <groug@kaod.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>, 
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 "open list:Block layer core" <qemu-block@nongnu.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>, 
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>, 
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000068d6b905dd16c234"
Received-SPF: none client-ip=2607:f8b0:4864:20::e2e;
 envelope-from=wlosh@bsdimp.com; helo=mail-vs1-xe2e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 20 Apr 2022 14:25:15 -0000

--00000000000068d6b905dd16c234
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 20, 2022 at 7:28 AM <marcandre.lureau@redhat.com> wrote:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> G_NORETURN was introduced in glib 2.68, fallback to G_GNUC_NORETURN in
> glib-compat.
>
> Note that this attribute must be placed before the function declaration
> (bringing a bit of consistency in qemu codebase usage).
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>

Reviewed-by: Warner Losh <imp@bsdimp.com>

Most of this looks mechanical, but I only looked closely at the bsd-user
changes.



> ---
>  accel/tcg/internal.h                 |  3 +--
>  include/exec/exec-all.h              | 20 +++++++++---------
>  include/exec/helper-head.h           |  2 +-
>  include/glib-compat.h                |  4 ++++
>  include/hw/core/cpu.h                |  2 +-
>  include/hw/core/tcg-cpu-ops.h        |  6 +++---
>  include/hw/hw.h                      |  2 +-
>  include/qemu/compiler.h              |  2 --
>  include/qemu/osdep.h                 |  3 ++-
>  include/qemu/thread.h                |  2 +-
>  include/tcg/tcg-ldst.h               |  4 ++--
>  include/tcg/tcg.h                    |  2 +-
>  linux-user/user-internals.h          |  2 +-
>  scripts/cocci-macro-file.h           |  2 +-
>  target/alpha/cpu.h                   | 10 ++++-----
>  target/arm/internals.h               | 12 +++++------
>  target/hppa/cpu.h                    |  2 +-
>  target/i386/tcg/helper-tcg.h         | 24 ++++++++++-----------
>  target/microblaze/cpu.h              |  6 +++---
>  target/mips/tcg/tcg-internal.h       | 17 ++++++++-------
>  target/nios2/cpu.h                   |  6 +++---
>  target/openrisc/exception.h          |  2 +-
>  target/ppc/cpu.h                     | 14 ++++++-------
>  target/ppc/internal.h                |  6 +++---
>  target/riscv/cpu.h                   | 10 ++++-----
>  target/s390x/s390x-internal.h        |  6 +++---
>  target/s390x/tcg/tcg_s390x.h         | 12 +++++------
>  target/sh4/cpu.h                     |  6 +++---
>  target/sparc/cpu.h                   | 10 ++++-----
>  target/xtensa/cpu.h                  |  6 +++---
>  accel/stubs/tcg-stub.c               |  4 ++--
>  bsd-user/signal.c                    |  3 ++-
>  hw/misc/mips_itu.c                   |  3 ++-
>  linux-user/signal.c                  |  3 ++-
>  monitor/hmp.c                        |  4 ++--
>  qemu-img.c                           | 12 +++++++----
>  target/alpha/helper.c                | 10 ++++-----
>  target/arm/pauth_helper.c            |  4 ++--
>  target/arm/tlb_helper.c              |  7 ++++---
>  target/hexagon/op_helper.c           |  9 ++++----
>  target/hppa/cpu.c                    |  8 +++----
>  target/hppa/op_helper.c              |  4 ++--
>  target/i386/tcg/bpt_helper.c         |  2 +-
>  target/i386/tcg/excp_helper.c        | 31 ++++++++++++++--------------
>  target/i386/tcg/misc_helper.c        |  6 +++---
>  target/i386/tcg/sysemu/misc_helper.c |  7 ++++---
>  target/openrisc/exception.c          |  2 +-
>  target/openrisc/exception_helper.c   |  3 ++-
>  target/riscv/op_helper.c             |  4 ++--
>  target/rx/op_helper.c                | 22 +++++++++++---------
>  target/s390x/tcg/excp_helper.c       | 22 +++++++++++---------
>  target/sh4/op_helper.c               |  5 +++--
>  target/sparc/mmu_helper.c            |  8 +++----
>  target/tricore/op_helper.c           |  6 +++---
>  tcg/tcg.c                            |  3 ++-
>  tests/fp/fp-bench.c                  |  3 ++-
>  tests/fp/fp-test.c                   |  3 ++-
>  scripts/checkpatch.pl                |  2 +-
>  58 files changed, 214 insertions(+), 191 deletions(-)
>
> diff --git a/accel/tcg/internal.h b/accel/tcg/internal.h
> index 881bc1ede0b1..3092bfa96430 100644
> --- a/accel/tcg/internal.h
> +++ b/accel/tcg/internal.h
> @@ -14,8 +14,7 @@
>  TranslationBlock *tb_gen_code(CPUState *cpu, target_ulong pc,
>                                target_ulong cs_base, uint32_t flags,
>                                int cflags);
> -
> -void QEMU_NORETURN cpu_io_recompile(CPUState *cpu, uintptr_t retaddr);
> +G_NORETURN void cpu_io_recompile(CPUState *cpu, uintptr_t retaddr);
>  void page_init(void);
>  void tb_htable_init(void);
>
> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> index d2cb0981f405..311e5fb422a3 100644
> --- a/include/exec/exec-all.h
> +++ b/include/exec/exec-all.h
> @@ -58,10 +58,10 @@ void restore_state_to_opc(CPUArchState *env,
> TranslationBlock *tb,
>   */
>  bool cpu_restore_state(CPUState *cpu, uintptr_t searched_pc, bool
> will_exit);
>
> -void QEMU_NORETURN cpu_loop_exit_noexc(CPUState *cpu);
> -void QEMU_NORETURN cpu_loop_exit(CPUState *cpu);
> -void QEMU_NORETURN cpu_loop_exit_restore(CPUState *cpu, uintptr_t pc);
> -void QEMU_NORETURN cpu_loop_exit_atomic(CPUState *cpu, uintptr_t pc);
> +G_NORETURN void cpu_loop_exit_noexc(CPUState *cpu);
> +G_NORETURN void cpu_loop_exit(CPUState *cpu);
> +G_NORETURN void cpu_loop_exit_restore(CPUState *cpu, uintptr_t pc);
> +G_NORETURN void cpu_loop_exit_atomic(CPUState *cpu, uintptr_t pc);
>
>  /**
>   * cpu_loop_exit_requested:
> @@ -669,9 +669,9 @@ bool handle_sigsegv_accerr_write(CPUState *cpu,
> sigset_t *old_set,
>   * Use the TCGCPUOps hook to record cpu state, do guest operating system
>   * specific things to raise SIGSEGV, and jump to the main cpu loop.
>   */
> -void QEMU_NORETURN cpu_loop_exit_sigsegv(CPUState *cpu, target_ulong add=
r,
> -                                         MMUAccessType access_type,
> -                                         bool maperr, uintptr_t ra);
> +G_NORETURN void cpu_loop_exit_sigsegv(CPUState *cpu, target_ulong addr,
> +                                      MMUAccessType access_type,
> +                                      bool maperr, uintptr_t ra);
>
>  /**
>   * cpu_loop_exit_sigbus:
> @@ -683,9 +683,9 @@ void QEMU_NORETURN cpu_loop_exit_sigsegv(CPUState
> *cpu, target_ulong addr,
>   * Use the TCGCPUOps hook to record cpu state, do guest operating system
>   * specific things to raise SIGBUS, and jump to the main cpu loop.
>   */
> -void QEMU_NORETURN cpu_loop_exit_sigbus(CPUState *cpu, target_ulong addr=
,
> -                                        MMUAccessType access_type,
> -                                        uintptr_t ra);
> +G_NORETURN void cpu_loop_exit_sigbus(CPUState *cpu, target_ulong addr,
> +                                     MMUAccessType access_type,
> +                                     uintptr_t ra);
>
>  #else
>  static inline void mmap_lock(void) {}
> diff --git a/include/exec/helper-head.h b/include/exec/helper-head.h
> index 734af067fee6..e242fed46e0c 100644
> --- a/include/exec/helper-head.h
> +++ b/include/exec/helper-head.h
> @@ -46,7 +46,7 @@
>  #define dh_ctype_ptr void *
>  #define dh_ctype_cptr const void *
>  #define dh_ctype_void void
> -#define dh_ctype_noreturn void QEMU_NORETURN
> +#define dh_ctype_noreturn G_NORETURN void
>  #define dh_ctype(t) dh_ctype_##t
>
>  #ifdef NEED_CPU_H
> diff --git a/include/glib-compat.h b/include/glib-compat.h
> index 3113a7d2af84..43a562974d80 100644
> --- a/include/glib-compat.h
> +++ b/include/glib-compat.h
> @@ -147,4 +147,8 @@ qemu_g_test_slow(void)
>
>  #pragma GCC diagnostic pop
>
> +#ifndef G_NORETURN
> +#define G_NORETURN G_GNUC_NORETURN
> +#endif
> +
>  #endif
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index 466bed604727..996f94059f7c 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -1015,7 +1015,7 @@ int cpu_watchpoint_address_matches(CPUState *cpu,
> vaddr addr, vaddr len);
>   */
>  AddressSpace *cpu_get_address_space(CPUState *cpu, int asidx);
>
> -void QEMU_NORETURN cpu_abort(CPUState *cpu, const char *fmt, ...)
> +G_NORETURN void cpu_abort(CPUState *cpu, const char *fmt, ...)
>      G_GNUC_PRINTF(2, 3);
>
>  /* $(top_srcdir)/cpu.c */
> diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.=
h
> index e13898553aff..fbe6b76764cf 100644
> --- a/include/hw/core/tcg-cpu-ops.h
> +++ b/include/hw/core/tcg-cpu-ops.h
> @@ -78,9 +78,9 @@ struct TCGCPUOps {
>       * @do_unaligned_access: Callback for unaligned access handling
>       * The callback must exit via raising an exception.
>       */
> -    void (*do_unaligned_access)(CPUState *cpu, vaddr addr,
> -                                MMUAccessType access_type,
> -                                int mmu_idx, uintptr_t retaddr)
> QEMU_NORETURN;
> +    G_NORETURN void (*do_unaligned_access)(CPUState *cpu, vaddr addr,
> +                                           MMUAccessType access_type,
> +                                           int mmu_idx, uintptr_t
> retaddr);
>
>      /**
>       * @adjust_watchpoint_address: hack for cpu_check_watchpoint used by
> ARM
> diff --git a/include/hw/hw.h b/include/hw/hw.h
> index 34377f5309d3..045c1c8b09b3 100644
> --- a/include/hw/hw.h
> +++ b/include/hw/hw.h
> @@ -5,6 +5,6 @@
>  #error Cannot include hw/hw.h from user emulation
>  #endif
>
> -void QEMU_NORETURN hw_error(const char *fmt, ...) G_GNUC_PRINTF(1, 2);
> +G_NORETURN void hw_error(const char *fmt, ...) G_GNUC_PRINTF(1, 2);
>
>  #endif
> diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
> index c13bc8b58652..f12c0fb581ec 100644
> --- a/include/qemu/compiler.h
> +++ b/include/qemu/compiler.h
> @@ -22,8 +22,6 @@
>  #define QEMU_EXTERN_C extern
>  #endif
>
> -#define QEMU_NORETURN __attribute__ ((__noreturn__))
> -
>  #if defined(_WIN32) && (defined(__x86_64__) || defined(__i386__))
>  # define QEMU_PACKED __attribute__((gcc_struct, packed))
>  #else
> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> index 848916f5165c..14b6b65a5fa9 100644
> --- a/include/qemu/osdep.h
> +++ b/include/qemu/osdep.h
> @@ -177,7 +177,8 @@ extern "C" {
>   * supports QEMU_ERROR, this will be reported at compile time; otherwise
>   * this will be reported at link time due to the missing symbol.
>   */
> -extern void QEMU_NORETURN QEMU_ERROR("code path is reachable")
> +extern G_NORETURN
> +void QEMU_ERROR("code path is reachable")
>      qemu_build_not_reached_always(void);
>  #if defined(__OPTIMIZE__) && !defined(__NO_INLINE__)
>  #define qemu_build_not_reached()  qemu_build_not_reached_always()
> diff --git a/include/qemu/thread.h b/include/qemu/thread.h
> index 460568d67d53..af19f2b3fc7d 100644
> --- a/include/qemu/thread.h
> +++ b/include/qemu/thread.h
> @@ -188,7 +188,7 @@ void qemu_thread_create(QemuThread *thread, const cha=
r
> *name,
>  void *qemu_thread_join(QemuThread *thread);
>  void qemu_thread_get_self(QemuThread *thread);
>  bool qemu_thread_is_self(QemuThread *thread);
> -void qemu_thread_exit(void *retval) QEMU_NORETURN;
> +G_NORETURN void qemu_thread_exit(void *retval);
>  void qemu_thread_naming(bool enable);
>
>  struct Notifier;
> diff --git a/include/tcg/tcg-ldst.h b/include/tcg/tcg-ldst.h
> index bf40942de4ab..121a156933a5 100644
> --- a/include/tcg/tcg-ldst.h
> +++ b/include/tcg/tcg-ldst.h
> @@ -72,8 +72,8 @@ void helper_be_stq_mmu(CPUArchState *env, target_ulong
> addr, uint64_t val,
>
>  #else
>
> -void QEMU_NORETURN helper_unaligned_ld(CPUArchState *env, target_ulong
> addr);
> -void QEMU_NORETURN helper_unaligned_st(CPUArchState *env, target_ulong
> addr);
> +G_NORETURN void helper_unaligned_ld(CPUArchState *env, target_ulong addr=
);
> +G_NORETURN void helper_unaligned_st(CPUArchState *env, target_ulong addr=
);
>
>  #endif /* CONFIG_SOFTMMU */
>  #endif /* TCG_LDST_H */
> diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
> index 73869fd9d04f..688d1fb46077 100644
> --- a/include/tcg/tcg.h
> +++ b/include/tcg/tcg.h
> @@ -398,7 +398,7 @@ typedef TCGv_ptr TCGv_env;
>  #define TCG_CALL_NO_WRITE_GLOBALS   0x0002
>  /* Helper can be safely suppressed if the return value is not used. */
>  #define TCG_CALL_NO_SIDE_EFFECTS    0x0004
> -/* Helper is QEMU_NORETURN.  */
> +/* Helper is G_NORETURN.  */
>  #define TCG_CALL_NO_RETURN          0x0008
>
>  /* convenience version of most used call flags */
> diff --git a/linux-user/user-internals.h b/linux-user/user-internals.h
> index 2a80bc83ae8f..ddc260e465dc 100644
> --- a/linux-user/user-internals.h
> +++ b/linux-user/user-internals.h
> @@ -64,7 +64,7 @@ abi_long do_syscall(void *cpu_env, int num, abi_long
> arg1,
>                      abi_long arg5, abi_long arg6, abi_long arg7,
>                      abi_long arg8);
>  extern __thread CPUState *thread_cpu;
> -void QEMU_NORETURN cpu_loop(CPUArchState *env);
> +G_NORETURN void cpu_loop(CPUArchState *env);
>  const char *target_strerror(int err);
>  int get_osversion(void);
>  void init_qemu_uname_release(void);
> diff --git a/scripts/cocci-macro-file.h b/scripts/cocci-macro-file.h
> index 3d1e9b50919a..d247a5086e91 100644
> --- a/scripts/cocci-macro-file.h
> +++ b/scripts/cocci-macro-file.h
> @@ -19,7 +19,7 @@
>   */
>
>  /* From qemu/compiler.h */
> -#define QEMU_NORETURN __attribute__ ((__noreturn__))
> +#define G_NORETURN __attribute__ ((__noreturn__))
>  #define G_GNUC_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
>  #define G_GNUC_NULL_TERMINATED __attribute__((sentinel))
>
> diff --git a/target/alpha/cpu.h b/target/alpha/cpu.h
> index 994a018b910d..d0abc949a8d0 100644
> --- a/target/alpha/cpu.h
> +++ b/target/alpha/cpu.h
> @@ -434,8 +434,8 @@ void alpha_translate_init(void);
>  #define CPU_RESOLVING_TYPE TYPE_ALPHA_CPU
>
>  void alpha_cpu_list(void);
> -void QEMU_NORETURN dynamic_excp(CPUAlphaState *, uintptr_t, int, int);
> -void QEMU_NORETURN arith_excp(CPUAlphaState *, uintptr_t, int, uint64_t)=
;
> +G_NORETURN void dynamic_excp(CPUAlphaState *, uintptr_t, int, int);
> +G_NORETURN void arith_excp(CPUAlphaState *, uintptr_t, int, uint64_t);
>
>  uint64_t cpu_alpha_load_fpcr (CPUAlphaState *env);
>  void cpu_alpha_store_fpcr (CPUAlphaState *env, uint64_t val);
> @@ -452,9 +452,9 @@ void alpha_cpu_record_sigbus(CPUState *cs, vaddr
> address,
>  bool alpha_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>                          MMUAccessType access_type, int mmu_idx,
>                          bool probe, uintptr_t retaddr);
> -void alpha_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
> -                                   MMUAccessType access_type, int mmu_id=
x,
> -                                   uintptr_t retaddr) QEMU_NORETURN;
> +G_NORETURN void alpha_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
> +                                              MMUAccessType access_type,
> int mmu_idx,
> +                                              uintptr_t retaddr);
>  void alpha_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
>                                       vaddr addr, unsigned size,
>                                       MMUAccessType access_type,
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index 7f696cd36a8c..9556e3b29e49 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -102,13 +102,13 @@ FIELD(V7M_EXCRET, RES1, 7, 25) /* including the
> must-be-1 prefix */
>   * and target exception level. This should be called from helper
> functions,
>   * and never returns because we will longjump back up to the CPU main
> loop.
>   */
> -void QEMU_NORETURN raise_exception(CPUARMState *env, uint32_t excp,
> -                                   uint32_t syndrome, uint32_t target_el=
);
> +G_NORETURN void raise_exception(CPUARMState *env, uint32_t excp,
> +                                uint32_t syndrome, uint32_t target_el);
>
>  /*
>   * Similarly, but also use unwinding to restore cpu state.
>   */
> -void QEMU_NORETURN raise_exception_ra(CPUARMState *env, uint32_t excp,
> +G_NORETURN void raise_exception_ra(CPUARMState *env, uint32_t excp,
>                                        uint32_t syndrome, uint32_t
> target_el,
>                                        uintptr_t ra);
>
> @@ -606,9 +606,9 @@ ARMMMUIdx arm_v7m_mmu_idx_for_secstate(CPUARMState
> *env, bool secstate);
>  bool arm_s1_regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_idx=
);
>
>  /* Raise a data fault alignment exception for the specified virtual
> address */
> -void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
> -                                 MMUAccessType access_type,
> -                                 int mmu_idx, uintptr_t retaddr)
> QEMU_NORETURN;
> +G_NORETURN void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
> +                                            MMUAccessType access_type,
> +                                            int mmu_idx, uintptr_t
> retaddr);
>
>  /* arm_cpu_do_transaction_failed: handle a memory system error response
>   * (eg "no device/memory present at address") by raising an external abo=
rt
> diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h
> index c43b93a68f14..6f3b6beecf40 100644
> --- a/target/hppa/cpu.h
> +++ b/target/hppa/cpu.h
> @@ -339,6 +339,6 @@ extern const VMStateDescription vmstate_hppa_cpu;
>  void hppa_cpu_alarm_timer(void *);
>  int hppa_artype_for_page(CPUHPPAState *env, target_ulong vaddr);
>  #endif
> -void QEMU_NORETURN hppa_dynamic_excp(CPUHPPAState *env, int excp,
> uintptr_t ra);
> +G_NORETURN void hppa_dynamic_excp(CPUHPPAState *env, int excp, uintptr_t
> ra);
>
>  #endif /* HPPA_CPU_H */
> diff --git a/target/i386/tcg/helper-tcg.h b/target/i386/tcg/helper-tcg.h
> index 0a4401e917f9..34167e2e29ca 100644
> --- a/target/i386/tcg/helper-tcg.h
> +++ b/target/i386/tcg/helper-tcg.h
> @@ -69,27 +69,27 @@ static inline target_long lshift(target_long x, int n=
)
>  void tcg_x86_init(void);
>
>  /* excp_helper.c */
> -void QEMU_NORETURN raise_exception(CPUX86State *env, int exception_index=
);
> -void QEMU_NORETURN raise_exception_ra(CPUX86State *env, int
> exception_index,
> -                                      uintptr_t retaddr);
> -void QEMU_NORETURN raise_exception_err(CPUX86State *env, int
> exception_index,
> -                                       int error_code);
> -void QEMU_NORETURN raise_exception_err_ra(CPUX86State *env, int
> exception_index,
> -                                          int error_code, uintptr_t
> retaddr);
> -void QEMU_NORETURN raise_interrupt(CPUX86State *nenv, int intno, int
> is_int,
> -                                   int error_code, int next_eip_addend);
> +G_NORETURN void raise_exception(CPUX86State *env, int exception_index);
> +G_NORETURN void raise_exception_ra(CPUX86State *env, int exception_index=
,
> +                                   uintptr_t retaddr);
> +G_NORETURN void raise_exception_err(CPUX86State *env, int exception_inde=
x,
> +                                    int error_code);
> +G_NORETURN void raise_exception_err_ra(CPUX86State *env, int
> exception_index,
> +                                       int error_code, uintptr_t retaddr=
);
> +G_NORETURN void raise_interrupt(CPUX86State *nenv, int intno, int is_int=
,
> +                                int error_code, int next_eip_addend);
>
>  /* cc_helper.c */
>  extern const uint8_t parity_table[256];
>
>  /* misc_helper.c */
>  void cpu_load_eflags(CPUX86State *env, int eflags, int update_mask);
> -void do_pause(CPUX86State *env) QEMU_NORETURN;
> +G_NORETURN void do_pause(CPUX86State *env);
>
>  /* sysemu/svm_helper.c */
>  #ifndef CONFIG_USER_ONLY
> -void QEMU_NORETURN cpu_vmexit(CPUX86State *nenv, uint32_t exit_code,
> -                              uint64_t exit_info_1, uintptr_t retaddr);
> +G_NORETURN void cpu_vmexit(CPUX86State *nenv, uint32_t exit_code,
> +                           uint64_t exit_info_1, uintptr_t retaddr);
>  void do_vmexit(CPUX86State *env);
>  #endif
>
> diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
> index 67aa88b8db5b..1e84dd8f47bb 100644
> --- a/target/microblaze/cpu.h
> +++ b/target/microblaze/cpu.h
> @@ -359,9 +359,9 @@ struct ArchCPU {
>  void mb_cpu_do_interrupt(CPUState *cs);
>  bool mb_cpu_exec_interrupt(CPUState *cs, int int_req);
>  #endif /* !CONFIG_USER_ONLY */
> -void mb_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
> -                                MMUAccessType access_type,
> -                                int mmu_idx, uintptr_t retaddr)
> QEMU_NORETURN;
> +G_NORETURN void mb_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
> +                                           MMUAccessType access_type,
> +                                           int mmu_idx, uintptr_t
> retaddr);
>  void mb_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
>  hwaddr mb_cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
>                                          MemTxAttrs *attrs);
> diff --git a/target/mips/tcg/tcg-internal.h
> b/target/mips/tcg/tcg-internal.h
> index 466768aec487..993720b00c3f 100644
> --- a/target/mips/tcg/tcg-internal.h
> +++ b/target/mips/tcg/tcg-internal.h
> @@ -18,18 +18,19 @@
>  void mips_tcg_init(void);
>
>  void mips_cpu_synchronize_from_tb(CPUState *cs, const TranslationBlock
> *tb);
> -void mips_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
> -                                  MMUAccessType access_type, int mmu_idx=
,
> -                                  uintptr_t retaddr) QEMU_NORETURN;
> +G_NORETURN void mips_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
> +                                             MMUAccessType access_type,
> int mmu_idx,
> +                                             uintptr_t retaddr);
>
>  const char *mips_exception_name(int32_t exception);
>
> -void QEMU_NORETURN do_raise_exception_err(CPUMIPSState *env, uint32_t
> exception,
> -                                          int error_code, uintptr_t pc);
> +G_NORETURN void do_raise_exception_err(CPUMIPSState *env, uint32_t
> exception,
> +                                       int error_code, uintptr_t pc);
>
> -static inline void QEMU_NORETURN do_raise_exception(CPUMIPSState *env,
> -                                                    uint32_t exception,
> -                                                    uintptr_t pc)
> +static inline G_NORETURN
> +void do_raise_exception(CPUMIPSState *env,
> +                        uint32_t exception,
> +                        uintptr_t pc)
>  {
>      do_raise_exception_err(env, exception, 0, pc);
>  }
> diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
> index ca0f3420cd1b..1bab805bb0b6 100644
> --- a/target/nios2/cpu.h
> +++ b/target/nios2/cpu.h
> @@ -194,9 +194,9 @@ void nios2_cpu_do_interrupt(CPUState *cs);
>  void dump_mmu(CPUNios2State *env);
>  void nios2_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
>  hwaddr nios2_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
> -void nios2_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
> -                                   MMUAccessType access_type, int mmu_id=
x,
> -                                   uintptr_t retaddr) QEMU_NORETURN;
> +G_NORETURN void nios2_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
> +                                              MMUAccessType access_type,
> int mmu_idx,
> +                                              uintptr_t retaddr);
>
>  void do_nios2_semihosting(CPUNios2State *env);
>
> diff --git a/target/openrisc/exception.h b/target/openrisc/exception.h
> index 333bf846388d..f62fc314c1f4 100644
> --- a/target/openrisc/exception.h
> +++ b/target/openrisc/exception.h
> @@ -22,6 +22,6 @@
>
>  #include "cpu.h"
>
> -void QEMU_NORETURN raise_exception(OpenRISCCPU *cpu, uint32_t excp);
> +G_NORETURN void raise_exception(OpenRISCCPU *cpu, uint32_t excp);
>
>  #endif /* TARGET_OPENRISC_EXCEPTION_H */
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 473436a49eb5..c2b6c987c047 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -2492,13 +2492,13 @@ static inline void
> cpu_get_tb_cpu_state(CPUPPCState *env, target_ulong *pc,
>  }
>  #endif
>
> -void QEMU_NORETURN raise_exception(CPUPPCState *env, uint32_t exception)=
;
> -void QEMU_NORETURN raise_exception_ra(CPUPPCState *env, uint32_t
> exception,
> -                                      uintptr_t raddr);
> -void QEMU_NORETURN raise_exception_err(CPUPPCState *env, uint32_t
> exception,
> -                                       uint32_t error_code);
> -void QEMU_NORETURN raise_exception_err_ra(CPUPPCState *env, uint32_t
> exception,
> -                                          uint32_t error_code, uintptr_t
> raddr);
> +G_NORETURN void raise_exception(CPUPPCState *env, uint32_t exception);
> +G_NORETURN void raise_exception_ra(CPUPPCState *env, uint32_t exception,
> +                                   uintptr_t raddr);
> +G_NORETURN void raise_exception_err(CPUPPCState *env, uint32_t exception=
,
> +                                    uint32_t error_code);
> +G_NORETURN void raise_exception_err_ra(CPUPPCState *env, uint32_t
> exception,
> +                                       uint32_t error_code, uintptr_t
> raddr);
>
>  /* PERFM EBB helper*/
>  #if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
> diff --git a/target/ppc/internal.h b/target/ppc/internal.h
> index 6aa9484f34a5..8094e0b03371 100644
> --- a/target/ppc/internal.h
> +++ b/target/ppc/internal.h
> @@ -286,9 +286,9 @@ void ppc_cpu_record_sigsegv(CPUState *cs, vaddr addr,
>  bool ppc_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>                        MMUAccessType access_type, int mmu_idx,
>                        bool probe, uintptr_t retaddr);
> -void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
> -                                 MMUAccessType access_type, int mmu_idx,
> -                                 uintptr_t retaddr) QEMU_NORETURN;
> +G_NORETURN void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
> +                                            MMUAccessType access_type,
> int mmu_idx,
> +                                            uintptr_t retaddr);
>  #endif
>
>  #endif /* PPC_INTERNAL_H */
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index e1d976bdef06..72f1c9451e93 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -451,9 +451,9 @@ void riscv_cpu_set_virt_enabled(CPURISCVState *env,
> bool enable);
>  bool riscv_cpu_two_stage_lookup(int mmu_idx);
>  int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch);
>  hwaddr riscv_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
> -void  riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
> -                                    MMUAccessType access_type, int
> mmu_idx,
> -                                    uintptr_t retaddr) QEMU_NORETURN;
> +G_NORETURN void  riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
> +                                               MMUAccessType access_type=
,
> int mmu_idx,
> +                                               uintptr_t retaddr);
>  bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>                          MMUAccessType access_type, int mmu_idx,
>                          bool probe, uintptr_t retaddr);
> @@ -487,8 +487,8 @@ void riscv_cpu_set_aia_ireg_rmw_fn(CPURISCVState *env=
,
> uint32_t priv,
>  void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv);
>
>  void riscv_translate_init(void);
> -void QEMU_NORETURN riscv_raise_exception(CPURISCVState *env,
> -                                         uint32_t exception, uintptr_t
> pc);
> +G_NORETURN void riscv_raise_exception(CPURISCVState *env,
> +                                      uint32_t exception, uintptr_t pc);
>
>  target_ulong riscv_cpu_get_fflags(CPURISCVState *env);
>  void riscv_cpu_set_fflags(CPURISCVState *env, target_ulong);
> diff --git a/target/s390x/s390x-internal.h b/target/s390x/s390x-internal.=
h
> index 6fc8cad2d586..6aba7fd0ca8a 100644
> --- a/target/s390x/s390x-internal.h
> +++ b/target/s390x/s390x-internal.h
> @@ -280,9 +280,9 @@ void s390_cpu_record_sigbus(CPUState *cs, vaddr
> address,
>  bool s390_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
>                         MMUAccessType access_type, int mmu_idx,
>                         bool probe, uintptr_t retaddr);
> -void s390x_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
> -                                   MMUAccessType access_type, int mmu_id=
x,
> -                                   uintptr_t retaddr) QEMU_NORETURN;
> +G_NORETURN void s390x_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
> +                                              MMUAccessType access_type,
> int mmu_idx,
> +                                              uintptr_t retaddr);
>  #endif
>
>
> diff --git a/target/s390x/tcg/tcg_s390x.h b/target/s390x/tcg/tcg_s390x.h
> index 2f54ccb02745..78558912f99f 100644
> --- a/target/s390x/tcg/tcg_s390x.h
> +++ b/target/s390x/tcg/tcg_s390x.h
> @@ -14,11 +14,11 @@
>  #define TCG_S390X_H
>
>  void tcg_s390_tod_updated(CPUState *cs, run_on_cpu_data opaque);
> -void QEMU_NORETURN tcg_s390_program_interrupt(CPUS390XState *env,
> -                                              uint32_t code, uintptr_t
> ra);
> -void QEMU_NORETURN tcg_s390_data_exception(CPUS390XState *env, uint32_t
> dxc,
> -                                           uintptr_t ra);
> -void QEMU_NORETURN tcg_s390_vector_exception(CPUS390XState *env, uint32_=
t
> vxc,
> -                                             uintptr_t ra);
> +G_NORETURN void tcg_s390_program_interrupt(CPUS390XState *env,
> +                                           uint32_t code, uintptr_t ra);
> +G_NORETURN void tcg_s390_data_exception(CPUS390XState *env, uint32_t dxc=
,
> +                                        uintptr_t ra);
> +G_NORETURN void tcg_s390_vector_exception(CPUS390XState *env, uint32_t
> vxc,
> +                                          uintptr_t ra);
>
>  #endif /* TCG_S390X_H */
> diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
> index 14d490ac4705..9f15ef913caa 100644
> --- a/target/sh4/cpu.h
> +++ b/target/sh4/cpu.h
> @@ -210,9 +210,9 @@ void superh_cpu_dump_state(CPUState *cpu, FILE *f, in=
t
> flags);
>  hwaddr superh_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
>  int superh_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg=
);
>  int superh_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
> -void superh_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
> -                                    MMUAccessType access_type, int
> mmu_idx,
> -                                    uintptr_t retaddr) QEMU_NORETURN;
> +G_NORETURN void superh_cpu_do_unaligned_access(CPUState *cpu, vaddr addr=
,
> +                                               MMUAccessType access_type=
,
> int mmu_idx,
> +                                               uintptr_t retaddr);
>
>  void sh4_translate_init(void);
>  void sh4_cpu_list(void);
> diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h
> index dd9e2f5cdb6a..f80ea2e8cf2a 100644
> --- a/target/sparc/cpu.h
> +++ b/target/sparc/cpu.h
> @@ -575,11 +575,11 @@ void sparc_cpu_do_interrupt(CPUState *cpu);
>  hwaddr sparc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
>  int sparc_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg)=
;
>  int sparc_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
> -void QEMU_NORETURN sparc_cpu_do_unaligned_access(CPUState *cpu, vaddr
> addr,
> -                                                 MMUAccessType
> access_type,
> -                                                 int mmu_idx,
> -                                                 uintptr_t retaddr);
> -void cpu_raise_exception_ra(CPUSPARCState *, int, uintptr_t)
> QEMU_NORETURN;
> +G_NORETURN void sparc_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
> +                                              MMUAccessType access_type,
> +                                              int mmu_idx,
> +                                              uintptr_t retaddr);
> +G_NORETURN void cpu_raise_exception_ra(CPUSPARCState *, int, uintptr_t);
>
>  #ifndef NO_CPU_IO_DEFS
>  /* cpu_init.c */
> diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
> index 71142ea8f453..d4b8268146cb 100644
> --- a/target/xtensa/cpu.h
> +++ b/target/xtensa/cpu.h
> @@ -581,9 +581,9 @@ void xtensa_count_regs(const XtensaConfig *config,
>                         unsigned *n_regs, unsigned *n_core_regs);
>  int xtensa_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg=
);
>  int xtensa_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
> -void xtensa_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
> -                                    MMUAccessType access_type, int
> mmu_idx,
> -                                    uintptr_t retaddr) QEMU_NORETURN;
> +G_NORETURN void xtensa_cpu_do_unaligned_access(CPUState *cpu, vaddr addr=
,
> +                                               MMUAccessType access_type=
,
> int mmu_idx,
> +                                               uintptr_t retaddr);
>
>  #define cpu_list xtensa_cpu_list
>
> diff --git a/accel/stubs/tcg-stub.c b/accel/stubs/tcg-stub.c
> index d8162673ae8d..ea4a0dd2fbcc 100644
> --- a/accel/stubs/tcg-stub.c
> +++ b/accel/stubs/tcg-stub.c
> @@ -28,12 +28,12 @@ void *probe_access(CPUArchState *env, target_ulong
> addr, int size,
>       g_assert_not_reached();
>  }
>
> -void QEMU_NORETURN cpu_loop_exit(CPUState *cpu)
> +G_NORETURN void cpu_loop_exit(CPUState *cpu)
>  {
>      g_assert_not_reached();
>  }
>
> -void QEMU_NORETURN cpu_loop_exit_restore(CPUState *cpu, uintptr_t pc)
> +G_NORETURN void cpu_loop_exit_restore(CPUState *cpu, uintptr_t pc)
>  {
>      g_assert_not_reached();
>  }
> diff --git a/bsd-user/signal.c b/bsd-user/signal.c
> index 8a36b696d82b..58a53863957a 100644
> --- a/bsd-user/signal.c
> +++ b/bsd-user/signal.c
> @@ -347,7 +347,8 @@ static int core_dump_signal(int sig)
>  }
>
>  /* Abort execution with signal. */
> -static void QEMU_NORETURN dump_core_and_abort(int target_sig)
> +static G_NORETURN
> +void dump_core_and_abort(int target_sig)
>  {
>      CPUArchState *env =3D thread_cpu->env_ptr;
>      CPUState *cpu =3D env_cpu(env);
> diff --git a/hw/misc/mips_itu.c b/hw/misc/mips_itu.c
> index 80683fed318b..badef5c214af 100644
> --- a/hw/misc/mips_itu.c
> +++ b/hw/misc/mips_itu.c
> @@ -189,7 +189,8 @@ static void wake_blocked_threads(ITCStorageCell *c)
>      c->blocked_threads =3D 0;
>  }
>
> -static void QEMU_NORETURN block_thread_and_exit(ITCStorageCell *c)
> +static G_NORETURN
> +void block_thread_and_exit(ITCStorageCell *c)
>  {
>      c->blocked_threads |=3D 1ULL << current_cpu->cpu_index;
>      current_cpu->halted =3D 1;
> diff --git a/linux-user/signal.c b/linux-user/signal.c
> index 092e70b80c6f..8d29bfaa6b5c 100644
> --- a/linux-user/signal.c
> +++ b/linux-user/signal.c
> @@ -725,7 +725,8 @@ void cpu_loop_exit_sigbus(CPUState *cpu, target_ulong
> addr,
>  }
>
>  /* abort execution with signal */
> -static void QEMU_NORETURN dump_core_and_abort(int target_sig)
> +static G_NORETURN
> +void dump_core_and_abort(int target_sig)
>  {
>      CPUState *cpu =3D thread_cpu;
>      CPUArchState *env =3D cpu->env_ptr;
> diff --git a/monitor/hmp.c b/monitor/hmp.c
> index 24fd2e5f34bf..15ca04735cd3 100644
> --- a/monitor/hmp.c
> +++ b/monitor/hmp.c
> @@ -308,8 +308,8 @@ void help_cmd(Monitor *mon, const char *name)
>  static const char *pch;
>  static sigjmp_buf expr_env;
>
> -static void G_GNUC_PRINTF(2, 3) QEMU_NORETURN
> -expr_error(Monitor *mon, const char *fmt, ...)
> +static G_NORETURN G_GNUC_PRINTF(2, 3)
> +void expr_error(Monitor *mon, const char *fmt, ...)
>  {
>      va_list ap;
>      va_start(ap, fmt);
> diff --git a/qemu-img.c b/qemu-img.c
> index a2b1d3653a1e..6077c947002d 100644
> --- a/qemu-img.c
> +++ b/qemu-img.c
> @@ -100,7 +100,8 @@ static void format_print(void *opaque, const char
> *name)
>      printf(" %s", name);
>  }
>
> -static void QEMU_NORETURN G_GNUC_PRINTF(1, 2) error_exit(const char *fmt=
,
> ...)
> +static G_NORETURN G_GNUC_PRINTF(1, 2)
> +void error_exit(const char *fmt, ...)
>  {
>      va_list ap;
>
> @@ -112,18 +113,21 @@ static void QEMU_NORETURN G_GNUC_PRINTF(1, 2)
> error_exit(const char *fmt, ...)
>      exit(EXIT_FAILURE);
>  }
>
> -static void QEMU_NORETURN missing_argument(const char *option)
> +static G_NORETURN
> +void missing_argument(const char *option)
>  {
>      error_exit("missing argument for option '%s'", option);
>  }
>
> -static void QEMU_NORETURN unrecognized_option(const char *option)
> +static G_NORETURN
> +void unrecognized_option(const char *option)
>  {
>      error_exit("unrecognized option '%s'", option);
>  }
>
>  /* Please keep in synch with docs/tools/qemu-img.rst */
> -static void QEMU_NORETURN help(void)
> +static G_NORETURN
> +void help(void)
>  {
>      const char *help_msg =3D
>             QEMU_IMG_VERSION
> diff --git a/target/alpha/helper.c b/target/alpha/helper.c
> index dcaa2d03adb3..a5a389b5a321 100644
> --- a/target/alpha/helper.c
> +++ b/target/alpha/helper.c
> @@ -514,7 +514,7 @@ void alpha_cpu_dump_state(CPUState *cs, FILE *f, int
> flags)
>
>  /* This should only be called from translate, via gen_excp.
>     We expect that ENV->PC has already been updated.  */
> -void QEMU_NORETURN helper_excp(CPUAlphaState *env, int excp, int error)
> +G_NORETURN void helper_excp(CPUAlphaState *env, int excp, int error)
>  {
>      CPUState *cs =3D env_cpu(env);
>
> @@ -524,8 +524,8 @@ void QEMU_NORETURN helper_excp(CPUAlphaState *env, in=
t
> excp, int error)
>  }
>
>  /* This may be called from any of the helpers to set up EXCEPTION_INDEX.
> */
> -void QEMU_NORETURN dynamic_excp(CPUAlphaState *env, uintptr_t retaddr,
> -                                int excp, int error)
> +G_NORETURN void dynamic_excp(CPUAlphaState *env, uintptr_t retaddr,
> +                             int excp, int error)
>  {
>      CPUState *cs =3D env_cpu(env);
>
> @@ -539,8 +539,8 @@ void QEMU_NORETURN dynamic_excp(CPUAlphaState *env,
> uintptr_t retaddr,
>      cpu_loop_exit(cs);
>  }
>
> -void QEMU_NORETURN arith_excp(CPUAlphaState *env, uintptr_t retaddr,
> -                              int exc, uint64_t mask)
> +G_NORETURN void arith_excp(CPUAlphaState *env, uintptr_t retaddr,
> +                           int exc, uint64_t mask)
>  {
>      env->trap_arg0 =3D exc;
>      env->trap_arg1 =3D mask;
> diff --git a/target/arm/pauth_helper.c b/target/arm/pauth_helper.c
> index 739aa520dddd..d0483bf051ec 100644
> --- a/target/arm/pauth_helper.c
> +++ b/target/arm/pauth_helper.c
> @@ -382,8 +382,8 @@ static uint64_t pauth_strip(CPUARMState *env, uint64_=
t
> ptr, bool data)
>      return pauth_original_ptr(ptr, param);
>  }
>
> -static void QEMU_NORETURN pauth_trap(CPUARMState *env, int target_el,
> -                                     uintptr_t ra)
> +static G_NORETURN
> +void pauth_trap(CPUARMState *env, int target_el, uintptr_t ra)
>  {
>      raise_exception_ra(env, EXCP_UDEF, syn_pactrap(), target_el, ra);
>  }
> diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
> index b79004e0cca6..6421e16202e5 100644
> --- a/target/arm/tlb_helper.c
> +++ b/target/arm/tlb_helper.c
> @@ -79,9 +79,10 @@ static uint32_t compute_fsr_fsc(CPUARMState *env,
> ARMMMUFaultInfo *fi,
>      return fsr;
>  }
>
> -static void QEMU_NORETURN arm_deliver_fault(ARMCPU *cpu, vaddr addr,
> -                                            MMUAccessType access_type,
> -                                            int mmu_idx, ARMMMUFaultInfo
> *fi)
> +static G_NORETURN
> +void arm_deliver_fault(ARMCPU *cpu, vaddr addr,
> +                       MMUAccessType access_type,
> +                       int mmu_idx, ARMMMUFaultInfo *fi)
>  {
>      CPUARMState *env =3D &cpu->env;
>      int target_el;
> diff --git a/target/hexagon/op_helper.c b/target/hexagon/op_helper.c
> index 63e5ad5d68e2..a5ed819c0451 100644
> --- a/target/hexagon/op_helper.c
> +++ b/target/hexagon/op_helper.c
> @@ -34,9 +34,10 @@
>  #define SF_MANTBITS    23
>
>  /* Exceptions processing helpers */
> -static void QEMU_NORETURN do_raise_exception_err(CPUHexagonState *env,
> -                                                 uint32_t exception,
> -                                                 uintptr_t pc)
> +static G_NORETURN
> +void do_raise_exception_err(CPUHexagonState *env,
> +                            uint32_t exception,
> +                            uintptr_t pc)
>  {
>      CPUState *cs =3D env_cpu(env);
>      qemu_log_mask(CPU_LOG_INT, "%s: %d\n", __func__, exception);
> @@ -44,7 +45,7 @@ static void QEMU_NORETURN
> do_raise_exception_err(CPUHexagonState *env,
>      cpu_loop_exit_restore(cs, pc);
>  }
>
> -void QEMU_NORETURN HELPER(raise_exception)(CPUHexagonState *env, uint32_=
t
> excp)
> +G_NORETURN void HELPER(raise_exception)(CPUHexagonState *env, uint32_t
> excp)
>  {
>      do_raise_exception_err(env, excp, 0);
>  }
> diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
> index 5f46ba801eef..a6f52caf14a3 100644
> --- a/target/hppa/cpu.c
> +++ b/target/hppa/cpu.c
> @@ -73,10 +73,10 @@ static void hppa_cpu_disas_set_info(CPUState *cs,
> disassemble_info *info)
>  }
>
>  #ifndef CONFIG_USER_ONLY
> -static void QEMU_NORETURN
> -hppa_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
> -                             MMUAccessType access_type, int mmu_idx,
> -                             uintptr_t retaddr)
> +static G_NORETURN
> +void hppa_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
> +                                  MMUAccessType access_type, int mmu_idx=
,
> +                                  uintptr_t retaddr)
>  {
>      HPPACPU *cpu =3D HPPA_CPU(cs);
>      CPUHPPAState *env =3D &cpu->env;
> diff --git a/target/hppa/op_helper.c b/target/hppa/op_helper.c
> index 2810361be0b7..cd304f051e57 100644
> --- a/target/hppa/op_helper.c
> +++ b/target/hppa/op_helper.c
> @@ -28,7 +28,7 @@
>  #include "fpu/softfloat.h"
>  #include "trace.h"
>
> -void QEMU_NORETURN HELPER(excp)(CPUHPPAState *env, int excp)
> +G_NORETURN void HELPER(excp)(CPUHPPAState *env, int excp)
>  {
>      CPUState *cs =3D env_cpu(env);
>
> @@ -36,7 +36,7 @@ void QEMU_NORETURN HELPER(excp)(CPUHPPAState *env, int
> excp)
>      cpu_loop_exit(cs);
>  }
>
> -void QEMU_NORETURN hppa_dynamic_excp(CPUHPPAState *env, int excp,
> uintptr_t ra)
> +G_NORETURN void hppa_dynamic_excp(CPUHPPAState *env, int excp, uintptr_t
> ra)
>  {
>      CPUState *cs =3D env_cpu(env);
>
> diff --git a/target/i386/tcg/bpt_helper.c b/target/i386/tcg/bpt_helper.c
> index b6c1fff16e51..bc34ac27fea7 100644
> --- a/target/i386/tcg/bpt_helper.c
> +++ b/target/i386/tcg/bpt_helper.c
> @@ -22,7 +22,7 @@
>  #include "exec/helper-proto.h"
>  #include "helper-tcg.h"
>
> -void QEMU_NORETURN helper_single_step(CPUX86State *env)
> +G_NORETURN void helper_single_step(CPUX86State *env)
>  {
>  #ifndef CONFIG_USER_ONLY
>      check_hw_breakpoints(env, true);
> diff --git a/target/i386/tcg/excp_helper.c b/target/i386/tcg/excp_helper.=
c
> index bdae887d0abc..c1ffa1c0ef74 100644
> --- a/target/i386/tcg/excp_helper.c
> +++ b/target/i386/tcg/excp_helper.c
> @@ -25,13 +25,13 @@
>  #include "exec/helper-proto.h"
>  #include "helper-tcg.h"
>
> -void QEMU_NORETURN helper_raise_interrupt(CPUX86State *env, int intno,
> +G_NORETURN void helper_raise_interrupt(CPUX86State *env, int intno,
>                                            int next_eip_addend)
>  {
>      raise_interrupt(env, intno, 1, 0, next_eip_addend);
>  }
>
> -void QEMU_NORETURN helper_raise_exception(CPUX86State *env, int
> exception_index)
> +G_NORETURN void helper_raise_exception(CPUX86State *env, int
> exception_index)
>  {
>      raise_exception(env, exception_index);
>  }
> @@ -87,10 +87,11 @@ static int check_exception(CPUX86State *env, int
> intno, int *error_code,
>   * env->eip value AFTER the interrupt instruction. It is only relevant i=
f
>   * is_int is TRUE.
>   */
> -static void QEMU_NORETURN raise_interrupt2(CPUX86State *env, int intno,
> -                                           int is_int, int error_code,
> -                                           int next_eip_addend,
> -                                           uintptr_t retaddr)
> +static G_NORETURN
> +void raise_interrupt2(CPUX86State *env, int intno,
> +                      int is_int, int error_code,
> +                      int next_eip_addend,
> +                      uintptr_t retaddr)
>  {
>      CPUState *cs =3D env_cpu(env);
>
> @@ -111,31 +112,31 @@ static void QEMU_NORETURN
> raise_interrupt2(CPUX86State *env, int intno,
>
>  /* shortcuts to generate exceptions */
>
> -void QEMU_NORETURN raise_interrupt(CPUX86State *env, int intno, int
> is_int,
> -                                   int error_code, int next_eip_addend)
> +G_NORETURN void raise_interrupt(CPUX86State *env, int intno, int is_int,
> +                                int error_code, int next_eip_addend)
>  {
>      raise_interrupt2(env, intno, is_int, error_code, next_eip_addend, 0)=
;
>  }
>
> -void QEMU_NORETURN raise_exception_err(CPUX86State *env, int
> exception_index,
> -                                       int error_code)
> +G_NORETURN void raise_exception_err(CPUX86State *env, int exception_inde=
x,
> +                                    int error_code)
>  {
>      raise_interrupt2(env, exception_index, 0, error_code, 0, 0);
>  }
>
> -void QEMU_NORETURN raise_exception_err_ra(CPUX86State *env, int
> exception_index,
> -                                          int error_code, uintptr_t
> retaddr)
> +G_NORETURN void raise_exception_err_ra(CPUX86State *env, int
> exception_index,
> +                                       int error_code, uintptr_t retaddr=
)
>  {
>      raise_interrupt2(env, exception_index, 0, error_code, 0, retaddr);
>  }
>
> -void QEMU_NORETURN raise_exception(CPUX86State *env, int exception_index=
)
> +G_NORETURN void raise_exception(CPUX86State *env, int exception_index)
>  {
>      raise_interrupt2(env, exception_index, 0, 0, 0, 0);
>  }
>
> -void QEMU_NORETURN raise_exception_ra(CPUX86State *env, int
> exception_index,
> -                                      uintptr_t retaddr)
> +G_NORETURN void raise_exception_ra(CPUX86State *env, int exception_index=
,
> +                                   uintptr_t retaddr)
>  {
>      raise_interrupt2(env, exception_index, 0, 0, 0, retaddr);
>  }
> diff --git a/target/i386/tcg/misc_helper.c b/target/i386/tcg/misc_helper.=
c
> index 24a0eaa3d596..5f7a3061ca59 100644
> --- a/target/i386/tcg/misc_helper.c
> +++ b/target/i386/tcg/misc_helper.c
> @@ -81,7 +81,7 @@ void helper_rdtscp(CPUX86State *env)
>      env->regs[R_ECX] =3D (uint32_t)(env->tsc_aux);
>  }
>
> -void QEMU_NORETURN helper_rdpmc(CPUX86State *env)
> +G_NORETURN void helper_rdpmc(CPUX86State *env)
>  {
>      if (((env->cr[4] & CR4_PCE_MASK) =3D=3D 0 ) &&
>          ((env->hflags & HF_CPL_MASK) !=3D 0)) {
> @@ -94,7 +94,7 @@ void QEMU_NORETURN helper_rdpmc(CPUX86State *env)
>      raise_exception_err(env, EXCP06_ILLOP, 0);
>  }
>
> -void QEMU_NORETURN do_pause(CPUX86State *env)
> +G_NORETURN void do_pause(CPUX86State *env)
>  {
>      CPUState *cs =3D env_cpu(env);
>
> @@ -103,7 +103,7 @@ void QEMU_NORETURN do_pause(CPUX86State *env)
>      cpu_loop_exit(cs);
>  }
>
> -void QEMU_NORETURN helper_pause(CPUX86State *env, int next_eip_addend)
> +G_NORETURN void helper_pause(CPUX86State *env, int next_eip_addend)
>  {
>      cpu_svm_check_intercept_param(env, SVM_EXIT_PAUSE, 0, GETPC());
>      env->eip +=3D next_eip_addend;
> diff --git a/target/i386/tcg/sysemu/misc_helper.c
> b/target/i386/tcg/sysemu/misc_helper.c
> index 3715c1e2625b..1328aa656fa8 100644
> --- a/target/i386/tcg/sysemu/misc_helper.c
> +++ b/target/i386/tcg/sysemu/misc_helper.c
> @@ -471,7 +471,8 @@ void helper_flush_page(CPUX86State *env, target_ulong
> addr)
>      tlb_flush_page(env_cpu(env), addr);
>  }
>
> -static void QEMU_NORETURN do_hlt(CPUX86State *env)
> +static G_NORETURN
> +void do_hlt(CPUX86State *env)
>  {
>      CPUState *cs =3D env_cpu(env);
>
> @@ -481,7 +482,7 @@ static void QEMU_NORETURN do_hlt(CPUX86State *env)
>      cpu_loop_exit(cs);
>  }
>
> -void QEMU_NORETURN helper_hlt(CPUX86State *env, int next_eip_addend)
> +G_NORETURN void helper_hlt(CPUX86State *env, int next_eip_addend)
>  {
>      cpu_svm_check_intercept_param(env, SVM_EXIT_HLT, 0, GETPC());
>      env->eip +=3D next_eip_addend;
> @@ -498,7 +499,7 @@ void helper_monitor(CPUX86State *env, target_ulong pt=
r)
>      cpu_svm_check_intercept_param(env, SVM_EXIT_MONITOR, 0, GETPC());
>  }
>
> -void QEMU_NORETURN helper_mwait(CPUX86State *env, int next_eip_addend)
> +G_NORETURN void helper_mwait(CPUX86State *env, int next_eip_addend)
>  {
>      CPUState *cs =3D env_cpu(env);
>
> diff --git a/target/openrisc/exception.c b/target/openrisc/exception.c
> index 28c1fce5232a..8699c3dcea42 100644
> --- a/target/openrisc/exception.c
> +++ b/target/openrisc/exception.c
> @@ -22,7 +22,7 @@
>  #include "exec/exec-all.h"
>  #include "exception.h"
>
> -void QEMU_NORETURN raise_exception(OpenRISCCPU *cpu, uint32_t excp)
> +G_NORETURN void raise_exception(OpenRISCCPU *cpu, uint32_t excp)
>  {
>      CPUState *cs =3D CPU(cpu);
>
> diff --git a/target/openrisc/exception_helper.c
> b/target/openrisc/exception_helper.c
> index d02a1cf0aa14..1f5be4bed907 100644
> --- a/target/openrisc/exception_helper.c
> +++ b/target/openrisc/exception_helper.c
> @@ -30,7 +30,8 @@ void HELPER(exception)(CPUOpenRISCState *env, uint32_t
> excp)
>      raise_exception(cpu, excp);
>  }
>
> -static void QEMU_NORETURN do_range(CPUOpenRISCState *env, uintptr_t pc)
> +static G_NORETURN
> +void do_range(CPUOpenRISCState *env, uintptr_t pc)
>  {
>      CPUState *cs =3D env_cpu(env);
>
> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> index 1a75ba11e68f..df3573688325 100644
> --- a/target/riscv/op_helper.c
> +++ b/target/riscv/op_helper.c
> @@ -24,8 +24,8 @@
>  #include "exec/helper-proto.h"
>
>  /* Exceptions processing helpers */
> -void QEMU_NORETURN riscv_raise_exception(CPURISCVState *env,
> -                                          uint32_t exception, uintptr_t
> pc)
> +G_NORETURN void riscv_raise_exception(CPURISCVState *env,
> +                                      uint32_t exception, uintptr_t pc)
>  {
>      CPUState *cs =3D env_cpu(env);
>      cs->exception_index =3D exception;
> diff --git a/target/rx/op_helper.c b/target/rx/op_helper.c
> index 11f952d34099..76a746300e46 100644
> --- a/target/rx/op_helper.c
> +++ b/target/rx/op_helper.c
> @@ -24,8 +24,9 @@
>  #include "exec/cpu_ldst.h"
>  #include "fpu/softfloat.h"
>
> -static inline void QEMU_NORETURN raise_exception(CPURXState *env, int
> index,
> -                                                 uintptr_t retaddr);
> +static inline G_NORETURN
> +void raise_exception(CPURXState *env, int index,
> +                     uintptr_t retaddr);
>
>  static void _set_psw(CPURXState *env, uint32_t psw, uint32_t rte)
>  {
> @@ -418,8 +419,9 @@ uint32_t helper_divu(CPURXState *env, uint32_t num,
> uint32_t den)
>  }
>
>  /* exception */
> -static inline void QEMU_NORETURN raise_exception(CPURXState *env, int
> index,
> -                                                 uintptr_t retaddr)
> +static inline G_NORETURN
> +void raise_exception(CPURXState *env, int index,
> +                     uintptr_t retaddr)
>  {
>      CPUState *cs =3D env_cpu(env);
>
> @@ -427,22 +429,22 @@ static inline void QEMU_NORETURN
> raise_exception(CPURXState *env, int index,
>      cpu_loop_exit_restore(cs, retaddr);
>  }
>
> -void QEMU_NORETURN helper_raise_privilege_violation(CPURXState *env)
> +G_NORETURN void helper_raise_privilege_violation(CPURXState *env)
>  {
>      raise_exception(env, 20, GETPC());
>  }
>
> -void QEMU_NORETURN helper_raise_access_fault(CPURXState *env)
> +G_NORETURN void helper_raise_access_fault(CPURXState *env)
>  {
>      raise_exception(env, 21, GETPC());
>  }
>
> -void QEMU_NORETURN helper_raise_illegal_instruction(CPURXState *env)
> +G_NORETURN void helper_raise_illegal_instruction(CPURXState *env)
>  {
>      raise_exception(env, 23, GETPC());
>  }
>
> -void QEMU_NORETURN helper_wait(CPURXState *env)
> +G_NORETURN void helper_wait(CPURXState *env)
>  {
>      CPUState *cs =3D env_cpu(env);
>
> @@ -451,12 +453,12 @@ void QEMU_NORETURN helper_wait(CPURXState *env)
>      raise_exception(env, EXCP_HLT, 0);
>  }
>
> -void QEMU_NORETURN helper_rxint(CPURXState *env, uint32_t vec)
> +G_NORETURN void helper_rxint(CPURXState *env, uint32_t vec)
>  {
>      raise_exception(env, 0x100 + vec, 0);
>  }
>
> -void QEMU_NORETURN helper_rxbrk(CPURXState *env)
> +G_NORETURN void helper_rxbrk(CPURXState *env)
>  {
>      raise_exception(env, 0x100, 0);
>  }
> diff --git a/target/s390x/tcg/excp_helper.c
> b/target/s390x/tcg/excp_helper.c
> index be6c966cfa4c..29ccf70df147 100644
> --- a/target/s390x/tcg/excp_helper.c
> +++ b/target/s390x/tcg/excp_helper.c
> @@ -34,8 +34,8 @@
>  #include "hw/boards.h"
>  #endif
>
> -void QEMU_NORETURN tcg_s390_program_interrupt(CPUS390XState *env,
> -                                              uint32_t code, uintptr_t r=
a)
> +G_NORETURN void tcg_s390_program_interrupt(CPUS390XState *env,
> +                                           uint32_t code, uintptr_t ra)
>  {
>      CPUState *cs =3D env_cpu(env);
>
> @@ -46,8 +46,8 @@ void QEMU_NORETURN
> tcg_s390_program_interrupt(CPUS390XState *env,
>      cpu_loop_exit(cs);
>  }
>
> -void QEMU_NORETURN tcg_s390_data_exception(CPUS390XState *env, uint32_t
> dxc,
> -                                           uintptr_t ra)
> +G_NORETURN void tcg_s390_data_exception(CPUS390XState *env, uint32_t dxc=
,
> +                                        uintptr_t ra)
>  {
>      g_assert(dxc <=3D 0xff);
>  #if !defined(CONFIG_USER_ONLY)
> @@ -63,8 +63,8 @@ void QEMU_NORETURN tcg_s390_data_exception(CPUS390XStat=
e
> *env, uint32_t dxc,
>      tcg_s390_program_interrupt(env, PGM_DATA, ra);
>  }
>
> -void QEMU_NORETURN tcg_s390_vector_exception(CPUS390XState *env, uint32_=
t
> vxc,
> -                                             uintptr_t ra)
> +G_NORETURN void tcg_s390_vector_exception(CPUS390XState *env, uint32_t
> vxc,
> +                                          uintptr_t ra)
>  {
>      g_assert(vxc <=3D 0xff);
>  #if !defined(CONFIG_USER_ONLY)
> @@ -88,7 +88,8 @@ void HELPER(data_exception)(CPUS390XState *env, uint32_=
t
> dxc)
>   * this is only for the atomic operations, for which we want to raise a
>   * specification exception.
>   */
> -static void QEMU_NORETURN do_unaligned_access(CPUState *cs, uintptr_t
> retaddr)
> +static G_NORETURN
> +void do_unaligned_access(CPUState *cs, uintptr_t retaddr)
>  {
>      S390CPU *cpu =3D S390_CPU(cs);
>      CPUS390XState *env =3D &cpu->env;
> @@ -620,9 +621,10 @@ void s390x_cpu_do_unaligned_access(CPUState *cs,
> vaddr addr,
>      do_unaligned_access(cs, retaddr);
>  }
>
> -static void QEMU_NORETURN monitor_event(CPUS390XState *env,
> -                                        uint64_t monitor_code,
> -                                        uint8_t monitor_class, uintptr_t
> ra)
> +static G_NORETURN
> +void monitor_event(CPUS390XState *env,
> +                   uint64_t monitor_code,
> +                   uint8_t monitor_class, uintptr_t ra)
>  {
>      /* Store the Monitor Code and the Monitor Class Number into the
> lowcore */
>      stq_phys(env_cpu(env)->as,
> diff --git a/target/sh4/op_helper.c b/target/sh4/op_helper.c
> index 752669825f02..a663335c39ae 100644
> --- a/target/sh4/op_helper.c
> +++ b/target/sh4/op_helper.c
> @@ -57,8 +57,9 @@ void helper_ldtlb(CPUSH4State *env)
>  #endif
>  }
>
> -static inline void QEMU_NORETURN raise_exception(CPUSH4State *env, int
> index,
> -                                                 uintptr_t retaddr)
> +static inline G_NORETURN
> +void raise_exception(CPUSH4State *env, int index,
> +                     uintptr_t retaddr)
>  {
>      CPUState *cs =3D env_cpu(env);
>
> diff --git a/target/sparc/mmu_helper.c b/target/sparc/mmu_helper.c
> index 346a6dfa3537..919448a49401 100644
> --- a/target/sparc/mmu_helper.c
> +++ b/target/sparc/mmu_helper.c
> @@ -925,10 +925,10 @@ hwaddr sparc_cpu_get_phys_page_debug(CPUState *cs,
> vaddr addr)
>  }
>
>  #ifndef CONFIG_USER_ONLY
> -void QEMU_NORETURN sparc_cpu_do_unaligned_access(CPUState *cs, vaddr add=
r,
> -                                                 MMUAccessType
> access_type,
> -                                                 int mmu_idx,
> -                                                 uintptr_t retaddr)
> +G_NORETURN void sparc_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
> +                                              MMUAccessType access_type,
> +                                              int mmu_idx,
> +                                              uintptr_t retaddr)
>  {
>      SPARCCPU *cpu =3D SPARC_CPU(cs);
>      CPUSPARCState *env =3D &cpu->env;
> diff --git a/target/tricore/op_helper.c b/target/tricore/op_helper.c
> index 9476d10d0065..a79c838a92cc 100644
> --- a/target/tricore/op_helper.c
> +++ b/target/tricore/op_helper.c
> @@ -25,9 +25,9 @@
>
>  /* Exception helpers */
>
> -static void QEMU_NORETURN
> -raise_exception_sync_internal(CPUTriCoreState *env, uint32_t class, int
> tin,
> -                              uintptr_t pc, uint32_t fcd_pc)
> +static G_NORETURN
> +void raise_exception_sync_internal(CPUTriCoreState *env, uint32_t class,
> int tin,
> +                                   uintptr_t pc, uint32_t fcd_pc)
>  {
>      CPUState *cs =3D env_cpu(env);
>      /* in case we come from a helper-call we need to restore the PC */
> diff --git a/tcg/tcg.c b/tcg/tcg.c
> index f8542529d030..6196c2ee4124 100644
> --- a/tcg/tcg.c
> +++ b/tcg/tcg.c
> @@ -320,7 +320,8 @@ static void set_jmp_reset_offset(TCGContext *s, int
> which)
>  }
>
>  /* Signal overflow, starting over with fewer guest insns. */
> -static void QEMU_NORETURN tcg_raise_tb_overflow(TCGContext *s)
> +static G_NORETURN
> +void tcg_raise_tb_overflow(TCGContext *s)
>  {
>      siglongjmp(s->jmp_trans, -2);
>  }
> diff --git a/tests/fp/fp-bench.c b/tests/fp/fp-bench.c
> index c24baf85350a..8ce0ca1545d1 100644
> --- a/tests/fp/fp-bench.c
> +++ b/tests/fp/fp-bench.c
> @@ -545,7 +545,8 @@ static int round_name_to_mode(const char *name)
>      return -1;
>  }
>
> -static void QEMU_NORETURN die_host_rounding(enum rounding rounding)
> +static G_NORETURN
> +void die_host_rounding(enum rounding rounding)
>  {
>      fprintf(stderr, "fatal: '%s' rounding not supported on this host\n",
>              round_names[rounding]);
> diff --git a/tests/fp/fp-test.c b/tests/fp/fp-test.c
> index 352dd71c44fa..35829ad5f71e 100644
> --- a/tests/fp/fp-test.c
> +++ b/tests/fp/fp-test.c
> @@ -921,7 +921,8 @@ static void parse_args(int argc, char *argv[])
>      }
>  }
>
> -static void QEMU_NORETURN run_test(void)
> +static G_NORETURN
> +void run_test(void)
>  {
>      unsigned int i;
>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 910a6c74dff9..4763d02ae78f 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -223,7 +223,7 @@ our $Sparse =3D qr{
>  our $Attribute =3D qr{
>                         const|
>                         volatile|
> -                       QEMU_NORETURN|
> +                       G_NORETURN|
>                         G_GNUC_WARN_UNUSED_RESULT|
>                         G_GNUC_NULL_TERMINATED|
>                         QEMU_PACKED|
> --
> 2.35.1.693.g805e0a68082a
>
>

--00000000000068d6b905dd16c234
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 20, 2022 at 7:28 AM &lt;<=
a href=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Fr=
om: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.co=
m" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
<br>
G_NORETURN was introduced in glib 2.68, fallback to G_GNUC_NORETURN in<br>
glib-compat.<br>
<br>
Note that this attribute must be placed before the function declaration<br>
(bringing a bit of consistency in qemu codebase usage).<br>
<br>
Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lurea=
u@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br></bl=
ockquote><div><br></div><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto=
:imp@bsdimp.com">imp@bsdimp.com</a>&gt;</div><div><br></div><div>Most of th=
is looks mechanical, but I only looked closely at the bsd-user changes.</di=
v><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
---<br>
=C2=A0accel/tcg/internal.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 3 +--<br>
=C2=A0include/exec/exec-all.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 20 +++++++++---------<br>
=C2=A0include/exec/helper-head.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 2 +-<br>
=C2=A0include/glib-compat.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 4 ++++<br>
=C2=A0include/hw/core/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0include/hw/core/tcg-cpu-ops.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 ++=
+---<br>
=C2=A0include/hw/hw.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0include/qemu/compiler.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 2 --<br>
=C2=A0include/qemu/osdep.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 3 ++-<br>
=C2=A0include/qemu/thread.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0include/tcg/tcg-ldst.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 4 ++--<br>
=C2=A0include/tcg/tcg.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0linux-user/user-internals.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 2 +-<br>
=C2=A0scripts/cocci-macro-file.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 2 +-<br>
=C2=A0target/alpha/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 10 ++++-----<br>
=C2=A0target/arm/internals.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 12 +++++------<br>
=C2=A0target/hppa/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0target/i386/tcg/helper-tcg.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 24 ++=
++++++++-----------<br>
=C2=A0target/microblaze/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 6 +++---<br>
=C2=A0target/mips/tcg/tcg-internal.h=C2=A0 =C2=A0 =C2=A0 =C2=A0| 17 +++++++=
+-------<br>
=C2=A0target/nios2/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 6 +++---<br>
=C2=A0target/openrisc/exception.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 2 +-<br>
=C2=A0target/ppc/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 14 ++++++-------<br>
=C2=A0target/ppc/internal.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 6 +++---<br>
=C2=A0target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 10 ++++-----<br>
=C2=A0target/s390x/s390x-internal.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 ++=
+---<br>
=C2=A0target/s390x/tcg/tcg_s390x.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 12 ++=
+++------<br>
=C2=A0target/sh4/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 +++---<br>
=C2=A0target/sparc/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 10 ++++-----<br>
=C2=A0target/xtensa/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 6 +++---<br>
=C2=A0accel/stubs/tcg-stub.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 4 ++--<br>
=C2=A0bsd-user/signal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 3 ++-<br>
=C2=A0hw/misc/mips_itu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 3 ++-<br>
=C2=A0linux-user/signal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 3 ++-<br>
=C2=A0monitor/hmp.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ++--<br>
=C2=A0qemu-img.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 12 +++++++----<br>
=C2=A0target/alpha/helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 | 10 ++++-----<br>
=C2=A0target/arm/pauth_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 4 ++--<br>
=C2=A0target/arm/tlb_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 7 ++++---<br>
=C2=A0target/hexagon/op_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 9 ++++----<br>
=C2=A0target/hppa/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 8 +++----<br>
=C2=A0target/hppa/op_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 4 ++--<br>
=C2=A0target/i386/tcg/bpt_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0=
 2 +-<br>
=C2=A0target/i386/tcg/excp_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 31 +++++++=
+++++++--------------<br>
=C2=A0target/i386/tcg/misc_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 ++=
+---<br>
=C2=A0target/i386/tcg/sysemu/misc_helper.c |=C2=A0 7 ++++---<br>
=C2=A0target/openrisc/exception.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 2 +-<br>
=C2=A0target/openrisc/exception_helper.c=C2=A0 =C2=A0|=C2=A0 3 ++-<br>
=C2=A0target/riscv/op_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 4 ++--<br>
=C2=A0target/rx/op_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 | 22 +++++++++++---------<br>
=C2=A0target/s390x/tcg/excp_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 22 +++++++=
++++---------<br>
=C2=A0target/sh4/op_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 5 +++--<br>
=C2=A0target/sparc/mmu_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 8 +++----<br>
=C2=A0target/tricore/op_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 6 +++---<br>
=C2=A0tcg/tcg.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 ++-<br>
=C2=A0tests/fp/fp-bench.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 3 ++-<br>
=C2=A0tests/fp/fp-test.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 3 ++-<br>
=C2=A0scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" target=3D=
"_blank">checkpatch.pl</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 2 +-<br>
=C2=A058 files changed, 214 insertions(+), 191 deletions(-)<br>
<br>
diff --git a/accel/tcg/internal.h b/accel/tcg/internal.h<br>
index 881bc1ede0b1..3092bfa96430 100644<br>
--- a/accel/tcg/internal.h<br>
+++ b/accel/tcg/internal.h<br>
@@ -14,8 +14,7 @@<br>
=C2=A0TranslationBlock *tb_gen_code(CPUState *cpu, target_ulong pc,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_ulong cs_base, uint32_t flags,=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int cflags);<br>
-<br>
-void QEMU_NORETURN cpu_io_recompile(CPUState *cpu, uintptr_t retaddr);<br>
+G_NORETURN void cpu_io_recompile(CPUState *cpu, uintptr_t retaddr);<br>
=C2=A0void page_init(void);<br>
=C2=A0void tb_htable_init(void);<br>
<br>
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h<br>
index d2cb0981f405..311e5fb422a3 100644<br>
--- a/include/exec/exec-all.h<br>
+++ b/include/exec/exec-all.h<br>
@@ -58,10 +58,10 @@ void restore_state_to_opc(CPUArchState *env, Translatio=
nBlock *tb,<br>
=C2=A0 */<br>
=C2=A0bool cpu_restore_state(CPUState *cpu, uintptr_t searched_pc, bool wil=
l_exit);<br>
<br>
-void QEMU_NORETURN cpu_loop_exit_noexc(CPUState *cpu);<br>
-void QEMU_NORETURN cpu_loop_exit(CPUState *cpu);<br>
-void QEMU_NORETURN cpu_loop_exit_restore(CPUState *cpu, uintptr_t pc);<br>
-void QEMU_NORETURN cpu_loop_exit_atomic(CPUState *cpu, uintptr_t pc);<br>
+G_NORETURN void cpu_loop_exit_noexc(CPUState *cpu);<br>
+G_NORETURN void cpu_loop_exit(CPUState *cpu);<br>
+G_NORETURN void cpu_loop_exit_restore(CPUState *cpu, uintptr_t pc);<br>
+G_NORETURN void cpu_loop_exit_atomic(CPUState *cpu, uintptr_t pc);<br>
<br>
=C2=A0/**<br>
=C2=A0 * cpu_loop_exit_requested:<br>
@@ -669,9 +669,9 @@ bool handle_sigsegv_accerr_write(CPUState *cpu, sigset_=
t *old_set,<br>
=C2=A0 * Use the TCGCPUOps hook to record cpu state, do guest operating sys=
tem<br>
=C2=A0 * specific things to raise SIGSEGV, and jump to the main cpu loop.<b=
r>
=C2=A0 */<br>
-void QEMU_NORETURN cpu_loop_exit_sigsegv(CPUState *cpu, target_ulong addr,=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MM=
UAccessType access_type,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bo=
ol maperr, uintptr_t ra);<br>
+G_NORETURN void cpu_loop_exit_sigsegv(CPUState *cpu, target_ulong addr,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MMUAccessType a=
ccess_type,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bool maperr, ui=
ntptr_t ra);<br>
<br>
=C2=A0/**<br>
=C2=A0 * cpu_loop_exit_sigbus:<br>
@@ -683,9 +683,9 @@ void QEMU_NORETURN cpu_loop_exit_sigsegv(CPUState *cpu,=
 target_ulong addr,<br>
=C2=A0 * Use the TCGCPUOps hook to record cpu state, do guest operating sys=
tem<br>
=C2=A0 * specific things to raise SIGBUS, and jump to the main cpu loop.<br=
>
=C2=A0 */<br>
-void QEMU_NORETURN cpu_loop_exit_sigbus(CPUState *cpu, target_ulong addr,<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MMUAcces=
sType access_type,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uintptr_=
t ra);<br>
+G_NORETURN void cpu_loop_exit_sigbus(CPUState *cpu, target_ulong addr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MMUAccessType ac=
cess_type,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uintptr_t ra);<b=
r>
<br>
=C2=A0#else<br>
=C2=A0static inline void mmap_lock(void) {}<br>
diff --git a/include/exec/helper-head.h b/include/exec/helper-head.h<br>
index 734af067fee6..e242fed46e0c 100644<br>
--- a/include/exec/helper-head.h<br>
+++ b/include/exec/helper-head.h<br>
@@ -46,7 +46,7 @@<br>
=C2=A0#define dh_ctype_ptr void *<br>
=C2=A0#define dh_ctype_cptr const void *<br>
=C2=A0#define dh_ctype_void void<br>
-#define dh_ctype_noreturn void QEMU_NORETURN<br>
+#define dh_ctype_noreturn G_NORETURN void<br>
=C2=A0#define dh_ctype(t) dh_ctype_##t<br>
<br>
=C2=A0#ifdef NEED_CPU_H<br>
diff --git a/include/glib-compat.h b/include/glib-compat.h<br>
index 3113a7d2af84..43a562974d80 100644<br>
--- a/include/glib-compat.h<br>
+++ b/include/glib-compat.h<br>
@@ -147,4 +147,8 @@ qemu_g_test_slow(void)<br>
<br>
=C2=A0#pragma GCC diagnostic pop<br>
<br>
+#ifndef G_NORETURN<br>
+#define G_NORETURN G_GNUC_NORETURN<br>
+#endif<br>
+<br>
=C2=A0#endif<br>
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h<br>
index 466bed604727..996f94059f7c 100644<br>
--- a/include/hw/core/cpu.h<br>
+++ b/include/hw/core/cpu.h<br>
@@ -1015,7 +1015,7 @@ int cpu_watchpoint_address_matches(CPUState *cpu, vad=
dr addr, vaddr len);<br>
=C2=A0 */<br>
=C2=A0AddressSpace *cpu_get_address_space(CPUState *cpu, int asidx);<br>
<br>
-void QEMU_NORETURN cpu_abort(CPUState *cpu, const char *fmt, ...)<br>
+G_NORETURN void cpu_abort(CPUState *cpu, const char *fmt, ...)<br>
=C2=A0 =C2=A0 =C2=A0G_GNUC_PRINTF(2, 3);<br>
<br>
=C2=A0/* $(top_srcdir)/cpu.c */<br>
diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h<=
br>
index e13898553aff..fbe6b76764cf 100644<br>
--- a/include/hw/core/tcg-cpu-ops.h<br>
+++ b/include/hw/core/tcg-cpu-ops.h<br>
@@ -78,9 +78,9 @@ struct TCGCPUOps {<br>
=C2=A0 =C2=A0 =C2=A0 * @do_unaligned_access: Callback for unaligned access =
handling<br>
=C2=A0 =C2=A0 =C2=A0 * The callback must exit via raising an exception.<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 void (*do_unaligned_access)(CPUState *cpu, vaddr addr,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MMUAccessType access_type,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int mmu_idx, uintptr_t retaddr) QEMU=
_NORETURN;<br>
+=C2=A0 =C2=A0 G_NORETURN void (*do_unaligned_access)(CPUState *cpu, vaddr =
addr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0MMUAccessType access_type,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0int mmu_idx, uintptr_t retaddr);<br>
<br>
=C2=A0 =C2=A0 =C2=A0/**<br>
=C2=A0 =C2=A0 =C2=A0 * @adjust_watchpoint_address: hack for cpu_check_watch=
point used by ARM<br>
diff --git a/include/hw/hw.h b/include/hw/hw.h<br>
index 34377f5309d3..045c1c8b09b3 100644<br>
--- a/include/hw/hw.h<br>
+++ b/include/hw/hw.h<br>
@@ -5,6 +5,6 @@<br>
=C2=A0#error Cannot include hw/hw.h from user emulation<br>
=C2=A0#endif<br>
<br>
-void QEMU_NORETURN hw_error(const char *fmt, ...) G_GNUC_PRINTF(1, 2);<br>
+G_NORETURN void hw_error(const char *fmt, ...) G_GNUC_PRINTF(1, 2);<br>
<br>
=C2=A0#endif<br>
diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h<br>
index c13bc8b58652..f12c0fb581ec 100644<br>
--- a/include/qemu/compiler.h<br>
+++ b/include/qemu/compiler.h<br>
@@ -22,8 +22,6 @@<br>
=C2=A0#define QEMU_EXTERN_C extern<br>
=C2=A0#endif<br>
<br>
-#define QEMU_NORETURN __attribute__ ((__noreturn__))<br>
-<br>
=C2=A0#if defined(_WIN32) &amp;&amp; (defined(__x86_64__) || defined(__i386=
__))<br>
=C2=A0# define QEMU_PACKED __attribute__((gcc_struct, packed))<br>
=C2=A0#else<br>
diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h<br>
index 848916f5165c..14b6b65a5fa9 100644<br>
--- a/include/qemu/osdep.h<br>
+++ b/include/qemu/osdep.h<br>
@@ -177,7 +177,8 @@ extern &quot;C&quot; {<br>
=C2=A0 * supports QEMU_ERROR, this will be reported at compile time; otherw=
ise<br>
=C2=A0 * this will be reported at link time due to the missing symbol.<br>
=C2=A0 */<br>
-extern void QEMU_NORETURN QEMU_ERROR(&quot;code path is reachable&quot;)<b=
r>
+extern G_NORETURN<br>
+void QEMU_ERROR(&quot;code path is reachable&quot;)<br>
=C2=A0 =C2=A0 =C2=A0qemu_build_not_reached_always(void);<br>
=C2=A0#if defined(__OPTIMIZE__) &amp;&amp; !defined(__NO_INLINE__)<br>
=C2=A0#define qemu_build_not_reached()=C2=A0 qemu_build_not_reached_always(=
)<br>
diff --git a/include/qemu/thread.h b/include/qemu/thread.h<br>
index 460568d67d53..af19f2b3fc7d 100644<br>
--- a/include/qemu/thread.h<br>
+++ b/include/qemu/thread.h<br>
@@ -188,7 +188,7 @@ void qemu_thread_create(QemuThread *thread, const char =
*name,<br>
=C2=A0void *qemu_thread_join(QemuThread *thread);<br>
=C2=A0void qemu_thread_get_self(QemuThread *thread);<br>
=C2=A0bool qemu_thread_is_self(QemuThread *thread);<br>
-void qemu_thread_exit(void *retval) QEMU_NORETURN;<br>
+G_NORETURN void qemu_thread_exit(void *retval);<br>
=C2=A0void qemu_thread_naming(bool enable);<br>
<br>
=C2=A0struct Notifier;<br>
diff --git a/include/tcg/tcg-ldst.h b/include/tcg/tcg-ldst.h<br>
index bf40942de4ab..121a156933a5 100644<br>
--- a/include/tcg/tcg-ldst.h<br>
+++ b/include/tcg/tcg-ldst.h<br>
@@ -72,8 +72,8 @@ void helper_be_stq_mmu(CPUArchState *env, target_ulong ad=
dr, uint64_t val,<br>
<br>
=C2=A0#else<br>
<br>
-void QEMU_NORETURN helper_unaligned_ld(CPUArchState *env, target_ulong add=
r);<br>
-void QEMU_NORETURN helper_unaligned_st(CPUArchState *env, target_ulong add=
r);<br>
+G_NORETURN void helper_unaligned_ld(CPUArchState *env, target_ulong addr);=
<br>
+G_NORETURN void helper_unaligned_st(CPUArchState *env, target_ulong addr);=
<br>
<br>
=C2=A0#endif /* CONFIG_SOFTMMU */<br>
=C2=A0#endif /* TCG_LDST_H */<br>
diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h<br>
index 73869fd9d04f..688d1fb46077 100644<br>
--- a/include/tcg/tcg.h<br>
+++ b/include/tcg/tcg.h<br>
@@ -398,7 +398,7 @@ typedef TCGv_ptr TCGv_env;<br>
=C2=A0#define TCG_CALL_NO_WRITE_GLOBALS=C2=A0 =C2=A00x0002<br>
=C2=A0/* Helper can be safely suppressed if the return value is not used. *=
/<br>
=C2=A0#define TCG_CALL_NO_SIDE_EFFECTS=C2=A0 =C2=A0 0x0004<br>
-/* Helper is QEMU_NORETURN.=C2=A0 */<br>
+/* Helper is G_NORETURN.=C2=A0 */<br>
=C2=A0#define TCG_CALL_NO_RETURN=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0008<b=
r>
<br>
=C2=A0/* convenience version of most used call flags */<br>
diff --git a/linux-user/user-internals.h b/linux-user/user-internals.h<br>
index 2a80bc83ae8f..ddc260e465dc 100644<br>
--- a/linux-user/user-internals.h<br>
+++ b/linux-user/user-internals.h<br>
@@ -64,7 +64,7 @@ abi_long do_syscall(void *cpu_env, int num, abi_long arg1=
,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0abi_long arg5, abi_long arg6, abi_long arg7,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0abi_long arg8);<br>
=C2=A0extern __thread CPUState *thread_cpu;<br>
-void QEMU_NORETURN cpu_loop(CPUArchState *env);<br>
+G_NORETURN void cpu_loop(CPUArchState *env);<br>
=C2=A0const char *target_strerror(int err);<br>
=C2=A0int get_osversion(void);<br>
=C2=A0void init_qemu_uname_release(void);<br>
diff --git a/scripts/cocci-macro-file.h b/scripts/cocci-macro-file.h<br>
index 3d1e9b50919a..d247a5086e91 100644<br>
--- a/scripts/cocci-macro-file.h<br>
+++ b/scripts/cocci-macro-file.h<br>
@@ -19,7 +19,7 @@<br>
=C2=A0 */<br>
<br>
=C2=A0/* From qemu/compiler.h */<br>
-#define QEMU_NORETURN __attribute__ ((__noreturn__))<br>
+#define G_NORETURN __attribute__ ((__noreturn__))<br>
=C2=A0#define G_GNUC_WARN_UNUSED_RESULT __attribute__((warn_unused_result))=
<br>
=C2=A0#define G_GNUC_NULL_TERMINATED __attribute__((sentinel))<br>
<br>
diff --git a/target/alpha/cpu.h b/target/alpha/cpu.h<br>
index 994a018b910d..d0abc949a8d0 100644<br>
--- a/target/alpha/cpu.h<br>
+++ b/target/alpha/cpu.h<br>
@@ -434,8 +434,8 @@ void alpha_translate_init(void);<br>
=C2=A0#define CPU_RESOLVING_TYPE TYPE_ALPHA_CPU<br>
<br>
=C2=A0void alpha_cpu_list(void);<br>
-void QEMU_NORETURN dynamic_excp(CPUAlphaState *, uintptr_t, int, int);<br>
-void QEMU_NORETURN arith_excp(CPUAlphaState *, uintptr_t, int, uint64_t);<=
br>
+G_NORETURN void dynamic_excp(CPUAlphaState *, uintptr_t, int, int);<br>
+G_NORETURN void arith_excp(CPUAlphaState *, uintptr_t, int, uint64_t);<br>
<br>
=C2=A0uint64_t cpu_alpha_load_fpcr (CPUAlphaState *env);<br>
=C2=A0void cpu_alpha_store_fpcr (CPUAlphaState *env, uint64_t val);<br>
@@ -452,9 +452,9 @@ void alpha_cpu_record_sigbus(CPUState *cs, vaddr addres=
s,<br>
=C2=A0bool alpha_cpu_tlb_fill(CPUState *cs, vaddr address, int size,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0MMUAccessType access_type, int mmu_idx,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0bool probe, uintptr_t retaddr);<br>
-void alpha_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MMUAccessType access_ty=
pe, int mmu_idx,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uintptr_t retaddr) QEMU=
_NORETURN;<br>
+G_NORETURN void alpha_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 MMUAccessType access_type, int mmu_idx,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 uintptr_t retaddr);<br>
=C2=A0void alpha_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vaddr addr, uns=
igned size,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MMUAccessType a=
ccess_type,<br>
diff --git a/target/arm/internals.h b/target/arm/internals.h<br>
index 7f696cd36a8c..9556e3b29e49 100644<br>
--- a/target/arm/internals.h<br>
+++ b/target/arm/internals.h<br>
@@ -102,13 +102,13 @@ FIELD(V7M_EXCRET, RES1, 7, 25) /* including the must-=
be-1 prefix */<br>
=C2=A0 * and target exception level. This should be called from helper func=
tions,<br>
=C2=A0 * and never returns because we will longjump back up to the CPU main=
 loop.<br>
=C2=A0 */<br>
-void QEMU_NORETURN raise_exception(CPUARMState *env, uint32_t excp,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t syndrome, uint=
32_t target_el);<br>
+G_NORETURN void raise_exception(CPUARMState *env, uint32_t excp,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t syndrome, uint32_t target_e=
l);<br>
<br>
=C2=A0/*<br>
=C2=A0 * Similarly, but also use unwinding to restore cpu state.<br>
=C2=A0 */<br>
-void QEMU_NORETURN raise_exception_ra(CPUARMState *env, uint32_t excp,<br>
+G_NORETURN void raise_exception_ra(CPUARMState *env, uint32_t excp,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t =
syndrome, uint32_t target_el,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uintptr_t=
 ra);<br>
<br>
@@ -606,9 +606,9 @@ ARMMMUIdx arm_v7m_mmu_idx_for_secstate(CPUARMState *env=
, bool secstate);<br>
=C2=A0bool arm_s1_regime_using_lpae_format(CPUARMState *env, ARMMMUIdx mmu_=
idx);<br>
<br>
=C2=A0/* Raise a data fault alignment exception for the specified virtual a=
ddress */<br>
-void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MMUAccessType access_type,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int mmu_idx, uintptr_t retaddr=
) QEMU_NORETURN;<br>
+G_NORETURN void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 MMUAccessType access_type,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 int mmu_idx, uintptr_t retaddr);<br>
<br>
=C2=A0/* arm_cpu_do_transaction_failed: handle a memory system error respon=
se<br>
=C2=A0 * (eg &quot;no device/memory present at address&quot;) by raising an=
 external abort<br>
diff --git a/target/hppa/cpu.h b/target/hppa/cpu.h<br>
index c43b93a68f14..6f3b6beecf40 100644<br>
--- a/target/hppa/cpu.h<br>
+++ b/target/hppa/cpu.h<br>
@@ -339,6 +339,6 @@ extern const VMStateDescription vmstate_hppa_cpu;<br>
=C2=A0void hppa_cpu_alarm_timer(void *);<br>
=C2=A0int hppa_artype_for_page(CPUHPPAState *env, target_ulong vaddr);<br>
=C2=A0#endif<br>
-void QEMU_NORETURN hppa_dynamic_excp(CPUHPPAState *env, int excp, uintptr_=
t ra);<br>
+G_NORETURN void hppa_dynamic_excp(CPUHPPAState *env, int excp, uintptr_t r=
a);<br>
<br>
=C2=A0#endif /* HPPA_CPU_H */<br>
diff --git a/target/i386/tcg/helper-tcg.h b/target/i386/tcg/helper-tcg.h<br=
>
index 0a4401e917f9..34167e2e29ca 100644<br>
--- a/target/i386/tcg/helper-tcg.h<br>
+++ b/target/i386/tcg/helper-tcg.h<br>
@@ -69,27 +69,27 @@ static inline target_long lshift(target_long x, int n)<=
br>
=C2=A0void tcg_x86_init(void);<br>
<br>
=C2=A0/* excp_helper.c */<br>
-void QEMU_NORETURN raise_exception(CPUX86State *env, int exception_index);=
<br>
-void QEMU_NORETURN raise_exception_ra(CPUX86State *env, int exception_inde=
x,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uintptr_t retad=
dr);<br>
-void QEMU_NORETURN raise_exception_err(CPUX86State *env, int exception_ind=
ex,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int error=
_code);<br>
-void QEMU_NORETURN raise_exception_err_ra(CPUX86State *env, int exception_=
index,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i=
nt error_code, uintptr_t retaddr);<br>
-void QEMU_NORETURN raise_interrupt(CPUX86State *nenv, int intno, int is_in=
t,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int error_code, int nex=
t_eip_addend);<br>
+G_NORETURN void raise_exception(CPUX86State *env, int exception_index);<br=
>
+G_NORETURN void raise_exception_ra(CPUX86State *env, int exception_index,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uintptr_t retaddr);<br>
+G_NORETURN void raise_exception_err(CPUX86State *env, int exception_index,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int error_code);<br>
+G_NORETURN void raise_exception_err_ra(CPUX86State *env, int exception_ind=
ex,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int error=
_code, uintptr_t retaddr);<br>
+G_NORETURN void raise_interrupt(CPUX86State *nenv, int intno, int is_int,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int error_code, int next_eip_addend)=
;<br>
<br>
=C2=A0/* cc_helper.c */<br>
=C2=A0extern const uint8_t parity_table[256];<br>
<br>
=C2=A0/* misc_helper.c */<br>
=C2=A0void cpu_load_eflags(CPUX86State *env, int eflags, int update_mask);<=
br>
-void do_pause(CPUX86State *env) QEMU_NORETURN;<br>
+G_NORETURN void do_pause(CPUX86State *env);<br>
<br>
=C2=A0/* sysemu/svm_helper.c */<br>
=C2=A0#ifndef CONFIG_USER_ONLY<br>
-void QEMU_NORETURN cpu_vmexit(CPUX86State *nenv, uint32_t exit_code,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t exit_info_1, uintptr_t retaddr);<b=
r>
+G_NORETURN void cpu_vmexit(CPUX86State *nenv, uint32_t exit_code,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0uint64_t exit_info_1, uintptr_t retaddr);<br>
=C2=A0void do_vmexit(CPUX86State *env);<br>
=C2=A0#endif<br>
<br>
diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h<br>
index 67aa88b8db5b..1e84dd8f47bb 100644<br>
--- a/target/microblaze/cpu.h<br>
+++ b/target/microblaze/cpu.h<br>
@@ -359,9 +359,9 @@ struct ArchCPU {<br>
=C2=A0void mb_cpu_do_interrupt(CPUState *cs);<br>
=C2=A0bool mb_cpu_exec_interrupt(CPUState *cs, int int_req);<br>
=C2=A0#endif /* !CONFIG_USER_ONLY */<br>
-void mb_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MMUAccessType access_type,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int mmu_idx, uintptr_t retaddr) QEMU=
_NORETURN;<br>
+G_NORETURN void mb_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0MMUAccessType access_type,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0int mmu_idx, uintptr_t retaddr);<br>
=C2=A0void mb_cpu_dump_state(CPUState *cpu, FILE *f, int flags);<br>
=C2=A0hwaddr mb_cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Me=
mTxAttrs *attrs);<br>
diff --git a/target/mips/tcg/tcg-internal.h b/target/mips/tcg/tcg-internal.=
h<br>
index 466768aec487..993720b00c3f 100644<br>
--- a/target/mips/tcg/tcg-internal.h<br>
+++ b/target/mips/tcg/tcg-internal.h<br>
@@ -18,18 +18,19 @@<br>
=C2=A0void mips_tcg_init(void);<br>
<br>
=C2=A0void mips_cpu_synchronize_from_tb(CPUState *cs, const TranslationBloc=
k *tb);<br>
-void mips_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MMUAccessType access_type, in=
t mmu_idx,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uintptr_t retaddr) QEMU_NORET=
URN;<br>
+G_NORETURN void mips_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0MMUAccessType access_type, int mmu_idx,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0uintptr_t retaddr);<br>
<br>
=C2=A0const char *mips_exception_name(int32_t exception);<br>
<br>
-void QEMU_NORETURN do_raise_exception_err(CPUMIPSState *env, uint32_t exce=
ption,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i=
nt error_code, uintptr_t pc);<br>
+G_NORETURN void do_raise_exception_err(CPUMIPSState *env, uint32_t excepti=
on,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int error=
_code, uintptr_t pc);<br>
<br>
-static inline void QEMU_NORETURN do_raise_exception(CPUMIPSState *env,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t exception,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uintptr_t pc)<br>
+static inline G_NORETURN<br>
+void do_raise_exception(CPUMIPSState *env,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 uint32_t exception,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 uintptr_t pc)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0do_raise_exception_err(env, exception, 0, pc);<br>
=C2=A0}<br>
diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h<br>
index ca0f3420cd1b..1bab805bb0b6 100644<br>
--- a/target/nios2/cpu.h<br>
+++ b/target/nios2/cpu.h<br>
@@ -194,9 +194,9 @@ void nios2_cpu_do_interrupt(CPUState *cs);<br>
=C2=A0void dump_mmu(CPUNios2State *env);<br>
=C2=A0void nios2_cpu_dump_state(CPUState *cpu, FILE *f, int flags);<br>
=C2=A0hwaddr nios2_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);<br>
-void nios2_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MMUAccessType access_ty=
pe, int mmu_idx,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uintptr_t retaddr) QEMU=
_NORETURN;<br>
+G_NORETURN void nios2_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 MMUAccessType access_type, int mmu_idx,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 uintptr_t retaddr);<br>
<br>
=C2=A0void do_nios2_semihosting(CPUNios2State *env);<br>
<br>
diff --git a/target/openrisc/exception.h b/target/openrisc/exception.h<br>
index 333bf846388d..f62fc314c1f4 100644<br>
--- a/target/openrisc/exception.h<br>
+++ b/target/openrisc/exception.h<br>
@@ -22,6 +22,6 @@<br>
<br>
=C2=A0#include &quot;cpu.h&quot;<br>
<br>
-void QEMU_NORETURN raise_exception(OpenRISCCPU *cpu, uint32_t excp);<br>
+G_NORETURN void raise_exception(OpenRISCCPU *cpu, uint32_t excp);<br>
<br>
=C2=A0#endif /* TARGET_OPENRISC_EXCEPTION_H */<br>
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h<br>
index 473436a49eb5..c2b6c987c047 100644<br>
--- a/target/ppc/cpu.h<br>
+++ b/target/ppc/cpu.h<br>
@@ -2492,13 +2492,13 @@ static inline void cpu_get_tb_cpu_state(CPUPPCState=
 *env, target_ulong *pc,<br>
=C2=A0}<br>
=C2=A0#endif<br>
<br>
-void QEMU_NORETURN raise_exception(CPUPPCState *env, uint32_t exception);<=
br>
-void QEMU_NORETURN raise_exception_ra(CPUPPCState *env, uint32_t exception=
,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uintptr_t raddr=
);<br>
-void QEMU_NORETURN raise_exception_err(CPUPPCState *env, uint32_t exceptio=
n,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t =
error_code);<br>
-void QEMU_NORETURN raise_exception_err_ra(CPUPPCState *env, uint32_t excep=
tion,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u=
int32_t error_code, uintptr_t raddr);<br>
+G_NORETURN void raise_exception(CPUPPCState *env, uint32_t exception);<br>
+G_NORETURN void raise_exception_ra(CPUPPCState *env, uint32_t exception,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uintptr_t raddr);<br>
+G_NORETURN void raise_exception_err(CPUPPCState *env, uint32_t exception,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t error_code);<=
br>
+G_NORETURN void raise_exception_err_ra(CPUPPCState *env, uint32_t exceptio=
n,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t =
error_code, uintptr_t raddr);<br>
<br>
=C2=A0/* PERFM EBB helper*/<br>
=C2=A0#if defined(TARGET_PPC64) &amp;&amp; !defined(CONFIG_USER_ONLY)<br>
diff --git a/target/ppc/internal.h b/target/ppc/internal.h<br>
index 6aa9484f34a5..8094e0b03371 100644<br>
--- a/target/ppc/internal.h<br>
+++ b/target/ppc/internal.h<br>
@@ -286,9 +286,9 @@ void ppc_cpu_record_sigsegv(CPUState *cs, vaddr addr,<b=
r>
=C2=A0bool ppc_cpu_tlb_fill(CPUState *cs, vaddr address, int size,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0MMUAccessType access_type, int mmu_idx,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0bool probe, uintptr_t retaddr);<br>
-void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr addr,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MMUAccessType access_type, int=
 mmu_idx,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uintptr_t retaddr) QEMU_NORETU=
RN;<br>
+G_NORETURN void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr addr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 MMUAccessType access_type, int mmu_idx,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 uintptr_t retaddr);<br>
=C2=A0#endif<br>
<br>
=C2=A0#endif /* PPC_INTERNAL_H */<br>
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
index e1d976bdef06..72f1c9451e93 100644<br>
--- a/target/riscv/cpu.h<br>
+++ b/target/riscv/cpu.h<br>
@@ -451,9 +451,9 @@ void riscv_cpu_set_virt_enabled(CPURISCVState *env, boo=
l enable);<br>
=C2=A0bool riscv_cpu_two_stage_lookup(int mmu_idx);<br>
=C2=A0int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch);<br>
=C2=A0hwaddr riscv_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);<br>
-void=C2=A0 riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MMUAccessType access_t=
ype, int mmu_idx,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uintptr_t retaddr) QEM=
U_NORETURN;<br>
+G_NORETURN void=C2=A0 riscv_cpu_do_unaligned_access(CPUState *cs, vaddr ad=
dr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0MMUAccessType access_type, int mmu_idx,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0uintptr_t retaddr);<br>
=C2=A0bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0MMUAccessType access_type, int mmu_idx,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0bool probe, uintptr_t retaddr);<br>
@@ -487,8 +487,8 @@ void riscv_cpu_set_aia_ireg_rmw_fn(CPURISCVState *env, =
uint32_t priv,<br>
=C2=A0void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv);<br=
>
<br>
=C2=A0void riscv_translate_init(void);<br>
-void QEMU_NORETURN riscv_raise_exception(CPURISCVState *env,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ui=
nt32_t exception, uintptr_t pc);<br>
+G_NORETURN void riscv_raise_exception(CPURISCVState *env,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t except=
ion, uintptr_t pc);<br>
<br>
=C2=A0target_ulong riscv_cpu_get_fflags(CPURISCVState *env);<br>
=C2=A0void riscv_cpu_set_fflags(CPURISCVState *env, target_ulong);<br>
diff --git a/target/s390x/s390x-internal.h b/target/s390x/s390x-internal.h<=
br>
index 6fc8cad2d586..6aba7fd0ca8a 100644<br>
--- a/target/s390x/s390x-internal.h<br>
+++ b/target/s390x/s390x-internal.h<br>
@@ -280,9 +280,9 @@ void s390_cpu_record_sigbus(CPUState *cs, vaddr address=
,<br>
=C2=A0bool s390_cpu_tlb_fill(CPUState *cs, vaddr address, int size,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 MMUAccessType access_type, int mmu_idx,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 bool probe, uintptr_t retaddr);<br>
-void s390x_cpu_do_unaligned_access(CPUState *cs, vaddr addr,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MMUAccessType access_ty=
pe, int mmu_idx,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uintptr_t retaddr) QEMU=
_NORETURN;<br>
+G_NORETURN void s390x_cpu_do_unaligned_access(CPUState *cs, vaddr addr,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 MMUAccessType access_type, int mmu_idx,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 uintptr_t retaddr);<br>
=C2=A0#endif<br>
<br>
<br>
diff --git a/target/s390x/tcg/tcg_s390x.h b/target/s390x/tcg/tcg_s390x.h<br=
>
index 2f54ccb02745..78558912f99f 100644<br>
--- a/target/s390x/tcg/tcg_s390x.h<br>
+++ b/target/s390x/tcg/tcg_s390x.h<br>
@@ -14,11 +14,11 @@<br>
=C2=A0#define TCG_S390X_H<br>
<br>
=C2=A0void tcg_s390_tod_updated(CPUState *cs, run_on_cpu_data opaque);<br>
-void QEMU_NORETURN tcg_s390_program_interrupt(CPUS390XState *env,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 uint32_t code, uintptr_t ra);<br>
-void QEMU_NORETURN tcg_s390_data_exception(CPUS390XState *env, uint32_t dx=
c,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0uintptr_t ra);<br>
-void QEMU_NORETURN tcg_s390_vector_exception(CPUS390XState *env, uint32_t =
vxc,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0uintptr_t ra);<br>
+G_NORETURN void tcg_s390_program_interrupt(CPUS390XState *env,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0uint32_t code, uintptr_t ra);<br>
+G_NORETURN void tcg_s390_data_exception(CPUS390XState *env, uint32_t dxc,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uintptr_=
t ra);<br>
+G_NORETURN void tcg_s390_vector_exception(CPUS390XState *env, uint32_t vxc=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u=
intptr_t ra);<br>
<br>
=C2=A0#endif /* TCG_S390X_H */<br>
diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h<br>
index 14d490ac4705..9f15ef913caa 100644<br>
--- a/target/sh4/cpu.h<br>
+++ b/target/sh4/cpu.h<br>
@@ -210,9 +210,9 @@ void superh_cpu_dump_state(CPUState *cpu, FILE *f, int =
flags);<br>
=C2=A0hwaddr superh_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);<br>
=C2=A0int superh_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int =
reg);<br>
=C2=A0int superh_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int re=
g);<br>
-void superh_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MMUAccessType access_t=
ype, int mmu_idx,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uintptr_t retaddr) QEM=
U_NORETURN;<br>
+G_NORETURN void superh_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0MMUAccessType access_type, int mmu_idx,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0uintptr_t retaddr);<br>
<br>
=C2=A0void sh4_translate_init(void);<br>
=C2=A0void sh4_cpu_list(void);<br>
diff --git a/target/sparc/cpu.h b/target/sparc/cpu.h<br>
index dd9e2f5cdb6a..f80ea2e8cf2a 100644<br>
--- a/target/sparc/cpu.h<br>
+++ b/target/sparc/cpu.h<br>
@@ -575,11 +575,11 @@ void sparc_cpu_do_interrupt(CPUState *cpu);<br>
=C2=A0hwaddr sparc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);<br>
=C2=A0int sparc_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int r=
eg);<br>
=C2=A0int sparc_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg=
);<br>
-void QEMU_NORETURN sparc_cpu_do_unaligned_access(CPUState *cpu, vaddr addr=
,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0MMUAccessType access_type,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0int mmu_idx,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0uintptr_t retaddr);<br>
-void cpu_raise_exception_ra(CPUSPARCState *, int, uintptr_t) QEMU_NORETURN=
;<br>
+G_NORETURN void sparc_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 MMUAccessType access_type,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 int mmu_idx,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 uintptr_t retaddr);<br>
+G_NORETURN void cpu_raise_exception_ra(CPUSPARCState *, int, uintptr_t);<b=
r>
<br>
=C2=A0#ifndef NO_CPU_IO_DEFS<br>
=C2=A0/* cpu_init.c */<br>
diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h<br>
index 71142ea8f453..d4b8268146cb 100644<br>
--- a/target/xtensa/cpu.h<br>
+++ b/target/xtensa/cpu.h<br>
@@ -581,9 +581,9 @@ void xtensa_count_regs(const XtensaConfig *config,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 unsigned *n_regs, unsigned *n_core_regs);<br>
=C2=A0int xtensa_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int =
reg);<br>
=C2=A0int xtensa_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int re=
g);<br>
-void xtensa_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MMUAccessType access_t=
ype, int mmu_idx,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uintptr_t retaddr) QEM=
U_NORETURN;<br>
+G_NORETURN void xtensa_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0MMUAccessType access_type, int mmu_idx,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0uintptr_t retaddr);<br>
<br>
=C2=A0#define cpu_list xtensa_cpu_list<br>
<br>
diff --git a/accel/stubs/tcg-stub.c b/accel/stubs/tcg-stub.c<br>
index d8162673ae8d..ea4a0dd2fbcc 100644<br>
--- a/accel/stubs/tcg-stub.c<br>
+++ b/accel/stubs/tcg-stub.c<br>
@@ -28,12 +28,12 @@ void *probe_access(CPUArchState *env, target_ulong addr=
, int size,<br>
=C2=A0 =C2=A0 =C2=A0 g_assert_not_reached();<br>
=C2=A0}<br>
<br>
-void QEMU_NORETURN cpu_loop_exit(CPUState *cpu)<br>
+G_NORETURN void cpu_loop_exit(CPUState *cpu)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0g_assert_not_reached();<br>
=C2=A0}<br>
<br>
-void QEMU_NORETURN cpu_loop_exit_restore(CPUState *cpu, uintptr_t pc)<br>
+G_NORETURN void cpu_loop_exit_restore(CPUState *cpu, uintptr_t pc)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0g_assert_not_reached();<br>
=C2=A0}<br>
diff --git a/bsd-user/signal.c b/bsd-user/signal.c<br>
index 8a36b696d82b..58a53863957a 100644<br>
--- a/bsd-user/signal.c<br>
+++ b/bsd-user/signal.c<br>
@@ -347,7 +347,8 @@ static int core_dump_signal(int sig)<br>
=C2=A0}<br>
<br>
=C2=A0/* Abort execution with signal. */<br>
-static void QEMU_NORETURN dump_core_and_abort(int target_sig)<br>
+static G_NORETURN<br>
+void dump_core_and_abort(int target_sig)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0CPUArchState *env =3D thread_cpu-&gt;env_ptr;<br>
=C2=A0 =C2=A0 =C2=A0CPUState *cpu =3D env_cpu(env);<br>
diff --git a/hw/misc/mips_itu.c b/hw/misc/mips_itu.c<br>
index 80683fed318b..badef5c214af 100644<br>
--- a/hw/misc/mips_itu.c<br>
+++ b/hw/misc/mips_itu.c<br>
@@ -189,7 +189,8 @@ static void wake_blocked_threads(ITCStorageCell *c)<br>
=C2=A0 =C2=A0 =C2=A0c-&gt;blocked_threads =3D 0;<br>
=C2=A0}<br>
<br>
-static void QEMU_NORETURN block_thread_and_exit(ITCStorageCell *c)<br>
+static G_NORETURN<br>
+void block_thread_and_exit(ITCStorageCell *c)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0c-&gt;blocked_threads |=3D 1ULL &lt;&lt; current_cpu-&g=
t;cpu_index;<br>
=C2=A0 =C2=A0 =C2=A0current_cpu-&gt;halted =3D 1;<br>
diff --git a/linux-user/signal.c b/linux-user/signal.c<br>
index 092e70b80c6f..8d29bfaa6b5c 100644<br>
--- a/linux-user/signal.c<br>
+++ b/linux-user/signal.c<br>
@@ -725,7 +725,8 @@ void cpu_loop_exit_sigbus(CPUState *cpu, target_ulong a=
ddr,<br>
=C2=A0}<br>
<br>
=C2=A0/* abort execution with signal */<br>
-static void QEMU_NORETURN dump_core_and_abort(int target_sig)<br>
+static G_NORETURN<br>
+void dump_core_and_abort(int target_sig)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0CPUState *cpu =3D thread_cpu;<br>
=C2=A0 =C2=A0 =C2=A0CPUArchState *env =3D cpu-&gt;env_ptr;<br>
diff --git a/monitor/hmp.c b/monitor/hmp.c<br>
index 24fd2e5f34bf..15ca04735cd3 100644<br>
--- a/monitor/hmp.c<br>
+++ b/monitor/hmp.c<br>
@@ -308,8 +308,8 @@ void help_cmd(Monitor *mon, const char *name)<br>
=C2=A0static const char *pch;<br>
=C2=A0static sigjmp_buf expr_env;<br>
<br>
-static void G_GNUC_PRINTF(2, 3) QEMU_NORETURN<br>
-expr_error(Monitor *mon, const char *fmt, ...)<br>
+static G_NORETURN G_GNUC_PRINTF(2, 3)<br>
+void expr_error(Monitor *mon, const char *fmt, ...)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0va_list ap;<br>
=C2=A0 =C2=A0 =C2=A0va_start(ap, fmt);<br>
diff --git a/qemu-img.c b/qemu-img.c<br>
index a2b1d3653a1e..6077c947002d 100644<br>
--- a/qemu-img.c<br>
+++ b/qemu-img.c<br>
@@ -100,7 +100,8 @@ static void format_print(void *opaque, const char *name=
)<br>
=C2=A0 =C2=A0 =C2=A0printf(&quot; %s&quot;, name);<br>
=C2=A0}<br>
<br>
-static void QEMU_NORETURN G_GNUC_PRINTF(1, 2) error_exit(const char *fmt, =
...)<br>
+static G_NORETURN G_GNUC_PRINTF(1, 2)<br>
+void error_exit(const char *fmt, ...)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0va_list ap;<br>
<br>
@@ -112,18 +113,21 @@ static void QEMU_NORETURN G_GNUC_PRINTF(1, 2) error_e=
xit(const char *fmt, ...)<br>
=C2=A0 =C2=A0 =C2=A0exit(EXIT_FAILURE);<br>
=C2=A0}<br>
<br>
-static void QEMU_NORETURN missing_argument(const char *option)<br>
+static G_NORETURN<br>
+void missing_argument(const char *option)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0error_exit(&quot;missing argument for option &#39;%s&#3=
9;&quot;, option);<br>
=C2=A0}<br>
<br>
-static void QEMU_NORETURN unrecognized_option(const char *option)<br>
+static G_NORETURN<br>
+void unrecognized_option(const char *option)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0error_exit(&quot;unrecognized option &#39;%s&#39;&quot;=
, option);<br>
=C2=A0}<br>
<br>
=C2=A0/* Please keep in synch with docs/tools/qemu-img.rst */<br>
-static void QEMU_NORETURN help(void)<br>
+static G_NORETURN<br>
+void help(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0const char *help_msg =3D<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 QEMU_IMG_VERSION<br>
diff --git a/target/alpha/helper.c b/target/alpha/helper.c<br>
index dcaa2d03adb3..a5a389b5a321 100644<br>
--- a/target/alpha/helper.c<br>
+++ b/target/alpha/helper.c<br>
@@ -514,7 +514,7 @@ void alpha_cpu_dump_state(CPUState *cs, FILE *f, int fl=
ags)<br>
<br>
=C2=A0/* This should only be called from translate, via gen_excp.<br>
=C2=A0 =C2=A0 We expect that ENV-&gt;PC has already been updated.=C2=A0 */<=
br>
-void QEMU_NORETURN helper_excp(CPUAlphaState *env, int excp, int error)<br=
>
+G_NORETURN void helper_excp(CPUAlphaState *env, int excp, int error)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0CPUState *cs =3D env_cpu(env);<br>
<br>
@@ -524,8 +524,8 @@ void QEMU_NORETURN helper_excp(CPUAlphaState *env, int =
excp, int error)<br>
=C2=A0}<br>
<br>
=C2=A0/* This may be called from any of the helpers to set up EXCEPTION_IND=
EX.=C2=A0 */<br>
-void QEMU_NORETURN dynamic_excp(CPUAlphaState *env, uintptr_t retaddr,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int excp, int error)<br>
+G_NORETURN void dynamic_excp(CPUAlphaState *env, uintptr_t retaddr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int excp, int error)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0CPUState *cs =3D env_cpu(env);<br>
<br>
@@ -539,8 +539,8 @@ void QEMU_NORETURN dynamic_excp(CPUAlphaState *env, uin=
tptr_t retaddr,<br>
=C2=A0 =C2=A0 =C2=A0cpu_loop_exit(cs);<br>
=C2=A0}<br>
<br>
-void QEMU_NORETURN arith_excp(CPUAlphaState *env, uintptr_t retaddr,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int exc, uint64_t mask)<br>
+G_NORETURN void arith_excp(CPUAlphaState *env, uintptr_t retaddr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0int exc, uint64_t mask)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0env-&gt;trap_arg0 =3D exc;<br>
=C2=A0 =C2=A0 =C2=A0env-&gt;trap_arg1 =3D mask;<br>
diff --git a/target/arm/pauth_helper.c b/target/arm/pauth_helper.c<br>
index 739aa520dddd..d0483bf051ec 100644<br>
--- a/target/arm/pauth_helper.c<br>
+++ b/target/arm/pauth_helper.c<br>
@@ -382,8 +382,8 @@ static uint64_t pauth_strip(CPUARMState *env, uint64_t =
ptr, bool data)<br>
=C2=A0 =C2=A0 =C2=A0return pauth_original_ptr(ptr, param);<br>
=C2=A0}<br>
<br>
-static void QEMU_NORETURN pauth_trap(CPUARMState *env, int target_el,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uintptr_t ra)<br=
>
+static G_NORETURN<br>
+void pauth_trap(CPUARMState *env, int target_el, uintptr_t ra)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0raise_exception_ra(env, EXCP_UDEF, syn_pactrap(), targe=
t_el, ra);<br>
=C2=A0}<br>
diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c<br>
index b79004e0cca6..6421e16202e5 100644<br>
--- a/target/arm/tlb_helper.c<br>
+++ b/target/arm/tlb_helper.c<br>
@@ -79,9 +79,10 @@ static uint32_t compute_fsr_fsc(CPUARMState *env, ARMMMU=
FaultInfo *fi,<br>
=C2=A0 =C2=A0 =C2=A0return fsr;<br>
=C2=A0}<br>
<br>
-static void QEMU_NORETURN arm_deliver_fault(ARMCPU *cpu, vaddr addr,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 MMUAccessType access_type,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 int mmu_idx, ARMMMUFaultInfo *fi)<br>
+static G_NORETURN<br>
+void arm_deliver_fault(ARMCPU *cpu, vaddr addr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0MMUAccessType access_type,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0int mmu_idx, ARMMMUFaultInfo *fi)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0CPUARMState *env =3D &amp;cpu-&gt;env;<br>
=C2=A0 =C2=A0 =C2=A0int target_el;<br>
diff --git a/target/hexagon/op_helper.c b/target/hexagon/op_helper.c<br>
index 63e5ad5d68e2..a5ed819c0451 100644<br>
--- a/target/hexagon/op_helper.c<br>
+++ b/target/hexagon/op_helper.c<br>
@@ -34,9 +34,10 @@<br>
=C2=A0#define SF_MANTBITS=C2=A0 =C2=A0 23<br>
<br>
=C2=A0/* Exceptions processing helpers */<br>
-static void QEMU_NORETURN do_raise_exception_err(CPUHexagonState *env,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t exception,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0uintptr_t pc)<br>
+static G_NORETURN<br>
+void do_raise_exception_err(CPUHexagonState *env,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t exception,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 uintptr_t pc)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0CPUState *cs =3D env_cpu(env);<br>
=C2=A0 =C2=A0 =C2=A0qemu_log_mask(CPU_LOG_INT, &quot;%s: %d\n&quot;, __func=
__, exception);<br>
@@ -44,7 +45,7 @@ static void QEMU_NORETURN do_raise_exception_err(CPUHexag=
onState *env,<br>
=C2=A0 =C2=A0 =C2=A0cpu_loop_exit_restore(cs, pc);<br>
=C2=A0}<br>
<br>
-void QEMU_NORETURN HELPER(raise_exception)(CPUHexagonState *env, uint32_t =
excp)<br>
+G_NORETURN void HELPER(raise_exception)(CPUHexagonState *env, uint32_t exc=
p)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0do_raise_exception_err(env, excp, 0);<br>
=C2=A0}<br>
diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c<br>
index 5f46ba801eef..a6f52caf14a3 100644<br>
--- a/target/hppa/cpu.c<br>
+++ b/target/hppa/cpu.c<br>
@@ -73,10 +73,10 @@ static void hppa_cpu_disas_set_info(CPUState *cs, disas=
semble_info *info)<br>
=C2=A0}<br>
<br>
=C2=A0#ifndef CONFIG_USER_ONLY<br>
-static void QEMU_NORETURN<br>
-hppa_cpu_do_unaligned_access(CPUState *cs, vaddr addr,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MMUAccessType access_type, int mmu_idx,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uintptr_t retaddr)<br>
+static G_NORETURN<br>
+void hppa_cpu_do_unaligned_access(CPUState *cs, vaddr addr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MMUAccessType access_type, in=
t mmu_idx,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uintptr_t retaddr)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0HPPACPU *cpu =3D HPPA_CPU(cs);<br>
=C2=A0 =C2=A0 =C2=A0CPUHPPAState *env =3D &amp;cpu-&gt;env;<br>
diff --git a/target/hppa/op_helper.c b/target/hppa/op_helper.c<br>
index 2810361be0b7..cd304f051e57 100644<br>
--- a/target/hppa/op_helper.c<br>
+++ b/target/hppa/op_helper.c<br>
@@ -28,7 +28,7 @@<br>
=C2=A0#include &quot;fpu/softfloat.h&quot;<br>
=C2=A0#include &quot;trace.h&quot;<br>
<br>
-void QEMU_NORETURN HELPER(excp)(CPUHPPAState *env, int excp)<br>
+G_NORETURN void HELPER(excp)(CPUHPPAState *env, int excp)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0CPUState *cs =3D env_cpu(env);<br>
<br>
@@ -36,7 +36,7 @@ void QEMU_NORETURN HELPER(excp)(CPUHPPAState *env, int ex=
cp)<br>
=C2=A0 =C2=A0 =C2=A0cpu_loop_exit(cs);<br>
=C2=A0}<br>
<br>
-void QEMU_NORETURN hppa_dynamic_excp(CPUHPPAState *env, int excp, uintptr_=
t ra)<br>
+G_NORETURN void hppa_dynamic_excp(CPUHPPAState *env, int excp, uintptr_t r=
a)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0CPUState *cs =3D env_cpu(env);<br>
<br>
diff --git a/target/i386/tcg/bpt_helper.c b/target/i386/tcg/bpt_helper.c<br=
>
index b6c1fff16e51..bc34ac27fea7 100644<br>
--- a/target/i386/tcg/bpt_helper.c<br>
+++ b/target/i386/tcg/bpt_helper.c<br>
@@ -22,7 +22,7 @@<br>
=C2=A0#include &quot;exec/helper-proto.h&quot;<br>
=C2=A0#include &quot;helper-tcg.h&quot;<br>
<br>
-void QEMU_NORETURN helper_single_step(CPUX86State *env)<br>
+G_NORETURN void helper_single_step(CPUX86State *env)<br>
=C2=A0{<br>
=C2=A0#ifndef CONFIG_USER_ONLY<br>
=C2=A0 =C2=A0 =C2=A0check_hw_breakpoints(env, true);<br>
diff --git a/target/i386/tcg/excp_helper.c b/target/i386/tcg/excp_helper.c<=
br>
index bdae887d0abc..c1ffa1c0ef74 100644<br>
--- a/target/i386/tcg/excp_helper.c<br>
+++ b/target/i386/tcg/excp_helper.c<br>
@@ -25,13 +25,13 @@<br>
=C2=A0#include &quot;exec/helper-proto.h&quot;<br>
=C2=A0#include &quot;helper-tcg.h&quot;<br>
<br>
-void QEMU_NORETURN helper_raise_interrupt(CPUX86State *env, int intno,<br>
+G_NORETURN void helper_raise_interrupt(CPUX86State *env, int intno,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0int next_eip_addend)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0raise_interrupt(env, intno, 1, 0, next_eip_addend);<br>
=C2=A0}<br>
<br>
-void QEMU_NORETURN helper_raise_exception(CPUX86State *env, int exception_=
index)<br>
+G_NORETURN void helper_raise_exception(CPUX86State *env, int exception_ind=
ex)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0raise_exception(env, exception_index);<br>
=C2=A0}<br>
@@ -87,10 +87,11 @@ static int check_exception(CPUX86State *env, int intno,=
 int *error_code,<br>
=C2=A0 * env-&gt;eip value AFTER the interrupt instruction. It is only rele=
vant if<br>
=C2=A0 * is_int is TRUE.<br>
=C2=A0 */<br>
-static void QEMU_NORETURN raise_interrupt2(CPUX86State *env, int intno,<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0int is_int, int error_code,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0int next_eip_addend,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0uintptr_t retaddr)<br>
+static G_NORETURN<br>
+void raise_interrupt2(CPUX86State *env, int intno,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 int is_int, int error_code,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 int next_eip_addend,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 uintptr_t retaddr)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0CPUState *cs =3D env_cpu(env);<br>
<br>
@@ -111,31 +112,31 @@ static void QEMU_NORETURN raise_interrupt2(CPUX86Stat=
e *env, int intno,<br>
<br>
=C2=A0/* shortcuts to generate exceptions */<br>
<br>
-void QEMU_NORETURN raise_interrupt(CPUX86State *env, int intno, int is_int=
,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int error_code, int nex=
t_eip_addend)<br>
+G_NORETURN void raise_interrupt(CPUX86State *env, int intno, int is_int,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int error_code, int next_eip_addend)=
<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0raise_interrupt2(env, intno, is_int, error_code, next_e=
ip_addend, 0);<br>
=C2=A0}<br>
<br>
-void QEMU_NORETURN raise_exception_err(CPUX86State *env, int exception_ind=
ex,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int error=
_code)<br>
+G_NORETURN void raise_exception_err(CPUX86State *env, int exception_index,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int error_code)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0raise_interrupt2(env, exception_index, 0, error_code, 0=
, 0);<br>
=C2=A0}<br>
<br>
-void QEMU_NORETURN raise_exception_err_ra(CPUX86State *env, int exception_=
index,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i=
nt error_code, uintptr_t retaddr)<br>
+G_NORETURN void raise_exception_err_ra(CPUX86State *env, int exception_ind=
ex,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int error=
_code, uintptr_t retaddr)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0raise_interrupt2(env, exception_index, 0, error_code, 0=
, retaddr);<br>
=C2=A0}<br>
<br>
-void QEMU_NORETURN raise_exception(CPUX86State *env, int exception_index)<=
br>
+G_NORETURN void raise_exception(CPUX86State *env, int exception_index)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0raise_interrupt2(env, exception_index, 0, 0, 0, 0);<br>
=C2=A0}<br>
<br>
-void QEMU_NORETURN raise_exception_ra(CPUX86State *env, int exception_inde=
x,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uintptr_t retad=
dr)<br>
+G_NORETURN void raise_exception_ra(CPUX86State *env, int exception_index,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uintptr_t retaddr)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0raise_interrupt2(env, exception_index, 0, 0, 0, retaddr=
);<br>
=C2=A0}<br>
diff --git a/target/i386/tcg/misc_helper.c b/target/i386/tcg/misc_helper.c<=
br>
index 24a0eaa3d596..5f7a3061ca59 100644<br>
--- a/target/i386/tcg/misc_helper.c<br>
+++ b/target/i386/tcg/misc_helper.c<br>
@@ -81,7 +81,7 @@ void helper_rdtscp(CPUX86State *env)<br>
=C2=A0 =C2=A0 =C2=A0env-&gt;regs[R_ECX] =3D (uint32_t)(env-&gt;tsc_aux);<br=
>
=C2=A0}<br>
<br>
-void QEMU_NORETURN helper_rdpmc(CPUX86State *env)<br>
+G_NORETURN void helper_rdpmc(CPUX86State *env)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0if (((env-&gt;cr[4] &amp; CR4_PCE_MASK) =3D=3D 0 ) &amp=
;&amp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0((env-&gt;hflags &amp; HF_CPL_MASK) !=3D =
0)) {<br>
@@ -94,7 +94,7 @@ void QEMU_NORETURN helper_rdpmc(CPUX86State *env)<br>
=C2=A0 =C2=A0 =C2=A0raise_exception_err(env, EXCP06_ILLOP, 0);<br>
=C2=A0}<br>
<br>
-void QEMU_NORETURN do_pause(CPUX86State *env)<br>
+G_NORETURN void do_pause(CPUX86State *env)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0CPUState *cs =3D env_cpu(env);<br>
<br>
@@ -103,7 +103,7 @@ void QEMU_NORETURN do_pause(CPUX86State *env)<br>
=C2=A0 =C2=A0 =C2=A0cpu_loop_exit(cs);<br>
=C2=A0}<br>
<br>
-void QEMU_NORETURN helper_pause(CPUX86State *env, int next_eip_addend)<br>
+G_NORETURN void helper_pause(CPUX86State *env, int next_eip_addend)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0cpu_svm_check_intercept_param(env, SVM_EXIT_PAUSE, 0, G=
ETPC());<br>
=C2=A0 =C2=A0 =C2=A0env-&gt;eip +=3D next_eip_addend;<br>
diff --git a/target/i386/tcg/sysemu/misc_helper.c b/target/i386/tcg/sysemu/=
misc_helper.c<br>
index 3715c1e2625b..1328aa656fa8 100644<br>
--- a/target/i386/tcg/sysemu/misc_helper.c<br>
+++ b/target/i386/tcg/sysemu/misc_helper.c<br>
@@ -471,7 +471,8 @@ void helper_flush_page(CPUX86State *env, target_ulong a=
ddr)<br>
=C2=A0 =C2=A0 =C2=A0tlb_flush_page(env_cpu(env), addr);<br>
=C2=A0}<br>
<br>
-static void QEMU_NORETURN do_hlt(CPUX86State *env)<br>
+static G_NORETURN<br>
+void do_hlt(CPUX86State *env)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0CPUState *cs =3D env_cpu(env);<br>
<br>
@@ -481,7 +482,7 @@ static void QEMU_NORETURN do_hlt(CPUX86State *env)<br>
=C2=A0 =C2=A0 =C2=A0cpu_loop_exit(cs);<br>
=C2=A0}<br>
<br>
-void QEMU_NORETURN helper_hlt(CPUX86State *env, int next_eip_addend)<br>
+G_NORETURN void helper_hlt(CPUX86State *env, int next_eip_addend)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0cpu_svm_check_intercept_param(env, SVM_EXIT_HLT, 0, GET=
PC());<br>
=C2=A0 =C2=A0 =C2=A0env-&gt;eip +=3D next_eip_addend;<br>
@@ -498,7 +499,7 @@ void helper_monitor(CPUX86State *env, target_ulong ptr)=
<br>
=C2=A0 =C2=A0 =C2=A0cpu_svm_check_intercept_param(env, SVM_EXIT_MONITOR, 0,=
 GETPC());<br>
=C2=A0}<br>
<br>
-void QEMU_NORETURN helper_mwait(CPUX86State *env, int next_eip_addend)<br>
+G_NORETURN void helper_mwait(CPUX86State *env, int next_eip_addend)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0CPUState *cs =3D env_cpu(env);<br>
<br>
diff --git a/target/openrisc/exception.c b/target/openrisc/exception.c<br>
index 28c1fce5232a..8699c3dcea42 100644<br>
--- a/target/openrisc/exception.c<br>
+++ b/target/openrisc/exception.c<br>
@@ -22,7 +22,7 @@<br>
=C2=A0#include &quot;exec/exec-all.h&quot;<br>
=C2=A0#include &quot;exception.h&quot;<br>
<br>
-void QEMU_NORETURN raise_exception(OpenRISCCPU *cpu, uint32_t excp)<br>
+G_NORETURN void raise_exception(OpenRISCCPU *cpu, uint32_t excp)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0CPUState *cs =3D CPU(cpu);<br>
<br>
diff --git a/target/openrisc/exception_helper.c b/target/openrisc/exception=
_helper.c<br>
index d02a1cf0aa14..1f5be4bed907 100644<br>
--- a/target/openrisc/exception_helper.c<br>
+++ b/target/openrisc/exception_helper.c<br>
@@ -30,7 +30,8 @@ void HELPER(exception)(CPUOpenRISCState *env, uint32_t ex=
cp)<br>
=C2=A0 =C2=A0 =C2=A0raise_exception(cpu, excp);<br>
=C2=A0}<br>
<br>
-static void QEMU_NORETURN do_range(CPUOpenRISCState *env, uintptr_t pc)<br=
>
+static G_NORETURN<br>
+void do_range(CPUOpenRISCState *env, uintptr_t pc)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0CPUState *cs =3D env_cpu(env);<br>
<br>
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c<br>
index 1a75ba11e68f..df3573688325 100644<br>
--- a/target/riscv/op_helper.c<br>
+++ b/target/riscv/op_helper.c<br>
@@ -24,8 +24,8 @@<br>
=C2=A0#include &quot;exec/helper-proto.h&quot;<br>
<br>
=C2=A0/* Exceptions processing helpers */<br>
-void QEMU_NORETURN riscv_raise_exception(CPURISCVState *env,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u=
int32_t exception, uintptr_t pc)<br>
+G_NORETURN void riscv_raise_exception(CPURISCVState *env,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t except=
ion, uintptr_t pc)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0CPUState *cs =3D env_cpu(env);<br>
=C2=A0 =C2=A0 =C2=A0cs-&gt;exception_index =3D exception;<br>
diff --git a/target/rx/op_helper.c b/target/rx/op_helper.c<br>
index 11f952d34099..76a746300e46 100644<br>
--- a/target/rx/op_helper.c<br>
+++ b/target/rx/op_helper.c<br>
@@ -24,8 +24,9 @@<br>
=C2=A0#include &quot;exec/cpu_ldst.h&quot;<br>
=C2=A0#include &quot;fpu/softfloat.h&quot;<br>
<br>
-static inline void QEMU_NORETURN raise_exception(CPURXState *env, int inde=
x,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0uintptr_t retaddr);<br>
+static inline G_NORETURN<br>
+void raise_exception(CPURXState *env, int index,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0uintptr_t retaddr);<br>
<br>
=C2=A0static void _set_psw(CPURXState *env, uint32_t psw, uint32_t rte)<br>
=C2=A0{<br>
@@ -418,8 +419,9 @@ uint32_t helper_divu(CPURXState *env, uint32_t num, uin=
t32_t den)<br>
=C2=A0}<br>
<br>
=C2=A0/* exception */<br>
-static inline void QEMU_NORETURN raise_exception(CPURXState *env, int inde=
x,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0uintptr_t retaddr)<br>
+static inline G_NORETURN<br>
+void raise_exception(CPURXState *env, int index,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0uintptr_t retaddr)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0CPUState *cs =3D env_cpu(env);<br>
<br>
@@ -427,22 +429,22 @@ static inline void QEMU_NORETURN raise_exception(CPUR=
XState *env, int index,<br>
=C2=A0 =C2=A0 =C2=A0cpu_loop_exit_restore(cs, retaddr);<br>
=C2=A0}<br>
<br>
-void QEMU_NORETURN helper_raise_privilege_violation(CPURXState *env)<br>
+G_NORETURN void helper_raise_privilege_violation(CPURXState *env)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0raise_exception(env, 20, GETPC());<br>
=C2=A0}<br>
<br>
-void QEMU_NORETURN helper_raise_access_fault(CPURXState *env)<br>
+G_NORETURN void helper_raise_access_fault(CPURXState *env)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0raise_exception(env, 21, GETPC());<br>
=C2=A0}<br>
<br>
-void QEMU_NORETURN helper_raise_illegal_instruction(CPURXState *env)<br>
+G_NORETURN void helper_raise_illegal_instruction(CPURXState *env)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0raise_exception(env, 23, GETPC());<br>
=C2=A0}<br>
<br>
-void QEMU_NORETURN helper_wait(CPURXState *env)<br>
+G_NORETURN void helper_wait(CPURXState *env)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0CPUState *cs =3D env_cpu(env);<br>
<br>
@@ -451,12 +453,12 @@ void QEMU_NORETURN helper_wait(CPURXState *env)<br>
=C2=A0 =C2=A0 =C2=A0raise_exception(env, EXCP_HLT, 0);<br>
=C2=A0}<br>
<br>
-void QEMU_NORETURN helper_rxint(CPURXState *env, uint32_t vec)<br>
+G_NORETURN void helper_rxint(CPURXState *env, uint32_t vec)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0raise_exception(env, 0x100 + vec, 0);<br>
=C2=A0}<br>
<br>
-void QEMU_NORETURN helper_rxbrk(CPURXState *env)<br>
+G_NORETURN void helper_rxbrk(CPURXState *env)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0raise_exception(env, 0x100, 0);<br>
=C2=A0}<br>
diff --git a/target/s390x/tcg/excp_helper.c b/target/s390x/tcg/excp_helper.=
c<br>
index be6c966cfa4c..29ccf70df147 100644<br>
--- a/target/s390x/tcg/excp_helper.c<br>
+++ b/target/s390x/tcg/excp_helper.c<br>
@@ -34,8 +34,8 @@<br>
=C2=A0#include &quot;hw/boards.h&quot;<br>
=C2=A0#endif<br>
<br>
-void QEMU_NORETURN tcg_s390_program_interrupt(CPUS390XState *env,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 uint32_t code, uintptr_t ra)<br>
+G_NORETURN void tcg_s390_program_interrupt(CPUS390XState *env,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0uint32_t code, uintptr_t ra)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0CPUState *cs =3D env_cpu(env);<br>
<br>
@@ -46,8 +46,8 @@ void QEMU_NORETURN tcg_s390_program_interrupt(CPUS390XSta=
te *env,<br>
=C2=A0 =C2=A0 =C2=A0cpu_loop_exit(cs);<br>
=C2=A0}<br>
<br>
-void QEMU_NORETURN tcg_s390_data_exception(CPUS390XState *env, uint32_t dx=
c,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0uintptr_t ra)<br>
+G_NORETURN void tcg_s390_data_exception(CPUS390XState *env, uint32_t dxc,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uintptr_=
t ra)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0g_assert(dxc &lt;=3D 0xff);<br>
=C2=A0#if !defined(CONFIG_USER_ONLY)<br>
@@ -63,8 +63,8 @@ void QEMU_NORETURN tcg_s390_data_exception(CPUS390XState =
*env, uint32_t dxc,<br>
=C2=A0 =C2=A0 =C2=A0tcg_s390_program_interrupt(env, PGM_DATA, ra);<br>
=C2=A0}<br>
<br>
-void QEMU_NORETURN tcg_s390_vector_exception(CPUS390XState *env, uint32_t =
vxc,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0uintptr_t ra)<br>
+G_NORETURN void tcg_s390_vector_exception(CPUS390XState *env, uint32_t vxc=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u=
intptr_t ra)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0g_assert(vxc &lt;=3D 0xff);<br>
=C2=A0#if !defined(CONFIG_USER_ONLY)<br>
@@ -88,7 +88,8 @@ void HELPER(data_exception)(CPUS390XState *env, uint32_t =
dxc)<br>
=C2=A0 * this is only for the atomic operations, for which we want to raise=
 a<br>
=C2=A0 * specification exception.<br>
=C2=A0 */<br>
-static void QEMU_NORETURN do_unaligned_access(CPUState *cs, uintptr_t reta=
ddr)<br>
+static G_NORETURN<br>
+void do_unaligned_access(CPUState *cs, uintptr_t retaddr)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0S390CPU *cpu =3D S390_CPU(cs);<br>
=C2=A0 =C2=A0 =C2=A0CPUS390XState *env =3D &amp;cpu-&gt;env;<br>
@@ -620,9 +621,10 @@ void s390x_cpu_do_unaligned_access(CPUState *cs, vaddr=
 addr,<br>
=C2=A0 =C2=A0 =C2=A0do_unaligned_access(cs, retaddr);<br>
=C2=A0}<br>
<br>
-static void QEMU_NORETURN monitor_event(CPUS390XState *env,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t=
 monitor_code,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint8_t =
monitor_class, uintptr_t ra)<br>
+static G_NORETURN<br>
+void monitor_event(CPUS390XState *env,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint6=
4_t monitor_code,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint8=
_t monitor_class, uintptr_t ra)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0/* Store the Monitor Code and the Monitor Class Number =
into the lowcore */<br>
=C2=A0 =C2=A0 =C2=A0stq_phys(env_cpu(env)-&gt;as,<br>
diff --git a/target/sh4/op_helper.c b/target/sh4/op_helper.c<br>
index 752669825f02..a663335c39ae 100644<br>
--- a/target/sh4/op_helper.c<br>
+++ b/target/sh4/op_helper.c<br>
@@ -57,8 +57,9 @@ void helper_ldtlb(CPUSH4State *env)<br>
=C2=A0#endif<br>
=C2=A0}<br>
<br>
-static inline void QEMU_NORETURN raise_exception(CPUSH4State *env, int ind=
ex,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0uintptr_t retaddr)<br>
+static inline G_NORETURN<br>
+void raise_exception(CPUSH4State *env, int index,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0uintptr_t retaddr)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0CPUState *cs =3D env_cpu(env);<br>
<br>
diff --git a/target/sparc/mmu_helper.c b/target/sparc/mmu_helper.c<br>
index 346a6dfa3537..919448a49401 100644<br>
--- a/target/sparc/mmu_helper.c<br>
+++ b/target/sparc/mmu_helper.c<br>
@@ -925,10 +925,10 @@ hwaddr sparc_cpu_get_phys_page_debug(CPUState *cs, va=
ddr addr)<br>
=C2=A0}<br>
<br>
=C2=A0#ifndef CONFIG_USER_ONLY<br>
-void QEMU_NORETURN sparc_cpu_do_unaligned_access(CPUState *cs, vaddr addr,=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0MMUAccessType access_type,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0int mmu_idx,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0uintptr_t retaddr)<br>
+G_NORETURN void sparc_cpu_do_unaligned_access(CPUState *cs, vaddr addr,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 MMUAccessType access_type,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 int mmu_idx,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 uintptr_t retaddr)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0SPARCCPU *cpu =3D SPARC_CPU(cs);<br>
=C2=A0 =C2=A0 =C2=A0CPUSPARCState *env =3D &amp;cpu-&gt;env;<br>
diff --git a/target/tricore/op_helper.c b/target/tricore/op_helper.c<br>
index 9476d10d0065..a79c838a92cc 100644<br>
--- a/target/tricore/op_helper.c<br>
+++ b/target/tricore/op_helper.c<br>
@@ -25,9 +25,9 @@<br>
<br>
=C2=A0/* Exception helpers */<br>
<br>
-static void QEMU_NORETURN<br>
-raise_exception_sync_internal(CPUTriCoreState *env, uint32_t class, int ti=
n,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uintptr_t pc, uint32_t fcd_pc)<br>
+static G_NORETURN<br>
+void raise_exception_sync_internal(CPUTriCoreState *env, uint32_t class, i=
nt tin,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uintptr_t pc, uint32_t =
fcd_pc)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0CPUState *cs =3D env_cpu(env);<br>
=C2=A0 =C2=A0 =C2=A0/* in case we come from a helper-call we need to restor=
e the PC */<br>
diff --git a/tcg/tcg.c b/tcg/tcg.c<br>
index f8542529d030..6196c2ee4124 100644<br>
--- a/tcg/tcg.c<br>
+++ b/tcg/tcg.c<br>
@@ -320,7 +320,8 @@ static void set_jmp_reset_offset(TCGContext *s, int whi=
ch)<br>
=C2=A0}<br>
<br>
=C2=A0/* Signal overflow, starting over with fewer guest insns. */<br>
-static void QEMU_NORETURN tcg_raise_tb_overflow(TCGContext *s)<br>
+static G_NORETURN<br>
+void tcg_raise_tb_overflow(TCGContext *s)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0siglongjmp(s-&gt;jmp_trans, -2);<br>
=C2=A0}<br>
diff --git a/tests/fp/fp-bench.c b/tests/fp/fp-bench.c<br>
index c24baf85350a..8ce0ca1545d1 100644<br>
--- a/tests/fp/fp-bench.c<br>
+++ b/tests/fp/fp-bench.c<br>
@@ -545,7 +545,8 @@ static int round_name_to_mode(const char *name)<br>
=C2=A0 =C2=A0 =C2=A0return -1;<br>
=C2=A0}<br>
<br>
-static void QEMU_NORETURN die_host_rounding(enum rounding rounding)<br>
+static G_NORETURN<br>
+void die_host_rounding(enum rounding rounding)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0fprintf(stderr, &quot;fatal: &#39;%s&#39; rounding not =
supported on this host\n&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0round_names[rounding]);<br>
diff --git a/tests/fp/fp-test.c b/tests/fp/fp-test.c<br>
index 352dd71c44fa..35829ad5f71e 100644<br>
--- a/tests/fp/fp-test.c<br>
+++ b/tests/fp/fp-test.c<br>
@@ -921,7 +921,8 @@ static void parse_args(int argc, char *argv[])<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
-static void QEMU_NORETURN run_test(void)<br>
+static G_NORETURN<br>
+void run_test(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0unsigned int i;<br>
<br>
diff --git a/scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" ta=
rget=3D"_blank">checkpatch.pl</a> b/scripts/<a href=3D"http://checkpatch.pl=
" rel=3D"noreferrer" target=3D"_blank">checkpatch.pl</a><br>
index 910a6c74dff9..4763d02ae78f 100755<br>
--- a/scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" target=3D=
"_blank">checkpatch.pl</a><br>
+++ b/scripts/<a href=3D"http://checkpatch.pl" rel=3D"noreferrer" target=3D=
"_blank">checkpatch.pl</a><br>
@@ -223,7 +223,7 @@ our $Sparse =3D qr{<br>
=C2=A0our $Attribute =3D qr{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 const|<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 volatile|<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0QEMU_NORETURN|<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0G_NORETURN|<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 G_GNUC_WARN_UNUSED_RESULT|<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 G_GNUC_NULL_TERMINATED|<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 QEMU_PACKED|<br>
-- <br>
2.35.1.693.g805e0a68082a<br>
<br>
</blockquote></div></div>

--00000000000068d6b905dd16c234--

