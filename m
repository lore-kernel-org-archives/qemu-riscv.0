Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6467CC5B552
	for <qemu-riscv@archiver.kernel.org>; Mon,  9 Jun 2025 23:09:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uOlcV-0004V5-WD; Mon, 09 Jun 2025 19:09:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1uOlcU-0004Ug-F2
 for qemu-riscv@nongnu.org; Mon, 09 Jun 2025 19:09:34 -0400
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1uOlcS-0002Jd-HK
 for qemu-riscv@nongnu.org; Mon, 09 Jun 2025 19:09:34 -0400
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-32add56e9ddso38706331fa.2
 for <qemu-riscv@nongnu.org>; Mon, 09 Jun 2025 16:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google; t=1749510570; x=1750115370; darn=nongnu.org;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m7W8szO//zDzhBhYgLCrpR6jY+WOXvSIWny+9NgxWUk=;
 b=DH4jfJ/B71aWmtPQUhk7Y0fkZdsusBlB0k7CWwImdE2pZay0lzJGBmBoxHYTJTwMYj
 JqUNruRpeAnS0nFiLLJhsI0fFbW+5t2fuNThe86YDJM22htWcPvoPxSNZzDgbnkNclkz
 GwpNwjr5K9cLHE1BSm2v2qBGXOpapMg2zlTOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749510570; x=1750115370;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m7W8szO//zDzhBhYgLCrpR6jY+WOXvSIWny+9NgxWUk=;
 b=rfE0DaNoikG53D3t56z7KQsGwWmXvxxxyjtFFeh5IngUkKNSF6fA+lCDKe2PIzSQEt
 gEtcU9vN+vyiMjICICc7N/s5kJzRw5WjVVfHi4qrcnTQUm/iM3u81j3uw7J5pe5ipsBv
 xOSyBvrozGeTVaYUmnm8Y6zy5Hb49hUdEJjACK23jhX+sgTlAKH4hRs5EtUMbojC54K/
 wlUu2B7RIQslEUKQqh6V4NXYCfeurRTXGCEuK2Y0IJIwEA0A5/ttE19a1LT0vy2dNIYi
 +hZLEgaYLwX7EGjBCJjn/NdQctaNoMK44ZCMjqDv/lZAlFqz8uYp8oAEbyrcfcOJ/2gA
 W98g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXq8/6r7sIQmiaBSDbXcnTXooRm0FcNmFykKr0sKBFVWVmuDouVHi2G7ewIjzUQvFvZ/CmLe5B+wKXg@nongnu.org
X-Gm-Message-State: AOJu0YznsFoP6RmJxrBB59lozBQDplaIx5Ez73XyfL3rr2d86z78kc7G
 UkoomhYGVBLOI8F6OPEGwWDNLUu9M3TdfF//OSm6nZr+orzY+4SrGhl2V3bBY7PVLTtB4QXARNV
 u+ROezJ6dCkxPwi2vVh7J5zNeCtKNPeGBUwsXj97I
X-Gm-Gg: ASbGnct2WdlGy9c2lf/2eH2ZiJHEwDcUsPXALCZg9RPQqxx6ZL76gUJYknbzcRPV+3H
 qej4hS4ZZGh5KyZsbpTKMUnuC2x33iCH9nA6nfkCYK3Vs8Pss2qefVYYM6mL1KOh81rtxboH2FH
 bxRwfS4XMeg5fA2nSRfrofuV9Yqx/pbqAxzVf2LVvH
X-Google-Smtp-Source: AGHT+IEWMMff+VYQVsGpjnaXm/Rn+Jul0YvV4ACZEai3Uq0Vho3uDx8M4RM6ygBBdbc10Ja/CaIYRVTgzwggqMG9dMg=
X-Received: by 2002:a2e:8645:0:b0:32a:6c16:d3a5 with SMTP id
 38308e7fff4ca-32adfd369bcmr31191401fa.3.1749510569768; Mon, 09 Jun 2025
 16:09:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAOnJCUJz6p6b0WK_7=qowe8_pCHnv5WJXNYMa-uzFy0PHc7Dvg@mail.gmail.com>
In-Reply-To: <CAOnJCUJz6p6b0WK_7=qowe8_pCHnv5WJXNYMa-uzFy0PHc7Dvg@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 9 Jun 2025 16:09:18 -0700
X-Gm-Features: AX0GCFvzzx0sgQlTBgQqz1aYTf9FCOEcA5zF6GsJeLGQOky_JUzsDZRXZjmq3RA
Message-ID: <CAOnJCUJ-VusA8E4-ABvXPZOReD3nq6_jvqNF5bscfDY89_BoRw@mail.gmail.com>
Subject: Re: Public Review : RISC-V Supervisor Binary Interface (SBI) version
 v3.0
To: OpenSBI <opensbi@lists.infradead.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)"
 <kvm-riscv@lists.infradead.org>, isa-dev@groups.riscv.org, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=atishp@atishpatra.org; helo=mail-lj1-x235.google.com
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

Hi All,
The review period is now officially closed. We appreciate your
participation in the review process.

Regards,
Atish
On behalf of PRS TG

On Fri, May 9, 2025 at 5:27=E2=80=AFPM Atish Patra <atishp@atishpatra.org> =
wrote:
>
> We are excited to announce the public review of the RISC-V Supervisor
> Binary Interface (SBI) version 3.0. This 30-day review period begins
> today, 9 May 2025, and concludes on 8 June 2025.
>
> Specification Details:
>
> Downloadable PDF Version:
> https://github.com/riscv-non-isa/riscv-sbi-doc/releases/download/v3.0-rc7=
/riscv-sbi.pdf
> Source Code: https://github.com/riscv-non-isa/riscv-sbi-doc
>
> How to Give Feedback:
> Email your comments to one of the following mailing lists:
>
> public isa-dev mailing list(isa-dev@groups.riscv.org)
> PRS mailing list (tech-prs@lists.riscv.org).
> Open an Issue or Pull Request to SBI GitHub repository.
>
> Review and Ratification Process:
>
> During the review period, we will collect all feedback (comments,
> corrections, and suggestions) for consideration by the Platform
> Runtime Services Task Group (PRS TG). Minor corrections and
> non-controversial changes will be incorporated into the specification
> directly. Any unresolved issues or proposed modifications will be
> detailed in the public review summary report. Assuming no issues
> necessitate incompatible changes to the specification under review,
> the PRS TG will propose that the updated specifications be ratified by
> both the RISC-V Technical Steering Committee and the RISC-V Board of
> Directors.
>
> We extend our gratitude to all contributors for their dedicated efforts.
>
> Contact,
> Task Group: https://lists.riscv.org/g/tech-prs
> Task Group Chair: Atish Patra (atishp@rivosinc.com)
> Task Group Vice-chair: Sunil V L (sunilvl@ventanamicro.com)
>
>
> Regards,
> Atish
> On behalf of PRS TG

