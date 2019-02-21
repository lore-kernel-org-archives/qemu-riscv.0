Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gws4p-0006Gj-0B
	for mharc-qemu-riscv@gnu.org; Thu, 21 Feb 2019 12:24:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60939)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gws4m-0006EJ-Nt
	for qemu-riscv@nongnu.org; Thu, 21 Feb 2019 12:24:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gws4m-0003EI-2O
	for qemu-riscv@nongnu.org; Thu, 21 Feb 2019 12:24:00 -0500
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:36286)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gws4l-0003DF-TC
	for qemu-riscv@nongnu.org; Thu, 21 Feb 2019 12:24:00 -0500
Received: by mail-pg1-x544.google.com with SMTP id r124so14021487pgr.3
	for <qemu-riscv@nongnu.org>; Thu, 21 Feb 2019 09:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=yfBlUT+xfXKy45pb4y8MaGrQLopOigCzS47mL+JM0nk=;
	b=Z2wgA95zGTFGOdmmy/5+tWr7T1hwN19rpnIHJn7JqD25uPfOcDiwFkHynHaN5F+mmr
	hVJ50tx+EhluOvDBOnt+cU4JLQiUiPNRdZRVsSOZKI9B0MXnJ5hKgqElPm6J0Z+IFrBS
	rr2HCJ5rP49jKDgJohoMFPtAop6cseNYffeB2UVOJi9/MsfMnivMq3XdRyGJqzDkT3dv
	nZHMpBAnyROdoOkiGKqeNdLYfLRRTBJEnALtmBQ+GLxsuO94vQGdv6hM5MYaAoZ0Z3be
	KJydXiEJ0fXdl11XicbFyjaDtVMRFvSqFrZSKKKkNSdRnmsonvwnMrMYrFaA8iFx+Ihc
	Q3Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=yfBlUT+xfXKy45pb4y8MaGrQLopOigCzS47mL+JM0nk=;
	b=PWpL3hDzcruYFBpekMxWz0vysnlzSFgA5lVTaf3li7p9MRKeVo2imUuk4T+H06zlVt
	57f7M8AaBNNzXaG0mekZiryv9EZQvsqopZCpg9IbQsBGdgr6V3LtjoJJU95s6gRGduWM
	aG9Y/XTTsqwz8Qxk9e4IWsVlIpKkIZudZiJ2sallwbEPkqPIcHVy8rCnai0JmvuLjUyq
	bB7k4nFUIT5WUPOTGCyPddK3eVrPHZ0vzLpFC6zNqQKlNcdBgbeH6hvonJKxpCJf6EBQ
	sFD9dOnAykg/VVS1pPMuebiPM3Af5zL9slg7dQF2ju9/1/0zgftefU9aeVdSvBSqHXvu
	gozw==
X-Gm-Message-State: AHQUAuYS0AYMr+ElzE6KGK9x8+38Ejdp+XDQSAOlCII7MHc+CTjkadRm
	VBpZGabstT0DWbmAFyFw2g9jJa7UEXM=
X-Google-Smtp-Source: AHgI3IZp5ewfyl/jaJRpym5m60EGeS/Lo3A5czFxHocZqfSqIGlQ0FMK0uvCxo8CBokimQrJhHWcuA==
X-Received: by 2002:a62:57dd:: with SMTP id i90mr41523480pfj.154.1550769836636;
	Thu, 21 Feb 2019 09:23:56 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	g3sm44695538pfe.37.2019.02.21.09.23.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Feb 2019 09:23:55 -0800 (PST)
Date: Thu, 21 Feb 2019 09:23:55 -0800 (PST)
X-Google-Original-Date: Wed, 20 Feb 2019 17:55:13 PST (-0800)
In-Reply-To: <7cf246c6-1bb7-6479-7448-750a9f9801e0@mail.uni-paderborn.de>
CC: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Message-ID: <mhng-70a0b021-43a4-4faa-9692-bdda93805b30@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v7 00/35] target/riscv:
 Convert to decodetree
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
X-List-Received-Date: Thu, 21 Feb 2019 17:24:01 -0000

On Wed, 20 Feb 2019 09:02:57 PST (-0800), Bastian Koppelmann wrote:
> Hi Palmer,
>
> On 2/13/19 4:53 PM, Palmer Dabbelt wrote:
>> Palmer: I caused some merge conflicts in Bastian's patch set so I
>> figured I'd attempt to clean these up.  As far as I'm concerned v6 was
>> good to go, but since the merge conflicts were fairly extensive (if
>> somewhat mechanical) I'd like to pass the baton back to Bastian here for
>> at least a sanity check.
>
>
> Thanks for doing the merge. I will have time on Friday to integrate my
> nitpicks and send a v8. Then it should be good to be merged.

Great, thanks!  I haven't gotten a chance to look, but I want to get this in 
before anything else so we don't end up with a bunch of conflicts again :)

