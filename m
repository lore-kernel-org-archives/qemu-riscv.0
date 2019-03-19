Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h6KHK-0004D9-30
	for mharc-qemu-riscv@gnu.org; Tue, 19 Mar 2019 15:20:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43412)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h6KHG-0003ef-OC
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 15:19:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h6K83-00065Q-F8
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 15:10:29 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:46384)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1h6K80-0005xj-2Z
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 15:10:25 -0400
Received: by mail-oi1-x242.google.com with SMTP id x188so4690262oia.13
	for <qemu-riscv@nongnu.org>; Tue, 19 Mar 2019 12:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=mZhUIOPm82oZmMwmx/vpbehnh1ICCMdQPeBfAOgUopk=;
	b=RqVRDgJ6DBFm437ThtvJSxAVVwHeH46OFoji3zKE8eHTu0dKd/Mve4AFokxxKMzbyS
	IE/kI9Vw9oootI5jIaxf3KznIgGheCLzAANPsEU5rCqKILioW8YBqObW5MqhGMOT2HSP
	mSQtj/LeWPeHwNQS8+1ooC1pk2UfDTxvvkgda+CUXYeWMn7ZOjH+C9uEEGb5Mtfuac/M
	8DqvFA5v0uXqmLuYPrOzSCbwyZFxQDBPYtqW7bmB2tnWlUQzuLOqWPJfpKn1eNYKYMOX
	iILoTxUhkiPb3K/w8ON0gBXsmx3zL68RMW5kturnwDlcrg5nxKMSGUkGyxYlE9fbYW1v
	4XbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=mZhUIOPm82oZmMwmx/vpbehnh1ICCMdQPeBfAOgUopk=;
	b=rOSxOCpiZJdfepgqtIPcLf8eSfyE/sV9PB9cpsUSCrp5qW7WB/XsiuyzyTFDCQ5nnc
	3JCblblXW3/SSF13/uJi53IsDbWYP1zkUDBQ6hKbVDFBmGuxONXf++WdcoCBmRIhvWbz
	LkoRuI1C3Ex1aKGaEeOoLV8cDz6hOY52hq6IrosL4Hzuc8nqP5BQXx8jvRSudGdvh25q
	3+eTjwX8n8BgcDxE0tlsM24v6G/YyHTmEml2tVKT+B/TzleqoeaTzak0kamxvYQEd/xn
	MNF+tLDzYojOir6ggbpEFSs64bLlEDtXt+SzsLNrWl6FBgGTB9fH+k0SRhLvJei1XS8m
	Kd0A==
X-Gm-Message-State: APjAAAVnziQp8LhPBSSLqx4uEGM89s4LmG00GWxDrdmfod72DwB8Z9ae
	5z4mDI7FgU53Ct/yBbvHKJysWml08xU2CmWeg61hNQ==
X-Google-Smtp-Source: APXvYqyUKGD7hme3AZx7loi5AuJ7aDxOC2+4a4kTBhkHvrkBnPFl33CEqW+GcfN3cp/pFuVQnOjNsQM6NAj1NgdeDWo=
X-Received: by 2002:aca:4c88:: with SMTP id z130mr2604520oia.170.1553022622646;
	Tue, 19 Mar 2019 12:10:22 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1553019560.git.alistair.francis@wdc.com>
	<073a79909f5ec317747ff8330744e6d7dabec717.1553019560.git.alistair.francis@wdc.com>
In-Reply-To: <073a79909f5ec317747ff8330744e6d7dabec717.1553019560.git.alistair.francis@wdc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Mar 2019 19:10:11 +0000
Message-ID: <CAFEAcA-x0r6a7uyR8KDBp2qv7KwRZu3dKxK73-XN7aAzgz=e_A@mail.gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>, 
	"alistair23@gmail.com" <alistair23@gmail.com>,
	"palmer@sifive.com" <palmer@sifive.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH for 4.1 v1 4/6] target/riscvL
 Remove the unused any CPU
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Mar 2019 19:19:59 -0000

On Tue, 19 Mar 2019 at 18:24, Alistair Francis <Alistair.Francis@wdc.com> wrote:
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.c | 10 ----------
>  target/riscv/cpu.h |  1 -
>  2 files changed, 11 deletions(-)

Won't this break linux-user? cpu_get_model() in linux-user/riscv/target_elf.h
specifies the "any" CPU as the default to use if the user doesn't
pass one on the command line. (In general you want the default for
linux-user to be an "as many features as possible enabled" CPU.)

thanks
-- PMM

