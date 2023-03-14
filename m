Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pbx8J-0000O2-BM
	for mharc-qemu-riscv@gnu.org; Tue, 14 Mar 2023 01:23:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pbx8I-0000Nk-1T; Tue, 14 Mar 2023 01:23:34 -0400
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pbx8G-0006Ql-3X; Tue, 14 Mar 2023 01:23:33 -0400
Received: by mail-vs1-xe35.google.com with SMTP id a3so13087432vsi.0;
 Mon, 13 Mar 2023 22:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678771410;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b5mGi4ysUQlq8GRQojpVt3RRzHhwlhHoESxwvSX4wto=;
 b=It9N1uoJpWwVTxQT0vLTYrdaaVj1tIdmaWUB/pHA03emSCd6WBh38ajF5miv4tcT2Q
 jVxCeXhkTNUhZPmy31w0qYT8GE6lIQe7dvKDA7Bp/zsidCse+ofjAZfLAdZhOLDb4ubR
 RUiobt5wmegRB9piQZI8IlxzBLwS48mN9cJVqaQibTXuD9F8C3uVkqjBO1pUgJlFUQHO
 fj2JjH0jr/KbkOhPuUHkklLG1Ppwoa0MOXU88VM94IPWVXSCDmYg/8QqyO9OHCi3rCqj
 J5jAxEDhy2PrnnOYSTqmA1NVbnrFR654KEKWELw4JrnUVferQEHnnioqQqSZfsw9sXED
 9oGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678771410;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b5mGi4ysUQlq8GRQojpVt3RRzHhwlhHoESxwvSX4wto=;
 b=3E38xLsyx+rhezPN7pLSD4PeQ4Fn5dHhCTtNlebUZPP0VVjTXk5cAFhgy6smJ9aFEw
 kuSz/OisOp14aUOnlapS7UTFQGT38hnvnJydMQ85pqD1ONVTq/HUn+LfZ7QyXOk6PN5u
 kScD6jFztdTdYZPkygeg22/Wc55bQq/V4gjdoGDxMEFgZbsji2QmmzJA2FhcK7cGpOwz
 /HR+WK9vOisI7C8T1wQkq4yuCThIsF1WNGW8oKmoQOjtbhfEyghQIu1Yf+r8xTr8Xf2m
 QgIvxyDTVD+FHTd8JehIzqhHtg52Lp/v3x0OsQQpph5XTxo8PjdZX4tx0EJAPOW0316r
 rDVg==
X-Gm-Message-State: AO0yUKXQcvbYXRGljzIA7l3USbcW9fNtGxaDU91DnqnHP3ETIrkwJx3p
 ZM17HazKbA67LcUmniJzON/oT3zw4hGJ9V//9S4=
X-Google-Smtp-Source: AK7set/MVEGRzSj2jy2tEksFbtBdl7k2wUDr0F5lzjcuvf11TqZf/XGTj49k60VTcRP0n7ZubLQek5Cmz7hEkLwdy2Q=
X-Received: by 2002:a67:1005:0:b0:425:8e57:7bfd with SMTP id
 5-20020a671005000000b004258e577bfdmr3378263vsq.3.1678771410639; Mon, 13 Mar
 2023 22:23:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230309071329.45932-1-liweiwei@iscas.ac.cn>
 <20230309071329.45932-2-liweiwei@iscas.ac.cn>
In-Reply-To: <20230309071329.45932-2-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 14 Mar 2023 15:23:04 +1000
Message-ID: <CAKmqyKOX9GEO=T4wTskj-hcxWyCWUYTMnNgavsn0D4ePQfAUgA@mail.gmail.com>
Subject: Re: [PATCH 1/4] target/riscv: Avoid env_archcpu() when reading
 RISCVCPUConfig
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e35;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe35.google.com
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
X-List-Received-Date: Tue, 14 Mar 2023 05:23:34 -0000

