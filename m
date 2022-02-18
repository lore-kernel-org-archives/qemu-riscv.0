Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nKzDk-0003Xc-Co
	for mharc-qemu-riscv@gnu.org; Fri, 18 Feb 2022 04:06:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nKzDR-0003Ow-Cb; Fri, 18 Feb 2022 04:06:19 -0500
Received: from [2607:f8b0:4864:20::b2e] (port=36713
 helo=mail-yb1-xb2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nKzDP-0007HO-Bt; Fri, 18 Feb 2022 04:06:13 -0500
Received: by mail-yb1-xb2e.google.com with SMTP id c6so18286535ybk.3;
 Fri, 18 Feb 2022 01:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7yqADWLITChKeQvhae6rHVad340K+75syNZKMujfa+M=;
 b=e8Mx3jrqRoIYnt22myGAZVBQJUgRInNRSWJ+oI6j0VzJG389Fqk30krMKWqmrTs7Xr
 2NcRSDoglZhGSxrfAvUUPUxr0TVWBXgRpA7pCof/Oz5X1n+hvHjAIvw/T7E0d7YaX7bj
 FgHvFvsiyyRyA1+dO5moIY4kuBurOMem8frmN+bnMtHzWx/56/vpRpC3sY4cgt30UCSK
 d/e9pUXUDsRzJJEpPK+VlFXBDes8O8hYEtOyqSadiHC7tN2XH/DAUYnogiPDQIMi7PeU
 bG+arBt59GidHy93js/tX4aTwch+i3IESFxyuXMZQ99964vi5EPVkOAHWXbRA9Gs0PUM
 p36A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7yqADWLITChKeQvhae6rHVad340K+75syNZKMujfa+M=;
 b=0uprK0x10qktzo37JQJBbx9MDNVFDw/JTYt/PN7rMcf8arHzw5xxHwqRoTpk8dc6Rh
 ZNpbGrX6Yqq5lKZbKZacDINQsF69lIwzVsOUeVkLoLWkZVK10h1ILFE2DHpcCzmECq6W
 mI7zv9XM1LxHLjY4GOlNoiBI44X/uw9Jglf41ntmz2ZA98UXrj4Ww5prXx7q+zOFrxdU
 Bk0EVaerU8EREzWLEljLJ/L97jszRIvupJ1TUoHkZm54h5CWKnNE3HPzrMU4D57acz6W
 1GrTrPG15T1kyeR3paFLFYKeZuXPzcb1uW8Xb7Bs8qmtOJPptZT8Yvl8eqoq2ENoN82t
 V7OA==
X-Gm-Message-State: AOAM532FLKyNPjtvQNUQGleMa5r7Xzv6tSHv1iXGexpRYBOmtfrvM2os
 xH24E8BcGckwrFwogL0hxZxd/0BihuTg8gVZDHZi0R9W3Zk=
X-Google-Smtp-Source: ABdhPJwj5eV6Sm4FBIrKk02hQEfG/B6ElAiJJbu+FEvtS9B+XoiCIUoeRSbykBLJ8LXg2K3kVDFc1xR91IvpnFieY3Y=
X-Received: by 2002:a81:c607:0:b0:2cb:a34a:355c with SMTP id
 l7-20020a81c607000000b002cba34a355cmr6563739ywi.487.1645174697655; Fri, 18
 Feb 2022 00:58:17 -0800 (PST)
MIME-Version: 1.0
References: <20220218063839.405082-1-alistair.francis@opensource.wdc.com>
In-Reply-To: <20220218063839.405082-1-alistair.francis@opensource.wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 18 Feb 2022 16:58:06 +0800
Message-ID: <CAEUhbmUO1dvFdFU-FLKqz30ittheAsviBc+1i1kK5u+12sEHPA@mail.gmail.com>
Subject: Re: [PATCH v2] hw: riscv: opentitan: fixup SPI addresses
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Alistair Francis <alistair23@gmail.com>, wilfred.mallawa@wdc.com
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 18 Feb 2022 09:06:30 -0000

On Fri, Feb 18, 2022 at 2:38 PM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
>
> This patch updates the SPI_DEVICE, SPI_HOST0, SPI_HOST1
> base addresses. Also adds these as unimplemented devices.
>
> The address references can be found [1].
>
> [1] https://github.com/lowRISC/opentitan/blob/6c317992fbd646818b34f2a2dbf44bc850e461e4/hw/top_earlgrey/sw/autogen/top_earlgrey_memory.h#L107
>
> Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
> v2: arranged base addrs in sorted order
>
>  hw/riscv/opentitan.c         | 12 +++++++++---
>  include/hw/riscv/opentitan.h |  4 +++-
>  2 files changed, 12 insertions(+), 4 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

