Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gK1Pt-0001ra-8W
	for mharc-qemu-riscv@gnu.org; Tue, 06 Nov 2018 08:29:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34497)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gK1Pp-0001lw-Qd
	for qemu-riscv@nongnu.org; Tue, 06 Nov 2018 08:29:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gK1N2-0002hl-0x
	for qemu-riscv@nongnu.org; Tue, 06 Nov 2018 08:26:17 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:46909)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gK1N1-0002gK-Og
	for qemu-riscv@nongnu.org; Tue, 06 Nov 2018 08:26:15 -0500
Received: by mail-ot1-x342.google.com with SMTP id q5so11318865otl.13
	for <qemu-riscv@nongnu.org>; Tue, 06 Nov 2018 05:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KrLnON23Uwf1eBXvFB16yr65JWsIbqrjXGCwqyjcYTM=;
	b=jd+iohxaP2e3Gnv6oi5WcQQyE+DaVyo0KO/ce7FSj0XArzmEeiLEJP8kaIlY6MbfCT
	qnc3aFgFMKKCU/hmrkptSlMzXPjsje7+5Q5vWGinFOLrgPI1O5gfDecXEKHq+f+Y4H6i
	ERs/Q37NUvg+DoWG00w0tq9+4SK1gFjlFtpoQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KrLnON23Uwf1eBXvFB16yr65JWsIbqrjXGCwqyjcYTM=;
	b=BM0/o07rrwCOMDCQ+lhbzXOttaJRRJc3byXeDgTz9vTTJxTDOxypwEmCR/9AlOijbX
	WQSSGOHDPLk5zIGej4bHDibInZxRJgCu6pzi6voqu82Dy/EZbui7LGeDwDxrufYYjjSV
	nKvSSVX/HVWBZXW5Ke43W3AM8JzFVRnVR75qAMj3BcXnOPIwweG6c9HDXgpsehiHNNx6
	chugJOx4iM7KXhX0GS2AicLQomTKRy3qIpxnESmzrasgLSkyg/1fugEjoKWIyGYTKxxl
	J3TVUZr8syBye/7hp+Em2cSeXyn1+iFKuOw1v0Z98OohATi3Fm/e5/C48PMal/Tpn/AV
	/2aw==
X-Gm-Message-State: AGRZ1gKu8PVIj43/Rpmci9FBaWyg2RqiWroWDEMSwVeux/v1Z6p26AId
	I1EKlHWFr6qz670mS8ywUCRa9VJ9/XJWaGb8oVI0ow==
X-Google-Smtp-Source: AJdET5deIe1hhSdv8MEVw+NXFBz83b5X38VHYaSY+b+vfgMH2dIbb/zobq5uOB1iT5qAv0jNNnjfoHtSa4s/3R906uQ=
X-Received: by 2002:a9d:5a81:: with SMTP id w1mr688754oth.317.1541510773576;
	Tue, 06 Nov 2018 05:26:13 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP;
	Tue, 6 Nov 2018 05:25:53 -0800 (PST)
In-Reply-To: <3988cd7b9d292017537f75c2eed70295a3a84718.1541447021.git.alistair.francis@wdc.com>
References: <3988cd7b9d292017537f75c2eed70295a3a84718.1541447021.git.alistair.francis@wdc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Nov 2018 13:25:53 +0000
Message-ID: <CAFEAcA8wLiNgW43tasbZHfjmOxQ209UdpHqCMHNcyQ25G9XcTw@mail.gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>, 
	"alistair23@gmail.com" <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-riscv] [PATCH v1 1/1] riscv: spike: Fix memory leak in
 the board init
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
X-List-Received-Date: Tue, 06 Nov 2018 13:29:10 -0000

On 5 November 2018 at 19:44, Alistair Francis <Alistair.Francis@wdc.com> wrote:
> Coverity caught a malloc() call that was never freed. This patch ensures
> that we free the memory but also updates the allocation to use
> g_strdup_printf() instead of malloc().
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

