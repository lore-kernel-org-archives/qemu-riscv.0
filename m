Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEEA5CDE00B
	for <qemu-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 01:38:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wcvWJ-0003RI-NO; Thu, 25 Jun 2026 21:38:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wcvWE-0003N1-2y
 for qemu-riscv@nongnu.org; Thu, 25 Jun 2026 21:38:10 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1wcvWC-0001e7-7K
 for qemu-riscv@nongnu.org; Thu, 25 Jun 2026 21:38:09 -0400
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-c121e505e4eso53730166b.2
 for <qemu-riscv@nongnu.org>; Thu, 25 Jun 2026 18:38:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782437885; cv=none;
 d=google.com; s=arc-20260327;
 b=S3VsFulBFvQ3YIaWry8eF1EYznok0uymPAvmU4S/9JMCXK4KlM/X1EeaNm/Hve/nk9
 EjqAQDAHMd76IO638iVsk8/BixyUeo2Nm3AItTFUuDZsXV1oRAJzrirdAfUTdzg3YWmf
 XDj/mqvezyGrYM+k1GH4sdkV6nf4WhuR7Q0vBjn638fhn14KURQ6XGFYfcO9zbeRmgnc
 Bu+EwMKSSAwiFt6zbuiegLDlxBjO59GWg3MfaqsVNVAq9B1trnPBkDtjpKiLVLdsPQQa
 6cRNHAr2PUUtPDfL56QEntbD3lNM1FlPartjYmIsJ8Y5gPMuPBRCmLx2e6Yrc0BHEqAg
 sz2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=5W2ihBvyX4ZkYUx5XRH+twMxSyewCmCZtB8W8ZmNqlM=;
 fh=sFGqjVLAmRzmrsEnSbFQsG51le+DrODxSZm8Qk+GOcY=;
 b=S+jHcXVblLadyBgET6wjp9/czf+hY9qq9MOMMrOBjftQmryHMOmtHPx/w22hKfN/7Q
 v3I1m+F6Av9Q2RWNx1WJ92i/PFj0cCDv58kOWr9lWiBHlQe10qE/O5cJKHxNAZH5tRJa
 Q59FioLP6tb23AJ4tNXQ/Egszy1k0ckejFas/h28M5Ewexzpd5tNaeqoLLeqVA+Ljg33
 UCMAM101/BtYOR0wsDFBwG8+7RWRDm5HHQeVcuGxhc+D4QNRl32d9VgZ304BkUDcdrtf
 g4VuKyQb4p6pROsFWi9ooHUGhRp6KnqMmUlpKNm/2yseZIKdy2ffvHun+/weE2soThwF
 cxnA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782437885; x=1783042685; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5W2ihBvyX4ZkYUx5XRH+twMxSyewCmCZtB8W8ZmNqlM=;
 b=FxWvNmHuylybM6pkBxiPRybf4sdvZ8vfhdrZKF4+xBjijB9VCbHWUszcXuAYY7Y5/n
 9KWIz0TqHnb0/j962CZISKyeKWOJ4iiZ1hFRQNf+0AM76IfgwtDNJv3Zym4DT+HTLlCm
 MLJr6mNOKXd03WypfncjvuZMECPhS8O0+n73X66t4A3rsACg3anpRjk7FflSOcYTQ7OZ
 rqK2ztlZwB3Mfgtcjv9ZMvNCNOnMV9EHj2We4laTzOfYdDaO8wu0R6zvNcsgu1ReFKle
 nKdneF1ScK3I2n66NR7J6zI6YwaCPi2B7KvpujJ/aiz1xvuSauLGGSS//Qcvw+33MADg
 WJ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782437885; x=1783042685;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5W2ihBvyX4ZkYUx5XRH+twMxSyewCmCZtB8W8ZmNqlM=;
 b=aCzXWDATpruEPmXloG4fKrgr4wHQgM8LFjGRee2ijf58/jeErWFS3YyqYqaTfyaUMQ
 y8a09amy8YMG1zVvvDfLeoTZJc9JUBB6X/aInEfqkfYqr3N+JdZSL/nOWE0xXT3/lkCE
 EqxSsxCK75k/zTvV+f4sd366vBNhc8n16LZclYr6HkYz1tgtVumroFi4Xs0G6/S0y/s6
 EgV61n1AiIfy97PJ/AL5PRvfw/hHhHZ2X+tipCucCPo8c+POWLzSx31CHtofUaXvCc8q
 XNWEMJWkaOXKtM/oEvjuMLr/hhht538lvDPqMhsHT3SIF7SMrOBOXw7k4uPoGsIORy+T
 Ch9Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RoQDOjW179LXivoyxmuNbsSUKULUuBzNd9uhJfwdzKSQiWDR7vkyjAhnzKfvlyeAUNPnq/F+/lpzrQI@nongnu.org
