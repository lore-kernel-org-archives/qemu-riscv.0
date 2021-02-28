Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lGKVA-0004U8-CC
	for mharc-qemu-riscv@gnu.org; Sun, 28 Feb 2021 06:44:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lGKV8-0004TX-Py; Sun, 28 Feb 2021 06:44:42 -0500
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:36273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lGKV6-00041C-G3; Sun, 28 Feb 2021 06:44:42 -0500
Received: by mail-yb1-xb2c.google.com with SMTP id b10so13967837ybn.3;
 Sun, 28 Feb 2021 03:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X54A7/ybXLvq9/4HiUi5vyijcC8g+NiERXS0t5mk0t8=;
 b=KYHnLtg8wrzeY/0ghsE0tYbuNB04ra9ywfFSLu57aSdMv5oAhw6AGRXnne8WetfCX/
 FtSq1BAyS89Vv3jStDbczwmepXIBiuQQp5YF3faIlSMU9C4vEnwIUWPDsmFxB2elBAeh
 hnmD3Ov3ki0+q9NBr7GfFIdUlKoxeNZdcy2LlWNVlSldzoiX1Vfjn5gVuNqs8Kj8NDpn
 tkgyDyRJSUVA418yGX1Q1tXpt5FWhnF5+cKyEhMuz/NfNdqexNy7IGXQaSrfr6+geceo
 imtCmziXzmWmjBqq26uwjwf8K1zyOom+2x7MsOhenYia6jIb5AwZ1V87gCZHKhcFhTTu
 MuDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X54A7/ybXLvq9/4HiUi5vyijcC8g+NiERXS0t5mk0t8=;
 b=PHiuEs/m29IfZbacOWHOro1Dlg2BIZEP8mlA0SRPb4Cl4eeLa8Hvb/EURKqtKu910j
 hQ4iHxEfgBOPMegQ9AUw3g2FTAE12FucvJI+zpDc643I8IeDUS90FF6zzbjbcx2gfWDF
 sE+pcLbYjsym7F4SVegztjBKVJFptCgJL/Hx10IEq7f9qPQbIRUG/iYvtKqDwQrIPaKF
 inDsP7rkM0asYYeM5xrSno6MVsg+o8PHzUhPNqjYav2w7pgXiHbK+XWTzoe1K5rxt586
 ng9zAvn0JAgIz4Sb6a8VFaCU3yf0fDj3CwtsYVS1vjq+p/LxsrvOdjwBcynv1uggUmdt
 A2XQ==
X-Gm-Message-State: AOAM532w4OdH47KdyUGTcF3AWd8PSwQw7ydkYUezdsMGyuakKsTRxD1K
 0kWAQTQecnXWY9jIDua4LJ+S2jPkE6hBsdMd00Q=
X-Google-Smtp-Source: ABdhPJz2M4VfbD6aEnk1tYZKIDBXh0R4vjgcJHx3YOEBXV/ejQmwiisPtc+mYTYUNdCgxgjLbgi7CIY+ygvfxQM0nEk=
X-Received: by 2002:a25:2d1f:: with SMTP id t31mr17619228ybt.239.1614512679171; 
 Sun, 28 Feb 2021 03:44:39 -0800 (PST)
MIME-Version: 1.0
References: <20210228111657.23240-1-ashe@kivikakk.ee>
 <20210228111657.23240-2-ashe@kivikakk.ee>
In-Reply-To: <20210228111657.23240-2-ashe@kivikakk.ee>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 28 Feb 2021 19:44:28 +0800
Message-ID: <CAEUhbmXPC5CKnsvx7_0qG4eN3zMS6as4PkbxSE-kv0De1Lv_VQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] hw/riscv: Add fw_cfg support to virt
To: Asherah Connor <ashe@kivikakk.ee>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
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
X-List-Received-Date: Sun, 28 Feb 2021 11:44:43 -0000

On Sun, Feb 28, 2021 at 7:17 PM Asherah Connor <ashe@kivikakk.ee> wrote:
>
> Provides fw_cfg for the virt machine on riscv.  This enables
> using e.g.  ramfb later.
>
> Signed-off-by: Asherah Connor <ashe@kivikakk.ee>
> ---
>
> Changes in v3:
> * Document why fw_cfg is done when it is.
> * Move VIRT_FW_CFG before VIRT_FLASH.
>
> Changes in v2:
> * Add DMA support (needed for writes).
>
>  hw/riscv/Kconfig        |  1 +
>  hw/riscv/virt.c         | 30 ++++++++++++++++++++++++++++++
>  include/hw/riscv/virt.h |  2 ++
>  3 files changed, 33 insertions(+)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

