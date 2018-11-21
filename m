Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPXMP-0006hF-AL
	for mharc-qemu-riscv@gnu.org; Wed, 21 Nov 2018 13:36:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37133)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <groeck7@gmail.com>) id 1gPXMJ-0006ay-CM
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 13:36:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <groeck7@gmail.com>) id 1gPXMI-000094-MU
	for qemu-riscv@nongnu.org; Wed, 21 Nov 2018 13:36:19 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:39384)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <groeck7@gmail.com>)
	id 1gPXMG-000053-Rf; Wed, 21 Nov 2018 13:36:16 -0500
Received: by mail-pl1-x641.google.com with SMTP id 101so403926pld.6;
	Wed, 21 Nov 2018 10:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=t3dn9zUnWt2t3MTwsAy6z8xhesfLsJpj2L4ow08vvUQ=;
	b=bXbr0sISHP81HfMiTrKFOI6tgYgkH6JqYLP8rkQpu4kkKfpmPOFmthULzZHv8KVc32
	UnWGnd4BUvZ/lj6Qd92FL1nXrLkZ4xEPrSAvvwKg73FEZX8dhhu71wyLVxV+P57WgV99
	y59b1ivTBojWaSm84JKqH1YdlYDohbDnOuN6Qa+nP0bY8Rz4Q4UhwoxR4hVulmz6EqBr
	tYhNfdj65p6FRvZOU9u5Kp67U6gp7tu5SLMK56ZDKNwepfY8mKazWyWQ+xoC/9w+CjTC
	cgbG2tsUe2bou2fPS2WnNWP0110fqwVeT4vUJQnBiFgpbz9/HjTczsXmhgKTUo3ZmNkD
	K/ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=t3dn9zUnWt2t3MTwsAy6z8xhesfLsJpj2L4ow08vvUQ=;
	b=l+nYoSkZwLvkd6mXzveQd5cdwB7bqReMQjtD0DfrffkkIlS3CtZzTQ1VaATTMZMXBQ
	xS9cZpHybWh8iKGNw62xa1iQuwTQkjplluqJ7KTOulN93v2+DexxYx0sz8gV6jxKBCew
	5XMVn6kyiFMbG7RKQIch1EpDePWlqYYJLZpFCn+rrKRx21I/QzgbOSZywRi8GVfXAcCw
	Fk5F5akf0X8DAgH0hrr+55xhs0C9EuGrDs1fpjzLbGgFkjYrxBl9Yuud27mJ4tLBKoeO
	qvwjO1asAa4HVACYq6zQYP6BVRrUmS/aFtbhj7Fiktdah6j9iYMKUfO3p4nXj2ChCr6B
	HIag==
X-Gm-Message-State: AGRZ1gJ9XNCEIyF1nnXpulWQHdxkwUPY/SxF7ywj9P1VWYr9pCzlOOrk
	sHUVNzhoH3/f84fPDLVBHc0=
X-Google-Smtp-Source: AJdET5fRf2+988eHeOdi4O156JkooBuBaP32dlEve0bhztabq+wG+iPYs/az2TB4JwngFvNZOEdCSw==
X-Received: by 2002:a62:5444:: with SMTP id i65mr8204556pfb.193.1542825375726; 
	Wed, 21 Nov 2018 10:36:15 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
	by smtp.gmail.com with ESMTPSA id
	18sm45891059pgl.50.2018.11.21.10.36.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Nov 2018 10:36:15 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 21 Nov 2018 10:36:13 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Logan Gunthorpe <logang@deltatee.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
	"alistair23@gmail.com" <alistair23@gmail.com>,
	"abologna@redhat.com" <abologna@redhat.com>
Message-ID: <20181121183613.GA4874@roeck-us.net>
References: <cover.1542819633.git.alistair.francis@wdc.com>
	<85a3fe487514f4cb659ef7e6b88762ebc567c1b8.1542819633.git.alistair.francis@wdc.com>
	<e7398997-ba1a-9182-6be0-da8e43e920df@deltatee.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e7398997-ba1a-9182-6be0-da8e43e920df@deltatee.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::641
Subject: Re: [Qemu-riscv] [PATCH for-3.2 v7 5/6] hw/riscv/sifive_u: Connect
 the Xilinx PCIe
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
X-List-Received-Date: Wed, 21 Nov 2018 18:36:22 -0000

Hi Logan,

On Wed, Nov 21, 2018 at 11:05:21AM -0700, Logan Gunthorpe wrote:
> 
> 
> On 2018-11-21 10:02 a.m., Alistair Francis wrote:
> > Connect the Xilinx PCIe device based on the information in the device
> > tree stored in the ROM of the HiFish Unleashed board.
> 
> I only briefly tested this patch but could not get any PCI devices to
> come up with the sifive_u machine. Depending on the kernel I tried, it
> either failed to initialize a Xilinx PCIe (likely due to a mismatch with
> the DT) or it appears to successfully initialize a Microsemi device but
> did not enumerate any devices underneath.

What kernel configuration, devicetree, and qemu command line do you use
for the sifive_u machine ?

Thanks,
Guenter

> 
> In any case, it would be nice if the Microsemi/Xilinx confusion was at
> least explained in the commit message.
> 
> Thanks,
> 
> Logan