X-Gm-Message-State: AOJu0YwnPLJ6BynTZDs1HsD912jD0JTqhHgWhDlnojzb8VZuzKO9ppBX
 GEKEJ+iveupcCtoWyQUZZs1Xk6OD4JUNDsSjxVwbimGMML2FwDn9EMYLuAhi2XRhbyL3RYnxW5O
 oOPdg6r7eYUnbWTiSfFdvgzlmQrfeaLc=
X-Gm-Gg: AfdE7cnKzYtns8a3Fa4i4VgggcKJ8HpCqxRiaku38V1A10s75DtHnoh45Au9bLl0Gcb
 zOmzgo88JyNY7G2E3ASK8tRrQQuinJjA2AG0Kr6nNPkhyilmmcNSD6lAv0tGxyZRlsG7Z33zkmA
 8r7ZWI12nNIenR+c6xKMr0Gf+K77DvP7+FCZEb77jXkCpA1IIIwEvoO3D+RU8AyUOT8PoW2ht0q
 m0G086tulomq6ow8VE3ykXAbnROoXot0CaxRd3h7BvbrSTdsDLGvYznOI5pbUVg8bDdRcKOVpEG
 WJkJBzZi4FyVSR2NQ4vMUmP2wMI=
X-Received: by 2002:a17:906:9fc6:b0:bd3:1a18:cc64 with SMTP id
 a640c23a62f3a-c1205eed82dmr348206766b.31.1782437885158; Thu, 25 Jun 2026
 18:38:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260622193141.1449724-1-daniel.barboza@oss.qualcomm.com>
 <52c3605c-345f-43d2-8cc6-794980c805fa@oss.qualcomm.com>
 <50ce1e98-2c1f-4cbd-b191-1eac324b71b6@oss.qualcomm.com>
 <704cfba3-e92a-498d-928b-877f7f7641fe@oss.qualcomm.com>
 <9d2737e3-34f0-4f68-813b-37059615bced@oss.qualcomm.com>
 <CAFEAcA8660BZOmX_KXeF7JJaJwgKO3zSRDEmJURg27FK=tqbZg@mail.gmail.com>
 <df4a5857-ec4f-4d4f-bc08-1a9c5caae100@oss.qualcomm.com>
