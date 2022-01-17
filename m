Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n9atD-0004S5-7T
	for mharc-qemu-riscv@gnu.org; Mon, 17 Jan 2022 17:54:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n9atA-0004Lz-Lq; Mon, 17 Jan 2022 17:54:12 -0500
Received: from [2607:f8b0:4864:20::133] (port=39498
 helo=mail-il1-x133.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n9at8-00015x-45; Mon, 17 Jan 2022 17:54:12 -0500
Received: by mail-il1-x133.google.com with SMTP id a18so9658489ilq.6;
 Mon, 17 Jan 2022 14:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QRPPRcNtYb8Ebog1Un8xp0CH1otva/5wDhRVvCbl5PA=;
 b=q5GPEFfxHjldI2mCY+XgbEAcbNGtye+bWPMTzLAleMQiMeRNq46bfCLTspWYQajZmE
 wv5mKFgi3rCjhTn9dugsbT8g+uG/gzVnmGamhl9yC5+nwBOEoe/+MS4LpxngS5inEOEH
 1wnGLRozwdjyNp/hCSEf18iIIpvtH0ehUEGBDqWd7ESQfL4vfs2Jz5wE2e/45GA6RdmJ
 pCp8I6d/96ow3Ef3VxePJfOCalaOZd8bVR4h+2TKpe8fJL+IXQ/VfE5L3HFlwYZPl1zi
 Zy4EYvVUv65E/2zZ/nEYz1vSDeeKVIbT/oxyldeuEflPGIC2qttT5bCtAbcmOpGljXM3
 qrCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QRPPRcNtYb8Ebog1Un8xp0CH1otva/5wDhRVvCbl5PA=;
 b=WsckgMKfeUMAlV9R7x3WntyU8K16dyh1/yQdTIbMD019267pT1p5DAEsPkLTExJkDU
 6dhmuk6Ys8aoigUDFCEsX/Zm8vLSGfF/saicdbwkrkMy5IguwawDYaLPVQrqSnfg8YlI
 1EQkmRFlxQ/WJo78g2yZKRDDhKSEaXj3fRsYDf5zPiH0UfWEQ7/EcZnV+NVkrcaxP9Nf
 4cjdDx9nov/6XfwQFIHNRDktLNDzJTkDCB1vQwZDNEQoc1gm/vxxhtLSmet8/U1txzBF
 dZ++SbJwhkSvK+HkKTd5bYyp4uDfGDrj4KkpYsHdkXYJJ8epFoF3+y2QSobReb5GRvI8
 FhlA==
X-Gm-Message-State: AOAM5326/tnadiwkJZnDvRsNR1Tqqkl7DTCgCdVWagPWMJTEw1knrr6s
 lFm5EYFuD6KHpWS9vEipks7AAhno/6WtlhORfHM=
X-Google-Smtp-Source: ABdhPJxujU+Dkn/Xs8evV8a2xmYCbHzVSrNoG931Bai288KPlN8BIEerszcpMAjiH/XRKX3BuH/H0Muj6B7o6W21o30=
X-Received: by 2002:a92:3012:: with SMTP id x18mr11433967ile.221.1642460048893; 
 Mon, 17 Jan 2022 14:54:08 -0800 (PST)
MIME-Version: 1.0
References: <20211229023348.12606-1-frank.chang@sifive.com>
 <20211229023348.12606-11-frank.chang@sifive.com>
In-Reply-To: <20211229023348.12606-11-frank.chang@sifive.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 18 Jan 2022 08:53:42 +1000
Message-ID: <CAKmqyKM39pejjjut60-6zSQ-J=aFOApjgRGb6sf1=1M=U8YyDg@mail.gmail.com>
Subject: Re: [PATCH 10/17] target/riscv: rvv-1.0: Allow Zve64f extension to be
 turned on
To: Frank Chang <frank.chang@sifive.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::133
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::133;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x133.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
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
X-List-Received-Date: Mon, 17 Jan 2022 22:54:13 -0000

On Wed, Dec 29, 2021 at 12:44 PM <frank.chang@sifive.com> wrote:
>
> From: Frank Chang <frank.chang@sifive.com>
>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/cpu.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 01239620ca..38cd11a8ae 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -636,6 +636,7 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
>      DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
>      DEFINE_PROP_BOOL("Zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
> +    DEFINE_PROP_BOOL("Zve64f", RISCVCPU, cfg.ext_zve64f, false),
>      DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
>      DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
>
> --
> 2.31.1
>
>

