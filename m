Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3939C04FFE
	for <qemu-riscv@archiver.kernel.org>; Tue, 14 May 2024 07:15:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1s6mNd-0000Sh-KE; Tue, 14 May 2024 03:15:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1s6mNa-0000RV-NG
 for qemu-riscv@nongnu.org; Tue, 14 May 2024 03:15:18 -0400
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1s6mNX-0004tr-1m
 for qemu-riscv@nongnu.org; Tue, 14 May 2024 03:15:18 -0400
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2e576057c06so31701661fa.0
 for <qemu-riscv@nongnu.org>; Tue, 14 May 2024 00:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715670912; x=1716275712;
 darn=nongnu.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RxksW1mGxFAaBNyYAzwQCnvb9fUXy05bkGDgBkqV794=;
 b=0jeB6zkRQ8Z1PlZbT9IMp7HAv1aLSPbZLZfFAqodcn7ZzxKto30paa6F0Is8xTTb65
 f/vIxjPLpIIacKfNScTu4CPFniWFYMTESEr0WXTyNSGOYUQcR7leeEvcEaW8/zlPRfRh
 UFjmP8uOnZBynG4WH6gmZD3UsmyDanYYmpzBXbgm/3H/FTfQrmToG/RVyKl+wOLI3/Jh
 Ru21KU6vtysjaZ2Tgubx82sjD9nIShPRrLBT4Ixs9OD5LsqMZvnRaNNQTWVHRzP6Seki
 yKt53SNpyqAsu+S959fsPIK796NNGutGEkP4z6c8YJyaE6QvVa8aQ5pK0efp3PskMUye
 Ha7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715670912; x=1716275712;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RxksW1mGxFAaBNyYAzwQCnvb9fUXy05bkGDgBkqV794=;
 b=fHLcEy/uzTp9kezv9JkAg4A2TmxLIRy2zkLSYWr4jLXf2FM/IZX2gYi5ZTHUCYeR23
 423egKjTSMQ3HAUYOR+nZyxWQm94zZbK22VFjJDDTceBOldzsf9vYeVvYXrtVzQbGzCv
 eEuU4uLleWyTAi5TMrJYkWMRtS3sDULSY+IalCws7EqEGU8F9Hk8Cwf2+4mIJss4YgTg
 y4JAYSKiUhw3EFrlm9Ht/1qSqVplCSKYEVb1mzZl7DKTHKCZsKUSz+LFcHAUvdUbiBqR
 QEtZVw3yPnGOjCaRj3PMYddEX5ES8QKkWvhF7ZRn/EalyXg+Lsu7Fg4br4eXLCPQ3AZq
 d2Lw==
X-Gm-Message-State: AOJu0Yzkov1/jzdM2PMTr6n2LaY/UsoJYwCnfAe0B89TF77v+cS57FTA
 go8FvIEiJjSVk+RQSf+SEbWrnJuuokL5CI+2/RXgowU1Ze0cyklkEk1rvlUi0/+4g8BGog3bBDp
 8uZC2Lhtolx8idaGGhpT71R0lJ4oFDEVhiVMVqA==
X-Google-Smtp-Source: AGHT+IHmE8C3tcKvNyFQQxm+Gi5twiCOHgYCtbxmWUtfsUVXzs1ryIiCd6VntOVn+mj5J7ASiONeZpLaRhnBqdlQKK4=
X-Received: by 2002:a2e:bc06:0:b0:2dc:e69a:fdbc with SMTP id
 38308e7fff4ca-2e51fd2dcd8mr94054481fa.1.1715670912122; Tue, 14 May 2024
 00:15:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240429-countinhibit_fix-v1-0-802ec1e99133@rivosinc.com>
 <CAKmqyKN9W+xY-gBZD=6T-iOzrX0MAMcTE4Zd74hmgTtP8hnObQ@mail.gmail.com>
In-Reply-To: <CAKmqyKN9W+xY-gBZD=6T-iOzrX0MAMcTE4Zd74hmgTtP8hnObQ@mail.gmail.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Tue, 14 May 2024 00:15:01 -0700
Message-ID: <CAHBxVyED-ji_pr=XfeDjxUht=9qvcizK3RniijpzX6xC26oshg@mail.gmail.com>
Subject: Re: [PATCH 0/3] Assorted fixes for PMU
To: Alistair Francis <alistair23@gmail.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, palmer@dabbelt.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, bin.meng@windriver.com, 
 dbarboza@ventanamicro.com, alistair.francis@wdc.com, 
 Rajnesh Kanwal <rkanwal@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=atishp@rivosinc.com; helo=mail-lj1-x22b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, May 13, 2024 at 11:29=E2=80=AFPM Alistair Francis <alistair23@gmail=
.com> wrote:
>
> On Tue, Apr 30, 2024 at 5:29=E2=80=AFAM Atish Patra <atishp@rivosinc.com>=
 wrote:
> >
> > This series contains few miscallenous fixes related to hpmcounters
> > and related code. The first patch fixes an issue with cycle/instret
> > counters overcouting while the remaining two are more for specification
> > compliance.
> >
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
> > Atish Patra (3):
> >       target/riscv: Save counter values during countinhibit update
> >       target/riscv: Enforce WARL behavior for scounteren/hcounteren
> >       target/riscv: Fix the predicate functions for mhpmeventhX CSRs
>
> Thanks!
>
> Applied to riscv-to-apply.next
>

Hi Alistair,
Thanks for your review. But the patch 1 had some comments about
vmstate which needs updating.
We also found a few more fixes that I was planning to include in v2.

I can send a separate fixes series on top riscv-to-apply.next or this
series can be dropped for the time being.
You can queue it v2 later. Let me know what you prefer.


> Alistair
>
> >
> >  target/riscv/cpu.h     |   1 -
> >  target/riscv/csr.c     | 111 ++++++++++++++++++++++++++++++-----------=
--------
> >  target/riscv/machine.c |   1 -
> >  3 files changed, 68 insertions(+), 45 deletions(-)
> > ---
> > base-commit: 1642f979a71a5667a05070be2df82f48bd43ad7a
> > change-id: 20240428-countinhibit_fix-c6a1c11f4375
> > --
> > Regards,
> > Atish patra
> >
> >

