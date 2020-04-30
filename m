Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jU7kK-0004cS-7v
	for mharc-qemu-riscv@gnu.org; Thu, 30 Apr 2020 07:52:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34028)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jU7kE-0004Y3-Tl
 for qemu-riscv@nongnu.org; Thu, 30 Apr 2020 07:52:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jU7kE-0000Xl-6H
 for qemu-riscv@nongnu.org; Thu, 30 Apr 2020 07:52:46 -0400
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330]:33226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jU7kD-0000XN-N8
 for qemu-riscv@nongnu.org; Thu, 30 Apr 2020 07:52:45 -0400
Received: by mail-ot1-x330.google.com with SMTP id j26so4659159ots.0
 for <qemu-riscv@nongnu.org>; Thu, 30 Apr 2020 04:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Izs21Dp5htQo5BsetrxdKdZNkodJ6x5Fwd/PALoe3gM=;
 b=XOWsX2j7wxxmuQmkQxrDgpGmfQj6kh38hlLsjBBf4fI0P7YAVRq/fsWxbJDfiFrncs
 l5stKnrYzWnDAxfLJkfBBC1uJ00EtrIWIqpivonBWFwXxtBHzT61O6i9FaxIED0PAG/j
 AJjGxbaknYjo/TWaWyKMH5AJw9U/5VxO74ucEHO3eemTfQI9HUn3R2P4TUrF2LiBkhsu
 b/ri799XcePxH6hh0h1DslkH1Kk8Cj7vCinOhauIf6s1ms6NPkVWaUoiEVtNyri/Y2ck
 RHsR3Um5+ZjPYZWrParD0m0l1gvYqlWvPSRW9NlqaylSGXFLOFCvkDmE8f66wk+L77e0
 JIPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Izs21Dp5htQo5BsetrxdKdZNkodJ6x5Fwd/PALoe3gM=;
 b=cJTsOvzfqOI+g5Ui+9W1xNcLku0kddEVFnTuscwzIHe9nOQrhAt7tTa6UeRNEWGz4m
 IoaDH1LnuUvBu0ab5gUEkQsItJIrsfX3ZSKgZwAncZUKQTJzIMyPxxpvXGcuQkgV7S2h
 eV/Z7aVElat0OMIYghj2U99jMKVF2uBPivfALHmE/0yrvhgy+CumRLsyvLgA4WC6etpb
 +eUloejDgQXK1so1Wv9mMLgfgB0/s19mFb6HkgZAIZDT1MTzE/OB4hE6nhKm3JUeWig6
 qe/xj8myoCxEdt88eC160BUOPDy1qJmBic00q63uy+lD6qrQFelybAJsV3HgxmlOw+Bw
 WXHw==
X-Gm-Message-State: AGi0PuZeEqZN3pJLx99/WDEidI9/8JMN6B+NXFQoYMdEMLLeLOLNl6L4
 OMuDf3u5Ai4pvmnlGDXgdrPAgrUYGnofqR3/2x86nA==
X-Google-Smtp-Source: APiQypKGHjUIVl9cqGW7cp6iw8qHumIRHIR5IoLraX7rhyYg4L0rCSoOyEojsmoPmiTx85+tgEEu+ohZc2x5mwpxDDw=
X-Received: by 2002:a9d:2c08:: with SMTP id f8mr2195218otb.135.1588247564326; 
 Thu, 30 Apr 2020 04:52:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200429202006.775322-1-alistair.francis@wdc.com>
In-Reply-To: <20200429202006.775322-1-alistair.francis@wdc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Apr 2020 12:52:33 +0100
Message-ID: <CAFEAcA8d5y1d0hsNfPakVxoTqdPJ7NSUr6d5PQcwRDUtX9pq4A@mail.gmail.com>
Subject: Re: [PULL v2 00/14] RISC-V Patch Queue for 5.1
To: Alistair Francis <alistair.francis@wdc.com>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x330.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::330
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
X-List-Received-Date: Thu, 30 Apr 2020 11:52:48 -0000

On Wed, 29 Apr 2020 at 21:28, Alistair Francis <alistair.francis@wdc.com> wrote:
>
> The following changes since commit 648db19685b7030aa558a4ddbd3a8e53d8c9a062:
>
>   Merge remote-tracking branch 'remotes/armbru/tags/pull-misc-2020-04-29' into staging (2020-04-29 15:07:33 +0100)
>
> are available in the Git repository at:
>
>   git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20200429-2
>
> for you to fetch changes up to 31e6d70485b1a719ca27e9a2d21f2a61ac497cdf:
>
>   hw/riscv/spike: Allow more than one CPUs (2020-04-29 13:16:38 -0700)
>
> ----------------------------------------------------------------
> RISC-V pull request for 5.1
>
> This is the first pull request for the 5.1 development period. It
> contains all of the patches that were sent during the 5.0 timeframe.
>
> This is an assortment of fixes for RISC-V, including fixes for the
> Hypervisor extension, the Spike machine and an update to OpenSBI.
>

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.0
for any user-visible changes.

-- PMM

