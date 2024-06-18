Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 483EBC27C4F
	for <qemu-riscv@archiver.kernel.org>; Tue, 18 Jun 2024 16:50:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sJc26-0002HF-Rb; Tue, 18 Jun 2024 12:50:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shobhit32t@gmail.com>)
 id 1sJbL0-0006KT-A6
 for qemu-riscv@nongnu.org; Tue, 18 Jun 2024 12:05:38 -0400
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shobhit32t@gmail.com>)
 id 1sJbKx-0007h4-MC
 for qemu-riscv@nongnu.org; Tue, 18 Jun 2024 12:05:38 -0400
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-6f9ca219760so3156049a34.2
 for <qemu-riscv@nongnu.org>; Tue, 18 Jun 2024 09:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718726734; x=1719331534; darn=nongnu.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=kogkSa3UfIBpKSJn34AVpbYpjYFEbaBRxvElLNcDPcE=;
 b=MCevu56NjTtrZKiqEfAOjsaMyJ/Q923UA5eHP2y+SN3QRa5ngC6pO+oQrCS/VClWvx
 Vxsg6e0XA+ZojDabR9YpEm74wmAYdA1gcvm7n7B2HiUtO1yUvRL4lQH51bNbbIZWQBRm
 l92tus/LG5wHJ/CwbDa1DcvjxHKbwXK2hPXYXDBKfXVE8lSyytLQVEY4G5iP+umysW0g
 3i4ZQS26vDLw1CCAoUKFWq9EnwjYuF1LykChLB1ltoZMeV3s7FCFPrgwIpw/8BSBUbmu
 9un5Csy4PC72HnQV23koQP380mGg2CdojzGA2syBOWmGUtlLfrZmHqRCZWV80Rw10lB2
 xRdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718726734; x=1719331534;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kogkSa3UfIBpKSJn34AVpbYpjYFEbaBRxvElLNcDPcE=;
 b=rhTT4SSgIZoMj/8OLiwYb90ISvWzOVWd4Cgc/Bwd4KD7g4vkkRXKk5jCsJSB/eP0fE
 QqwdxC/ZWI0AH01BZr9ZVr3wV+e2sNYosAChKV/KE7N0m0/qYXkBSXfEXcIqN80qUGX6
 mm/N6KyEO1AoKiqptHkzampyysy6h06V/Uv2JIVjJW07arLAG/oZdw/k8I/mY79vF+OL
 SAQSvTRDQkWQxh6QnoqonRfNq91ja8Lx4laq6Q8Bikqqy6Q12ALOYNvF3z0uILvq0TVP
 vsebCCS3ooMPGoGE682/Hbo2xORrBGnPXKv1+ua3hiKvkoLO/hxhEnavzEJtjMFpWqV8
 7hsw==
X-Gm-Message-State: AOJu0YyAvPyB5G8TVGi8uMHYG9SOuHpZJSsg4KCgZyoFzOgseB2LOmTg
 B9xpdBShERY+xxj5aDtUYqsTV17fvsLg7VjwwHJbJ9fsGYJX3RR/GqsnlNWN33HqG5DZNUwf3kW
 KVgUiKi6xF9ei6yEgIBxfjXuTGz/fMxZ7
X-Google-Smtp-Source: AGHT+IGd0+W4O+zSqz3xtpU2xO2QiDJnlV9TN+Oy+jEG+XUwp8TZRdARe//BKk6KYJtT0bCvnEXo0WKod6y2L69+jiM=
X-Received: by 2002:a05:6830:20d2:b0:6f9:bbef:c02f with SMTP id
 46e09a7af769-70073c2b5ddmr209070a34.9.1718726733608; Tue, 18 Jun 2024
 09:05:33 -0700 (PDT)
MIME-Version: 1.0
From: Shobhit <shobhit32t@gmail.com>
Date: Tue, 18 Jun 2024 21:35:22 +0530
Message-ID: <CANnUGEkHqnecxFa63ESQoQRN8RwKWm0AAmQ=4zKe3VkDDYCLXw@mail.gmail.com>
Subject: Is there a way to check values of registers before and after running
 a program on qemu-system-risc64v?
To: qemu-riscv@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000006c40e5061b2c403e"
Received-SPF: pass client-ip=2607:f8b0:4864:20::332;
 envelope-from=shobhit32t@gmail.com; helo=mail-ot1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 18 Jun 2024 12:50:09 -0400
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

--0000000000006c40e5061b2c403e
Content-Type: text/plain; charset="UTF-8"

I am trying to run a very basic RISC V assembly program on
qemu-system-riscv64, is there a way to check/monitor the value of some
particular registers before and after loading the program? I have tried
passing -monitor stdio flag to qemu-system-risc64v, but it doesn't give me
the values of registers.

This is the program I am running on bare metal risc64v emulator

.option norvc

.section .text.init
.global _start

_start:
    addi x5, x0, 6

    addi x5, x0, 4

And I am using ld script to load the program at the location 0x80000000 in
memory.

This is the command I am using to start the emulator: qemu-system-riscv64
-machine virt -monitor stdio -cpu rv64 -smp 4 -m 128M -bios default new.elf

Here new.elf is the executable elf file created after compiling the above
assembly program.

--0000000000006c40e5061b2c403e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p>I am trying to run a very basic RISC V assembly program=
 on=20
qemu-system-riscv64, is there a way to check/monitor the value of some=20
particular registers before and after loading the program? I have tried=20
passing -monitor stdio flag to qemu-system-risc64v, but it doesn&#39;t give=
=20
me the values of registers.</p>
<p>This is the program I am running on bare metal risc64v emulator</p>
<p>.option norvc<br>
  <br>
.section .text.init<br>
.global _start<br>
  <br>
_start:<br>
=C2=A0=C2=A0=C2=A0 addi x5, x0, 6</p>
<p>=C2=A0=C2=A0=C2=A0 addi x5, x0, 4</p><div><br></div>

<p>And I am using ld script to load the program at the location 0x80000000 =
in memory.</p>
<p>This is the command I am using to start the emulator:=20
qemu-system-riscv64 -machine virt -monitor stdio -cpu rv64 -smp 4 -m=20
128M -bios default new.elf</p>
<p>Here new.elf is the executable elf file created after compiling the abov=
e assembly program.</p>
</div>

--0000000000006c40e5061b2c403e--

