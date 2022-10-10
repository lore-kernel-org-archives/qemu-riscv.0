Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ohhml-0001dG-Fy
	for mharc-qemu-riscv@gnu.org; Sun, 09 Oct 2022 21:40:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ohhmj-0001d3-Ta; Sun, 09 Oct 2022 21:40:49 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:43798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ohhmi-0000ef-DT; Sun, 09 Oct 2022 21:40:49 -0400
Received: by mail-pg1-x536.google.com with SMTP id h185so2117944pgc.10;
 Sun, 09 Oct 2022 18:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2tPuzwyP8cSxKDnrAFtvT4LYJC47mXQ6PiM3wXLHzDE=;
 b=Qbdmh7mdEwS6/10ncD1sjgOEWJh7Shp70oI61y/9gKUFVXgn1Yn6TCK4p2Ja7pc6dC
 7mdWByRr9+wUV5hbqXt5USUHKt026f46I/gkrCzWBTTli/R85MSt/GOgXgh0DPmkY9xY
 5XbjmtJ/zAr9PAxHo2/4x8zueVHqewJkAQKBRXuI3lrnIYZVOOp/ST2dMJrQ5fcG06hk
 VbHvpc7ktKQSO3qhXjrVFqIKQ4rNj8A9cxOcrgHjb0MXv/Mn6rxlTT+Ovq/Z4KUIvvVz
 /i4Cra3+v4/fmjZRcHPdORffUlb+YJv2vg3A9UcEwskbjpuX8DFS6eCnmCb4VY9dKv++
 86ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2tPuzwyP8cSxKDnrAFtvT4LYJC47mXQ6PiM3wXLHzDE=;
 b=pQbzZeP08WmrDDVFGd8DOeyBTz0FY6bRfE+JMm73lnr3ye29Qc0SCT+6Fd95P/Xx69
 R0El+nEzjDGRECNXnWk6WCJPJgn0Sn3cEwxVX5W6MsJYi4YDLz7/BI6a/vXwYIIb9/X0
 +TlDq2jeWA1zSvs0gGsNOUoi8Px7TDieumvNhrmt1sfPZhb+w+u9i0nWX2ThFms+o8Vv
 8e7q0E88BAG7WaFkEhMaAjXR99lzsk7UOTV1gf1dtQI/9l4Ut8Tj1CRyTfeH3FQnfoga
 fk39R7m6PzLPl+8+TZGvnL2bJ8w4SjaC8Q054oSCt+XFGlJUx1M7wOqJo2m9R9zolPJl
 tL3Q==
X-Gm-Message-State: ACrzQf1K3m7dDdawi55Thd2BNsCeM7sRfN1E8nRoV0zxQL9huuel3jKJ
 V5t5nCs3vVWHPQ1au7rkO/lNzbJx2QdVr4JeGII=
X-Google-Smtp-Source: AMsMyM6TFLLkmQvc9g0Y+4cLa8K3+xtXb8PpDv1cwjK7btzr4QM+PyNQjYuLZbHh8yWTONgJYxU2HdtWhzf6kt6MRqg=
X-Received: by 2002:a63:ce43:0:b0:45b:d6ed:6c2 with SMTP id
 r3-20020a63ce43000000b0045bd6ed06c2mr14535439pgi.406.1665366046273; Sun, 09
 Oct 2022 18:40:46 -0700 (PDT)
MIME-Version: 1.0
References: <BN7PR08MB435525C92550BAC5467BE672BF219@BN7PR08MB4355.namprd08.prod.outlook.com>
In-Reply-To: <BN7PR08MB435525C92550BAC5467BE672BF219@BN7PR08MB4355.namprd08.prod.outlook.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 10 Oct 2022 11:40:20 +1000
Message-ID: <CAKmqyKNyqun0BLM9vwAkTWL9_Zw-AgTsqJNVyG=CuWQnAJid9w@mail.gmail.com>
Subject: Re: [PATCH] hw/riscv: Update comment for qtest check in
 riscv_find_firmware()
To: Bin Meng <bmeng@outlook.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x536.google.com
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
X-List-Received-Date: Mon, 10 Oct 2022 01:40:50 -0000

On Sun, Oct 9, 2022 at 11:04 PM Bin Meng <bmeng@outlook.com> wrote:
>
> From: Bin Meng <bmeng.cn@gmail.com>
>
> Since commit 4211fc553234 ("roms/opensbi: Remove ELF images"), the
> comment for qtest check in riscv_find_firmware() is out of date.
> Update it to reflect the latest status.
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>
>  hw/riscv/boot.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
> index 1ae7596873..f6e8eafa28 100644
> --- a/hw/riscv/boot.c
> +++ b/hw/riscv/boot.c
> @@ -111,8 +111,8 @@ char *riscv_find_firmware(const char *firmware_filename)
>      if (filename == NULL) {
>          if (!qtest_enabled()) {
>              /*
> -             * We only ship plain binary bios images in the QEMU source.
> -             * With Spike machine that uses ELF images as the default bios,
> +             * We only ship OpenSBI binary bios images in the QEMU source.
> +             * For machines that use images other than the default bios,
>               * running QEMU test will complain hence let's suppress the error
>               * report for QEMU testing.
>               */
> --
> 2.25.1
>
>

