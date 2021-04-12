Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lVsb4-0006A6-W4
	for mharc-qemu-riscv@gnu.org; Mon, 12 Apr 2021 05:11:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lVsb1-00066X-Qr; Mon, 12 Apr 2021 05:11:03 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:33477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lVsaz-0002jv-Ud; Mon, 12 Apr 2021 05:11:03 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id l9so14343023ybm.0;
 Mon, 12 Apr 2021 02:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nABuKKdRDN+Fl/z9GIRmcfz0VXkAT07SG/Q/04FRPsI=;
 b=ETFJeLXZ39FjCMpufOpYDqqF7ItpcotWur8gvq2vBSvMxwf75WewPkiCVBK53u2Odp
 K+Wg6wN9X2qbPrgrqhzU+vDlxLD9ntATEw9m2ueDr3hwyCG2/6cBpPq1Yu4RFcmK9w+y
 9GZJNAG61sePNkO4gzMxoCGkquce2+xDtz5VekOfLfVKH7uOCoKOOoEODa/PpXX+RegF
 bW3BinA6cmn/AGJ2BtyzosZVGD5MBt2PimRegilJufD0VwPY64fF1zuYW5GKqe0FmkkV
 w05OAyId0R8vVWH/rsV1sYhpr6FVc+IVpjORK24I6pK0UYBohTg7pYCG1ct4o3r//ZaI
 wb+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nABuKKdRDN+Fl/z9GIRmcfz0VXkAT07SG/Q/04FRPsI=;
 b=P8QhD3/SB8i1RC5/fT+URgfGqEzqHCIyfmiL5oU/ViaJiW+GG5j6f6l8Oe51I407Zr
 z55MfEO/T5ZxFtWFJbM3T2BFV/vETGKM3SoE7CehsVyqoVQRyHcg5729rUDawnhQaIVl
 kbw0kvqL4o3DPJMdWDWjt7CSJLWS8tP04vUud/qxuSRsGBW7qXwpEBcNp5kYjp22XvkZ
 R44DUikPj5UB2gSra2JFlIlZ2FTUwCI2euUCgrPJl+kUZ+ovwYPLWnF1unn9DgR3CrEr
 7Dius+jtOeGhrl/kuutVjj8dgOOiijMxFbinUbaBmatVoXS3QN9sij5BNnaHZkuh2tK/
 2GSA==
X-Gm-Message-State: AOAM5339BIAQAdWAzEkl1X9uPvOo/dj3hrlOzhZq+QxGQTCybEmHTsMi
 kwwtetWr02RJCp1JbHmQMuNp0VcWD73TIdhrAXM=
X-Google-Smtp-Source: ABdhPJzBtU604S13k1I89MNrFYzALnozGkYtmdi6dkc3Xx/4Wj1ORjnBRsQrmu4PwbobmkmXn89wR+/VYopTAqcz24U=
X-Received: by 2002:a25:5146:: with SMTP id f67mr34794852ybb.332.1618218657305; 
 Mon, 12 Apr 2021 02:10:57 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617393702.git.alistair.francis@wdc.com>
 <8c175fde1809d8ca97409eb86cd3e92216e115d6.1617393702.git.alistair.francis@wdc.com>
In-Reply-To: <8c175fde1809d8ca97409eb86cd3e92216e115d6.1617393702.git.alistair.francis@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 12 Apr 2021 17:10:45 +0800
Message-ID: <CAEUhbmVF_ojwW=-B9QPFJ3aasg7SNoPA=cChb-4ofNJ3+bhC5w@mail.gmail.com>
Subject: Re: [PATCH v1 1/8] target/riscv: Remove the hardcoded RVXLEN macro
To: Alistair Francis <alistair.francis@wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2b.google.com
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
X-List-Received-Date: Mon, 12 Apr 2021 09:11:06 -0000

On Sat, Apr 3, 2021 at 4:04 AM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  target/riscv/cpu.h | 6 ------
>  target/riscv/cpu.c | 6 +++++-
>  2 files changed, 5 insertions(+), 7 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

