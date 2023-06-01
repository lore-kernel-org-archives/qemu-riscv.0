Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 481C0C7EE23
	for <qemu-riscv@archiver.kernel.org>; Thu,  1 Jun 2023 05:24:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q4ani-000179-MZ; Thu, 01 Jun 2023 01:24:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q4anh-00016s-93; Thu, 01 Jun 2023 01:24:41 -0400
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q4anf-0002eU-Ij; Thu, 01 Jun 2023 01:24:40 -0400
Received: by mail-vk1-xa2c.google.com with SMTP id
 71dfb90a1353d-456d9652c24so1200096e0c.1; 
 Wed, 31 May 2023 22:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685597078; x=1688189078;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=REc/4jXtfJYIeIoqt+hnIhoQiPveIUtvvYZmSs24krY=;
 b=GoBoNjk15ULEP83S1R3Hs7+429dOLjrodWf5BGWtoWyo6b3xIQT4pPt0vqMqpjSalu
 lHD59l2TurbiP8CqLlTr80o6hMiILJOXcq9kGhUBHR/HMq3mHq7qjw3BQppuuauBDWr8
 gXRDtyiHQaKe3WSLrW2fOGD/DZA6kvwYUtMqLncBMOf5EJMCbytd+4Rv4ZKqSggeWjhT
 rAjdJhbbcHDuZIzvbWjvSfbpq345A5bGJCE/MHrnx7KX/ATg1s1JfoZRfcX1ssrSs4OI
 3vftQ/VOKQJLZebqEnmO0PtHOgJKAU8gOwsUS1yS3P4pyg6E7b5+OShDijV4OwMC1JSr
 Ydag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685597078; x=1688189078;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=REc/4jXtfJYIeIoqt+hnIhoQiPveIUtvvYZmSs24krY=;
 b=PvhUohwvJUdij28VzdD+s+UOk++OcSFu2onzffPXIp1fJFBVLnEr5W55Cm9mg/5Jzr
 1N7n/n9D0bdTgvtFnFHJDhX98v9qhGdpbrUdlmsKXX0NMdKbXRw210eqZsSSWbkU0oYi
 Rx81B4Ns8998TSav3OoXLbBfm4VM5k8HRp7TLNHVB2omfHK8l2Tx2DreW2nJOD29sKZk
 xxCtY54b/LdxWDZ12wMv3/SaY3I770KTLoiBqAa1lBHKY9cunr81qefP7MyP0fjFC+c9
 U2PnH1lZrmwDP7XaWQpt68oatRi+UmNPHlQO3Hh36fmkQ37/FA9jbup7WUlLRWhQvTvP
 3VcQ==
X-Gm-Message-State: AC+VfDwUIoQ7SU4JN6LxCwwKegpVyluesQZUM5hLoxsAHYgLoHzgJJBa
 jJb19yBNoggYpRduGPMHy7C4TMlbfEfWTYpvtADwVzAgKhI=
X-Google-Smtp-Source: ACHHUZ4bP9H/TtXSOX+zeAXuTanriptkEDiYV6OynX1cowZRJY2Hz2eOP+LZmo2/PiaIkDQUESFXXVS00aZ1Q7zKRu4=
X-Received: by 2002:ac5:c7c6:0:b0:446:b903:d76c with SMTP id
 e6-20020ac5c7c6000000b00446b903d76cmr286226vkn.5.1685597078081; Wed, 31 May
 2023 22:24:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230529121719.179507-1-liweiwei@iscas.ac.cn>
 <20230529121719.179507-2-liweiwei@iscas.ac.cn>
In-Reply-To: <20230529121719.179507-2-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 1 Jun 2023 15:24:12 +1000
Message-ID: <CAKmqyKMwrBeB4zdkwrwQ2T=wbJ4QF3DBbNZ-y_jD_65ouwzcyg@mail.gmail.com>
Subject: Re: [PATCH 1/4] target/riscv: Make MPV only work when MPP != PRV_M
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2c;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2c.google.com
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

On Mon, May 29, 2023 at 10:19=E2=80=AFPM Weiwei Li <liweiwei@iscas.ac.cn> w=
rote:
>
> Upon MRET or explicit memory access with MPRV=3D1, MPV should be ignored
> when MPP=3DPRV_M.
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu_helper.c | 3 ++-
>  target/riscv/op_helper.c  | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index 09ea227ceb..bd892c05d4 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -46,7 +46,8 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch=
)
>
>          if (mode =3D=3D PRV_M && get_field(status, MSTATUS_MPRV)) {
>              mode =3D get_field(env->mstatus, MSTATUS_MPP);
> -            virt =3D get_field(env->mstatus, MSTATUS_MPV);
> +            virt =3D get_field(env->mstatus, MSTATUS_MPV) &&
> +                   (mode !=3D PRV_M);
>              if (virt) {
>                  status =3D env->vsstatus;
>              }
> diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
> index f563dc3981..9cdb9cdd06 100644
> --- a/target/riscv/op_helper.c
> +++ b/target/riscv/op_helper.c
> @@ -335,7 +335,8 @@ target_ulong helper_mret(CPURISCVState *env)
>          riscv_raise_exception(env, RISCV_EXCP_INST_ACCESS_FAULT, GETPC()=
);
>      }
>
> -    target_ulong prev_virt =3D get_field(env->mstatus, MSTATUS_MPV);
> +    target_ulong prev_virt =3D get_field(env->mstatus, MSTATUS_MPV) &&
> +                             (prev_priv !=3D PRV_M);
>      mstatus =3D set_field(mstatus, MSTATUS_MIE,
>                          get_field(mstatus, MSTATUS_MPIE));
>      mstatus =3D set_field(mstatus, MSTATUS_MPIE, 1);
> --
> 2.25.1
>
>

