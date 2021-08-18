Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mGFvD-0003Tc-3I
	for mharc-qemu-riscv@gnu.org; Wed, 18 Aug 2021 03:23:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mGFvB-0003Qm-HX; Wed, 18 Aug 2021 03:23:33 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:41484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mGFvA-0003kZ-1K; Wed, 18 Aug 2021 03:23:33 -0400
Received: by mail-yb1-xb34.google.com with SMTP id z18so3405685ybg.8;
 Wed, 18 Aug 2021 00:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IF6NZz45I+WSdew3eOCmCMOkUvcUmI17Xq4Cnzu/pWY=;
 b=U3oUYHlx+fRe2JUsTN5uq3aQyc89bJbQfzfCSB1Fnrbldl5gXC+WnMxkf/j1OMUuZh
 TDsuJfv2t6yPQVBTt7A9Hr3UibgMZooSqRm1gyig1N8ZRyEg0AVzaQjgh4JZlWZfDLNV
 g/OmoJeoKvns+SdSqe0bu18Okco1LPOhOvgL8CvNe03zNA2vR5By9NSFx1yhf8M8QBDI
 xOcMW4ZBJWa5vs+H9555xdTsoE10dPXrGzKelNO2K1Y/BgVsGlJJfa3I4pNGzXWRH+gi
 v1E8dwN17hb61U6kigqvvVKKzHb1DdNsOhpRKGEb8+oqdHZ15+u3J5BGVdHtDzKVSeeG
 B5bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IF6NZz45I+WSdew3eOCmCMOkUvcUmI17Xq4Cnzu/pWY=;
 b=Qh6mhVDnxw3wguZYxeQxMlzBlFVdIj67wPFPPVcb1xJ0uFBkh4AZuQ8d0Hexgar+eS
 HCh5ehBd2OfIkqRLfECFTvvwmLd4fYSG7/z6ZsiU131Y9s5mi9nxEGj6bMPiwJc6fJWV
 5fto43iUymF45LvklaZ+XTn0fbNnsiIw10Svax2XX5D/EH9VtOwLSvJ0CHnC+cyqK4c7
 6uj3Zk+UGPEfhsF2/U2jg+Lh3ks71EYSBf1IFGJ4wLhoveqIGNteGpKbn8+lnsuHVLyK
 +AxV+mEVC67ewHdFWCNBfOdlgGRMkmxDPTys8ZEF5V3ImLv9/yylBZoFsh/vtKr6r83N
 yBIw==
X-Gm-Message-State: AOAM532BXNRP/N8MPNzxgE6VUk0Wn7na/cJxfHLAK7AC8RAfirat5EG1
 vgfB87L3Dj7aPG80eZ6TuqzrY84pIEHnP8kV4QE=
X-Google-Smtp-Source: ABdhPJzODQcpjeUU8EnHZeDesOs6crbRhrY3vKzmcS3AoFrPvJZIYroN1eEJ2tKpZA4abVhLnIBlUhfgrQ/KQva2WJY=
X-Received: by 2002:a25:bb08:: with SMTP id z8mr10021929ybg.306.1629271410157; 
 Wed, 18 Aug 2021 00:23:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210817211803.283639-1-richard.henderson@linaro.org>
 <20210817211803.283639-2-richard.henderson@linaro.org>
In-Reply-To: <20210817211803.283639-2-richard.henderson@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 18 Aug 2021 15:23:18 +0800
Message-ID: <CAEUhbmWKqMBqzojPqCTfXriKzFtMTBjWPY9rg=nzZ696YOf4dg@mail.gmail.com>
Subject: Re: [PATCH v2 01/21] target/riscv: Use tcg_constant_*
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 liuzhiwei <zhiwei_liu@c-sky.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb34.google.com
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
X-List-Received-Date: Wed, 18 Aug 2021 07:23:33 -0000

On Wed, Aug 18, 2021 at 5:18 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Replace uses of tcg_const_* with the allocate and free close together.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/riscv/translate.c                | 36 ++++----------
>  target/riscv/insn_trans/trans_rvf.c.inc |  3 +-
>  target/riscv/insn_trans/trans_rvv.c.inc | 65 +++++++++----------------
>  3 files changed, 34 insertions(+), 70 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

