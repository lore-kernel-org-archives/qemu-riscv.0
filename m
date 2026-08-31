Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 964C7C61DE8
	for <qemu-riscv@archiver.kernel.org>; Mon, 31 Aug 2026 05:50:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x0uue-0007tX-0n; Mon, 31 Aug 2026 01:50:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1x0uub-0007s3-Ie
 for qemu-riscv@nongnu.org; Mon, 31 Aug 2026 01:50:29 -0400
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1x0uuZ-0002Ef-ID
 for qemu-riscv@nongnu.org; Mon, 31 Aug 2026 01:50:29 -0400
Received: by mail-yx1-xb130.google.com with SMTP id
 956f58d0204a3-66f79f58123so490043d50.1
 for <qemu-riscv@nongnu.org>; Sun, 30 Aug 2026 22:50:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788155426; cv=none;
 d=google.com; s=arc-20260327;
 b=mG8u5pMVkrYECMHHSCY10a1iXEmP3qfXwArrO+yrMC2XcSpome1mYKSgEKhfzKZxnO
 n8B3MsSgK5RK6d83H0LLiF0wKdxwedOLuvR4SYKF/qnQ1tzFKxo7UsTvrN3Qqr+DCgmF
 2z5tJVEkst43X4IJ/ntQHo/u7urezzFvQDgEzaTca3MVs64iB5Bia1M1h605EXDLo3VB
 ZsXekFW7p43CX4ovoOSfRJXcMj053fKflZZgSQZBN3LtADfwTaXIwmSjCBc3fsFIbUSl
 IYdrES625sFZ33L33uCxasWqjKRYu+tay+BIriGFH47yYuaE+J6ElCk9irO2we9edQI6
 4p2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=TrDTqsDtksxcqWEKP5dvuqCGL81ZMfNxkLMJwHT9lmo=;
 fh=q+h7YXGEFqi0cOy3G077pzNFPG5lvI7v1+u4FH9MOpQ=;
 b=Swgwd54/It4fX80XC7vCl/XddsGQkET587s9b2cCzB+I5ibicMob6P1Lk6MSddBuHA
 a6QmydoSUWeyTXIbZfIApRfDkRGEKyWpSxLNpybDIZ443skn+MLBfjck5CHTNRONeDPR
 YzZurkC+8tBn8MohKQ/3ODFDutJa6XWGlVa8gccPwKitlYzo4VEoODcZj/bqFxRordgg
 KqfgOUyXMoMhx1pW9eqwIScyEJr5XDvfm8s5cbIg3u39+XJ9syJP/SSybNJG8Ja3YqCX
 wrUAPG+w0hdZW0IzCnj+WyBShcO0BhcGzWoh6cG0bUWvcyLfEfwcinJIX7rcxwzhwrJB
 slIA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jms.id.au; s=google; t=1788155426; x=1788760226; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=TrDTqsDtksxcqWEKP5dvuqCGL81ZMfNxkLMJwHT9lmo=;
 b=jqhugEjp/oNRClf7iVeIABdad4osZ5ewl5D4kQ+iXMJHqbMS2ssMehTOytVD4IDH8J
 v5kM7gQlzwRWUxEqU5g4s1l+cCk5YSYOgtZ+r84fX9SlWLkO6EkngtTf6+ITH1ICaJEE
 0O5dW111cPQT3HrnbzhZsdRxI92lqUmHpynZk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788155426; x=1788760226;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=TrDTqsDtksxcqWEKP5dvuqCGL81ZMfNxkLMJwHT9lmo=;
 b=S3w243rBoK4RuGTEYiOkomM9tz+N+sf0KS0PdhSmkMw/MhsWG/sfDJwH3wlj0999GO
 VJIXl5L6Hy6URpgvqXV2gKNtGwJRwApzmddsGP8fel7MG0pjzB9qokia4RdJXzDDm11C
 HenlzU2SscNUFDy546959uYnsqoSiNzyW+Zr9sB6cY8VmQLU1BvB+fRPZab6Yrrr//oa
 2ko9F7iIyUl43OFxipX0xw5ZbXA8SOJNrb8FfciTZDukZl/5PvPZkrL62MCo9d+H3bb9
 mDzmvh6jt+QKoDP6DqQFNKPviEqhAuGLXnx6tGjhPNe1T3HwaC/DAMBYXNudwPTR4YqP
 ul1Q==
