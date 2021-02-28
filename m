Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lGEQG-0006pE-Tu
	for mharc-qemu-riscv@gnu.org; Sun, 28 Feb 2021 00:15:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lGEQE-0006n9-Sz; Sun, 28 Feb 2021 00:15:14 -0500
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:44094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lGEQC-0001Vi-PW; Sun, 28 Feb 2021 00:15:14 -0500
Received: by mail-yb1-xb2b.google.com with SMTP id f4so13388864ybk.11;
 Sat, 27 Feb 2021 21:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M+nbYEPDmROvplud8P18wUkNibKsWIoTz9K9t2bcUmY=;
 b=uOK8EondsvdZF263LFgA/azb8O6q1JsdFT+9K27zpJCRAqkr+cBrWGKRR5hDQr/On7
 ZxPlvaenw0Zlvgi8wDM7aNniM25oqx2WpVctcE/6rZRPeULWbHrVghn7zls8jf85Y3SL
 VNQv7i7P49yquMOPuA4EpRyPZncSLq1N1rJHQS5rjFc4X15xRI8R6y4q/TAOb3+DcS8k
 t2dLS8PWphZVmGjMbliP6URLvbwO3upabFX2/OP4fknyDX/ThUml7wjgr8uhQko3GtAL
 zpnsjIB2Hzweh96Md9uatrzydYsP8kiJYNZQee70p79/zme25bcMm0N7Ex4ldu+4YONq
 N2xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M+nbYEPDmROvplud8P18wUkNibKsWIoTz9K9t2bcUmY=;
 b=OFCiYJmkw2GCTzpOa72cgGSo2cvoxVbcynLvE1dKuNAvl1RtCCGNigbeCF4CV17FpJ
 kcvMK6jhSGziO6P+g9PXmWZtz0W1wRbZ0WnSJXIyQAmHkl2RzzppNlrZz4cSrPTKd/QI
 k2TfHGIOUU4VPSAbrZ09LoWzMAV9mBL88TvHZyXne1DeV1qxDtpuvkr6Tluf+6tMlKfe
 lZEhi9QGvlspq0wxXL3C8u3c7FAxFRJ/S+uPh4okgvAEi8j/M3XYOCBx6V4TkpetRwxF
 5UmODNI72Bq2JSbDvAYzKI038LJlKbIKpdBJXd1rt3uUkkhc+Aa9ggyPBg2q4+pTIbhN
 P6dg==
X-Gm-Message-State: AOAM532RaYGXX6q1MfBJGQ86N2oAb2w2NHEpdE49t84zlVxCKW8ZwfwR
 snNSQbPpvH+peeMusL8b91hu5w4PcsCwXXEWNas=
X-Google-Smtp-Source: ABdhPJx9mwGvGgfk9xlG/BKBwYrW1Iip2TSjudX4j+zjK0prlmv/hVcIqT8jPJYRfpZSJXGpxu7jM702eofocTgPJAU=
X-Received: by 2002:a25:c090:: with SMTP id
 c138mr14212520ybf.314.1614489311396; 
 Sat, 27 Feb 2021 21:15:11 -0800 (PST)
MIME-Version: 1.0
References: <20210220144807.819-1-bmeng.cn@gmail.com>
In-Reply-To: <20210220144807.819-1-bmeng.cn@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 28 Feb 2021 13:15:00 +0800
Message-ID: <CAEUhbmX2+CtzQ53JbN-Vn9mVX9tipTND3xGJzk317mTZEfayJA@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] hw/riscv: Clean-ups and map high mmio for PCIe of
 'virt' machine
To: Alistair Francis <Alistair.Francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Cc: Bin Meng <bin.meng@windriver.com>
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
X-List-Received-Date: Sun, 28 Feb 2021 05:15:15 -0000

On Sat, Feb 20, 2021 at 10:48 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> This series does the following clean-ups:
> - Drop 'struct MemmapEntry'
> - virt: Drop the 'link_up' parameter of gpex_pcie_init()
>
> It also adds the following small enhancement to 'virt' machine:
> - Limit RAM size in a 32-bit system
> - Map high mmio for PCIe
>
> Changes in v3:
> - Fix the typo (limit) in the commit message and codes
>

Ping?

