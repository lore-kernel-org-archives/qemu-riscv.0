Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mKuFj-0007HP-Ul
	for mharc-qemu-riscv@gnu.org; Mon, 30 Aug 2021 23:16:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mKuFi-0007E3-7R; Mon, 30 Aug 2021 23:15:58 -0400
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e]:43992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1mKuFd-0005SH-7g; Mon, 30 Aug 2021 23:15:57 -0400
Received: by mail-il1-x12e.google.com with SMTP id v16so18495636ilo.10;
 Mon, 30 Aug 2021 20:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yPNZX7P54KVEzrCbnhJGSetG+8EZx91kDa2mfSgB/ms=;
 b=Fin+//ABrHecKM5uvFS37uplP8cX29nJU6UkuUe93L/KkuqIlLMW2VCzJ7j2A/n7jl
 d8movteRccNRVkbeB3NQ+vLPW5Cd+Wno1GVrLKq6OW4r/TiKowxjlKWvET3DzEJlCrB6
 mQjTPWkgWoCdtk9ZFyyxEfPDbOxdjLVWR9P6Bu0N/yzHUv+3fbAN7Bwpht+JzHqLYROA
 l1ZGI9XWJrnVBlLkwnkDeMJrZOlqGclOKClabxNzACEWZFb09GuhJf+mSlzhdoIIyfW7
 7U9zrqgxNLXanSXt8Qdwh7ojWQECmVdia/VpO9NPCW+99LzldUQVUeNQTbLmCUHrRPju
 v8UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yPNZX7P54KVEzrCbnhJGSetG+8EZx91kDa2mfSgB/ms=;
 b=n281ScegHrl0vf1h5BqVfuSUSBDUAa8OTI70Db5BzTNMoc4rrkKT3IbWxdBOS+3qcN
 tnJMsglP/WwEoyLLG7IfkAE1P4dT/MeFeNRzbDsHddKC3fjkgzIYx6dJDz95Tk9Xcdpk
 xu7bOsgQXlxiiYLK92EPX9Mx4DH0vPwnr5I5YV7rxcQ1boPq1ssfzxL3EDAfOubDyj7m
 /Wcpig30NLbuRjpHUa+KtEmz1rUKHw5237c+IJxV6FUvscwun+dD7u5q0TiBj2F3wYL0
 4EaUeVc9kDQma6ntP4vVFuW2mSBUHpGq4V0ie5fuMJFZh1gKktgfMwKPY6f8hexoArga
 dM5g==
X-Gm-Message-State: AOAM530o9111B9zrmnqE2XGsSYGF9HWWylixhVDNtAFpkqI4pLn1UeYB
 l0koyoDGO3en5tXkoDzkGFTKMb8R5uwOOnE2jcw=
X-Google-Smtp-Source: ABdhPJx7HBJ0HinhevOJzJmNlKQAdy7kNjMYQDXdZnMazN6FXIkJApX/tNdc/nnm2KBO1Whi0JCoW0Yy1S+uIZ7t6Zk=
X-Received: by 2002:a92:8707:: with SMTP id m7mr18840129ild.177.1630379751544; 
 Mon, 30 Aug 2021 20:15:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210830171620.126296-1-frederic.petrot@univ-grenoble-alpes.fr>
In-Reply-To: <20210830171620.126296-1-frederic.petrot@univ-grenoble-alpes.fr>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 31 Aug 2021 13:15:25 +1000
Message-ID: <CAKmqyKPZeN-gNpaQC+gRJnZeLowurawP_4+ro2O762OK-85e4g@mail.gmail.com>
Subject: Re: [PATCH 0/8] RISC V partial support for 128-bit architecture
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Fabien Portas <fabien.portas@grenoble-inp.org>, 
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::12e;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12e.google.com
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
X-List-Received-Date: Tue, 31 Aug 2021 03:15:58 -0000

On Tue, Aug 31, 2021 at 5:29 AM Fr=C3=A9d=C3=A9ric P=C3=A9trot
<frederic.petrot@univ-grenoble-alpes.fr> wrote:
>
> This series of patches aims at adding partial 128-bit support to the risc=
v
> target, following the (unratified) RV128I specification, Chapter 7 of
> riscv-spec document dated 20191214.
> It provides support for all user integer (I) instructions and for an M
> extension which follows the definition of the 32 and 64-bit specification=
s.
> We also included minimal support for 128-bit csrs.
> Among the csrs, we selected misa, to know the mxlen in which the processo=
r
> is, mtvec, mepc, mscratch and mstatus for minimal kernel development, and
> satp to point to the page table.
> We fallback on the 64-bit csrs for the others.
>
> In the last patch, we propose a "natural" extension of the sv39 and sv48
> virtual address modes using 16KB pages, that we believe suitable for
> 128-bit CPU workloads.
>
> There are two strong assumptions in this implementation:
> - the 64 upper bits of the addresses are irrelevant, be they virtual or
>   physical, in order to use the existing address translation mechanism,
> - the mxlen field stays hardwired, so there is no dynamic change in
>   register size.
>
> As no toolchain exists yet for this target, we wrote all our tests in asm
> using macros expanding .insn directives.
> We unit tested the behavior of the instructions, and wrote some simple
> user level performance tests: on our examples the execution speed of the
> 128-bit version is between 1.2 to 5 time slower than its 32 and 64-bit
> counterparts.

Are you able to share these tests? I would like to add them to my
RISC-V tests so that I can catch any regressions

Alistair