X-Forwarded-Encrypted: i=1;
 AKwUvByAvxFbU3RlADdjvDKXfVW/yrIJ7mZHircTitpTm14NMN90AUvVe5VXyGCcJ6O9DpeY1b17q18IfVkO@nongnu.org
X-Gm-Message-State: AFuF++lPpj9GCqgiReofaOhLn5kFj0fhzEB+4j6HvVKKvLbImuwyT1Yy
 NGtP1LZ0sJTf/rah8k7Oy+bRhSpIs4MPFaLiUBPsuphJagQAleF+rvPY4dIW0E92vTF9tHzHL9a
 0RBVTSNnJMRCsBFvYRFCW5nBKzVg3wek=
X-Gm-Gg: AYBFou05OzSyOjPT9GJZMJ94ZE275eIgluJEONCsd4mSlcx6vQGOa/osV9+iAFTSJQS
 ZthZgikHm+Q7R4OaTYhUcBeZ6MqbpNWpOfW06yuwa81/ePV8d4D/11r9Cs3jbX18fqHREybyTxd
 W5dkZj5pkRjFf/nkIiPOzBMyit9Tyzl2lYRsDbPufAefyWxyofoz8PO1GwzZAz/crYzoavRcfq5
 pDRmYOB4++6iZxihpeRIxF6Kj+2PPsqng04Ilhj0Fh49pDjDHDKyIAh5nqe9ANbiF3tOBfZRCvA
 Cbj+fpwPHS5D4rOegQ7tgowxUH8FB179RyZxFAo9Ps6HrfKKyfS1kNpEdzsm5cz5qYg0fowQu38
 sKO2DWDchrH4FWQGGeCNMErjsVSke2Cou3pAI5uVDnQt662jL68sngATZRLg5j0XkbsqGjtn1uE
 9eL5489I6zWFVzRbUD
X-Received: by 2002:a05:690e:4191:b0:66e:64b4:3444 with SMTP id
 956f58d0204a3-66f813863c3mr397785d50.9.1788155426042; Sun, 30 Aug 2026
 22:50:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260831021500.82565-1-joel@jms.id.au>
 <20260831021500.82565-7-joel@jms.id.au>
 <b6dde536-bc21-48b3-91c1-03bf900b1e5d@oss.qualcomm.com>
In-Reply-To: <b6dde536-bc21-48b3-91c1-03bf900b1e5d@oss.qualcomm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 31 Aug 2026 15:20:14 +0930
X-Gm-Features: AcwNN1XsYWA2vlSJHzh-IxSD1Up_ywmKh0yZ6ClV7Ykw0ObPKNncJskpX3IM8XM
Message-ID: <CACPK8XcOwv4JLrO-UnbJWoi_jgkARBZ=DMFf7_6RWs2QLiX4Mg@mail.gmail.com>
Subject: Re: [PATCH v2 06/16] hw/riscv/cps: Map interrupt controllers in SoC
 container
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Weiwei Li <liwei1518@gmail.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, 
 Nicholas Piggin <npiggin@gmail.com>,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
 Michael Ellerman <mpe@kernel.org>,
 Portia Stephens <portias@oss.tenstorrent.com>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, qemu-riscv@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b130;
 envelope-from=joel.stan@gmail.com; helo=mail-yx1-xb130.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Mon, 31 Aug 2026 at 14:35, Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
>
> On 31/8/26 04:14, Joel Stanley wrote:
> > The CPS device maps some devices into a container region, but the
> > ACLINT and APLIC were mapped directly to system_memory.
> >
> > Pass the container memory region to the interrupt controller helpers so
> > all CPS devices live in the container. The location of devices in memor=
y
> > for the boston-aia machine is unchanged.
> >
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > ---
> >   hw/riscv/cps.c | 8 ++++----
> >   1 file changed, 4 insertions(+), 4 deletions(-)
>
> (I'd have expected this as 1st patch in this series)

This is a fix that is enabled by the first four patches; only possible
now that we can pass a MemoryRegion.

So the first few patches modify the cps machine to pass
system_memory() to preserve behaviour. Then this patch switches them
over to use the container.

Usually a no-no, modifying a line that was modified in an earlier
patch. I could fold this change into the first few patches, but then
the change in behaviour wouldn't have been as clear to reviewers.

Cheers,

Joel

