Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D172CE7A8B
	for <qemu-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 02:01:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qkatk-0004lD-RG; Sun, 24 Sep 2023 22:00:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qkati-0004kc-SJ; Sun, 24 Sep 2023 22:00:30 -0400
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qkath-0001Ql-2t; Sun, 24 Sep 2023 22:00:30 -0400
Received: by mail-ua1-x92d.google.com with SMTP id
 a1e0cc1a2514c-7aba99b610fso185608241.1; 
 Sun, 24 Sep 2023 19:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695607228; x=1696212028; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nW6pNZ0yag3h8JQ4ljCu/G54yjcPYZNzhZCDRsV3cw4=;
 b=GsHmLU8UMKFmS6x7/8NF28hnnlHOggB92M66fEQ3R1FfA1wMU4FJ65eWT4+UjJU+oq
 XOA2UDHRXiaJRfmTSdOHW6hjdZb5PLAzBkgzdD66MhSP4xeLSzPu/gXOiSwl4g3liZF1
 D9l3lRHXTB96oUqAZFNLeJh7zjep4tuGT91CsT9lNzE+C7WRcNjf3S6382tefd7v+eHz
 4OoFGYDKd70D1nK8H53i19R3XSmBT6spXRm0BfW/DhDJPdWbfPn33n0sWw2qXAowxMvg
 HVEG6SLi7JAvbnc6oXtPX0t741RDv0T0QQph+5T4B4t4j6NxB8lhBl8uBrf868YSjxK3
 57LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695607228; x=1696212028;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nW6pNZ0yag3h8JQ4ljCu/G54yjcPYZNzhZCDRsV3cw4=;
 b=ektlVtPg9ELSLWq8Tmax/Xlw2qoJ7JoSAiPmsacJAbdOQupqHM2EG56cRBbvmsCTSo
 kXWrbHd+lUM66zU2dApT5uoiVhfKDf/ZgobxBDFKTBp/Zt6UcxuR79ys/DI+Rwnh/zs1
 XJFlTDkHrVeRkZpR3F8QbXI1wGG0aQJ6r+0UimWIaUcBMoLLgt1QpGg2jHFjr7ZQXFXx
 Y6bao8eu57stEpIGDKPHPf0YIChZmFMoreerFsVKIWlg4iw70Cp1j4yt9rZ6UCNRosXD
 Bsvj4bTqQTA2GzWUAqKm3xF4Fteo8Jiwyr+q60My2jDMQkGO6ydHV/lJtEyoduNn/VOU
 /SKQ==
X-Gm-Message-State: AOJu0YxclH1Tn9GQyX+OJ8KH0I9e4DZUZwmFZiWI7vxoV5F/GIND215D
 YKWf60FD3AcelDk6ELAWWBg9vKcgfsL8hbp2s3c=
X-Google-Smtp-Source: AGHT+IHEz4LmutXFUEdUz7YOyqP07tKzPCpsuoDLWWHbUcxrhbnd1K07547ppUT6eurTl1uCRvOhzhK/7sgSFX+Dk1c=
X-Received: by 2002:a67:be04:0:b0:44e:9f69:fa52 with SMTP id
 x4-20020a67be04000000b0044e9f69fa52mr1574531vsq.22.1695607227869; Sun, 24 Sep
 2023 19:00:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230920112020.651006-1-dbarboza@ventanamicro.com>
 <20230920112020.651006-19-dbarboza@ventanamicro.com>
In-Reply-To: <20230920112020.651006-19-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 25 Sep 2023 12:00:01 +1000
Message-ID: <CAKmqyKN0u255N8u93kQdGfj2nA_ggQtwDJ_XV9sJCvNd3nYd0w@mail.gmail.com>
Subject: Re: [PATCH v3 18/19] target/riscv/cpu.c: export isa_edata_arr[]
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, 
 palmer@rivosinc.com, philmd@linaro.org, ajones@ventanamicro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::92d;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x92d.google.com
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

