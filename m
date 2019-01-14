Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gj1Xr-0001Mk-C9
	for mharc-qemu-riscv@gnu.org; Mon, 14 Jan 2019 07:40:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57303)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gj1Xo-0001LD-Si
	for qemu-riscv@nongnu.org; Mon, 14 Jan 2019 07:40:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gj1Xk-0002G5-K5
	for qemu-riscv@nongnu.org; Mon, 14 Jan 2019 07:40:42 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:42097)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gj1Xk-00029P-BV
	for qemu-riscv@nongnu.org; Mon, 14 Jan 2019 07:40:40 -0500
Received: by mail-ot1-x343.google.com with SMTP id v23so19114250otk.9
	for <qemu-riscv@nongnu.org>; Mon, 14 Jan 2019 04:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=lvQOJRAnC3UgNr4XtN4KqY5h2D9qWzrkqBBzgyLiWoE=;
	b=H4NB8PUcJddsYxJKk1iTVnO1oN1MfPl/m6JJimoZBiZAqITsIg4yZpcrevbs6YkwHK
	k2u5lO7JEsoJ7REcDmRJ/taUFdbEVWLYvmzT/0hKDHJy9F449sKjBZC8WZ65VUGGyT6J
	C4G7k2v1gT2G1jq5zEGHQrIaQ9L8R/ixCHpGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=lvQOJRAnC3UgNr4XtN4KqY5h2D9qWzrkqBBzgyLiWoE=;
	b=YwKz1v83czEEuV3Vm9FJ9ZwNjv6fCVJZ7dsPzNWQI+jzoWLGOmidfk9Tc+kcKKx11J
	fSzN8Pz4jCiaf0K8TvsKR2aTdXXYddufVWHP1IeDap5CJTByM0oQ7P7TktFvV6lR+HoW
	nqlQvTsqd88Pb2XHhW/wPtxkQ23NP0/PYucPYCX1L4hGaUO9ubcssbWMqYbxg9bo5eyO
	mTSsBJMUxJgWlKxZIt4Hkn+0PX33rqkLLMv/rqZxLfq/rVEalgGuzBl2j3FJpGUCt2Zp
	0VbXGmX/+nZBn5qr5hRFdx21CbxgPM0bDMlXAxmv8pnMBe3jqH9i85UbAJ/aQ7pkixTk
	gMgA==
X-Gm-Message-State: AJcUuke67buaEOT6+L3C/RhgIrdqjmgiuNnPzBslQqcRfjn/yvDU5PwG
	ZfoIPjbhtCRvreuruQhemgN26NA05baLz/78XehB3w==
X-Google-Smtp-Source: ALg8bN4xRaHWedeDuVgapJSO1ukyOS3Sba8tYZOFArRE8ZvnUoKIUtI2W1EkyxlUjO74QiS+ZA3e1nSxyL4fJkWwRzI=
X-Received: by 2002:a9d:3a22:: with SMTP id j31mr16988347otc.238.1547469618053;
	Mon, 14 Jan 2019 04:40:18 -0800 (PST)
MIME-Version: 1.0
References: <20190111180630.6433-1-palmer@sifive.com>
In-Reply-To: <20190111180630.6433-1-palmer@sifive.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Jan 2019 12:40:06 +0000
Message-ID: <CAFEAcA-yeQSbbhKXXJ0f961MJKC-v46DWgoaXcQUt64DZcdzqQ@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: qemu-riscv@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-riscv] [PULL] RISC-V Updates for 3.2, Part 2
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 14 Jan 2019 12:40:45 -0000

On Fri, 11 Jan 2019 at 18:06, Palmer Dabbelt <palmer@sifive.com> wrote:
>
> The following changes since commit 147923b1a901a0370f83a0f4c58ec1baffef22f0:
>
>   Merge remote-tracking branch 'remotes/kraxel/tags/usb-20190108-pull-request' into staging (2019-01-08 16:07:32 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/palmer-dabbelt/qemu.git tags/riscv-for-master-3.2-part2
>
> for you to fetch changes up to f7cdfa38f37e0985457ac03c3238861144a58b4c:
>
>   default-configs: Enable USB support for RISC-V machines (2019-01-09 17:34:10 -0800)
>
> ----------------------------------------------------------------
> RISC-V Updates for 3.2, Part 2
>
> This patch set contains a handful of Michael's CSR-related cleanups,
> which should allow us to proceed with more outstanding bug fixes that
> depend on them.
>
> Additionally, there is a patch that turns on USB.  This works for me
> when the kernel has the appropriate drivers (which will soon be in
> defconfig) and I pass
>
>     -device usb-ehci
>     -drive id=my_usb_disk,file=usbdisk.img,if=none,format=raw
>     -device usb-storage,drive=my_usb_disk
>
> to QEMU.
>

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.0
for any user-visible changes.

-- PMM

