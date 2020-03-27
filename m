Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jHcQV-0002IT-97
	for mharc-qemu-riscv@gnu.org; Thu, 26 Mar 2020 20:00:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55618)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmer@dabbelt.com>) id 1jHcQT-0002IH-I4
 for qemu-riscv@nongnu.org; Thu, 26 Mar 2020 20:00:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmer@dabbelt.com>) id 1jHcQR-0003w0-5O
 for qemu-riscv@nongnu.org; Thu, 26 Mar 2020 20:00:41 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:43882)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmer@dabbelt.com>) id 1jHcQQ-0003ni-Lt
 for qemu-riscv@nongnu.org; Thu, 26 Mar 2020 20:00:39 -0400
Received: by mail-pf1-x442.google.com with SMTP id f206so3598863pfa.10
 for <qemu-riscv@nongnu.org>; Thu, 26 Mar 2020 17:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=SAn1nnFZvKIh4e7l7/1OgxHDBWJKSm33dEkqyjW94hQ=;
 b=gCtcLzqx7Gd0WfjU639XZJrmfHfpuH+QGytomc2/rmQact42SaXyDr/LA2KBa0WmSD
 V1vutFEqs2B86wbzVz18T4JKgg3G2/QXhOTUxNi3wJ4mmEPdSq3XcfMvmRav9o2q9exk
 MnLZtwCpZeFq8LWEd1vL0/z1NTzejV/wqXcWr7S0J6ACTxQB5vgY3UZn/i4D/UFaRMi7
 hvoZi6r/yqItFZtWMW/TOWzYBvmQuUYBhHlK4sLL80icr3WIEKhkJGymOarIEwKe5qpR
 dV/kIGhtQ1phCVpbdFirulIYRwAYbGsVr6yJJYpV7d3L5a7VocikMm/QPcKvaWdCSTzj
 UaRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=SAn1nnFZvKIh4e7l7/1OgxHDBWJKSm33dEkqyjW94hQ=;
 b=UY3g3eeLHG2JGV/uDoTHWQX+/cPjzx9e+9Uo6s4Bp36Q92CzrTZXwzKTl64aA4P8DB
 U0eT1HOXZrAOdQWvC0l+0n1pl9uwrrO6miNJvp3sAFMmaIeqlG9uzRVMvbDea52eZ/ie
 rv8j7NMBZ+bpudhPkJeGx1C5W+MDsyaR68+t/+SU+KqNLV/j6ZeZuOxW1abSXnBcFdQe
 g0LwYIgh0O90xrnMgKmzz1I6NpmZAJKzxhCrbLanCRaI6n5DrgtGMUfU7/xUuvW7WZFY
 8rebgBlTxvt6bIPlhfcMj2SXA5cbfecIU3PKBPAA0qC1qNnIE68mK2/pEJ6jlr1aKfml
 ZnTw==
X-Gm-Message-State: ANhLgQ3mIibBqNXrm8yJQKk3OCs4WeDniSE+/dS7lOgKpe1okhjUrD93
 WSVrgKWIZm1UyfBZVjRWBPdKNw==
X-Google-Smtp-Source: ADFU+vtUwupELF+0uo6irhfwziGhrKGLzWF2lotLbAjHlZpeIww4OFgY7h+Q3lEq6cbTSKiCNhQCvA==
X-Received: by 2002:a63:154b:: with SMTP id 11mr11133228pgv.11.1585267227431; 
 Thu, 26 Mar 2020 17:00:27 -0700 (PDT)
Received: from localhost (c-67-161-15-180.hsd1.ca.comcast.net. [67.161.15.180])
 by smtp.gmail.com with ESMTPSA id f5sm2739018pfq.63.2020.03.26.17.00.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2020 17:00:26 -0700 (PDT)
Date: Thu, 26 Mar 2020 17:00:26 -0700 (PDT)
X-Google-Original-Date: Thu, 26 Mar 2020 17:00:24 PDT (-0700)
Subject: Re: [PATCH for 5.0 v1 0/2]  RISC-V: Fix Hypervisor guest user space
In-Reply-To: <cover.1585262586.git.alistair.francis@wdc.com>
CC: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, alistair23@gmail.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Message-ID: <mhng-f7361188-1bb2-4ea3-bc25-3076f877aa64@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Mar 2020 00:00:42 -0000

On Thu, 26 Mar 2020 15:44:04 PDT (-0700), Alistair Francis wrote:
> This series fixes two bugs in the RISC-V two stage lookup
> implementation. This fixes the Hypervisor userspace failing to start.
>
> Alistair Francis (2):
>   riscv: Don't use stage-2 PTE lookup protection flags
>   riscv: AND stage-1 and stage-2 protection flags
>
>  target/riscv/cpu_helper.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)

Thanks, these are in the queue.

