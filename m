Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oWDXQ-00080F-Eq
	for mharc-qemu-riscv@gnu.org; Thu, 08 Sep 2022 05:09:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oWDXN-0007y2-NT; Thu, 08 Sep 2022 05:09:29 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:41853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1oWDXM-0007ct-49; Thu, 08 Sep 2022 05:09:29 -0400
Received: by mail-pf1-x436.google.com with SMTP id l65so17278183pfl.8;
 Thu, 08 Sep 2022 02:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=di5L+G9zu/7flBurMlH5x+Ejragwq1PyU97RZdLLSLA=;
 b=S3N6pu8STamCHwvW9YM87P31C99BeHr6nc7LnAaBr5Uj7uuVmB/pk6CLDqY9AIIUR6
 INOkBkCCIS0nvL5dAFXwdlJYhHgkn69Yk9lakx+rgTq0+hzrAoEQSVFFCThciCndjrfX
 0u5i548hj/CpLWJDw6l/Gw5RhBuXlouCvADzqO6MaW8iDyt/IGvNMiRxNudiUXGR61pJ
 7cfPUL93Qmhq9Aw4Y4CbOkLYJMDx/S1U8lJ3nr/0VF9OdK0VZkfPYlaksaHzEgJRwHSG
 sIKrH9mzIXylDCrka6PDicFPV3NJg1P6OOGdRjOp/T6Yf4e1pQlGjGZLoz2hghYvtdco
 1NUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=di5L+G9zu/7flBurMlH5x+Ejragwq1PyU97RZdLLSLA=;
 b=hKawqoyNQAhgHgj/xM3v5BdqexL51fkH6m8Gn1CtptkPOUemzLgdinjJdXAs12ZTrV
 n6rhef3hIIc6ojnGZtrIOGfrZBj/kP/Brvz3sGbM2XvaGh5emP9+0UZ6qn1Jl7QwKIlU
 372f3Qpi4TSvfD/e80uRC2abEgs/NZFO7EIe7ggpsCdIt96HtrWq+BOgsJb+VMB9bBiQ
 c7TH+21jbPQTbsE7CvZqPTDzWNpZshxHXt2zUoITT8H/G6QJf1l5c36ptCKI9TCBU37j
 wKNKUxSVX8vocaoDF7bY5EL02yGCc62BqksegkohxM6Xa5l3QWgcLu1V0f7zPEycqAUR
 Nljg==
X-Gm-Message-State: ACgBeo2Zk9WkyWTrya5hIDQZ1JPlE/Q2luhqF3vVVQiPGg5stYSApOf1
 TFDatFpuI6CCZbIMdNkbrPggL5APXeYuMK4EG+w=
X-Google-Smtp-Source: AA6agR7R5WEMzl06WcLzXudUUNqYLoW6vmlz9FlYcomeppG2g0gLxstHd/yd2zk6hT2FPhbym8iTEo+oW2DTiNsf6Mw=
X-Received: by 2002:a63:8549:0:b0:434:3c39:4fe0 with SMTP id
 u70-20020a638549000000b004343c394fe0mr7008918pgd.221.1662628165352; Thu, 08
 Sep 2022 02:09:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220823061201.132342-1-wilfred.mallawa@opensource.wdc.com>
In-Reply-To: <20220823061201.132342-1-wilfred.mallawa@opensource.wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 8 Sep 2022 11:08:58 +0200
Message-ID: <CAKmqyKPCQd18DBEioZQUX5V-B0XcXqeZhYHDftPd-zfYsMb+Mw@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] hw/ssi: ibex_spi: cleanup and fixup bugs
To: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=alistair23@gmail.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 08 Sep 2022 09:09:30 -0000

On Tue, Aug 23, 2022 at 8:12 AM Wilfred Mallawa
<wilfred.mallawa@opensource.wdc.com> wrote:
>
> From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
>
> Patch V4 fixes up:
>     - Fixup missing register field clearing on tx/rx_fifo_reset() in [2/4]
>
> Testing:
>     - Tested with Opentitan unit tests for TockOS...[OK]
>
> Wilfred Mallawa (4):
>   hw/ssi: ibex_spi: fixup typos in ibex_spi_host
>   hw/ssi: ibex_spi: fixup coverity issue
>   hw/ssi: ibex_spi: fixup/add rw1c functionality
>   hw/ssi: ibex_spi: update reg addr

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  hw/ssi/ibex_spi_host.c         | 174 ++++++++++++++++++++-------------
>  include/hw/ssi/ibex_spi_host.h |   4 +-
>  2 files changed, 106 insertions(+), 72 deletions(-)
>
> --
> 2.37.2
>
>

