Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F99CD98F6
	for <qemu-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 04:19:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wbW8I-0004qe-4n; Mon, 22 Jun 2026 00:19:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <inochiama@gmail.com>)
 id 1wbW8F-0004mm-No
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 00:19:35 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <inochiama@gmail.com>)
 id 1wbW8E-00012s-1s
 for qemu-riscv@nongnu.org; Mon, 22 Jun 2026 00:19:35 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-37d826e9811so303869a91.1
 for <qemu-riscv@nongnu.org>; Sun, 21 Jun 2026 21:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782101972; x=1782706772; darn=nongnu.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=QolTTkpVKd+7jeO+KKc3dw6Bbx7udM/Jl5yFeMhdKb0=;
 b=n7/rmW/tj7QkRpqGemhmauT/zT3rM2rmx9R0rlnyXE0YIgvKvcTa/t173yryAWOZrd
 QIZpKDyP3ErNeaGom3XW+UflvJka5iTx6s73NS2ULUs/ubFjdJo22NF/fRMNqPKpifnQ
 HUnXpwg6JQajSikRLy+V9hreS7Cd1nSFKa5vcdhEXF7y5ZtnKjl6W07Qatk4XeGVOQIA
 rTaCoe8shssJ6/Eo4nDT+LMpKK6LjGHtLZLm/hBSL3UhksdLLuZkNyTD2WU9Y5wVxQ24
 zSf0LK65/lBBwUbOF1TAmatS1TFPCbU1aq9f10/ZdxLw7eLbo2dhCV+bb/44pwMEAWlA
 cWXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782101972; x=1782706772;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QolTTkpVKd+7jeO+KKc3dw6Bbx7udM/Jl5yFeMhdKb0=;
 b=X1RoLMlA4iTTvRuLmg2aPDz576sTnmD8q7mVZo94T55UgWme84EQ9gT+16AQH1vqD9
 dI2/q7+rg7c5HVQr7/pjcSbCxpdSDNXkIGEj5oMlVur+CUPJToZHd0qKBDvrPKYfgzRz
 q+2VRbkPXW0MJJbb1Fc7/0ghQs9nEWBOkJznG+TEpLcgxOzUqQg8IiJcIBPLErhahVb2
 SlnSOpD+SffMksP6egHj/kUiOTj3gEwKEl9aN6pN7+8nntm05J/rNgTDWcx5cRedgNY5
 J3vsUntFp035D5iPaR2bNo1OFdQnsEoPf6QJCoP3b/RP7WMrdnsnZOGTcgj3k1tYJs8j
 5AXA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrWoZOJdPPP3xtAm9ghOzPYQbiADAOBm0c0EpLHkdSx8EvMnUTyuqGR9/kiC4goVRYK3iEItOFBNSr/@nongnu.org
X-Gm-Message-State: AOJu0YxNL62595d8ot+JMlgvv4Zookt0lhPGx9vz7kM2jf+MjpM8CT8c
 4DM9AVHsGn64VVdNsmqIXa+Cfmz9mRYGKLZMzA7IloCsbLdbwr7/l8pa
X-Gm-Gg: AfdE7ckLBMAv9ZMU4LZmN5+xxUvbimsUir+Ur6xjIMcFpG4VgqMHNKIGUu7DNWhsMr8
 Y2lnrNpcm43jNlWicfBdW9HVjsgRhAo67qupm80nMjmfrY9xKzrMCN5z+vnLiC/6QRazQ7Wjfpg
 4aXINHCew7/GbXnRnJf3UqETlL+wX/3c6trzZfN0w0ep+kAAT7ld4ud0eF9pOqDNeq8tO4xoET0
 BDZUYmJLQgoOZuyhb85He1/rFeSqwSMNFlZpQpJZlpbXXiSGTj/Rr8ehDAOCXARN8dj9EJqQq4R
 D+R79sJ91Cw6DR9S1AecthY1xrKYXJeghviiSHss2QRv/y1KHq4p0ycd4UCzVPNTyBctqDqTLsA
 845khRsIYfTyIre5NmrtFRRO6ATdrgnl/F7aynwN61MBtSOWn+FeVV4V7RcMOYIQ+
X-Received: by 2002:a17:90b:274d:b0:36a:8240:2477 with SMTP id
 98e67ed59e1d1-37d15e8b6bcmr14363721a91.19.1782101972208; 
 Sun, 21 Jun 2026 21:19:32 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c8bc5a1d8acsm5665874a12.23.2026.06.21.21.19.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Jun 2026 21:19:31 -0700 (PDT)
Date: Mon, 22 Jun 2026 12:19:17 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alistair Francis <alistair23@gmail.com>, 
 Inochi Amaoto <inochiama@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li <liwei1518@gmail.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Chao Liu <chao.liu.zevorn@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] target/riscv: Check PMP before updating PTE
Message-ID: <aji3OBnXmA3J27I0@inochi.infowork>
References: <20260511083105.641907-1-inochiama@gmail.com>
 <CAKmqyKO=bNBy447j_nxBLG+djeVGUKRfEmNmvS1T5nX2UgC4DQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKmqyKO=bNBy447j_nxBLG+djeVGUKRfEmNmvS1T5nX2UgC4DQ@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=inochiama@gmail.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Mon, Jun 22, 2026 at 02:12:28PM +1000, Alistair Francis wrote:
> On Mon, May 11, 2026 at 10:55 PM Inochi Amaoto <inochiama@gmail.com> wrote:
> >
> > According to the RISC-V spec, the PTE update is a supervisor write
> > operations, and it should also follow the CPU PMP configuration like
> > the PTE read.
> >
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> 
> Logic looks good
> 
> > ---
> >  target/riscv/cpu_helper.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> > index 39c3486ae0..6edce36138 100644
> > --- a/target/riscv/cpu_helper.c
> > +++ b/target/riscv/cpu_helper.c
> > @@ -1604,6 +1604,14 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
> >              return TRANSLATE_FAIL;
> >          }
> >
> > +        int pmp_prot;
> > +        int pmp_ret = get_physical_address_pmp(env, &pmp_prot, pte_addr,
> > +                                               sxlen_bytes,
> > +                                               MMU_DATA_STORE, PRV_S);
> 
> Please don't mix code statements and declarations inside a block:
> https://qemu-project.gitlab.io/qemu/devel/style.html#declarations
> 
> ./scripts/checkpatch.pl should catch these type of errors
> 
> Alistair
>

Thanks, but something weird, the checkpatch does not catch this.
Maybe the script need a update?

This is the output from my branch:
$ ./scripts/checkpatch.pl --strict ./0001-target-riscv-Check-PMP-before-updating-PTE.patch 
total: 0 errors, 0 warnings, 14 lines checked

./0001-target-riscv-Check-PMP-before-updating-PTE.patch has no obvious style problems and is ready for submission.

Regards,
Inochi

> > +        if (pmp_ret != TRANSLATE_SUCCESS) {
> > +            return TRANSLATE_PMP_FAIL;
> > +        }
> > +
> >          /*
> >           * - if accessed or dirty bits need updating, and the PTE is
> >           *   in RAM, then we do so atomically with a compare and swap.
> > --
> > 2.54.0
> >
> >
> 

