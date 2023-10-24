Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEAA1C25B67
	for <qemu-riscv@archiver.kernel.org>; Tue, 24 Oct 2023 00:31:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1qv5Jw-00089i-In; Mon, 23 Oct 2023 20:30:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1qv5Jt-00088Y-12
 for qemu-riscv@nongnu.org; Mon, 23 Oct 2023 20:30:54 -0400
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1qv5Jp-0004lK-Lx
 for qemu-riscv@nongnu.org; Mon, 23 Oct 2023 20:30:52 -0400
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-507b96095abso5840694e87.3
 for <qemu-riscv@nongnu.org>; Mon, 23 Oct 2023 17:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1698107447; x=1698712247;
 darn=nongnu.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hZIDcxlca7p9XBVGvLi+LRaNzw+sHyUcvlHAjA/fGh8=;
 b=parf7Q9a+Fd6hEQGlLn+VS/WOSfuZw4ry9vtsMT477KS/PuDIEcCkAx3+jh8CAQT4F
 6YBOawpAuB5pLLC6APLJFHMcSxI/sqzFi28IL80ekKQN1IWCF7pRzdfWSMjFLfsaGoD4
 UW6gp7UQcFkDdhKb1rGSjCBRSbWwmHhv97K4qrTGRqu62moyPBFe/Xzy7tZKZBmiPMj3
 tOMxJDwaw3dXSgfc/pjVnQOJjyDiqtQ9EHbqgyqqrPELBFLXDuVX+CE6HDrqMi9wy3Mk
 oOKGfEfT6RYXS8jlbaaFVd/BSdov8Y5SZuflIJCQYB3ccRu7pzd3PnPpwDeECJSgusHA
 1NLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698107447; x=1698712247;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hZIDcxlca7p9XBVGvLi+LRaNzw+sHyUcvlHAjA/fGh8=;
 b=Mgq29sXeYzFBcQ60TOCGZ9b/VW6bkFl7rhDrm27YwmM/vzvCUJgNkFT2ct/2pWDVsX
 7TtJgZSdUW3EG10fDf5SLPW4eV6cusJisoaEzfxeet6X0SXoq8MhC6BJddKHBqfvWcca
 ILgOdXRvcKU4a0jUoUAQOD4ge+SJggCtSSKicqyTjxekmlsGMcaAScajjzp6gWOrbjUo
 krR4iJEElvgTv6GrCxgr+LBA1jzwz5fbNCZgNpUq8AAki9Yed4MNbMxFj9vu5b46vK4L
 f3Ap9+LRrT8jNcPKHGrmJMdDUnf1voyvQ4uJgNd8hmOerLhlULe6f1QRVCInzHLqtoaw
 nq5w==
X-Gm-Message-State: AOJu0YzWAO3nVa9xNl8cAdvYzFOklcM9L0XthpDLTJvASdyxEQDgCtqO
 ZYxnM/FB349tACw46wM4weEbSkIrpEyK7M0zmZOT9g==
X-Google-Smtp-Source: AGHT+IGQslPupVujIPGeNSv5o7zUiJnA+g6CkEVuGosEFKVLmfPruprNwUoOWmwzGFn6+XVhKdFiYX1ViBqXshnDIpk=
X-Received: by 2002:a19:6716:0:b0:500:780b:5bdc with SMTP id
 b22-20020a196716000000b00500780b5bdcmr6858160lfc.49.1698107446919; Mon, 23
 Oct 2023 17:30:46 -0700 (PDT)
MIME-Version: 1.0
References: <20231018154434.17367-1-rbradford@rivosinc.com>
 <20231018154434.17367-6-rbradford@rivosinc.com>
 <CAKmqyKPeyseoGFtpHefWvLWSjjpZaAbBbSoQZyvb5Ti3SiGKsw@mail.gmail.com>
In-Reply-To: <CAKmqyKPeyseoGFtpHefWvLWSjjpZaAbBbSoQZyvb5Ti3SiGKsw@mail.gmail.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Mon, 23 Oct 2023 17:30:36 -0700
Message-ID: <CAHBxVyF_cGnOv-pUNV2DMEADBTFgHqwFjLQv9O3v_x0107OYWw@mail.gmail.com>
Subject: Re: [PATCH v4 5/6] docs/about/deprecated: Document RISC-V "pmu-num"
 deprecation
To: Alistair Francis <alistair23@gmail.com>
Cc: Rob Bradford <rbradford@rivosinc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, 
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com, 
 liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, 
 "reviewer:Incompatible changes" <libvir-list@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=atishp@rivosinc.com; helo=mail-lf1-x133.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Sun, Oct 22, 2023 at 7:04=E2=80=AFPM Alistair Francis <alistair23@gmail.=
com> wrote:
>
> On Thu, Oct 19, 2023 at 1:47=E2=80=AFAM Rob Bradford <rbradford@rivosinc.=
com> wrote:
> >
> > This has been replaced by a "pmu-mask" property that provides much more
> > flexibility.
> >
> > Signed-off-by: Rob Bradford <rbradford@rivosinc.com>
> > Acked-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>
> Alistair
>
> > ---
> >  docs/about/deprecated.rst | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> > index 2febd2d12f..857b5d4fc4 100644
> > --- a/docs/about/deprecated.rst
> > +++ b/docs/about/deprecated.rst
> > @@ -405,6 +405,18 @@ Specifying the iSCSI password in plain text on the=
 command line using the
> >  used instead, to refer to a ``--object secret...`` instance that provi=
des
> >  a password via a file, or encrypted.
> >
> > +CPU device properties
> > +'''''''''''''''''''''
> > +
> > +``pmu-num=3Dn`` on RISC-V CPUs (since 8.2)
> > +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > +
> > +In order to support more flexible counter configurations this has been=
 replaced
> > +by a ``pmu-mask`` property. If set of counters is continuous then the =
mask can
> > +be calculated with ``((2 ^ n) - 1) << 3``. The least significant three=
 bits
> > +must be left clear.
> > +
> > +
> >  Backwards compatibility
> >  -----------------------
> >
> > --
> > 2.41.0
> >
> >


Reviewed-by: Atish Patra <atishp@rivosinc.com>

