Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lfyRB-0006v1-F1
	for mharc-qemu-riscv@gnu.org; Mon, 10 May 2021 01:26:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lfyRA-0006uo-Jg; Mon, 10 May 2021 01:26:36 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:43774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lfyR8-0001Pl-Q2; Mon, 10 May 2021 01:26:36 -0400
Received: by mail-yb1-xb35.google.com with SMTP id e190so20027734ybb.10;
 Sun, 09 May 2021 22:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7ZqvoEnTOqt0swW0DlaOQeRnStnBoCwK/jwamwKc1o8=;
 b=QayvpaCeJX9ZMqz47lTWD2CYaD6VddnUwCVCeHAi565Tqy2e3JPaF8vKbewL6L9mGt
 dZ7VdVi5IEXR9yf+Tq6OA0/5DH2sYmWoyxPKMtrAdGwJO0mVenO6sxMc/cbRhjsl5ahw
 tawyYNGQ0Xqez7j5TeNp3A7TLRY8hsRUwb06ZFXtZx1+/FqnQ5yMAxTa3UDOfiSgHuLk
 qMMSwk8H/3TPJtmZ1n9uaMQIuMge6XSIpM6kwmSNPT1KNVkVUBD9YhJmL40Cd5Vzcssi
 zDmhBr7zbdWEgh2Ai/G/9p3wUNarlA6cKpCPc+FhT3B/1eQf2OTk6r5DiLz9SsF7Ww0X
 0KNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7ZqvoEnTOqt0swW0DlaOQeRnStnBoCwK/jwamwKc1o8=;
 b=aqB8EHZLnkhwKBg+N3VoEJhr0h2q4xr5JCOB0OUu+WzpMmMacT7qrCaVEJUno6nQDD
 k1HZCWt02Z636LXkftiTaeIieFDOtfIPF/db1kj/zh7M5Y1AYQVKbfI4P9OY3wni5PCc
 83Qpwwrjny5BLvprmrt54nSPybaMpNnAvQhSXCwVp8OTjlTybmEaE/p73S392bXy2FwE
 54ssbG7YFlL9GVzJs2K1vn/PPK3YwCJJsAZRzztGJt1GE00Elldj4Mtdk4Bd9xQLaLrE
 NNLZPGMFgwOArmfqzS9yp/Pq5Tse72+2R7DiBPolFhbe8m9uvYamfQQIiKdDxNy1f8nY
 C16A==
X-Gm-Message-State: AOAM530/W0obaDVKafQPMY06XenSBGn9i9hirke64ThlpSdrvN55fsjU
 7uZc/f/UgBD6j05padVvhGdI6EB3zvGmXaBs8to=
X-Google-Smtp-Source: ABdhPJwLfG1wdcaFEBV5+DCw2L17WTecvRfbGOVS7Nn/ICvnbvZoEAbtxqTondyRxqqe9fnDLXZq9bnocggFcD/PIFg=
X-Received: by 2002:a25:5146:: with SMTP id f67mr29754092ybb.332.1620624393118; 
 Sun, 09 May 2021 22:26:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210507081654.11056-1-wangjunqiang@iscas.ac.cn>
 <20210507081654.11056-3-wangjunqiang@iscas.ac.cn>
 <CAKmqyKPVYuESf0TQM8M-KE-72PftMeNCfmQLdEj4Siy9TZxuBA@mail.gmail.com>
 <CAEUhbmVL6wRtxk4M+SCSbrQbY02vtzoYuuesAYuBP-tJvBz9VA@mail.gmail.com>
In-Reply-To: <CAEUhbmVL6wRtxk4M+SCSbrQbY02vtzoYuuesAYuBP-tJvBz9VA@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 10 May 2021 13:26:21 +0800
Message-ID: <CAEUhbmU-XGYF7iVqmYFnzWF9m=rnrqHzLnStq2pLoLkTKj=cXA@mail.gmail.com>
Subject: Re: [RFC PATCH 2/5] hw/intc: Add Nuclei ECLIC device
To: Alistair Francis <alistair23@gmail.com>
Cc: wangjunqiang <wangjunqiang@iscas.ac.cn>, liweiwei@iscas.ac.cn, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Bin Meng <bin.meng@windriver.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, alapha23@gmail.com, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb35.google.com
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
X-List-Received-Date: Mon, 10 May 2021 05:26:36 -0000

On Mon, May 10, 2021 at 10:27 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Mon, May 10, 2021 at 10:21 AM Alistair Francis <alistair23@gmail.com> wrote:
> >
> > On Fri, May 7, 2021 at 11:24 PM wangjunqiang <wangjunqiang@iscas.ac.cn> wrote:
> > >
> > > This patch provides an implementation of Nuclei ECLIC Device.
> > > Nuclei processor core have been equipped with an Enhanced Core Local
> > > Interrupt Controller (ECLIC), which is optimized based on the RISC-V
> > > standard CLIC, to manage all interrupt sources.
> > >
> > > https://doc.nucleisys.com/nuclei_spec/isa/eclic.html
> >
> > Hello,
> >
> > There are patches on the QEMU list adding support for the CLIC. How
> > different is the ECLIC from the CLIC? Could you use the CLIC as a
> > starting point instead of implementing a new interrupt controller?
> >
>
> That's my thought too when I saw this patch at first.
>
> A better way is to scandalize the CLIC support in QEMU first, then we

Sorry for the typo. I meant to say: standardize the CLIC support

> will see how Nuclei's eCLIC could be built on top of that. Thanks!

Regards,
Bin

