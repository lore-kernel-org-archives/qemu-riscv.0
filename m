Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j96HK-0002Jd-Dn
	for mharc-qemu-riscv@gnu.org; Tue, 03 Mar 2020 07:04:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43126)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j96HH-0002IY-Th
 for qemu-riscv@nongnu.org; Tue, 03 Mar 2020 07:04:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j96HG-0000iC-P0
 for qemu-riscv@nongnu.org; Tue, 03 Mar 2020 07:03:59 -0500
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:34432)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j96HG-0000gD-J4
 for qemu-riscv@nongnu.org; Tue, 03 Mar 2020 07:03:58 -0500
Received: by mail-ot1-x32e.google.com with SMTP id j16so2741326otl.1
 for <qemu-riscv@nongnu.org>; Tue, 03 Mar 2020 04:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hI8VYRVvJjS6RCyTR07Kv04tLyKyaz6W7Y7xBI99xXA=;
 b=DR+xSv5Dh6nr99V0tcn0ogB3E33X6FnKjmq2VtyPgrVGbVVDe8VPgMsrIQss7eIZ0h
 i6VnqwCswEXeyqMRQel0y7+Jwngr9DYNatLHWRIlqiCjhKdTx8JHacDUeL338DyEvUS6
 K9FApMkLfQ5Fhj9fg4bvm6eLOc+UubnmN7lSxiwaZXFOEJeWEiy+zhFz8ujXHaB/nqsp
 wk03OrHQRjvTv3188WexTy6z0rKiG3UK3vpwhMJ3NRuszkm0WCFQpeHsjb0rObpBQo2c
 iicJmpT1x9GdvjGsjK5BYETyiNA6CHJbqipKB8mSXmssPcybLcn9kxVGXHAQ6oJdivvR
 pGQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hI8VYRVvJjS6RCyTR07Kv04tLyKyaz6W7Y7xBI99xXA=;
 b=QDSYsg07n2C2KxAdeAC8zdlMW9QYX9t4zC8BrufYCwube7NfQIE9cLdHSmBLTisUxe
 I9+Gia5aXNOPtqA6vt9tYG7ByHKXcxdsi6KN9uVH4q3SaktHFX0O0dLS9DYEzxdqrzhd
 7TughWFMFKDDzEXs1oxhHNcH0bvMnbh5r9Sp0CrYBGmXONFNLtMxfybQZV4PdwHW+Wud
 jl2zWCaix1bdS1AzAaSUOIttqos5xs+Lt2F+85zOD5VMG3lV/oyjCMD+hsPFOyt+DA3I
 0sNkQ3hIdR0IGBIcGIvqmwdFDCRK9NWsWfN7cNGgjh0S3f21rnfnvxGkJnd1SXiR63wO
 lerA==
X-Gm-Message-State: ANhLgQ3DPW6Xxy/gjccN408iYXBNXI+8v4h2wTMv/h6GH7XhtXiH/uUG
 GcRtvDiTF6Szknape/mEWEBpDpM5Ktu7EmBCyst48A==
X-Google-Smtp-Source: ADFU+vuONQ4q6faTVNgMXOkUZrfFdtUKgxl+vUP1sCGIK/7hrsdL/5ZDtkSkni8CH/PLDDxooW38OJGXeUME4/OCgtc=
X-Received: by 2002:a05:6830:1406:: with SMTP id
 v6mr3141652otp.232.1583237037383; 
 Tue, 03 Mar 2020 04:03:57 -0800 (PST)
MIME-Version: 1.0
References: <20200303004848.136788-1-palmerdabbelt@google.com>
In-Reply-To: <20200303004848.136788-1-palmerdabbelt@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Mar 2020 12:03:46 +0000
Message-ID: <CAFEAcA-TrzErHFjHiSYmXZVG4=8d5u8vDjX-YtzAdwd0XHBSUA@mail.gmail.com>
Subject: Re: [PULL] RISC-V Patches for the 5.0 Soft Freeze, Part 3
To: Palmer Dabbelt <palmerdabbelt@google.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::32e
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
X-List-Received-Date: Tue, 03 Mar 2020 12:04:01 -0000

On Tue, 3 Mar 2020 at 00:48, Palmer Dabbelt <palmerdabbelt@google.com> wrote:
>
> The following changes since commit 8b6b68e05b43f976714ca1d2afe01a64e1d82cba:
>
>   Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into staging (2020-02-27 19:15:15 +0000)
>
> are available in the Git repository at:
>
>   git@github.com:palmer-dabbelt/qemu.git tags/riscv-for-master-5.0-sf3
>
> for you to fetch changes up to 5f3616ccceb5d5c49f99838c78498e581fb42fc5:
>
>   hw/riscv: Provide rdtime callback for TCG in CLINT emulation (2020-02-27 13:46:37 -0800)
>
> ----------------------------------------------------------------
> RISC-V Patches for the 5.0 Soft Freeze, Part 3
>
> This pull request is almost entirely an implementation of the draft hypervisor
> extension.  This extension is still in draft and is expected to have
> incompatible changes before being frozen, but we've had good luck managing
> other RISC-V draft extensions in QEMU so far.
>
> Additionally, there's a fix to PCI addressing and some improvements to the
> M-mode timer.
>
> This boots linux and passes make check for me.


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.0
for any user-visible changes.

-- PMM

