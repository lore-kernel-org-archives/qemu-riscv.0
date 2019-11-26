Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iZahH-0006dl-5j
	for mharc-qemu-riscv@gnu.org; Tue, 26 Nov 2019 08:16:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37280)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iZahC-0006af-NF
 for qemu-riscv@nongnu.org; Tue, 26 Nov 2019 08:16:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iZahA-0004qe-BC
 for qemu-riscv@nongnu.org; Tue, 26 Nov 2019 08:15:58 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:37264)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iZah6-0004lN-QZ
 for qemu-riscv@nongnu.org; Tue, 26 Nov 2019 08:15:54 -0500
Received: by mail-oi1-x244.google.com with SMTP id 128so8514306oih.4
 for <qemu-riscv@nongnu.org>; Tue, 26 Nov 2019 05:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IfL3XGbQuAfxS2cezRmM4LbUmbLFpg8qrPknCE+eYeU=;
 b=iGW46ShQUkE4zeKW6aewJfebLMkOnC5yPBegQ36tbeSxSmvDux3I4LAunGSAfmdNtm
 ZYPs1NT6q6BiCnDzmNOzypXlXMJbFru9Gc4iqfU2Hn+wKJJgt6/Vr1syJtJ7Iyt2fxsZ
 UhTQC6wKFlbmBgRNcv0Sq/bja62ERjnCLQ6xDtVukI2sXEjWPj9r82LHRO4amI96oWap
 nKrau0ODphfmmSOrAwX0bVUQkwz8rqOcdJjCBKWO1DR/De/UN2c+ZCJJ7JO+tUhCB4jw
 usrcPM/UW7rPQhGlOf+HoWKbx8PtgCVekLeNGjXJ/W3q4KlfKXjWbRBPrhDBjavNa7uQ
 j27Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IfL3XGbQuAfxS2cezRmM4LbUmbLFpg8qrPknCE+eYeU=;
 b=BUmbUZJY7YD+yjT/piuPM6R0FIyc/oCqWni8/PmBxi4SwseVKyzuKsfQ9ozDPnxPaU
 4YXXnbqku+BuEiTI5oqj9F1wo/ORXhN4PRio/kTfswBbqPkRc9VDB4RKiltmOq8VgfMq
 wLAbw/8YAV9LBLwI+KbKScAaWmcFwr29oDsxANPnZWd/pqje1C856+0tEvx4e8pg1yNv
 Ue8JfXucPl8RabTp1+wQhePUsP+karyb3GrgY0omfEV8L6Dhvv2koSsqBk/aSCz8hYAN
 /0FCB39wuR700vgNiMUi7d8XS56EPfCvbwHhWSud9b8ftLD0/g1mBnefHr1gogdorAwv
 my9Q==
X-Gm-Message-State: APjAAAViWhCpqvqHTTCt/F7FTLS5lORWA4hpigmHDwJrHHB9CiifwQO7
 LWghpWODteaKrlta83jaD4E7MMdR5+567HXOZP8xUQ==
X-Google-Smtp-Source: APXvYqzlDyvlltSvSUpg1/LRWk/ehLl7uEq33VNEoyWT8QbR2m35JeM77UzTJijmCr5H1JURqzsfIotO4aTQjmiQzu4=
X-Received: by 2002:aca:cf12:: with SMTP id f18mr3399560oig.48.1574774150488; 
 Tue, 26 Nov 2019 05:15:50 -0800 (PST)
MIME-Version: 1.0
References: <20191125205854.226672-1-palmerdabbelt@google.com>
In-Reply-To: <20191125205854.226672-1-palmerdabbelt@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 26 Nov 2019 13:15:39 +0000
Message-ID: <CAFEAcA8+DYpZCcVNegwji2FYUsNOi=2j0GGK8jpCiSps9y=BTg@mail.gmail.com>
Subject: Re: [PULL] RISC-V Patches for 4.2-rc3
To: Palmer Dabbelt <palmerdabbelt@google.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
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
X-List-Received-Date: Tue, 26 Nov 2019 13:16:00 -0000

On Mon, 25 Nov 2019 at 20:59, Palmer Dabbelt <palmerdabbelt@google.com> wrote:
>
> The following changes since commit 65e05c82bdc6d348155e301c9d87dba7a08a5701:
>
>   Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into staging (2019-11-25 15:47:44 +0000)
>
> are available in the Git repository at:
>
>   git@github.com:palmer-dabbelt/qemu.git tags/riscv-for-master-4.2-rc3
>
> for you to fetch changes up to 6478dd745dca49d63250500cd1aeca1c41cd6f89:
>
>   hw/riscv: Add optional symbol callback ptr to riscv_load_kernel() (2019-11-25 12:34:52 -0800)
>
> ----------------------------------------------------------------
> RISC-V Patches for 4.2-rc3
>
> This tag contains two patches that I'd like to target for 4.2-rc3:
>
> * A fix to the DT entry for the SiFive test finisher.
> * A fix to the spike board's HTIF interface.
>
> This passes "make check" and boots OE for me.
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.2
for any user-visible changes.

-- PMM

