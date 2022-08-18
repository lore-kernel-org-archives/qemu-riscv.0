Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oOWzJ-0005BI-HZ
	for mharc-qemu-riscv@gnu.org; Thu, 18 Aug 2022 00:18:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oOWyo-000570-QL; Thu, 18 Aug 2022 00:18:21 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:42928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oOWym-0007eQ-Ko; Thu, 18 Aug 2022 00:18:02 -0400
Received: by mail-pf1-x430.google.com with SMTP id o7so468338pfb.9;
 Wed, 17 Aug 2022 21:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=RRXULwuI83NG8U8May4R7T2+NAOiaVvaNyB07bTxYBI=;
 b=EpJEQJCuDIXgfrOEo9mlIxvJYUObtgiJCesEQTFPzDAHjvbjNZLoagaomL4Ww4wptw
 Md122bBSi1g7+YVDfQbJa3sSeITPcJ+S1aJKGrsBCqddIhAM2WjnmwBG1udwmoIIQL2Z
 bTBkgOL9NMkSvLafX6L8nFAQNcf+GP1Ut/+IgKt7UssAwqFxFAAB77kHz6VxV4UP8wMY
 qBAtBlzSo3QbcYBWbdjQecs+4k5ROcXkuFHxtH6jmY4EL1YQZVZaPnQuz6ldHRLQPAPu
 y2IGtd5cncSDSHcx5EdhViLX8IeUAzQnPFBns39jxH6uLCw2Ox0c+fcOXcXcJKk7BdEW
 9zhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=RRXULwuI83NG8U8May4R7T2+NAOiaVvaNyB07bTxYBI=;
 b=R9yz6vA1bVQI2jOcPifW7fkTk9uEvs0MgN/lhVuERMdMYOs+/vKv162IL/dY4r1qrv
 xool+rRQPUVkulbx54zznqqRTVjNojQDhAgcFC2b9rwbQ7re/c+9ZnYKsviwBVTQKZGA
 VdhvwrU5r3BUAFGlzJCKnVeOldn5B21/scldybINODG4P4jVvdsCyKGXNQ5NLWXOgSUT
 tMJ9NSp+m1F2h/19zqeXM1hqHbkkzew4OQJQfHlEVQK5N+lbP7/9CGeri+XAHTawxDdB
 q4HgTYSsaKi8gMRVQfjdg9AZCTwPxWPmcQi5R0O5bhIhGE7NEPf+0qj7Uf8+hTnZPi4o
 EfLw==
X-Gm-Message-State: ACgBeo3zYkHvq77lUhe6cIoQUetV9pHs6WEQceDCX1a0q3qHriClwb2y
 35XiczXGtG2uUTeoSd5hdlJmIjv5iSXUyQ30z6Q=
X-Google-Smtp-Source: AA6agR5CuXnDTE3w8fhNpJcp5nc3akl5kzsPyA2iCm18NrQRiTHBjwrC/9OauXxetIvmHyo8DH5DZ3i99uCJQGhMsFA=
X-Received: by 2002:a05:6a00:88e:b0:52c:65a3:fdb4 with SMTP id
 q14-20020a056a00088e00b0052c65a3fdb4mr1218936pfj.83.1660796278330; Wed, 17
 Aug 2022 21:17:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220815190303.2061559-1-peter.maydell@linaro.org>
 <20220815190303.2061559-2-peter.maydell@linaro.org>
In-Reply-To: <20220815190303.2061559-2-peter.maydell@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 18 Aug 2022 14:17:31 +1000
Message-ID: <CAKmqyKNiU72_fykg5H6KgijippvyuMinx3kFwQziSzNU+myFbQ@mail.gmail.com>
Subject: Re: [PATCH 1/7] semihosting: Allow optional use of semihosting from
 userspace
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, 
 Stefan Pejic <stefan.pejic@syrmia.com>, Chris Wulff <crwulff@gmail.com>,
 Marek Vasut <marex@denx.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Max Filippov <jcmvbkbc@gmail.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Furquan Shaikh <furquan@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=alistair23@gmail.com; helo=mail-pf1-x430.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 18 Aug 2022 04:18:31 -0000

