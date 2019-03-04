Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h0vPV-0006Sq-4S
	for mharc-qemu-riscv@gnu.org; Mon, 04 Mar 2019 16:46:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42680)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h0vPT-0006Sc-2Z
	for qemu-riscv@nongnu.org; Mon, 04 Mar 2019 16:46:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h0vPS-0003fZ-8u
	for qemu-riscv@nongnu.org; Mon, 04 Mar 2019 16:46:07 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:44715)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h0vPS-0003cz-20
	for qemu-riscv@nongnu.org; Mon, 04 Mar 2019 16:46:06 -0500
Received: by mail-pg1-x52e.google.com with SMTP id j3so4001492pgm.11
	for <qemu-riscv@nongnu.org>; Mon, 04 Mar 2019 13:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=CQ6wqUVUr37LeljKPWo/8XWifyjY6BGPzbFhxUKwNos=;
	b=WH/+rQFestFOHrj15o3dB4B0+bDdMq8GGXKMd5WB4L6yPLIuHpwVR/biTFIEtcX7i4
	8DYjzpqLt+CA1ePsGkwoLS6UBRoD0klt22S4OcbppI/Q8M0tS487OjDxNSmH1wWeaBdp
	jWCyGwakCjTudJ9Hzst3SzL8+O0iYydyNzQemeVPUgV6wouMzk9leICKM5dzfv2x/H1C
	kTDB3q54umMLQ7qvvI5nJVSwhO7H4q9DhkX/TCKfBcJjHUd7nz6s5BnwHtCODjda914k
	9hkuH78nQf4GB4vgSNE1ZCMW51B5H0Rgc+UxRotuUKIgPIRKeSNRWmxGifBbX0n1hsMs
	dwcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=CQ6wqUVUr37LeljKPWo/8XWifyjY6BGPzbFhxUKwNos=;
	b=lW7Dr+TgINBhBZ+o+SFE+joaqxoAI+HEhIunUXQU170WIAvF/ct6Q0gu1t4O0dhbBw
	B2ejpokweEijeUsZijl/V0iDbkMQRoyo6sdP4i+iA1Qis9R1JgmpQ6SVU4KRtnCnwnqL
	RXNFzOg4isOjW9WTwVpA+89AYnN1DltyJ6bau0361Icv78spIQhnZ8LCG5B79c1PBOzg
	zwl2k46hsC50f9QrcBLYckYwm5NwEFAvsKrpHWQ9SeKdGTzdB3Hvj57uwIZy8uXl+viT
	PQ90Y6rGviwI6aF0ikjieDupYCjovLctW9LW0zFEYV64mzWWG9mHgGgDkmj6L5h+W5SH
	dhjQ==
X-Gm-Message-State: APjAAAWHjhDcmcTAFQg9yrEtAd+QVVBUnxu0Ee/qRQ7nt3StlfP4+bqf
	A0XpPDfFLTfq6iYFa6ARhEmHnQ==
X-Google-Smtp-Source: APXvYqwJnO4ei+HQ7j+ctc8It9vTVUnK8pvCjvJuCw6gw6t+BBCQ47ahiYkGxqrNV83K6Lvlk4DTVw==
X-Received: by 2002:a63:c449:: with SMTP id m9mr20303806pgg.41.1551735964464; 
	Mon, 04 Mar 2019 13:46:04 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	d11sm11191960pfh.29.2019.03.04.13.46.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Mar 2019 13:46:03 -0800 (PST)
Date: Mon, 04 Mar 2019 13:46:03 -0800 (PST)
X-Google-Original-Date: Mon, 04 Mar 2019 13:45:52 PST (-0800)
In-Reply-To: <a652de39-fae2-9885-1197-fbb70b28b7cf@linaro.org>
CC: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>, richard.henderson@linaro.org
Message-ID: <mhng-0bb53acf-0f1c-405f-8599-76941fe63e37@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::52e
Subject: Re: [Qemu-riscv] [Qemu-devel] [PULL] target/riscv: Convert to
 decodetree
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
X-List-Received-Date: Mon, 04 Mar 2019 21:46:07 -0000

On Mon, 04 Mar 2019 11:30:21 PST (-0800), richard.henderson@linaro.org wrote:
> On 3/4/19 4:52 AM, Bastian Koppelmann wrote:
>> This looks like an unforeseen decodetree problem (CC' Richard). As these 16/32
>> instructions share the same trans_* function, we emit the same typedef once for
>> 16 bit and once for 32 bit. I don't see an easy fix in decodetree
>
> Use an argument set, and add !extern to the argument set definition for the
> "second" decoder.
>
> (Leastwise I don't think that feature is sitting on the branch...)
>

Thanks, I'll do another PR and keep the last 5 patches for later.

