Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66A99C61D97
	for <qemu-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 02:05:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r5cbi-0001TJ-5F; Tue, 21 Nov 2023 21:04:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1r5cbg-0001Sw-3p; Tue, 21 Nov 2023 21:04:48 -0500
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1r5cbe-0001zo-I5; Tue, 21 Nov 2023 21:04:47 -0500
Received: by mail-vs1-xe29.google.com with SMTP id
 ada2fe7eead31-45dadc5bf51so2303913137.2; 
 Tue, 21 Nov 2023 18:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700618685; x=1701223485; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3ECHSRcApMI7DC8w2naT+eoPg2M/bSJ6ZwAZGZJf7OU=;
 b=MRPLZrolDA08G1fD75ygiF11wuKiEQ0ijzMQ2PUaqcz7gEpEC3qc14BjDuQe4ODXfc
 CmeDo6Xt5qttYM51BS5kVrdyCbOwbALKqbjda/0Pui6esUVpkE4pCd//gkH1zlVU93qr
 PIFsQSBzZE5J/iJ62c8Z6GJtHrS/8NUmNIRKROixCNVq8ejs9JqqiOdXLc7Mt+ovGSQR
 ShbVqphgzEC6vTmgvvjQpuKAMzzWR7U6AOwaJWfG1fZQ/zkMb6ozjlyxIH33/BgJOPnb
 tC7fCo+yXEhpODD2RRRx3z0B9cQ/kBAip9jD2iNvmDWvGzTCszxCZsMxJVCE5MBk6Q6K
 Vycw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700618685; x=1701223485;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3ECHSRcApMI7DC8w2naT+eoPg2M/bSJ6ZwAZGZJf7OU=;
 b=bjT5cASXTSlpa4hcKNrs6FZ1VvJ8M+fsCgw1r+wJ9Ww4IMuCm2ds3MFZU3/oR0Z0K1
 s89oTDw7K8u+qBJ6KcaWQJrhzmOV32ASYkg3Nnsjy39jrKS2ffNubkx11OQilomTiTZp
 25tHntUo+N3JZQK5g1yN0sFf1o/KiDiXGNeHZdkSbA0JZ/dhTigKuazaVMOO6e0z0+Bj
 KvoNY/Lkb4iXHu6KZ8X9RwEm19mzo4N+u9nHpqoGVLva3cvCmvCB+UXoMOczO9rOJvSU
 5rLab6O/TpWpaVgiZt2NbTKaBdtH9NxtIhsy05FBnfgoP2njAit9SubGWOkRxNBtv4hI
 cT0w==
X-Gm-Message-State: AOJu0YxOQQlLvDvJW4GvovkoArmiBo1pkRdqBvByAdw5mGtb1zljIJi7
 zgN9lxja1Vfpn+vg3SChM+VnHkC7kY1OmVLc4VE=
X-Google-Smtp-Source: AGHT+IFzAk/OevAELnNry+n3V+u9tfo/FlTKasqUqPrDpcwk2usD9BRMke2XIzKRo+J/syW55SeQ07PC2NGa5Fza1Pw=
X-Received: by 2002:a05:6102:b10:b0:462:ba4d:ccd4 with SMTP id
 b16-20020a0561020b1000b00462ba4dccd4mr1267354vst.30.1700618684930; Tue, 21
 Nov 2023 18:04:44 -0800 (PST)
MIME-Version: 1.0
References: <20231121071757.7178-1-ivan.klokov@syntacore.com>
 <20231121071757.7178-2-ivan.klokov@syntacore.com>
In-Reply-To: <20231121071757.7178-2-ivan.klokov@syntacore.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 22 Nov 2023 12:04:17 +1000
Message-ID: <CAKmqyKOn3J7HqUcS2RLxE9dUJkUkKvmTySuA3EUDffPy__A6pA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] target/riscv/cpu_helper.c: Invalid exception on
 MMU translation stage
