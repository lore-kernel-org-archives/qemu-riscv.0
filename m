Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gth6q-0003hG-GJ
	for mharc-qemu-riscv@gnu.org; Tue, 12 Feb 2019 18:05:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59432)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jimw@sifive.com>) id 1gth6o-0003g6-Bj
	for qemu-riscv@nongnu.org; Tue, 12 Feb 2019 18:04:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jimw@sifive.com>) id 1gth6n-00076V-Mk
	for qemu-riscv@nongnu.org; Tue, 12 Feb 2019 18:04:58 -0500
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36]:42582)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jimw@sifive.com>) id 1gth6n-00074Z-II
	for qemu-riscv@nongnu.org; Tue, 12 Feb 2019 18:04:57 -0500
Received: by mail-vs1-xe36.google.com with SMTP id b20so249945vsl.9
	for <qemu-riscv@nongnu.org>; Tue, 12 Feb 2019 15:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=7gyN88WW9EyGZ5/RR5VVaAwsRGoppKDsKfU9dxLptKA=;
	b=WVXViQyOSJtsSlP5a7jdB1RNo290EnpLtijDOn0dlAsg7ghN2STydjLWhkG9xWtFBa
	jp2KKxmNwzkXQ+nA8LFQkkhc279a8EvVBvD3zWYfvg9CbGatuynBCWXePRgjULjOTM8R
	UKTU8Ghqaqy7W2//hWi85gJiDXiXMMrm+vjxXPGSSwBuckZ4dEeFzqy4hBblTiv36HFD
	nSbgHeUANSSu+3ejeAwOZgR2GUuIDrkZqWx4CJIF8fp3to6mtg6f1JyfpwfDlG/aR7Pw
	K5I/4OQ+WeRM2gM2W/ohMyVGVXO9bco4yxBO2n4QRG2LAfC9STqkSh6MACmTLdUcWNq9
	XL2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=7gyN88WW9EyGZ5/RR5VVaAwsRGoppKDsKfU9dxLptKA=;
	b=sxFZW+7AzzC4fMhGZ84NjX4VOteZQE5s4l3mc9lc+8M3fNJ1JJPaxrb7mjNO8WMoCl
	Th3Unq+8/jIXIoqDuTi++TNVJRgxd8aTXRYEdjXoOx/2ESX9nlOB2D0Srhdz3gmdS/PY
	54tPTQw/kB0k5lxInZnyePEvZAhps6YLpjRtXxOXqvWE52OLhxBrqrpSUmZM2OUQKkqw
	tTJ0jUG8KnQh4renYNAetgaBwtqUukGR+CsCJC6gJm/rdXFb/viMMtBkyi6UGYXLREkh
	DTV4N8cJEsSJkSjzb8dGyqFBb0LYl6I5B+u7HOiZUJwm5rADYY5HupbpqlhM8DMq0wUp
	QEmQ==
X-Gm-Message-State: AHQUAuZlD79hqnrYPOWPtE/Esrb+HwPOoKVhAtwZEYMsA0GB023R5/iX
	/N5+hdR9iukQNppAlMP8XH0ShTTgp5IkDE7Kpm2TGg==
X-Google-Smtp-Source: AHgI3IYxcoEB37BFzzVZ3a0Kkmj9t/FTo60ba5cxsZ0Oaf2sjAcDaxqZRTNif2NXsl3UDpbi6BuIC2/5Kc8AM1HIZuA=
X-Received: by 2002:a67:df99:: with SMTP id x25mr2493655vsk.138.1550012695441; 
	Tue, 12 Feb 2019 15:04:55 -0800 (PST)
MIME-Version: 1.0
From: Jim Wilson <jimw@sifive.com>
Date: Tue, 12 Feb 2019 15:04:44 -0800
Message-ID: <CAFyWVabfDYU+2+iDYOeFMBL4+hVFL5q=fSR7Pb=VX1af5xsTNg@mail.gmail.com>
To: qemu-devel@nongnu.org
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, Jim Wilson <jimw@sifive.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::e36
Subject: [Qemu-riscv] [PATCH v4 0/5] RISC-V: Add gdb xml files and gdbstub
 support.
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
X-List-Received-Date: Tue, 12 Feb 2019 23:04:59 -0000

This is the 4th version of the patch set.  Updated as per the review
from Alistair, it has the riscv_csrrw_debug function added, and
Reviewed-By lines added.  Otherwise it is the same as the 3rd version.

Jim

