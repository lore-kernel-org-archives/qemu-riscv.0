Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E2FEB64DD
	for <qemu-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 03:23:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qNm9m-0006DW-Je; Sun, 23 Jul 2023 23:22:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qNm9l-0006DJ-2p; Sun, 23 Jul 2023 23:22:45 -0400
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qNm9j-0004Ik-10; Sun, 23 Jul 2023 23:22:44 -0400
Received: by mail-qk1-x72c.google.com with SMTP id
 af79cd13be357-76754b9eac0so359866485a.0; 
 Sun, 23 Jul 2023 20:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690168962; x=1690773762;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r0qNoTOJ06B18nPS86StGxVJB0tgPlkHUR9XNq8PiGs=;
 b=DX2s6RY6yiGV1GwwNne2XpGcAFefmxVmt+ZefonvfEUZKDJamcedxVIHM1ioOU0efi
 eobkYeNFFK2lldFRkETb+CMA+Gj66Q7rnIz5vSdFxKNA6w/HEoOgEBicz2hPGdDAgLAl
 OyduZ8o06gac8O+pe8Dy0zDuxm87repkUf5A2IP3/hz0WHEO8hJkRCBWoxTT3GtEEnsX
 UY5agdRu8Myno2C/V9uqzxSn0d8bPc7oAwXp2N2/EjBs00Ks0qCktnELKdD1eE6YUbVQ
 TzWipLXA/3ytyrguRP+Wzg98qaGeuS7stGJoeD+iNvOe7DxMOvNLTPejGRX17OwQFST9
 +gDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690168962; x=1690773762;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r0qNoTOJ06B18nPS86StGxVJB0tgPlkHUR9XNq8PiGs=;
 b=cW5yiJqHEFnJkdEFWmsY2TK6IilApNr67rFpKKIN74cZrZsPBngkkCuwzT7g1edfhT
 /qc4KlXeOwZdFu1Src2qFygWe1LztidNbWRY+4Ci13s4sosiGByWPJEUHAzCjNF6Gg8b
 odaqpLfWUWSqqqxGlXCEy+avxCSW0bM5Vz8oYBVE9izEOI3JoyFgg6gphj4HHOdn2Xub
 +qxDMb09OdbY447AUTBGTOvRilrm8gf+NDjJIy4qAdXDRbeg79+8p9ADySXoJa1B//s3
 mfOt6w70ZSA8O921kClSV0xLrqrwZdYVJZdUZgKZMRk0DbdMqig9+K74jzUPtzxr+Chg
 stzQ==
X-Gm-Message-State: ABy/qLY/MITJajFR6LRZQaM2T9Bsr/H6R88SJv9ki7gwziGZYyy9ROEN
 AfJhDEzjLShe7hoj6rNpuW1yDD7vNGlbLWrz5s4=
X-Google-Smtp-Source: APBJJlERKHe1DKYHaoESlBspo4hmI86CGIj6O/uVn/tVBuV5jVIircOZzWdKy/f9GXfXIiGCXR0AXkNSr5WmEBHDzPE=
X-Received: by 2002:a05:620a:127a:b0:767:cab9:4a7 with SMTP id
 b26-20020a05620a127a00b00767cab904a7mr6218920qkl.33.1690168961756; Sun, 23
 Jul 2023 20:22:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230630111409.2819-2-rory.opensource@gmail.com>
 <mhng-d7972220-95c2-4ad9-a8ab-8386b089a37f@palmer-ri-x1c9a>
In-Reply-To: <mhng-d7972220-95c2-4ad9-a8ab-8386b089a37f@palmer-ri-x1c9a>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 24 Jul 2023 13:22:15 +1000
Message-ID: <CAKmqyKP4uG1+iYny0nQdFzX-ETD8zXZJiCR_9_hixtsBqgZDbw@mail.gmail.com>
Subject: Re: [PATCH 1/1] linux-user: add support for big endian variants of
 riscv
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: rory.opensource@gmail.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=alistair23@gmail.com; helo=mail-qk1-x72c.google.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, FREEMAIL_REPLY=1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On Fri, Jun 30, 2023 at 7:45=E2=80=AFAM Palmer Dabbelt <palmer@dabbelt.com>=
 wrote:
