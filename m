Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AF6CC4332F
	for <qemu-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 00:53:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qyLxJ-0007o1-Ig; Wed, 01 Nov 2023 20:53:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qyLxI-0007na-4x; Wed, 01 Nov 2023 20:53:04 -0400
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1qyLxF-0001FL-Iz; Wed, 01 Nov 2023 20:53:03 -0400
Received: by mail-vs1-xe36.google.com with SMTP id
 ada2fe7eead31-45d235612afso267243137.0; 
 Wed, 01 Nov 2023 17:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698886379; x=1699491179; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NFZquteUlaXHsfxdOQR/y+8RRA1Ri+8EpFc3CvUu8RE=;
 b=G6CqH09YDwj37bGZipGDuSFCrKPjxCllHNn9FKJ347DdtoBSWEg6Xp8odrhQNJQ9G6
 Fk4CAhXUDtUwCDJlyy87HlMcCsV5f22sBrjG8tf2QDYAZVipT5lospxSa7ivzSTW6huc
 QYj4DHMYhTEnqzKoktcDuepILbG67FbMbk1btArxuSmE8I7AEr9A5lfgMmfH5fIuh8f7
 Tf+D0acWF5iYuJxxKpu+0/SzYbvwZvfIHv9ENmeXiDBTd42FHJpt5BmiJS8XJ93m+wom
 /dWVk1NjuHkcLs7NRBu/4tZEz13OvZ3vo96vVb+boOATzUiVCzUFp68KZpOfBinesL7b
 Q4SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698886379; x=1699491179;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NFZquteUlaXHsfxdOQR/y+8RRA1Ri+8EpFc3CvUu8RE=;
 b=Xh29VI7g/ArL6G6ZXrNvA0JgN3mKJgFL0BbtR3uEx1zpND/tcNgDDP5rUQa069imDp
 H8BYd4+prDlUBwjIQGSBWQbVul5u6dEl8894lhCNO2rGzSkH1GBVp/GywAdXzMeJmXRF
 bfchlhs1WlP8Lqtwd0BsQt5Rd6eyKXZIVWxWxYZxFqW441dhvwXBDBrmarg1HS4uOdEX
 rPA1vv7FHPebmbtu8SVr8ybZPhDIWTlHl1qoiJfxmU9dmZWMowe2j7lf3pO42yyuEPQ7
 vMsgSwuP2iK1x1OXGncTCgnYmM18UTkNSTRCj6fmHr0ad9brO8t/4qMnG1zwl+OURcSh
 lbaw==
X-Gm-Message-State: AOJu0YyBrgD4wZV6B+rEvsX9g9VzNyV/yqt1Ijy7NIGwEB96ZgKWo6xN
 3e1DHvAE/RiXE538VOBbyI/kWK/VfcNqQXD8QG0=
X-Google-Smtp-Source: AGHT+IGLjl2FaA0MmvIwc6H+gs4ptDHFfd3+Osdtogcgpk1pyhD29cq4Xpf3ggrwN8pHT48AL2UHYd6wFKav9Zd3IpE=
X-Received: by 2002:a05:6102:3643:b0:458:2e75:df90 with SMTP id
 s3-20020a056102364300b004582e75df90mr1660054vsu.9.1698886379100; Wed, 01 Nov
 2023 17:52:59 -0700 (PDT)
MIME-Version: 1.0
References: <20231026151828.754279-1-max.chou@sifive.com>
 <20231026151828.754279-12-max.chou@sifive.com>
In-Reply-To: <20231026151828.754279-12-max.chou@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 2 Nov 2023 10:52:32 +1000
Message-ID: <CAKmqyKPgvw_8XCZjVC1Qc3Vf27OkOANj4grj=dpV4Nf27t_ZkA@mail.gmail.com>
Subject: Re: [PATCH v2 11/14] disas/riscv: Add rv_fmt_vd_vs2_uimm format
To: Max Chou <max.chou@sifive.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e36;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe36.google.com
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

On Fri, Oct 27, 2023 at 1:21=E2=80=AFAM Max Chou <max.chou@sifive.com> wrot=
e:
>
> Add rv_fmt_vd_vs2_uimm format for vector crypto instructions.
>
> Signed-off-by: Max Chou <max.chou@sifive.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  disas/riscv.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/disas/riscv.h b/disas/riscv.h
> index 8abb578b515..b242d73b25e 100644
> --- a/disas/riscv.h
> +++ b/disas/riscv.h
> @@ -274,6 +274,7 @@ enum {
>  #define rv_fmt_vd_vs2_fs1_vm          "O\tD,F,4m"
>  #define rv_fmt_vd_vs2_imm_vl          "O\tD,F,il"
>  #define rv_fmt_vd_vs2_imm_vm          "O\tD,F,im"
> +#define rv_fmt_vd_vs2_uimm            "O\tD,F,u"
>  #define rv_fmt_vd_vs2_uimm_vm         "O\tD,F,um"
>  #define rv_fmt_vd_vs1_vs2_vm          "O\tD,E,Fm"
>  #define rv_fmt_vd_rs1_vs2_vm          "O\tD,1,Fm"
> --
> 2.34.1
>
>

