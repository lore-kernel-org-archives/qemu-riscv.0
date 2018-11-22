Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPeUl-00077P-K9
	for mharc-qemu-riscv@gnu.org; Wed, 21 Nov 2018 21:13:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45928)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gPeUi-00075n-Or
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 21:13:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gPeUf-0007jp-G8
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 21:13:28 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:33840)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gPeUb-0007Zq-Nx
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 21:13:23 -0500
Received: by mail-pl1-x641.google.com with SMTP id f12-v6so8106114plo.1
	for <qemu-riscv@nongnu.org>; Wed, 21 Nov 2018 18:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=EQG08HHraNpFI+JjLTX+tHUuDQ5VW6JORoeii3mIbk8=;
	b=S/RozmhCYPpMbtMUr3mDHFEp1XRNbsdrJ/ginMm+MHpWOtvBOn+lWOdjbY2uMACkTZ
	P1vfsGCn1PBSwk3+MjK1HQpBrs0uMy4SVUL2NPuKvNsjjSA6bXcxtnC0L/pWWLmlNi59
	EltKb1VsYlGBlhuOGst+6eKpWLcsqdmcjwPIp7UNqR+pZPc1ckFcXJytomZcAJ8yzJH0
	qNuZCVM+HQwUQEjuvuKfiEUpGXgnz46KicbvFLFWyAknHymFhXzD7zICcAYKgpN+4/6T
	G6C7vGGt8CKzL+CbCXan4sBa8xcLwkLsVdUazWvE+eZcpdREex79QWnOqr0PAO6fnaGp
	DZmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=EQG08HHraNpFI+JjLTX+tHUuDQ5VW6JORoeii3mIbk8=;
	b=fOTj90BYbeXZRrmUSSnzISIjpzsBylueAlOhM/4dQwM3IJv4VQzAstqxZTeI0+2N7L
	bOhJ2BaVYGh6S2JRUbXm1snrZwo82c/bQ8QL92Za2ys9hP41gNLHTX11k1PBlvXpuPw8
	KjQlMHLxj2am4eFW5dk+h+QThiPEgcN5z79uWeR/kulpsL89denCulka9DXnFAGhUn3a
	37wc8stPsr/+Nb7LUchYs8nTl2uZsCEBnl/GvZTbJRp0548uP+HfNPjesm93t1RyI2AK
	1WCWZejAlfbSPxbaesqVCJySb6akejqo1ATE6TdJEUFnHGB/H2l6ojBqNu2uGsntZAn8
	sJqw==
X-Gm-Message-State: AA+aEWYy68qi/wKKFe1+TiEXjsNPfGDBplQHFVbK0y5KKbyCUoRrH/kg
	sWLpLcMod37CrP/Iw8aQLHesDQ==
X-Google-Smtp-Source: AFSGD/X7gKr7ElU9VLHhBOMsr2Qboq1vOhHpUgNm0rpV8/oDY0mf0/tKKkl6LQLAnEF9a7dHi9IP0g==
X-Received: by 2002:a17:902:8306:: with SMTP id
	bd6mr9318504plb.217.1542852797739; 
	Wed, 21 Nov 2018 18:13:17 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	n186sm15458610pfn.137.2018.11.21.18.13.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Nov 2018 18:13:17 -0800 (PST)
Date: Wed, 21 Nov 2018 18:13:17 -0800 (PST)
X-Google-Original-Date: Wed, 21 Nov 2018 17:59:34 PST (-0800)
In-Reply-To: <9ee74477-105f-db2e-b69c-e67d485b9c2f@deltatee.com>
CC: linux@roeck-us.net, alistair23@gmail.com, qemu-riscv@nongnu.org,
	Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
	abologna@redhat.com
From: Palmer Dabbelt <palmer@sifive.com>
To: logang@deltatee.com
Message-ID: <mhng-105c249c-fc1f-4d85-bf75-5aeb17d95854@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::641
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH for-3.2 v7 5/6]
 hw/riscv/sifive_u: Connect the Xilinx PCIe
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
X-List-Received-Date: Thu, 22 Nov 2018 02:13:29 -0000

On Wed, 21 Nov 2018 15:26:01 PST (-0800), logang@deltatee.com wrote:
>
>
> On 2018-11-21 4:10 p.m., Guenter Roeck wrote:
>> FWIW, I absoutely agree. If the board can only be used to boot an initrd,
>> it is quite pointless to have it around. Actually it is worse than pointless,
>> since it will result in people wasting their time trying to get it to work.
>
> As someone who has wasted their time on it, I second this sentiment.

So it sounds like I should target that deprecation patch set for 3.1?  Who 
wants to review it?