On Thu, Mar 9, 2023 at 5:14=E2=80=AFPM Weiwei Li <liweiwei@iscas.ac.cn> wro=
te:
>
> Use riscv_cpu_cfg(env) instead of env_archcpu().cfg.
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu_helper.c |  9 ++++-----
>  target/riscv/csr.c        | 40 ++++++++++++---------------------------
>  target/riscv/gdbstub.c    |  4 ++--
>  3 files changed, 18 insertions(+), 35 deletions(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index f88c503cf4..e677255f87 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -314,7 +314,6 @@ static int riscv_cpu_pending_to_irq(CPURISCVState *en=
v,
>                                      int extirq, unsigned int extirq_def_=
prio,
>                                      uint64_t pending, uint8_t *iprio)
>  {
> -    RISCVCPU *cpu =3D env_archcpu(env);
>      int irq, best_irq =3D RISCV_EXCP_NONE;
>      unsigned int prio, best_prio =3D UINT_MAX;
>
> @@ -323,7 +322,8 @@ static int riscv_cpu_pending_to_irq(CPURISCVState *en=
v,
>      }
>
>      irq =3D ctz64(pending);
> -    if (!((extirq =3D=3D IRQ_M_EXT) ? cpu->cfg.ext_smaia : cpu->cfg.ext_=
ssaia)) {
> +    if (!((extirq =3D=3D IRQ_M_EXT) ? riscv_cpu_cfg(env)->ext_smaia :
> +                                  riscv_cpu_cfg(env)->ext_ssaia)) {
>          return irq;
>      }
>
> @@ -765,7 +765,6 @@ static int get_physical_address(CPURISCVState *env, h=
waddr *physical,
>      int mode =3D mmu_idx & TB_FLAGS_PRIV_MMU_MASK;
>      bool use_background =3D false;
>      hwaddr ppn;
> -    RISCVCPU *cpu =3D env_archcpu(env);
>      int napot_bits =3D 0;
>      target_ulong napot_mask;
>
> @@ -946,7 +945,7 @@ restart:
>
>          if (riscv_cpu_sxl(env) =3D=3D MXL_RV32) {
>              ppn =3D pte >> PTE_PPN_SHIFT;
> -        } else if (pbmte || cpu->cfg.ext_svnapot) {
> +        } else if (pbmte || riscv_cpu_cfg(env)->ext_svnapot) {
>              ppn =3D (pte & (target_ulong)PTE_PPN_MASK) >> PTE_PPN_SHIFT;
>          } else {
>              ppn =3D pte >> PTE_PPN_SHIFT;
> @@ -1043,7 +1042,7 @@ restart:
>                 benefit. */
>              target_ulong vpn =3D addr >> PGSHIFT;
>
> -            if (cpu->cfg.ext_svnapot && (pte & PTE_N)) {
> +            if (riscv_cpu_cfg(env)->ext_svnapot && (pte & PTE_N)) {
>                  napot_bits =3D ctzl(ppn) + 1;
>                  if ((i !=3D (levels - 1)) || (napot_bits !=3D 4)) {
>                      return TRANSLATE_FAIL;
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index ab566639e5..b453d8e8ca 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -88,9 +88,7 @@ static RISCVException fs(CPURISCVState *env, int csrno)
>
>  static RISCVException vs(CPURISCVState *env, int csrno)
>  {
> -    RISCVCPU *cpu =3D env_archcpu(env);
> -
> -    if (cpu->cfg.ext_zve32f) {
> +    if (riscv_cpu_cfg(env)->ext_zve32f) {
>  #if !defined(CONFIG_USER_ONLY)
>          if (!env->debugger && !riscv_cpu_vector_enabled(env)) {
>              return RISCV_EXCP_ILLEGAL_INST;
> @@ -193,9 +191,7 @@ static RISCVException mctr32(CPURISCVState *env, int =
csrno)
>
>  static RISCVException sscofpmf(CPURISCVState *env, int csrno)
>  {
> -    RISCVCPU *cpu =3D env_archcpu(env);
> -
> -    if (!cpu->cfg.ext_sscofpmf) {
> +    if (!riscv_cpu_cfg(env)->ext_sscofpmf) {
>          return RISCV_EXCP_ILLEGAL_INST;
>      }
>
> @@ -310,9 +306,7 @@ static RISCVException umode32(CPURISCVState *env, int=
 csrno)
>
>  static RISCVException mstateen(CPURISCVState *env, int csrno)
>  {
> -    RISCVCPU *cpu =3D env_archcpu(env);
> -
> -    if (!cpu->cfg.ext_smstateen) {
> +    if (!riscv_cpu_cfg(env)->ext_smstateen) {
>          return RISCV_EXCP_ILLEGAL_INST;
>      }
>
> @@ -321,9 +315,7 @@ static RISCVException mstateen(CPURISCVState *env, in=
t csrno)
>
>  static RISCVException hstateen_pred(CPURISCVState *env, int csrno, int b=
ase)
>  {
> -    RISCVCPU *cpu =3D env_archcpu(env);
> -
> -    if (!cpu->cfg.ext_smstateen) {
> +    if (!riscv_cpu_cfg(env)->ext_smstateen) {
>          return RISCV_EXCP_ILLEGAL_INST;
>      }
>
> @@ -390,10 +382,9 @@ static RISCVException sstateen(CPURISCVState *env, i=
nt csrno)
>
>  static RISCVException sstc(CPURISCVState *env, int csrno)
>  {
> -    RISCVCPU *cpu =3D env_archcpu(env);
>      bool hmode_check =3D false;
>
> -    if (!cpu->cfg.ext_sstc || !env->rdtime_fn) {
> +    if (!riscv_cpu_cfg(env)->ext_sstc || !env->rdtime_fn) {
>          return RISCV_EXCP_ILLEGAL_INST;
>      }
>
> @@ -1170,27 +1161,21 @@ static RISCVException write_ignore(CPURISCVState =
*env, int csrno,
>  static RISCVException read_mvendorid(CPURISCVState *env, int csrno,
>                                       target_ulong *val)
>  {
> -    RISCVCPU *cpu =3D env_archcpu(env);
> -
> -    *val =3D cpu->cfg.mvendorid;
> +    *val =3D riscv_cpu_cfg(env)->mvendorid;
>      return RISCV_EXCP_NONE;
>  }
>
>  static RISCVException read_marchid(CPURISCVState *env, int csrno,
>                                     target_ulong *val)
>  {
> -    RISCVCPU *cpu =3D env_archcpu(env);
> -
> -    *val =3D cpu->cfg.marchid;
> +    *val =3D riscv_cpu_cfg(env)->marchid;
>      return RISCV_EXCP_NONE;
>  }
>
>  static RISCVException read_mimpid(CPURISCVState *env, int csrno,
>                                    target_ulong *val)
>  {
> -    RISCVCPU *cpu =3D env_archcpu(env);
> -
> -    *val =3D cpu->cfg.mimpid;
> +    *val =3D riscv_cpu_cfg(env)->mimpid;
>      return RISCV_EXCP_NONE;
>  }
>
> @@ -1232,9 +1217,8 @@ static RISCVException read_mstatus(CPURISCVState *e=
nv, int csrno,
>
>  static bool validate_vm(CPURISCVState *env, target_ulong vm)
>  {
> -    RISCVCPU *cpu =3D RISCV_CPU(env_cpu(env));
> -
> -    return (vm & 0xf) <=3D satp_mode_max_from_map(cpu->cfg.satp_mode.map=
);
> +    return (vm & 0xf) <=3D
> +           satp_mode_max_from_map(riscv_cpu_cfg(env)->satp_mode.map);
>  }
>
>  static RISCVException write_mstatus(CPURISCVState *env, int csrno,
> @@ -1897,7 +1881,7 @@ static RISCVException read_menvcfg(CPURISCVState *e=
nv, int csrno,
>  static RISCVException write_menvcfg(CPURISCVState *env, int csrno,
>                                      target_ulong val)
>  {
> -    RISCVCPUConfig *cfg =3D &env_archcpu(env)->cfg;
> +    const RISCVCPUConfig *cfg =3D riscv_cpu_cfg(env);
>      uint64_t mask =3D MENVCFG_FIOM | MENVCFG_CBIE | MENVCFG_CBCFE | MENV=
CFG_CBZE;
>
>      if (riscv_cpu_mxl(env) =3D=3D MXL_RV64) {
> @@ -1920,7 +1904,7 @@ static RISCVException read_menvcfgh(CPURISCVState *=
env, int csrno,
>  static RISCVException write_menvcfgh(CPURISCVState *env, int csrno,
>                                       target_ulong val)
>  {
> -    RISCVCPUConfig *cfg =3D &env_archcpu(env)->cfg;
> +    const RISCVCPUConfig *cfg =3D riscv_cpu_cfg(env);
>      uint64_t mask =3D (cfg->ext_svpbmt ? MENVCFG_PBMTE : 0) |
>                      (cfg->ext_sstc ? MENVCFG_STCE : 0) |
>                      (cfg->ext_svadu ? MENVCFG_HADE : 0);
> diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
> index 6048541606..b2e08f1979 100644
> --- a/target/riscv/gdbstub.c
> +++ b/target/riscv/gdbstub.c
> @@ -129,7 +129,7 @@ static int riscv_gdb_set_fpu(CPURISCVState *env, uint=
8_t *mem_buf, int n)
>
>  static int riscv_gdb_get_vector(CPURISCVState *env, GByteArray *buf, int=
 n)
>  {
> -    uint16_t vlenb =3D env_archcpu(env)->cfg.vlen >> 3;
> +    uint16_t vlenb =3D riscv_cpu_cfg(env)->vlen >> 3;
>      if (n < 32) {
>          int i;
>          int cnt =3D 0;
> @@ -145,7 +145,7 @@ static int riscv_gdb_get_vector(CPURISCVState *env, G=
ByteArray *buf, int n)
>
>  static int riscv_gdb_set_vector(CPURISCVState *env, uint8_t *mem_buf, in=
t n)
>  {
> -    uint16_t vlenb =3D env_archcpu(env)->cfg.vlen >> 3;
> +    uint16_t vlenb =3D riscv_cpu_cfg(env)->vlen >> 3;
>      if (n < 32) {
>          int i;
>          for (i =3D 0; i < vlenb; i +=3D 8) {
> --
> 2.25.1
>
>

