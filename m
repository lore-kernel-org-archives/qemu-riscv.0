Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h4rgl-0004Hg-LW
	for mharc-qemu-riscv@gnu.org; Fri, 15 Mar 2019 14:36:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33395)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1h4rgg-0004G2-US
	for qemu-riscv@nongnu.org; Fri, 15 Mar 2019 14:36:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1h4rgf-0002nn-4q
	for qemu-riscv@nongnu.org; Fri, 15 Mar 2019 14:36:10 -0400
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142]:44450)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1h4rgY-0002fl-Ds; Fri, 15 Mar 2019 14:36:02 -0400
Received: by mail-lf1-x142.google.com with SMTP id u9so7521064lfe.11;
	Fri, 15 Mar 2019 11:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=BonnLJSaIkF5FdpHYdSO9Udbj40YPMg6XoWyd9zcby8=;
	b=E44qnqOBaJL6p+4DFO2kVGQz8+1jdYpA0XeKztKQPCxIDJeRnq6byxg75KiEmvlnAn
	dtjP2Hl/AvMyqX1n2HMhwKfgR1D3tQyeSWv29syutWUyMstvEsxf12chc55b0KdmIMNx
	cTcdoeckkvAmVk3/y1vwb2Jib+xVsGy4Qi80vSdfVeHdY5xaRip9RkWw6E7IXCEzlruv
	NI9FCCIv/6nLqz0fEA+jE7zs9/spipnDkMDpqRhl0mdeIw2AI7D0xKQQy80stvL1MHTl
	IThtlbMKnW/Fo85ahs/gMgltuxu7zo1Ur10PI0/fkAAsxzNIGAH+JQAJv0MoA4v574Cm
	exvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=BonnLJSaIkF5FdpHYdSO9Udbj40YPMg6XoWyd9zcby8=;
	b=FuJjEMgqJmrRYkkwpR2XSkqjyJCXsbnjku6a24O8VFGjufEu/zMqh8WF3mJ3UL0oY4
	TYUP/3PBzB/+RiJuXoBYlZvcxXr+/uiCuuhJAoJeVEWxu4yWu5WAVKGXnzDqHk5Ht48R
	brK0Fug8VUa5Mgbr3gxSHej6Ax5kOpy+NRtFau+alVgDxV0TTDpuWoXPPn4iK658UrUH
	ULETwsqT6KMHU+50JYGFW0Wipielr9oczdWgwImjNBDXNODEYleqdUhGfuOVJjhzy2JN
	4wUtmwxRZbeMOVb+9GeOxwGpASQlBVIfLMGOtJy9XuIo1n4Xud7wS9tAYd6jumrSJhth
	84xA==
X-Gm-Message-State: APjAAAVslYLmo9uIDQaZMeCSRW+31/5+d5kFzz600TG6DJpUaNjh3zED
	L6/A29PXKRih5ZytC0eYEBQ4Ns9PfxYQRtrz3dw=
X-Google-Smtp-Source: APXvYqzuxZboQFywYfomfcWDN99vrQp978poT2x5O5g+sJPVWuBNgbOFWtI/ixMCT4Lbb+ZCJ71as1hc8xpxDxNJrIU=
X-Received: by 2002:a19:c314:: with SMTP id t20mr2992124lff.114.1552674957604; 
	Fri, 15 Mar 2019 11:35:57 -0700 (PDT)
MIME-Version: 1.0
References: <1552645619-18244-1-git-send-email-chihmin.chao@sifive.com>
	<1552645619-18244-6-git-send-email-chihmin.chao@sifive.com>
