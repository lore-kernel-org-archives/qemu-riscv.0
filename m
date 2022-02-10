Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nHyGE-0003XY-Nl
	for mharc-qemu-riscv@gnu.org; Wed, 09 Feb 2022 20:28:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nHyGA-0003VK-Py; Wed, 09 Feb 2022 20:28:35 -0500
Received: from [2607:f8b0:4864:20::d34] (port=42645
 helo=mail-io1-xd34.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nHyG8-0000Jv-En; Wed, 09 Feb 2022 20:28:34 -0500
Received: by mail-io1-xd34.google.com with SMTP id r144so5499063iod.9;
 Wed, 09 Feb 2022 17:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z94e35i69YLvuwrL3zllw6Mvm/NCQ6vX/1zTOfafJAg=;
 b=Ix8NxkAYUkoSm6QyMWMqduH+u6OU5A0kO/Lnq4fBWB7hZAQJMa/m4jYrCMcAyDhQAD
 DBzdWNxU6VwyJ92Ww5soSbTnt3TDU5U6tA+66gkqct5z5F/O+6jsRNX2rnd+iVFImZ1D
 137x08E0DlavMzLCJrwnesB0zo8dnstSmLnvuE30HDXDV+hL7cs2/KFDnB5rUnlkLCd6
 F4sUThXAa29QSIBi2uhAOgc5+BvqePm/weEE2OWRCVEQwqJPk8ABl0I0Tn46k2/Ozmp9
 HiOkxzwHl5OOzAO/0iIUNtbA+4gM5mBax270qD31HHV4L/3gxq+5HIO1rutbx8ztfRaj
 mJPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z94e35i69YLvuwrL3zllw6Mvm/NCQ6vX/1zTOfafJAg=;
 b=aQtexqCTD9IgD1KXPRUAJAdKuW8EXLKNtT1BWLUH/EbH5JuRb1L2ekRs/T73wuGz8o
 C7fpfY05EerfUMCbz0H4m3c+wWBA6OOoTm3BlSEq02L5+LcH7T2FXqzQAs1nswyVGCfP
 108+B1lefTt09bA+KtLQaWsIQRdQqkHN/CbWJUzLTtbw9OvtjU0sWgaYXWQf/aJDpwWp
 YErQgDU31FEJD96Lef8J6HQAZqeRZ2dryuUTUgA0e+PslMdU6WsQfn38mIBYFmkvSJDI
 pfSr4v1TZiUlImPLCE/4hzq+pAYVBf+vQsYnv9OI6ZWrTP4Sc79rZfYU1xI3g4tM75Qx
 oMKQ==
X-Gm-Message-State: AOAM531UnosT21JlJU5xIwcbZ1NJr4JGqyDky5x3w1z73506nDurDyiv
 VBpWWsEkAaztYJn/y8jOsrpZYFU/9V0szjBIgMU=
X-Google-Smtp-Source: ABdhPJw+j4vOpWXSVSDDuneN+YvzRLPvEOd/8Q35AMkf2p35PNvHxONvT+eqvPu0mu8scvMUNzwI6rzV6vMOmZV+l94=
X-Received: by 2002:a05:6638:2609:: with SMTP id
 m9mr1221447jat.169.1644456510310; 
 Wed, 09 Feb 2022 17:28:30 -0800 (PST)
MIME-Version: 1.0
References: <9040401e-8f87-ef4a-d840-6703f08d068c@bytedance.com>
In-Reply-To: <9040401e-8f87-ef4a-d840-6703f08d068c@bytedance.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 10 Feb 2022 11:28:04 +1000
Message-ID: <CAKmqyKONLubCHR_t+Zv1j6ycrEiyDtF2BYdn9eADnyUDcnG7pw@mail.gmail.com>
Subject: Re: [PATCH] docs/system: riscv: Update description of CPU
To: Yu Li <liyu.yukiteru@bytedance.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d34
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d34;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd34.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 10 Feb 2022 01:28:36 -0000

On Wed, Feb 9, 2022 at 1:49 AM Yu Li <liyu.yukiteru@bytedance.com> wrote:
>
> Since the hypervisor extension been non experimental and enabled for
> default CPU, the previous command is no longer available and the
> option `x-h=true` or `h=true` is also no longer required.
>
> Signed-off-by: Yu Li <liyu.yukiteru@bytedance.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>   docs/system/riscv/virt.rst | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/docs/system/riscv/virt.rst b/docs/system/riscv/virt.rst
> index fa016584bf..08ce3c4177 100644
> --- a/docs/system/riscv/virt.rst
> +++ b/docs/system/riscv/virt.rst
> @@ -23,9 +23,9 @@ The ``virt`` machine supports the following devices:
>   * 1 generic PCIe host bridge
>   * The fw_cfg device that allows a guest to obtain data from QEMU
>
> -Note that the default CPU is a generic RV32GC/RV64GC. Optional extensions
> -can be enabled via command line parameters, e.g.: ``-cpu rv64,x-h=true``
> -enables the hypervisor extension for RV64.
> +The hypervisor extension has been enabled for the default CPU, so virtual
> +machines with hypervisor extension can simply be used without explicitly
> +declaring.
>
>   Hardware configuration information
>   ----------------------------------
> --
> 2.20.1
>

