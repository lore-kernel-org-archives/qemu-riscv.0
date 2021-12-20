Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mzBR6-0007n5-BJ
	for mharc-qemu-riscv@gnu.org; Mon, 20 Dec 2021 00:42:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mzBR2-0007lG-Q1; Mon, 20 Dec 2021 00:42:09 -0500
Received: from [2607:f8b0:4864:20::d32] (port=44815
 helo=mail-io1-xd32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mzBR0-0004Q9-AM; Mon, 20 Dec 2021 00:42:07 -0500
Received: by mail-io1-xd32.google.com with SMTP id b187so11721338iof.11;
 Sun, 19 Dec 2021 21:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2CuLSanqv4LFwTntbzogmoSLhYAu/WUbV8sfCZuZE4Q=;
 b=o1v/n2wIvFEHJ/Hrh8JQ2r4h1S2ynY4HFvUYSHsB/wsIHTnHQcPTL6qbLoSKTFNmX5
 TTHsKI6BsbK2C3HgNnzoxWRnxFzkKowKiKTMZGAKf2bEEtxw4In6RfnSSbnFf3uICQDa
 +8hok04h447+RdOfv8zXb/5k/29DnxvBtknVpIgWKqYCImL/te/nN6t3sXHThiGVhn4F
 EERlbxZtEX7HvysLU8uNOegKm12N3uizB4ywAKMms/SOFDfbs8Yq2kjJFLP1b5asJYkO
 7xrDxYyVxP/6smaEoc2Gke3YXCWQG9czfBxmLJVLXBk8akNXIXP/zjmfMaLIjImWKpzN
 qPDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2CuLSanqv4LFwTntbzogmoSLhYAu/WUbV8sfCZuZE4Q=;
 b=sZs/zf9mvPlg9C2ohaIqw0McSooTM9znz39CcHrlh2WMrpiSKw78gKhtpHKjmJHDcy
 2rTSSFPunICBb4Mc8YdQUqKLFT8iQKl6yXgPqDXvtZlaerFIrWa/zXoSxpdgMmmtZn9F
 p3JbRoKZMJqoZqIq+wWz/u2Wu7a7b/lFOt18f64WTJWTBUu//uWeSywt0bBZIdHviVNy
 6QnrfgPsLjTG7mDuXvMw+95HyssoOvu3Ko5SmeAMnnygHla2KyBeKJ2ZttI6ye7/TOda
 sXZV8+NvGu3c24wG+4Qey2CSfEzErSHEyYXFDHoPHtggMPF618oi5DxyXKROFRq04s4G
 BCPA==
X-Gm-Message-State: AOAM530UZ5j1m7ktbtYzobRNEbjqhDMquUl7S+HMRntIP7xJKdNLN3PE
 /W2nzLA+MF/SmLQ06qEoNkbnTSkx7cha7F1b65Y=
X-Google-Smtp-Source: ABdhPJy6cf9HOcCEZJQ+TEb+YfctzACsijHVGr2fk0uHXYRGqwR7TBMFt4I12zgGcgm/MOgIjms9xdkhtM2i/FJVDII=
X-Received: by 2002:a05:6602:140c:: with SMTP id
 t12mr7291906iov.187.1639978924179; 
 Sun, 19 Dec 2021 21:42:04 -0800 (PST)
MIME-Version: 1.0
References: <20211216045427.757779-1-alistair.francis@opensource.wdc.com>
 <20211216045427.757779-9-alistair.francis@opensource.wdc.com>
 <CAAhSdy0ruRoGvxby2Y44NwSmtPWyGqO03es-W4fegmcWa0mxJw@mail.gmail.com>
 <90fb8940-f684-f546-fd18-288af467df8d@amsat.org>
In-Reply-To: <90fb8940-f684-f546-fd18-288af467df8d@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 20 Dec 2021 15:41:38 +1000
Message-ID: <CAKmqyKNSUQGAUL16Qks9c-aY61K5wAFYqU+a8MV8Y=m_+T-Daw@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] hw/riscv: virt: Allow support for 32 cores
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Anup Patel <anup@brainfault.org>, 
 Alistair Francis <alistair.francis@opensource.wdc.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Bin Meng <bin.meng@windriver.com>, 
 QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bin Meng <bmeng.cn@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d32
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d32;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd32.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 20 Dec 2021 05:42:09 -0000

On Thu, Dec 16, 2021 at 6:18 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> On 12/16/21 06:58, Anup Patel wrote:
> > On Thu, Dec 16, 2021 at 10:27 AM Alistair Francis
> > <alistair.francis@opensource.wdc.com> wrote:
> >>
> >> From: Alistair Francis <alistair.francis@wdc.com>
> >>
> >> Linux supports up to 32 cores for both 32-bit and 64-bit RISC-V, so
> >> let's set that as the maximum for the virt board.
> >>
> >> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/435
> >> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>
> > IMO, we should keep QEMU VIRT_CPUS_MAX as high as
> > possible to allow any kind of software Linux, OpenSBI, FreeBSD,
> > Xvisor, Xen, etc. Let the guest software decide it's own limit (such
> > as NR_CPUS of Linux).
>
> Agreed.

I agree as well. I'm happy to increase this in the future, the problem
is that I am only able to test it with 32 cores on Linux.

Alistair

