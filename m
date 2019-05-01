Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hLddJ-0003Gx-Rb
	for mharc-qemu-riscv@gnu.org; Tue, 30 Apr 2019 21:02:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54724)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1hLddF-0003G3-Ae
	for qemu-riscv@nongnu.org; Tue, 30 Apr 2019 21:02:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1hLddC-0007he-81
	for qemu-riscv@nongnu.org; Tue, 30 Apr 2019 21:01:57 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:35085)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1hLddB-0007gn-UW
	for qemu-riscv@nongnu.org; Tue, 30 Apr 2019 21:01:54 -0400
Received: by mail-pf1-x444.google.com with SMTP id t21so7930295pfh.2
	for <qemu-riscv@nongnu.org>; Tue, 30 Apr 2019 18:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=1kq09OnIGZpqdeeC4YtLnAhtFcWe2yby34JX66f38Yg=;
	b=Q84lfQkyu1zYJG/c7f/uV1TmZwC3LYM4nVLKiogl7mUJCr/F+VxgsPWIi+a1ymDUwB
	4RpwGRIbhIH2kV3mIyp0nMgD/2HqkU6qJLcPABIIdZHJQCF8StfjfN9mztwxQHauUavb
	X3duvOdVKXuHxlWcTALuhhgWdxV8VU1O6T9JppOlzLOhClKkGhfDfcb2o7tj1oRu1A3Z
	CSTyZeu8WXxOyGNFzjCx9bRBVSWLNpPyFQ1Qtl1XMdHSqxuchsj+8LmFLW7+WUYT6LOI
	/Xen8tfwn8DD6f6fE6FE8Srr/ApBLGzjxXWzzz2Irp3mCL7KtGj5PRhukow1cz+RLMn4
	78Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=1kq09OnIGZpqdeeC4YtLnAhtFcWe2yby34JX66f38Yg=;
	b=H6yXWSDpgLXOnZMbAWFqB8to5+Ydq9pun835Dxqlhgz2u2U03sl0a6DU5F3R3nDPv4
	Gsr/N+BwRNrW3oM4rbyZPS+YXZGeCRsuXdX9vtK9KpMC+9zTs62Xw4Y63uxNBoMW8nGz
	qskTbWRfGiEbjZIpdJCjRwjM61sifM0KN8v4aPg7x+J4PM0U8RkvncHi2Jd8fTOmjxh0
	eabBmVgszj8AfZ2+5sFKuVJ69EkUCNajeKa/MnSqHqm0UVJrrxfatOGgSYERDmKwvQYu
	ydziYLycNAHtLNzQccMPOleiNPTlRRqm0FOlXJ2PNeKpP9E3Dqa8hh7d9dAnayEWl9Ip
	nz1Q==
X-Gm-Message-State: APjAAAW7UuMRLStPRfyvY/5ZzQ5gb02AJCKU7ZmYPewSBH/8iZtAw3KW
	/a0b27LMQhtHRpBskwZXEu8lyA==
X-Google-Smtp-Source: APXvYqw/+IriT5gGZZ6+7/OF73NJd7kxwj4T/DrWFxkKGeSKUdK8p5/FgPrOV+ei6o3JvnLLl33lbw==
X-Received: by 2002:a63:ef46:: with SMTP id c6mr54381456pgk.392.1556672512222; 
	Tue, 30 Apr 2019 18:01:52 -0700 (PDT)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	v14sm14607096pfm.95.2019.04.30.18.01.50
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 30 Apr 2019 18:01:51 -0700 (PDT)
Date: Tue, 30 Apr 2019 18:01:51 -0700 (PDT)
X-Google-Original-Date: Tue, 30 Apr 2019 17:46:50 PDT (-0700)
In-Reply-To: <9384b35d-41d0-65b0-17ca-7291c530d13f@linaro.org>
CC: qemu-devel@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Alistair Francis <Alistair.Francis@wdc.com>, qemu-riscv@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: richard.henderson@linaro.org
Message-ID: <mhng-a33acc90-e882-4238-975c-c5611090fafc@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: Re: [Qemu-riscv] [PATCH for-4.1 0/8] target/riscv: decodetree
 improvments
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
X-List-Received-Date: Wed, 01 May 2019 01:02:00 -0000

On Thu, 25 Apr 2019 09:23:56 PDT (-0700), richard.henderson@linaro.org wrote:
> On 4/25/19 9:04 AM, Palmer Dabbelt wrote:
>>
>> Thanks!  I'm happy taking this as it stands, since all those decode issues I
>> pointed out aren't regressions in this patch set.  Let me know if you want to
>> fix those or if you want me to -- as you can probably tell my email queue is a
>> bit long... :)
>
> I'm happy to fix those, if you'll point me at your branch.

github.com/palmer-dabbelt/riscv-qemu, for-master branch.  I haven't sent the PR
because I haven't banged on the branch yet, but I don't anticipate any major
problems.

