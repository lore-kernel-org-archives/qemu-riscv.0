Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l0oTD-0000YI-Bc
	for mharc-qemu-riscv@gnu.org; Sat, 16 Jan 2021 11:30:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l0oTB-0000Uz-Jz; Sat, 16 Jan 2021 11:30:33 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:37467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l0oT9-0000Bq-Uh; Sat, 16 Jan 2021 11:30:33 -0500
Received: by mail-ej1-x62a.google.com with SMTP id b5so1248681ejv.4;
 Sat, 16 Jan 2021 08:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a996qffOhPVC8h5EeKaDNaF2f7H9yETuT2jGJPfiNwI=;
 b=s753u0nS/uXb5BBEItuU4+gU190o6i0LX7ItfZq1vssPLwGlJgea8OK5vayUAj3jyM
 jk2LKHOE/igZIFvdhkp9i7bvciRSipv+hbUr2CZIU5SlGufkI5lmScax4rO6l9TgQZ4z
 i9Xln8a8Oc0eNf4KSMqCFUGgQWtUJQeRYf/fYb8i0EYIyJL0SYlzTpE5A3kR6qfgYA6o
 0V+w7f6u5ON4YojbhI5E+SWZ3SBEyozMT9QLkSB/m9CTBqTvyq3+4aeGTVKNBG1Wz29d
 C/RAaVOjGawnaFvfonkdjixlaYGvFvRRhBMRHzkQ34b8ZdgA7skh7gGL3xTl8PG4WyLd
 xf5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a996qffOhPVC8h5EeKaDNaF2f7H9yETuT2jGJPfiNwI=;
 b=WkiLGyC9kP7lLj/z5xG2jadBVwE2BIkyMmwZRcMpSIzdaGfjVKLtl7wz/7X0QGMrVH
 6/nTAzx/3yeCGSImGdD/yBYfSPzZ2jbrd8bFvUWdIx9RnJTGIixtEWXzgx+/lJfseVcU
 bH4Vvw3GrESFhPZ9u6Iexe9QpPjVFjK1OvwjU73dmTLNHvbHMVAFNeI0KaToP/g2MsB8
 2ffUThaXk85EDZQJbZDM//Wz/guMPg9yrjG+OW07sNznNKPLdtHk5uwPumze6iLXtaG1
 1cFtyOa0B0S7X3aDTOmBjXBdWzMWiSaVP2QICPoGy7kV0nHwDSGTAHDS+ja8W4kmJw9+
 P6ig==
X-Gm-Message-State: AOAM5300mDP0f7Lbg4j7dthpTFOQm0e3nZ4Fa4PcmIG7woaoDkBJPrel
 diiVWce5WX60jGC0ftKuzuumYypPBrqA+xj7hR8=
X-Google-Smtp-Source: ABdhPJwbe9jcXevWyvJyZsPLUqfBMHmKmnNL15ha+zpduUQh9JOVDfU0JiR7jwypP6aGwyya+axiU8Exy9SJeJ6EFuY=
X-Received: by 2002:a17:906:1c0c:: with SMTP id
 k12mr8479999ejg.354.1610814629782; 
 Sat, 16 Jan 2021 08:30:29 -0800 (PST)
MIME-Version: 1.0
References: <f3e04424723e0e222769991896cc82308fd23f76.1610751609.git.alistair.francis@wdc.com>
In-Reply-To: <f3e04424723e0e222769991896cc82308fd23f76.1610751609.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 17 Jan 2021 00:30:18 +0800
Message-ID: <CAEUhbmWC5CDqK3QuuLY9PFAxr=OcePsJqsUQjhw3em5GOH+Ccg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] riscv: Pass RISCVHartArrayState by pointer
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Sat, 16 Jan 2021 16:30:34 -0000

On Sat, Jan 16, 2021 at 7:00 AM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> We were accidently passing RISCVHartArrayState by value instead of
> pointer. The type is 824 bytes long so let's correct that and pass it by
> pointer instead.
>
> Fixes: Coverity CID 1438099
> Fixes: Coverity CID 1438100
> Fixes: Coverity CID 1438101

Where can I look at the Coverity report for QEMU?

> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  include/hw/riscv/boot.h |  6 +++---
>  hw/riscv/boot.c         |  8 ++++----
>  hw/riscv/sifive_u.c     | 10 +++++-----
>  hw/riscv/spike.c        |  8 ++++----
>  hw/riscv/virt.c         |  8 ++++----
>  5 files changed, 20 insertions(+), 20 deletions(-)
>

Reviewed-by: Bin Meng <bin.meng@windriver.com>

