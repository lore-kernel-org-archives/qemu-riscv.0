Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h8yh5-00016h-Bt
	for mharc-qemu-riscv@gnu.org; Tue, 26 Mar 2019 22:53:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52769)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h8yh2-00015g-AX
	for qemu-riscv@nongnu.org; Tue, 26 Mar 2019 22:53:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1h8yfC-0000tM-NB
	for qemu-riscv@nongnu.org; Tue, 26 Mar 2019 22:51:39 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:43910)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1h8yfC-0000sq-7w
	for qemu-riscv@nongnu.org; Tue, 26 Mar 2019 22:51:38 -0400
Received: by mail-pg1-x541.google.com with SMTP id z9so2914501pgu.10
	for <qemu-riscv@nongnu.org>; Tue, 26 Mar 2019 19:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=6BV7f2pL8VxERD1eBtacJQSbm3VdISGTEVx51vRAESM=;
	b=RwAcRdzPQZixU8PMD6q5o4nInst5y6hQRphVS8us+fC5cty8uJvJ7GxYesruP1CrQi
	9cSJSz0pPbBGj0k7YdlwWJjqDglTlQuYMci0tFih6+PhJNiPcBWhtNIkPs75tbR4aByz
	9/UrLZg0oBXi0Va6m4Uxn4MO0ywP8Bc9eyfs3mvRtfEaaXvG4LAgnTKojsYaRoDe4/PU
	7L+Ms/8ozLxkNlXDv2zk1xv8RcXB56XWC4DtcQtXr2TKGwAv6LQ0MSKQ7kTA+5YXPw2b
	wYX9qxOZ7MpggqR8zpCf+7ZIjHIRNo+oxpOwBvWvEOEM+IKPWUJk0fWeOD+IqaVKCCjc
	FXLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=6BV7f2pL8VxERD1eBtacJQSbm3VdISGTEVx51vRAESM=;
	b=Tiw8EvFlDOkhXZZoDy23QqwiKcJHQBjNo/PMiGOaQEWQ2JD6e0JJjHvzJyMrUDl8Kl
	n2H06TxbjfVckTIn4P1eTz9p8Pc202DglbtzX9X/2V5XNIzhEED3fPtv0WxveEGMk7cm
	KsqgM2BIclaBd795YN63WhCmZBHq6/HUuT8EmcQnL4KvXBuJf0FOJME+7vFTarBHAUyC
	TirUs9Iw1tvuvAU1jnqx6sxC/PzBK5Z3Dw79fQBZvphOEf8SnfljGTdC1q20qp7eW2MG
	lvgevDe881HgIizNJXDYoBxyv90RRA8eaYPL/Da6pV/aTP/MRgahGy4m5aqlUUtMoHU8
	1n0A==
X-Gm-Message-State: APjAAAW16Tcwgtr3zarqMvy3o7OtcYz9GVLnU1U6ClYCitpqSj+AxE/f
	WnvfHtTDsZExEvlY51fMlujBXw==
X-Google-Smtp-Source: APXvYqwbHPHPP+sYnVJA1LQ0rs8WB5B7Hi+6QnxHpBgmWQ8YEtyYYEn/smdBELlKA9/Xsr6H/HbUyA==
X-Received: by 2002:a63:e755:: with SMTP id j21mr29203266pgk.418.1553655096668;
	Tue, 26 Mar 2019 19:51:36 -0700 (PDT)
Received: from localhost
	(2001-b011-7001-168c-9355-f21f-1416-8b19.dynamic-ip6.hinet.net.
	[2001:b011:7001:168c:9355:f21f:1416:8b19])
	by smtp.gmail.com with ESMTPSA id
	r82sm39198274pfa.161.2019.03.26.19.51.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Mar 2019 19:51:35 -0700 (PDT)
Date: Tue, 26 Mar 2019 19:51:35 -0700 (PDT)
X-Google-Original-Date: Tue, 26 Mar 2019 19:51:26 PDT (-0700)
In-Reply-To: <a5ad2b8f-2c0d-b813-84eb-d85d1a59b87a@adacore.com>
CC: mjc@sifive.com, Alistair Francis <Alistair.Francis@wdc.com>,
	sagark@eecs.berkeley.edu,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	qemu-devel@nongnu.org, qemu-riscv@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: chouteau@adacore.com
Message-ID: <mhng-48016599-35ba-480e-b06b-5ceb2285fc11@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: Re: [Qemu-riscv] [PATCH] SiFive RISC-V GPIO Device
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
X-List-Received-Date: Wed, 27 Mar 2019 02:53:33 -0000

On Tue, 26 Mar 2019 10:49:11 PDT (-0700), chouteau@adacore.com wrote:
> Hi Palmer,
>
> On 26/03/2019 09:58, Palmer Dabbelt wrote:
>> Do you have anything that actually glues this to a machine so I can test it?
>>
>
> In this patch I do instantiate the device in sifive_e machine.

OK, that's what I thought but I couldn't figure out how to actually talk to the 
device.  Hopefully it's just an issue on my end.

