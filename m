Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gRnoQ-0006Wk-G0
	for mharc-qemu-riscv@gnu.org; Tue, 27 Nov 2018 19:34:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44961)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gRnoM-0006V9-Go
	for qemu-riscv@nongnu.org; Tue, 27 Nov 2018 19:34:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gRnoJ-0001Pa-9p
	for qemu-riscv@nongnu.org; Tue, 27 Nov 2018 19:34:38 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:45894)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gRnoJ-0001Nl-2o
	for qemu-riscv@nongnu.org; Tue, 27 Nov 2018 19:34:35 -0500
Received: by mail-pl1-x635.google.com with SMTP id a14so16432922plm.12
	for <qemu-riscv@nongnu.org>; Tue, 27 Nov 2018 16:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=ql2mZnx2Cgav5uQfaW3UgaSw1xf3+wth2yUrq0KYJ+o=;
	b=G7lenUk3pjDMa9YQAgs3twvqO+YKZ8iciGyzLksLq46UGDMp38WKfjhHGsZYrDhjQK
	OOb3elj3wQx6vkGtc+GduT4b2MtMJOvAAB3RU98mTU4/bS+0sF7H3JX3QJ6Cqq96BW4b
	IxZt3S+O/PSSLFFRllL0nHVvo3I1x7OVh/+6pRwHGgJ5Of7A7fAOpX4By/puXjd2Gng1
	xBnq4wNqSkddLOQQV+KVLM/XJGpdWPI21jsWp2UyawLHH1YvKBUld+PtWx4nz6/1sS9H
	t4IW85PvZDh2+PfECJhSi0DS2MK5o+Ru2Ptp82c8o9++A7agimul7FX0Hy9EoadzgJmm
	Qqnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=ql2mZnx2Cgav5uQfaW3UgaSw1xf3+wth2yUrq0KYJ+o=;
	b=nazcTbJn4/XGrx6+GbfS6vo6acuFSuDr9+17U6RlQOicBft4VAzK8QW/bC6eLGKUOV
	2+cLUZr9mITGH+w8fkNreYkJUKMaR91kCMBolyhm+CGQgvXGJUoX2B6HyRhupSX5PvcW
	7k9fd8LUCRjDVG1VnXXj2IK5VcGTgLdEGRB9znG7gRKc/7PZSHCzPXrafFIFLbRBdGM3
	vZj5yE1F/UM/S6p7uORE1YGcKm+f2vabvmHxzu2Nar15Q57gOem/Uy5HDS0ldhhQ7Upq
	RQ7+rvzH6x3oM0UkpN+GeBjrfbCwZcMSMc52KiCdOw+LgSIKoWyatBNSzMJ+bcOq9fUb
	3/nA==
X-Gm-Message-State: AA+aEWagCxEJkslyyO0leOXTqFIZgaPrXUHCFkmFU5nilHGNaGc0N8ih
	/ZiA4yiVhZChxBw3h/pnNJGubQ==
X-Google-Smtp-Source: AFSGD/V7TOtP+su+bPJfYMvUmCmRuHxIjFMq6HSWP1DuYr8rumRjlsAbF20fNr6JH9E1pblBYiyldA==
X-Received: by 2002:a17:902:b701:: with SMTP id
	d1-v6mr33013591pls.29.1543365272855; 
	Tue, 27 Nov 2018 16:34:32 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	w11sm4970975pgk.16.2018.11.27.16.34.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Nov 2018 16:34:32 -0800 (PST)
Date: Tue, 27 Nov 2018 16:34:32 -0800 (PST)
X-Google-Original-Date: Tue, 27 Nov 2018 16:31:55 PST (-0800)
In-Reply-To: <d17b7767-a72f-a84a-a65d-d848db42d030@mail.uni-paderborn.de>
CC: maozhongyi@cmss.chinamobile.com, qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org, 
	sagark@eecs.berkeley.edu, Michael Clark <mjc@sifive.com>,
	Alistair Francis <Alistair.Francis@wdc.com>, philmd@redhat.com
From: Palmer Dabbelt <palmer@sifive.com>
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Message-ID: <mhng-22cf4e89-cf9f-4a1d-b254-72b66e51dd82@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::635
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] riscv/cpu: use
 device_class_set_parent_realize
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
X-List-Received-Date: Wed, 28 Nov 2018 00:34:40 -0000

On Mon, 26 Nov 2018 01:06:33 PST (-0800), Bastian Koppelmann wrote:
> On 11/26/18 4:20 AM, Mao Zhongyi wrote:
>> Signed-off-by: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
>> ---
>>   target/riscv/cpu.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>
> Reviewed-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

Shouldn't we also use device_class_set_parent_reset right below this?  Either
way, I'll queue this one for 3.2.

Thanks!

