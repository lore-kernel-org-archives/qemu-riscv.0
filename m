Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gmc8R-0003Kn-MJ
	for mharc-qemu-riscv@gnu.org; Thu, 24 Jan 2019 05:21:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35295)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gmc8L-000320-OG
	for qemu-riscv@nongnu.org; Thu, 24 Jan 2019 05:21:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gmbuE-0006H5-Hw
	for qemu-riscv@nongnu.org; Thu, 24 Jan 2019 05:06:43 -0500
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d]:43962)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gmbuE-0006Ge-D0
	for qemu-riscv@nongnu.org; Thu, 24 Jan 2019 05:06:42 -0500
Received: by mail-ot1-x32d.google.com with SMTP id a11so4704500otr.10
	for <qemu-riscv@nongnu.org>; Thu, 24 Jan 2019 02:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=AUNl0LehqCWTaSTdpfVs6XA1m3U3K63koMsyXud3aPA=;
	b=ddO21vz/HkvzSRPXQKjDi/qZg0C2PqDO7pRm13yYvBC0wivufIF0GES/bF036eZwhk
	9iToZ9Et+lkjRuPTWYckJ4QP17ZDy6tx9WVAXnIUdwyV8dYwE6Zu0WHbo/DrHyX1qnK/
	ReMaBSE3+oWNkJYKtPn7wncibd116uewzo2LI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=AUNl0LehqCWTaSTdpfVs6XA1m3U3K63koMsyXud3aPA=;
	b=Q8pEsKcGfZBDaAivwmwWcdOIQetIp9v3qSgbSu4k3BDr2TZkBsi2jZ9lwmJR6tFmmK
	S3z1sUlT598JuI1xGxW6qBpDtlTlSJAoV8g+IEvTqhYc6R0B2m5o8mQMz4yYFyPHfgIA
	WGGOGaNUpn7D8xuM/xAUCP5OT9hL0Q4gCMTxOLWVK0MRq05EuM3yBqYxeXTsPrVIhv/F
	36gQWNLsEIIyf7Rje++HXiOc2DF9aOvP65tdCp6UOBL+Bac1hlwXNey2HMXQAVt2WGHj
	ikwpDzMe7yDwqCgD6q0KC8o1o2JIVJbliJAELU1xOfWGntYnd0AUrkews7eB57IsYjVc
	p4Lg==
X-Gm-Message-State: AJcUukc10fmOxtgH9Ik67CoTKRYbk7vmHvy6Vj+QnyDYwSXXTXqQnsmu
	Y+AkX0I3pNMbvcuD2MnZ4JzrAYiNlKmxWtSiVjCiDg==
X-Google-Smtp-Source: ALg8bN4ieyoYmLtxvGk78Cy97nR2F4zRJBwH3fLOjSnFq0/D28k+fKuAtctDRp6Ia9NojnG9V1QvOs+EU7PUCVF/x9M=
X-Received: by 2002:a9d:7855:: with SMTP id c21mr3667550otm.363.1548324401464; 
	Thu, 24 Jan 2019 02:06:41 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA-yeQSbbhKXXJ0f961MJKC-v46DWgoaXcQUt64DZcdzqQ@mail.gmail.com>
	<mhng-2bd91def-4148-4180-bdbe-0be851d575e5@palmer-si-x1c4>
In-Reply-To: <mhng-2bd91def-4148-4180-bdbe-0be851d575e5@palmer-si-x1c4>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 Jan 2019 10:06:30 +0000
Message-ID: <CAFEAcA8gH03WG_W-tp=ZC5HOoWRkpEDN_rdFm9Y6edxx-HztoQ@mail.gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: qemu-riscv@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::32d
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
X-List-Received-Date: Thu, 24 Jan 2019 10:21:18 -0000

On Thu, 24 Jan 2019 at 02:53, Palmer Dabbelt <palmer@sifive.com> wrote:
>
> On Mon, 14 Jan 2019 04:40:06 PST (-0800), Peter Maydell wrote:
> > Please update the changelog at https://wiki.qemu.org/ChangeLog/4.0
> > for any user-visible changes.
>
> Thanks for the reminder :).  I have an account now so the update should be in
> there, I'll try to remember to include it along with the PR next time.

Reminder is what that text is for :-)  It's entirely part of my
canned reply to pull requests, so you'll see it whether there's
anything in your PR email about having updated the changelog or not...

thanks
-- PMM

