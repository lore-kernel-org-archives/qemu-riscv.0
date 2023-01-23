Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pK5ib-0000xA-DQ
	for mharc-qemu-riscv@gnu.org; Mon, 23 Jan 2023 17:55:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pK5ia-0000w6-Dw; Mon, 23 Jan 2023 17:55:12 -0500
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pK5iX-0007AN-Et; Mon, 23 Jan 2023 17:55:12 -0500
Received: by mail-vs1-xe33.google.com with SMTP id k4so14711555vsc.4;
 Mon, 23 Jan 2023 14:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vZxUgZ9RAv5GrC0ichKh+1Lei8+P35Lb20jNbBf0cX8=;
 b=WeSwMEFlxakt49RG+IJCECjV/R6/+VSQj7mv+8Af/b2yIXT4V7Cy/qTzT64WJ8sioD
 HI77n2P7W6RPqz5NswgJsH+F+KEyPOpwb8Cj4zCGey7gHfAainwtkoKm12Ue83esE5JG
 DaA85y86e6/PaQBvclJ1dnHIy++FcVMqwy+sdPQAXoNSDMjiI/1mdf9Wr0Rn0KsSuvtb
 AqwbH+4OzYMRL308QebPAD+jdHUVSUXaeExpA6K75EEF71nwVuhm8H8ZX2oisztLK5LT
 43HkoqY8rMSoWCsrLD1a897aiRIvSHGby2tslUOJUTmQlhyYiiBbF8S3X92JyNo+NqVE
 FnrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vZxUgZ9RAv5GrC0ichKh+1Lei8+P35Lb20jNbBf0cX8=;
 b=hMfXVri0oOwq7wJDBfmjGkXJ0E4dkFqwqRYjtANVFtoQfvXi8et24lBZzjISWs/kMt
 47llzuP+JWL1NB1E+OO+Cr3Zr5LP2j6PQiJn8gjwFjCiLdRFzd0NvZw/KbCuufTdTmWc
 ZV5jzNvIQ5TyyQTE0zrtkj/+xsbDLhHGUkLXH3B5FDizYYlnXjG2wOj5GfUoqwZvtddr
 v8on1FHEux3HWgwJaIzqtjGu0dSXtCkW/NXA35QAeY97DbU1OjxCmbRKIDolxiwERtUG
 pwdl9ZHFTYIQANboB+836f7gnK1NpaVfX4XAQhlZEIlHL7JQEsHTfUFbdeeb1xd1Z9oB
 O7Ig==
X-Gm-Message-State: AFqh2kr3TZ3UcAXN/3PtwOI8Bpya8XMEvXKwXkge83WtuT1dlIigTHOR
 kIF/3imFkGUbkyg3CL9DY+IKVNM2j+jKzD6NAls=
X-Google-Smtp-Source: AMrXdXvZBIzATpKE72ebrM1SYqJ7HUlr2V37BWbPGDVbtQbpCEw8l1Y8oSdzlQs32dpwyEcq0Z9r8pydxo3o9PorwYk=
X-Received: by 2002:a67:e14a:0:b0:3d3:f10a:4f56 with SMTP id
 o10-20020a67e14a000000b003d3f10a4f56mr3486031vsl.10.1674514507363; Mon, 23
 Jan 2023 14:55:07 -0800 (PST)
MIME-Version: 1.0
References: <20221223180016.2068508-1-christoph.muellner@vrull.eu>
 <20221223180016.2068508-3-christoph.muellner@vrull.eu>
In-Reply-To: <20221223180016.2068508-3-christoph.muellner@vrull.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 24 Jan 2023 08:54:41 +1000
Message-ID: <CAKmqyKNX=eM-V7s88utYNNUkbAtHYsKEPRB6zFgFE-OdRFk4ew@mail.gmail.com>
Subject: Re: [PATCH v2 02/15] RISC-V: Adding XTheadSync ISA extension
To: Christoph Muellner <christoph.muellner@vrull.eu>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko.stuebner@vrull.eu>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Nelson Chu <nelson@rivosinc.com>, Kito Cheng <kito.cheng@sifive.com>, 
 Cooper Qu <cooper.qu@linux.alibaba.com>,
 Lifang Xia <lifang_xia@linux.alibaba.com>, 
 Yunhai Shang <yunhai@linux.alibaba.com>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e33;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe33.google.com
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
X-List-Received-Date: Mon, 23 Jan 2023 22:55:12 -0000

