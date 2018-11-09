Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gLCKe-0002aT-NE
	for mharc-qemu-riscv@gnu.org; Fri, 09 Nov 2018 14:20:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42548)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gLCKX-0002XT-3R
	for qemu-riscv@nongnu.org; Fri, 09 Nov 2018 14:20:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gLCKK-0001bG-NJ
	for qemu-riscv@nongnu.org; Fri, 09 Nov 2018 14:20:27 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:34519)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gLCKG-0001YX-Lw
	for qemu-riscv@nongnu.org; Fri, 09 Nov 2018 14:20:17 -0500
Received: by mail-pg1-x52d.google.com with SMTP id 17so991689pgg.1
	for <qemu-riscv@nongnu.org>; Fri, 09 Nov 2018 11:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=subject:date:message-id:cc:from:to;
	bh=qwoKBjdQKopjCRfuGi36fWOyNPnnMcquo+QyjTB1hYk=;
	b=U5ydxCbIcmb+fSt/IyOZ8feM5vNIUKbg5WqJCHIGpfWTAg6Nizz5myDIAItAN6qi45
	tT26izj3yD6QA4RrRX/Xi/Yov7a+UEUfKYK3jDDm+ob7TOdkoM0vXUObu/e3KMst+8/s
	+hRO+47MABl+GjdB4xzYyNObvBADQr2pH9wvB8AWfBp/XCaVTFVN+HKvavzDrM4Nzm79
	1JxBhM5RXRSrgVd1UbPKDh97aXrPs5Mvi0MS0BUJJAMuGfZQ5KIVE5bVBrfXsSDy4Tq6
	BJRMDB20Md/AeUAyOtaJcOSUvYbpytXY25RbfKXoAKRZkh4aYKWF6xkKF6JS/cQDgYtY
	yGjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:date:message-id:cc:from:to;
	bh=qwoKBjdQKopjCRfuGi36fWOyNPnnMcquo+QyjTB1hYk=;
	b=p6jfLFrOvG/npGWbVxB0kirOq1HvjMe5O8uaagMGI0ysvur4FkjZBLO/Q4P9Nniiaf
	G+AibThqumgETUQxZ9i0cRtXu2dth51fhbkyb98jAq6HPdyZkYBKpou24XkJbJmY2WaX
	O1mqDhUGGyfGs/bkt8m1BdugvYVXnkQi6RHEejOrribYp2neKdX1UlALF8pW92oTwGwK
	wMlLQkRy+LVeC7bbufit2H3KCLGUTmYAKHo7qwYu6rS5722AvubFSsZzJocxZpWvZ70P
	0+YoHiw6kdu4HVbMkgHi0LO284XFUqOwt5zkL/004bv7u9Cei4xZ8H+/fZPFCUBr2ahM
	1wGA==
X-Gm-Message-State: AGRZ1gL0UV8ObZEjtIPHWT4daGqAqoM2chqinMYPUlFaHzUoJYJnjr9x
	cJL73hGzh26eUAJS0jnHxhxclQ==
X-Google-Smtp-Source: AJdET5dn2Q5WWS1LUyI45LleuVForu9J2/ASIgoMIh/wPV9ddxWN7PuupyzoijUvjZ00Qu+VcDt8Uw==
X-Received: by 2002:a62:76c9:: with SMTP id
	r192-v6mr10167630pfc.17.1541791214943; 
	Fri, 09 Nov 2018 11:20:14 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	67-v6sm8966927pfk.134.2018.11.09.11.20.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Nov 2018 11:20:14 -0800 (PST)
Date: Fri,  9 Nov 2018 11:19:33 -0800
Message-Id: <20181109191933.6641-1-palmer@sifive.com>
X-Mailer: git-send-email 2.18.1
Cc: qemu-devel@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: qemu-riscv@nongnu.org, richard.henderson@linaro.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::52d
Subject: [Qemu-riscv] [PATCH for 3.1] RISC-V: Respect fences for user-only
 emulators
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
X-List-Received-Date: Fri, 09 Nov 2018 19:20:39 -0000

I'd like to target this for 3.1: while it's a pretty esoteric bug the
risk of breaking anything is low and tracking down a manifestation of
the bug would be a nightmare.

I don't think the performance improvement alluded to will be a 3.1
candidiate, and as a result I probably won't get around to it until
later.



