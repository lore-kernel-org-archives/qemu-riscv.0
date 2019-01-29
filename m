Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1goJrQ-0000q9-RK
	for mharc-qemu-riscv@gnu.org; Mon, 28 Jan 2019 22:14:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38884)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jimw@sifive.com>) id 1goJrO-0000aT-R8
	for qemu-riscv@nongnu.org; Mon, 28 Jan 2019 22:14:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jimw@sifive.com>) id 1goJdc-0002Fq-Oc
	for qemu-riscv@nongnu.org; Mon, 28 Jan 2019 22:00:37 -0500
Received: from mail-vs1-xe42.google.com ([2607:f8b0:4864:20::e42]:41080)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jimw@sifive.com>) id 1goJdY-00028H-CY
	for qemu-riscv@nongnu.org; Mon, 28 Jan 2019 22:00:33 -0500
Received: by mail-vs1-xe42.google.com with SMTP id t17so11095085vsc.8
	for <qemu-riscv@nongnu.org>; Mon, 28 Jan 2019 19:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=08aRgFWAZUgrs5Bl/TedjbqraGLBtCEc8/eLZTyNzKE=;
	b=RkdmluDjkKPbhBNUUCl9+NohjMqxyWvts2l8bN31qoKY9n3mBvYSlDZEcaRqpfEXj9
	CNzSbc903ijo5X3wVZYzJMYj1GHdVfEtVNjIovJcXqrrXOvQrIYF802PmLT8OX872LPg
	KkMiVvNrGhauEYMteto58B8mYFUYQCifq7cZI4pYj0aiCEszXTVba7hrq49i6yNPBXEO
	/y+sqWiFI/0myMtXFSvSDUZ/EdqEgegJ/RK9pU43Mie6b7liHbG/qd6BeovJmd6VdDK7
	hL2AkaxR75r/q5t7Q4YVlpgOlT/MNtvhbcrz2+3F0ou9+asr/lOZea1JjM0jaA52YVNV
	liQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=08aRgFWAZUgrs5Bl/TedjbqraGLBtCEc8/eLZTyNzKE=;
	b=VtXo1TTEy0gfpQJz/oH7M3wk68nX9T7DPEkJX3fZDKW+YJrqausghplABt71SRrGD3
	virzaBgX8dKsLv+4Due2r6SdEp6YsT1yE51v17+rkfXbb8863nUCrqPxABfCpunIOAgw
	2fRO6EWn70zjeI+oHXEbLm6OslYIKc2TUP7VRsJLlG6JAMmsBzz8AuYsBKLA3GtYXuCb
	8pjkdV9BSAsu1Y9YneOv9iOyl1InFsf7HwFuFcsdwCkle5DNr/CU2kBFH90hdEt+O2HP
	D2If537Ue1WBmjFM+Va4J8Zb5Gl4T5fx/CGWWU19HFyKyUxoxiccW6rKH7pXNKDqeeRb
	q6aA==
X-Gm-Message-State: AJcUukeH+9iI4O02mWGXToQxKFjzGkbet+Q9gX/ZGR3RLDbiMnXZg009
	26M+newfYeUNcOq+YQ4rXqVU+hWl5QIzUkbMosy9Sg==
X-Google-Smtp-Source: ALg8bN4hbSV4k3wrNXUD4hFxvI90MpmiI6RsgDRKOoLRkzVMBRLFQYOazoACc26AMrr6SGH77eJoNkdXu7MTMT04338=
X-Received: by 2002:a67:4e5d:: with SMTP id c90mr10647487vsb.72.1548730815785; 
	Mon, 28 Jan 2019 19:00:15 -0800 (PST)
MIME-Version: 1.0
References: <CAFyWVaai=5K7j8w+Abpk9jxGyKuo4v9w2BgmDbY=_29+Q++Jyw@mail.gmail.com>
	<20181228220951.4962-1-jimw@sifive.com>
	<f3e26863-4624-2c8f-5a9d-f3e76b7e6f0e@linaro.org>
	<CAFyWVaYnSCDnX7j3XugT8zMw-wC=EdXiEJevb1pJkvzfD_qfGg@mail.gmail.com>
	<CAKmqyKP3wOiHvpqyFZZCzy3c7sJP86P30JXUA0P2jAvRL7QgbQ@mail.gmail.com>
In-Reply-To: <CAKmqyKP3wOiHvpqyFZZCzy3c7sJP86P30JXUA0P2jAvRL7QgbQ@mail.gmail.com>
From: Jim Wilson <jimw@sifive.com>
Date: Mon, 28 Jan 2019 19:00:04 -0800
Message-ID: <CAFyWVaa-L4pZXtJpUu7hom08LMx0q5pFmRyhO0TrmATD7CoRoA@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::e42
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH 3/5 v2] RISC-V: Map gdb CSR
 reg numbers to hw reg numbers.
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
X-List-Received-Date: Tue, 29 Jan 2019 03:14:51 -0000

On Tue, Jan 22, 2019 at 1:45 PM Alistair Francis <alistair23@gmail.com> wrote:
> I think it makes more sense to just define the variable in the
> gdbstubs.c file then. Can you move it to patch 5?

Yes, that is no problem.  That makes patch 3 a lot smaller and patch 5
a lot bigger, but it is the same code as before, just arranged
differently, so this shouldn't complicate the review too much.

Jim

