Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gJf8n-0006AQ-3P
	for mharc-qemu-riscv@gnu.org; Mon, 05 Nov 2018 08:42:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49913)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gJf8l-00062B-Io
	for qemu-riscv@nongnu.org; Mon, 05 Nov 2018 08:42:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gJf2u-0003Ho-Ra
	for qemu-riscv@nongnu.org; Mon, 05 Nov 2018 08:36:02 -0500
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d]:35720)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gJf2u-0003FH-G7
	for qemu-riscv@nongnu.org; Mon, 05 Nov 2018 08:36:00 -0500
Received: by mail-ot1-x32d.google.com with SMTP id 81so7962138otj.2
	for <qemu-riscv@nongnu.org>; Mon, 05 Nov 2018 05:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=uAmiek+kMbs2LZ4XILhVmbiwOS8jBLSC7W80ilu2VY4=;
	b=g5b7mU7usXK9IP3MJjX4m4zKvbM48m64FXG7GSfFYx1JTBbVDV20WbCO8J7wXhlZDI
	nJfPBSpclGvErvjgB12Hcga6G3qZ5Wq5PH6omwAKwlqFnc9okvu47Pb6HIUqRRsaFU0P
	8oCw2GUUtyJbndx7SoWkh12zWeqQmsZIgksKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=uAmiek+kMbs2LZ4XILhVmbiwOS8jBLSC7W80ilu2VY4=;
	b=B1IU5UvCACwF8NcXWcBCt+f7rYiIQ0vJJsKH8NJtHpW+a74g2oRbqccdkz6VAammaP
	yhrFC55FVMbIUBuSuc+GdcfYEVIDY5MdUM60rkHjMJ/agSuEN1clcO7RKHNpiTQrlD+k
	MmOCsUg+bDoJI6MvZm7+YGYo6FWSpLOuubnQhJSbAMq7xccE78LSgbD2Y1JH7FmmbalU
	9YV5FkxBEB/2fTU+tbygSIMp21xQ6TpV06IMX0vl1qjBf8EhG8znHzijoy7wcA0Uus+m
	seoF435WGil3rTYhAz4Co9800VH90E2o1BnYhoOPfAUXip5oF78LUAQSmTWgjvKMI/6/
	5Cvw==
X-Gm-Message-State: AGRZ1gJVT9K7fx3/mzDhRevD5mCr42sUcvo3pdHocktRRCYNOdmDESxz
	2w4mKeqy4adEr3wTWCNEtsbpLaVUR9mcGxwlLv/LKg==
X-Google-Smtp-Source: AJdET5ekxgu/hWVxo8e8bVPQmX774aqG+vjDHYOAS4qWUnZbDZNk6DZDj4BpqDTBlsYzBPoQ97L+JBfCY3Uod5SXc2o=
X-Received: by 2002:a9d:2cd3:: with SMTP id e19mr12330739otd.363.1541424957430;
	Mon, 05 Nov 2018 05:35:57 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP;
	Mon, 5 Nov 2018 05:35:36 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Nov 2018 13:35:36 +0000
Message-ID: <CAFEAcA_mT2FT=t+Fw7=7aUgDkX1b64oqFS99_jFN7_12MRCx+g@mail.gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: qemu-riscv@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::32d
Subject: [Qemu-riscv] coverity-spotted memory leak in hw/riscv/spike.c
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
X-List-Received-Date: Mon, 05 Nov 2018 13:42:04 -0000

Hi; Coverity has noticed a memory leak in hw/riscv/spike.c:
it malloc()s memory into config_string(), but never frees it.
(CID 1391015). This isn't a very serious leak since the function
only ever runs once, but it would be nice to fix this for 3.1
(it is the only coverity error in the riscv code, and one of
just 8 unaddressed for QEMU as a whole).

Incidentally, "malloc and then snprintf" would be better
done using g_strdup_printf(), which automatically allocates
sufficient memory for the string, avoiding the need to
try to pre-calculate the right size.

thanks
-- PMM

