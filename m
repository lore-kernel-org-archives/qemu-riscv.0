Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gu17W-0001x6-Kg
	for mharc-qemu-riscv@gnu.org; Wed, 13 Feb 2019 15:27:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38179)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gu17T-0001jG-I2
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 15:27:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gu0vr-0008HL-5H
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 15:15:00 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:38683)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gu0vq-0008Fu-NO
	for qemu-riscv@nongnu.org; Wed, 13 Feb 2019 15:14:59 -0500
Received: by mail-pg1-x531.google.com with SMTP id g189so1688958pgc.5
	for <qemu-riscv@nongnu.org>; Wed, 13 Feb 2019 12:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=J2IVWlAbAT3icMZggNW4EqHl2kLhpjOxMlqfBaFNbDE=;
	b=BsxzPZCU22u3BBZIdFl1SKc5DVmNv3eOMW9qJ/WEFvEeml4JWYppcX9F87YnUboYQO
	r29Sx1789tcFgm1BJ67VZF8ZaQeHKsO77sF394VRJDqO1AeHKw37tsGAZRBhmgzKPcr2
	+4g+DbeJqfAEt59iPI/6dZf56jObEq23eCQzc5Ilc0UTp3G9ChhRFBOefmKXMBUQjQSB
	dR9Q2r3pyn6MG95Am+7Aj1HOWs/nTXa14Fb5AlYugHut50kGJQly5CvEnAw62jGT5I5l
	pQZ+oHqJfF9kELURgKoyeuYiiPj9OKwLRNFB9wgAGwca55aoH6F5p7XFh+pyaO/OyRIH
	QMYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=J2IVWlAbAT3icMZggNW4EqHl2kLhpjOxMlqfBaFNbDE=;
	b=b+Awh/El5iZ765QVoIhEE8E575jj+mSZvRc9n5NO2607HwZjjfayv/1ysAvBDES7Ss
	xDLX8ZCshyAHVQ/3pTD60nMB2g7qy75rMXzSeuKk019PyISJhsGsIwnL4z8BA2E7wFk7
	ciGR7tECtD90a2ql6TaIFXj4mk5AjIuJG5rXNL0hbuQ/MG9+tn4F4kByD50YA2kWcU+y
	27SJ38e1lXpBlSUHMS4TcmYrka4ugp1NBBXBzjH7CKOEv0NKikVvvsIfE57mPSX8gTvO
	XQBAuUysNSrpNw7G/1hqRHNIVwzqIVtbLgYnKibzdTkUuO0rfHOW+bqhLGp+HSmRGHuX
	TtMg==
X-Gm-Message-State: AHQUAuaLiUkIdD/dvhclL9Ok4tbDg+09R4cLO+Bcwf8Af3nt+yeLb5pb
	TCWm0DmSUF+E1zlH68HOWlsekg==
X-Google-Smtp-Source: AHgI3IYOXc4Ssd2QUh0lcf2fu64ZQm+ybX/ylH3xYGCCCMH+7eWrzEuXTKtjHZ7buFN6St0NdIdpFQ==
X-Received: by 2002:aa7:8286:: with SMTP id s6mr2164423pfm.63.1550088897144;
	Wed, 13 Feb 2019 12:14:57 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	g128sm175726pfb.121.2019.02.13.12.14.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Feb 2019 12:14:56 -0800 (PST)
Date: Wed, 13 Feb 2019 12:14:56 -0800 (PST)
X-Google-Original-Date: Wed, 13 Feb 2019 12:13:38 PST (-0800)
In-Reply-To: <49bd9805-2f40-7d5d-8814-e0a59a9c5be1@redhat.com>
CC: Peter Maydell <peter.maydell@linaro.org>, alistair23@gmail.com,
	qemu-riscv@nongnu.org, sagark@eecs.berkeley.edu,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
	qemu-devel@nongnu.org, chouteau@adacore.com, mjc@sifive.com,
	Alistair Francis <Alistair.Francis@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: thuth@redhat.com
Message-ID: <mhng-88540c09-3b63-4408-b3e8-4e16c9cded81@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::531
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] SiFive RISC-V GPIO Device
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
X-List-Received-Date: Wed, 13 Feb 2019 20:27:00 -0000

On Wed, 13 Feb 2019 10:54:08 PST (-0800), thuth@redhat.com wrote:
> On 2019-02-13 18:14, Peter Maydell wrote:
>> On Wed, 13 Feb 2019 at 00:13, Alistair Francis <alistair23@gmail.com> wrote:
>>> I know the other RISC-V files don't do it, but this should go in the
>>> hw/gpio directory instead of hw/riscv.
>>
>> It might be nice to move those existing riscv devices into
>> their proper places at some point: should be a fairly easy
>> cleanup patch if somebody wants to take it on. (Advice
>> on what should live where available on request.)
>
> If devices only work on riscv, they should IMHO stay in hw/riscv/. I
> think hw/gpio/ and friends should primarily be used if a device is
> shared between architectures. If they stay in hw/riscv/ it is way easier
> to match the devices with wildcards in the MAINTAINERS file. Just my
> 0.02 € only, of course.

FWIW, I generally consider things like SiFive's GPIO controller to have nothing 
to do with RISC-V and therefor don't belong in hw/riscv.  That said, I don't 
really care that much so I'm happy with pretty much any source code 
organization that works for everyone else.  Let me know if we should move them 
around.

