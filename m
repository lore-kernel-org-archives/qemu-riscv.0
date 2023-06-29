Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24078C0015E
	for <qemu-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 21:44:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qEzQs-0003Zv-0O; Thu, 29 Jun 2023 17:44:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1qEzQq-0003ZO-DP
 for qemu-riscv@nongnu.org; Thu, 29 Jun 2023 17:44:04 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1qEzQn-0005ld-Iw
 for qemu-riscv@nongnu.org; Thu, 29 Jun 2023 17:44:04 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-262b213eddfso745244a91.0
 for <qemu-riscv@nongnu.org>; Thu, 29 Jun 2023 14:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1688075039; x=1690667039; 
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:from:to:cc:subject:date:message-id
 :reply-to; bh=QwM21UwN81jlsQLYWZtwjqJczjMPASUCCGjwudzA6uw=;
 b=YZbvaTe8w2BBrYZyHOYV3ChEG4Qpx7YxtZUajBAELi8b+rtLZPhyBbLIy+OhiZhjIl
 ppQoOIRjWVuJ6Dt7D+x3muOScC4x0lk1Tq8vNkd24NdZ3kInSWc/Y4zxW09Mab4zk1Y/
 x/TRINxQXgXARESrQV41IgGIuVTBZ8ywuFd1rrZDOthjLcC/8XIf37PwV8yotMoionx0
 Xq0o2sNO8CylwREplrOPPt65lFAGnSTpUrEk5+MSdPTtO3UigpBO1HoWH5byZXKLsyNN
 YeBMi7RG/K/x8ZQAvP9R618Vq6QNrUdholZSWPKXhpbMlf8kGJBVd37mG5hR2MTlE1sH
 deXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688075039; x=1690667039;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QwM21UwN81jlsQLYWZtwjqJczjMPASUCCGjwudzA6uw=;
 b=IMtimjUwwPJ/u6/MajxBaefFgyoDz2+WZpb+E0mRnZSfP7Cz1w3H+S/Kmfu6Flng8r
 0r6iFsnPI+O2ybv9QGMg5+9okfaTS/tPVGtFZ9Z59HWhV7ALXtt8Iua+hQrVCldqlEVk
 snwFw77aSxAJCSOafSvefv8O4uDKx26ojvYMhi/TCQ1Y8l5JPgnObbrlT92m6Ls++iUG
 a5MfhhazxO8XXH3XfyngnTiR7pXoH0qMQij1l2NpRMXnIVYPFtLHAQdoPNjQukq1kTst
 w2elsLfLDZ5Dk/bxAXxKqZdCYBLVL4rIqClangWIew/uIV8TiZkP2kotrWwNMYvr/7ln
 7h1A==
X-Gm-Message-State: AC+VfDz3mKm5npJv2MB9n+tGAFR2biB4iBD2isehJQfytGuoyHZmciTj
 WXym7X2PXcJOEck1J5k+w4i7pMZMVo5dY2PT1rc=
X-Google-Smtp-Source: APBJJlGtJ8vgDr4pvQFYY55kmxNoP/tHdP2i2zPEYYYq9++5kK30OhuU+NDkfqGNAgE5QlkXYgzJhQ==
X-Received: by 2002:a17:90a:1a1c:b0:263:341:6141 with SMTP id
 28-20020a17090a1a1c00b0026303416141mr1324946pjk.3.1688075039091; 
 Thu, 29 Jun 2023 14:43:59 -0700 (PDT)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 u4-20020a634544000000b0052c9d1533b6sm9332588pgk.56.2023.06.29.14.43.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jun 2023 14:43:58 -0700 (PDT)
Date: Thu, 29 Jun 2023 14:43:58 -0700 (PDT)
X-Google-Original-Date: Thu, 29 Jun 2023 14:43:15 PDT (-0700)
Subject: Re: [PATCH 1/1] linux-user: add support for big endian variants of
 riscv
