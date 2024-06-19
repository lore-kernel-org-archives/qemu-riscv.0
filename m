Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7868C27C53
	for <qemu-riscv@archiver.kernel.org>; Wed, 19 Jun 2024 18:20:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sJzvD-0005eS-FU; Wed, 19 Jun 2024 14:20:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1sJzv9-0005dY-76
 for qemu-riscv@nongnu.org; Wed, 19 Jun 2024 14:20:37 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1sJzv5-0004u0-MH
 for qemu-riscv@nongnu.org; Wed, 19 Jun 2024 14:20:34 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id
 3f1490d57ef6-dff17fd97b3so41291276.2
 for <qemu-riscv@nongnu.org>; Wed, 19 Jun 2024 11:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718821228; x=1719426028;
 darn=nongnu.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EDRvpFbwM6cajAsyKRZsU6poRN4l7F4wQCaOaDakrTQ=;
 b=AzTl3+Rvd3bj3bulFNRD/tM3+bsXw3hqyf5674Shu8UjTlqLVebL4qU8t/0imYheTi
 mIqtGEAGQpRo8QivnUJdzs52WDGt6sEkW9/Q5AjiXdaB9im39zO08G0W+MFZcXvyFX/v
 R5kJssF+Uk8FUYrvHEGQzysGx5aXKYiukftme6LRVx0Ics/3+4+D8Lhl/qi+envdiRlF
 D/BYiNsV/sX5CGpV1ezgNHa5YZX2dp0++YYIenFZv/j0Yrrd+ov5dV/QshQ4wCLOnI8P
 ZY58wSPhMihj6qPRJGtJXKLC3xntCsv2RMnOturjcItLDYT8wf70A1quRF/XKg7n2d2D
 /hIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718821228; x=1719426028;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EDRvpFbwM6cajAsyKRZsU6poRN4l7F4wQCaOaDakrTQ=;
 b=jW2KYle+kQRigLh+freQKjF+TW1LpoWbHop3Vl0YdQ+OPjGAxLKBx3nHqnKWHdyGMG
 v/nu6rLoQroZi+LYp3T3DEIz4jmrEtoV7FPs8RsDxKuH/qtgoXJpiBrBluPXlT536kDo
 hu0sppIbfrwFQF9/VzJUUE+eTYfA5YN9WD1oh1RltAjdcZz+ONOOcXppawNRFeGPQ2qM
 IyDQdi4tZIe79uKNYV2EUuxIIVD8lGbYaNgX8kgN17Fbt1lEkib4/UuHHykJLmMU3mQ1
 Kdezv1wepgrNW3Ia9wHk0pAmq5x7wUzEhmeD4qpNFXBfMVfAWoohtFweFhIq4C32hKEH
 Q9tA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAtcE1nwGKSeJdUdVwVLwCKfyPCIO3PflkCm/saqbKyASnZa03eYinvTqglvliVDJRCxt/eprfqMLH0bqiCAfPbGAwwVo=
X-Gm-Message-State: AOJu0YwdIouyh9v+4Q8IEOjEniNrlViACLmf7CmWS05OWDqOad/dv48l
 7CzU0wYp2o82PNdxagDxb5LS952fcHor4HPqedRQFsrB2v0s66HID51K4I7jEqqitB+qi6PSOWg
 sySlq7bKt7IJ6CH1F+8Rz7M968FI8zjqMrFp1ng==
X-Google-Smtp-Source: AGHT+IGYAzT8Vg1VeL9lzTrPcdWn1BuB79I37hfyOmbQZ36gxlG3GYb82R6fVsu4bBupIF5bNwX+N20osUvmd3Hjc2Y=
X-Received: by 2002:a05:6902:207:b0:dff:322c:79ac with SMTP id
 3f1490d57ef6-e02be10b96cmr3825173276.3.1718821228388; Wed, 19 Jun 2024
 11:20:28 -0700 (PDT)
MIME-Version: 1.0
References: <CANnUGEkHqnecxFa63ESQoQRN8RwKWm0AAmQ=4zKe3VkDDYCLXw@mail.gmail.com>
 <E5CDC0A3-8CC9-9641-9F01-2C4F88EA2767@hxcore.ol>
 <CANnUGE=uWzN-g5+vx46bbLdHmKrQ1K9nq9MZ=npE06kovdm5Sw@mail.gmail.com>
 <CAPd4WeyNkaWByzBWgyf_wwiz00Ys6AOEtMmv1941GR-XHme9_g@mail.gmail.com>
 <a78f70da-1304-803e-c4e9-34902dddf77b@gmail.com>
In-Reply-To: <a78f70da-1304-803e-c4e9-34902dddf77b@gmail.com>
From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 19 Jun 2024 11:20:17 -0700
Message-ID: <CAKC1njR+S_aPSVULxS-zV-Uz4i0hhOTQJOpV4hfvABD7UBwtxw@mail.gmail.com>
Subject: Re: Is there a way to check values of registers before and after
 running a program on qemu-system-risc64v?
To: Shobhit <shobhit32t@gmail.com>
Cc: Himanshu Chauhan <hchauhan@ventanamicro.com>, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=debug@rivosinc.com; helo=mail-yb1-xb2f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, Jun 19, 2024 at 9:58=E2=80=AFAM Shobhit <shobhit32t@gmail.com> wrot=
e:
>
> On pressing CTRL+C, I am getting the following line:
>
> >> Thread 1 received signal SIGINT, Interrupt.
> >> 0x0000000080007bac in ?? ()
>
> Instead of the following:
>
> Thread 4 received signal SIGINT, Interrupt.
> [Switching to Thread 1.4]
> _start () at test.S:10
> 10      1:      j 1b
>

Why are you even creating 4 cpus (I saw that you had this option `-smp 4`)
Just have 1 cpu. You could use the gdb command `si` (step into)
instead of continuing.
Practically you will be stepping through 5 or 6 instructions.
GDB reference -
https://sourceware.org/gdb/current/onlinedocs/gdb.html/Continuing-and-Stepp=
ing.html

As a side note, you may be just starting these things and thus getting
introduced to a lot of
sw / tools (like qemu, gdb, compiler) and it might be overwhelming.
But I would advise that
spend time with them and their documentation / internet search. What
do they do and why
do they do it? It'll help you understand and validate your own thought
process and make you
figure out things on your own.

