Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2A81C77B7A
	for <qemu-riscv@archiver.kernel.org>; Thu,  1 Jun 2023 05:27:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1q4aqg-000216-4Q; Thu, 01 Jun 2023 01:27:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q4aqd-00020a-Mz; Thu, 01 Jun 2023 01:27:43 -0400
Received: from mail-vk1-xa2a.google.com ([2607:f8b0:4864:20::a2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1q4aqb-0003Y1-83; Thu, 01 Jun 2023 01:27:42 -0400
Received: by mail-vk1-xa2a.google.com with SMTP id
 71dfb90a1353d-4573e1e6cb9so1212413e0c.0; 
 Wed, 31 May 2023 22:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685597259; x=1688189259;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kK4XuB86r089Mt87qq3Nd+1iV5iXWnnzhQvRvfCYLbo=;
 b=fo4oVomOQH/33OPP+Xy/oY5DwUnvgsXyGmtooWGv3blyPFmtcjpSONTLrZaf0XZbly
 Eg5awrgm2PqU/6fTIDcelYxPCV1nOsFRix4S7pcOqP39Ma96We/kVAEbmieCMCuDC0Dl
 ZQKuic8H2cd7gXVJiYlzLSu3bPc0wjk2yhe+CmdnaSoCPzJHX+wGuMh/RnxQO5b8dAB0
 tS8Dks3KksggFUaJ9COa1X0AVNHCwjgPQStYD/m6Kdj4yQPprm3+zTXwosFvUr68G9Qc
 r8uy9B4vohA98kl4aexxstn3HXq5DtedVVXwGDUiYVX+ONmaJVtNLxgb6p+vblteBWuG
 hNxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685597259; x=1688189259;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kK4XuB86r089Mt87qq3Nd+1iV5iXWnnzhQvRvfCYLbo=;
 b=mArC7e6176g2/cvlXaMQIM2XMAi0FYoCfVTniKN+PzWNUWx6ktgvy98SKOfBmOquj1
 vW/M8aeYhMG/MyxT0cfPEPijQhTIJ7+H17nGmy7VkLGTetS4Up7YSnC3kvklG324vVgm
 ILdkn7CreBVFFpVH+NLPHVV26ipElZ0mIZZsafKMwg6J80G+vF2fGDCxqJ1IZ15ErxEW
 FeuVdw0XEL2Xs1l+//UCr8G04K9OafV4N98sBahMWnYFbcYPiKW6jXpT0VmTdPXVTkCP
 zQ0hImU7Accy/DfwEsGeW9uLNHfpYGcZc1FbGcTjuQPeU4XuCI9utCzUG6Cw6k1gd9Gr
 79RA==
X-Gm-Message-State: AC+VfDxhrgEOyDOOqQ2ORoUE37Y/0SrUSAfnN39VnkCOM15rGvhWVFgG
 uHeVM5moJ8RcFsBoRYTZhVUkMobwWLGfYvlUTvo=
X-Google-Smtp-Source: ACHHUZ4XE3PxK02SWbsFO1wqxf7eTt56pmYdNZmXnzZZF/JZtmbKFndSLeiv4IXpyZCUb3KXtcMr2SIDSN7F2A1EdAk=
X-Received: by 2002:a1f:4191:0:b0:447:fafb:c15 with SMTP id
 o139-20020a1f4191000000b00447fafb0c15mr289024vka.1.1685597258841; Wed, 31 May
 2023 22:27:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230529121719.179507-1-liweiwei@iscas.ac.cn>
 <20230529121719.179507-3-liweiwei@iscas.ac.cn>
In-Reply-To: <20230529121719.179507-3-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 1 Jun 2023 15:27:12 +1000
Message-ID: <CAKmqyKPmXXoVdSndTF+aF7A-3PqVrnw-NFG26sQQicxybwWpQA@mail.gmail.com>
Subject: Re: [PATCH 2/4] target/riscv: Remove check on mode for MPRV
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2a;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa2a.google.com
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
> Normally, MPRV can be set to 1 only in M mode (It will be cleared
> when returning to lower-privilege mode by MRET/SRET).
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---
>  target/riscv/cpu_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index bd892c05d4..45baf95c77 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -44,7 +44,7 @@ int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch=
)
>      if (!ifetch) {
>          uint64_t status =3D env->mstatus;
>
> -        if (mode =3D=3D PRV_M && get_field(status, MSTATUS_MPRV)) {
> +        if (get_field(status, MSTATUS_MPRV)) {

The original check is correct though, why remove it?

Alistair

>              mode =3D get_field(env->mstatus, MSTATUS_MPP);
>              virt =3D get_field(env->mstatus, MSTATUS_MPV) &&
>                     (mode !=3D PRV_M);
> --
> 2.25.1
>
>