On Wed, Sep 20, 2023 at 9:23=E2=80=AFPM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> This array will be read by the TCG accel class, allowing it to handle
> priv spec verifications on its own. The array will remain here in cpu.c
> because it's also used by the riscv,isa string function.
>
> To export it we'll finish it with an empty element since ARRAY_SIZE()
> won't work outside of cpu.c. Get rid of its ARRAY_SIZE() usage now to
> alleviate the changes for the next patch.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 47 +++++++++++++++++++++-------------------------
>  target/riscv/cpu.h |  7 +++++++
>  2 files changed, 28 insertions(+), 26 deletions(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 46263e55d5..e97ba3df93 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -41,15 +41,6 @@ static const char riscv_single_letter_exts[] =3D "IEMA=
FDQCPVH";
>  const uint32_t misa_bits[] =3D {RVI, RVE, RVM, RVA, RVF, RVD, RVV,
>                                RVC, RVS, RVU, RVH, RVJ, RVG, 0};
>
> -struct isa_ext_data {
> -    const char *name;
> -    int min_version;
> -    int ext_enable_offset;
> -};
> -
> -#define ISA_EXT_DATA_ENTRY(_name, _min_ver, _prop) \
> -    {#_name, _min_ver, CPU_CFG_OFFSET(_prop)}
> -
>  /*
>   * From vector_helper.c
>   * Note that vector data is stored in host-endian 64-bit chunks,
> @@ -61,6 +52,9 @@ struct isa_ext_data {
>  #define BYTE(x)   (x)
>  #endif
>
> +#define ISA_EXT_DATA_ENTRY(_name, _min_ver, _prop) \
> +    {#_name, _min_ver, CPU_CFG_OFFSET(_prop)}
> +
>  /*
>   * Here are the ordering rules of extension naming defined by RISC-V
>   * specification :
> @@ -81,7 +75,7 @@ struct isa_ext_data {
>   * Single letter extensions are checked in riscv_cpu_validate_misa_priv(=
)
>   * instead.
>   */
> -static const struct isa_ext_data isa_edata_arr[] =3D {
> +const RISCVIsaExtData isa_edata_arr[] =3D {
>      ISA_EXT_DATA_ENTRY(zicbom, PRIV_VERSION_1_12_0, ext_icbom),
>      ISA_EXT_DATA_ENTRY(zicboz, PRIV_VERSION_1_12_0, ext_icboz),
>      ISA_EXT_DATA_ENTRY(zicond, PRIV_VERSION_1_12_0, ext_zicond),
> @@ -160,6 +154,8 @@ static const struct isa_ext_data isa_edata_arr[] =3D =
{
>      ISA_EXT_DATA_ENTRY(xtheadmempair, PRIV_VERSION_1_11_0, ext_xtheadmem=
pair),
>      ISA_EXT_DATA_ENTRY(xtheadsync, PRIV_VERSION_1_11_0, ext_xtheadsync),
>      ISA_EXT_DATA_ENTRY(xventanacondops, PRIV_VERSION_1_12_0, ext_XVentan=
aCondOps),
> +
> +    DEFINE_PROP_END_OF_LIST(),
>  };
>
>  bool isa_ext_is_enabled(RISCVCPU *cpu, uint32_t ext_offset)
> @@ -178,14 +174,14 @@ void isa_ext_update_enabled(RISCVCPU *cpu, uint32_t=
 ext_offset, bool en)
>
>  int cpu_cfg_ext_get_min_version(uint32_t ext_offset)
>  {
> -    int i;
> +    const RISCVIsaExtData *edata;
>
> -    for (i =3D 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
> -        if (isa_edata_arr[i].ext_enable_offset !=3D ext_offset) {
> +    for (edata =3D isa_edata_arr; edata && edata->name; edata++) {
> +        if (edata->ext_enable_offset !=3D ext_offset) {
>              continue;
>          }
>
> -        return isa_edata_arr[i].min_version;
> +        return edata->min_version;
>      }
>
>      g_assert_not_reached();
> @@ -932,22 +928,21 @@ static void riscv_cpu_disas_set_info(CPUState *s, d=
isassemble_info *info)
>  void riscv_cpu_disable_priv_spec_isa_exts(RISCVCPU *cpu)
>  {
>      CPURISCVState *env =3D &cpu->env;
> -    int i;
> +    const RISCVIsaExtData *edata;
>
>      /* Force disable extensions if priv spec version does not match */
> -    for (i =3D 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
> -        if (isa_ext_is_enabled(cpu, isa_edata_arr[i].ext_enable_offset) =
&&
> -            (env->priv_ver < isa_edata_arr[i].min_version)) {
> -            isa_ext_update_enabled(cpu, isa_edata_arr[i].ext_enable_offs=
et,
> -                                   false);
> +    for (edata =3D isa_edata_arr; edata && edata->name; edata++) {
> +        if (isa_ext_is_enabled(cpu, edata->ext_enable_offset) &&
> +            (env->priv_ver < edata->min_version)) {
> +            isa_ext_update_enabled(cpu, edata->ext_enable_offset, false)=
;
>  #ifndef CONFIG_USER_ONLY
>              warn_report("disabling %s extension for hart 0x" TARGET_FMT_=
lx
>                          " because privilege spec version does not match"=
,
> -                        isa_edata_arr[i].name, env->mhartid);
> +                        edata->name, env->mhartid);
>  #else
>              warn_report("disabling %s extension because "
>                          "privilege spec version does not match",
> -                        isa_edata_arr[i].name);
> +                        edata->name);
>  #endif
>          }
>      }
> @@ -1619,13 +1614,13 @@ static void riscv_cpu_class_init(ObjectClass *c, =
void *data)
>  static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str,
>                                   int max_str_len)
>  {
> +    const RISCVIsaExtData *edata;
>      char *old =3D *isa_str;
>      char *new =3D *isa_str;
> -    int i;
>
> -    for (i =3D 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
> -        if (isa_ext_is_enabled(cpu, isa_edata_arr[i].ext_enable_offset))=
 {
> -            new =3D g_strconcat(old, "_", isa_edata_arr[i].name, NULL);
> +    for (edata =3D isa_edata_arr; edata && edata->name; edata++) {
> +        if (isa_ext_is_enabled(cpu, edata->ext_enable_offset)) {
> +            new =3D g_strconcat(old, "_", edata->name, NULL);
>              g_free(old);
>              old =3D new;
>          }
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index aba8192c74..3dfcd0732f 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -726,6 +726,13 @@ extern const RISCVCPUMultiExtConfig riscv_cpu_vendor=
_exts[];
>  extern const RISCVCPUMultiExtConfig riscv_cpu_experimental_exts[];
>  extern Property riscv_cpu_options[];
>
> +typedef struct isa_ext_data {
> +    const char *name;
> +    int min_version;
> +    int ext_enable_offset;
> +} RISCVIsaExtData;
> +extern const RISCVIsaExtData isa_edata_arr[];
> +
>  void riscv_add_satp_mode_properties(Object *obj);
>
>  /* CSR function table */
> --
> 2.41.0
>
>

