Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pJkdk-0003vy-0K
	for mharc-qemu-riscv@gnu.org; Sun, 22 Jan 2023 19:24:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pJkdb-0003vQ-58; Sun, 22 Jan 2023 19:24:39 -0500
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pJkdY-0003Ek-Fc; Sun, 22 Jan 2023 19:24:38 -0500
Received: by mail-vs1-xe34.google.com with SMTP id q125so11369528vsb.0;
 Sun, 22 Jan 2023 16:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8fZqZuTkE+WjJG7EHXyNeyFw6GlZLWGaAGuhBGJ4LdQ=;
 b=QMK/MAMBMvYJiGXeeX98pckLE0Z6OzQzARKzsKk7TXkzqE+xKi90y7i/J8SN/CPbQt
 Fq33cSvbqP8h4RBxC0PTVTVVkk8sJW1+Dy2wx9MnZoO1ZJDgUdDCYCWJos5ANGhWVdjr
 4scGTnYKeolXMl6lqOyB9BMWCnKAhvAAZeR5lqe7XnCWOSs2FtvcsUnsPwK8uhWCLL4l
 xynfV2+tA12rDbawD2cOh6L1axKW+TlSPqwYGlGFZkfe7AhvfRbOieBwiDgbh0hK+eVj
 b1eiPDRS1uu1i+LCZK1uzPKtyFtyStMBK10BB5jfRf69FxBXe8iigiom3Qy2E1CPY4XF
 85Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8fZqZuTkE+WjJG7EHXyNeyFw6GlZLWGaAGuhBGJ4LdQ=;
 b=iRd+to8HxQ989PcFU7/sdYYGtgVyRttKeCkcFh4Bx6pse+p+jPhYj4s7xxR1AVmlec
 a54g29Lxpkh2FYpjTCb3RjBY38MCie0KUs4CHjmILW1mykh3PG4X4+5sP808mkao9T1I
 UIvaF0iWVVhhXyFE5l0lC/6FnyhLn+YpRXclu9yZtl8qra2PST7ooiah4fmWhd8/jDA5
 b/qhOWIgFeYA9xDSBl5tM5wfG0OSZQARi+164ls0ZjEVxpDjEU9cnORxTy9vGD9AOT49
 d+pzljqIDvCXZWhTG/Y7R3E8MobG/OmFIYnAHDpuZXKGExfpKtxuAOUl0DwDFg2YX2hv
 dN0w==
X-Gm-Message-State: AFqh2kphf1eQ+Hhg4q4APyjxfMGTVd249dxA1i+FtRB7bhwIP9LOByR+
 XXFfwKYc44e6nVbpmqTi+IkqRcQ4MwWytjBshtuWwQZ4Qt4=
X-Google-Smtp-Source: AMrXdXtIXWCIR/tqdeTZojbxIs4jgf7z7eNX8xPSjUSRXdjSMIOYSi8hd6LXbNxCEELtv9vVc1d3wosEXTKboXVhYJE=
X-Received: by 2002:a67:eb10:0:b0:3c9:8cc2:dd04 with SMTP id
 a16-20020a67eb10000000b003c98cc2dd04mr3192007vso.73.1674433474431; Sun, 22
 Jan 2023 16:24:34 -0800 (PST)
MIME-Version: 1.0
References: <20230119213707.651533-1-dbarboza@ventanamicro.com>
In-Reply-To: <20230119213707.651533-1-dbarboza@ventanamicro.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 23 Jan 2023 10:24:08 +1000
Message-ID: <CAKmqyKP4NPME9J5y+4M4SqXsEXWyeM4J_MjJ6McNiEa-KB9-EQ@mail.gmail.com>
Subject: Re: [PATCH v9 0/3] hw/riscv: clear kernel_entry high bits with 32bit
 CPUs
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e34;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe34.google.com
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
X-List-Received-Date: Mon, 23 Jan 2023 00:24:41 -0000

On Fri, Jan 20, 2023 at 7:38 AM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> Hi,
>
> In this version I changed the patch order to avoid having a patch that
> would trigger the 32 bit regression Alistair observed. Patch 3 is now
> the first patch.
>
> I've also addressed the comments from Bin and Phil.
>
> Patches based on riscv-to-apply.next.
>
> Changes from v8:
> - patch 1 (former 3):
>   - comment changes
>   - now open code '32' instead of using a macro
> - v8 link: https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg03254.html
>
> Daniel Henrique Barboza (3):
>   hw/riscv: clear kernel_entry higher bits from load_elf_ram_sym()
>   hw/riscv/boot.c: consolidate all kernel init in riscv_load_kernel()
>   hw/riscv/boot.c: make riscv_load_initrd() static

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  hw/riscv/boot.c            | 96 ++++++++++++++++++++++++++------------
>  hw/riscv/microchip_pfsoc.c | 12 +----
>  hw/riscv/opentitan.c       |  4 +-
>  hw/riscv/sifive_e.c        |  4 +-
>  hw/riscv/sifive_u.c        | 12 +----
>  hw/riscv/spike.c           | 14 ++----
>  hw/riscv/virt.c            | 12 +----
>  include/hw/riscv/boot.h    |  3 +-
>  8 files changed, 82 insertions(+), 75 deletions(-)
>
> --
> 2.39.0
>
>

