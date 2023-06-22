Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA7E9EB64D7
	for <qemu-riscv@archiver.kernel.org>; Thu, 22 Jun 2023 01:53:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qC9VQ-0006fR-0e; Wed, 21 Jun 2023 21:53:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qC9VO-0006en-EU; Wed, 21 Jun 2023 21:53:02 -0400
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qC9VM-0007F8-Tp; Wed, 21 Jun 2023 21:53:02 -0400
Received: by mail-ua1-x935.google.com with SMTP id
 a1e0cc1a2514c-78f6a9800c9so1816995241.3; 
 Wed, 21 Jun 2023 18:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687398779; x=1689990779;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wn0YWAvdfcSiievG8nrN7jyVdSBiTkhjLmsJovy7t6o=;
 b=MQaK1s7+cWYC07b9w6Dy6m03xrcZ1EbhWuTSqbKJuFPZlCHAvfVWj2xjLPdScFF3/d
 Rc6/d5QZqDcp3FRCvwQOyUI6DifU2pOm1Z3UNl+j6VWqZlORYx8Rr5SlYt97k3oyu2sd
 EAo4vPDsaNY72aQRZk28GvHlGHBqGLKEMeBy1G9lpvByjcokatIdoyQr2/ZmBcCgvPvC
 erJv2YztSO04+H7osX0wSPw7g7rxMHIsj5oe7tRNu0OGWcW/bGwlccU8PgJJugZkiPB6
 kasy7AE88CUv7azZOtrbby6H9gkT7kewIukmHcUJnuGSoVQZqoYuhTr+bhsxDKLrL7rf
 /xkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687398779; x=1689990779;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wn0YWAvdfcSiievG8nrN7jyVdSBiTkhjLmsJovy7t6o=;
 b=fZAOnQ8hxkGMz1WWVcgXLY55TnOgns9OXoXXLYtCYYMUPIb6pDR8pkjtwsBeigTV7Q
 BWh2wKyFPWXxRs3cV2+8uEYdans+LWcUbGgsl0jv2itHpYShpAL2lsF0BuIA+0HN3/F/
 hRUttUZ0la7HXsqNn7I7NANV0NuAIiuqcpvRJCuFXtF8HteNTml8D3HwlkGt5mZDYA2w
 Ks6LoABFT7iCOlBqR5sDHxEEhT9xayTQep5L4BVQ8EhJN3YBoxKn43AyfhbfxzsTXbMd
 KVOeyIisyZ5sFeHR/mzp24HzT7lvlPEwAVUD+gfL9hkpFWnIuMJ8cjHjkihnVID6sVd1
 QAXw==
X-Gm-Message-State: AC+VfDyRlPMaCVQxDc32H/k9XaS21hEUCy6D1KI9EpBhKRyjmgZAbkzX
 OdHuP5gPTr01W6KGQQbg9Tq50Ed3Nd5Gw2wHbdnyYSNWag4=
X-Google-Smtp-Source: ACHHUZ6ZO9YaximBNiuR3dTOasY0F2YCv3coWu/RiV8IK9Hz7N1UjEgYDG4RNgporkdlGcllvXkrc+EyZvoUApdfX4M=
X-Received: by 2002:a67:e3a6:0:b0:439:5a25:2e39 with SMTP id
 j6-20020a67e3a6000000b004395a252e39mr9423379vsm.34.1687398779328; Wed, 21 Jun
 2023 18:52:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230603134236.15719-1-liweiwei@iscas.ac.cn>
In-Reply-To: <20230603134236.15719-1-liweiwei@iscas.ac.cn>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 22 Jun 2023 11:52:33 +1000
Message-ID: <CAKmqyKMarKKeDJ2nnbhyutZsiSiby9VM6gMNzZVr9hfSUT_GMQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] target/riscv: Fix mstatus related problems
To: Weiwei Li <liweiwei@iscas.ac.cn>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, dbarboza@ventanamicro.com, 
 zhiwei_liu@linux.alibaba.com, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::935;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x935.google.com
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

On Sat, Jun 3, 2023 at 11:43=E2=80=AFPM Weiwei Li <liweiwei@iscas.ac.cn> wr=
ote:
>
> This patchset tries to fix some problems in the fields of mstatus, such a=
s make MPV only work when MPP !=3D PRM.
>
> The port is available here:
> https://github.com/plctlab/plct-qemu/tree/plct-mpv-upstream-v2
>
> v2:
> * Drop patch 3 (remove check on mode M for MPRV)
> * rebase on apply-to-riscv.next
>
> Weiwei Li (3):
>   target/riscv: Make MPV only work when MPP !=3D PRV_M
>   target/riscv: Support MSTATUS.MPV/GVA only when RVH is enabled
>   target/riscv: Remove redundant assignment to SXL

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  target/riscv/cpu_helper.c |  3 ++-
>  target/riscv/csr.c        | 14 ++++----------
>  target/riscv/op_helper.c  |  3 ++-
>  3 files changed, 8 insertions(+), 12 deletions(-)
>
> --
> 2.25.1
>
>

