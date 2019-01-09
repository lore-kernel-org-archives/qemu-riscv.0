Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ghJfk-000440-Ga
	for mharc-qemu-riscv@gnu.org; Wed, 09 Jan 2019 14:37:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38748)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1ghJfi-00042h-Tb
	for qemu-riscv@nongnu.org; Wed, 09 Jan 2019 14:37:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1ghJfi-0000xJ-8H
	for qemu-riscv@nongnu.org; Wed, 09 Jan 2019 14:37:50 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:42794)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1ghJfg-0000Vm-4q
	for qemu-riscv@nongnu.org; Wed, 09 Jan 2019 14:37:48 -0500
Received: by mail-pl1-x631.google.com with SMTP id y1so4027475plp.9
	for <qemu-riscv@nongnu.org>; Wed, 09 Jan 2019 11:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=KPajVhqFcb3kkI659CoqMKjdGu/WcRlbAaIyhF+T1ig=;
	b=Aou2Pup0w7l6h9WciybqoBhgD6pPtsEIQ5plQWEpcJUBDxngpBKMmfxJaWKdOx97zP
	FLKVQmv65VA4KQ/ypre9HF6q+ZyNNIHV0ObIzYtdJl8Jmo5/YOHfVexqy1qlxS3Fbn6w
	c4YGR5xUTDgoFjzHSIMyWLbHlAbiubkRoH1Mrhqc45/wgZemeiWMeGoQEg4/mDR22ryl
	lgSQCJHXEhI94YmWa20+YcFokCFXC9aQvwv7t9F7i6z5jvFQaszbDLyKzw7XiMu1shQ0
	Nka4YIZ+d5F9dM1IRtLMgpwgl0Bcc9D9F7CO6EmDmv/LmNCDDk4FQ5/uWkY+XiRQjL0T
	Vpdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=KPajVhqFcb3kkI659CoqMKjdGu/WcRlbAaIyhF+T1ig=;
	b=p0RFg7xg45TDNfhYpJAgyFAMhH/krEt3pqF7mzvrwN8gDLRsk/E3xZu3gWKO6i0FRy
	VmhNIiBQCUPSGtRCffLOQhir5YbRc9t0KX7g3sKArGuONsP/BLbjJAxwjZFNCkWWxZyY
	33coEJvtIMlBt7TVzL6oLkrPLgF+Kc4irSTVYQf6q4dCaCdLSbdMqXBvjTAVrDo7QdQd
	8ZQW2hA3jz42eRra89mK/CgMYpo2HEzwpLgxVxO5PE1v+9BbmE1ry8KmYxS8t8Y3QC8i
	PssRURC+vKsrboMwIFU+5MUILqsP2EJKDinhrTEv754sgh/JF38UO9Sfc4oHPi3LA71m
	89tQ==
X-Gm-Message-State: AJcUukeOpDop/R9kb9WimTEDUNuLTwBjeRgSSI0aoXTG09ufH/v4h642
	fqmVcBLkxjst+5AfnxcbZDAeIQ==
X-Google-Smtp-Source: ALg8bN61jw1PTIkREWp9GO9fZ7mZP3pPD5q8OnGwTjIncWxfNCqp5m/qBPNa4+iI6QkbHdHoDNVYvg==
X-Received: by 2002:a17:902:bc81:: with SMTP id
	bb1mr7137824plb.223.1547062647675; 
	Wed, 09 Jan 2019 11:37:27 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	b9sm103941466pfi.118.2019.01.09.11.37.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 Jan 2019 11:37:26 -0800 (PST)
Date: Wed, 09 Jan 2019 11:37:26 -0800 (PST)
X-Google-Original-Date: Wed, 09 Jan 2019 11:33:27 PST (-0800)
In-Reply-To: <CAMo8BfL96J7cT_R36qTHuwk+SvqWSEyZ5+oW05g=Bahc-QxFWw@mail.gmail.com>
CC: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: jcmvbkbc@gmail.com
Message-ID: <mhng-26258e3f-d92f-4438-ba66-8364a52595f7@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::631
Subject: Re: [Qemu-riscv] [Qemu-devel] Wiki Account Creation [Was Re: [PULL]
 RISC-V Changes for 3.2, Part 1]
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
X-List-Received-Date: Wed, 09 Jan 2019 19:37:51 -0000

On Tue, 08 Jan 2019 12:35:17 PST (-0800), jcmvbkbc@gmail.com wrote:
> Hi Palmer,
>
> On Tue, Jan 8, 2019 at 11:37 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>> It looks like I don't have an account and I'm supposed to ask on qemu-devel for
>> one.
>
> I've created an account for you. Will send details in private e-mail.

Thanks!