To: Ivan Klokov <ivan.klokov@syntacore.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com, 
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e29;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe29.google.com
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Tue, Nov 21, 2023 at 6:51=E2=80=AFPM Ivan Klokov <ivan.klokov@syntacore.=
com> wrote:
>
> According to RISCV privileged spec sect. 5.3.2 Virtual Address Translatio=
n Process
> access-fault exceptions may raise only after PMA/PMP check. Current imple=
mentation
> generates an access-fault for mbare mode even if there were no PMA/PMP er=
rors.
> This patch removes the erroneous MMU mode check and generates an access-f=
ault
> exception based on the pmp_violation flag only.
>
> Fixes: 1448689c7b ("target/riscv: Allow specifying MMU stage")
>
> Signed-off-by: Ivan Klokov <ivan.klokov@syntacore.com>

Please keep existing tags when sending a new version if there aren't any ch=
anges

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu_helper.c | 30 +++++++-----------------------
>  1 file changed, 7 insertions(+), 23 deletions(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index b7af69de53..9ff0952e46 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -1143,47 +1143,31 @@ static void raise_mmu_exception(CPURISCVState *en=
v, target_ulong address,
>                                  bool two_stage_indirect)
>  {
>      CPUState *cs =3D env_cpu(env);
> -    int page_fault_exceptions, vm;
> -    uint64_t stap_mode;
> -
> -    if (riscv_cpu_mxl(env) =3D=3D MXL_RV32) {
> -        stap_mode =3D SATP32_MODE;
> -    } else {
> -        stap_mode =3D SATP64_MODE;
> -    }
> -
> -    if (first_stage) {
> -        vm =3D get_field(env->satp, stap_mode);
> -    } else {
> -        vm =3D get_field(env->hgatp, stap_mode);
> -    }
> -
> -    page_fault_exceptions =3D vm !=3D VM_1_10_MBARE && !pmp_violation;
>
>      switch (access_type) {
>      case MMU_INST_FETCH:
>          if (env->virt_enabled && !first_stage) {
>              cs->exception_index =3D RISCV_EXCP_INST_GUEST_PAGE_FAULT;
>          } else {
> -            cs->exception_index =3D page_fault_exceptions ?
> -                RISCV_EXCP_INST_PAGE_FAULT : RISCV_EXCP_INST_ACCESS_FAUL=
T;
> +            cs->exception_index =3D pmp_violation ?
> +                RISCV_EXCP_INST_ACCESS_FAULT : RISCV_EXCP_INST_PAGE_FAUL=
T;
>          }
>          break;
>      case MMU_DATA_LOAD:
>          if (two_stage && !first_stage) {
>              cs->exception_index =3D RISCV_EXCP_LOAD_GUEST_ACCESS_FAULT;
>          } else {
> -            cs->exception_index =3D page_fault_exceptions ?
> -                RISCV_EXCP_LOAD_PAGE_FAULT : RISCV_EXCP_LOAD_ACCESS_FAUL=
T;
> +            cs->exception_index =3D pmp_violation ?
> +                RISCV_EXCP_LOAD_ACCESS_FAULT : RISCV_EXCP_LOAD_PAGE_FAUL=
T;
>          }
>          break;
>      case MMU_DATA_STORE:
>          if (two_stage && !first_stage) {
>              cs->exception_index =3D RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FA=
ULT;
>          } else {
> -            cs->exception_index =3D page_fault_exceptions ?
> -                RISCV_EXCP_STORE_PAGE_FAULT :
> -                RISCV_EXCP_STORE_AMO_ACCESS_FAULT;
> +            cs->exception_index =3D pmp_violation ?
> +                RISCV_EXCP_STORE_AMO_ACCESS_FAULT :
> +                RISCV_EXCP_STORE_PAGE_FAULT;
>          }
>          break;
>      default:
> --
> 2.34.1
>
>

