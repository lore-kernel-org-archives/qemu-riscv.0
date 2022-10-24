Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ompca-0007FE-Ix
	for mharc-qemu-riscv@gnu.org; Mon, 24 Oct 2022 01:03:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ompcC-000753-V6; Mon, 24 Oct 2022 01:03:09 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ompbf-00072p-2v; Mon, 24 Oct 2022 01:02:37 -0400
Received: by mail-pg1-x52d.google.com with SMTP id 20so7807093pgc.5;
 Sun, 23 Oct 2022 22:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZA+I9P+HA0eRsWd0aw5rkAerG5WV+yD1m4cluS74LDM=;
 b=JROy1/rYu5w5vaoAiSwSMgmXJ9wK1qFTmXW9qGXYDEhw393TEwCTijkHOcfQAhr1K8
 4pIrc+AN5/ET7A+5Kppoa1WdzHxkgcva03UeekhJAMMDiY4jLXo/+eTI8rDeqh0ur6p5
 sZqO3ftWgtW3EhgfSj4bcicahTlawZRjh0iIpKp/IC1NnD6y0V2ltfWg7Snr03gCwFpX
 rgRkyV0Hkc4w6Tksb0M68hoVmwH4rY/iJAFO6FHHgEexzRq4uACsdSIJujmVX6+zR/Z1
 UQ7D14H+WvbfK8lsN2bizbB/DE4Vvkg5kaVUFFTNQUBl315NuMipGLEQA4WsWia5+tLE
 60Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZA+I9P+HA0eRsWd0aw5rkAerG5WV+yD1m4cluS74LDM=;
 b=i0ZT0AeIGNxc+mtcAj3a/HUoDC1wSOcb77Q40QPZLup+uZrSmo1TnLOfK6k6yY7vGt
 TsJIOHcQEqYVlF1J0x/iUXlKl+kHREu5G2qFIG+h/kS13MauT86OXfqAR856HGBMr5kg
 ZJsIH14hwhGw0G+lAEvtanJAc1fjSTfkcrFcO6hYOdHqh1S4kR/nSVqEEQqf5J48OL3L
 2jNihdGxRU8LEhbwrth3JvhE8e7kEY/qmhsF7i/SxEdYm4PvkZesSzv8H6bIXJN12rSW
 QaDMhqg33j7VrwhLEP4zBSJNhKAk3MV2JtTLvllWTxf+3IPMqa9D1xCxk33Y36TQ5W3c
 44tg==
X-Gm-Message-State: ACrzQf3/sPX5f/krvGhGLZMCKKZXo49ysyQo38Grx3m7HQjTbb9z4IE6
 zD5AbRCCX0jAQsu9GwGHIo1MZ0Oj+UszqjheTpc=
X-Google-Smtp-Source: AMsMyM4kJYRysFNJGjSLFYr+2BIL/dFSexD2QGXzCBSa4/WIvL2yQVzFzUlD/zTnyme4rvVWBXMnlT+WfDfVVV4X1KY=
X-Received: by 2002:a63:ce43:0:b0:45b:d6ed:6c2 with SMTP id
 r3-20020a63ce43000000b0045bd6ed06c2mr26593148pgi.406.1666587752456; Sun, 23
 Oct 2022 22:02:32 -0700 (PDT)
MIME-Version: 1.0
References: <20221017054950.317584-1-wilfred.mallawa@opensource.wdc.com>
In-Reply-To: <20221017054950.317584-1-wilfred.mallawa@opensource.wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 24 Oct 2022 15:02:05 +1000
Message-ID: <CAKmqyKOUjUbgjhqvWA9ozsQxemApvcHGa0GSDe=6DTBtr-wDsA@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] implement `FIELDx_1CLEAR() macro
To: Wilfred Mallawa <wilfred.mallawa@opensource.wdc.com>
Cc: alistair@alistair23.me, qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Wilfred Mallawa <wilfred.mallawa@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x52d.google.com
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
X-List-Received-Date: Mon, 24 Oct 2022 05:03:14 -0000

On Mon, Oct 17, 2022 at 3:52 PM Wilfred Mallawa
<wilfred.mallawa@opensource.wdc.com> wrote:
>
> From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
>
> This patch series implements a `FIELDx_1CLEAR()` macro and implements it
> in the `hw/ssi/ibex_spi.c` model.
>
>                     *** Changelog ***
> Since v2:
>         - change the macro arguments name to match
>           the existing macros.
>          (reg_val, reg, field) -> (storage, reg, field)
>
>         - Add the use of this macro to `ibex_spi`
>
> Since v1:
>         - Instead of needing all field bits to be set
>           we clear the field if any are set.
>           If the field is 0/clear then no change.
>
> Wilfred Mallawa (2):
>   hw/registerfields: add `FIELDx_1CLEAR()` macro
>   hw/ssi/ibex_spi:  implement `FIELD32_1CLEAR` macro

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  hw/ssi/ibex_spi_host.c      | 21 +++++++++------------
>  include/hw/registerfields.h | 22 ++++++++++++++++++++++
>  2 files changed, 31 insertions(+), 12 deletions(-)
>
> --
> 2.37.3
>
>

