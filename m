Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lfveI-0002NG-Oz
	for mharc-qemu-riscv@gnu.org; Sun, 09 May 2021 22:27:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lfveH-0002N2-Ii; Sun, 09 May 2021 22:27:57 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:36810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lfveF-00048V-3e; Sun, 09 May 2021 22:27:57 -0400
Received: by mail-yb1-xb36.google.com with SMTP id m9so19676919ybm.3;
 Sun, 09 May 2021 19:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V6NMhCOqGFTTaFBN//3NuHDSBwvJU3mPF68NM5Cvwu8=;
 b=DGLrCGNcz3c0sDHQ7md8R4lHTwAszK3088xECFn/stNBC1ero7ffr529V5ri1ZIfPe
 mhv6IrHuYmO0z5V3Y0/JRSlK1I1ynloGiztDwuxB6G8d7RujQrOM4CaZpxRhAW8/pOk0
 hZwTN3Gk/RTHFxQ/XEIeSVP1SSDwTD4uqpK3iyWa/SLwIvHzNprKfjyAXCGj1KUExllT
 Lt8mDxpeyzPQcOcAA/PKFnCWVhoS0vBdIre01DhSd28ETnsNHKkzf5DqkFJFwKTaWL7h
 5Qh9GvzvXecWlVAdKPd8zhkApFkO/mzQL98r87SmSrEK8nHDA+mNdrQRwtGsAaPlxDPh
 KJXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V6NMhCOqGFTTaFBN//3NuHDSBwvJU3mPF68NM5Cvwu8=;
 b=QA8tZ1GBg+knT5LM/DK5U35UwugUWRuNjmc3A6U5Qwk7KaEs61PF4ZWEAeaifK7kiX
 UxVfZSdsotFpD/pBQgCOERdyzkjii/Xv/UzB83qozLqVZ9jXE0XwaYTIAIpmw6lPs9xD
 tBuP9kwv7JKEbTmZhCYMzvyibRtnynk0ZPHi4chJyxso0DQFL06dZ9RioQ/c32hPkqpa
 XqRYxeMoaIFpwSYeLSDCUXrKMpzyktlI//+clhFfCZsVZYdJB5ggQfWb/IzrDEqmR8oI
 onOgsEkXPhbKenerJH6XrWbhKOTaaDVv+hHHaQQ7eTBXy96HZdTtflWuAAiADH8H5C0M
 EegA==
X-Gm-Message-State: AOAM532LIPlo/OqKLZx8geEvZ4KhT6arhT53pU5DoJWgR8MXR5vFuFBG
 4wk5pk03xl5B+cQmK820Eh23XBI8zxxdz64A+n4=
X-Google-Smtp-Source: ABdhPJz/milCAU3Z29qIPugTyMqmDx60LuM7MyQ0OuoCK5BDr57VyLH5tUTl9Xp1uPzwwWs+TRu7u2VfWBFaV882G6I=
X-Received: by 2002:a25:99c1:: with SMTP id q1mr29202118ybo.517.1620613673320; 
 Sun, 09 May 2021 19:27:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210507081654.11056-1-wangjunqiang@iscas.ac.cn>
 <20210507081654.11056-3-wangjunqiang@iscas.ac.cn>
 <CAKmqyKPVYuESf0TQM8M-KE-72PftMeNCfmQLdEj4Siy9TZxuBA@mail.gmail.com>
In-Reply-To: <CAKmqyKPVYuESf0TQM8M-KE-72PftMeNCfmQLdEj4Siy9TZxuBA@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 10 May 2021 10:27:42 +0800
Message-ID: <CAEUhbmVL6wRtxk4M+SCSbrQbY02vtzoYuuesAYuBP-tJvBz9VA@mail.gmail.com>
Subject: Re: [RFC PATCH 2/5] hw/intc: Add Nuclei ECLIC device
To: Alistair Francis <alistair23@gmail.com>
Cc: wangjunqiang <wangjunqiang@iscas.ac.cn>, liweiwei@iscas.ac.cn, 
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Bin Meng <bin.meng@windriver.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, alapha23@gmail.com, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb36.google.com
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
X-List-Received-Date: Mon, 10 May 2021 02:27:57 -0000

On Mon, May 10, 2021 at 10:21 AM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Fri, May 7, 2021 at 11:24 PM wangjunqiang <wangjunqiang@iscas.ac.cn> wrote:
> >
> > This patch provides an implementation of Nuclei ECLIC Device.
> > Nuclei processor core have been equipped with an Enhanced Core Local
> > Interrupt Controller (ECLIC), which is optimized based on the RISC-V
> > standard CLIC, to manage all interrupt sources.
> >
> > https://doc.nucleisys.com/nuclei_spec/isa/eclic.html
>
> Hello,
>
> There are patches on the QEMU list adding support for the CLIC. How
> different is the ECLIC from the CLIC? Could you use the CLIC as a
> starting point instead of implementing a new interrupt controller?
>

That's my thought too when I saw this patch at first.

A better way is to scandalize the CLIC support in QEMU first, then we
will see how Nuclei's eCLIC could be built on top of that. Thanks!

Regards,
Bin

