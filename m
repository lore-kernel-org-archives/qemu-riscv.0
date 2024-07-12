Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C8C8C3DA4A
	for <qemu-riscv@archiver.kernel.org>; Fri, 12 Jul 2024 09:08:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sSCGS-0003XP-Hr; Fri, 12 Jul 2024 05:08:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1sSCGL-0003AY-LO
 for qemu-riscv@nongnu.org; Fri, 12 Jul 2024 05:08:22 -0400
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1sSCGK-0000Q3-0E
 for qemu-riscv@nongnu.org; Fri, 12 Jul 2024 05:08:21 -0400
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-52ea5dc3c66so2880446e87.3
 for <qemu-riscv@nongnu.org>; Fri, 12 Jul 2024 02:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1720775298; x=1721380098; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Hoi5Ljthle/R6Uu59pU98XoPZerV++ElxTvv045jQFg=;
 b=l4KzkVneOPC05GQVDXtHDW5J19EG3DKkBBLV3bAL1icqbX2MNtKxXhpKErdCeHMMr5
 jWzZyJwATHo/6JTemV5AI93mudeV++7H+v3CLzeXI4Cqlrl6CxdqBGUlbTRZ4ggQMUZW
 xHCrC+iO4S3JHHxgzNr47fiD5f7JYlfHOTH/J9y3/efJEnEr/EVAaBiogLBOT6aQhRKJ
 6vBbKmHVVwO0dGBAQVco+FmyyBdIiWk5X9njTMRm5guxFNimOO5ZdJcrvwYlVx6kEWWg
 LtwvQt9fxwLCuWIXIPuJWHNR3Frclkho9rMdk6l6rK1Vi/vnL7hjYH+h3yyPZKenMDKh
 QtDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720775298; x=1721380098;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Hoi5Ljthle/R6Uu59pU98XoPZerV++ElxTvv045jQFg=;
 b=XMbYUBBLBNKOg2J3DBCH13hjz54XaQ+jsTHLbudKz8SSojyzouGXjTP9kfwqoTu9M/
 TX8CqcJx796kK7lu+g5FSUF4xaaNBQcyrkcJArOS7MTm9nmqWg49v0e7UWEdpAI6qj+w
 9eAd0YZtIN1pAbh1uleduK2LNPyu1Tcy8HkQxqeesd+LuRKg12K8lj6Q2QtCvMzVcQcB
 MgiUHtQAmY07fpQWqDX5TIBN/aaifXC3QttG6ohL2nYd2mK3p5/FdgAvcSRBXS1mAgDQ
 NIjDe9Ac8tulVk21/DYHW4F39uLQehBR/QeYrIRIA0M0+RZoDpP4X0YRoEndot7qQr/8
 +bvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBcrswZZtnFVA7biufx7fMy2NEq9Sl+69AGNted6Rz7w5grSfaT2AEmJanNbBk8LzVbcnHVD4G9qE/B/o2ByPum0H5v9c=
X-Gm-Message-State: AOJu0YwqSzLPPybXBIDBpCIRAe0x+Lbwg8+U9d8Cr2sAPnXUyFgv8ozG
 wq1yN1ePpvwTzBoyA42XGCMbZ4RG9pMlO1d4QCK28IFrJj/+PE4NF5Wq83yI+MnZlImZ2aXdMmP
 wviwoLOaAzhBbjVJ+acvo3EVLWUInfBOv/Y+xmQ==
X-Google-Smtp-Source: AGHT+IF7TyTyCwMn1NkhNPH3Vt2X0Q24QuSmo8xQWWRDMmztVcxxI6vVqKVEiW5xcK7RhPDaZqfwpKC/K1OjxvVfeYI=
X-Received: by 2002:a05:6512:39cc:b0:52e:96d7:2f38 with SMTP id
 2adb3069b0e04-52eb99d6840mr10486832e87.62.1720775297954; Fri, 12 Jul 2024
 02:08:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240709113652.1239-1-zhiwei_liu@linux.alibaba.com>
 <20240709113652.1239-5-zhiwei_liu@linux.alibaba.com>
In-Reply-To: <20240709113652.1239-5-zhiwei_liu@linux.alibaba.com>
From: Jim Shu <jim.shu@sifive.com>
Date: Fri, 12 Jul 2024 17:08:06 +0800
Message-ID: <CALw707qPBsfAAo52q4o9nDYgaZf-M=JbKC+x0Njx9XnQrmGJdQ@mail.gmail.com>
Subject: Re: [PATCH v4 04/11] disas/riscv: Support zcmop disassemble
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, palmer@dabbelt.com, 
 alistair.francis@wdc.com, dbarboza@ventanamicro.com, liwei1518@gmail.com, 
 bmeng.cn@gmail.com, Deepak Gupta <debug@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=jim.shu@sifive.com; helo=mail-lf1-x12e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Tue, Jul 9, 2024 at 7:41=E2=80=AFPM LIU Zhiwei <zhiwei_liu@linux.alibaba=
.com> wrote:
>
> Although in QEMU disassemble, we usually lift compressed instruction
> to an normal format when display the instruction name. For C.MOP.n,
> it is more reasonable to directly display its compressed name, because
> its behavior can be redefined by later extension.
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Acked-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Deepak Gupta <debug@rivosinc.com>
> ---
>  disas/riscv.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)

Reviewed-by: Jim Shu <jim.shu@sifive.com>

