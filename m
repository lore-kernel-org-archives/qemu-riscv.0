Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ma4iR-0005zs-K7
	for mharc-qemu-riscv@gnu.org; Mon, 11 Oct 2021 19:28:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ma4iP-0005zM-GO; Mon, 11 Oct 2021 19:28:17 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:44755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ma4iN-0001UY-AJ; Mon, 11 Oct 2021 19:28:16 -0400
Received: by mail-io1-xd32.google.com with SMTP id r134so10492569iod.11;
 Mon, 11 Oct 2021 16:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y0u2TicUjQnsubUke+AZihaZP6nL4ialkq6ZjFvgxTM=;
 b=TdkiBiIDHkw949BblXUxpF5LlKtOYciTw4bgWitr1ly2x12Ufm508cIY2CRXDPxrF1
 vTf6lcfj0N23uePxlBE8jlvqom4wppCqojTDfkvi1x2VjocWQogAirdWtZal1EVJqj7X
 mO/0lGImpqKm1VtOXijnJo1Vg/jMLCJMriYZjn9L8QbwhuQw/CQye2AQmWUl8e2TARGX
 WJzgvt/1H62eA33HC8tylQT2qcET0X3X/YHp7o2xhIsmUbPGOdXfgIaqZ08VnS5oecFs
 rqrP7hh73H2/9n4epSjD8JuND3Etpf6bASTg60DyFezT0KKILbIvml12c6jDG+Ei367X
 ivDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y0u2TicUjQnsubUke+AZihaZP6nL4ialkq6ZjFvgxTM=;
 b=jELw8/imGo62izgfvY+d3ewi+IK1ew6iRN55iRH2mCq3qCKfcGpr6WLTC5OMKJ8dIc
 XqO0QovMjDdeoL1bENrTpLT8AiFhUAxEvn/hSNi242KUyJhDBd4NoH/DYD+kwBGl9KIV
 t8IDXr1TXroNweG+A4/ZdI6qRSe85VQNK+kuMvEiS8QRrRjkkVbcVOGhmVaqa6Cl513M
 B8XzF+9lsCa8K7OeIR/hzABO/mCzbVJjBraCh5nTFC3ZJBDVDictiCxQWrDHuzAx8ORn
 jr4UdAuWvqpjh4H+7hlmGvJ77k8dYx5yHuwbuhIVJ9MAGjl5tHna61urKMJi06evV361
 CgJg==
X-Gm-Message-State: AOAM533c9f9QjjNvOmlTfXEywt1l+sronNPPvb7GzAVIJhhlYqrp/PtB
 3NCK+tz+dp9pqF7A1nfUZjfBt+M9kzPim4Ywq+Q=
X-Google-Smtp-Source: ABdhPJy+vC5r4sh02gjcRRLP6sdd20x0ce8vjIs1CUXax1Ja38heW3wJ2gqkZz4wG+afbREHecULX3tySMpgQa09FUU=
X-Received: by 2002:a02:2124:: with SMTP id e36mr20748265jaa.35.1633994894038; 
 Mon, 11 Oct 2021 16:28:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210929091244.75988-1-limingwang@huawei.com>
In-Reply-To: <20210929091244.75988-1-limingwang@huawei.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 12 Oct 2021 09:27:48 +1000
Message-ID: <CAKmqyKMZyX5Z=UKC2seUD_3q6UciszVu0_EuqOO8ad_22DCa1w@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: virt: bugfix the memory-backend-file command is
 invalid
To: MingWang Li <limingwang@huawei.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Jiangyifei <jiangyifei@huawei.com>, 
 wanghaibin.wang@huawei.com, fanliang@huawei.com, 
 "Wubin (H)" <wu.wubin@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d32;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd32.google.com
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
X-List-Received-Date: Mon, 11 Oct 2021 23:28:17 -0000

On Thu, Sep 30, 2021 at 12:03 AM MingWang Li <limingwang@huawei.com> wrote:
>
> From: Mingwang Li <limingwang@huawei.com>
>
> If default main_mem is used to be registered as the system memory,
> other memory cannot be initialized. Therefore, the system memory
> should be initialized to the machine->ram, which consists of the
> default main_mem and other possible memory required by applications,
> such as shared hugepage memory in DPDK.
> Also, the mc->defaul_ram_id should be set to the default main_mem,
> which is named as "riscv_virt_board.ram".
>
> Signed-off-by: Mingwang Li <limingwang@huawei.com>
> Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