In-Reply-To: <df4a5857-ec4f-4d4f-bc08-1a9c5caae100@oss.qualcomm.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 26 Jun 2026 11:37:38 +1000
X-Gm-Features: AVVi8Cerm-JNlLQiVU65JOCM1RdaYtKgCGkNLHhYrLb8IvMWfwA9xD11uOrxhrw
Message-ID: <CAKmqyKOJ4xgYq4G2DsZMocdXKBuekFxNUkvK0x6qJzZHjXN5QQ@mail.gmail.com>
Subject: Re: [PATCH 00/24] target/riscv: move TCG files and fix --disable-tcg
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com, 
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com, chao.liu.zevorn@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=alistair23@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Tue, Jun 23, 2026 at 9:39=E2=80=AFPM Daniel Henrique Barboza
<daniel.barboza@oss.qualcomm.com> wrote:
>
>
>
> On 6/23/2026 6:58 AM, Peter Maydell wrote:
> > On Tue, 23 Jun 2026 at 10:49, Daniel Henrique Barboza
> > <daniel.barboza@oss.qualcomm.com> wrote:
> >>
> >>
> >>
> >> On 6/22/2026 6:34 PM, Pierrick Bouvier wrote:
> >>> On 6/22/2026 2:23 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> >>>> On 22/6/26 22:52, Pierrick Bouvier wrote:
> >>>>> On 6/22/2026 12:31 PM, Daniel Henrique Barboza wrote:
> >>>>>> Hello,
> >>>>>>
> >>>>>> This series looks scary but it's mostly trivial and mechanical wor=
k.
> >>>>>>
> >>>>>> It is yet another attempt at fixing --disable-tcg.  We have a rece=
nt
> >>>>>> work sent to the ML [1] and we had Phil's attempt back in 2023 [2]=
.
> >>>>>> Phil's work didn't get merged and it's now too hard to rebase and
> >>>>>> revive, the most recent attempt got misled into the 'what is commo=
n code
> >>>>>> between TCG and KVM' dungeon.
> >>>>
> >>>>
> >>>>> It seems like series does not apply on top of master, would that be
> >>>>> possible to rebase it?
> >>>>
> >>>> For some reason the RISC-V series are handled distinctly than the
> >>>> rest of QEMU, Alistair queues work on his repository and developers
> >>>> are custome to base their series on top of it (otherwise Alistair
> >>>> can not apply them on his tree and asks for reposts), see the
> >>>> riscv-to-apply.next branch on https://github.com/alistair23/qemu.
> >>>
> >>> Unfortunately, it makes it hard to run any kind of automated testing,
> >>> especially for series like this that target specific configs.
> >>
> >> Don't we have ways of saying in the commit message "these patches appl=
ies
> >> on top of these other patches" and then the tooling would deal with it=
?
> >> I remember patchew doing stuff like that with that "Based-on: <message=
-id>"
> >> tag.
> >
> > Yes, Based-on: is our convention for marking "this patchset needs some
> > other one to be applied first". But that should be the exception rather
> > than a common case -- if patchsets regularly need to be based on
> > something other than head-of-git, this is I think a sign that
> > maintainers are not sending out pull requests frequently enough.
> >
> > I would prefer it if QEMU didn't develop kernel-style "subsystems
> > have their own particular workflows" fragmentation -- I don't
> > think we're big enough or that sub-parts of QEMU are sufficiently
> > well separated for it to work out well.
>
> I agree that rebasing things on master is better than rebasing it on the
> maintainer's tree.  And we could make a better job at informing developer=
s that
> submitting a patch for qemu-riscv, vfio or any particular subtree, means =
that
> the patch should be based on a maintainer tree X.

I would prefer patches on master, the issue is it just creates a lot
of conflicts. That takes time for me to fix and I'm always worried
that I'll mess something up and it will go upstream with a bug that
wasn't in the original patch because no one gets a chance to verify
that I rebased it correctly.

>
> The thing is that sending patches on master only works if master is alway=
s up
> to date, and that's not feasible with our current style of merging PRs.  =
This
> series we're commenting on is an example: it doesn't apply to master beca=
use
> there are pre-approved RISC-V patches in the maintainer's tree from 2 day=
s ago
> (also my patches, I might add) that caused conflicts that I wasn't aware =
that
> would happen.  This conflict would have to be dealt with at some point by=
 myself
> or the maintainer, and it's not like 2 days is too much time without a PR=
.

Yeah, I try to send them every few weeks, but when all the patches are
touching the same few files it's hard not to hit conflicts.

>
> We can argue "this is an exception that doesn't happen that often, we sho=
uld
> stick with using master as a base", and to a certain extend that's true. =
 But
> then this sort of conflict happens again, then again, then again, it come=
s to
> a point where it's easier to tell developers to use the maintainer's tree=
 instead
> of master.

Which is exactly what happened. I think I have just asked people to
rebase on the RISC-V tree enough times that they just start with that
from the beginning.

Alistair

>
> Maybe I'm downplaying the problem because I've been sending stuff based o=
n the
> maintainer's tree since forever and got used to it.  IMO, unless we decid=
e to be
> like libvirt and create the "committer" role to allow trustworthy devs to=
 push
> stuff to master after acks, making it more feasible to expect master to b=
e up to
> date, I'm afraid we're closer to a kernel-style workflow.  For better or =
worse.
>
>
> Thanks,
> Daniel
>
>
> >
> > thanks
> > -- PMM
>
>

