Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oWDqC-0008P0-Jm
	for mharc-qemu-riscv@gnu.org; Thu, 08 Sep 2022 05:28:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1oWDqA-0008LK-HM
 for qemu-riscv@nongnu.org; Thu, 08 Sep 2022 05:28:54 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:42648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1oWDq8-00020r-Id
 for qemu-riscv@nongnu.org; Thu, 08 Sep 2022 05:28:53 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id 130so19907739ybz.9
 for <qemu-riscv@nongnu.org>; Thu, 08 Sep 2022 02:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=AF+f9eEJ409hGyNEnksAON6G9r1FqoORpv152wvpmQg=;
 b=Yncluv96mXYSpyWGk4FdQhiilVsorlWNfrzjuuZH+ITbJIfnIhY/BZjPez8F88CnRB
 ptcFhD1BXCocQe0ovQeBsa0jYx6LR3QNsWQ4zgCno3xp6pHOSE/ylbnFJKGPIibj12Wn
 07dwtY42SevsY+YwHCAhedtkOgVynOnPby5YJtiy8rUV6JW5a1XzKFUaZX884WAmj45R
 /3AIb8UWR25HCXQigRNuRlzpXD+HL1dvJo6Rn6KQhPETtlDSyR5srFYuUglPt6pN8r+E
 YxeCZAHxKWP2pzIxOkCDlALpi35JpRusJLDcc5ipbFDp8mmw7VHBRWKK1zNz2x2vcoXp
 oE1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=AF+f9eEJ409hGyNEnksAON6G9r1FqoORpv152wvpmQg=;
 b=fFkC8bXcnQvj0wxoTYnwFAARy47YuFbnqSL2gPiQRC5n2rr5b1L00N/CW9r1xrQKD6
 mdt4e+5fxUEBl1p8lQZmj20ou9dHNWaVyfZkjtLH2blF6HAhyGgcyW20JUJBdP7s/MkI
 hlZlO8YkFrKnKrnSYN5Uj6lQMa0egW2DMV7FHOoVUtNPDlrSqo5TSdJIt1ftRFbm/B7/
 0skib+xcsgEPQL+HkFWolgPBEawtVOEcL8J+9F/OLvU1xlwj9I9RqzQSWgrOul/7J/Wd
 ks290ACij01Of//soS29YcbUTDFOWXcbsu/wXa+I7+/EeKatzY3nh+nNV/d0c+xUlMbZ
 D2Lg==
X-Gm-Message-State: ACgBeo3LnF5HjbizlEo99lJkXiYCvSnGTx5SkuclpLT+HsO9/Nn3Qd4c
 dY7Z+mNP4RpcYGqCZltt05VjJ/NOKeS5QgkXyeNvtQ==
X-Google-Smtp-Source: AA6agR7R7iT/HvC7XDnQPL8G8wGrradct999w4v4zPVzMhZ9sDbAPlOqTVp93B7uxhM6cXTH5eO8C1j3nTd4AaSLtOA=
X-Received: by 2002:a05:6902:72d:b0:6ac:a489:f920 with SMTP id
 l13-20020a056902072d00b006aca489f920mr6317475ybt.439.1662629331132; Thu, 08
 Sep 2022 02:28:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220812131304.1674484-1-philipp.tomsich@vrull.eu>
 <20220812131304.1674484-2-philipp.tomsich@vrull.eu>
 <CAFEAcA9tQDu_4N+6QKhX66R5PtddXWkL-zmn1vDTDdQceCtHdA@mail.gmail.com>
 <CAAeLtUDmvuje+cLB6j+_JjUt3TQaEoJYRypjd=dMNwkFsD0sDA@mail.gmail.com>
 <CAKmqyKMCUyTtTarDcXjxjTDe7JapuegxMB9x57rtG+7rNELVQg@mail.gmail.com>
In-Reply-To: <CAKmqyKMCUyTtTarDcXjxjTDe7JapuegxMB9x57rtG+7rNELVQg@mail.gmail.com>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Thu, 8 Sep 2022 11:28:40 +0200
Message-ID: <CAAeLtUBKmLQpq3swsBJyNG14f35WO1hqr=oT4xfEovUWa0T4yA@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/riscv: fence: reconcile with specification
To: Alistair Francis <alistair23@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-yb1-xb2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Thu, 08 Sep 2022 09:28:54 -0000

On Thu, 8 Sept 2022 at 11:25, Alistair Francis <alistair23@gmail.com> wrote=
:
>
> On Fri, Aug 12, 2022 at 4:19 PM Philipp Tomsich
> <philipp.tomsich@vrull.eu> wrote:
> >
> > Happy to lower it back into the decode file.
> > However, I initially pulled it up into the trans-function to more
> > closely match the ISA specification: there is only one FENCE
> > instruction with 3 arguments (FM, PRED, and SUCC).
> > One might argue that the decode table for "RV32I Base Instruction Set"
> > in the specification lists FENCE.TSO as a separate instruction, but
> > the normative text doesn't (and FENCE overlaps FENCE.TSO in the
> > tabular representation) =E2=80=94 so I would consider the table as
> > informative.
> >
> > I'll wait until we see what consensus emerges from the discussion.
>
> From the discussion on patch 1 it seems that QEMU ignoring these
> fields (current behaviour) is correct


Yes, this is an accurate reading of the situation.

Philipp.

