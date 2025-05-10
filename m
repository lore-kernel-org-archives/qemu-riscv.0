Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90D68C3ABBC
	for <qemu-riscv@archiver.kernel.org>; Sat, 10 May 2025 00:27:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uDY3p-0005Tm-B7; Fri, 09 May 2025 20:27:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1uDY3o-0005Ta-2k
 for qemu-riscv@nongnu.org; Fri, 09 May 2025 20:27:24 -0400
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1uDY3l-0007R6-JB
 for qemu-riscv@nongnu.org; Fri, 09 May 2025 20:27:23 -0400
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-54998f865b8so2965245e87.3
 for <qemu-riscv@nongnu.org>; Fri, 09 May 2025 17:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google; t=1746836838; x=1747441638; darn=nongnu.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=3mVG1HeM3gdC8OZro3hpeCvElqs1hv0qRQHLs49i9jU=;
 b=D78I1EvFJq1XiPoXlU9V4D5HYUU6Ag0S0t8hy0ZMIuf5ExcmCGdHwdjh/sJNYebtz8
 RD9R3NsQ2tmhNVuPW4rcMjXlZw5p4xcqxMyVsin62NfMygS0ngh3Mrzdr7jEyaJjvi0N
 9EM7eg4qfgF6addiTeO+I6U0OJgSqNlMOkXfM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746836838; x=1747441638;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3mVG1HeM3gdC8OZro3hpeCvElqs1hv0qRQHLs49i9jU=;
 b=EOFBYqt76Iq++GPDwdmZkvbaRVpk7t39d09lIKKn6gqSih0Uio4Dh9L+5+nJcTucr9
 ViTxD+FRHU/8s72PcFcxpb2LlKuILwzO6DLgaEbmPQ3f3JM2Rka5NbRJW+M4DjNYch7j
 yNk09Z/1N+xtQ/nuqvVyllpSynklOshPBo9cNbNXEapRpymuhYFa3w8/JMViLB12+jU4
 AJCy4uxvHUj36aDcH3enzaxy55cRX4vOj76MknotCA1Xhoav2xVcuHwoi5oWFEhhyDuc
 7deUaOOgAFpwGaOp3p3CBv6SQSDKwMolZw5+7xhbr97H7QJt67u5WlkQzjBk5hHnCIuB
 x2Dw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6hU/EAUswvPPu+i6Mb3P/LVWqygR7vW2Ay0UOyriTlV1lcQEfh0wFbRI93fFyPcwL7Ja6lo3b7NO9@nongnu.org
X-Gm-Message-State: AOJu0YzRAIS/TgDUdVkMTzZY3zhgsH3OCB/Qo8NRF8d29HvvcXfB9Aza
 PHZVASx6BjXinYVMF1fgkHc0auH2N/sR7fDdw3HjDkOhjldWiZ7f1Pc+N5ybZoQ6aqkV4CWWvgh
 Q5Risbwd79jHzaEUZ+EC8lG/6Tj9CsU8d1c40gBbgryWAy32O0A==
X-Gm-Gg: ASbGnctgz6JxN7K7wIhqtsLGTvsD1w6iUac0rc/4wSHlf6tbied/o9RWM/Bzjg846Ld
 lGLF2IHQOHwOebvS+xu8tMA75TB7BX1H4y7ngEnZTJ2pqP6HQNDN7g4Hk02L4BLKxrNwwKxM6XK
 eUflRdwZzscS8sGVidBoS7/tLM/OQK7hbIu6SPSTgc
X-Google-Smtp-Source: AGHT+IHq1BR2RwD1OajhP+/YiGZ9fkf144EzsbbWtinB6VHcq7O/YUEpefqqQEj01YRC/lW7eaBIPZsS0NcfX52nkTg=
X-Received: by 2002:a05:6512:10ca:b0:54c:348d:19b7 with SMTP id
 2adb3069b0e04-54fc67e34bcmr1853508e87.46.1746836837608; Fri, 09 May 2025
 17:27:17 -0700 (PDT)
MIME-Version: 1.0
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 9 May 2025 17:27:06 -0700
X-Gm-Features: AX0GCFvBhojEPGxCv8S7ei1dcTB_JLnwOyhSbEHrwZ9C3QNaeRIjn699JP7VHCw
Message-ID: <CAOnJCUJz6p6b0WK_7=qowe8_pCHnv5WJXNYMa-uzFy0PHc7Dvg@mail.gmail.com>
Subject: Public Review : RISC-V Supervisor Binary Interface (SBI) version v3.0
To: OpenSBI <opensbi@lists.infradead.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)"
 <kvm-riscv@lists.infradead.org>, isa-dev@groups.riscv.org, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=atishp@atishpatra.org; helo=mail-lf1-x12e.google.com
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

We are excited to announce the public review of the RISC-V Supervisor
Binary Interface (SBI) version 3.0. This 30-day review period begins
today, 9 May 2025, and concludes on 8 June 2025.

Specification Details:

Downloadable PDF Version:
https://github.com/riscv-non-isa/riscv-sbi-doc/releases/download/v3.0-rc7/riscv-sbi.pdf
Source Code: https://github.com/riscv-non-isa/riscv-sbi-doc

How to Give Feedback:
Email your comments to one of the following mailing lists:

public isa-dev mailing list(isa-dev@groups.riscv.org)
PRS mailing list (tech-prs@lists.riscv.org).
Open an Issue or Pull Request to SBI GitHub repository.

Review and Ratification Process:

During the review period, we will collect all feedback (comments,
corrections, and suggestions) for consideration by the Platform
Runtime Services Task Group (PRS TG). Minor corrections and
non-controversial changes will be incorporated into the specification
directly. Any unresolved issues or proposed modifications will be
detailed in the public review summary report. Assuming no issues
necessitate incompatible changes to the specification under review,
the PRS TG will propose that the updated specifications be ratified by
both the RISC-V Technical Steering Committee and the RISC-V Board of
Directors.

We extend our gratitude to all contributors for their dedicated efforts.

Contact,
Task Group: https://lists.riscv.org/g/tech-prs
Task Group Chair: Atish Patra (atishp@rivosinc.com)
Task Group Vice-chair: Sunil V L (sunilvl@ventanamicro.com)


Regards,
Atish
On behalf of PRS TG

