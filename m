Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gHyy3-00020R-Bp
	for mharc-qemu-riscv@gnu.org; Wed, 31 Oct 2018 18:28:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37653)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gHyy0-0001vr-45
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 18:28:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gHyxv-0006Yf-1w
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 18:28:00 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:39794)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gHyxu-0006Y2-Li
	for qemu-riscv@nongnu.org; Wed, 31 Oct 2018 18:27:54 -0400
Received: by mail-wm1-x343.google.com with SMTP id y144-v6so15872346wmd.4
	for <qemu-riscv@nongnu.org>; Wed, 31 Oct 2018 15:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=UCEi3d5j5DFSeygqAIR8JRr71WpNBKD6YnCvpi7HE0c=;
	b=deVXKyhYFMLPcqpuoeDhHSTtVk6d1jv6xzMMFWVczWDefW05YiWqmh4gsFzCZU/5Rg
	e4QklGekfERTGie6MlY5pmoNRBcvprj4Jm2HaXXwcTI+jf+HCQL4/OMT/kJufhrVm8To
	SyI+QUXvGieHSZwwqNPpDqzaVMtNl12QASXBU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=UCEi3d5j5DFSeygqAIR8JRr71WpNBKD6YnCvpi7HE0c=;
	b=VBSsPoBqLgrZJZ5dqvnK1JCyZIcdCM4mbuC8n1iYuoj/AgsROeq3OuZxkbKSPFCGkT
	HOgXnSjK5vVjTZt+JTEex2eVxomN6IyE5vtqt1riJJHX9crK7NBVONzgvy2qyZcD2b1m
	kFnS/c6j1On8QCIQLuy6uPH6FHE0J2gjOc1/0X5L0Kyq39qu9dKZO0GOZ7RK1eREPgZW
	0ZtvGM92zIn41Xkoue2i+FLBd4+Sitj6SUqXRne3Ey/exeyqx9paO9vOFETFrTFTsRAL
	uY9oSc3KEF4kQHMqvMi0AFZVeC1LIjU1ukdR9pMQetZ0woSWk7hhA5oU28Hj9PcsxUgK
	LNSg==
X-Gm-Message-State: AGRZ1gIziUQ7b/+cVOlnX4NsDiLcJUKaH4IRqHNZWDMFzXQH9I6hAAG6
	auL8qiHklqVNghzD5fEJ9C2liQ==
X-Google-Smtp-Source: AJdET5f1qGKCPLJMbkr3dWIExMeaWCNVUZptlr3fiSbiYPK4oF6bCwmpZY6wBw4aQk1S1R388JBLVg==
X-Received: by 2002:a7b:c0cc:: with SMTP id
	s12-v6mr4013146wmh.39.1541024873525; 
	Wed, 31 Oct 2018 15:27:53 -0700 (PDT)
Received: from cloudburst.twiddle.net (79-69-241-110.dynamic.dsl.as9105.com.
	[79.69.241.110]) by smtp.gmail.com with ESMTPSA id
	o15-v6sm1556460wrw.47.2018.10.31.15.27.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 31 Oct 2018 15:27:52 -0700 (PDT)
To: Alistair Francis <alistair23@gmail.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: Michael Clark <mjc@sifive.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@sifive.com>,
	Alistair Francis <Alistair.Francis@wdc.com>, qemu-riscv@nongnu.org,
	peer.adelt@hni.uni-paderborn.de,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
References: <20181031132029.4887-1-kbastian@mail.uni-paderborn.de>
	<20181031132029.4887-26-kbastian@mail.uni-paderborn.de>
	<CAKmqyKNKC7TFNYmH242EEbD8y7m3ZSZ+BCA5i+GiqaK5j-u8qg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <78263165-02fd-c85e-5ef8-c3fcb793db39@linaro.org>
Date: Wed, 31 Oct 2018 22:27:51 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAKmqyKNKC7TFNYmH242EEbD8y7m3ZSZ+BCA5i+GiqaK5j-u8qg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::343
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v3 25/35] target/riscv: make
 ADD/SUB/OR/XOR/AND insn use arg lists
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
X-List-Received-Date: Wed, 31 Oct 2018 22:28:02 -0000

On 10/31/18 8:44 PM, Alistair Francis wrote:
> This series causes a lot of kernel oops during boot...

The only bug I can see is in trans_addw.  But that's a biggie and could easily
explain, since non-extended values could have caused a compare to misfire.


r~


