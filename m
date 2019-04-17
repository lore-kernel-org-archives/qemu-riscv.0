Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hGc99-0002aY-Ar
	for mharc-qemu-riscv@gnu.org; Wed, 17 Apr 2019 00:26:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41219)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hGc98-0002aM-2x
	for qemu-riscv@nongnu.org; Wed, 17 Apr 2019 00:26:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hGc97-0006AZ-86
	for qemu-riscv@nongnu.org; Wed, 17 Apr 2019 00:26:06 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:35864)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hGc96-0006A3-RT
	for qemu-riscv@nongnu.org; Wed, 17 Apr 2019 00:26:05 -0400
Received: by mail-pf1-x444.google.com with SMTP id z5so11464348pfn.3
	for <qemu-riscv@nongnu.org>; Tue, 16 Apr 2019 21:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=RRmc9xWrUB3PHBTUmBJfUISXHq5Yo4ATCQ85Q8nNBzY=;
	b=JtNf5I/OWQbRVUpZbdw2mcBWYNvUKXk36qHKRWxI21YnbJTfTUNqZ9W8lC1q3Y3Jer
	Pb/Ig27OMbJSZtAI8evAoIcK7Y8IBWAcDTUo3c3Bl8k3X7rZnSGMxeicrTS2KZBMr8xl
	0jxIM7WAZBF7/yL5D+mJ24hjVwcFNhcL3D2Qc98KUl8zKO1M0R5vy7GCnsgnbGHbJagJ
	NdzPwoXSxfO6Fn4YmLH6vM3A6wLPuVpe1Va7m/Dc36g7RSuArI6TtNOesfyRDWlXnk/z
	bKNYpAP2gi+RYO33fYao+QlLP70QbOSdxb3QHqBm2XkpsjPKoeH11vD+JFunVI1Z34hU
	x48g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=RRmc9xWrUB3PHBTUmBJfUISXHq5Yo4ATCQ85Q8nNBzY=;
	b=NMdh5BftoL3ozX6ljtlKDLnsT6tuSk0yx97ixHJtwcR1S6fnJFwjT3Ret5kRbTsdif
	ZX1fDg2wjKZCpfNffX1yQYKlWUNc4Kxm48xHsy1x2TziA8eIqXRNhocXpFTLsgGUjHYc
	3My9+ZlH/ONvzux7VA8BBXQgI2ALFveUnAFARSeveNZtGs59DiS9R61xiqzryKfQGx9y
	FoMir2c2u/argM1vtWSRYwsNQaWKWHLZ0Gis03Mnn+y/XLQgkPSdwmKaLASDRv39fA5U
	KIoPweS2MzYMAlIgZ7d7e2EzpetlVD7tXueD2YAnxVdTR8AbLJ7kfOl51SWyTuzt+v28
	skqg==
X-Gm-Message-State: APjAAAW5BIqOqhy9RztZ58LhYooD5DrtivaiR/10WipfyGiCEHL3fCZT
	ZrYAsXMNgnX9WA0gXyqGA5RXDA==
X-Google-Smtp-Source: APXvYqxhEltAUwWq20yVgYHDnOBCb2gHa6Tn9JnGnrnVjSIUKhmdkVuM7LAkt5RogmoQb3lqCb5XcQ==
X-Received: by 2002:a63:1a1b:: with SMTP id a27mr79440360pga.59.1555475163231; 
	Tue, 16 Apr 2019 21:26:03 -0700 (PDT)
Received: from [172.20.101.138] (rrcs-66-91-136-155.west.biz.rr.com.
	[66.91.136.155]) by smtp.gmail.com with ESMTPSA id
	p2sm162538842pfi.73.2019.04.16.21.26.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Apr 2019 21:26:02 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, palmer@sifive.com, Alistair.Francis@wdc.com,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20190401031155.21293-1-richard.henderson@linaro.org>
	<20190401031155.21293-4-richard.henderson@linaro.org>
	<c6b66db9-24d5-b55b-8b45-e73f3d7c3fba@mail.uni-paderborn.de>
	<50effb1c-3bbe-126b-9bfb-0b65eacc9c36@linaro.org>
	<abdf9c63-8f27-8cb2-dc94-22318c3836ae@linaro.org>
	<6f30be40-014e-d825-aadc-a689dad120c3@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <9f53ba7f-201e-be9f-c1a1-eae23bee8a75@linaro.org>
Date: Tue, 16 Apr 2019 18:25:57 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <6f30be40-014e-d825-aadc-a689dad120c3@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH for-4.1 3/8] target/riscv:
 Merge argument sets for insn32 and insn16
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
X-List-Received-Date: Wed, 17 Apr 2019 04:26:07 -0000

On 4/16/19 9:43 AM, Thomas Huth wrote:
> I wonder whether we should maybe always add "-Wno-typedef-redefinition"
> in the configure script when we detect clang. All the versions of GCC
> that we currently support seem to ignore typedef redefinitions anyway...?
> (I think I've seen that warning with GCC in the past, too, see e.g.
> commit eeb61d4f8270a6849d9a584fc83da3869b79066d, but that does not seem
> to be the case anymore with GCC >= 4.8)

That would work for me too.  Anything to minimize Werror divergence between the
two compilers makes less work.


r~

