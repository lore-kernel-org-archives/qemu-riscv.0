Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mzKhK-00027N-8i
	for mharc-qemu-riscv@gnu.org; Mon, 20 Dec 2021 10:35:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mzKgp-00022c-7Y; Mon, 20 Dec 2021 10:35:22 -0500
Received: from [2607:f8b0:4864:20::b32] (port=38456
 helo=mail-yb1-xb32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mzKgn-0005dK-76; Mon, 20 Dec 2021 10:35:02 -0500
Received: by mail-yb1-xb32.google.com with SMTP id v64so29936652ybi.5;
 Mon, 20 Dec 2021 07:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nAeoiPJvlQI2MudQ6Cu1Ik/hFKunVLHmRpMet7ck/pI=;
 b=RWh9aySlWazYyxxu2V+F9pMam6cuMIRQNfxGqiDlMA5ZesBHFUM5cKvx+lX032T5Lt
 YdmRln7+xPlS2Q5EcGU9D0z/a7682qh1JdSQf/P33Q1YvjiVsHc+FUrCRIqshSrP/N7A
 10UorQrDCcLv+BLwT3f5cbXWaVVuuCx2BzvNDyaKUUGZ2M0/KfX4N63qzcDqhYx8GWbu
 yhpIvvTaZJIXXlKwB0NKVHFUi1KTxzGgzY8TdDr+gbjH0Cl2M6Rqpcy7fGjMirm2XJ00
 FUvjjMKx6lmVZwqB3Bhgw5PYnrIwH7rpPrLZCl5Fr5r8GC8ywi0qpWd0r/WT6hEueMsP
 /+Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nAeoiPJvlQI2MudQ6Cu1Ik/hFKunVLHmRpMet7ck/pI=;
 b=P8bxA5T6MX52UABFg8/QDDwtbN/gTqeICJGAsy+kuXSls7RfC2kaBFLSjMm7KmO1P/
 GmzRlnEjU52oh26vKUvFTkbd8cF4G6ekxtbUMKfEfVvrjEaxYJ5D70qNSIhN1AvlJ+p4
 dAx5U5I5ogRoBbyLmS/6I+sFfA8O1yXm0M/Un9qwM1kn22/2h37oaS7c5Zkg62Acnt9/
 aUPfs0rJpb3/VDvof7SHvwKsdgbcTA/1zhhAMMT2PidgeXVJnsYqmsWigmx4heZ/r16T
 R+9I058GzD5EDUZTRew5AIi6rQuMiCpFMLGzcm1vH8lOkEpNA+Yap10i2WMdUj2u3Qhp
 iWJA==
X-Gm-Message-State: AOAM533TyGwUayY8K3kcGUN4E3GFd6Y59RILOdVw8zV0diAEdTROFaRe
 s+qjLoSJ/askmysFom3CLDvhWsZUbNIXM6Z1ZBjs9DhMtLk=
X-Google-Smtp-Source: ABdhPJw2p+E5lGVX0o2u0/d4PRr/ZxFgBvxksNm/+9nKoxmiyhXbJBH676mUapZwqM2sczSBPZoRhPcHJFuB66Cg660=
X-Received: by 2002:a25:b47:: with SMTP id 68mr21781636ybl.378.1639985983201; 
 Sun, 19 Dec 2021 23:39:43 -0800 (PST)
MIME-Version: 1.0
References: <20211216045427.757779-1-alistair.francis@opensource.wdc.com>
 <20211216045427.757779-9-alistair.francis@opensource.wdc.com>
In-Reply-To: <20211216045427.757779-9-alistair.francis@opensource.wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 20 Dec 2021 15:39:32 +0800
Message-ID: <CAEUhbmV3PDFEQqjOVpLVg2w5650QYW+Ss8fcesV8xdkv5K4uQw@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] hw/riscv: virt: Allow support for 32 cores
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, 
 Alistair Francis <alistair23@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b32
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb32.google.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_06_12=1.543,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Mon, 20 Dec 2021 15:35:29 -0000

On Thu, Dec 16, 2021 at 12:55 PM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> Linux supports up to 32 cores for both 32-bit and 64-bit RISC-V, so
> let's set that as the maximum for the virt board.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/435
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  include/hw/riscv/virt.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