On Tue, Aug 16, 2022 at 5:03 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Currently our semihosting implementations generally prohibit use of
> semihosting calls in system emulation from the guest userspace.  This
> is a very long standing behaviour justified originally "to provide
> some semblance of security" (since code with access to the
> semihosting ABI can do things like read and write arbitrary files on
> the host system).  However, it is sometimes useful to be able to run
> trusted guest code which performs semihosting calls from guest
> userspace, notably for test code.  Add a command line suboption to
> the existing semihosting-config option group so that you can
> explicitly opt in to semihosting from guest userspace with
>  -semihosting-config userspace=on
>
> (There is no equivalent option for the user-mode emulator, because
> there by definition all code runs in userspace and has access to
> semihosting already.)
>
> This commit adds the infrastructure for the command line option and
> adds a bool 'is_user' parameter to the function
> semihosting_userspace_enabled() that target code can use to check
> whether it should be permitting the semihosting call for userspace.
> It mechanically makes all the callsites pass 'false', so they
> continue checking "is semihosting enabled in general".  Subsequent
> commits will make each target that implements semihosting honour the
> userspace=on option by passing the correct value and removing
> whatever "don't do this for userspace" checking they were doing by
> hand.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/semihosting/semihost.h | 10 ++++++++--
>  semihosting/config.c           | 10 ++++++++--
>  softmmu/vl.c                   |  2 +-
>  stubs/semihost.c               |  2 +-
>  target/arm/translate-a64.c     |  2 +-
>  target/arm/translate.c         |  6 +++---
>  target/m68k/op_helper.c        |  2 +-
>  target/nios2/translate.c       |  2 +-
>  target/xtensa/translate.c      |  6 +++---
>  qemu-options.hx                | 11 +++++++++--
>  10 files changed, 36 insertions(+), 17 deletions(-)
>
> diff --git a/include/semihosting/semihost.h b/include/semihosting/semihost.h
> index 93a3c21b44d..efd2efa25ae 100644
> --- a/include/semihosting/semihost.h
> +++ b/include/semihosting/semihost.h
> @@ -27,7 +27,7 @@ typedef enum SemihostingTarget {
>  } SemihostingTarget;
>
>  #ifdef CONFIG_USER_ONLY
> -static inline bool semihosting_enabled(void)
> +static inline bool semihosting_enabled(bool is_user)
>  {
>      return true;
>  }
> @@ -52,7 +52,13 @@ static inline const char *semihosting_get_cmdline(void)
>      return NULL;
>  }
>  #else /* !CONFIG_USER_ONLY */
> -bool semihosting_enabled(void);
> +/**
> + * semihosting_enabled:
> + * @is_user: true if guest code is in usermode (i.e. not privileged)
> + *
> + * Return true if guest code is allowed to make semihosting calls.
> + */
> +bool semihosting_enabled(bool is_user);
>  SemihostingTarget semihosting_get_target(void);
>  const char *semihosting_get_arg(int i);
>  int semihosting_get_argc(void);
> diff --git a/semihosting/config.c b/semihosting/config.c
> index e171d4d6bc3..89a17596879 100644
> --- a/semihosting/config.c
> +++ b/semihosting/config.c
> @@ -34,6 +34,9 @@ QemuOptsList qemu_semihosting_config_opts = {
>          {
>              .name = "enable",
>              .type = QEMU_OPT_BOOL,
> +        }, {
> +            .name = "userspace",
> +            .type = QEMU_OPT_BOOL,
>          }, {
>              .name = "target",
>              .type = QEMU_OPT_STRING,
> @@ -50,6 +53,7 @@ QemuOptsList qemu_semihosting_config_opts = {
>
>  typedef struct SemihostingConfig {
>      bool enabled;
> +    bool userspace_enabled;
>      SemihostingTarget target;
>      char **argv;
>      int argc;
> @@ -59,9 +63,9 @@ typedef struct SemihostingConfig {
>  static SemihostingConfig semihosting;
>  static const char *semihost_chardev;
>
> -bool semihosting_enabled(void)
> +bool semihosting_enabled(bool is_user)
>  {
> -    return semihosting.enabled;
> +    return semihosting.enabled && (!is_user || semihosting.userspace_enabled);
>  }
>
>  SemihostingTarget semihosting_get_target(void)
> @@ -137,6 +141,8 @@ int qemu_semihosting_config_options(const char *optarg)
>      if (opts != NULL) {
>          semihosting.enabled = qemu_opt_get_bool(opts, "enable",
>                                                  true);
> +        semihosting.userspace_enabled = qemu_opt_get_bool(opts, "userspace",
> +                                                          false);
>          const char *target = qemu_opt_get(opts, "target");
>          /* setup of chardev is deferred until they are initialised */
>          semihost_chardev = qemu_opt_get(opts, "chardev");
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 706bd7cff79..3593f1d7821 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -1822,7 +1822,7 @@ static void qemu_apply_machine_options(QDict *qdict)
>  {
>      object_set_properties_from_keyval(OBJECT(current_machine), qdict, false, &error_fatal);
>
> -    if (semihosting_enabled() && !semihosting_get_argc()) {
> +    if (semihosting_enabled(false) && !semihosting_get_argc()) {
>          /* fall back to the -kernel/-append */
>          semihosting_arg_fallback(current_machine->kernel_filename, current_machine->kernel_cmdline);
>      }
> diff --git a/stubs/semihost.c b/stubs/semihost.c
> index f486651afbb..d65c9fd5dcf 100644
> --- a/stubs/semihost.c
> +++ b/stubs/semihost.c
> @@ -23,7 +23,7 @@ QemuOptsList qemu_semihosting_config_opts = {
>  };
>
>  /* Queries to config status default to off */
> -bool semihosting_enabled(void)
> +bool semihosting_enabled(bool is_user)
>  {
>      return false;
>  }
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index 163df8c6157..3decc8da573 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -2219,7 +2219,7 @@ static void disas_exc(DisasContext *s, uint32_t insn)
>           * it is required for halting debug disabled: it will UNDEF.
>           * Secondly, "HLT 0xf000" is the A64 semihosting syscall instruction.
>           */
> -        if (semihosting_enabled() && imm16 == 0xf000) {
> +        if (semihosting_enabled(false) && imm16 == 0xf000) {
>  #ifndef CONFIG_USER_ONLY
>              /* In system mode, don't allow userspace access to semihosting,
>               * to provide some semblance of security (and for consistency
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index ad617b99481..b85be8a818d 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -1169,7 +1169,7 @@ static inline void gen_hlt(DisasContext *s, int imm)
>       * semihosting, to provide some semblance of security
>       * (and for consistency with our 32-bit semihosting).
>       */
> -    if (semihosting_enabled() &&
> +    if (semihosting_enabled(false) &&
>  #ifndef CONFIG_USER_ONLY
>          s->current_el != 0 &&
>  #endif
> @@ -6556,7 +6556,7 @@ static bool trans_BKPT(DisasContext *s, arg_BKPT *a)
>      /* BKPT is OK with ECI set and leaves it untouched */
>      s->eci_handled = true;
>      if (arm_dc_feature(s, ARM_FEATURE_M) &&
> -        semihosting_enabled() &&
> +        semihosting_enabled(false) &&
>  #ifndef CONFIG_USER_ONLY
>          !IS_USER(s) &&
>  #endif
> @@ -8764,7 +8764,7 @@ static bool trans_SVC(DisasContext *s, arg_SVC *a)
>  {
>      const uint32_t semihost_imm = s->thumb ? 0xab : 0x123456;
>
> -    if (!arm_dc_feature(s, ARM_FEATURE_M) && semihosting_enabled() &&
> +    if (!arm_dc_feature(s, ARM_FEATURE_M) && semihosting_enabled(false) &&
>  #ifndef CONFIG_USER_ONLY
>          !IS_USER(s) &&
>  #endif
> diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
> index d9937ca8dc5..4b3dfec1306 100644
> --- a/target/m68k/op_helper.c
> +++ b/target/m68k/op_helper.c
> @@ -203,7 +203,7 @@ static void cf_interrupt_all(CPUM68KState *env, int is_hw)
>              cf_rte(env);
>              return;
>          case EXCP_HALT_INSN:
> -            if (semihosting_enabled()
> +            if (semihosting_enabled(false)
>                      && (env->sr & SR_S) != 0
>                      && (env->pc & 3) == 0
>                      && cpu_lduw_code(env, env->pc - 4) == 0x4e71
> diff --git a/target/nios2/translate.c b/target/nios2/translate.c
> index 3a037a68cc4..2b556683422 100644
> --- a/target/nios2/translate.c
> +++ b/target/nios2/translate.c
> @@ -818,7 +818,7 @@ static void gen_break(DisasContext *dc, uint32_t code, uint32_t flags)
>  #ifndef CONFIG_USER_ONLY
>      /* The semihosting instruction is "break 1".  */
>      R_TYPE(instr, code);
> -    if (semihosting_enabled() && instr.imm5 == 1) {
> +    if (semihosting_enabled(false) && instr.imm5 == 1) {
>          t_gen_helper_raise_exception(dc, EXCP_SEMIHOST);
>          return;
>      }
> diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
> index 70e11eeb459..dc475a4274b 100644
> --- a/target/xtensa/translate.c
> +++ b/target/xtensa/translate.c
> @@ -2364,9 +2364,9 @@ static uint32_t test_exceptions_simcall(DisasContext *dc,
>      bool ill = true;
>  #else
>      /* Between RE.2 and RE.3 simcall opcode's become nop for the hardware. */
> -    bool ill = dc->config->hw_version <= 250002 && !semihosting_enabled();
> +    bool ill = dc->config->hw_version <= 250002 && !semihosting_enabled(false);
>  #endif
> -    if (ill || !semihosting_enabled()) {
> +    if (ill || !semihosting_enabled(false)) {
>          qemu_log_mask(LOG_GUEST_ERROR, "SIMCALL but semihosting is disabled\n");
>      }
>      return ill ? XTENSA_OP_ILL : 0;
> @@ -2376,7 +2376,7 @@ static void translate_simcall(DisasContext *dc, const OpcodeArg arg[],
>                                const uint32_t par[])
>  {
>  #ifndef CONFIG_USER_ONLY
> -    if (semihosting_enabled()) {
> +    if (semihosting_enabled(false)) {
>          gen_helper_simcall(cpu_env);
>      }
>  #endif
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 3f23a42fa87..4e7111abe3d 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -4614,12 +4614,12 @@ SRST
>      information about the facilities this enables.
>  ERST
>  DEF("semihosting-config", HAS_ARG, QEMU_OPTION_semihosting_config,
> -    "-semihosting-config [enable=on|off][,target=native|gdb|auto][,chardev=id][,arg=str[,...]]\n" \
> +    "-semihosting-config [enable=on|off][,target=native|gdb|auto][,chardev=id][,userspace=on|off][,arg=str[,...]]\n" \
>      "                semihosting configuration\n",
>  QEMU_ARCH_ARM | QEMU_ARCH_M68K | QEMU_ARCH_XTENSA |
>  QEMU_ARCH_MIPS | QEMU_ARCH_NIOS2 | QEMU_ARCH_RISCV)
>  SRST
> -``-semihosting-config [enable=on|off][,target=native|gdb|auto][,chardev=id][,arg=str[,...]]``
> +``-semihosting-config [enable=on|off][,target=native|gdb|auto][,chardev=id][,userspace=on|off][,arg=str[,...]]``
>      Enable and configure semihosting (ARM, M68K, Xtensa, MIPS, Nios II, RISC-V
>      only).
>
> @@ -4646,6 +4646,13 @@ SRST
>          Send the output to a chardev backend output for native or auto
>          output when not in gdb
>
> +    ``userspace=on|off``
> +        Allows code running in guest userspace to access the semihosting
> +        interface. The default is that only privileged guest code can
> +        make semihosting calls. Note that setting ``userspace=on`` should
> +        only be used if all guest code is trusted (for example, in
> +        bare-metal test case code).
> +
>      ``arg=str1,arg=str2,...``
>          Allows the user to pass input arguments, and can be used
>          multiple times to build up a list. The old-style
> --
> 2.25.1
>
>

