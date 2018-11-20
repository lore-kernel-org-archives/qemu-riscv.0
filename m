Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPFAg-0006mI-Mk
	for mharc-qemu-riscv@gnu.org; Tue, 20 Nov 2018 18:11:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43829)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gPFAc-0006m2-KN
	for qemu-riscv@nongnu.org; Tue, 20 Nov 2018 18:11:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gPFAQ-00015u-UG
	for qemu-riscv@nongnu.org; Tue, 20 Nov 2018 18:10:56 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:34340)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gPFAQ-00010z-Kz
	for qemu-riscv@nongnu.org; Tue, 20 Nov 2018 18:10:50 -0500
Received: by mail-pl1-x631.google.com with SMTP id f12-v6so2511713plo.1
	for <qemu-riscv@nongnu.org>; Tue, 20 Nov 2018 15:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=W11FYVimEJMsSMvOVpW9mPLyOKi6ototPsftuotmfto=;
	b=GrpODtDAaqnGbNrTnlSpRWOuPZ282RErx4R67hL6t7brKlxWzcES87InFt+ZH63KMY
	ljv+Zz9iBCi36M8XVyizMDlMVONLeVGLuSRQxv1yqj/Aaq4e/nvLB2mZoKOAyGVioii0
	iV1eis+5cNiYBkTYVqwnqzcck2fAnB9ukXu2/puCU8N6hD0PDkViWIaHQkYmiM00TfhU
	G6vrPIjedGwHvN2LE8W4bFh5TN3g7kpbpPAcSrj+mdamGB8tfTo9SOyd0+0qErqcjUBU
	v+984Py1Wrye7ZH3yQ9whA2K7l2AyIQWKJAxPqAQyPIRRmry8zEL60BLSjYN7Kwq0ixP
	Oyfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=W11FYVimEJMsSMvOVpW9mPLyOKi6ototPsftuotmfto=;
	b=KmfhcdPvO/jeR1Z3hx43Onyndi0ZGkqnBSzxfdL8F0xc4ElMjNxLcY7z+EY1m9b+q6
	MxElqKHSE2j/a4ebp7H/hBcIkPw9i7+P0gzoJFYZSfmh2ifTaJ3Vb4S3zJGvbicVVSq/
	/3nuwFfmdO55vsl0118lug35Eh27iXxlOJwT//ducuusXHII90OddXJHTSfRG1Y/QzuM
	tPAo7utJtcV7UGx3J9dYs76d9rTKDy+BRiREznQQWUsdGc52qAZJD6yH9RjP2+jDWSlD
	sYYqKIOcwWUj+DZfhtjo8dHrgEAWGN2GtvolPIVGaiR+89fS85aCZP9Wx8lhmQOv15ne
	bhKA==
X-Gm-Message-State: AA+aEWbslMIO0dXB8KFX2aaQJq8QG3WEQxuJ+2d2I/PDzs/3WZJ+rmrE
	Ww47SZrvmSQerYyzTxAuJ6CwPw==
X-Google-Smtp-Source: AFSGD/XMyKNLCKHnHI4HHVsXfrrBMKTH0TwL+v+KsN8Q+aBTto7yXNoEDTTSNRWTOIO2LoWn1Ly6WA==
X-Received: by 2002:a63:6ecf:: with SMTP id j198mr3772832pgc.3.1542755448102; 
	Tue, 20 Nov 2018 15:10:48 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	w136sm32375784pfd.169.2018.11.20.15.10.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Nov 2018 15:10:47 -0800 (PST)
Date: Tue, 20 Nov 2018 15:10:47 -0800 (PST)
X-Google-Original-Date: Tue, 20 Nov 2018 15:06:30 PST (-0800)
CC: qemu-devel@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: qemu-riscv@nongnu.org
Message-ID: <mhng-7b0b51b1-4bb3-4a88-a8c2-3e4e178623ad@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::631
Subject: [Qemu-riscv] No RISC-V Patches this Week
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
X-List-Received-Date: Tue, 20 Nov 2018 23:11:05 -0000

I don't have anything in my patch queue for this week, so I don't plan on 
sending a pull request.  Let me know if I'm missing anything.