>
> On Fri, 30 Jun 2023 04:14:09 PDT (-0700), rory.opensource@gmail.com wrote=
:
> > RISCV architecture supports an optional big endian mode of operation.
> > In this mode, data accesses are treated as big endian, while code is
> > always in little endian format. This is similar to how the ARM
> > architecture treats it's optional bi-endian support. This patch adds
> > support for big endian RISCV operation to linux-user.
>
> We don't have BE support in Linux yet.  IIRC we've had some other
> linux-user stuff go in with a "we'll change it to match whatever uABI
> Linux ends up with" sort of caveat, but I might be mistaken.  I'm not
> opposed to doing that sort of thing for BE as well.  I don't remember
> what the right way to indicate that is, though.
>
> > Signed-off-by: rory.opensource@gmail.com
> > ---
> >  configs/targets/riscv64be-linux-user.mak    |  7 +++++++
> >  configure                                   |  1 +
> >  linux-user/elfload.c                        | 10 ++++++++++
> >  linux-user/include/host/riscv/host-signal.h |  3 +++
> >  linux-user/riscv/signal.c                   |  5 +++++
> >  linux-user/riscv/target_syscall.h           |  8 ++++++++
> >  scripts/probe-gdb-support.py                |  4 ++--
> >  scripts/qemu-binfmt-conf.sh                 | 12 ++++++++++--
> >  target/riscv/cpu.c                          |  5 +++++
> >  target/riscv/translate.c                    | 13 +++++++++++++
> >  10 files changed, 64 insertions(+), 4 deletions(-)
> >  create mode 100644 configs/targets/riscv64be-linux-user.mak
> >
> > diff --git a/configs/targets/riscv64be-linux-user.mak b/configs/targets=
/riscv64be-linux-user.mak
> > new file mode 100644
> > index 0000000000..f22f5f0971
> > --- /dev/null
> > +++ b/configs/targets/riscv64be-linux-user.mak
> > @@ -0,0 +1,7 @@
> > +TARGET_ARCH=3Driscv64
> > +TARGET_BASE_ARCH=3Driscv
> > +TARGET_ABI_DIR=3Driscv
> > +TARGET_BIG_ENDIAN=3Dy
> > +TARGET_XML_FILES=3D gdb-xml/riscv-64bit-cpu.xml gdb-xml/riscv-32bit-fp=
u.xml gdb-xml/riscv-64bit-fpu.xml gdb-xml/riscv-64bit-virtual.xml
> > +CONFIG_SEMIHOSTING=3Dy
> > +CONFIG_ARM_COMPATIBLE_SEMIHOSTING=3Dy
> > diff --git a/configure b/configure
> > index 2b41c49c0d..90795a0e9f 100755
> > --- a/configure
> > +++ b/configure
> > @@ -1190,6 +1190,7 @@ fi
> >  : ${cross_prefix_ppc64=3D"powerpc64-linux-gnu-"}
> >  : ${cross_prefix_ppc64le=3D"$cross_prefix_ppc64"}
> >  : ${cross_prefix_riscv64=3D"riscv64-linux-gnu-"}
> > +: ${cross_prefix_riscv64be=3D"riscv64be-linux-gnu-"}
> >  : ${cross_prefix_s390x=3D"s390x-linux-gnu-"}
> >  : ${cross_prefix_sh4=3D"sh4-linux-gnu-"}
> >  : ${cross_prefix_sparc64=3D"sparc64-linux-gnu-"}
> > diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> > index 9a2ec568b0..e0204c7069 100644
> > --- a/linux-user/elfload.c
> > +++ b/linux-user/elfload.c
> > @@ -1681,8 +1681,18 @@ static void elf_core_copy_regs(target_elf_gregse=
t_t *regs,
> >
> >  #ifdef TARGET_RISCV32
> >  #define ELF_CLASS ELFCLASS32
> > +#if TARGET_BIG_ENDIAN
> > +#define ELF_PLATFORM "riscv32be"
> > +#else
> > +#define ELF_PLATFORM "riscv32"
> > +#endif
> >  #else
> >  #define ELF_CLASS ELFCLASS64
> > +#if TARGET_BIG_ENDIAN
> > +#define ELF_PLATFORM "riscv64be"
> > +#else
> > +#define ELF_PLATFORM "riscv64"
> > +#endif
> >  #endif
> >
> >  #define ELF_HWCAP get_elf_hwcap()
> > diff --git a/linux-user/include/host/riscv/host-signal.h b/linux-user/i=
nclude/host/riscv/host-signal.h
> > index decacb2325..b3f2735261 100644
> > --- a/linux-user/include/host/riscv/host-signal.h
> > +++ b/linux-user/include/host/riscv/host-signal.h
> > @@ -38,6 +38,9 @@ static inline bool host_signal_write(siginfo_t *info,=
 host_sigcontext *uc)
> >       */
> >      const uint16_t *pinsn =3D (const uint16_t *)host_signal_pc(uc);
> >      uint16_t insn =3D pinsn[0];
> > +#if TARGET_BIG_ENDIAN
> > +    insn =3D (insn << 8) | (insn >> 8);
> > +#endif
> >
> >      /* 16-bit instructions */
> >      switch (insn & 0xe003) {
> > diff --git a/linux-user/riscv/signal.c b/linux-user/riscv/signal.c
> > index eaa168199a..1d9e3413fb 100644
> > --- a/linux-user/riscv/signal.c
> > +++ b/linux-user/riscv/signal.c
> > @@ -199,8 +199,13 @@ void setup_sigtramp(abi_ulong sigtramp_page)
> >      uint32_t *tramp =3D lock_user(VERIFY_WRITE, sigtramp_page, 8, 0);
> >      assert(tramp !=3D NULL);
> >
> > +#if TARGET_BIG_ENDIAN
> > +    __put_user(0x9308b008, tramp + 0);  /* li a7, 139 =3D __NR_rt_sigr=
eturn */
> > +    __put_user(0x73000000, tramp + 1);  /* ecall */
> > +#else
> >      __put_user(0x08b00893, tramp + 0);  /* li a7, 139 =3D __NR_rt_sigr=
eturn */
> >      __put_user(0x00000073, tramp + 1);  /* ecall */
> > +#endif
> >
> >      default_rt_sigreturn =3D sigtramp_page;
> >      unlock_user(tramp, sigtramp_page, 8);
> > diff --git a/linux-user/riscv/target_syscall.h b/linux-user/riscv/targe=
t_syscall.h
> > index 7601f10c28..88c0ac1351 100644
> > --- a/linux-user/riscv/target_syscall.h
> > +++ b/linux-user/riscv/target_syscall.h
> > @@ -44,10 +44,18 @@ struct target_pt_regs {
> >  };
> >
> >  #ifdef TARGET_RISCV32
> > +#if TARGET_BIG_ENDIAN
> > +#define UNAME_MACHINE "riscv32be"
> > +#else
> >  #define UNAME_MACHINE "riscv32"
> > +#endif
> >  #define UNAME_MINIMUM_RELEASE "5.4.0"
> >  #else
> > +#if TARGET_BIG_ENDIAN
> > +#define UNAME_MACHINE "riscv64be"
> > +#else
> >  #define UNAME_MACHINE "riscv64"
> > +#endif
> >  #define UNAME_MINIMUM_RELEASE "4.15.0"
> >  #endif
> >
> > diff --git a/scripts/probe-gdb-support.py b/scripts/probe-gdb-support.p=
y
> > index 5755255966..a1e0905a10 100644
> > --- a/scripts/probe-gdb-support.py
> > +++ b/scripts/probe-gdb-support.py
> > @@ -41,8 +41,8 @@
> >      "or1k" : "or1k",
> >      "powerpc:common" : "ppc",
> >      "powerpc:common64" : ["ppc64", "ppc64le"],
> > -    "riscv:rv32" : "riscv32",
> > -    "riscv:rv64" : "riscv64",
> > +    "riscv:rv32" : ["riscv32", "riscv32be"],
> > +    "riscv:rv64" : ["riscv64", "riscv64be"],
> >      "s390:64-bit" : "s390x",
> >      "sh4" : ["sh4", "sh4eb"],
> >      "sparc": "sparc",
> > diff --git a/scripts/qemu-binfmt-conf.sh b/scripts/qemu-binfmt-conf.sh
> > index 6ef9f118d9..e1ee9f831b 100755
> > --- a/scripts/qemu-binfmt-conf.sh
> > +++ b/scripts/qemu-binfmt-conf.sh
> > @@ -3,8 +3,8 @@
> >
> >  qemu_target_list=3D"i386 i486 alpha arm armeb sparc sparc32plus sparc6=
4 \
> >  ppc ppc64 ppc64le m68k mips mipsel mipsn32 mipsn32el mips64 mips64el \
> > -sh4 sh4eb s390x aarch64 aarch64_be hppa riscv32 riscv64 xtensa xtensae=
b \
> > -microblaze microblazeel or1k x86_64 hexagon loongarch64"
> > +sh4 sh4eb s390x aarch64 aarch64_be hppa riscv32 riscv32be riscv64 risc=
v64be \
> > +xtensa xtensaeb microblaze microblazeel or1k x86_64 hexagon loongarch6=
4"
> >
> >  i386_magic=3D'\x7fELF\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\=
x02\x00\x03\x00'
> >  i386_mask=3D'\xff\xff\xff\xff\xff\xfe\xfe\x00\xff\xff\xff\xff\xff\xff\=
xff\xff\xfe\xff\xff\xff'
> > @@ -112,10 +112,18 @@ riscv32_magic=3D'\x7fELF\x01\x01\x01\x00\x00\x00\=
x00\x00\x00\x00\x00\x00\x02\x00\x
> >  riscv32_mask=3D'\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\x=
ff\xff\xff\xfe\xff\xff\xff'
> >  riscv32_family=3Driscv
> >
> > +riscv32be_magic=3D'\x7fELF\x01\x02\x01\x00\x00\x00\x00\x00\x00\x00\x00=
\x00\x00\x02\x00\xf3'
> > +riscv32be_mask=3D'\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff=
\xff\xff\xff\xff\xfe\xff\xff'
> > +riscv32be_family=3Driscv
> > +
> >  riscv64_magic=3D'\x7fELF\x02\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x=
00\x02\x00\xf3\x00'
> >  riscv64_mask=3D'\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\x=
ff\xff\xff\xfe\xff\xff\xff'
> >  riscv64_family=3Driscv
> >
> > +riscv64be_magic=3D'\x7fELF\x02\x02\x01\x00\x00\x00\x00\x00\x00\x00\x00=
\x00\x00\x02\x00\xf3'
> > +riscv64be_mask=3D'\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff=
\xff\xff\xff\xff\xfe\xff\xff'
> > +riscv64be_family=3Driscv
> > +
> >  xtensa_magic=3D'\x7fELF\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x0=
0\x02\x00\x5e\x00'
> >  xtensa_mask=3D'\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xf=
f\xff\xff\xfe\xff\xff\xff'
> >  xtensa_family=3Dxtensa
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index 881bddf393..26fb3e830d 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -873,6 +873,11 @@ static void riscv_cpu_disas_set_info(CPUState *s, =
disassemble_info *info)
> >      default:
> >          g_assert_not_reached();
> >      }
> > +#if TARGET_BIG_ENDIAN
> > +    info->endian =3D BFD_ENDIAN_LITTLE;
> > +#else
> > +    info->endian =3D BFD_ENDIAN_BIG;
> > +#endif
> >  }
> >
> >  static void riscv_cpu_validate_v(CPURISCVState *env, RISCVCPUConfig *c=
fg,
> > diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> > index 8a33da811e..3991ff6be0 100644
> > --- a/target/riscv/translate.c
> > +++ b/target/riscv/translate.c
> > @@ -1157,9 +1157,16 @@ static void decode_opc(CPURISCVState *env, Disas=
Context *ctx, uint16_t opcode)
> >          }
> >      } else {
> >          uint32_t opcode32 =3D opcode;
> > +#if TARGET_BIG_ENDIAN
> > +        opcode32 =3D bswap16(opcode);
> > +#endif
> >          opcode32 =3D deposit32(opcode32, 16, 16,
> >                               translator_lduw(env, &ctx->base,
> >                                               ctx->base.pc_next + 2));
> > +#if TARGET_BIG_ENDIAN
> > +        opcode32 =3D (opcode32) << 16 | (opcode32 >> 16);
> > +        opcode32 =3D bswap32(opcode32);
> > +#endif
> >          ctx->opcode =3D opcode32;
> >
> >          for (size_t i =3D 0; i < ARRAY_SIZE(decoders); ++i) {
> > @@ -1230,6 +1237,9 @@ static void riscv_tr_translate_insn(DisasContextB=
ase *dcbase, CPUState *cpu)
> >      DisasContext *ctx =3D container_of(dcbase, DisasContext, base);
> >      CPURISCVState *env =3D cpu->env_ptr;
> >      uint16_t opcode16 =3D translator_lduw(env, &ctx->base, ctx->base.p=
c_next);
> > +#if TARGET_BIG_ENDIAN
> > +    opcode16 =3D bswap16(opcode16);
> > +#endif
> >
> >      ctx->ol =3D ctx->xl;
> >      decode_opc(env, ctx, opcode16);
> > @@ -1244,6 +1254,9 @@ static void riscv_tr_translate_insn(DisasContextB=
ase *dcbase, CPUState *cpu)
> >
> >              if (page_ofs > TARGET_PAGE_SIZE - MAX_INSN_LEN) {
> >                  uint16_t next_insn =3D cpu_lduw_code(env, ctx->base.pc=
_next);
> > +#if TARGET_BIG_ENDIAN
> > +                next_insn =3D bswap16(next_insn);
> > +#endif
> >                  int len =3D insn_len(next_insn);
> >
> >                  if (!is_same_page(&ctx->base, ctx->base.pc_next + len =
- 1)) {
>
> Nothing's jumping out as wrong to me, but I haven't given BE much
> thought so I wouldn't be surprised if there's something wrong somewhere.
> I'm happy to look a bit deeper, but let's see if the unstable uABI stuff
> is OK with folks first?

If there isn't Linux support I'm reluctant to accept this as we have
no way to test it.

Alistair

>

