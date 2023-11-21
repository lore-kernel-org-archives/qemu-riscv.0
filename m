Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB6BC5ACB3
	for <qemu-riscv@archiver.kernel.org>; Tue, 21 Nov 2023 04:45:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r5Id9-0006Zu-V9; Mon, 20 Nov 2023 23:45:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1r5Id6-0006XO-Kp; Mon, 20 Nov 2023 23:44:56 -0500
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1r5Id4-0006jD-UF; Mon, 20 Nov 2023 23:44:56 -0500
Received: by mail-vs1-xe32.google.com with SMTP id
 ada2fe7eead31-462ac0f82e3so323045137.0; 
 Mon, 20 Nov 2023 20:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700541893; x=1701146693; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qDXJkcUjY9jheYpanOMTtzm4HcEyyA0Tvq22+8P3kYU=;
 b=WOoHG1x0Ezs/uJUxH91Ac8H83bzjnBYI2Nt0KkT7RjbgDhHlpXu6CuphBwxPCj7SwD
 PCkqIDrK6yCNLecPRZYEbuNimddddQ343b707DjXg+SMAkkE4Or+qW35edOs/Vm+rID0
 rZA4uB805wteGjiD6qNRSF3DcKJq6yX7P34xBQ5K0K5FnxZTD/Ss1KU7c4k4MXCJpoWM
 OgpnYvGF2T1IXPi9S/waO/p9l9seG7ltJXpRTADbppKa/T45qI5KO5PtXCcgRY1zzIz1
 HOJ+Fs0jPaBW8cuneNH87vxO7nNJhjajYupyiKNeFJAgAXmtfo1VIJqRb8rmK60oKfGT
 N2BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700541893; x=1701146693;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qDXJkcUjY9jheYpanOMTtzm4HcEyyA0Tvq22+8P3kYU=;
 b=VJ5M1oVMgWLOJAabqUBYWajXlURKkqJM6tgADq3GX3KLIt1ohuLGxbRF0XgjbqlwKH
 hOwWAs0Vbg9HqpMb1g0+jnTNRfW8PQXUd2VQbm6/3oaVC325uoq1t0KS2jWxtCdYg37L
 9URPkJbOJT0EB+14dIeGD3RSQiwFlwotA+LPLBFoClXFobqALg87vS3cegbTKCFdf00R
 1C1SlAExdTElEo3TQgx9+7vvGr5TICZHGyB829bG0JiuZbK2ZV28cz+4mgFBPZJYMgWe
 WUCluaFfFQoMI8BsfhRq5kpld2Wq1GVONbL07DyOP2FwL1ggx3oxBZlZzp5pfp3HPxAX
 ePFQ==
X-Gm-Message-State: AOJu0Yz1qOHuw8vfiYNS0M6KmUN+cYYXtx8wcbj/ANStnjdkjN0atmIk
 Vv0A7iJocHbXfO2x/rcLQwmWkWzmwV+Vj4Sk7FV+OatTxJYahg==
X-Google-Smtp-Source: AGHT+IFDCuBwgrcJt1Ihjizu1b3wCaU+4FFBTZItvDgciMuIU8S88sStlvhs4ZPFdk6bXwqhAlMpYsR6OSqCVQtsLMw=
X-Received: by 2002:a05:6102:1085:b0:462:9efa:77a0 with SMTP id
 s5-20020a056102108500b004629efa77a0mr5125226vsr.11.1700541893433; Mon, 20 Nov
 2023 20:44:53 -0800 (PST)
MIME-Version: 1.0
References: <20231120120609.37960-1-ivan.klokov@syntacore.com>
 <20231120120609.37960-2-ivan.klokov@syntacore.com>
In-Reply-To: <20231120120609.37960-2-ivan.klokov@syntacore.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 21 Nov 2023 14:44:26 +1000
Message-ID: <CAKmqyKOK5m8DewTx=JphWLUtrr9LK29R1BUN72qoUGc26FuEpg@mail.gmail.com>
Subject: Re: [PATCH 1/2] target/riscv/cpu_helper.c: Invalid exception on MMU
 translation stage
To: Ivan Klokov <ivan.klokov@syntacore.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com, 
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e32;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe32.google.com
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

On Mon, Nov 20, 2023 at 11:19=E2=80=AFPM Ivan Klokov <ivan.klokov@syntacore=
.com> wrote:
>
> According to RISCV priveleged spec sect. 5.3.2 Virtual Address Translatio=
n Process
> access-fault exceptions may raise only after PMA/PMP check. Current imple=
mentation
> generates an acces-fault for mbare mode even if there were no PMA/PMP err=
ors.
> This patch removes the erroneous MMU mode check and generates an access-f=
ault
> exception based on the pmp_violation flag only.
>
> Signed-off-by: Ivan Klokov <ivan.klokov@syntacore.com>

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

