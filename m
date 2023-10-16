Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08AC7CDB465
	for <qemu-riscv@archiver.kernel.org>; Mon, 16 Oct 2023 04:43:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qsFRV-0007oU-8H; Mon, 16 Oct 2023 00:43:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qsFRT-0007nh-0s; Mon, 16 Oct 2023 00:42:59 -0400
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qsFRQ-0005YF-Vr; Mon, 16 Oct 2023 00:42:58 -0400
Received: by mail-vk1-xa2b.google.com with SMTP id
 71dfb90a1353d-4a4021adbc7so1580445e0c.2; 
 Sun, 15 Oct 2023 21:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697431375; x=1698036175; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mpc+TTN+XWmniPMtpwwMCTKg6dWgF7UHGA+iCMVUm44=;
 b=bcdaQDLv5X1dx6BieGAn4kBNgkM2jx0FtJqNTAmzPGyqzrE4DgnPPzDfOwPrQNQbfD
 HIo1dl0Soo1O6kl/afVjRqeIZEOien1yVzDLIO7AuEGAhlYYE+v2bRt6jw1MEHz2O9WP
 sO7XvofxK52qfvWhlrLYROhBCCNE2B84bjjKvNwHBHtnQJ0ZRun304xvN01QZI5/F0ui
 q6cTtB3mA9KPON61VPAVSVe5+/dqxzNLiarOiv3gHPLo7vkuH2L2/Ge4XtEB06odc6i+
 Ae4l+cBrSo77j+LCRYQ1gzum5L4g1nmUYx9SiYbou+j0vf53CWS3oka4ynixGPFgCdI1
 ZORQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697431375; x=1698036175;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mpc+TTN+XWmniPMtpwwMCTKg6dWgF7UHGA+iCMVUm44=;
 b=l384mOdBYwHjhNrML9+Rnw2lfJBiuRpm7aOEFvHFzANSxKCpnLlCNY7wXXdbWkYCQM
 KGvDb9U+1YxhXQTmByxuTWVf5cwD6Sz9F9RuULJD40PJfzlQ/oglrGNIok56yf7HdIWr
 Mm2KMk5lXV19uQZsazNKke2XPCBKTTqmSK4v5Du40YSm07XLj/7e3qPBVKOnFlrAuBgw
 SAmtZUUz9bkMe8DqE1Wg09VVJIvuBMiQdPdzUmiy17j95CQeVORjEQ9c/11Hv4hO4NRT
 bi/enupaMwQn6oRJRQlfsvrsyVrzlphniqjj1l3EwfCQpZbmvSHsnqli2IdWeoLp+SoU
 k0zA==
X-Gm-Message-State: AOJu0YyyGZ7ficujmScbXvpbNhi6rUvRHG3oTzZsfja9vvztMMJfC0bd
 lLIiR8tpo4Q6h1K48b0wgnbEjnhsE+hYgQN9Mcs=
X-Google-Smtp-Source: AGHT+IEDWJ2Ip+75F/NJQupKWab6b1RqoBPF9jtU77EapUCspUAe40VwBND4WUQyn7Qsb3Qu7JyietjFZE1EvJ4mzkI=
X-Received: by 2002:a1f:e404:0:b0:49a:1a56:945c with SMTP id
 b4-20020a1fe404000000b0049a1a56945cmr27171985vkh.13.1697431375418; Sun, 15
 Oct 2023 21:42:55 -0700 (PDT)
MIME-Version: 1.0
References: <20231012164604.398496-1-dbarboza@ventanamicro.com>
 <20231012164604.398496-4-dbarboza@ventanamicro.com>
In-Reply-To: <20231012164604.398496-4-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 16 Oct 2023 14:42:28 +1000
Message-ID: <CAKmqyKPzfeMFcKm5AMFWRB6ZNcscAT3bOqC1xMbQENtpq104GA@mail.gmail.com>
Subject: Re: [PATCH 3/4] target/riscv: rename ext_icbom to ext_zicbom
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2b;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2b.google.com
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