On Sat, Dec 24, 2022 at 4:04 AM Christoph Muellner
<christoph.muellner@vrull.eu> wrote:
>
> From: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>
>
> This patch adds support for the XTheadSync ISA extension.
> The patch uses the T-Head specific decoder and translation.
>
> The implementation introduces a helper to execute synchronization tasks:
> helper_tlb_flush_all() performs a synchronized TLB flush on all CPUs.
>
> Changes in v2:
> - Add ISA_EXT_DATA_ENTRY()
> - Use helper to synchronize CPUs and perform TLB flushes
> - Change implemenation to follow latest spec update
> - Use single decoder for XThead extensions
>
> Co-developed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Signed-off-by: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c                         |  2 +
>  target/riscv/cpu.h                         |  1 +
>  target/riscv/helper.h                      |  1 +
>  target/riscv/insn_trans/trans_xthead.c.inc | 86 ++++++++++++++++++++++
>  target/riscv/op_helper.c                   |  6 ++
>  target/riscv/translate.c                   |  2 +-
>  target/riscv/xthead.decode                 |  9 +++
>  7 files changed, 106 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index a90b82c5c5..a848836d2e 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -109,6 +109,7 @@ static const struct isa_ext_data isa_edata_arr[] =3D =
{
>      ISA_EXT_DATA_ENTRY(svnapot, true, PRIV_VERSION_1_12_0, ext_svnapot),
>      ISA_EXT_DATA_ENTRY(svpbmt, true, PRIV_VERSION_1_12_0, ext_svpbmt),
>      ISA_EXT_DATA_ENTRY(xtheadcmo, true, PRIV_VERSION_1_11_0, ext_xtheadc=
mo),
> +    ISA_EXT_DATA_ENTRY(xtheadsync, true, PRIV_VERSION_1_11_0, ext_xthead=
sync),
>      ISA_EXT_DATA_ENTRY(xventanacondops, true, PRIV_VERSION_1_12_0, ext_X=
VentanaCondOps),
>  };
>
> @@ -1062,6 +1063,7 @@ static Property riscv_cpu_extensions[] =3D {
>
>      /* Vendor-specific custom extensions */
>      DEFINE_PROP_BOOL("xtheadcmo", RISCVCPU, cfg.ext_xtheadcmo, false),
> +    DEFINE_PROP_BOOL("xtheadsync", RISCVCPU, cfg.ext_xtheadsync, false),
>      DEFINE_PROP_BOOL("xventanacondops", RISCVCPU, cfg.ext_XVentanaCondOp=
s, false),
>
>      /* These are experimental so mark with 'x-' */
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index ad1c19f870..4d3da2acfa 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -466,6 +466,7 @@ struct RISCVCPUConfig {
>
>      /* Vendor-specific custom extensions */
>      bool ext_xtheadcmo;
> +    bool ext_xtheadsync;
>      bool ext_XVentanaCondOps;
>
>      uint8_t pmu_num;
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index a03014fe67..ecfb8c280f 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -109,6 +109,7 @@ DEF_HELPER_1(sret, tl, env)
>  DEF_HELPER_1(mret, tl, env)
>  DEF_HELPER_1(wfi, void, env)
>  DEF_HELPER_1(tlb_flush, void, env)
> +DEF_HELPER_1(tlb_flush_all, void, env)
>  #endif
>
>  /* Hypervisor functions */
> diff --git a/target/riscv/insn_trans/trans_xthead.c.inc b/target/riscv/in=
sn_trans/trans_xthead.c.inc
> index 00e75c7dca..6009d61c81 100644
> --- a/target/riscv/insn_trans/trans_xthead.c.inc
> +++ b/target/riscv/insn_trans/trans_xthead.c.inc
> @@ -22,6 +22,12 @@
>      }                                            \
>  } while (0)
>
> +#define REQUIRE_XTHEADSYNC(ctx) do {             \
> +    if (!ctx->cfg_ptr->ext_xtheadsync) {         \
> +        return false;                            \
> +    }                                            \
> +} while (0)
> +
>  /* XTheadCmo */
>
>  static inline int priv_level(DisasContext *ctx)
> @@ -87,3 +93,83 @@ NOP_PRIVCHECK(th_icache_iva, REQUIRE_XTHEADCMO, REQUIR=
E_PRIV_MHSU)
>  NOP_PRIVCHECK(th_l2cache_call, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
>  NOP_PRIVCHECK(th_l2cache_ciall, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
>  NOP_PRIVCHECK(th_l2cache_iall, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MHS)
> +
> +/* XTheadSync */
> +
> +static bool trans_th_sfence_vmas(DisasContext *ctx, arg_th_sfence_vmas *=
a)
> +{
> +    (void) a;
> +    REQUIRE_XTHEADSYNC(ctx);
> +
> +#ifndef CONFIG_USER_ONLY
> +    REQUIRE_PRIV_MHS(ctx);
> +    decode_save_opc(ctx);
> +    gen_helper_tlb_flush_all(cpu_env);
> +    return true;
> +#else
> +    return false;
> +#endif
> +}
> +
> +#ifndef CONFIG_USER_ONLY
> +static void gen_th_sync_local(DisasContext *ctx)
> +{
> +    /*
> +     * Emulate out-of-order barriers with pipeline flush
> +     * by exiting the translation block.
> +     */
> +    gen_set_pc_imm(ctx, ctx->pc_succ_insn);
> +    tcg_gen_exit_tb(NULL, 0);
> +    ctx->base.is_jmp =3D DISAS_NORETURN;
> +}
> +#endif
> +
> +static bool trans_th_sync(DisasContext *ctx, arg_th_sync *a)
> +{
> +    (void) a;
> +    REQUIRE_XTHEADSYNC(ctx);
> +
> +#ifndef CONFIG_USER_ONLY
> +    REQUIRE_PRIV_MHSU(ctx);
> +
> +    /*
> +     * th.sync is an out-of-order barrier.
> +     */
> +    gen_th_sync_local(ctx);
> +
> +    return true;
> +#else
> +    return false;
> +#endif
> +}
> +
> +static bool trans_th_sync_i(DisasContext *ctx, arg_th_sync_i *a)
> +{
> +    (void) a;
> +    REQUIRE_XTHEADSYNC(ctx);
> +
> +#ifndef CONFIG_USER_ONLY
> +    REQUIRE_PRIV_MHSU(ctx);
> +
> +    /*
> +     * th.sync.i is th.sync plus pipeline flush.
> +     */
> +    gen_th_sync_local(ctx);
> +
> +    return true;
> +#else
> +    return false;
> +#endif
> +}
> +
> +static bool trans_th_sync_is(DisasContext *ctx, arg_th_sync_is *a)
> +{
> +    /* This instruction has the same behaviour like th.sync.i. */
> +    return trans_th_sync_i(ctx, a);
> +}
> +
> +static bool trans_th_sync_s(DisasContext *ctx, arg_th_sync_s *a)
> +{
> +    /* This instruction has the same behaviour like th.sync. */
> +    return trans_th_sync(ctx, a);
> +}
> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> index 09f1f5185d..9e3c3f6bf1 100644
> --- a/target/riscv/op_helper.c
> +++ b/target/riscv/op_helper.c
> @@ -260,6 +260,12 @@ void helper_tlb_flush(CPURISCVState *env)
>      }
>  }
>
> +void helper_tlb_flush_all(CPURISCVState *env)
> +{
> +    CPUState *cs =3D env_cpu(env);
> +    tlb_flush_all_cpus_synced(cs);
> +}
> +
>  void helper_hyp_tlb_flush(CPURISCVState *env)
>  {
>      CPUState *cs =3D env_cpu(env);
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 14d9116975..c40617662a 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -127,7 +127,7 @@ static bool always_true_p(DisasContext *ctx  __attrib=
ute__((__unused__)))
>
>  static bool has_xthead_p(DisasContext *ctx  __attribute__((__unused__)))
>  {
> -    return ctx->cfg_ptr->ext_xtheadcmo;
> +    return ctx->cfg_ptr->ext_xtheadcmo || ctx->cfg_ptr->ext_xtheadsync;
>  }
>
>  #define MATERIALISE_EXT_PREDICATE(ext)  \
> diff --git a/target/riscv/xthead.decode b/target/riscv/xthead.decode
> index 30533a66f5..1d86f3a012 100644
> --- a/target/riscv/xthead.decode
> +++ b/target/riscv/xthead.decode
> @@ -10,9 +10,11 @@
>
>  # Fields:
>  %rs1       15:5
> +%rs2       20:5
>
>  # Formats
>  @sfence_vm  ....... ..... .....   ... ..... ....... %rs1
> +@rs2_s      ....... ..... ..... ... ..... .......   %rs2 %rs1
>
>  # XTheadCmo
>  th_dcache_call   0000000 00001 00000 000 00000 0001011
> @@ -36,3 +38,10 @@ th_icache_iva    0000001 10000 ..... 000 00000 0001011=
 @sfence_vm
>  th_l2cache_call  0000000 10101 00000 000 00000 0001011
>  th_l2cache_ciall 0000000 10111 00000 000 00000 0001011
>  th_l2cache_iall  0000000 10110 00000 000 00000 0001011
> +
> +# XTheadSync
> +th_sfence_vmas   0000010 ..... ..... 000 00000 0001011 @rs2_s
> +th_sync          0000000 11000 00000 000 00000 0001011
> +th_sync_i        0000000 11010 00000 000 00000 0001011
> +th_sync_is       0000000 11011 00000 000 00000 0001011
> +th_sync_s        0000000 11001 00000 000 00000 0001011
> --
> 2.38.1
>
>

