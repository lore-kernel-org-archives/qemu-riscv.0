Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lnXzS-0002AR-Kj
	for mharc-qemu-riscv@gnu.org; Sun, 30 May 2021 22:49:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lnXzR-0002AB-AT; Sun, 30 May 2021 22:49:17 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:35660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lnXzP-0002qA-LD; Sun, 30 May 2021 22:49:17 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id i4so14577802ybe.2;
 Sun, 30 May 2021 19:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=EU70BArKliqRXfTLYS/ge//lcvpR1LcRZXub7iWCWPQ=;
 b=eUBbeleGwVWBqw8s6nmwJPR4psGG6zV50ymbJi5mfKMMN4/ZDBWKexL/MhGJW8AFWh
 Cp8Y9p/LhfLNKZ7IcINxVQKQ3lyEof0y7xNdspTxY8EI96M3ETpfKGOqcuzSbVItCRMD
 9yjTsoSZsjV1USLrKmKXqy5RyoUtKYzJBDSmhNxf6MZLBV00iLj5Vfxq/YUn2oIHVi1P
 Hovi7YypCaufcy87SX7E0fPEf3UoU724e9lYuQ1/MxIXcqIeZIsqDRwv3MeQvdNLX+oM
 BKbPsoccTxBDRja/Il9HDCiHjJeha8F1hYL7WPizJg5HahcBpzxIlQ/oyWkP4Sm9lt7r
 VrgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=EU70BArKliqRXfTLYS/ge//lcvpR1LcRZXub7iWCWPQ=;
 b=o3Sp/C50LD8ipqvPudwrEVeRIv8SbngL4gTm7PEQe3aM06agL2QzjxnlXTW/dzSacR
 lYLYrU9JUU3ZRSjZp2cXXOJel8vVdwy/J/vTQGgmRnJaKJMgPedGrEj6f5dTszcAn5Bx
 jl7fu6YxSpqgX684Ov0PLetvLDIfjPHvX6Bte1FidhrgvCNyr6YHGXp71UpDjvZK0AbN
 xnxNitTlNbAPl9V8e4rkipIJbK5wXTW/ztCRFE4jcUHeiychekVIzbS0lRdmQnIWMcRi
 rp5/+2qr/K+F6Nl1u3nYxEN2prP8nxJ31cysC8J0YliLPzOsvs8NIYa4tqOMyc0lV6uN
 yNdg==
X-Gm-Message-State: AOAM532rI0FK0x8F63oTtHFQptEFWOAONjZaXfr7nxm4Cy2e5aW+3nHW
 pq7iSBIHbCmtRDLRR39a4PST75OqivanMKTeox8=
X-Google-Smtp-Source: ABdhPJx0tGaCp0MZmGr/cmmMQuGGanaHZN/sB6D9+ZV+euPsU8W3trWNb8+UUOfRSL7mJqOFiZaogPjDLKOp+UwTtnI=
X-Received: by 2002:a25:389:: with SMTP id 131mr27492191ybd.306.1622429353398; 
 Sun, 30 May 2021 19:49:13 -0700 (PDT)
MIME-Version: 1.0
References: <0CAA9018-0C42-4140-82C1-EAC80D46D359@getmailspring.com>
In-Reply-To: <0CAA9018-0C42-4140-82C1-EAC80D46D359@getmailspring.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 31 May 2021 10:49:02 +0800
Message-ID: <CAEUhbmWnj3GOD5-EA54XHRQyfiSdOsH+KKGH-+uG0LEH+kAuUg@mail.gmail.com>
Subject: Re: HSS Issue with GCC 10, Qemu Setup for microchip-icicle-kit
To: Rahul Pathak <rpathak@ventanamicro.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2c.google.com
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
X-List-Received-Date: Mon, 31 May 2021 02:49:17 -0000

Hi Rahul,

On Mon, May 31, 2021 at 1:08 AM Rahul Pathak <rpathak@ventanamicro.com> wrote:
>
> Hi Bin,
>
> I was reading a github issue which you raised for the issue with HSS because of GCC 10.1. Its pretty old and not sure what has changed so I thought to ask you over email for help.

The HSS issue of GCC 10.1 was already fixed in the HSS mainline.

> I myself is trying to make a setup to boot the  microchip-icicle-kit Qemu machine with HSS and Yocto linux image. Currently it does not work.

Could you please elaborate which part does not work? Is that Linux,
HSS, or U-Boot?

>
> Do you know what is the right setup to make  microchip-icicle-kit machine with HSS.bin and Yocto linux work on Qemu?. Probably there will be a working combination of HSS, Linux releases plus the toolchain version which makes this setup work.
>

I have not tried Yocto Linux yet with Microchip Icicle Kit on QEMU. I
only tested the Linux images released by Microchip.
Could you please follow the instructions @
https://qemu.readthedocs.io/en/latest/system/riscv/microchip-icicle-kit.html
to see which step might be wrong on your side?

Regards,
Bin