On Fri, Oct 13, 2023 at 2:47=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Add a leading 'z' to improve grepping. When one wants to search for uses
> of zicbom they're more likely to do 'grep -i zicbom' than 'grep -i
> icbom'.
>
> Suggested-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/riscv/virt.c                             | 2 +-
>  target/riscv/cpu.c                          | 6 +++---
>  target/riscv/cpu_cfg.h                      | 2 +-
>  target/riscv/insn_trans/trans_rvzicbo.c.inc | 8 ++++----
>  target/riscv/kvm/kvm-cpu.c                  | 6 +++---
>  5 files changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 9de578c756..54e0fe8ecc 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -263,7 +263,7 @@ static void create_fdt_socket_cpus(RISCVVirtState *s,=
 int socket,
>          qemu_fdt_setprop_string(ms->fdt, cpu_name, "riscv,isa", name);
>          g_free(name);
>
> -        if (cpu_ptr->cfg.ext_icbom) {
> +        if (cpu_ptr->cfg.ext_zicbom) {
>              qemu_fdt_setprop_cell(ms->fdt, cpu_name, "riscv,cbom-block-s=
ize",
>                                    cpu_ptr->cfg.cbom_blocksize);
>          }
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index fdbbafe7b3..c9020653cd 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -76,7 +76,7 @@ const uint32_t misa_bits[] =3D {RVI, RVE, RVM, RVA, RVF=
, RVD, RVV,
>   * instead.
>   */
>  const RISCVIsaExtData isa_edata_arr[] =3D {
> -    ISA_EXT_DATA_ENTRY(zicbom, PRIV_VERSION_1_12_0, ext_icbom),
> +    ISA_EXT_DATA_ENTRY(zicbom, PRIV_VERSION_1_12_0, ext_zicbom),
>      ISA_EXT_DATA_ENTRY(zicboz, PRIV_VERSION_1_12_0, ext_icboz),
>      ISA_EXT_DATA_ENTRY(zicond, PRIV_VERSION_1_12_0, ext_zicond),
>      ISA_EXT_DATA_ENTRY(zicsr, PRIV_VERSION_1_10_0, ext_zicsr),
> @@ -497,7 +497,7 @@ static void rv64_veyron_v1_cpu_init(Object *obj)
>      cpu->cfg.ext_zifencei =3D true;
>      cpu->cfg.ext_zicsr =3D true;
>      cpu->cfg.pmp =3D true;
> -    cpu->cfg.ext_icbom =3D true;
> +    cpu->cfg.ext_zicbom =3D true;
>      cpu->cfg.cbom_blocksize =3D 64;
>      cpu->cfg.cboz_blocksize =3D 64;
>      cpu->cfg.ext_icboz =3D true;
> @@ -1284,7 +1284,7 @@ const RISCVCPUMultiExtConfig riscv_cpu_extensions[]=
 =3D {
>      MULTI_EXT_CFG_BOOL("zhinx", ext_zhinx, false),
>      MULTI_EXT_CFG_BOOL("zhinxmin", ext_zhinxmin, false),
>
> -    MULTI_EXT_CFG_BOOL("zicbom", ext_icbom, true),
> +    MULTI_EXT_CFG_BOOL("zicbom", ext_zicbom, true),
>      MULTI_EXT_CFG_BOOL("zicboz", ext_icboz, true),
>
>      MULTI_EXT_CFG_BOOL("zmmul", ext_zmmul, false),
> diff --git a/target/riscv/cpu_cfg.h b/target/riscv/cpu_cfg.h
> index 9ea30da7e0..e6bef0070f 100644
> --- a/target/riscv/cpu_cfg.h
> +++ b/target/riscv/cpu_cfg.h
> @@ -63,7 +63,7 @@ struct RISCVCPUConfig {
>      bool ext_zkt;
>      bool ext_zifencei;
>      bool ext_zicsr;
> -    bool ext_icbom;
> +    bool ext_zicbom;
>      bool ext_icboz;
>      bool ext_zicond;
>      bool ext_zihintntl;
> diff --git a/target/riscv/insn_trans/trans_rvzicbo.c.inc b/target/riscv/i=
nsn_trans/trans_rvzicbo.c.inc
> index e5a7704f54..e6ed548376 100644
> --- a/target/riscv/insn_trans/trans_rvzicbo.c.inc
> +++ b/target/riscv/insn_trans/trans_rvzicbo.c.inc
> @@ -16,10 +16,10 @@
>   * this program.  If not, see <http://www.gnu.org/licenses/>.
>   */
>
> -#define REQUIRE_ZICBOM(ctx) do {    \
> -    if (!ctx->cfg_ptr->ext_icbom) { \
> -        return false;               \
> -    }                               \
> +#define REQUIRE_ZICBOM(ctx) do {     \
> +    if (!ctx->cfg_ptr->ext_zicbom) { \
> +        return false;                \
> +    }                                \
>  } while (0)
>
>  #define REQUIRE_ZICBOZ(ctx) do {    \
> diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
> index 090d617627..ad48c9bf30 100644
> --- a/target/riscv/kvm/kvm-cpu.c
> +++ b/target/riscv/kvm/kvm-cpu.c
> @@ -213,7 +213,7 @@ static void kvm_riscv_update_cpu_misa_ext(RISCVCPU *c=
pu, CPUState *cs)
>       .kvm_reg_id =3D _reg_id}
>
>  static KVMCPUConfig kvm_multi_ext_cfgs[] =3D {
> -    KVM_EXT_CFG("zicbom", ext_icbom, KVM_RISCV_ISA_EXT_ZICBOM),
> +    KVM_EXT_CFG("zicbom", ext_zicbom, KVM_RISCV_ISA_EXT_ZICBOM),
>      KVM_EXT_CFG("zicboz", ext_icboz, KVM_RISCV_ISA_EXT_ZICBOZ),
>      KVM_EXT_CFG("zihintpause", ext_zihintpause, KVM_RISCV_ISA_EXT_ZIHINT=
PAUSE),
>      KVM_EXT_CFG("zbb", ext_zbb, KVM_RISCV_ISA_EXT_ZBB),
> @@ -804,7 +804,7 @@ static void kvm_riscv_read_multiext_legacy(RISCVCPU *=
cpu,
>          kvm_cpu_cfg_set(cpu, multi_ext_cfg, val);
>      }
>
> -    if (cpu->cfg.ext_icbom) {
> +    if (cpu->cfg.ext_zicbom) {
>          kvm_riscv_read_cbomz_blksize(cpu, kvmcpu, &kvm_cbom_blocksize);
>      }
>
> @@ -897,7 +897,7 @@ static void kvm_riscv_init_multiext_cfg(RISCVCPU *cpu=
, KVMScratchCPU *kvmcpu)
>          kvm_cpu_cfg_set(cpu, multi_ext_cfg, val);
>      }
>
> -    if (cpu->cfg.ext_icbom) {
> +    if (cpu->cfg.ext_zicbom) {
>          kvm_riscv_read_cbomz_blksize(cpu, kvmcpu, &kvm_cbom_blocksize);
>      }
>
> --
> 2.41.0
>
>