In-Reply-To: <1552645619-18244-6-git-send-email-chihmin.chao@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 15 Mar 2019 11:34:46 -0700
Message-ID: <CAKmqyKPcf2tt59xLYXUw8h0j2XOyb+7OQn_LhJirNoxy_axuOA@mail.gmail.com>
To: Chih-Min Chao <chihmin.chao@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	"open list:RISC-V" <qemu-riscv@nongnu.org>, 
	Sagar Karandikar <sagark@eecs.berkeley.edu>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Palmer Dabbelt <palmer@sifive.com>, 
	Alistair Francis <Alistair.Francis@wdc.com>, Jim Wilson <jimw@sifive.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::142
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v5 5/5] RISC-V: Add hooks to
 use the gdb xml files.
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Mar 2019 18:36:12 -0000

On Fri, Mar 15, 2019 at 7:01 AM Chih-Min Chao <chihmin.chao@sifive.com> wrote:
>
> From: Jim Wilson <jimw@sifive.com>
>
> The gdb CSR xml file has registers in documentation order, not numerical
> order, so we need a table to map the register numbers.  This also adds
> fairly standard gdb hooks to access xml specified registers.
>
> notice:
>     The fpu xml from gdb 8.3 has unused register #, 65 and make first
>     csr register # become 69. We register extra register on gdb to correct
>     csr offset calculation
>
> Signed-off-by: Jim Wilson <jimw@sifive.com>
> Signed-off-by: Chih-Min Chao <chihmin.chao@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c     |   9 +-
>  target/riscv/cpu.h     |   2 +
>  target/riscv/gdbstub.c | 350 +++++++++++++++++++++++++++++++++++++++++++++++--
>  3 files changed, 349 insertions(+), 12 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index cc3ddc0..feea169 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -311,6 +311,8 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
>          return;
>      }
>
> +    riscv_cpu_register_gdb_regs_for_features(cs);
> +
>      qemu_init_vcpu(cs);
>      cpu_reset(cs);
>
> @@ -351,7 +353,12 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
>      cc->synchronize_from_tb = riscv_cpu_synchronize_from_tb;
>      cc->gdb_read_register = riscv_cpu_gdb_read_register;
>      cc->gdb_write_register = riscv_cpu_gdb_write_register;
> -    cc->gdb_num_core_regs = 65;
> +    cc->gdb_num_core_regs = 33;
> +#if defined(TARGET_RISCV32)
> +    cc->gdb_core_xml_file = "riscv-32bit-cpu.xml";
> +#elif defined(TARGET_RISCV64)
> +    cc->gdb_core_xml_file = "riscv-64bit-cpu.xml";
> +#endif
>      cc->gdb_stop_before_watchpoint = true;
>      cc->disas_set_info = riscv_cpu_disas_set_info;
>  #ifdef CONFIG_USER_ONLY
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 4c5de30..9b673de 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -330,6 +330,8 @@ typedef struct {
>  void riscv_get_csr_ops(int csrno, riscv_csr_operations *ops);
>  void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops);
>
> +void riscv_cpu_register_gdb_regs_for_features(CPUState *cs);
> +
>  #include "exec/cpu-all.h"
>
>  #endif /* RISCV_CPU_H */
> diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
> index 3cabb21..dfcdd83 100644
> --- a/target/riscv/gdbstub.c
> +++ b/target/riscv/gdbstub.c
> @@ -21,6 +21,255 @@
>  #include "exec/gdbstub.h"
>  #include "cpu.h"
>
> +/*
> + * The GDB CSR xml files list them in documentation order, not numerical order,
> + * and are missing entries for unnamed CSRs.  So we need to map the gdb numbers
> + * to the hardware numbers.
> + */
> +
> +static int csr_register_map[] = {
> +    CSR_USTATUS,
> +    CSR_UIE,
> +    CSR_UTVEC,
> +    CSR_USCRATCH,
> +    CSR_UEPC,
> +    CSR_UCAUSE,
> +    CSR_UTVAL,
> +    CSR_UIP,
> +    CSR_FFLAGS,
> +    CSR_FRM,
> +    CSR_FCSR,
> +    CSR_CYCLE,
> +    CSR_TIME,
> +    CSR_INSTRET,
> +    CSR_HPMCOUNTER3,
> +    CSR_HPMCOUNTER4,
> +    CSR_HPMCOUNTER5,
> +    CSR_HPMCOUNTER6,
> +    CSR_HPMCOUNTER7,
> +    CSR_HPMCOUNTER8,
> +    CSR_HPMCOUNTER9,
> +    CSR_HPMCOUNTER10,
> +    CSR_HPMCOUNTER11,
> +    CSR_HPMCOUNTER12,
> +    CSR_HPMCOUNTER13,
> +    CSR_HPMCOUNTER14,
> +    CSR_HPMCOUNTER15,
> +    CSR_HPMCOUNTER16,
> +    CSR_HPMCOUNTER17,
> +    CSR_HPMCOUNTER18,
> +    CSR_HPMCOUNTER19,
> +    CSR_HPMCOUNTER20,
> +    CSR_HPMCOUNTER21,
> +    CSR_HPMCOUNTER22,
> +    CSR_HPMCOUNTER23,
> +    CSR_HPMCOUNTER24,
> +    CSR_HPMCOUNTER25,
> +    CSR_HPMCOUNTER26,
> +    CSR_HPMCOUNTER27,
> +    CSR_HPMCOUNTER28,
> +    CSR_HPMCOUNTER29,
> +    CSR_HPMCOUNTER30,
> +    CSR_HPMCOUNTER31,
> +    CSR_CYCLEH,
> +    CSR_TIMEH,
> +    CSR_INSTRETH,
> +    CSR_HPMCOUNTER3H,
> +    CSR_HPMCOUNTER4H,
> +    CSR_HPMCOUNTER5H,
> +    CSR_HPMCOUNTER6H,
> +    CSR_HPMCOUNTER7H,
> +    CSR_HPMCOUNTER8H,
> +    CSR_HPMCOUNTER9H,
> +    CSR_HPMCOUNTER10H,
> +    CSR_HPMCOUNTER11H,
> +    CSR_HPMCOUNTER12H,
> +    CSR_HPMCOUNTER13H,
> +    CSR_HPMCOUNTER14H,
> +    CSR_HPMCOUNTER15H,
> +    CSR_HPMCOUNTER16H,
> +    CSR_HPMCOUNTER17H,
> +    CSR_HPMCOUNTER18H,
> +    CSR_HPMCOUNTER19H,
> +    CSR_HPMCOUNTER20H,
> +    CSR_HPMCOUNTER21H,
> +    CSR_HPMCOUNTER22H,
> +    CSR_HPMCOUNTER23H,
> +    CSR_HPMCOUNTER24H,
> +    CSR_HPMCOUNTER25H,
> +    CSR_HPMCOUNTER26H,
> +    CSR_HPMCOUNTER27H,
> +    CSR_HPMCOUNTER28H,
> +    CSR_HPMCOUNTER29H,
> +    CSR_HPMCOUNTER30H,
> +    CSR_HPMCOUNTER31H,
> +    CSR_SSTATUS,
> +    CSR_SEDELEG,
> +    CSR_SIDELEG,
> +    CSR_SIE,
> +    CSR_STVEC,
> +    CSR_SCOUNTEREN,
> +    CSR_SSCRATCH,
> +    CSR_SEPC,
> +    CSR_SCAUSE,
> +    CSR_STVAL,
> +    CSR_SIP,
> +    CSR_SATP,
> +    CSR_MVENDORID,
> +    CSR_MARCHID,
> +    CSR_MIMPID,
> +    CSR_MHARTID,
> +    CSR_MSTATUS,
> +    CSR_MISA,
> +    CSR_MEDELEG,
> +    CSR_MIDELEG,
> +    CSR_MIE,
> +    CSR_MTVEC,
> +    CSR_MCOUNTEREN,
> +    CSR_MSCRATCH,
> +    CSR_MEPC,
> +    CSR_MCAUSE,
> +    CSR_MTVAL,
> +    CSR_MIP,
> +    CSR_PMPCFG0,
> +    CSR_PMPCFG1,
> +    CSR_PMPCFG2,
> +    CSR_PMPCFG3,
> +    CSR_PMPADDR0,
> +    CSR_PMPADDR1,
> +    CSR_PMPADDR2,
> +    CSR_PMPADDR3,
> +    CSR_PMPADDR4,
> +    CSR_PMPADDR5,
> +    CSR_PMPADDR6,
> +    CSR_PMPADDR7,
> +    CSR_PMPADDR8,
> +    CSR_PMPADDR9,
> +    CSR_PMPADDR10,
> +    CSR_PMPADDR11,
> +    CSR_PMPADDR12,
> +    CSR_PMPADDR13,
> +    CSR_PMPADDR14,
> +    CSR_PMPADDR15,
> +    CSR_MCYCLE,
> +    CSR_MINSTRET,
> +    CSR_MHPMCOUNTER3,
> +    CSR_MHPMCOUNTER4,
> +    CSR_MHPMCOUNTER5,
> +    CSR_MHPMCOUNTER6,
> +    CSR_MHPMCOUNTER7,
> +    CSR_MHPMCOUNTER8,
> +    CSR_MHPMCOUNTER9,
> +    CSR_MHPMCOUNTER10,
> +    CSR_MHPMCOUNTER11,
> +    CSR_MHPMCOUNTER12,
> +    CSR_MHPMCOUNTER13,
> +    CSR_MHPMCOUNTER14,
> +    CSR_MHPMCOUNTER15,
> +    CSR_MHPMCOUNTER16,
> +    CSR_MHPMCOUNTER17,
> +    CSR_MHPMCOUNTER18,
> +    CSR_MHPMCOUNTER19,
> +    CSR_MHPMCOUNTER20,
> +    CSR_MHPMCOUNTER21,
> +    CSR_MHPMCOUNTER22,
> +    CSR_MHPMCOUNTER23,
> +    CSR_MHPMCOUNTER24,
> +    CSR_MHPMCOUNTER25,
> +    CSR_MHPMCOUNTER26,
> +    CSR_MHPMCOUNTER27,
> +    CSR_MHPMCOUNTER28,
> +    CSR_MHPMCOUNTER29,
> +    CSR_MHPMCOUNTER30,
> +    CSR_MHPMCOUNTER31,
> +    CSR_MCYCLEH,
> +    CSR_MINSTRETH,
> +    CSR_MHPMCOUNTER3H,
> +    CSR_MHPMCOUNTER4H,
> +    CSR_MHPMCOUNTER5H,
> +    CSR_MHPMCOUNTER6H,
> +    CSR_MHPMCOUNTER7H,
> +    CSR_MHPMCOUNTER8H,
> +    CSR_MHPMCOUNTER9H,
> +    CSR_MHPMCOUNTER10H,
> +    CSR_MHPMCOUNTER11H,
> +    CSR_MHPMCOUNTER12H,
> +    CSR_MHPMCOUNTER13H,
> +    CSR_MHPMCOUNTER14H,
> +    CSR_MHPMCOUNTER15H,
> +    CSR_MHPMCOUNTER16H,
> +    CSR_MHPMCOUNTER17H,
> +    CSR_MHPMCOUNTER18H,
> +    CSR_MHPMCOUNTER19H,
> +    CSR_MHPMCOUNTER20H,
> +    CSR_MHPMCOUNTER21H,
> +    CSR_MHPMCOUNTER22H,
> +    CSR_MHPMCOUNTER23H,
> +    CSR_MHPMCOUNTER24H,
> +    CSR_MHPMCOUNTER25H,
> +    CSR_MHPMCOUNTER26H,
> +    CSR_MHPMCOUNTER27H,
> +    CSR_MHPMCOUNTER28H,
> +    CSR_MHPMCOUNTER29H,
> +    CSR_MHPMCOUNTER30H,
> +    CSR_MHPMCOUNTER31H,
> +    CSR_MHPMEVENT3,
> +    CSR_MHPMEVENT4,
> +    CSR_MHPMEVENT5,
> +    CSR_MHPMEVENT6,
> +    CSR_MHPMEVENT7,
> +    CSR_MHPMEVENT8,
> +    CSR_MHPMEVENT9,
> +    CSR_MHPMEVENT10,
> +    CSR_MHPMEVENT11,
> +    CSR_MHPMEVENT12,
> +    CSR_MHPMEVENT13,
> +    CSR_MHPMEVENT14,
> +    CSR_MHPMEVENT15,
> +    CSR_MHPMEVENT16,
> +    CSR_MHPMEVENT17,
> +    CSR_MHPMEVENT18,
> +    CSR_MHPMEVENT19,
> +    CSR_MHPMEVENT20,
> +    CSR_MHPMEVENT21,
> +    CSR_MHPMEVENT22,
> +    CSR_MHPMEVENT23,
> +    CSR_MHPMEVENT24,
> +    CSR_MHPMEVENT25,
> +    CSR_MHPMEVENT26,
> +    CSR_MHPMEVENT27,
> +    CSR_MHPMEVENT28,
> +    CSR_MHPMEVENT29,
> +    CSR_MHPMEVENT30,
> +    CSR_MHPMEVENT31,
> +    CSR_TSELECT,
> +    CSR_TDATA1,
> +    CSR_TDATA2,
> +    CSR_TDATA3,
> +    CSR_DCSR,
> +    CSR_DPC,
> +    CSR_DSCRATCH,
> +    CSR_HSTATUS,
> +    CSR_HEDELEG,
> +    CSR_HIDELEG,
> +    CSR_HIE,
> +    CSR_HTVEC,
> +    CSR_HSCRATCH,
> +    CSR_HEPC,
> +    CSR_HCAUSE,
> +    CSR_HBADADDR,
> +    CSR_HIP,
> +    CSR_MBASE,
> +    CSR_MBOUND,
> +    CSR_MIBASE,
> +    CSR_MIBOUND,
> +    CSR_MDBASE,
> +    CSR_MDBOUND,
> +    CSR_MUCOUNTEREN,
> +    CSR_MSCOUNTEREN,
> +    CSR_MHCOUNTEREN,
> +};
> +
>  int riscv_cpu_gdb_read_register(CPUState *cs, uint8_t *mem_buf, int n)
>  {
>      RISCVCPU *cpu = RISCV_CPU(cs);
> @@ -30,13 +279,6 @@ int riscv_cpu_gdb_read_register(CPUState *cs, uint8_t *mem_buf, int n)
>          return gdb_get_regl(mem_buf, env->gpr[n]);
>      } else if (n == 32) {
>          return gdb_get_regl(mem_buf, env->pc);
> -    } else if (n < 65) {
> -        return gdb_get_reg64(mem_buf, env->fpr[n - 33]);
> -    } else if (n < 4096 + 65) {
> -        target_ulong val = 0;
> -        if (riscv_csrrw(env, n - 65, &val, 0, 0) == 0) {
> -            return gdb_get_regl(mem_buf, val);
> -        }
>      }
>      return 0;
>  }
> @@ -55,14 +297,100 @@ int riscv_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
>      } else if (n == 32) {
>          env->pc = ldtul_p(mem_buf);
>          return sizeof(target_ulong);
> -    } else if (n < 65) {
> -        env->fpr[n - 33] = ldq_p(mem_buf); /* always 64-bit */
> +    }
> +    return 0;
> +}
> +
> +static int riscv_gdb_get_fpu(CPURISCVState *env, uint8_t *mem_buf, int n)
> +{
> +    if (n < 32) {
> +        return gdb_get_reg64(mem_buf, env->fpr[n]);
> +    /* there is hole between ft11 and fflags in fpu.xml */
> +    } else if (n < 36 && n > 32) {
> +        target_ulong val = 0;
> +        int result;
> +        /*
> +         * CSR_FFLAGS is at index 8 in csr_register, and gdb says it is FP
> +         * register 33, so we recalculate the map index.
> +         * This also works for CSR_FRM and CSR_FCSR.
> +         */
> +        result = riscv_csrrw_debug(env, n - 33 +  8, &val, 0, 0);
> +        if (result == 0) {
> +            return gdb_get_regl(mem_buf, val);
> +        }
> +    }
> +    return 0;
> +}
> +
> +static int riscv_gdb_set_fpu(CPURISCVState *env, uint8_t *mem_buf, int n)
> +{
> +    if (n < 32) {
> +        env->fpr[n] = ldq_p(mem_buf); /* always 64-bit */
>          return sizeof(uint64_t);
> -    } else if (n < 4096 + 65) {
> +    /* there is hole between ft11 and fflags in fpu.xml */
> +    } else if (n < 36 && n > 32) {
>          target_ulong val = ldtul_p(mem_buf);
> -        if (riscv_csrrw(env, n - 65, NULL, val, -1) == 0) {
> +        int result;
> +        /*
> +         * CSR_FFLAGS is at index 8 in csr_register, and gdb says it is FP
> +         * register 33, so we recalculate the map index.
> +         * This also works for CSR_FRM and CSR_FCSR.
> +         */
> +        result = riscv_csrrw_debug(env, n - 33 + 8, NULL, val, -1);
> +        if (result == 0) {
>              return sizeof(target_ulong);
>          }
>      }
>      return 0;
>  }
> +
> +static int riscv_gdb_get_csr(CPURISCVState *env, uint8_t *mem_buf, int n)
> +{
> +    if (n < ARRAY_SIZE(csr_register_map)) {
> +        target_ulong val = 0;
> +        int result;
> +
> +        result = riscv_csrrw_debug(env, csr_register_map[n], &val, 0, 0);
> +        if (result == 0) {
> +            return gdb_get_regl(mem_buf, val);
> +        }
> +    }
> +    return 0;
> +}
> +
> +static int riscv_gdb_set_csr(CPURISCVState *env, uint8_t *mem_buf, int n)
> +{
> +    if (n < ARRAY_SIZE(csr_register_map)) {
> +        target_ulong val = ldtul_p(mem_buf);
> +        int result;
> +
> +        result = riscv_csrrw_debug(env, csr_register_map[n], NULL, val, -1);
> +        if (result == 0) {
> +            return sizeof(target_ulong);
> +        }
> +    }
> +    return 0;
> +}
> +
> +void riscv_cpu_register_gdb_regs_for_features(CPUState *cs)
> +{
> +    RISCVCPU *cpu = RISCV_CPU(cs);
> +    CPURISCVState *env = &cpu->env;
> +#if defined(TARGET_RISCV32)
> +    if (env->misa & RVF) {
> +        gdb_register_coprocessor(cs, riscv_gdb_get_fpu, riscv_gdb_set_fpu,
> +                                 36, "riscv-32bit-fpu.xml", 0);
> +    }
> +
> +    gdb_register_coprocessor(cs, riscv_gdb_get_csr, riscv_gdb_set_csr,
> +                             4096, "riscv-32bit-csr.xml", 0);
> +#elif defined(TARGET_RISCV64)
> +    if (env->misa & RVF) {
> +        gdb_register_coprocessor(cs, riscv_gdb_get_fpu, riscv_gdb_set_fpu,
> +                                 36, "riscv-64bit-fpu.xml", 0);
> +    }
> +
> +    gdb_register_coprocessor(cs, riscv_gdb_get_csr, riscv_gdb_set_csr,
> +                             4096, "riscv-64bit-csr.xml", 0);
> +#endif
> +}
> --
> 2.7.4
>
>