In-Reply-To: <20230630111409.2819-2-rory.opensource@gmail.com>
CC: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, rory.opensource@gmail.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: rory.opensource@gmail.com
Message-ID: <mhng-d7972220-95c2-4ad9-a8ab-8386b089a37f@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=palmer@dabbelt.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Fri, 30 Jun 2023 04:14:09 PDT (-0700), rory.opensource@gmail.com wrote:
> RISCV architecture supports an optional big endian mode of operation.
> In this mode, data accesses are treated as big endian, while code is
> always in little endian format. This is similar to how the ARM
> architecture treats it's optional bi-endian support. This patch adds
> support for big endian RISCV operation to linux-user.

We don't have BE support in Linux yet.  IIRC we've had some other 
linux-user stuff go in with a "we'll change it to match whatever uABI 
Linux ends up with" sort of caveat, but I might be mistaken.  I'm not 
opposed to doing that sort of thing for BE as well.  I don't remember 
what the right way to indicate that is, though.

> Signed-off-by: rory.opensource@gmail.com
> ---
>  configs/targets/riscv64be-linux-user.mak    |  7 +++++++
>  configure                                   |  1 +
>  linux-user/elfload.c                        | 10 ++++++++++
>  linux-user/include/host/riscv/host-signal.h |  3 +++
>  linux-user/riscv/signal.c                   |  5 +++++
>  linux-user/riscv/target_syscall.h           |  8 ++++++++
>  scripts/probe-gdb-support.py                |  4 ++--
>  scripts/qemu-binfmt-conf.sh                 | 12 ++++++++++--
>  target/riscv/cpu.c                          |  5 +++++
>  target/riscv/translate.c                    | 13 +++++++++++++
>  10 files changed, 64 insertions(+), 4 deletions(-)
>  create mode 100644 configs/targets/riscv64be-linux-user.mak
>
> diff --git a/configs/targets/riscv64be-linux-user.mak b/configs/targets/riscv64be-linux-user.mak
> new file mode 100644
> index 0000000000..f22f5f0971
> --- /dev/null
> +++ b/configs/targets/riscv64be-linux-user.mak
> @@ -0,0 +1,7 @@
> +TARGET_ARCH=riscv64
> +TARGET_BASE_ARCH=riscv
> +TARGET_ABI_DIR=riscv
> +TARGET_BIG_ENDIAN=y
> +TARGET_XML_FILES= gdb-xml/riscv-64bit-cpu.xml gdb-xml/riscv-32bit-fpu.xml gdb-xml/riscv-64bit-fpu.xml gdb-xml/riscv-64bit-virtual.xml
> +CONFIG_SEMIHOSTING=y
> +CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
> diff --git a/configure b/configure
> index 2b41c49c0d..90795a0e9f 100755
> --- a/configure
> +++ b/configure
> @@ -1190,6 +1190,7 @@ fi
>  : ${cross_prefix_ppc64="powerpc64-linux-gnu-"}
>  : ${cross_prefix_ppc64le="$cross_prefix_ppc64"}
>  : ${cross_prefix_riscv64="riscv64-linux-gnu-"}
> +: ${cross_prefix_riscv64be="riscv64be-linux-gnu-"}
>  : ${cross_prefix_s390x="s390x-linux-gnu-"}
>  : ${cross_prefix_sh4="sh4-linux-gnu-"}
>  : ${cross_prefix_sparc64="sparc64-linux-gnu-"}
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index 9a2ec568b0..e0204c7069 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -1681,8 +1681,18 @@ static void elf_core_copy_regs(target_elf_gregset_t *regs,
>
>  #ifdef TARGET_RISCV32
>  #define ELF_CLASS ELFCLASS32
> +#if TARGET_BIG_ENDIAN
> +#define ELF_PLATFORM "riscv32be"
> +#else
> +#define ELF_PLATFORM "riscv32"
> +#endif
>  #else
>  #define ELF_CLASS ELFCLASS64
> +#if TARGET_BIG_ENDIAN
> +#define ELF_PLATFORM "riscv64be"
> +#else
> +#define ELF_PLATFORM "riscv64"
> +#endif
>  #endif
>
>  #define ELF_HWCAP get_elf_hwcap()
> diff --git a/linux-user/include/host/riscv/host-signal.h b/linux-user/include/host/riscv/host-signal.h
> index decacb2325..b3f2735261 100644
> --- a/linux-user/include/host/riscv/host-signal.h
> +++ b/linux-user/include/host/riscv/host-signal.h
> @@ -38,6 +38,9 @@ static inline bool host_signal_write(siginfo_t *info, host_sigcontext *uc)
>       */
>      const uint16_t *pinsn = (const uint16_t *)host_signal_pc(uc);
>      uint16_t insn = pinsn[0];
> +#if TARGET_BIG_ENDIAN
> +    insn = (insn << 8) | (insn >> 8);
> +#endif
>
>      /* 16-bit instructions */
>      switch (insn & 0xe003) {
> diff --git a/linux-user/riscv/signal.c b/linux-user/riscv/signal.c
> index eaa168199a..1d9e3413fb 100644
> --- a/linux-user/riscv/signal.c
> +++ b/linux-user/riscv/signal.c
> @@ -199,8 +199,13 @@ void setup_sigtramp(abi_ulong sigtramp_page)
>      uint32_t *tramp = lock_user(VERIFY_WRITE, sigtramp_page, 8, 0);
>      assert(tramp != NULL);
>
> +#if TARGET_BIG_ENDIAN
> +    __put_user(0x9308b008, tramp + 0);  /* li a7, 139 = __NR_rt_sigreturn */
> +    __put_user(0x73000000, tramp + 1);  /* ecall */
> +#else
>      __put_user(0x08b00893, tramp + 0);  /* li a7, 139 = __NR_rt_sigreturn */
>      __put_user(0x00000073, tramp + 1);  /* ecall */
> +#endif
>
>      default_rt_sigreturn = sigtramp_page;
>      unlock_user(tramp, sigtramp_page, 8);
> diff --git a/linux-user/riscv/target_syscall.h b/linux-user/riscv/target_syscall.h
> index 7601f10c28..88c0ac1351 100644
> --- a/linux-user/riscv/target_syscall.h
> +++ b/linux-user/riscv/target_syscall.h
> @@ -44,10 +44,18 @@ struct target_pt_regs {
>  };
>
>  #ifdef TARGET_RISCV32
> +#if TARGET_BIG_ENDIAN
> +#define UNAME_MACHINE "riscv32be"
> +#else
>  #define UNAME_MACHINE "riscv32"
> +#endif
>  #define UNAME_MINIMUM_RELEASE "5.4.0"
>  #else
> +#if TARGET_BIG_ENDIAN
> +#define UNAME_MACHINE "riscv64be"
> +#else
>  #define UNAME_MACHINE "riscv64"
> +#endif
>  #define UNAME_MINIMUM_RELEASE "4.15.0"
>  #endif
>
> diff --git a/scripts/probe-gdb-support.py b/scripts/probe-gdb-support.py
> index 5755255966..a1e0905a10 100644
> --- a/scripts/probe-gdb-support.py
> +++ b/scripts/probe-gdb-support.py
> @@ -41,8 +41,8 @@
>      "or1k" : "or1k",
>      "powerpc:common" : "ppc",
>      "powerpc:common64" : ["ppc64", "ppc64le"],
> -    "riscv:rv32" : "riscv32",
> -    "riscv:rv64" : "riscv64",
> +    "riscv:rv32" : ["riscv32", "riscv32be"],
> +    "riscv:rv64" : ["riscv64", "riscv64be"],
>      "s390:64-bit" : "s390x",
>      "sh4" : ["sh4", "sh4eb"],
>      "sparc": "sparc",
> diff --git a/scripts/qemu-binfmt-conf.sh b/scripts/qemu-binfmt-conf.sh
> index 6ef9f118d9..e1ee9f831b 100755
> --- a/scripts/qemu-binfmt-conf.sh
> +++ b/scripts/qemu-binfmt-conf.sh
> @@ -3,8 +3,8 @@
>
>  qemu_target_list="i386 i486 alpha arm armeb sparc sparc32plus sparc64 \
>  ppc ppc64 ppc64le m68k mips mipsel mipsn32 mipsn32el mips64 mips64el \
> -sh4 sh4eb s390x aarch64 aarch64_be hppa riscv32 riscv64 xtensa xtensaeb \
> -microblaze microblazeel or1k x86_64 hexagon loongarch64"
> +sh4 sh4eb s390x aarch64 aarch64_be hppa riscv32 riscv32be riscv64 riscv64be \
> +xtensa xtensaeb microblaze microblazeel or1k x86_64 hexagon loongarch64"
>
>  i386_magic='\x7fELF\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x03\x00'
>  i386_mask='\xff\xff\xff\xff\xff\xfe\xfe\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff'
> @@ -112,10 +112,18 @@ riscv32_magic='\x7fELF\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x
>  riscv32_mask='\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff'
>  riscv32_family=riscv
>
> +riscv32be_magic='\x7fELF\x01\x02\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\xf3'
> +riscv32be_mask='\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff'
> +riscv32be_family=riscv
> +
>  riscv64_magic='\x7fELF\x02\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\xf3\x00'
>  riscv64_mask='\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff'
>  riscv64_family=riscv
>
> +riscv64be_magic='\x7fELF\x02\x02\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\xf3'
> +riscv64be_mask='\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff'
> +riscv64be_family=riscv
> +
>  xtensa_magic='\x7fELF\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x5e\x00'
>  xtensa_mask='\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff'
>  xtensa_family=xtensa
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 881bddf393..26fb3e830d 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -873,6 +873,11 @@ static void riscv_cpu_disas_set_info(CPUState *s, disassemble_info *info)
>      default:
>          g_assert_not_reached();
>      }
> +#if TARGET_BIG_ENDIAN
> +    info->endian = BFD_ENDIAN_LITTLE;
> +#else
> +    info->endian = BFD_ENDIAN_BIG;
> +#endif
>  }
>
>  static void riscv_cpu_validate_v(CPURISCVState *env, RISCVCPUConfig *cfg,
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 8a33da811e..3991ff6be0 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -1157,9 +1157,16 @@ static void decode_opc(CPURISCVState *env, DisasContext *ctx, uint16_t opcode)
>          }
>      } else {
>          uint32_t opcode32 = opcode;
> +#if TARGET_BIG_ENDIAN
> +        opcode32 = bswap16(opcode);
> +#endif
>          opcode32 = deposit32(opcode32, 16, 16,
>                               translator_lduw(env, &ctx->base,
>                                               ctx->base.pc_next + 2));
> +#if TARGET_BIG_ENDIAN
> +        opcode32 = (opcode32) << 16 | (opcode32 >> 16);
> +        opcode32 = bswap32(opcode32);
> +#endif
>          ctx->opcode = opcode32;
>
>          for (size_t i = 0; i < ARRAY_SIZE(decoders); ++i) {
> @@ -1230,6 +1237,9 @@ static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
>      DisasContext *ctx = container_of(dcbase, DisasContext, base);
>      CPURISCVState *env = cpu->env_ptr;
>      uint16_t opcode16 = translator_lduw(env, &ctx->base, ctx->base.pc_next);
> +#if TARGET_BIG_ENDIAN
> +    opcode16 = bswap16(opcode16);
> +#endif
>
>      ctx->ol = ctx->xl;
>      decode_opc(env, ctx, opcode16);
> @@ -1244,6 +1254,9 @@ static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
>
>              if (page_ofs > TARGET_PAGE_SIZE - MAX_INSN_LEN) {
>                  uint16_t next_insn = cpu_lduw_code(env, ctx->base.pc_next);
> +#if TARGET_BIG_ENDIAN
> +                next_insn = bswap16(next_insn);
> +#endif
>                  int len = insn_len(next_insn);
>
>                  if (!is_same_page(&ctx->base, ctx->base.pc_next + len - 1)) {

Nothing's jumping out as wrong to me, but I haven't given BE much 
thought so I wouldn't be surprised if there's something wrong somewhere.  
I'm happy to look a bit deeper, but let's see if the unstable uABI stuff 
is OK with folks first?

