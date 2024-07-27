Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF559C3DA4A
	for <qemu-riscv@archiver.kernel.org>; Sat, 27 Jul 2024 01:33:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sXWJa-0007wD-TT; Fri, 26 Jul 2024 21:33:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1sXWJY-0007rO-RA
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2024 21:33:40 -0400
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1sXWJV-0007h7-Mb
 for qemu-riscv@nongnu.org; Fri, 26 Jul 2024 21:33:39 -0400
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-52f024f468bso2589662e87.1
 for <qemu-riscv@nongnu.org>; Fri, 26 Jul 2024 18:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722044015; x=1722648815;
 darn=nongnu.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QxARiKP/61j2b1JgXSpkXulZIFXK32udoRr06o5SeGs=;
 b=2NmuPs0Pw87D5CvDRmiuWogswM8rxAgnKfJSdqlntkRR37LLv8Sr8hSFC9s4RlSb65
 dOyXbgSYTRb+MjrqpwftnZ+UN5GrdkXEZfnmieqhObwzRKp98Uk9lqV3tyiNB4rz89d8
 aN7FjkvoxnSrcIxyeNSAV0lNHF+2+2Rr0ZXOOTH/30i8FmDJFq4BlP3IsYJ4Z/rBGUu3
 RJ0lynK3v5QVAaVZqgXOI7QCeEFlbVAvRs1Q1Y3DhZJCNSHRnomGJVJ8Mj2Iyxq0It6u
 f9L7ic1YjJ8SNXkzxevqosLqR71sZi1eeO8/AN8D35aaRKjHBeoSoi3w9Y+rkhaAfFQq
 1slw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722044015; x=1722648815;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QxARiKP/61j2b1JgXSpkXulZIFXK32udoRr06o5SeGs=;
 b=cgnPf7gkxh6dlGsJ/ADMyt5RtgLA2s4H6ymqZofLo2LHzRozWGejNan/Jh7W/n1OYC
 15n7JMXTppL1s08eEf5WGjcE7hpxdAdJnW+sAJoRSJ6oN+20+hP4JVXFqRyh27WRF+AA
 F1zDxmCHTHHB30PcNyNHFCZpqOggTYQMN4v/+IJnPhyKZqPM4QilOBsp99K/sbzew740
 eDtvhnC5WaTSEvzmuskel9e/XgWcNUdQCcNyYWFwPAdyx7zbhXcQ1so+T0ANmhbXdNjr
 6aBZ8oYprEL6+7fH/dPX3B6Mg+VP++eAMieMacE693gvguI0QSlK9y854/nl/oRlp6cM
 8Waw==
X-Gm-Message-State: AOJu0Yw+c3s8kFKYM7Rx5PlBAIl7X5m1FDhzGQUE+eYPab7joRcu5clO
 L4BzBL/wwc23eBuBFh9qOj/+aoZfk7qzfn2/xscZB7FMtGAg5YeKVT9N+k0rNYNL8ZlhjcQ9is+
 lXbFQmWf67/0YRGSqtR4Ape0vqDmsBlnNuDUuUQ==
X-Google-Smtp-Source: AGHT+IFgw7IRJ29U60mUW2RRJtRa9ZKYIl8tUEQTC64fgEmSRxWaojdsdAbc6tOMMW7Gaex8oJjtjuAJxvc95LrgPr8=
X-Received: by 2002:a19:f703:0:b0:52c:d834:4f2d with SMTP id
 2adb3069b0e04-5309b270abcmr815761e87.18.1722044015315; Fri, 26 Jul 2024
 18:33:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240723-counter_delegation-v2-0-c4170a5348ca@rivosinc.com>
 <20240723-counter_delegation-v2-1-c4170a5348ca@rivosinc.com>
 <CAKmqyKPEWgA=s5sokPG2_v2qdbuaHwdGf6RJzqFfL15Htq=vBA@mail.gmail.com>
In-Reply-To: <CAKmqyKPEWgA=s5sokPG2_v2qdbuaHwdGf6RJzqFfL15Htq=vBA@mail.gmail.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Fri, 26 Jul 2024 18:33:24 -0700
Message-ID: <CAHBxVyGzogwFhFu+kF=PvVEJ+Mm_1EYyaHD+6NR=mh9WrrEBBw@mail.gmail.com>
Subject: Re: [PATCH v2 01/13] target/riscv: Add properties for Indirect CSR
 Access extension
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, bin.meng@windriver.com, 
 dbarboza@ventanamicro.com, alistair.francis@wdc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=atishp@rivosinc.com; helo=mail-lf1-x12a.google.com
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

On Fri, Jul 26, 2024 at 12:42=E2=80=AFAM Alistair Francis <alistair23@gmail=
.com> wrote:
>
> On Wed, Jul 24, 2024 at 9:31=E2=80=AFAM Atish Patra <atishp@rivosinc.com>=
 wrote:
> >
> > From: Kaiwen Xue <kaiwenx@rivosinc.com>
> >
> > This adds the properties for sxcsrind. Definitions of new registers and
> > implementations will come with future patches.
> >
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > Signed-off-by: Kaiwen Xue <kaiwenx@rivosinc.com>
> > ---
> >  target/riscv/cpu.c     | 2 ++
> >  target/riscv/cpu_cfg.h | 2 ++
> >  2 files changed, 4 insertions(+)
> >
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index a90808a3bace..ebc19090b40d 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -183,12 +183,14 @@ const RISCVIsaExtData isa_edata_arr[] =3D {
> >      ISA_EXT_DATA_ENTRY(zhinxmin, PRIV_VERSION_1_12_0, ext_zhinxmin),
> >      ISA_EXT_DATA_ENTRY(smaia, PRIV_VERSION_1_12_0, ext_smaia),
> >      ISA_EXT_DATA_ENTRY(smcntrpmf, PRIV_VERSION_1_12_0, ext_smcntrpmf),
> > +    ISA_EXT_DATA_ENTRY(smcsrind, PRIV_VERSION_1_12_0, ext_smcsrind),
>
> This is actually part of the unpriv spec, so it's a bit weird that it
> depends on the priv spec. But that's how it's all set up.
>

Smcsrind is part of priv spec[1]. Am I missing something ?

https://drive.google.com/file/d/17GeetSnT5wW3xNuAHI95-SI1gPGd5sJ_/view

> But shouldn't this be PRIV_VERSION_1_13_0?
>

Yes. Sorry I forgot about that. smcntrpmf should also be PRIV_VERSION_1_13_=
0.
I will send a fix patch along with the v2 for assert fix.

> Alistair

