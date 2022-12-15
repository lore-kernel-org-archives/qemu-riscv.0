Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p5o1E-0006cA-EQ
	for mharc-qemu-riscv@gnu.org; Thu, 15 Dec 2022 08:11:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1p5o17-0006aF-LP; Thu, 15 Dec 2022 08:11:18 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1p5o16-0003gv-30; Thu, 15 Dec 2022 08:11:17 -0500
Received: by mail-ej1-x629.google.com with SMTP id vv4so52126021ejc.2;
 Thu, 15 Dec 2022 05:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JxbuaFrd+WkhJRBMy2CuNgnAovUKHPt+1nivNBDLsvY=;
 b=kSI5qIXLcE08PiI+DPmQWR/oHXViAkwrIoth4t3GaqwlYuVpecbrhT6z0lOlYERBtu
 5SMHIBYzee13c2Nekx8XqC6ny3IT6VtbAeVJ8DhXcr2Y1r8LhVZ846q3bBDQHkxfeI1F
 NtWkRjIXkRkmDRzHts+cLH0T0P//igJyNqZxZnnHAzld4h3ZoxW7bghJqEp8b+JWq5SM
 C7CpIMOFaPWdSCJBuxBtv9FyNCzA6TU7RoHNpJZC9gP4ECU3J6/58/wxpYSGmlH87CcU
 ai7RL3jmtVdUrn8KZ+Rtid4SoGOh269jQnqW3+R+9T1h1e88TBreA84CS3HZeL0ZKkFF
 h89g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JxbuaFrd+WkhJRBMy2CuNgnAovUKHPt+1nivNBDLsvY=;
 b=U61c1VxP0xWOmIrTGRTio0/Zmjl2ROlVOqapoREQc3B20SaFHF59wF9ELxZhXqt6nH
 WwbkiqmMh5riC8iPNavh+ISqq6JLN71RtMZrH6HOKQlK7F4nxTYrdOCzP9IQJQWYY3hb
 yq5mpVefmiGzZjBHo5YWg2MM8mkMPuJttzmSaUQolq7L/CfaUD9qBGeV0PHxK0QOB+d7
 Q/wPtzQkpk83/VtHRSQbC3wgZRd/Tnb6e2pGL1EgL/8guOKEyTIUNSwCaUx0whPvEK5e
 8JXrnC71WoXJX7LPJGuOj1kVeCkf9azAjAsnVfGykStJtaOa0sgbqoH6jW6xMLGvYhev
 B25A==
X-Gm-Message-State: ANoB5pki6UzoUcI9alqsXWeO/x+iQhXnVoO3uVKyBZkHUkFE7P2eVAUd
 HcvFBGEhEuRXfBbd0+2fBBEVIHwzL9V198GWkB8=
X-Google-Smtp-Source: AA0mqf5eP3xI5e97r3DP7mbZNSVWaZCCucKfeHviZErFuC2jhTMerukAJMH7GrTXEYEk9eqPVfl3CtYXi3kggBaqLX8=
X-Received: by 2002:a17:906:ccc3:b0:7c1:a0d:dd2c with SMTP id
 ot3-20020a170906ccc300b007c10a0ddd2cmr12148548ejb.26.1671109873799; Thu, 15
 Dec 2022 05:11:13 -0800 (PST)
MIME-Version: 1.0
References: <20221208145411.122799-1-mchitale@ventanamicro.com>
 <20221208145411.122799-2-mchitale@ventanamicro.com>
In-Reply-To: <20221208145411.122799-2-mchitale@ventanamicro.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 15 Dec 2022 21:11:02 +0800
Message-ID: <CAEUhbmXs6=7_vVZT-vHAVynuk6QT3QgaZnGr9908H1bKV-vi-Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] update-linux-headers: Version 6.1-rc8
To: Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Alistair Francis <alistair.francis@wdc.com>,
 Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 15 Dec 2022 13:11:18 -0000

On Thu, Dec 8, 2022 at 10:54 PM Mayuresh Chitale
<mchitale@ventanamicro.com> wrote:
>
> Sync headers with kernel commit 76dcd734eca2
>
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  include/standard-headers/drm/drm_fourcc.h     |  34 ++++-
>  include/standard-headers/linux/ethtool.h      |  63 +++++++-
>  include/standard-headers/linux/fuse.h         |   6 +-
>  .../linux/input-event-codes.h                 |   1 +
>  include/standard-headers/linux/virtio_blk.h   |  19 +++
>  linux-headers/asm-generic/hugetlb_encode.h    |  26 ++--
>  linux-headers/asm-generic/mman-common.h       |   2 +
>  linux-headers/asm-mips/mman.h                 |   2 +
>  linux-headers/asm-riscv/kvm.h                 |   4 +
>  linux-headers/linux/kvm.h                     |   1 +
>  linux-headers/linux/psci.h                    |  14 ++
>  linux-headers/linux/userfaultfd.h             |   4 +
>  linux-headers/linux/vfio.h                    | 142 ++++++++++++++++++
>  13 files changed, 298 insertions(+), 20 deletions(-)
>

Acked-by: Bin Meng <bmeng.cn@gmail.com>

