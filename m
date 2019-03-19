Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h6DQm-0006NC-QE
	for mharc-qemu-riscv@gnu.org; Tue, 19 Mar 2019 08:01:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34729)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h6DQk-0006Mh-N5
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 08:01:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h6DQj-00067t-Ta
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 08:01:18 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:34027)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h6DQh-0005YW-Df
	for qemu-riscv@nongnu.org; Tue, 19 Mar 2019 08:01:16 -0400
Received: by mail-pg1-x543.google.com with SMTP id v12so13726729pgq.1
	for <qemu-riscv@nongnu.org>; Tue, 19 Mar 2019 05:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=LLUGtcjPMoKWz9tJ2v0SbgLIgCGNJbREvAyfjRhuGxY=;
	b=ABjQcDULnDTXFGG8tBCjc0PiaVNjIuUPfQEC3UGLgl3KyVPU9se5Q2TsMi0M5oVk9r
	x9A2F3DI3sI/LwqCoRCi7eTI2oNCdOaw0KNVXr0RR+WGOW8WXtNzZ9mf19Mb2CgawlmH
	3mbtBgH2vVaoRZ6Isp6ucaJpP7jTpknTjrG0jmfQGUjTs8SUHSQfRQG3Za4GYCS8GaQ7
	l5MeSFNwGwifn2AuK6T6lb/uCR5eS2bJuPJvPOEV/xmFTytnbskc0OIjFkVZ2hgXPid6
	XiUnOOJSIYVND/bEyRS0HCY4iC25u/vuBPNgpHImhUHwCBJeKcJCEdsl1m3maY+1GE6s
	7WKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=LLUGtcjPMoKWz9tJ2v0SbgLIgCGNJbREvAyfjRhuGxY=;
	b=QuWxWguiZtUUiu4BhiDAniBbPZs0JVVutRTGBLdmN1JPPuiTt+izsR9UfTPuhBItLR
	BUwBufPJeVm6nq8AnfNPsaSenCNIRrfPuTZMF4lhMCccArAhTzCtrckbXFFDx1amv7/d
	A+HH3y7Jn+GerL2SJ5DW34wjbm0BWzFzrvVgNr6p6jXYM+1IvEPX3wWM/nNQrq2orJrB
	aF3t9bPBz16UrjFS8da6EQ4JJe79Mrm4OCvptnSGXJJSY6iOIN0FhEHibttVgzV4UeUL
	IF+IdVOpV3pHwF13andHBFsaRrSaP12E00A5Qvx8UkQEi4rU8VpG1YdCS2kXV+IGE+ZZ
	htCw==
X-Gm-Message-State: APjAAAXp0dxW1c/SQcXbYmavC+18H8BRzO1DluqZGkckO2e/ZsXt4vj1
	EQtaRrPmuw7hqFdLSef7JYl/eQ==
X-Google-Smtp-Source: APXvYqwtqojvEFeFYU90RcTvsSnuQpB45/evJ1Ru33q1VIxIyj0J9It9lo7Tet01IC1Zgp4zoS+x+A==
X-Received: by 2002:a17:902:a714:: with SMTP id
	w20mr1705303plq.331.1552996841097; 
	Tue, 19 Mar 2019 05:00:41 -0700 (PDT)
Received: from localhost
	(2001-b011-7001-1cad-363a-ebbe-dac8-3f4c.dynamic-ip6.hinet.net.
	[2001:b011:7001:1cad:363a:ebbe:dac8:3f4c])
	by smtp.gmail.com with ESMTPSA id
	r66sm14834048pfr.131.2019.03.19.05.00.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Mar 2019 05:00:39 -0700 (PDT)
Date: Tue, 19 Mar 2019 05:00:39 -0700 (PDT)
X-Google-Original-Date: Tue, 19 Mar 2019 05:00:33 PDT (-0700)
In-Reply-To: <CAFEAcA8Hxd2L+wyPhHs99jDpbCVNkoZXzzFVBmKm-KfpedN1tQ@mail.gmail.com>
CC: Chih-Min Chao <chihmin.chao@sifive.com>, alistair23@gmail.com,
	qemu-devel@nongnu.org, qemu-riscv@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <mhng-f6deb68e-719d-4769-8441-6a5aed0f591b@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v5 0/5] RISC-V: Add gdb xml
 files and gdbstub support
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
X-List-Received-Date: Tue, 19 Mar 2019 12:01:19 -0000

On Tue, 19 Mar 2019 04:55:18 PDT (-0700), Peter Maydell wrote:
> On Tue, 19 Mar 2019 at 11:45, Palmer Dabbelt <palmer@sifive.com> wrote:
>> This is another one that got queued up behind the decode tree stuff.  I'd call
>> this a new feature, but give that it's been on the list and reviewed I'm not
>> sure if it's OK for master right now.
>>
>> Peter: is this too much of a change for post-rc0?  If possible I'd like it in,
>> as it's pretty self-contained and enables a meaningful use case.
>
> Yes, I think it's ok to go in. (If you send a pullreq for it in the next
> 3 hours or so then it'll actually get in before rc0 ;-))

Oh, good timing -- I was just about to head out.

